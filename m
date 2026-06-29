Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DA53E1206
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728736; cv=none; b=DOFQ6pxa25q11vGgdwh/oKvP6lvgorO/9rq11KHo2LPRBJomybwJYtk/awb8R/Om15Z/T1cy9qxA3g3X+WrqS0zJYCxhwSaPnbStf9a+s8Zgytj94GOK23b348hNRa2Iy3RwVCKujFjSNaleqVIRpjx8Vlf+ZHOhPAg7dbKHukg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728736; c=relaxed/simple;
	bh=Dzzx93/IFh2/c56FIW3I+V6rlzl/nGfXG59JSo7h57s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHaPRfATaVr1Os47rxlXK/l4ajrTFd/FU+HWVnaZvOfkyQM0sPDIrRW5QGShXlZLHJbc6h4FHVtQclzAs2LSB0r9BfH0AO7c1UN5dK8i9PhwmCj4qjoA1W8SkyHmNIaMWHc6Yt9XHiIN7hBM3/Wnl7j1keT+yOLIXFxDnWg/9EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=T7hSHqD5; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="T7hSHqD5"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1269e4721aso108094866b.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1782728733; x=1783333533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/GNsGQ15GEBbFE2xBi6yoUDs4BN46tBZEEzbNLpxMas=;
        b=T7hSHqD50SI3xnxHkpG+7NN+6ArMhpg1x7+Zeapx337J5gcUHyH8vvFVOQcO1lCmMm
         6WopMoHi/qnbDLEIz2lLBtO0jtawEyRF29KFqTnLhpQMaksJSvzHlhPADyV/Kdp4fQqH
         6zraDm3FgsGOCtbpn+cFA9cgtdXckd21lyz5kDTK9QzZIrkZjPvT7ndgx1W4w2bqz0cL
         ey65+Zf6cLSxaGC+a62wtS0imw0knHc121l9ZeXWIuMXZlncf87Hx1J8frvt+Alnii61
         ziC0YUg1AU11x+IWfIOO4kxcNZVNHUVCB1EqNM2k4YEZgBYzKz69rszyde+k4uEJDwIA
         oykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782728733; x=1783333533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GNsGQ15GEBbFE2xBi6yoUDs4BN46tBZEEzbNLpxMas=;
        b=SLwT9fRZCux8oiWRWlWfHlZwcVBf46cforIdefuYDer4b/Vgzw2ZKw8FFpqqWi3Uc0
         rhE0i4nCvMoc+fkjtQ1yVV+kzELaTdyH8nlPJbGTE/aRgnRuJ29Z7c+v+B9yNDcTtYhc
         Ntz7aHGqJ8D9MZpUXXdj5Bk5o0/mUUWRu+PGEdv/ZQbHVLcpNRSSMHSoYjwNQVnyoX9A
         VRfxZgu3lV5TVh2au7gvhsq3y9Xd3FNA9V8UPcKUthntET2mXvXZoPzdjqAUjLrJ3T6n
         4Qzq1/aFw11gI7VMqnQI6Itu+GcKnt09Wszsr1OJCJNWnyDGp0//ICSJz+DlZ5lWj6ae
         UGrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrb+YPdElxJE1rplyI4hJCve3UkzR23cM2aEtWDLvV5kOm5V4CCn8HlDOi/8he2hLo10qfuq4PFpLDQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcj4/R3UqUkKBlOaQz/+AJr3zfjgLHsFiudR6AQc00SMsdJpcZ
	6n+1+ykdxFm/LY4eMgCpwQpovyOZB92my2TdV+1A2xrc/MO7a/hZDp/cmKF59dtTJy8=
X-Gm-Gg: AfdE7cmsSzidGNG3xRzRCzEZ9eYbV8btJs7UBuUhpq9QNHfQA0v9oxUwhBvLqI5bVQV
	Yg0vnXo2Ia+Ls183Z0w9//yWhYaynsczywUfRYcslppyoDgRNHixVhxTp9TMyKtYCQx4ZR14oAP
	uAzbeE9IEi64YPWfCzaw3/PUFjbEloalYABBZ9ni8FTnnJpV2c8hWCJM/0c7d0TOv9ZCf5I/CHN
	BTA6oZdk9ewzyi4Wa5fsG2TyoZguosX+zqjHIQ0PFsBmrveVd6KMTbff/Ne2JehDgwwafTthz5K
	IPzFa0b1pp/ffsz8SI1cS2A4Q95F9sH/p1gdl/n2NdBq1a1CobdQnhW0K2Lesfm3P2u8B96DrK0
	IbTY1CgipRs7OXO9YwP36kLuYB7m52QZKtW84l48o2KdxVRxQktMHflacSH0tz6UWX6V7eCiAnl
	GpO8U96MzdPNDlajfOEX2TB2Z/G5zNC3VWfk1XiYCsmC/vhxxTnep22vqvXuq7fmoqzg2OLl3tg
	kHfaJAEFiZ4a53XyAjOFM3+hCRGvsi9pJo46A==
