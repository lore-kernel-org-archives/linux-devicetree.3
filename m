Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632600;
	b=LPzAAakaWpqKQU7G6EYCliPKE2o8Z0WKF4sdUMgrSSs+GAgXCS6NFTI3MeqPxE42YSQo
	 1VFiCPmCM05zgBcSMo6mXA6PBH4+TTcWq8gX1bhN8AubpkRabsXcZa1sXrqOXUtQuKxzd
	 CDyR/ML54oWrHTz4DboPwvFnC3Z0UE44ILTs1biHTat0EzGomLwNgZfoZWzpcbqVFpWd2
	 pNgMLc2TrfwEYPdJkCeYQ1WOTvCFDxKuE15N93sMfP338mPHgLjcxbBNaXswZ3b2ktMNI
	 xghK4Nf8/U7TUhM+NHbgmRayYnOFpcdtY2NtPKja1nxER2ie+12typgsYHzOB9epOqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jFupvv06LsXCAl0vGBUfBexOAZyEYwTtWknj0ciKxIk=;
	b=wUhnfY8tvLUWYR5UGnNH5N2bTsarPWHb3xhE4Np5DE+7Zlkx8+h/3XjKZ3a4ZuREX8Yp
	 00ebDuw4WcxrRBghx00C4yPZiPUNgPYfBIlxWhwkCiU/0bPHuPR/Ukyj6Em1lADiABXFm
	 N8YCYqUeEa1TfWFWe4ThOJEpIvdLiMRiNQOrzw+K9WQiX+APPkkZSogWlKegMSo17/Tb4
	 uoGqh8gbUaPfURYe3BOu1j1mFjprPg3gIogDPJD6fP35BEs25tkaew4YMzV+iBLFgOF+2
	 YpG/UHSeWcePRPcDocs1LNCjEA76755JBlsQfE/6YcVBdoo5qQJCOHSSE1/+QG9MMBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PdvPemKw;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60494606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60494606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PdvPemKw
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3864760f8f.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795632598; x=1796237398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFupvv06LsXCAl0vGBUfBexOAZyEYwTtWknj0ciKxIk=;
        b=PdvPemKwVto01SZ+tm7zotUP4fvFTPNg7Ws6EaMlPmBd0Db2HSC3Dmj9UppBpaaUKo
         pFWHbBtbiECzNwsVOzrhMIMAqY5XnABvQjLc88+eXiHu+9DtYdQdvk5NTqJLwRCbtwhb
         9CNTbsCeqQ3+wN1pEqxynB6E6qxkdazrMMkCI7XxNLdDI4CX234R1AmZaQjCbneEnnD8
         /FwlXspWWMA8fxZCFfeaiuVdCjuEt80qMHAeYBoBnk/9cpeIc68WmsJY5qmniCed5y2X
         eIOy36OI6bowksUmZu6oRwkqKgbuRoIzwhRc8vHQCeJ4XTcl4dpC9M+bL+DVuhVVrpBN
         UVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795632598; x=1796237398;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFupvv06LsXCAl0vGBUfBexOAZyEYwTtWknj0ciKxIk=;
        b=ePq3H4JF66GT2UXztMGhecOZNRSocWbaSIW9Ykrr+hPaw3HFXkGERgEQ7ZQp6ngDLs
         8aM3RKvd53UzuLPTTO+pKoMe+emWtQVY3VuATwP6M4a+4FcQbAAmjqkDiqsFMjV6+QK3
         rcu/n5N4A6KHAcCHOnkNBaDk3N0QbDjwBt2LZQdVHARej2xgVDAKJpFnxpW5ZZZ+usaG
         MtgbqZQ3voCszIYVI53vONrHNV/lVR6beacHlxWlwseoycO2aVoKOre1fUOvX1tke2Os
         9aYEPLhuTQWU5IQHHEhTfNF7MrbCE0PLJXTSho5oZilfJt99TjHIfhg6JXDY2E9XSvUX
         zIRA==
X-Gm-Message-State: APuU4Z/QAx7JXpyj3GGj55N/qz6Boh6B3x+1jPM0Ci2w5D6Nmi9KFGpo
	mnI9szGZD8DXrpf3XKJhopcV3fpOGjors+VT5wwzVIi4uRYZGHaDLSzwBzFqb51MzqA=
