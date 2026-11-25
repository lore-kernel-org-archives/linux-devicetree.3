Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621201;
	b=jHa4NmUCk2j9/Rc7OoYnQkPJuDUyE5ZG1TWjZhQftv5TwdelM2bipIMDtaR07sKrmnfM
	 GvPlbR+4qD1oA4+X6wqQPIJdGHucQa6OWpc0yZKUDFOkFS/ZtnmFmahq2kFQC1bdWfIwG
	 fGjgIHLh0Ynk1omW7m1VGyHdTWdYyWN222tJTy1K+egaD7sEXNH0NdNtESdTjtiR5gAOu
	 f10EpOspgpO231QVXIVkgvqvpNnj/AdR7tr5icwkT3bW3q53pFL2BcUX63433sv6eqqOG
	 b9R1G+B2kxPvPzKvC3FbWWe0GE+PNFlsydEED5AkPo49+veVGiuUX6mLDnL1qG7b9Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=gqUeEhyGjKq93ahPeMI4CffMFtMuuHUd8X1hC7MuE8c=;
	b=YifWL31KjPlO1sE5VvsaD+YH19AjjrXjjIhRiZjVH5UormkGbZoiVyVsDC2UbnyBxdvl
	 C23YsiI2/ykYzbXHRAdLhEnVuVUQK2Ngc8SIn301pCEOgaWYp+h1FcMD96exO6a6Q/rBL
	 ncqo8VxiMZspi7PDoAbVGJYJv8WBTic1BSDNKXe828Xd0XS6akC5KXbj3zvML0IEslzSK
	 drgd+HxI+AQbhySTk8L6cI+cuKihrJTb227aDfsH3uLb9XKaUDur++ITtnZNQA9QOPdZb
	 VQ+PU0cGiTFS6JAaL9+ug8rIfG+48HAFaZY46gg/bRUYRq0dnRalWp3gmfoBghjOmOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RjxdsfKw;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76C4606A33D
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D76C4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RjxdsfKw
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so40421925e9.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795621199; x=1796225999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gqUeEhyGjKq93ahPeMI4CffMFtMuuHUd8X1hC7MuE8c=;
        b=RjxdsfKwvvddGpQSiNhRsMhHqK+KznqtEzdvJlHNkNxRcNDDOnVVWr0obg9T1+w5YF
         IXSVqRD72Kt14j7/vOch3js9XRZ+MOQav6q+WBeAvgDXBYU5UAlDmPZTqqj8maE6QTzk
         RH8OhZMEzGRWmI13DO0mVDzTjznLEvNsLJudBVG0o/2U0CAzCh/p18Eis767vb0mWFkt
         wOdRWWP4FXylRdYfohZkobSdmX/jcRRrz2lvpCrUBmEAS1NrPXbhC2X+VCfPh1YPFPHV
         tgqR26Le1ES5fcDtsnSZid+RMgOyE6a704dSJca23QAMgNQkjO3J1mJm4VtXdQs4IgSd
         E3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795621199; x=1796225999;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqUeEhyGjKq93ahPeMI4CffMFtMuuHUd8X1hC7MuE8c=;
        b=avdkBadLgSa8z2NutIh4sYOgfuO+qpoRSOMMI+U815r8lVt8cYn2HmXN6a0gbHQr20
         2OgykbZVeQ7GzoYC0Y3TTwnM1XbCw0MwH8daU77FtOOfeZLtFVa8ha7K3JDFnXZJ0Pr8
         2+I9FFsH7FyujFrGYO03BFPzGukc5v/iCXKEiXzZjG8zs2eWy9ZO2jXa4A6qM2JkFQZp
         lmEyz8RG+fd3R+Qwjw0+xf4mXxH+9Z/eMG0x1/oos/bWO4IxZqLHH6NDyansPPrTRacy
         Oab8TsiTpD1UuGForc5wixvt/fxfoJv+aMviPL6e5sSZNLftv/Ay1roeBGjJ7St7NNQQ
         MHjA==
