Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2552247CC80
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 15:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080450; cv=none; b=sOQfpBDs0bPrT9rK78PA+1K4NSUl5MCIWAROsGeFibrZbkLnZ25igqixQYCkN/B7j/l+ssiSg7XH6+QffBe9K0zBUHUwWQA0wiANbBRW1kbDtW2JD47eWgFnNJZ47iJ3GFbR35oGoI+N/GYhREhX6Z6zzi1U6rR0k/kF20ctacM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080450; c=relaxed/simple;
	bh=6uxmBcsusZraeh4PG9F1SE0HCI0qSLyvABncvHgVrrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5vktOl4v3ZvuVF8JWPW6vWkHZazCFvsT4WT7EZoqm56u+6u4LLgZWp3Zxf5hWaIyv6tWgqKBCkkkI9OGvQdJuAqwOT8BLbbeW1sJtayh9vDXpKKQZKQAxNoQiHNZCKI0C9D5spMIt1AsjFjP4bogZnogB2ehfpQl9AxBXDcrdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=DNQ17v0/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="DNQ17v0/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso63572785e9.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778080447; x=1778685247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IqBw8Kd6OtjjnQiFLsdPfhJ7HyL89HYldEhFC8X0GH0=;
        b=DNQ17v0/9S0QPq+fGJQdHrALvbwpzxoj6RmDJFsbf5jLvjMPnlEVUcMS0jjgAi2AYf
         O3eY5fGSaMIigEABwmqAlQZixfn+knoD9zRhu2O9DSwirSv94zWeiMESMzxl6TCbBWMP
         TLfSKa+v0nbbPcd/i8ZY6jbCcMOby2N/V55r/ai0JV8u5eZ9QqrGLq98UkILHnhgGw5k
         Pkyl6QmLeigrP2PPSrgSKMYif6f3l8aqWjVJM+X7FSAuORIf6ToEFK7rtpGnNPf1Tu+V
         +FSwQHLjMzri9BFwvMPVDF4xvCTzpDUANtlWj40rv49LAoTy/YKBd8BSj6F0Hckm2vvC
         42uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080447; x=1778685247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IqBw8Kd6OtjjnQiFLsdPfhJ7HyL89HYldEhFC8X0GH0=;
        b=RU/B9xJEyZWzuP29BSIE3Nl/qipehlxRQfLnrLEhBI5iLjSs6n74NEUbaRgpXM+M+P
         eI1aesPc1OqDmm0wJpm+LORJqnJKKwfyNBkaWse+Z07ig37UG7+Cvp1OWyDnA1HZnPrb
         kRoLDsA9bJx10BAo/RsAx6YoziKfIFtnLVbGxVYB61/ov93w8/yEK82NtsBCQWS3tE6m
         1/Q2s4zSeo/Al0F/Pfeh1fAS6kBIYtKHwg4Q8MfrXYrfdI5zMo1cLw3+nppV4xI+3WUz
         qLXyLb/0AYJfoxJX/90pArv//8xSHFon1qaLdWt2LN2R+TUNZ064KnCqGzGG/c3AxYpN
         Y/uw==
X-Forwarded-Encrypted: i=1; AFNElJ9R4ZbnTqRmJvrbrYKefrFJ7hQQOvNmuDGDol8U3czrHHMjUQG6sGPBXR9ROigRHNHWKOdRclrzvHNI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy++Udeo5pLcXNmg9uYZYbFpH45GovyZ8yHzjlYBC2jQ7WVNxTp
	Q/ujBm8UAQR/LRaIBwSotuqGHBE4/e1AOFszPSbzyW9+ivZ9ObXMCezIWQcFQ9vsdX4=
X-Gm-Gg: AeBDiev6nAoAfPccTZtDJaQ9n2gR2uesjca9H85mJUTAjKHPJa7wELDd4gUDQQ57jAh
	l2qu199VjMo6iAjnikIuK8VUoC3aDWuSwrD00p1W3+6ugjbp3hTRNTlp78voxDP5qaH0EdkD1ku
	h2b5JYHJQrlMeDtvsm3NvV5AIpV4y/OLxiVrAtvpXuVx35TyOBEupchUTQqmiZfWlDSsG8If6/9
	56C8vtwBMMzhmu29xfIEwfTr/81Vlt0o8QyUE1aMzoMGZ9i5Bl8VbFtD6z8w1u7kJ2TMuQEJXcF
	ujeeJueSMxJUkjye+s7NN22Le4F2qw1bp6feYAL0Pbw7zIOCn29X1oHg1AXwg8BFagjt/y1B/y2
	cfyZI/nA+8nYLRiK66bx5kZYls9g3f5oCvpPiPoVZ8Qg+GGwFUbSdWBkSDJZ5DkjMY9p16w4+lJ
	oXwHD0TF88mbJzZ2vZ29+yE2n/tfe6qWv44wBCVHqI08UZp9S8zYyY5ZgqAIQpaIUG9gTdOC610
	CRZx1/rriYPGq4mPERqp6OK4JjsUir4KxoQTA/hVzMzXf+ILe9SIg==
