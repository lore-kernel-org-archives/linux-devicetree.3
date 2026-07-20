Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC6B38AC8D
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517118; cv=none; b=GQFTgTKKEbttcEPf1Q+3yDueWmVxekrjiWZfFkNJcpDrHjZJAZBIHusYwQpGkjk+CdkcveCFAB7IgaFKaz/r9cw2BzqsLgeafdBxOC2G6N/fXLuGmcfQ0FVK7xWnrAtKRR1j5/Iz95miycw16KjRW0saQkwSg0fT1MDwcU8AR00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517118; c=relaxed/simple;
	bh=BKGrJ0lpECW7XMs/V8cAhsctLUZ/BYdBT7mkPsbnUo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwwmfXsr3rwTGo0ztH/DgUHDMeVfPlMzjv99GX72eqdvLml4GTL1OTNSpSA70ceXXVsD+JGpjhVTsStFceLcHXPl7nYrwdx01VV5ffqckOsQiFCrIsBZDU7dFWqDIhkG/T4d69KqsaG/ZDHcYUjMKhEV6WczklMdcrQb41xZWtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1W58UPq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyTPDtMJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1W58UPq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyTPDtMJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNupYe662742
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nO/NhAOiC1NLRm5RoYi8ZCyJ
	QoGzUGlnK3uijdWv0C8=; b=d1W58UPqJDsmyKJTzPAUWTVU4cG8UKWE+eV09/bC
	hHSZREHR2SiUbEqDxH+ktD3v81qMI8dpfsRk/apPGhdN/IbT+t/7vDERNzPQ8soH
	+qnNbiHv42lVVW4P2cJopHALLRoCU2t7gLXE1w669/kFGgZuJojwX38londJO98y
	VLbGQ0cg4xUFyHuiAr5KEVKL2NYYcRbRTR/w/dzxl2SYxaDESnkQKOzSlngYNOBl
	VccRqKE+ZNe4m4UvMOfpFNOULHZQWqpWdMytWxGaKDPfisCc83AsiHPoxZ2DhzO3
	G0HhUwF34aiYz+QgdgTR9zqQUZHV9VQ86HZG5Ni4wbKNIg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chm322-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:11:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb733fc5024so1234028a12.2
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 20:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784517113; x=1785121913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nO/NhAOiC1NLRm5RoYi8ZCyJQoGzUGlnK3uijdWv0C8=;
        b=WyTPDtMJK/SiF5bKmghlAakehg2G5UCahdPB+aX89GX3Zsw1DDXbFc9KKMfZX+5O8A
         bKbUTXlNwH8xSI9lxPWmS5/94iLZUtwHLwgarMDx4b5zxnPWwANfoansp1x2j4EEmd/8
         rlLr5V9fnLwFeL/XJgADGHRPL8GLDR7HPkwYL8OAiTFnKB6wMCFwvrL3wTjfsdpadPs1
         UjDbhIdvMOVHZjlukwbIlXJX6oXRlrgqFLlQi3Z0Cm1FdkAh4SAAvQ8O+zudMA8rEYRh
         ePJne4DmO9BYZs1MXgsmhawetVKDuiNABQianjAFeljvaAxsZfRIz9yl7tSohwJya27g
         7enw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784517113; x=1785121913;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nO/NhAOiC1NLRm5RoYi8ZCyJQoGzUGlnK3uijdWv0C8=;
        b=noZS7WobUFlzz/kVPKPiqBElBrXdomubPkl6RU9ij505DeYvxKYqZJsX2ZQGk3NHdk
         MyS38zjxmRgP+Md39qSnW8QTjYc16a7rUTuVY6jBrVRT7Km2ltLiTwWfHiiXf9HR+9rx
         4IxU0GhmTNMTw9TxyLbEY/hOxXQ/FjokFywyXSzJuy92MAVVYkbMZ16l2M8OIoee8I39
         nTb+DFR50qCtqJKD9NIAlvGdC2LYNnx70QoTKW02ouTRt9F9850jlqIG4XotcEXe5Ayn
         NrLWEvCp/eJVqOd1pTkscHrZkmwSG7IWTmHE8wb2Io8vaQQKDEmXVZXAlv87JJ+998b9
         u8/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrp22+/TNAzqOkMBW1CHkuUX5MPUGO8zRQkeIwcu/HsDcQnXirvMq8zTQnHYmvq7mlFaR/oGewEPnkY@vger.kernel.org
X-Gm-Message-State: AOJu0Yya/eYhGb8QZUbYzzWV2m1n/gIN50qM+AdbKbp0Th+b9My8J9AG
	qMsCOvlUdM/9k6gfP8w+CQwHO1eVKgYF6FRPycgjJheEetaggLzem4IAkfOkdB5p0wyo7wbDnBV
	SkPsVCVnVoYwol9kQJFy9xtO2drAXVwMNK9/akfzp4Ul4iR+jFlGVJ4naMz39vzOd
