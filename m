Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29C63CFF7F
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089728; cv=none; b=dYyzohWeKFjSwKoxpvCeub3A63AKxHEJrZhPfLooIfEGjGjD2zRgEhx2jEAN/2pTyzSishe0o15XvzDTaA2+7AZKHJVfjtDEGdMLkvSKjVLA2aNjsv2bC0S26foPiD/9DcAujk2330qrSRosV2td+pCWsGb8kHq7gXGOyMYKZNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089728; c=relaxed/simple;
	bh=BexIPO296HHnFB3egdyhM4wdn60AvBo4dBPn8kuz0ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZZd/JOJGm95lQ/xXVZLrJrVQqgMrR1LMRyff27FpwW/JlJrPcWKJoSsyBUZyrnm2gxBTag8iJ3Ut5b9Sq2Hv8w0LvzBxCtIrMbA12cZPwandJVNUCyEK/vgOoV9HMaKuQJ5oCGsezyjGu+XMitxCKvLLthrzJM9whhg+KujziE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tlssev/n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtaQhlls; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tlssev/n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XtaQhlls"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663AcRlc3134737
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 14:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2H6q9Zu+ilnyHf6y5X57NbcUQFjDlhgAC/o/J13NTY=; b=Tlssev/nT1E8SeJk
	qnm5RfdWZV8A5Tui6ejIq95X8B59z/bgKOhBO2vmIl9bqgoDqcIhjEWwFwQam87v
	2Dyh7yCuviBX6YzEVROANuSIdTPOq8ld23TscTADHEPMRbLJD/WCILcQfyZEoiJD
	mp9BTg2PS1DyZOxy+PS1ynp/zPzrZRzGvro1dQV/YqBTmKJgzear7MuFwYjgH4jo
	EwjqCpprKPxU9XJ0CkmJK4cA7tq8NXDdPHsfLyRwSHzGeraXb0yDAfyqsGZOy6bY
	KYFmmpE5s5G2vOOXnCkMuEvJ8pvOZ4Ik7JrtZZUYpDLQ0veR3fQTZmb2Rcv+UuaF
	PIUEzg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcjgpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 14:42:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380c178acfbso621022a91.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 07:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783089725; x=1783694525; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N2H6q9Zu+ilnyHf6y5X57NbcUQFjDlhgAC/o/J13NTY=;
        b=XtaQhlls5uklr0tfn/KLqoNL/iCcW5zP/96eMGhi72Fko1Aq0gofERD5P+dU81O/Fk
         aSAKp7MTs6/++wbKfq4RdcgtgV3dLVftLF3kL4LYQVtMIHeHEK+NSznbsk5OENvcgEzS
         rPRbEYIiBKINf4ZR4B1tp1FUYZ+3tWUKcpFN0qpApGoErT2AnbRTpYho210vmuPExdXc
         V2LiUWxEoVhFiNUwrPdt+ToAzrUsQvHsRdrDQXqSHWdXwrJo8O7WGZK6myLfsFaqcJ6Y
         M15LedekmB2vJD5cPq0jmTVBkIalE1PMcprajEIn5dZBuPB7o3eYGM9k8zKysnDNx3q6
         JcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783089725; x=1783694525;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2H6q9Zu+ilnyHf6y5X57NbcUQFjDlhgAC/o/J13NTY=;
        b=aEez8PegN/nA+cxAQ0Snq7kGNcFmwc0R61ZBOI/cZ6bOuGLs5K8s+Kw7S7NZ+4g+8Z
         R3CXMq/GwNEVIR+VKV16ArUPaRoM0w+sm5pqYxgo1+aUzQgfIjHY9NxIH1Or/N7AmLu0
         jF4IbX4bk0X3MUC7fOEJRzl7p5HejNgpOolpyaE/cjjBCKjMdYw9/ZSPMYXFqoy4RHdU
         /EIQO5CRMLyvatQM3a5Z7lISANzeXBTuQCwJsT6MAWnl2p2Pc65eXSOCOyOdsKnTXmka
         EW4u8KXkzS6PADZhiPg1IkNB2ME/vv/ijb4c1nLCNCixjwGtgCf6cY62g2lQkmnzkzWQ
         9gdQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6M+yIha9SQkvt/hB+Bf3pC+Iwc/8/kGR+Z5Jk/JL6yoCpTHc22k9iPBGP0zscPSGPA2JgVTX6OYwT@vger.kernel.org
X-Gm-Message-State: AOJu0YxK1rTt8Op4zESzlmvvtGouHY5G3TOWNue5+uiawf39iReHeG+4
	2kKl/bEQQ7Hy2ofqxQALaUrYodhOBFzsau51Ct5sAWP/jKtDau62rzxcY2s77TRJGDdKRap0WKN
	h1S+daCB00d+9X9Al+/K20o3rwA1r1NQ+iF9u81y3CDcp4cHgO08xyX4rwruEUMsD
