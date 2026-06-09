Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808E73DD505
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995315; cv=none; b=d+zFAMrGLOwHIg3tC8mu6Dgi0pHZhoG6Zg1yBnPsOkCRABguXFRm/lBvkJRyYlCpRVQTU/CB/iaZRTeJ0xMUlcOH2sIXkyjz42yvtVJvvWG1IVD+/J0lpXNJTuzhiJOW2wMvUCH/re/+n6S/hOcMeHS3nGvwqJf6KiCE8BvV9kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995315; c=relaxed/simple;
	bh=h9V3u/OiCnl5ZS9ocKyhPt2rN2Pvuizi9nwn3+nVBMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2ywJV4HORRcozOUkzAGE07dIM1gHY3uh7w6BjOend53rjbDfGEWiWml0zzJ3fxCjlj9v0mmQ/YQ9lOD/CpZPu3As12bIieHR8s/seJEojUEzeX/lDlwBis9v7AlfpnvZSaOsNvwRsMUJLAKmV49Ilf+LC/6QRstxzcepQE67x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBsDlkEj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QM1BptA8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBsDlkEj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QM1BptA8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rf2O1568427
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 08:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLYWRFVd4agpSkA4ve4FH26S0PlgWXtJl9MHDrfuO0Q=; b=RBsDlkEjVIkmba7o
	qudUOfewqddNaFkDnMxd+qeLnBDD0TghwZf80/WvSYAaa8B0mb0ske+AEfBTA/Oe
	hBW8RtGo80xqTUWx6I6WJvI5COU2BJ01E09Bn8zZc7EjoOT9WMIKva72hzubbm70
	zQ9OrJRdGFvEmgKMV+m1H/6moZQtJfpPvhtvXM6wntAwhqSmJWWVA2dOhT+XgDQo
	mZ9Mf87YO1mhlPDZYuqkq1FevSDHHoDHMN3D6ScNxf/7kW4eHxad8F+ME8uCjhja
	avn32XWzI8eFbqKE1el1YLi9jIMBxah9NspmmTwrQVw3dpXyu4hQLZGR7fJ8XQhq
	jHLImg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx467ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:55:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51787404d3eso94368491cf.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780995312; x=1781600112; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WLYWRFVd4agpSkA4ve4FH26S0PlgWXtJl9MHDrfuO0Q=;
        b=QM1BptA882+ACHxQOh5yqKZA6yasYW8SyzXF3nLhpBGWHUwgNh5wLfY/bezCE6yXmE
         0AcMzaG6TQ9gEWIRFg6TB2NIiHz9ZD9D6o9Sx+JpHz2x5z6YIqd/3tFNF9Jjyyvpl564
         F4ceyPuH6q+BwCNwVYFEWXg4XxNZUnBtz0ct2vL4qTxsiRN7k4dbTbU8kTEvjQgaUfdt
         WUcO98FZnOjwFxQDjiMHVyQSE8P7KQtBSSNNP/uxfJ/ns9lgJ/arAkd87MS7zoLp+JX1
         M0T+HoO3IXOqag3upIoE0yWhqi+meUXn6j6A4XWtSInWuxf7GEpYo7rkaR/f/b3aijaz
         hniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995312; x=1781600112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WLYWRFVd4agpSkA4ve4FH26S0PlgWXtJl9MHDrfuO0Q=;
        b=s16Pb5ETAfh7m9JEEqV/+UE93J2lM9/b9ZVeSt1+RKZ8+StFGhVEnj8pg1hw6pZ7sG
         GFXxwSLfc40ACOHAlFf7YNDjifiMGvlBemlaoU7P5FP5eAnQHuvCIgiAdykOjAV2bt0M
         rTkZGPnIMMhDXoupoFKBUJr57DbXa77F7tUqQgYX1ouFpNXlTuge9noolNZk605a8nuV
         QQ3mp5A7SZAwS0w+HV0VNc1lz4aLvV6X9lsWhHYGaN+VCInddiXBF2JO2Nma3ZxEeVvx
         3AiunoI11sCzY3lttElOaIfUQNY7S6ygN04rmMqLHC2qhYx7uB3p024auPYcxwEZcZdP
         AUEw==
X-Forwarded-Encrypted: i=1; AFNElJ+xchoqFsoEZ0+nCVU9qQHIBt9k+MfLlcQTMgZ2YhEsx//Wx/8s5T/QzWDzrxzb7vkf6LkfNc+p3MvX@vger.kernel.org
X-Gm-Message-State: AOJu0YxrrkAqTyVp2Sb58HodCgu+a+CzP/nEoeMT9Sv76G4VA5nT0jgf
	wFMWT0HAtzOkuU/eMiR7R06CDFTLbZOifRS9cj5Yu/iuxeYQcKe1aMfLgriGlSwoAiRYWZS/8Tg
	a9pTdtkO7y72MAuhOI/dOIoF8ZmnoTOUb3H+FVEx/XYi66RAzHEIMDIEpqxZgoimD
