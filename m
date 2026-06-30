Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B234E367B60
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827841; cv=none; b=dk9IALNOjqvHO4EA1MY1uiY25imb/+LPN9JMi2Il4bcj3XRocG1VYKctBuJ/Qac8D22ehMpErYTbNCpIyeZoA7shA0EUFH4fR2Vci1sJF6VxVKm++ITaY1mvJu2KBslpn6xX+dpQuoeE+TZ7aWlYt61RN5z8UmNnd3ozDC56RIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827841; c=relaxed/simple;
	bh=VZXDCkGXPqjXNLo87oDiL3MGUCb/C/NcqCHPksmBoj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SaFjqnznbYYzgssPAUrJFI1EsWp9RVDVlP7WoDIp98j4q+r5shp+l4Z1ETDM9rNqbQyK0x0cTZpSZ5CQRzmsHHhtIESDQNz8nw2dfI9gidw5Ar6sgcUBBngG+uRJAGhO1eJQ0MdbjeVuYW5WJAC5+QtD/gx6wHlB8qetebGOdNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQ/hQGc5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYp/5oCS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQ/hQGc5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYp/5oCS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mvLi1522327
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jHHiZ1G2Of8CDq7sIn2bONVFdln4OQz+K/2zgUurUOs=; b=EQ/hQGc5r0U+JEjJ
	rwXLZDRjg/yJx5q9y9n8AmOTYjnbhXszb4FUElud33w78rD93Eypmp1NnCYi0W6q
	PuEjUGmqiLeRE9r5VakI8DKVA9qkbxGoiWxoQgzq0Ww+J5ZjOB4c65f2K9kb3ssG
	A1QTZJKj47eZ/wB/oH/FItolhwmG2rIGD2vnmfjGl4vnQKIyyKuzKLZ51eCCII6a
	onPKtqM3y4gk72zTUDXV4o79M4E7WHnpEIL5mcr9ADcFSSg2OxNW8MWTuQmYrrA4
	eGFAEU+Yvict77KF8ItlALa2KxSnXLj8DHL5vKIdvejhUMfUSlmLpP2meIsjQJVi
	+R3+tA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw93q3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:57:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1857417aso364771cf.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 06:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782827839; x=1783432639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHHiZ1G2Of8CDq7sIn2bONVFdln4OQz+K/2zgUurUOs=;
        b=RYp/5oCSqSGKmIOywIPiNot4M68g97xtxRi0V77cy+1t0dc2D2v9+xmZnL1V2wEsYS
         D+N0bv6ovxw5yP+mJSGYuRiU6KxhIXCMUWDsQkCCZcyH6Mm2dW7wKRLGoWGEB/Xo+IoA
         VnQNhSKtvc6Sg47ldrQIY2iEk1bhY7FlsHdFSVGBJYgi9nPoSZPTVEqcoxgxQk/9CBsn
         CZskP/kNLENHuiucvyCdRk6CW3FGCQDtSc+bw281RDw0JhzSvw8YoJrpI4ChqISeMwGW
         13YoMkyQScG+gfGsBeqrXa29D41Roy2j1QeTR0gDK3FOGCN7dE0AGzcZTGlVcPnEBCXw
         ZJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827839; x=1783432639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHHiZ1G2Of8CDq7sIn2bONVFdln4OQz+K/2zgUurUOs=;
        b=cMvqN6zzHHnILqowTspzxEigEaSZx6vjRIgY6eZv4r1hCbDepeaTwev6noOzy3FNeG
         mLmVkhDxHhHRgf2ncyAj2wdEElbQ8jzqyjd5sL9szEJ71/80Jt8dop90HjOgNCJxR2ol
         IKtlPn7uUAWJp7ZQv9EKmYkYt/iupPFz33r9yOnXGEEtcfmNeL1sqCSU2vSB5nmU2EzN
         agiwGTfaiXrzNziHXVUngIy9U+HoVlpcOEEDsECehJk3ozOZITwcqXi6+g2HWcZxCBGq
         TDcqMmUsB4M0qWiL+OUTzG3Z8b0y+OAhQys5o1CL91kCG7C8JU8Zna0YMFo8LpQ7MAn6
         rrKg==
X-Forwarded-Encrypted: i=1; AFNElJ9ci9yRDREWIzx3OYE6gvDhTEcXDxaGSgzX7v9HKEjHHdvecZJctOnfa4K5A7T2bTAUQfdOVQWpJvsV@vger.kernel.org
X-Gm-Message-State: AOJu0YzesVblun2iZoACSuEX6b5QdJKorgxZVVLtnWCXHIBaOPf4IWwF
	tBYXpqLxGn78VhWvZqIp5ikI1MlC+ccNbEn+xxGA8Zy1FTllFBwgfraKvo2V0GcMdA6DLqZMIKh
	qSQa8yjyFJ3PGF5fjXVbnKa4WlznHh/4GtRPb0dxCd/8vMDVbDqHpJ+DssiFluVLF
