Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481A435200D
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 11:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780830022; cv=none; b=iGBv6Kn8B+lg4MyAIsfeuVBEKpvTyVDiG9kRf3gHndJwM+vnHcYFceUJNERT/9LviRcHWYBxliuP6bBmQqmsosmLS7SEMcFabiCwWw42p1+NR1LnFw09GRdtDe6Ipe8Jl+kWPxeZxTpn7k0hg6x0hkJwTlwNXaSqtPiVh4fLKzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780830022; c=relaxed/simple;
	bh=8/nHMOedf7I9M3RkF84w96H8uyliRHWJB7ZgrxBpDyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ke88AlgAER/N2nURnQQmtR89Kxw0zHt1LnPjBw0tkAE1lQMIqHWpdnDF1G8Xp7q5UgzIanePZs0N4OZFD+sl8zz+kTXPuUliCxHklZqebNaiHlp7wVYJebRfDW413EEKtwLK9EQf1RPgxtf/SMwxjrSrimXdtQ8WzHgcShcP/+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5yQm/Gf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5yQm/Gf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso29861785ad.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780830017; x=1781434817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1E/I/zN2uqhOEJWozYb2HyCQ4vBy69WdPknVxIge1Qg=;
        b=l5yQm/Gf6g0SaqvsIXlfkCSVCu230a6paHhWOSNV/kAxVQM/klSzLX9wowUCMDAx31
         kv23hAk/7LUdxvLb8Vd0lLdoA4Uz+XIplm7HYpj0YFujUch0ZdLQol7RWMrIl3li+mWy
         Y0gWJ/jHIMow0lPDE7sYIASyo6bOiO2PoLEjbAbzp9PWbI8lQby9bLfG9ot6wP5WdkuM
         VzBKNC0Kn1ouVYIb2QSIwbB0LeMvzfnN0bDIRBHlDNYjPuJB4zkk2UfXvEuemlgW4OsG
         p7Br9kkIWFVL5iwNUOGBF6MQoBo6iAcmKYTsWdhjAbr57u0Nkx6GJvrMFv76kofTXruh
         lC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780830017; x=1781434817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1E/I/zN2uqhOEJWozYb2HyCQ4vBy69WdPknVxIge1Qg=;
        b=X6JYr4db4JKlZE9knDL+ZIBsNlsbpP3jeN+3yLS/FKKoDkwffUFFWkzUGzssZPnVIE
         n8UgWuyy9agf0+EzkboRg5GqpsdeXsK7CbVECrwoEpYnyBQNLWmdZ59rHScXlSXG4IvH
         cjT4B+B49i9mMiboL6kXxBfcVRlvyWRXC5DvnGoXO8bVWjkMjjjz3/XA9FsT0E4KxkPn
         XPEzRyMz3yFvwT0EwurHRl6TP0k719vfOoyTlrFDNRNiTprP0vt18+2YgDxMR3TOdj1V
         QTNqcx/sOSzUgqowWPJwyGj2jQEkeni0OW1JekU5wM4ULgZc6LCFfopLdlMOxdiCWCPp
         OqoA==
X-Forwarded-Encrypted: i=1; AFNElJ871RxdsB8Zc7yKKJ2MchKBAvrZ24fFQm6go8bLNM09x3JUQeFigQ5EVyRWfuNwpjHZMCK8+LMYmLmg@vger.kernel.org
X-Gm-Message-State: AOJu0YyAOfTI8Impqq+inwmDvT0ze35tO94yxZf9FAAa85BHvYDthV2I
	EluY5N6deWiwt6AVPBybV1ofnA6Zl+cA/K2HRn7E9RSFrpyPk81sfG1D
