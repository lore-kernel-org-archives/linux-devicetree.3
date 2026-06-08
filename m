Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F0B3B7778
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913018; cv=none; b=QeeEnDdQbFk2g911RKKasZIrWtkM8XK9ozK17OWf/jH/JhAKrkS+5BG3y5U+WqKhca8XRl1MRXG08E+SOahXkMs/xPJ3BrggMD1FCNYY9CMWl8EIToPvdi05NR5DFGnhTRT1CzmHSQ+g/A8RwfnxT7rDEBhhKpalj/eljb5bNX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913018; c=relaxed/simple;
	bh=0RqPO6GIvlMDAIMSc1YJlbk9SnAioPbSM10IwBfxWb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HW4fKmrmirr2b4hqrQReqi9pdbTuiTakjNEPdmhHDV/pGRsx92rs4HXBzS1PQuI7zuBNEaKTuLM5xy5AbcbRnO2hBFf3GteFO7unrbqooEOphLXJOgPg9DOAsObUmLd6MIDFKEt56NYc5GtroNKHWEYk73PPMfVGxVbB2LxKgzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oAWYhHr8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tw2s/qcc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAWYhHr8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tw2s/qcc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658A3P4F3308933
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 10:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apHApQ1MhOPI/865u/RSUKkrDZhgXzK8ibYysxGxV7o=; b=oAWYhHr8AwIQQUqh
	ujIGiVtwd2p9tBDOrbi0C1Lx3EAmbCIpdlsDQK6pCeiSHSJcveBQeRqVyHqkXNKw
	Xa4rDTQV/drm0i2Gi2jbTigfeE4kw36k3B0MXFwkHrcX1/BXuf0wcJGAiuSFUhkZ
	XxY8uRWkwyFdjgva8sF51foIWKyQjPs9mzOhwO0QZVOp5YmQSrzqTX/Lg3r4j5Tc
	Fn4QNqxYLQzJ0b0ebTJu+kS7ct0VLIHL7lfYMzGOmcAVJLO8IHjCmFSlneq8jBcO
	yJ9z3VexHOTzydFZR2bdO2t2ReNqqwg5HDPOlSt99SxUToMSgIgJfdMYYar9JkHG
	VGrKJg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8g01n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:03:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso2563827a12.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780913015; x=1781517815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=apHApQ1MhOPI/865u/RSUKkrDZhgXzK8ibYysxGxV7o=;
        b=Tw2s/qccupOlKjFZ0OIjL8tLotmwOQilP0/bpht6NDkbcwH62LLy6xGzslBm/qZhpx
         PP/myWy2QtPr9TIgSliTZQqA0cBD2ymHj8QYLutxhPkesWQpXQvRDnO1SM0F0481jOg9
         tUXCKiVfXW9awxvDLbuKENP1/4hPF91hQLsqGEggg+723Cx4bFDdGfXS2E5Bp4ai4hBb
         X2rKh8jEqte9IQ4dxTL3TDOvdXNAGb+tViFtV4aETdVyQLYq7dRCAtVv9gNmEaygDWH3
         xeO9WtnFQj1M2M9qtipPZxsRmQRVmGb5kjle96zZApql4WBqztk0GT3EN9JgVA/Z1bNy
         yxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913015; x=1781517815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apHApQ1MhOPI/865u/RSUKkrDZhgXzK8ibYysxGxV7o=;
        b=YMRkN2+hiEAjhIe+hy4cBd97slbfLuDQ0+GaqhZu8759M+1fhpkSG8LUejZuHd+3DY
         UZirfjo20QmPoveGa4yOYjeumf+5LTVqDZ877Xc8sOaNH+OZhuMRSGUDF/Ggib3s1cyB
         dRcGnPUpAUGY6sowMxqbWUAyatO1sWRBc2Xz4ucdvqztpN76hSVYVGNt1b2agfLluCAj
         mRrI3BqQBu57UXdzW/0U8f3MjGd5O611FbkFqDP6k+fg+f56Oh+gJRar9zfhSx7lt7Iw
         px3dX4aIwMUE3m296VZcYBeJ/5aomZ8vdu1mz8KpeGhdjauVDZWD4xIyMoAVSwVH/QGO
         deRg==
X-Forwarded-Encrypted: i=1; AFNElJ+lak1VBiE0LGnTvIeOYLexk1/YNkAux8cZatxYnVlPE3LgZP+jfaAys+G5C4xiHNBRAyVKZcovK6gY@vger.kernel.org
X-Gm-Message-State: AOJu0YyfT2dPopXVmnuIHX/58yWOKwPWQg/spuCMaIOOC9C/Yl7nwcwS
	+J/haawvUFLlOua88BmU/r5PhXjHxXlX6H4jxJzX8lq2jcZpkFw5nHdzmdGcSCJfoyMUoqypV13
	ORK9xgvo/ElSAQZ88dlO8vxDRTz5rXqURqFZaIVgYSQfjK6amnCle3xLXZFWVt8lz
