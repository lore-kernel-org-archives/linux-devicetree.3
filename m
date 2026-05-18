Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C443481668
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111016; cv=none; b=RogShDaTfpFGfnr9kcdo48PQlj2fiRhXEQ54ndL0tQIpLjeGtwpfPYmnmiQZUhM6mEqaVQ2QgEWGjT1vA6N6QE6J6jk+N7pMtZRrp4o7QwqjorsffO/pGoyc2LiZcVtRQh5NxSI/oR2tzxaH3lzz8s4BKVyD6cf0uCe+7SeloLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111016; c=relaxed/simple;
	bh=mu23A1aKnbeL7rnlaNrVWc1PIofIv55ss+9iNQCP2Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiZcxumczIreMQzmSiEh5Whwdxd+yW/xtDu6k6Dlv1PywA4+UfOU2nT9qzPDlkSkcyzN1ZHmhuDg3/w1xJSjZQL7D5Xua39klUfZPHamhiKiZB9hRvTZL0BQgRbVfupfCYS4ocW1IXN3JZp+cGWBw2uoBpTT/LteI5c9t1OChLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDUYHZCM; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDUYHZCM"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so878533a12.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 06:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779111015; x=1779715815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jQopvD0wIDefYue48AQBWjS2nKzSpK8pu+iCNPo/i64=;
        b=iDUYHZCMncKajtPHSi8bBHhTyhh/EVf1wSmGb2juYgOFr7QUGxUYXBML7NX7GrWvlQ
         uQrvt+As55ET5qGAtcpNAM9b6lzcfB29d9srLeJ+hKBjPy9jcw4G0lR/tVuEmWfNfKvt
         vORdBR7W4UgQ46HbwX/mt8ogr/wk5rUd5nCAVhiuBpea98fCvKC80ppWeWOFa8M7V//h
         y8ttnsAMcDFlHYpWNZbz2hVRLQ8NQ+ZOhi434p6JIlr9uzG7zVRseCqBABc8wfUvnmR8
         z7dRiBjaX1jhCDxdq+vl4niW+JizVVrWtWGK+kzJ5renFyv6RKAU0IkuIP4BUTHWSMDP
         E7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111015; x=1779715815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQopvD0wIDefYue48AQBWjS2nKzSpK8pu+iCNPo/i64=;
        b=fYdCrxLD+Yinw7hP0Tz/Us+PPeQBt4EVnXwqZOQI0wF39OxHgqikiNahPvv+f+pmhu
         651QCnb+cPFzqWhoMGnvgkn4skfteevwqBTh9kx1Sq23hJbXwWkXhPzB2T+3fab0qrPO
         Yo8wAUt1LNTIvIsQLpjQwk8+ENy6qBaOKQg1jHq/Iq7Bh+l0yuxI7eq/1surJQvh1+9m
         g9ktogDv/iRWSSwNm6SfC5ycKsn6/LVPSgMB/1bIQN1LIhrzHXX/IzbMtshU/3yScbam
         H2Bjtl4iJLNTgVLKqAZ0XChrUEqD8iXnal1c2olxk2/Z8II6p5Q3GVR3pUhepvdsxEbA
         z1Zw==
X-Forwarded-Encrypted: i=1; AFNElJ/lLTyhIsY4pFevNqgo/iuJvIwSXO0NuuiaQaE6sxX4zH876cDxPCSueMctRPB20TlXKB+G2ut1xDYl@vger.kernel.org
X-Gm-Message-State: AOJu0YxzBAPgzSbVgHIDwjUMkRED9IgYG+MhuElRmmGRouUTF7h0BQrJ
	zMkRHr6aNcbx7bUzmIA4+je5SbQZlV0h6hgFzq6IFtwZvWRYOHk0YdSGc94ojg==
