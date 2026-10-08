Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BD94657E0
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447855; cv=none; b=ZuM3VaQOMniPN+gSzGaOlbbd3+Wf3htcX0NpBS3ynurZCV8zvYAgYcXmIe7PYfNfdB18dVxgxpi+mknZfrlgRgutAHWfuLl5ZjU1MpcL2KB9xoGMbuNJf4fSarrHrQVrzP3TX5VfuLsKKys6OlXKz44Kd4KSRMUdypBQP9daGjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447855; c=relaxed/simple;
	bh=lcJ2Jx4jRzbxqtaMyX7nQoruuHUG1mlcWlaJ6b9elOg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Q5wapiT3OmpVM7Hxy84J9aMsuika8Hq6h4AhiL907Qg7MnJOVUwcLAOOsjOyAtpUO2lcghWV8ajOFrTNEs2LNmtxvUm0Cf4hJlDxe9gYKBdIHkgNxjy+HDsNGwXzrvwpZk6BhmqyvzcsqKW5ssGLirqEhpiEGyURtUMFYQvW6jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VXeMwpRi; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VXeMwpRi"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so23006165e9.2
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 01:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791447852; x=1792052652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBycP8p7SGKiJlPKrsQosdM3WVmZLo/n5T15mL/kfEI=;
        b=VXeMwpRiwtESGECJ718k83+ABw403G/m+fLxliTEn+ozumP9NI2PsDSlhxXQqB+uzY
         vIvA3JG+FmtnEE7eHYyjx1UUw/DN0e1LAIiWOs150eztZZnDPD3K8ntCird2pIDai1HU
         tfOsrOrlFy+DjQy7YyG2d+Q8+L3BkAHApbNpiFL4cMOeTNrSng2Fk7Yy7RpkgwXBrLBP
         tROESmi5/aro/o3pOTkRtjbHq/abc8Yj1wB60y8VO84C0pxSA6NhIiRLNlFq6KVE6DMe
         be4in5mwDriA1OSI3vzav4FbhYep9xP80r6gpidO52UUdZua65R+PscpCY3cNpFZQGfg
         zUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447852; x=1792052652;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mBycP8p7SGKiJlPKrsQosdM3WVmZLo/n5T15mL/kfEI=;
        b=c/sLKOpwyRw7LnHObVGjQqjMifZpacJ5yU/jDnW0s7OQytS/sSm1zs6bx6XTUaI8dC
         VtekDbzsjzE1YFYjeQ+7i+OM1USrXEzkC6jO8/OqFB4CJ7PrmzuY5leHOE/hvY4wHMlx
         6wAC0TikKNthP8XT34FSHQwZ2kUMae7CZMVSzd03b1azcdpl2Z3uY+6X3he2rc+PCRBI
         0MX8H3bir2PnjqFZilZ8hf3zFRlKsYGTkTm0glSVk+e9AmeaAa+VV/wSiX9YbPXbWfky
         q/xxQjPd+Rjx6U2ZhxfKFbfEIWTHiWJ4q6JiJ9vWYFvBhXhtdTv2StUXke+sY9xdKj/8
         i1UQ==
X-Forwarded-Encrypted: i=1; AKwUvByLDCzePcHMm1KOvwuAzKcNadPl6J62vS/yJUh82IKHkkYBKciO9D7hMRqJjUraDjQcjegedIP+g+3b@vger.kernel.org
X-Gm-Message-State: AFuF++neD9KbrclAHC1Kh3jVtbskYHElNlgxNmG7Fi4biR0ssPDfI42s
	aCMpJwT2O0cVogKFR3winTgL0SoiQ+4VYyq5KFHoezfHIQNaM5r4BLVKK8waGIMjIPg=
X-Gm-Gg: AYBFou2s2bCdWFKFv+ENCDLPij4M2h+HJzHB371NTB+tnepeLMvleFHrcdnpejV+NKj
	ztzkx2ACvkJcF5UqMZgWdc8UxHNhiU48iSyfgrcZOEmDK9kWe4okQtIRljiOJGNshAhM3NoiB61
	+HGlEPiWFBv1cs7OH4KM7o1oSOXjBNWYRihaHWrIwR1XrLrFyv1zhpPowgLGGfUVizXDi8I0SGm
	oWDbHlVaDkVrmDaXrbvEeNzCl/vBhh5WCuntqCLx36O0gge1hN60PGxnBPmfVkr+97YQaNfXCjo
	seLDAMFt833OkWIWv5bt2fq25HE3Gg7zBkTxak51FLWoYWt2FDckeNac4soTAEeAyQrN/agHNtx
	Yz9hXSLXkuyjifXH+zjddaCI/bq+rIdMj7PLZZbQ84zKddW1/i98bdTFXVQCjSclKvH1Kbcqfss
	fHhPwtbaasKC2F849Rg2Q17+nkfQT2AfPrq5tQn4YQ96T3P/Rz7MrNX/k6eAI5aC3TmAsMLBvGO
	/SDniGA8lihnRUEH6bWhShJ1nqrAe8=
X-Received: by 2002:a05:600c:8b18:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-4a180455775mr77142395e9.31.1791447850014;
        Thu, 08 Oct 2026 01:24:10 -0700 (PDT)
Received: from [192.168.151.76] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71b786d8sm9975943f8f.0.2026.10.08.01.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 01:24:09 -0700 (PDT)
Message-ID: <51fec579-a74a-4bfd-8b5d-2e7308405211@linaro.org>
Date: Thu, 8 Oct 2026 10:24:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/4] drm/panel: st7703: set prepare_prev_first
To: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, =?UTF-8?Q?Guido_G=C3=BCnther?=
 <agx@sigxcpu.org>
Cc: Ondrej Jirman <megi@xff.cz>, Purism Kernel Team <kernel@puri.sm>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
 Felix Boucher <felix.boucher@savoirfairelinux.com>,
 Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
References: <20261007201859.3709656-1-marc-olivier.champagne@savoirfairelinux.com>
 <20261007201859.3709656-2-marc-olivier.champagne@savoirfairelinux.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261007201859.3709656-2-marc-olivier.champagne@savoirfairelinux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/26 22:18, Marc-Olivier Champagne wrote:
> The DSI host must be enabled for the panel to be initialized in
> prepare(). Set the prepare_prev_first flag to guarantee this.
> 
> Suggested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7703.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index 70f7282471e6..368c57591817 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -973,6 +973,8 @@ static int st7703_probe(struct mipi_dsi_device *dsi)
>   	if (ret < 0)
>   		return dev_err_probe(&dsi->dev, ret, "Failed to get orientation\n");
>   
> +	ctx->panel.prepare_prev_first = true;
> +
>   	ret = drm_panel_of_backlight(&ctx->panel);
>   	if (ret)
>   		return ret;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