X-Gm-Gg: Acq92OFbqvZRoiFgpzhfSQg1T715qltFwuUtlvLTEgHnT/tacbInk2FNPhTiAAFTGYD
	uCecL5MHJlpOFP7cDKgR2BwKJuElWvXd5AHsy2H4muU8B4SBAkVRXMJXexiuxpSkiRBVbmudPu4
	RgLtkjoS8l2S/bareZ/JLjpnZVDdnJUa+hZ7t5e/x2AwC1y6N6gKUp2iGIaJkBX2zGXNi+ytRm0
	0CAUvkwvt4uR1OQEqAgIj2yQ2fS24Sgb/PpNFP8AKwEpz+kEKhAfq6szr9lRwmSFqXaC5LfNXt+
	l/PEpQIzAzmYkZr1Zx85kGG0V9bB3LOXzNmmDKzLtoAJPbBF3r0wok4H3aYKUsK/drwJZkdLgN/
	pvhtOAlZQtV0lX4GYkf1T91GXaR0LKLHPzYQsD8rzKhM=
X-Received: by 2002:a05:622a:6184:b0:517:8da1:4d4 with SMTP id d75a77b69052e-51795b5f418mr277666331cf.46.1780995311751;
        Tue, 09 Jun 2026 01:55:11 -0700 (PDT)
X-Received: by 2002:a05:622a:6184:b0:517:8da1:4d4 with SMTP id d75a77b69052e-51795b5f418mr277665851cf.46.1780995311170;
        Tue, 09 Jun 2026 01:55:11 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc23394asm460245825e9.0.2026.06.09.01.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:55:10 -0700 (PDT)
Date: Tue, 9 Jun 2026 11:55:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add Eliza CQS SoM platform
Message-ID: <bichje4kbcbx24zogrkpbs4ihtljxlufpqmaxmb72sundio5xb@26t34gokzaaz>
References: <20260609-eliza-dts-qcs-evk-v3-2-b4e9b033a6dc@oss.qualcomm.com>
 <20260609081210.097C91F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609081210.097C91F00898@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a27d4f0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=YArH3T6E5Z3kKO-WbZ8A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: a8J3zMEWI0zKWUXTCAkboBX9V57yIeEH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4MiBTYWx0ZWRfX7a98SQw2hHws
 uQIGvDrdwA7IR/AcoYLXtS94yhxzEBtFoHxsnp2Nnv9hM9AnNeR8/iYJFmMHkdP/w7xXJ0PEsA6
 f/Y19lAzFnts0y+Z5EhOjRPefc/jNoqqkBynp9yLlqldLY07nq4PWDMLM8oZvjgdjPtOd3vxkSJ
 EA7h0bfPrYtBojyTnA2BXmo4z3T6voJER3T3kvjysmrVOlh3oPRMHRMQyhnQysBl34IymXrsqui
 RS1ELiSR4Rz2otM/TPUXH6IprX7XtdlrJ8YqTLpe8uMVosVRrjXeD7dROqN51XXQgEK/9XH6Vtn
 gg+ehY7pOyVzw7aLGhPY6Bngg+Pqt/o1utBgkVGuxScNibjpAYNh3S+M6goDhP1EY0hEXDBdJA1
 IF2DdKVSojI7rS/y+7pRp0DxTyFbrQ==
X-Proofpoint-GUID: a8J3zMEWI0zKWUXTCAkboBX9V57yIeEH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606090082

On 26-06-09 08:12:08, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] The device tree source includes `pm7550ba-eliza.dtsi`, which does not exist in the source tree, causing a C preprocessor failure during compilation.
> - [Low] References to device tree labels `&sdhc_1`, `&sdc1_default`, `&sdc1_sleep`, and `&remoteproc_adsp` lack definitions in the base SoC device tree (`eliza.dtsi`).
> --
> 
> commit 49ba8d899e255d89a8013a6ccd6b518c9f069ea6
> Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add Eliza CQS SoM platform
> 
> This commit adds the Eliza CQS System-on-Module DTSI file. It describes
> the regulators, board clocks, eMMC support, and ADSP firmware.
> 
> > diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
> > new file mode 100644
> > index 0000000000000..33f4cd2822724
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
> > @@ -0,0 +1,394 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > +
> > +#include "eliza.dtsi"
> > +#include "pm7550ba-eliza.dtsi"
> 
> [Severity: Low]
> Is pm7550ba-eliza.dtsi missing from the tree? It doesn't appear to be added
> in this commit or present in the baseline, which causes a preprocessor
> failure during compilation.

Patchset is based on next-20260608, which has the pm7550ba-eliza.dtsi.

> 
> [ ... ]
> 
> > +&remoteproc_adsp {
> > +	firmware-name = "qcom/eliza/adsp.mbn",
> > +			"qcom/eliza/adsp_dtb.mbn";
> > +
> > +	status = "okay";
> > +};
> 
> [Severity: Low]
> Is the &remoteproc_adsp label defined in the base eliza.dtsi? Compiling
> this device tree fails with a reference to a non-existent node or label.

next-20260608 has the remotproc_adsp in base dtsi.

> 
> > +
> > +&sdhc_1 {
> > +	vmmc-supply = <&vreg_l12b>;
> > +	vqmmc-supply = <&vreg_l1d>;
> > +	pinctrl-0 = <&sdc1_default>;
> > +	pinctrl-1 = <&sdc1_sleep>;
> > +	pinctrl-names = "default", "sleep";
> 
> [Severity: Low]
> Are the labels &sdhc_1, &sdc1_default, and &sdc1_sleep defined? They appear
> to be missing from eliza.dtsi and the included files, leading to a build
> failure.

next-20260608 has the sdhc related nodes.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260609-eliza-dts-qcs-evk-v3-0-b4e9b033a6dc@oss.qualcomm.com?part=2
