Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470F53D3CF5
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 06:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787122409; cv=none; b=dA9Z/w5oCvzkJMRB6/mqBhlYjYLgjktS6eWwtasMsQFuEp2RMRXfoqgminJ5Eqg9QPrkGsi9jCFG4CeuMOWDk3HixmrPwNyZlagUX8dALBxJMlpznqq9A/qiT8qgUdcFYSMWFDq+Htd7dGeOf6S/kwSi3GBTNHQvDEio1I2P+k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787122409; c=relaxed/simple;
	bh=ViPrjrGLX5Hxdc/Zs9vdFchHc6vI5aQgBpj7167p+6M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VKE/5U9RLzrMtmeFGmcXo3aYGgxzirziIuXgs2rBdOV5iDqgnpXRYZBK/ytV9TXGAz4wVsn3UAZaweGlHnIiMlxv7o1sCnBoXP5+Z/Il+qebhsEa7VNUnmd5Rs+8CpAZA7rQ+8wAg7y6MJzN7x6vWJ0oBVdYR4H40hhm5vqkOok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnyG/VAT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnyG/VAT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso3139255e9.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 23:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787122404; x=1787727204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IpqeN5lIytC9amcBTT7riRYHzG5rbVz5f45Yb8g38Eo=;
        b=SnyG/VATLdpbRUxd1tq9pshly/Kh66bANPAqGwJFP80lrGxmcQFaSU31fF9P9n51YF
         LoRdAungqEZMyPrw7s16rFPL6rpTkC9k2DJADeCCci9+v9hAuEzvUu5WncOtGT6lETWA
         /eveWIbqYCCMXsmnt0TJIgkvE2As7lAIB+UHCtK/wssfClYa0XI6SdmeiGU4H2b+yj33
         WdaqrqEOcPhPFokZqH+QhyUEeym2MrTStWJS1foARWL3llh+Ycny88Cg0fPgN5nD8tul
         kTJjRNC5V/oUTFl8uiMpI33Hi8BN/dl8qPwVsmKnXTvmS8aa7st9GlK7nvC9W/+Zy8un
         OpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787122404; x=1787727204;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IpqeN5lIytC9amcBTT7riRYHzG5rbVz5f45Yb8g38Eo=;
        b=IlVkBQSyExRggPSd/RWrG2XoKeeKXlGLlKvdXQ0A9fLp+rmbT/JZ+nJM+CnDsm//ZU
         k5RWro1tpbJROUmCfr4DIUMFBknCEHulLhSxWQ+i1IhX7NivjAvRJ5ERib73TE0LEGmH
         0J/vKGK/Zpw5UBwcbHa5glhv/BXu0IYKZNZakfU2QfnFNIt/Xpg1TP9MWUYCTG4BU979
         y5KRTOcp7vt6OWvsVMNbANKgBuf3JeVc/CznC8GUpBs893HfyHe3aNcpOmpDEXo45TRz
         ED5pTzPzvBHJXROdY1oa6fKe6lDKpChIbq5D46opH8JlI0TFPOSieRsilnoC5KRUSOvH
         OgOg==
X-Forwarded-Encrypted: i=1; AHgh+RqSbWeAEu57BR7qjHxd2gM5lI0mEZIS47ebMz46ZlX7azmQAOKsrd9xLopUWN3htaPk4B6TfpDcb609@vger.kernel.org
X-Gm-Message-State: AOJu0YxqujocCu8ZL+3kWSIdsIWaCQAk0EUl4wp4LlbXnG79pDOzigVg
	waCrL4UFxuSHTf8wPeWgm8+N/tC1oB/HnTOkLD6V5PzAw5SLTUMxmnbC
X-Gm-Gg: AR+sD10QmWCSmtVH/FnCtvjTGKQbUtNgvwPxDHomZMZo1D7zAgPcW3ALem3w5ap1+yp
	FfJcYWhD6WtlVm0fx0VOVAL7Q+uNJzAMQCidc1G7RKHGvSHCGbLXhoc6i6BAd3G5Uv1xPNM6wkk
	YtPurt9L1mdfsk3jGUKhiFMV9sg4EOxYAkwDfxyQEVvYLLjVORv39NY5pXmxfR0gSBGjBo429dg
	9BwbuQMN/6i0DjmdzmSAdggurWX3NSspPkwZ+POmpaDcQu+OMOBMd0b0ouITU4vO2DSIvud21Rd
	xfpe+75RDss8aD62PqqWba5Y2YrNchi6GEnLRuwDdttRxKvU1HYPR+VGmuwaVKNcjVGI8NL+o5W
	ZNW7W/i4hblrW4DqmsaCGfFoNBW9JyCcAMYLehkm/u605Te7Rh2g2NyuKQ8b59zFobT9sPL0qwo
	VO4Gwc5N5MTVM9nH6fs13X+HVTNn7V7xSluE5WSHLU+/5X8KlpAdFFLRLkH3ZDubdCbvNRzgeXL
	WJ2UPLhz1gl3fEA5yP1/LCL+ZFoUOH2SYbxyGmB7MmrW4cSETC7vb3cn2mz4nDdK3PHj3qqaG+A
	DpQrJBJc44SNQ0mMcdFcfyJRCwnIkRZNZTomLaYLpgILwnzeFG0ICuwuTNsvgNBpNUzHHsLaAvR
	vmEr5aJkLEG3VAO08h6E2e+W6/KtYkC/zLBrMDNLBlfw7Z3qRyr9u2CmA+4uTwkAZj7nhOw==
X-Received: by 2002:a05:600c:4e55:b0:499:a07d:a482 with SMTP id 5b1f17b1804b1-499aa1a28efmr46091735e9.10.1787122404470;
        Tue, 18 Aug 2026 23:53:24 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6a84sm35256565e9.10.2026.08.18.23.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 23:53:24 -0700 (PDT)
Date: Wed, 19 Aug 2026 08:52:55 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Vladislav Leonov <vlad@zlab.su>
Cc: Jonathan Cameron <jic23@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andy Shevchenko <andy@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Rob
 Herring <robh@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Simon Glass
 <sjg@chromium.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: rockchip-saradc: Fix RV1106
 compatible
Message-ID: <20260819085255.00001e60@gmail.com>
In-Reply-To: <20260816113636.33635-1-vlad@zlab.su>
References: <20260816113636.33635-1-vlad@zlab.su>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 16 Aug 2026 14:36:36 +0300
Vladislav Leonov <vlad@zlab.su> wrote:

> rockchip,rv1106-saradc was folded into the fallback enum together
> with rockchip,rk3576-saradc, falling back to rockchip,rk3588-saradc.
> The two IP blocks are not equivalent, though: per the RV1106 TRM v0.3,
> chapter 20 (SAR-ADC), RV1106 only has 2 channels at 10-bit resolution,
> versus 8 channels at 12-bit on RK3588. Documenting it as falling back
> to rk3588-saradc allows device trees that would bind against the wrong
> channel table and report an incorrect voltage scale.
> 
> Remove rockchip,rv1106-saradc from the RK3588 fallback enum and give
> it its own standalone compatible entry, matching the dedicated match
> table entry added by the driver patch.
> 
> Fixes: bdba14f6122c ("dt-bindings: iio: adc: rockchip-saradc: Add RV1106 compatible")
> Link: https://lore.kernel.org/all/20260810090826.146758-1-vlad@zlab.su
> Signed-off-by: Vladislav Leonov <vlad@zlab.su>
> ---

Looking at the link provided, it seems that there should be a Suggested-by
tag for Jonathan?

Otherwise LGTM

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
