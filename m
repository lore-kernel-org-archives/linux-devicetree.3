Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF26A2E6CA8
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781764156; cv=none; b=GAIFxEk/69uyJPDQFSsktKMK/NMjSmSs8nDH9nYGzdvlVyB4QqtdYY7mEkhg6kEjuJp3QHYhcR0U3Ptu8CfxcpqazIvxcKvTaXLQ6zZ6hsCeOjmR+8L6QVVhm/ej4f953HMJPfOKFAKQJ5isIzqvOHwRlLFJ91yBfgBPGlXhGdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781764156; c=relaxed/simple;
	bh=6uEUT4qP1wOmOU/2p/3q3dn23U+/yYEA6rSJUqAvQ8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bj1yzmW+zFO63P85mBkyRQ45jHfb9j35d9HFa9WPVmqJbcWIMXAU2wiljBobg4FOQBHkS4kE01Y20JgX4MWNUN71v34q9lxDOuQ9Bir9NuJVpDoH7+nI7+4f8BZJGB0/Dr7LH+TFvN9QWMIkKvlf6yJc290eNxfSUZ2CHJ2dZ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqmCezUi; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqmCezUi"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so490955a91.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 23:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781764154; x=1782368954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3rT78+mh94p30fmddvTsOsxlBAZusjF98/VgMVvL8Y=;
        b=EqmCezUiIoAyhonpK6XDX+5dLcNRbP8M2R/v77ileoMnKS1xeWYVS9mRDwd5S3SAB7
         pOS/K8qfGa/Ahl4VTp/Fm+pgMilsccanm75AIQTpZt1VXlg3qlYtRuFov+mL9tsNR5gW
         cq9h1yyvuDgrXfxvhiaSr5youy+2U3PtSzAA4NaiRZNd7XtqDZS9IuDz9+j/R/4VBR/2
         DU0ZpAwNtIomEwQwFnh19jKCHvvXHyn6k1lC4bsXPT5RBQ4wd4sLNL9PCOhRwkCF6oa4
         uI3P8qcfT4iUz3+FzcKrtLHNfsa4n+zhplOjTqs4fR1Bqmcj6PXLblVkCYV1NPljNbXp
         5kFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781764154; x=1782368954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3rT78+mh94p30fmddvTsOsxlBAZusjF98/VgMVvL8Y=;
        b=o1LgbXVSOvW38828HhMynjdhLf66eFS0PSoB1HBXqjDUn3ITj9U8KY+i8InV4S5jUE
         chm2F6LNwmu06w22MCqcmCD01D2449e1mkV7iybRNZ0x2zZnPLzd7y3vfga9DpZg9R6S
         GuEx5byiILM0aJGR7+DuncXoDlJZ6Y4/Ib3G3YN7x+L5c4a1KHRJUOgu5Yvr2kLiEjyh
         4gv1khfqQkK+CmNW+vJJSCqjuRaIZw/6c1+dHZzl1VcbKoYk/1Ipgk5H4fzrLuArM2mA
         F06rnesnpnnthLfRPO9CvGXwkeC0kfgoiBytlPHUGabz4UcDBLZtu9gqbwp9aDg4Evqp
         BOJw==
X-Forwarded-Encrypted: i=1; AFNElJ8B03wQPUD2xPVZN4A44bRwYLZSBKyvWhJyYgOdLDD1OJUxgVRpbdbZCRdbsefeAPqkU3qXCOKW/+bl@vger.kernel.org
X-Gm-Message-State: AOJu0YzRozLTTYg+s2/X3Lyq6TMPIYQg+GmhCCvueLK9BOKkl70xXVp7
	iKUIV9NJ5nWN3wJLqll8mDZcxLkujp0QKJ2QtB+MBlqTTmSPdj7C2YbR