X-Received: by 2002:a05:600c:a111:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-48e51f2f83dmr51500945e9.17.1778080447300;
        Wed, 06 May 2026 08:14:07 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([2a00:23c6:2736:8e01:5fbb:faec:b3da:7ea1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538b26a3sm95055395e9.9.2026.05.06.08.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:14:06 -0700 (PDT)
Date: Wed, 6 May 2026 16:14:05 +0100
From: William Bright <william.bright@imd-tec.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Message-ID: <aftavTZafl6bCQhD@will-Legion-Slim-5-16APH8>
References: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
 <20260505-imdt-qcs8550-sbc-rfc-v2-4-b4767d0dd421@imd-tec.com>
 <20260506-aquatic-shrew-of-engineering-09fbe8@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506-aquatic-shrew-of-engineering-09fbe8@quoll>

On Wed, May 06, 2026 at 09:53:01AM +0200, Krzysztof Kozlowski wrote:
> On Tue, May 05, 2026 at 09:09:54PM +0100, William Bright wrote:
> > + compatible = "regulator-fixed";
> > + regulator-name = "cam_3v3_reg";
> > + regulator-min-microvolt = <3300000>;
> > + regulator-max-microvolt = <3300000>;
> > + vin-supply = <&hr_cam_pwr>;
> > + };
> > +
> > + display_panel_pwr_en: regulator-display-panel-en {
>
> Again, unused
>

For the camera regulators, I intended these to be used within device tree
overlays (I.E a DTSO would be made for an AR1335 connected to CSI0).
I don't have any camera device tree overlays in this patch series
as the only camera I have tested is the OnSemi AR1335 which isn't supported
upstream. So I will drop these camera regulator nodes.

> > + compatible = "regulator-fixed";
> > + regulator-name = "dsi_5v_en";
> > + regulator-min-microvolt = <5000000>;
> > + regulator-max-microvolt = <5000000>;
> > +
> > + pinctrl-names = "default";
> > + pinctrl-0 = <&dsi_5v_en_default>;
> > +
> > + gpio = <&tlmm 140 GPIO_ACTIVE_HIGH>;
> > + enable-active-high;
> > +
> > + vin-supply = <&som_vph_pwr>;
> > +
> > + regulator-always-on;
> > + regulator-boot-on;
> > + };
> > +
> > + /* Enables 1V2, 1V8_CAM and 3V3_CAM */
> > + hr_cam_pwr: regulator-hr-cam-pwr {
>
> And this becames unused after dropping fake regulators. Why don't you
> have proper users of these controllable supplies?
>

I will drop the on-board regulators for panels. These were intended to
be used by a panel DTSO. So I will these back in when I 
submit patches for a panel DTSO for this board.

> > + per_1v8_reg: regulator-per-1v8 {
>
> Drop node
>

I have omitted that its used by the LAN7430. I will add this
usage in V3.

> > + compatible = "regulator-fixed";
> > + regulator-name = "per_1v8_reg";
> > + regulator-min-microvolt = <1800000>;
> > + regulator-max-microvolt = <1800000>;
> > + vin-supply = <&per_pwr>;
> > + };
> > +
> > + per_3v3_reg: regulator-per-3v3 {
> > + compatible = "regulator-fixed";
> > + regulator-name = "per_3v3_reg";
> > + regulator-min-microvolt = <3300000>;
> > + regulator-max-microvolt = <3300000>;
> > + vin-supply = <&per_pwr>;
> > + };
> > +
> > + per_5v_reg: regulator-per-5v {
> > + compatible = "regulator-fixed";
> > + regulator-name = "per_5v_reg";
> > + regulator-min-microvolt = <5000000>;
> > + regulator-max-microvolt = <5000000>;
> > + vin-supply = <&per_pwr>;
> > + };
>
> Drop all these
>

per_3v3_reg: Used by the LAN7430 but omitted by accident so I will define 
  that it's used by the LAN7430 in V3.
per_5v_reg: Used by onboard audio but audio support is omitted within this 
  patch series so I will drop this regulator.

>
> Probably most of them are to be dropped :/
>

For V3, I will go through all of these and eliminate any redundant regulators
or add where they're used.
Most of them likely became unused when removing SDHC4 whilst
preparing this patch series.

> > +&lpass_rxmacro {
> > + status = "disabled";
> > +};
> > +
> > +&lpass_tlmm {
> > + status = "disabled";
> > +};
> > +
> > +&lpass_txmacro {
> > + status = "disabled";
> > +};
> > +
> > +&lpass_vamacro {
> > + status = "disabled";
> > +};
> > +
> > +&lpass_wsa2macro {
> > + status = "disabled";
> > +};
> > +
> > +&lpass_wsamacro {
> > + status = "disabled";
> > +};
>
> Why are all these LPASS codecs disabled?
>
> Best regards,
> Krzysztof
>

No audio driver support is included in this series, but disabling the LPASS
codec nodes is unnecessary so I'll drop these changes in V3.
Many thanks for your feedback.

Best regards,
William Bright

