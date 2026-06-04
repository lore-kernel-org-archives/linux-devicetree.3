Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCAE410D13
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 11:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780572530; cv=none; b=R1Jedkcgrdje90t5D8d4iHv3XDexczB0M1sg0DSao3dqt7H9pC8RIW27KSFNagxWLPdS4axlM4r6l3JHra+lBsBS21h9i93H+pCtDddyCvAYOAhLs81yrfHKntHxkf6SLgDUJKaKPgu0HOcB84VR0C7IVb564xXSW9roKMZ4wvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780572530; c=relaxed/simple;
	bh=01YYHSUuwLuWDVbKswkCkl7XEsN7XLTXDUwsACoJPoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tt31MCZW69jWAGIwAiNbLmrXrKsZUpsDM2OayzJgWZi5PEXwQdtU9Lrs+xDk7C7tqDc1EC2ObS89bxtFXYMV4qPd08cyN7pkCkiHcD+x+yJbk2PfTtdSf8EBDO5M/vDxAgwccQwrT2e4XYFqoYFj4j64OQCYhgaCicP0xPKOAlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBkelSar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hCoBT561; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBkelSar";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hCoBT561"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654B84981039351
	for <devicetree@vger.kernel.org>; Thu, 4 Jun 2026 11:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LKnE3tc1RlkqqMOtABkKWPKA
	xR6YYffnuCDYRPtMBwM=; b=NBkelSarYTR2VYSxH8oE1QMBbNGlnftrTasO6eUK
	DHBshzwHZfov+rpmJq4C9dIUdzuIatepAx1hFz3JPHESS41Cn2aLvQggmGCh/ADe
	bhnC0i3+wronf1K29Jj0vqFCKL4seGtcYBrqk7/r7duPYIA7BRFHw+efqGPn56qh
	wWirqA8M6EdBQ3fACZayazdE9LqDOSvQxHvYeCmRjbg+zGCQFYzxfhyLplcjsNLK
	5aeUtlVyz1ey3D4rD8NXXjbbTo0cYtRNpWXgeWlSXhqemznjwvn+WussJiJ5lgQf
	i/KgBRBxusu226OLWW5uhiO15wzk3TiTSlboVm4K5linuw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejtj8k3j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 11:28:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85807671b1so378915a12.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 04:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780572527; x=1781177327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LKnE3tc1RlkqqMOtABkKWPKAxR6YYffnuCDYRPtMBwM=;
        b=hCoBT561IykoLr+KPuTXzC5dhj4fb+4rrBUDk53h58nYY67KYC2HaBtOnE6TNdxYiq
         Qzt94Omxo8/3z7ApY62e2aV+vsjywdWz1Q0b0J86VwHs22mRwI570Y3ByvrbLkS4cL4m
         xBr8S0obcgrhmQ6DoCnQ1qL5gPz8JoPcLw2Z6HMUnjaCPak7CmYg8IHKAO84D0xWHdI+
         LZzgL7smrOM8faLHFvDZTosEEprST9mpZn+fGKpyuDW47oxGU/Cx2Rzat8RHDFFyBhRB
         ljHzibS09pNSyx6SPHGEqB3u6UvuIAM4RblIzaX/qwNfuUs9Kt1xP3aWx6GEM9Uy11vC
         ++eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780572527; x=1781177327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKnE3tc1RlkqqMOtABkKWPKAxR6YYffnuCDYRPtMBwM=;
        b=PDJsHj90/bKwArxl+JWauBLm9CirurDwltic9pj7DZmvWTazTUTGEyTS/B0uJ94o28
         UKME4ITvpPWyQkvcyVDQF5aLHDqvhwEXLg17QrJbdZeHfvBHFZKJoJPBn54HYdIUFroz
         BUDc8C6/Qoay8DtdH4o2fJscOgSWNaYbjG0fp5suJ97beNZWbL856UrSfXGz0dJgLqj2
         jR0TGIcqsVP4VF434Z8zDhVjdQIIsbbRINUjko9f/t7Drco8a59FHLvFl5s4LnU1b2vb
         2I5fqM/yszRQ2uXc0qXUdsoTZjaGh4zupTj/TeghB9NmBDPNI+h03FMrwLAuJu0Vg7AR
         Cs0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9L6hLXZr6r4GyKFZCTgCSFPnm73OYjxcBrMdO9LJWyE7/YykkIfkvBd6xFLx20uuPvbEFnDyrkRFCO@vger.kernel.org