X-Gm-Gg: AfdE7ckn5zyCK9NTVj3o9KRfVP8eiLXhSL+ScgeTsHTX3cFUMVEhc02D36JjJHxKfg1
	dK7fSk+4wKx1O4GiL02Fi9IxiiMIYbje0NeyngFQV0EzghLTkWY4GA3ZxOeRXxyKdeJTrMdu3Xb
	WdLarXwnq94xqjU4tPeEJhtzA5Gd27h4HFis3j3iwumK5DVylsaXXfwzZrDX11suaNFZavPI0vZ
	lAaf9VPdHbEuqZeGVLR9NPvnhANviwdUj4TddghNkNkVW62Rq7Pz5W5ohkg5KoyI5UyVLtIze2c
	orVwcCrzjfiXjHaZbQTZmu9hYAdZPQh0jLYAI1GgUpdQeyDbqCb4+H+VI3+NQujcIxnzW4uWwLo
	YN4SE87sA0JSokai4kKROvjsgZBMO4V36tCmEeKXEnV8=
X-Received: by 2002:a05:6a21:3984:b0:3c0:9c1a:8939 with SMTP id adf61e73a8af0-3c3ada34209mr13687217637.65.1784517113581;
        Sun, 19 Jul 2026 20:11:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:3984:b0:3c0:9c1a:8939 with SMTP id adf61e73a8af0-3c3ada34209mr13687186637.65.1784517113014;
        Sun, 19 Jul 2026 20:11:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbab9sm34241828eec.15.2026.07.19.20.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:11:52 -0700 (PDT)
Date: Mon, 20 Jul 2026 11:11:47 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/6] arm64: dts: qcom: Add device tree for Nord GearVM
 variant
Message-ID: <al2R810xFsIyng1Q@QCOM-aGQu4IUr3Y>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-3-shengchao.guo@oss.qualcomm.com>
 <916e2f7d-6f9e-44db-aec8-95532d265dbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <916e2f7d-6f9e-44db-aec8-95532d265dbf@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzMyBTYWx0ZWRfX0vmgzPJIFEAN
 VL1SlEJrUlmiQJvZ7gY4SooQzn5VSiLOt9KLms5L4ElC23ZP1SvwQQrLBB+2a3WNHpgc7Jbd4sQ
 DGiZuQKqOkiXappSmHFbs613EfH4DvU=
X-Proofpoint-GUID: bgC7HK5dP3y-R5315qAKP0HFfDUuu-c1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzMyBTYWx0ZWRfXyXk5P4cIoFKg
 3wESLEVhV5mbgpAXcKR8Qb4dhJGzIhjp+isZXekD2pgHtwOfPkd+cTY5r4/s0aUtA7dsbvlq4/s
 T6OdxjdRvxfOb//mxqoqbuQo5bLkOa/9tzo1hXC2H/ACuCbosxiyQ99ORjiRRaPzRzrL81jMzV4
 /rpuezqbu8wDe54C90uqhOmQZ4vcmcphWsrQIClC0+fvS+yFjdlDnTt2CmV9ZqKBjCSSuIRvA9h
 +rW8TMzQ4A3UdSIeaeA7B5Z1pQbZ7eaLPX4NBYp20mEeb6NBoLCmdJcXPptJwLZbl5IV0SuHABr
 9PVFG+qMs6I3DlXFaZfyfPJFDezvoBxVMhH3XDJEutnqvZAPF94Mz+zmgBIllRcMJxLvdPv6Vhf
 ABpaKWrqnuGCboYARsfYpIid/Yr5vHNM+DDyEXZApGz+f8Fu0yd5YSjuOm4PIguRvIJJOpDp8Jy
 WI4Shh2JMHxz4brbfRg==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5d91fa cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eRJEpp2EuYoRR3eGW0sA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: bgC7HK5dP3y-R5315qAKP0HFfDUuu-c1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200033

On Thu, Jul 16, 2026 at 07:01:00PM +0200, Konrad Dybcio wrote:
> On 7/16/26 4:25 PM, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > Add SoC-level device tree include for Nord GearVM variant, where a VM
> > controls platform resources (clocks, regulators, powerdomains, etc.)
> > as SCMI server. It currently covers:
> > 
> >  - 64 SCMI shared memory regions reserved at 0xd7600000-0xd763f000
> >    for SMC-based firmware communication channels
> >  - Three QUPV3 GENI SE QUP blocks (qupv3_0/1/2) with I2C/SPI/UART
> >    controllers using SCMI power and performance domains via scmi11
> >  - UFS host controller with SCMI power domain via scmi3
> > 
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/nord-gearvm.dtsi | 2911 +++++++++++++++++++++
> >  1 file changed, 2911 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
> > new file mode 100644
> > index 000000000000..8db93c361c2d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
> > @@ -0,0 +1,2911 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include "nord.dtsi"
> > +
> > +&firmware {
> > +	scmi0: scmi-0 {
> > +		compatible = "qcom,scmi-smc";
> > +		arm,smc-id = <0xc6008012>;
> > +		shmem = <&shmem0>;
> > +		/* We expect the bootloader to update the IRQ number */
> 
> /* I expect this not to be pasted over each of the 64 instances */

Ok, I will keep it for scmi-0 only.

Shawn