X-Gm-Gg: Acq92OFx80heeZE87T4Ay/29h5aFnSk36HM4Ki9FyeuQxVdgXi2i2TYdB3xF6SXYCPj
	y0EJsa/rxz69Xn70hldf06ddz/ERRl0uQPO5jWAuWt/eOHB7UMGrPidLTO52+msOHqs+IMPqt24
	i377nVtUfVDSycrVbmMvkITHKeLJYJx5uvcX+RNz4CQgfjJQi/nla1+FiwIvwe6ROk5/NMZqqaP
	iIjLPYjztuhni3pewlKNP8JCpr68OeOIglrc5PhcZ+7C3Y4NeEMqLzktKzl1Wc3xqWytlQbADLj
	7ze5y8dbtXeHRkB9H9fQkXYxgCFvFA3gAiRlc2oUQHS/ZyvdgVICx11s9ZDlmSFe8GNrF7d40Cr
	KyvUpbEpcWbVaVSW9uEFhonIDj24kyPF6lpSMD9rzdoB86BliGmjCKfu8R9PfIs53rBU08Y5P9+
	PALyq7e3RVZkI/t25jjxmJLxF2f0yPFnyZlO6/HW6HLgvBExHn9/TKu/pC
X-Received: by 2002:a17:903:1206:b0:2c0:bb2d:a314 with SMTP id d9443c01a7336-2c1e85aad3cmr125353995ad.28.1780830017281;
        Sun, 07 Jun 2026 04:00:17 -0700 (PDT)
Received: from page.local ([2401:4900:88b6:5847:b159:e15f:b4ca:e80d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm154398825ad.27.2026.06.07.04.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:00:16 -0700 (PDT)
Date: Sun, 7 Jun 2026 16:30:10 +0530
From: Ajit Singh <blfizzyy@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Message-ID: <aiVOZDqBGq_hal75@page.local>
References: <20260519125655.23796-1-blfizzyy@gmail.com>
 <20260519125655.23796-4-blfizzyy@gmail.com>
 <ny26r5a2npafcryx4z2xoyzkdbp6r5vbdoc6asyfprw5q4hgzh@ukbc7kfpzsle>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ny26r5a2npafcryx4z2xoyzkdbp6r5vbdoc6asyfprw5q4hgzh@ukbc7kfpzsle>

On Sun, Jun 07, 2026 at 01:17:43PM +0530, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 06:26:55PM +0530, Ajit Singh wrote:
Thanks for the review.
> > Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> > QCS6490 SoC.
> > 
> > This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> > support along with regulators.
> > 
> > Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |    1 +
> >  .../dts/qcom/qcs6490-vicharak-axon-mini.dts   | 1025 +++++++++++++++++
> >  2 files changed, 1026 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
> > 
> > +
> > +&pcie0_clkreq_n {
> > +	bias-pull-up;
> > +	drive-strength = <2>;
> > +};
> 
> Could you please add a /* pinctrl */ comment at the end of the file and
> group all pinctrl-related changes after it?
> 
Ack
> > +
> > +
> > +&uart5 {
> > +	status = "okay";
> > +};
> > +
> > +&ufs_mem_hc {
> > +	/delete-property/ qcom,ice;
> 
> This should be explained in the commit message.
> 
Ack, I will explain this in the commit message.

ICE is kept disabled because enabling it currently triggers an SError
during qcom_ice_create() on this board. I am keeping ICE disabled for the
initial board support.
> > +
> > +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> > +	vcc-supply = <&vreg_l7b_2p96>;
> > +	vcc-max-microamp = <800000>;
> > +	vccq-supply = <&vreg_l9b_1p2>;
> > +	vccq-max-microamp = <900000>;
> > +	vccq2-supply = <&vreg_l9b_1p2>;
> > +	vccq2-max-microamp = <900000>;
> > +
> > +	status = "okay";
> > +};
> > +
> > +&usb_2 {
> > +	dr_mode = "host";
> 
> Is it actually host-only?
> 
Yes, this is routed to a USB hub which exposes two USB-A host ports. The board
does not use this port for OTG or device mode.
> > +
> > +	status = "okay";
> > +};
> > +
> 
> -- 
> With best wishes
> Dmitry
