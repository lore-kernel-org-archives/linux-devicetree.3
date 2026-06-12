Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D501DF248
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 04:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781237779; cv=none; b=P/PfPEGCmEYEOQ8xEeC8r2xqlrCkqbR23dw3NlSq2RYurMXGxoiUU5bgAVA587KWDPPzgluRwv1fnuLVselDNugO6NLFIyprqFP0CTgdnQfsnalZT9xOhfeSmFN5uNbWOvDAMSP52xjC7vzl5EgedUiNGr892I4sY6tt6U8rE4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781237779; c=relaxed/simple;
	bh=S45NGb5nHnP1iFpxpFlQ0YTorvzPHiJtJltQczKK3kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYyyiLuqKv5w8hLNAddvhxRAWinxtuJlMowmc2TFjKJFQNNaDvtGKtrTw41Aa7pwyCSa4IP77y2W5t3K3afbByar/tgrsrgBzWq3EiohiB92x9aw7VbkAf/h9ciMLyeaR59+1lOa0kBCXgRM6I/QMkVRLdSGzISti4TVbfnS4aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9k/kSie; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9k/kSie"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0c2d792c8so3615955ad.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 21:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781237777; x=1781842577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tzOTMyOpfLnyNK+VGAde0WzU286Gd6+LpsOa0E/ts9o=;
        b=X9k/kSiezeARoKznaBGdd38vBsfyKloyopiJmHJ5dUxcfSHfvsQoxSELmmzj66bgLE
         LKleYIKPwF53ZVKx0IMjqTz9GdJZhC/DdY+PWucioiNisbqQnLH3vhhooOj8AOxtKEw3
         yWzGpzz8VaceEj0LFEvE6dGPOo1ruH1fncfxp2TDFiL9PQvBWCOqSbpjX6LNShs1K223
         gSSaZypcDchsr3JCW8tts4WZYrJ59Wdn1FOlgJt5mkYDqnkfWtattK+o6E0JLfvh2tBQ
         wCMoG/0gks9jz7jM5JVq/xC38oJ67BBqXrqE0swgbSm2mpL4d+1DJ8QXe3YaspYY4Q8Z
         4A/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781237777; x=1781842577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzOTMyOpfLnyNK+VGAde0WzU286Gd6+LpsOa0E/ts9o=;
        b=Cd2p0+jF2KHEW5mPvNsj+rVptW8+Jxv40WV2mhIBZ1ASE17FrpR3/Fre2KZlYROLfz
         Zz6xMvRcKEOYtTJi62oNDGbrfSt+QjkWvfp7/lpCIlzRFLxe3NzGkI6lAP/jaZOLLPm9
         OsCyWDFdC04x8XVkM2wu/PyEdwOZX3Keb38pnxtvr+BEhpbFSpl8LqgFpZlHu7FT2bm1
         tMWyEiQqusLaH41cWnYExOe8flUqvag9trqQZ2PNm7U0JDgknZ2ITr5DfOCYQlMlAQPL
         C2xv9YPHcF6+U+Ss7OEr4YVfVPZWHcz7tQeg/u/FVKnhIXrwR0ClFJF1UnRmRlyyH9kH
         QBYA==
X-Forwarded-Encrypted: i=1; AFNElJ/GO1eHDXGEMT3fRvuYG4sNNYOC+Yi37xh2FYoAUJGddCnimc/f//iNop1EIBTK4EzOlpZgkur0ulwt@vger.kernel.org
X-Gm-Message-State: AOJu0YwPvfGl2JP+gz48I9QoLnIyVuJe+g28FXsPaqqqQ5MAO9Sreer2
	VgHKaanBWyB1FPjtNCV7v6ryxGQj4q/3NgO+BUf27EhlXZ5pQMfR3XmO
X-Gm-Gg: Acq92OHx2LwH+C3ZkFa+hWK1PdRU+SyzbxA8cMRnwsPywpOy3YENafjzUhn82CvzTh6
	KPxFsTJ2mWbXsY54xs9XQL+PRPQMYDbeFYCCYe/zZav1DTUiC679XXzGQx4I292kXothqWpnqPk
	2hNLk3vEYEgDm3tV8Il0PyDF4pWoHg5KP5jBaBQH1CmFZRArj9JoZBnvad72wA0v4/Tq2n5Ihio
	EEfHu9yFgBEG2hr/iESU2o7238B3d1Nu6eMtwO5Q8nznOpzw/Z+nrcusilaB5bNzCKIeTF795ow
	swlHxPchhFuBFJItgMEFskpE0XMFn4Hw3c2NgssvfAerFhiVV3XbsuLhM5XlUU+6SdbAGv+atms
	iFL/2BMNXMUKlBBqyKIAy2K+1C1GgLHQty9E6m3u8SDz5mIz5Tg2hDLJVTrR3awb3jIhsBoozpA
	QEjdUIdVJ/YJUa/uwR8MUlC6Ru9L9lcLgyfaBumllNCRQ=
X-Received: by 2002:a17:903:247:b0:2c1:a19:8396 with SMTP id d9443c01a7336-2c413dbb942mr14852495ad.31.1781237777134;
        Thu, 11 Jun 2026 21:16:17 -0700 (PDT)
Received: from page.local ([2402:a00:163:2ce9:95bf:5776:9b95:85ee])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e535csm5089475ad.6.2026.06.11.21.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 21:16:16 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:46:10 +0530
From: Ajit Singh <blfizzyy@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Message-ID: <aiuGjH4qeOIXXgqq@page.local>
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
 <39228ace-9404-4ade-bcb1-28e763548b7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <39228ace-9404-4ade-bcb1-28e763548b7f@oss.qualcomm.com>

On Wed, Jun 10, 2026 at 02:58:19PM +0530, Konrad Dybcio wrote:
> On 6/7/26 1:36 PM, Ajit Singh wrote:
> > Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> > QCS6490 SoC.
> > 
> > This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> > support along with regulators.
> > 
> > The UFS ICE block is kept disabled because enabling it currently causes
> > an SError during qcom_ice_create() on this board. UFS works without ICE.
> > 
> > Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> > ---
> 
> [...]
> 
> > +		vreg_l12c_1p8: ldo12 {
> > +			regulator-name = "vreg_l12c_1p8";
> > +			regulator-min-microvolt = <1800000>;
> > +			regulator-max-microvolt = <2000000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +
> > +			/*
> > +			 * VREG_L12C_1P8 supplies the Ampak WLAN/BT module
> > +			 * VDDIO and the external 32.768 kHz oscillator.
> > +			 */
> 
> Sorry for the long review timelines on the previous patch, many of us
> were out for conferences..
> 
> Is the oscillator used for that WLAN module? Would you ideally like to
> be able to turn it on/off?

yes, oscillator is used for WLAN modules. Oscillator is powered from the same
VREG_L12C rail as WLAN VDDIO, so there is no separate regulator control to put
in pwrseq. So I think this will work fine?

> 
> Perhaps you could get that with a simple pwrseq driver (+Bartosz)
> 
> Konrad