X-Gm-Message-State: AOJu0YyD4+AuIh+43B1kmtNA6Hl/jzKli7Im0RVaj4KnXQrEjzp+Z5V6
	+c0WBazWQdHM7ryGgP6Q2G/QI59A5w2lgzCfB+ZUaSqRSna9tch5ajsAG+n02G+nwq00nz5Kaze
	07Cc4oEpP7sQfJEq/jxkl4PmA0Iz0YIl+AMItd0s20qDmSaNqn0yCdDnkhsDwY7NK
X-Gm-Gg: Acq92OGs7fYUZN+Pd1pMVrJbQXc/qqwSbM2bpOS8mTPUiclZN5V3W37z9Vf8VnYdgM1
	gTqYdKcJaEGdzy/oonCWP2TtNb5qyDyRK8qHV1R6m7cd+3kajhQDHN36crwwD3jfQqsQWw/TmLQ
	nNSlGd+33oZ6ZczDUGXqE3QgowZB+ypXRfN/z6ZfsTIXs01qnm0xh8ej/RIAhaqDHv0J63vjNkF
	YV1Ih2l86WUjuHq9X6gIS+5K+picgTK/CQCn00IK28QcXqrDbONoPKNi+ZiKi0XC6lIzDkIMqj8
	/+PNFTVBKLIh7+yFj438k5/Fkgcf8aHDrdzTNNI73fAhteL4oddjPrXQ1a5hbD65ACbnohDgIkO
	LR323ERwVSZAqrKRIxCLScUehpURavhbe92Hbg6NZAjnp2/JEu+yEyXKAchOkPk6kBoqBehNTk9
	SO7cDDinbNJ08ZdtuCKILri3PDTj5XdY8tZby2cY8/4yq5QuFdCZm5rKRBJUqz5Q==
X-Received: by 2002:a05:6a00:3288:b0:82f:1b1b:e166 with SMTP id d2e1a72fcca58-84284f23ab6mr7402411b3a.33.1780572526769;
        Thu, 04 Jun 2026 04:28:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:3288:b0:82f:1b1b:e166 with SMTP id d2e1a72fcca58-84284f23ab6mr7402388b3a.33.1780572526325;
        Thu, 04 Jun 2026 04:28:46 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282374300sm7278706b3a.20.2026.06.04.04.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 04:28:45 -0700 (PDT)
Date: Thu, 4 Jun 2026 16:58:38 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq5210: Enable PCIe support
Message-ID: <aiFhZsaZJoXzuMSk@hu-varada-blr.qualcomm.com>
References: <20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com>
 <20260514-pci-ipq5210-v1-2-a09436200b35@oss.qualcomm.com>
 <dc7cb371-e94e-4f42-87d6-70f0f94d0d49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc7cb371-e94e-4f42-87d6-70f0f94d0d49@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 2jBuvsYCIYysAXOFr9xRqejmy-I9oFJf
X-Proofpoint-GUID: 2jBuvsYCIYysAXOFr9xRqejmy-I9oFJf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDExMSBTYWx0ZWRfX8ImfnAF7Q0mH
 24/2UJYTpQejB9xjxdXgjgd+5ZeOrb2YHrMRI4ZDDo/HrXfGSbr0RDG3feo4QUoJVLl2IR4dmqW
 srkMhz3FgZPmutiY3ogMb3/8teKKnkyeIhDhpN5IeOaeiugPJW9xN14wx/4udGel34sv15gH6C0
 W3jrM4joliiXnnlzO30L0P6s2GYWqonhpb9qpkxB8mibakfAnIrlLk5E15tFo3ev7vPez+w2X9T
 vWoOgN7blLmenwtZyHAwigOMU0oW0kE7AUEZLLnFJmTuE6oSJJASXaB2e6X9st+s4A056X8DyM/
 Ud8dUDsnRyfcM/FYgDLnorZ2ERwLUIqe8+oxnX+utcIRmzDi6Hx10kjmak55i2zOkfdLdvA881m
 TyC6VBFh6HdXOO3Ve2K4TpPZRzZGjywCnbdDKFrmWTL7wtZ7GENN8rv7S6j6GEue7HHSKQA3m3p
 Wk5nX70W1gXnSXZ6dJw==