X-Gm-Gg: AfdE7ckDW3ZpXEiHM16tJjCakuqwV8+GPnwNtgQDoUhfXd6p1uPTb77i1OFSRlQNGqC
	GsTuk+D5OWTX/P7pkIPhOHLUNzkJYKluw2VBulQ7RCwULQv5QU0LNOY23ZHEw608ttx1JDDo3EO
	mcaPfQmmiik4b2nMvhNiX7gWoUdk8qdRXCjOCigc/OmZUF6aerFDQgpzKDSkX9I/xB23hYKN8X8
	amgh03p0XyU5e/De9U8iA4avnOBzowrdB1Qz0FLZKspr8bzLrvHfVwufKylzyLEnGKswPWQlnSp
	8oGd5jEQRkMXCO8eAOITrWezEtuN8/6g97UAbCSNrekca09+5Epi0ZFNdgS97AY8WNRNNMSATA/
	c2Nn/YKzMYCb8o0Dtix8EnM553WNrY7pd1D0=
X-Received: by 2002:a05:622a:286:b0:51b:fe41:4764 with SMTP id d75a77b69052e-51c108197b3mr29499351cf.7.1782827838865;
        Tue, 30 Jun 2026 06:57:18 -0700 (PDT)
X-Received: by 2002:a05:622a:286:b0:51b:fe41:4764 with SMTP id d75a77b69052e-51c108197b3mr29499051cf.7.1782827838397;
        Tue, 30 Jun 2026 06:57:18 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c128917594csm132716066b.59.2026.06.30.06.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 06:57:17 -0700 (PDT)
Message-ID: <359d3d95-4756-49f5-8dc4-f24f24844f3a@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:57:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: Add Shikra IQ2390S SoM platform
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260612-shikra-dt-v6-0-6b6cb58db477@oss.qualcomm.com>
 <20260612-shikra-dt-v6-4-6b6cb58db477@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260612-shikra-dt-v6-4-6b6cb58db477@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMCBTYWx0ZWRfX4DKRDoyowWJX
 HFVnIkf9MFFOISMyZ6f88iunDxfCQjkhFlMHqbLujcmu0o9JJ8zm401ictbanEIVQYDMKZo5cD8
 4BV64CjkOrMMf74IXfBsI3pM5S4cghE=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a43cb3f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=MSeU50jLikp4iQrAx_QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: vo_gyGDfT2vAX8bMjdak6XOoe4IqD-x0
X-Proofpoint-ORIG-GUID: vo_gyGDfT2vAX8bMjdak6XOoe4IqD-x0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMCBTYWx0ZWRfXzstF7kox0Lnf
 RBhJsSnEMI0yXhiMd48df0V/FjqcH9DR79RxON4xhJDb+2bLVado3LRW3YH6K5BzH4JmYc4NSMP
 2jvmD18Yht5jWgu7CJkqcVUTA8IrYuA0F3LS2iYYJ3Ez0Mq9hmHT4gvHl781dEGCK1Kd1H7yScv
 cN4JfTtpM8yw5PCvLzSYDXnsIuOGI9MaagNotJmJDgVLgBbrNOjVcszEDTl9BLWpJtQV/MvMklG
 dzH7qsss2XCCe+mAmIkzgjeYUcpKYAMdop2PnB3wrKyQul5ZEA3xGORAeHE/8mXCFHzLj6mWj/C
 EUe5c3krdDCmn8mcwMKN6ByedZ+vBgCHQkRbCAG51hB6DW88Zd1FJRPEem8V/t36szJLNA5md0p
 KrMnUU7qLowqs4vzGAIIKbQCpjZhSBSe5lbE867/aZVf09WjUEGFRSEL38ULioV6MOUJEoW06y0
 wY/8s2Z1nhYWqSwp4Jw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300130

On 6/12/26 7:27 PM, Komal Bajaj wrote:
> Add device tree include for the IQ2390S variant of the Shikra
> System-on-Module, an industrial compute module integrating the Shikra
> SoC and PMIC for industrial IoT applications, designed to mount on
> carrier boards.
> 
>   - shikra-iqs-som.dtsi: Industrial SoM without modem (PM8150 PMIC)
> 
> The DTSI includes the common shikra.dtsi and adds PM8150 PMIC regulator
> definitions specific to this variant.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