X-Received: by 2002:a17:907:8692:b0:c05:3c55:ee86 with SMTP id a640c23a62f3a-c120616a8b1mr895255166b.46.1782728733071;
        Mon, 29 Jun 2026 03:25:33 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1248c417desm289000466b.23.2026.06.29.03.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:25:32 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:25:30 +0100
From: William Bright <william.bright@imd-tec.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Message-ID: <akJIGk8BEgHQrt34@will-Legion-Slim-5-16APH8>
References: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
 <20260610-imdt-qcs8550-sbc-rfc-v4-4-358e71d606bc@imd-tec.com>
 <8afbc9f9-15ff-4b60-9a0f-845f903d3c9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8afbc9f9-15ff-4b60-9a0f-845f903d3c9a@oss.qualcomm.com>

On Fri, Jun 26, 2026 at 05:18:20PM +0200, Konrad Dybcio wrote:
> > +&gpu_zap_shader {
> > +   firmware-name = "qcom/sm8550/a740_zap.mbn";
> > +   /* Zap shader doesn't load so is disabled */
>
> If your SoC is production fused, you must provide your own ZAP firmware
> that's signed by you. Conversely, if you have a software stack that
> does not include the Gunyah hypervisor, this is likely not necessary
I solved the zap shader failing to load a couple of days ago. U-boot
wasn't fixing up DT memory node correctly so I will enable the zap
shader in V5.
> > +   status = "disabled";
> > +};
> > +
> > +&i2c_master_hub_0 {
> > +   status = "okay";
> > +};
> > +
> > +&i2c_hub_2 {
> > +   clock-frequency = <400000>;
> > +   status = "okay";
>
> nit: let's keep a \n before status, everywhere
>
> [...]
>
Ack all of your above feedback regarding formatting, new lines and
ordering.
> > +
> > +   sd_vset_default: sd-vset-default-state {
> > +           sd-vset-pins {
> > +                   pins = "gpio4";
> > +                   function = "gpio";
> > +                   drive-strength = <16>;
> > +                   bias-disable;
> > +           };
> > +   };
> > +
> > +   /*
> > +    * Drive LAN743x reset high (de-asserted) when pcie1 probes,
> > +    * so the PHY enumerates on the bus.
> > +    */
> > +   gbe_reset_default: gbe-reset-default-state {
> > +           pins = "gpio138";
> > +           function = "gpio";
> > +           drive-strength = <2>;
> > +           bias-disable;
> > +           output-high;
> > +   };
> > +
> > +   /*
> > +    * We drive this GPIO physically high on the M2 Key-E connector
> > +    * to make sure the module is enabled. An M2 Key-E module could
> > +    * be using this pin as a chip enable.
> > +    */
> > +   m2e_sdio_resetn_default: m2e-sdio-resetn-default-state {
> > +           pins = "gpio41";
> > +           function = "gpio";
> > +           drive-strength = <2>;
> > +           bias-disable;
> > +           output-high;
> > +   };
> > +
> > +   /* Force the on-board PCIe switch to select the GbE upstream
> > +    * port.
> > +    */
> > +   pcie_switch_sel_default: pcie-switch-sel-default-state {
> > +           pins = "gpio16";
> > +           function = "gpio";
> > +           drive-strength = <2>;
> > +           bias-disable;
> > +           output-low;
> > +   };
>
> Normally this would be handled via an actual driver - see e.g.
>
> Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
> https://lore.kernel.org/linux-arm-msm/20260605010022.968612-1-elder@riscstar.com/
>
> Konrad
>
The PCIe switch we are using is a NXP CBTU02044HEJ, this is a simple
1->2 switch that is not PCIe enumerable. Given that there isn't support
for this IC already in the kernel and that it will take quite a few
weeks/months for me to cobble something together, I am thinking that it
might make sense to drop PCIe support from this patch-series in V5 and
then submit a seperate patch-series with a driver and bindings for this
IC whenever I get something working. Are you OK with this?
> > +&usb_1 {
> > +   /delete-property/ usb-role-switch;
> > +   dr_mode = "peripheral";
>
> Is it really peripheral-only?
>
> Konrad
On the SBC we have a TUSB321 for role and orientation detection. I will
add this into the DT in V5 so that both roles are supported.

Thanks again for your feedback,

Will
