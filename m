Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8621FE471
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 05:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786165455; cv=none; b=DCfv48laWn/OCUXhtAV4Dftnb6Jw6bjPoMdaOjJRrEx0ysoab5QIw8w4XmkBg1HVp2tU+dxY5AyjiYUcKAPc3Ae63+ZsO0qzRWUZWBnGxeNliyRu3ui/9Ihxi5+y8XkOc6obkbOKrXbdDe+sWa0vMufz4Gor8kmw9QgDb+8LPa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786165455; c=relaxed/simple;
	bh=9ucFn8yjujP0VoUhtpH8rGna1HadIHc3Y9n01MXVHxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTies2XMaQOaWqxW0P0lsweqvANLsNOFj55h3ipZG22aP/l++w0jjQkXFiqIro9aX30EauIykcPoAS7922vrCE9qtkMeSl+5jfRgR1XUm5W+07KlVMtWpeXkosfiryKvu/9WAGaWnB17R44WAiXS+uU/TYFuMt1Xo48eHMx665I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie0nOM9o; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie0nOM9o"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc73e322dbso2455255ad.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 22:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786165453; x=1786770253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8uD24huWZm6XpJh9wT7WOr3BJsSLtwFgAarL6fJ9kQ4=;
        b=Ie0nOM9o/dW3jWg3YduBRJxgGPN5xEQ8Cm0XrIlaBIv0b5sJNWITi7u7HmbMtAZmzJ
         xsNf9/5fz3Ami7BDcTS3lnDmweuo5ajT7fFxuqwpeDKbw4U1AgFGXZorqR+8md3xYIfw
         EEhVsEXacOE3glEvLtFOMF5pbxsCt2UqfRTZBRPFPB6PBHJxv1XdLv4Bb33s1ivNlAdW
         tlAbHPqgGmoaRGq6RjmFXaJcXG4tAjF/Zd6u9q2YLKxgbn9/eoUksNYUtUhnQa5SIXLi
         2hH+8haraPeq3aFR9f0ArHUJXYReGapM7Tm7/3U07Rj4fau5QoNo7ZairtPjlGEKJ2NG
         3+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786165453; x=1786770253;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8uD24huWZm6XpJh9wT7WOr3BJsSLtwFgAarL6fJ9kQ4=;
        b=gRCO385a7O9Ubi9nZLCEOC3XONkFEvUvTuuagUY6jwzWvwR1X99iA+sudu25CoqxZJ
         xUJjFubuM9bUW0KLs8jqr57wHns5+nqvO54XjN36M1WLeZXI3jB25ezWROdfib2zZ9dN
         +QEoLuXYx1I7Vaz2w2MAzAWvciqCiXDxa+lntr6OW9/wjvArIC+RWXRciHdcsJoSLYdm
         VYFBaHbXrMjduUvgCQEQjvc+rnISHeeleBKzOmGn4AbNEgD6iBEx+N9pRajlRhe2riVH
         BR7JywQjiY1F6i3bY37TyxhL6b+6WVWqS68Js2thYIhnTtQO+OOf+GjaIQ0aF6GL1Oee
         Jy8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr/tW0O8bRUD8MdVrBlhyl+wIwxWGNiqqt3bZ9k1b4VreywlIDen+k5NLYcpCwvFbblfiC0BuVgbCEM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7fWNoTcqqQHzO4Xmp2IxGv9u5macR/HxqwhbF3Zldlvn2VGZN
	Sn+Xqnwpdb2A48UX/NHuH4EOw0r7cSM9ov+A/svyQDiGaYbepx+mDly4
X-Gm-Gg: AR+sD13YN5sCDMd6CCKKxOH70480+79JkJZdFaObnPRSUa1qxDrGTT0x1p+3/4aDTE5
	xsJIcJUtwQcTVntzWQ2+IqCH5sxpAZMkBn0L+fgsxlW9YSlczxKl6cgavyEqWeblmG43ls4jrur
	uvN2+bEqPyqLABQtQ0avjheEbPh8RP3JAhI8V3mzOT/7G0CgCBI4tG/BoWoZFhUEdI8DpQPSsF2
	BHhnCD3om5NkZ4dns+4X3t5LrbPtXXhtBwWnLQ8hxxbTkza3Q/tYoJhhZoGEs875UV7gJmYP/Fp
	9tl57HYrtWJTVlKU9IAR25KJsZasRWvXGhVqqITH52Bu/HHUSJP1L4DMc3FMeprGs7VEOknfRmJ
	CgmeFQSh/hRIsyzhAcjskLkaPefUaN/WKWflxNMFHEX5wEQx/MmY9F35yYg4dsdwlf1je/ms5r3
	YB0EyvlU0L6HfeFiSZSx7Waj6lF0oJ17k30A==
X-Received: by 2002:a17:903:fa5:b0:2c9:d8c6:1dc3 with SMTP id d9443c01a7336-2d0ca1611famr339026475ad.0.1786165453023;
        Fri, 07 Aug 2026 22:04:13 -0700 (PDT)