X-Gm-Gg: Acq92OEsV2roNub/WG75CliOXI2FRrT2ocLEO1h18dg8bZl+L8SNi7v3hAwl+5zD1Xw
	LXC9bcYHnkRVnuvuuQYG7BuAavvzl8HNsbdCZx9/8d4gClmximqEt/16cBL6k9X4sRS60leebrk
	S8qU6Uqu6xQ4Ol2pjG0syXDcFQ5HAf81/Vz7bImrfWegEPkn+whA+Oz64LJ8QH50IDh/gKyT3oo
	6gXzNZZl24cWkwHDgwi+6at/4ldBDntxvbdK+emqvA9xfJTFrjowBqX+hrgnavWM8GBoSnkD3zh
	n9jNH8UIgRkJlj+Lbb9au2x1LhJKRN9i8eoZiy7zTw01pEU9WoV4AE3ERbwA+C+ti+Cb+ygYAcj
	E6BZoBrcb6zQ4iSdcblAnpzjFiA+ShsOLDzjv+npuYjSAO7iBhzmNneLJMculamVwWJmPsqZHLs
	sKZMonIqcnBK203CCf9RWdFI1TR1QQk6yoExsSonBXWVh+OpTzZNvwphbYUg==
X-Received: by 2002:a05:6a20:918b:b0:3b4:913c:296a with SMTP id adf61e73a8af0-3b4ccdf46a5mr16250837637.21.1780913014971;
        Mon, 08 Jun 2026 03:03:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:918b:b0:3b4:913c:296a with SMTP id adf61e73a8af0-3b4ccdf46a5mr16250796637.21.1780913014445;
        Mon, 08 Jun 2026 03:03:34 -0700 (PDT)
Received: from [10.79.138.73] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4afdsm17716145a12.19.2026.06.08.03.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:03:34 -0700 (PDT)
Message-ID: <b61ec109-92db-4dc1-ba7d-a5ce79fea08a@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 15:33:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur-crd: Move common board nodes
 to shared DTSI
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
References: <20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NCBTYWx0ZWRfX1YdvkII/FNBb
 YPhDrLJLpgrZ6MpR/85sZrbZYkFf4QC/9XWnNMorJusEGgDCKY9jrdFdEeT9M7Ilojcl6LbSF1H
 09ZLHTsARLe/IsSbCz1k80KGg/qOHAIl94JGYLxq81GVIosh9I3TXWrbWq1NoxA8N6cylLVgZMx
 +6m3O7IKLBgbwq4YiNYbwK3BTt931qnd3vg2uUjX1ChVtWlIh7nXuWytNhBAypu+TNrv9sgqCtu
 MvZVwyJZkHFtHNUyUVIXPbcB3BOo47RIjylc7j+9HeXN0SHyumCKMYWNem2tyLpTpRfdH6Q1es4
 uK65kH2BBvLIKyHaRsyqpslyvdiTjtweVzFYw3FlOY9VEwyqxApbCEc3oRvZjtjmClsKy/wePSZ
 WXhkTas5/dDeH0ICAjP4xxPKZ2pLnkHBwRpw80Ynaof79afJCZI4A3zy6Iurnt382Lo0jet+l32
 80lU9hNd8PHTSBXZniw==
X-Proofpoint-ORIG-GUID: -sTnsJFyp5vWRT2Dlf_-H6LMt0krynHv
X-Proofpoint-GUID: -sTnsJFyp5vWRT2Dlf_-H6LMt0krynHv
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a269377 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ArSBqUEsZOOXoIw0mWcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080094



On 5/19/2026 7:55 PM, Gopikrishna Garmidi wrote:
> The Glymur and Mahua CRDs use the same board-level hardware for the
> eDP display panel, MDSS DP3 controller and PHY, USB-C ports (via
> pmic-glink), USB 0/1/HS/MP controllers, QMP PHYs, eUSB2 repeaters,
> HID peripherals (touchpad, keyboard, touchscreen) and their dependent
> regulators and pin control states. This has been verified against
> both CRD schematics.
> 
> Move these nodes from glymur-crd.dts to glymur-crd.dtsi to enable code
> reuse with the Mahua CRD.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased on top of next-20260518
> - Updated subject to include glymur-crd scope prefix
> - Rewrote commit message to describe the actual shared physical hardware
>    rather than the code-sharing intent; the commonality was verified
>    against Glymur CRD and Mahua CRD schematics
> - Link to v1: https://lore.kernel.org/r/20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com
> ---
>   arch/arm64/boot/dts/qcom/glymur-crd.dts  | 399 -------------------------------
>   arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 396 ++++++++++++++++++++++++++++++
>   2 files changed, 396 insertions(+), 399 deletions(-)


Hi Krzysztof, Konrad,

This has been waiting for a while now and already has a Reviewed-by from 
Dmitry. Could you take a look when you get a chance?

Thanks,
Gopikrishna Garmidi