X-Gm-Gg: Acq92OEfZhizpy5WX1VirlYbdjWk21UpRhZWstVt492YgUM+HI2BUIbe5wc8rcVOHkt
	QPZt+gzJQB/sbSRdY/6NvTt7AEJt+QiNIWSB41TbWgJrHuRMMTD+S8jt5ypja25r1LWIhcCH8PR
	L7JbxU3uv0/l64MXaxoLpWVzcsstF3oHsxt9G1n9EBO+wx+xRyTzEi2zkJ2Vt6OxhsJ/EOb2XLp
	RoJFL2QBUaJ9AaCZeEiKpCv57S8mS6ZiOvkHD/Fo6i9clXYetyjxragf4fcwZ9Z2Qn+0/dsLI5a
	qSU4BMvMRHFBP68PJTvUSFEjwIqm5Rfn/NUX2Z7h7ruaJ/fv3fpW4VgPS3ZOoAEpOjf9w67eR4U
	AavendVXOkPSaJ0l0pGXz/knMZJj11KmUEz2SXSQ/y8nHQtGhKc07NdC+FrQVaz9drRM4eQly2E
	tFReRWXm5NAh0Ls281uzsflRhtQjR4apRz82fEKeHXCs4=
X-Received: by 2002:a05:6a20:7f93:b0:3a2:d79c:4149 with SMTP id adf61e73a8af0-3b22ebc3ce2mr17090144637.28.1779111014583;
        Mon, 18 May 2026 06:30:14 -0700 (PDT)
Received: from page.local ([2402:a00:163:2ce9:3133:cc85:b107:9191])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1231c7sm13912652a12.31.2026.05.18.06.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:30:14 -0700 (PDT)
Date: Mon, 18 May 2026 19:00:07 +0530
From: Ajit Singh <blfizzyy@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Message-ID: <agsS5SFk3kwffBL0@page.local>
References: <20260518110435.16262-1-blfizzyy@gmail.com>
 <20260518110435.16262-4-blfizzyy@gmail.com>
 <eb04cc0c-f62d-44d1-a78b-ec4fea7891c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eb04cc0c-f62d-44d1-a78b-ec4fea7891c6@oss.qualcomm.com>

On Mon, May 18, 2026 at 01:44:25PM +0530, Konrad Dybcio wrote:
> On 5/18/26 1:04 PM, Ajit Singh wrote:
> > Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> > QCS6490 SoC.
> > 
> > This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe,
> > support along with regulators.
> > 
> > Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> > ---
> 
> Hello, this looks good overall, I have a couple comments below
> 
> [...]
> 
> > +	vcc_3v3: regulator-vcc-3v3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vcc_3v3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		vin-supply = <&vcc_5v0>;
> > +
> > +		gpio = <&tlmm 113 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&vcc_3v3_en>;
> 
> nit: Please put 
> 
> property-n
> property-names
> 
> in this order, consistently
> 
> [...]
> 
> > +&usb_2 {
> > +	dr_mode = "host";
> > +	status = "okay";
> 
> Let's also keep a \n before the 'status' property, file-wide
> 
> > +};
> > +
> > +&eud {
> > +	status = "disabled";
> > +};
> 
> It's already disabled in kodiak.dtsi, you can drop this override
> 
> > +
> > +&usb_2_hsphy {
> 
> Please sort the top-level &label references alphabetically
> 
> [...]
> 
> > +&ice {
> > +	status = "disabled";
> 
> It should be working fine, any reason?
ICE is kept disabled because enabling the ICE node currently causes a
fatal SError during ICE probe on this board:

    qcom_ice_create+0x90/0x274 [qcom_ice]
    qcom_ice_probe+0x38/0x80 [qcom_ice]
    Kernel panic - not syncing: Asynchronous SError Interrupt

UFS works without ICE, so I kept ICE disabled for the initial board
support.
> 
> [...]
> 
> > +&ufs_mem_hc {
> > +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> > +	vcc-supply = <&vreg_l7b_2p96>;
> > +	vcc-max-microamp = <800000>;
> > +	vccq-supply = <&vreg_l9b_1p2>;
> > +	vccq-max-microamp = <900000>;
> > +	vccq2-supply = <&vreg_l9b_1p2>;
> > +	vccq2-max-microamp = <900000>;
> > +
> > +	status = "okay";
> > +
> > +	/delete-property/ qcom,ice;
> 
> similarly here
> 
> [...]
> 
> > +&pcie0 {
> > +	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
> > +	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
> > +
> > +	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
> > +	pinctrl-names = "default";
> > +
> > +	status = "okay";
> 
> Is there anything interesting connected to these buses?
PCIe0 is routed to the onboard NVMe slot. PCIe1 is routed to the
modular HAT connector, where the attached endpoint depends on the HAT
module, for example Ethernet or USB.
> 
> Konrad