X-Gm-Gg: AfdE7ckFhkaAsglNHxIwBirqRvXXrkbSGzac9LrSTfNq1Vp3p5jE9dTUq1D+Pjd5hfN
	hk+vTuGCQaWczvy1RFc8I8ve/YKhKhnbWp2RUrZ37SYAUSt7wKEhIqQ/stlxLnFvRaDVrmdmTPK
	mU2JJ/00kb39OZzc48wQnreMCE/T1NY70awMvlVATY3uu8bQ8s3OvsXwQeoDj85fupx5F3bQWqB
	CKuF/2PF6zDNSsNE9vvUN5J/MvVuKH8Hr2gkwj/FYc94OIj0t75kCUbJeg4up63Cl9YxMvDcrCl
	pRiIFDxxIW67UoOHDBVgn+FIMI7GLZjczyAZzHD88dsHAldyT4CtSSVb2EFe4opKe0k3WJ4siUw
	llkVIRRAQovGENHPJlSueV0NJvKDeXiiRxF4SpKZtrU424O59eSypykLhtIiNxmnjf8DEJELWQg
	6m18DhbBgq6IvFSYhav7xcHROVlz7aVzRnEAFT/ozEJ8M=
X-Received: by 2002:a17:90b:4b89:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-37ce449eb62mr2607325a91.7.1781764154038;
        Wed, 17 Jun 2026 23:29:14 -0700 (PDT)
Received: from page.local ([2402:a00:163:2ce9:b105:207e:b570:6867])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521efb10sm8200881a91.9.2026.06.17.23.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 23:29:13 -0700 (PDT)
Date: Thu, 18 Jun 2026 11:59:06 +0530
From: Ajit Singh <blfizzyy@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Message-ID: <ajOO6bx3KmYzhVdy@page.local>
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
 <39228ace-9404-4ade-bcb1-28e763548b7f@oss.qualcomm.com>
 <aiuGjH4qeOIXXgqq@page.local>
 <5c80c430-8bc7-4d03-be7e-c6dd518705e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5c80c430-8bc7-4d03-be7e-c6dd518705e7@oss.qualcomm.com>

On Tue, Jun 16, 2026 at 02:10:44PM +0530, Konrad Dybcio wrote:
> On 6/12/26 6:16 AM, Ajit Singh wrote:
> > On Wed, Jun 10, 2026 at 02:58:19PM +0530, Konrad Dybcio wrote:
> >> On 6/7/26 1:36 PM, Ajit Singh wrote:
> >>> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> >>> QCS6490 SoC.
> >>>
> >>> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> >>> support along with regulators.
> >>>
> >>> The UFS ICE block is kept disabled because enabling it currently causes
> >>> an SError during qcom_ice_create() on this board. UFS works without ICE.
> >>>
> >>> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +		vreg_l12c_1p8: ldo12 {
> >>> +			regulator-name = "vreg_l12c_1p8";
> >>> +			regulator-min-microvolt = <1800000>;
> >>> +			regulator-max-microvolt = <2000000>;
> >>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >>> +
> >>> +			/*
> >>> +			 * VREG_L12C_1P8 supplies the Ampak WLAN/BT module
> >>> +			 * VDDIO and the external 32.768 kHz oscillator.
> >>> +			 */
> >>
> >> Sorry for the long review timelines on the previous patch, many of us
> >> were out for conferences..
> >>
> >> Is the oscillator used for that WLAN module? Would you ideally like to
> >> be able to turn it on/off?
> > 
> > yes, oscillator is used for WLAN modules. Oscillator is powered from the same
> > VREG_L12C rail as WLAN VDDIO, so there is no separate regulator control to put
> > in pwrseq. So I think this will work fine?
> 
> Probably? My point is that you marked it as always-on, so it will *never*
> turn off right now. For e.g. Qualcomm wifi, there's some timing spec that
> needs to be met wrt delays between toggling various regulators and GPIOs
> going to the module, hence I suggested you may need some pwrseq inbetween
> to achieve reliable powering on/off
> 
Right, I checked the module timing requirements.

The module requires VBAT to be present before or at the same time as VDDIO, and
WL_REG_ON to be asserted only after VBAT/VDDIO are valid, around 2 sleep-clock
cycles later.

On this board, VBAT is the shared VCC_3V3 rail and is enabled by hardware, so
it is already present before VDDIO. VREG_L12C supplies WLAN/BT VDDIO and is
kept on. The WL_REG_ON timing is handled by the existing mmc-pwrseq-simple
reset GPIO/delay before SDIO enumeration.

So I think the current sequencing matches the module timing requirement.

> Konrad

Ajit