X-Authority-Analysis: v=2.4 cv=f4p4wuyM c=1 sm=1 tr=0 ts=6a21616f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XMczTv2Me4NSQKEp8ncA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040111

On Fri, May 22, 2026 at 02:24:45PM +0200, Konrad Dybcio wrote:
> On 5/14/26 6:13 AM, Varadarajan Narayanan wrote:
> > Add DT entries to enable the PCIe controllers found in ipq5210.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
>
> [...]
>
> >  &tlmm {
> > +	pcie0_default_state: pcie0-default-state {
> > +		pins = "gpio32";
> > +		function = "gpio";
> > +		drive-strength = <6>;
> > +		bias-pull-down;
> > +		output-low;
> > +	};
> > +
> > +	pcie1_default_state: pcie1-default-state {
> > +		pins = "gpio29";
> > +		function = "gpio";
> > +		drive-strength = <6>;
> > +		bias-pull-down;
> > +		output-low;
>
> You shouldn't need output-low in either of these definitions (+ sorting
> by GPIO idx would be extra neat)

Ok.

> [...]
>
> >  	clocks {
> > +		pcie30_phy0_pipe_clk: pcie30_phy0_pipe_clk {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <250000000>;
> > +			#clock-cells = <0>;
> > +		};
> > +
> > +		pcie30_phy1_pipe_clk: pcie30_phy1_pipe_clk {
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <250000000>;
> > +			#clock-cells = <0>;
> > +		};
>
> Why do these exist? Just pass the QMPPHY reference straight to GCC

Ok.

> [...]
>
> > +		pcie0_phy: phy@84000 {
> > +			compatible = "qcom,ipq5210-qmp-gen3x1-pcie-phy",
> > +				     "qcom,ipq9574-qmp-gen3x1-pcie-phy";
> > +			reg = <0x0 0x00084000 0x0 0x1000>;
> > +
> > +			clocks = <&gcc GCC_PCIE0_AUX_CLK>,
> > +				 <&gcc GCC_PCIE0_AHB_CLK>,
> > +				 <&gcc GCC_PCIE0_PIPE_CLK>;
> > +			clock-names = "aux", "cfg_ahb", "pipe";
> > +
> > +			assigned-clocks = <&gcc GCC_PCIE0_AUX_CLK>;
> > +			assigned-clock-rates = <20000000>;
>
> Is this clock supposed to be fixed at that rate, regardless of the link
> speed? And is the default rate incorrect?

Will drop this.

> > +
> > +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
> > +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
> > +			reset-names = "phy", "common";
> > +
> > +			#clock-cells = <0>;
> > +			clock-output-names = "gcc_pcie0_pipe_clk_src";
>
> Having a gcc_ prefix here smells fishy..

Followed what was used in ipq9574, ipq5424 etc. Will remove gcc_ & _src.

> [...]
>
> > +			clocks = <&gcc GCC_PCIE1_AXI_M_CLK>,
> > +				 <&gcc GCC_PCIE1_AXI_S_CLK>,
> > +				 <&gcc GCC_PCIE1_AXI_S_BRIDGE_CLK>,
> > +				 <&gcc GCC_PCIE1_RCHNG_CLK>,
> > +				 <&gcc GCC_PCIE1_AHB_CLK>,
> > +				 <&gcc GCC_PCIE1_AUX_CLK>;
> > +
> > +			clock-names = "axi_m",
>
> stray \n above, also in resets

Ok.

> [...]
>
> > +			pcie1_rp: pcie@0 {
>
> pcie1_port0 for consistency with other DTs, please
>
> Same comments for the other port

Ok.

Thanks
Varada