X-Gm-Gg: AfdE7clQ27qyl4cb8O10Fb3iM9d3/YcauQbYksg1hM4dS/8zRRVRfb1OSTRa7SeTBHx
	yPqBHwGZq4J6w+j+Yafg9gwq+vAjUROfceHxxGK+q+bHllx+NC1DIiSkGQ45KdMzQL4y9mbbe1A
	6teeC6U/7gQSQS2zqrSGe0RRipaPyiBT3zT2LNMhy75aU55xzxjQPdNL7OhLBahoeEiZ/EuhO22
	8w8ox8dAxH7akAvvJ5fY3yCZj1t82BKVlg9SCSCr3HNYQWULmma9Iqyz20DDl/xlK6PGc9QGB/v
	kzdWgN/LiK2jU1PxYeXlcuqtezie0KyQIR3XTMoa7Xp2EeH8YFbflqV9mgOXex5Mv8d+iFFGEUj
	W84uEZJ6CPVlro2L9Va+WHaCvTbbH0qcvJlGxxuSaXJ14ih4ZDnWXTDeONjCv
X-Received: by 2002:a17:90b:2c86:b0:381:12d5:1ab5 with SMTP id 98e67ed59e1d1-38112d5279bmr4867922a91.0.1783089724539;
        Fri, 03 Jul 2026 07:42:04 -0700 (PDT)
X-Received: by 2002:a17:90b:2c86:b0:381:12d5:1ab5 with SMTP id 98e67ed59e1d1-38112d5279bmr4867896a91.0.1783089724068;
        Fri, 03 Jul 2026 07:42:04 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813d37sm22291528eec.10.2026.07.03.07.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:42:03 -0700 (PDT)
Date: Fri, 3 Jul 2026 07:42:01 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Message-ID: <akfKObyUaMZTe7Fu@hu-anancv-lv.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-3-b706c4c9b3e2@oss.qualcomm.com>
 <20260703124129.57CBC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703124129.57CBC1F000E9@smtp.kernel.org>
X-Proofpoint-GUID: v8jb6uCvPghdFBHo1hVK833NcJhrn-j-
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a47ca3d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=PhgMLKQm4wwpdYDLYX4A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: v8jb6uCvPghdFBHo1hVK833NcJhrn-j-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfX1rBv4jd4Rikx
 3+9PgeugGJwGlXK3cqoUeadEqvn+LZbk81AkaDOQX5Vwcv9F60mMoEhq5UgUeuOF89rE5h6xW3X
 VYIFU0o2rKFVlhaav5A8exfPJoAOJia0tT70K+U6qYy9ooEcnWfG0GWRskAf+4nO1/i1Vww8AJC
 SR+p8Tu7Uwe0GTUHHdnvRFAhD/Gv7mg+pEvZaQvYN9end/a5pQRdWmpbEoP0nuIHZK9WkJD9tF8
 iGjgJEHuWSJv+sLW79E7Yh+VBQxvk1IAyeaELkr+dSmxk+jQfkAJGXgykCoLY9eZDsRuzkCVXdF
 xPCx7M4rLqq/DuxSiy3+d3NLG5GOIy1LbI+ZVXV8exKdW0v/msPrPag9V4Yq59QagqS1l0KBNH4
 7BPw02i3NJVc60kK6MPy+zt52Zc3ow6Y/EVcGj6xlM/HpvwfjtK6AAWma4cIFPtAJRUVbHjBUdS
 eC0dNonHl5tf89uwgtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfX1Ld7c7AoJQ69
 59/J1PzdMJjTdmNvU9sL6y7KGDsQR2S/Fgma1ljVQj/6J3RYUl/JZ91YefAqToQLiSoLxXOH6OA
 JudZNWV6FaM+KYPj4ukHs3oYWdZglkY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030144

On Fri, Jul 03, 2026 at 12:41:28PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing fallback compatible string for qcom,glymur-soccp-pas.
> --
> 
> commit 13add5a1ca37328da1883f3c5d77042558d05a52
> Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> arm64: dts: qcom: add SoCCP DT node for Glymur
>     
> The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.
> This commit adds the PAS loader for SoCCP on the Glymur DT.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index 5f44f68efde27..bc259dfbaf0e5 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> 
> [ ... ]
> 
> > @@ -2297,6 +2297,50 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
> >  			};
> >  		};
> >  
> > +		remoteproc_soccp: remoteproc@d00000 {
> > +			compatible = "qcom,glymur-soccp-pas";
> [Severity: Low]
> Should this compatible string include the "qcom,kaanapali-soccp-pas" fallback?
> 
> Without the fallback string mandated by the device tree bindings schema, this
> might cause dtbs_check validation warnings or failures during the build.

Thanks, this will also be addressed in the next revision.

> > +			reg = <0x0 0x00d00000 0x0 0x200000>;
> > +
> > +			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com?part=3