Received: from localhost ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14cce7830sm15452855ad.29.2026.08.07.22.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 22:04:12 -0700 (PDT)
Date: Sat, 8 Aug 2026 01:03:52 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: codykang.hk@gmail.com, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 10/17] drm/spacemit: add Saturn DPU KMS pipeline
Message-ID: <wr3264hzlya6zep433nr3u2acukizilkrqpkj444kfqeyaeorj@2rc4zo2cqcer>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-10-6de34d80e86c@gmail.com>
 <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>

On 2026-07-27 09:35, Philipp Zabel wrote:
>On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
>> From: Cody Kang <codykang.hk@gmail.com>
>>
>> Add the atomic KMS implementation on top of the hardware backend: one
>> CRTC and one primary plane per DPU instance. atomic_check validates
>> the plane rectangle 1:1 against the mode and sizes the per-channel FBC
>> line buffer; atomic commit builds the cmdlist batches, maps the
>> framebuffer through the DMMU and arms the cfg-ready handshake, with
>> vblank events driven from the DPU interrupt.
>>
>> Signed-off-by: Cody Kang <codykang.hk@gmail.com>
>> ---
>>  drivers/gpu/drm/spacemit/spacemit_crtc.c   | 815 +++++++++++++++++++++++++++++
>>  drivers/gpu/drm/spacemit/spacemit_planes.c | 376 +++++++++++++
>>  2 files changed, 1191 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/spacemit/spacemit_crtc.c b/drivers/gpu/drm/spacemit/spacemit_crtc.c
>> new file mode 100644
>> index 000000000000..b75ff6320501
>> --- /dev/null
>> +++ b/drivers/gpu/drm/spacemit/spacemit_crtc.c
>> @@ -0,0 +1,815 @@
>[...]
>> +/*
>> + * The assert and deassert orders are not mirror images: the hardware wants
>> + * these.
>> + */
>> +static void dpu_reset_assert(struct device *dev, const char *name,
>> +			     struct reset_control *rstc)
>> +{
>> +	int ret = reset_control_assert(rstc);
>> +
>> +	if (ret)
>> +		dev_warn(dev, "failed to assert %s reset: %d\n", name, ret);
>> +}
>> +
>> +static void dpu_reset_deassert(struct device *dev, const char *name,
>> +			       struct reset_control *rstc)
>> +{
>> +	int ret = reset_control_deassert(rstc);
>> +
>> +	if (ret)
>> +		dev_warn(dev, "failed to deassert %s reset: %d\n", name, ret);
>> +}
>> +
>> +static int dpu_pm_suspend(struct device *dev)
>> +{
>> +	struct spacemit_drm_private *priv = dev_get_drvdata(dev);
>> +	struct spacemit_crtc *a_crtc = priv->a_crtc;
>> +
>> +	/*
>> +	 * Assert before gating: a reset asserted into an already-gated block
>> +	 * has no clock edges to propagate on and leaves the register file
>> +	 * untouched.
>> +	 */
>> +	dpu_reset_assert(dev, "lcd", a_crtc->lcd_reset);
>> +	dpu_reset_assert(dev, "esc", a_crtc->esc_reset);
>> +	dpu_reset_assert(dev, "mclk", a_crtc->mclk_reset);
>
>It looks like these three are mirrored, and could be handled by
>reset_control_bulk_assert/deassert().
>
>> +	dpu_reset_assert(dev, "aclk", a_crtc->aclk_reset);
>> +	dpu_reset_assert(dev, "dsc", a_crtc->dsc_reset);

Is there a reason these two cannot be mirrored in order? Please double
check. As I checked the vendor tree, the suspend/resume side appear to be
copy/paste rather than a deliberate ordering.

Please double-check. Unless I'm missing something, I suggest to bulk them.

Thanks,
Guodong

>> +	usleep_range(10000, 20000);
>> +
>> +	if (a_crtc->core && a_crtc->core->disable_clk)
>> +		a_crtc->core->disable_clk(a_crtc);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dpu_pm_resume(struct device *dev)
>> +{
>> +	struct spacemit_drm_private *priv = dev_get_drvdata(dev);
>> +	struct spacemit_crtc *a_crtc = priv->a_crtc;
>> +
>> +	dpu_reset_deassert(dev, "mclk", a_crtc->mclk_reset);
>> +	dpu_reset_deassert(dev, "esc", a_crtc->esc_reset);
>> +	dpu_reset_deassert(dev, "lcd", a_crtc->lcd_reset);
>> +	dpu_reset_deassert(dev, "aclk", a_crtc->aclk_reset);
>> +	dpu_reset_deassert(dev, "dsc", a_crtc->dsc_reset);
>> +
>> +	if (a_crtc->core && a_crtc->core->enable_clk)
>> +		a_crtc->core->enable_clk(a_crtc);
>> +
>> +	return 0;
>> +}
>
>regards
>Philipp