X-Gm-Message-State: APuU4Z9mFYozPj7Z5v0TGO8vBl8SRwOC38iOOcdoX1UT/i6Nx133ynzE
	r76Cj0T8FwFKZNglkwauuJWKdhptgzJ6EvUIvOo7K/lAGsheritHur81+4gmbeN1W7s=
X-Gm-Gg: AZFdTZfPveKFNdlxtLeDO5+k7RUk6Wv3zHJQPcVEQ2ybgBihYuXmWjSX88UFWMNJtii
	X5EEkyALj6pctrY/mTGLCjPznb6Mxq/GEHl+2LFerf4Fgc6EekTzCPWEVCVy7KerC+2yH2cCFUF
	uH3pX5DCg/d5a1LA47Rm1ogE5EsX48jGgk5vBkZK+TjqBN58L3aOJPYtEtZO1FXi63cgsgmU+dA
	VrYzgihuBgXSu+L9seZi/SulGgrn3s2+01CdYrMaf02GR6AmhgQvtu9M5nqzjjuvDoRNWhZK+fK
	eZb+3rz2wrUHYtaM2CCaa94ofBybxZeaq2ImRcGUO/BcvyZsQyMDR0z0blXoyHHlG2PNA8g2sna
	b1wp0vox2vBLYw3ctTfQLRM0PA93ADV8oGgNZap6lKcgEbZwjZ+vvaLY2LGFTN1fegMEH0/Rgi0
	c3p5Zniygvxxx2Fh3WjyFnQgdBXgCWGB2GfBTU4ATqfbsFsiJp6jt3rS/p0r5ce0FnXXVGKlqE2
	xF4rw+x++4it4+Y45gqau5JD97kxCKX3ME64fXFK7Cp+VzWBaD64Yb+xyEfJkbk/pa3QCylbRSZ
	L3+4gKlOyTvNH29cWXNjyryLqwof3g5TV/YDnw==
X-Received: by 2002:a05:600c:3ba9:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb8881c741mr427623865e9.6.1795621199120;
        Wed, 25 Nov 2026 07:39:59 -0800 (PST)
Received: from [10.229.50.9] ([90.82.202.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm14255031f8f.9.2026.11.25.07.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:39:58 -0800 (PST)
Message-ID: <8a9a4fe1-0fa5-4c48-aa88-f61b3a01739f@linaro.org>
Date: Wed, 25 Nov 2026 16:39:57 +0100
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
Subject: Re: [PATCH v3 1/5] drm/panel: lg-sw43408: use the full DCS brightness
 range
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
 <20261125-fix-blueline-panel-v3-1-914b4a30b73e@ixit.cz>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
In-Reply-To: <20261125-fix-blueline-panel-v3-1-914b4a30b73e@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/25/26 14:08, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The vendor changed the value multiple times. Last value for production
> devices was 900. HBM can go up to 1023, but keep value safe for now.
> 
> Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-lg-sw43408.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> index 822318f546ef3..92cab6478ea61 100644
> --- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
> +++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
> @@ -197,17 +197,18 @@ static const struct backlight_ops sw43408_backlight_ops = {
>   };
>   
>   static int sw43408_backlight_init(struct sw43408_panel *ctx)
>   {
>   	struct device *dev = &ctx->link->dev;
>   	const struct backlight_properties props = {
>   		.type = BACKLIGHT_PLATFORM,
>   		.brightness = 255,
> -		.max_brightness = 255,
> +		/* HBM can go up to 1023, stay safe for now */
> +		.max_brightness = 900,
>   	};
>   
>   	ctx->base.backlight = devm_backlight_device_register(dev, dev_name(dev), dev,
>   							     ctx->link,
>   							     &sw43408_backlight_ops,
>   							     &props);
>   
>   	if (IS_ERR(ctx->base.backlight))
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