X-Gm-Gg: AZFdTZcbufCxFaBBPJnOjdX1w5zgLgFVrSx3ri2Pbv0IXghsZaEIku2LKzdd8/LraTo
	aAFF1SPlJo1znNKWEufY5zLuQ5kCY6psXgRG16F1vHMef5wXmdF0AeCPOMlLIAJFqsRwaj1a3Bz
	oXFSVv/FWC5shc37NYsqaP4w/mWgL3eMkfDYzwqPJ+8ArKOaAkcrtxkaqdMkA1+MaosfFf1IH/r
	arAcY+3KCCg4GfuYHbkl+0zuD/oFTEZfaPMPA5BjD2YEnMVUncEjRmkZ7yPVF9OVXcdgf+27pnK
	D+G9o1JiyUbNNkvD0YCf/GBXBkWTfMPU02p8VCvllc6sd1xH06nhitnuVVfoBy0AraEbM/9bxFa
	dm34Pbq+yntijqvRp5SEgXxuKRcuY+hL62+8mWzqmi4bq7e3GXVq1EbUpaplqs61sX/Ll85KQyL
	gn6TO+Ei8swd/CrMa63eMOGEL636Dp/JPvCpLmPuwpdajw+6hqSCe27Pqh7W+iLq760WkuYNft2
	vxXztzTaWV1IjHJ3leU1GJGif3LSMWAdCjwhMAe4pz+Gyujf77HYVXK2dQFn5MfHmwV3MhT5fqq
	TCwZIlXaztqow8jUnWMBmkIjgQnyJACItTS6zRFOePkojVklxjxJRaqavXP6swU71sHzhGQCyTQ
	MskZF6vE9qw==
X-Received: by 2002:a05:600c:3b1a:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb8881d4damr393393525e9.28.1795632597466;
        Wed, 25 Nov 2026 10:49:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:84b7:1ee8:d497:908f? ([2a01:e0a:106d:1080:84b7:1ee8:d497:908f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm555244145e9.3.2026.11.25.10.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 10:49:57 -0800 (PST)
Message-ID: <9dcb4721-a756-43b9-a8c6-34922dd4a115@linaro.org>
Date: Wed, 25 Nov 2026 19:49:56 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/panel: lg-sw43408: skip backlight updates when
 unprepared
To: david@ixit.cz, Abel Vesa <abelvesa@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20261125-fix-blueline-panel-v3-0-914b4a30b73e@ixit.cz>
 <20261125-fix-blueline-panel-v3-2-914b4a30b73e@ixit.cz>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
In-Reply-To: <20261125-fix-blueline-panel-v3-2-914b4a30b73e@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/25/26 14:08, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> sw43408_backlight_update_status() unconditionally sends a MIPI DSI DCS
> brightness command even when the panel is unprepared and the DSI host is
> powered down, causing sysfs brightness writes while blanked to fail with
> -EIO.
> 
> Pass struct sw43408_panel as the backlight device private data and return
> early when !ctx->base.prepared, matching other mainline MIPI DSI panel
> drivers.
> 
> Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-lg-sw43408.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index 92cab6478ea61..7f7d7b6b17f61 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -181,20 +181,23 @@ static const struct drm_display_mode lh546wf1_ed01_mode = {
>   static int sw43408_get_modes(struct drm_panel *panel,
>   			     struct drm_connector *connector)
>   {
>   	return drm_connector_helper_get_modes_fixed(connector, &lh546wf1_ed01_mode);
>   }
>   
>   static int sw43408_backlight_update_status(struct backlight_device *bl)
>   {
> -	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	struct sw43408_panel *ctx = bl_get_data(bl);
>   	u16 brightness = backlight_get_brightness(bl);
>   
> -	return mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
> +	if (!ctx->base.prepared)
> +		return 0;
> +
> +	return mipi_dsi_dcs_set_display_brightness_large(ctx->link, brightness);
>   }
>   
>   static const struct backlight_ops sw43408_backlight_ops = {
>   	.update_status = sw43408_backlight_update_status,
>   };
>   
>   static int sw43408_backlight_init(struct sw43408_panel *ctx)
>   {
> @@ -202,17 +205,17 @@ static int sw43408_backlight_init(struct sw43408_panel *ctx)
>   	const struct backlight_properties props = {
>   		.type = BACKLIGHT_PLATFORM,
>   		.brightness = 255,
>   		/* HBM can go up to 1023, stay safe for now */
>   		.max_brightness = 900,
>   	};
>   
>   	ctx->base.backlight = devm_backlight_device_register(dev, dev_name(dev), dev,
> -							     ctx->link,
> +							     ctx,
>   							     &sw43408_backlight_ops,
>   							     &props);
>   
>   	if (IS_ERR(ctx->base.backlight))
>   		return dev_err_probe(dev, PTR_ERR(ctx->base.backlight),
>   				     "Failed to create backlight\n");
>   
>   	return 0;
> 


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
