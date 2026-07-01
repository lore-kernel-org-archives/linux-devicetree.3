Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0C144CF44
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904785; cv=none; b=uTBhN/RA+m0pSMZwxkNoiDcH0sbSkwdZIVQSeOuK2IWS/mt/SF8wFWA3ca/mIizNYNwaAxoTDviVrflfaNJ6LpGa5FzBL7LpwZaD8I3JAefrrAIcjXTY8s8a8Ab9Zb5WrPAE78ZL/4Vsdvsh2z9eot2AkSMmnf5q1oPbwdLtz3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904785; c=relaxed/simple;
	bh=XjCW/Ye0yMNW9bajJ3o4jGFlID4CY7WbWyI3PBuG56Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0ZazM4zocP5CNbWe56iNvg0/skmSdPkGypkiHrfvER26WFN2vBhGm3La85dWTEaKumzhwy5dGT2n9QmmbpZr7SBY2L8eefzlolGC9Lq+MgaUuse+HUi7rePRI+IMrHU39ocxJCsjd4x2IZ2jiWh5zVzUoKz7jeS1QwRJM0xMjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWKyGNd1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+U6ABAM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWKyGNd1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+U6ABAM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8eaa644551
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 11:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XjCW/Ye0yMNW9bajJ3o4jGFlID4CY7WbWyI3PBuG56Q=; b=bWKyGNd1XvvczpUe
	PHrG5mzfEqT2e0thbQlHw9hoCJUYSpgCfKP4Y4ABWAeB+sb8PM4aR1CeqsqmRDDU
	eHebo8aLkCUYFtJ/DpMHBZ/UCNoWHNOTBW+3sfzme7PbwKNZK9Ldey5zEqpO4MTf
	q8Gd1PRlJVfLSMECv83Z9YvfAe+kG3vTHYPm5aMBP8JuVrn065fz5zQKvsQK6/f0
	zohtyqpezRyPD2T1Sdumh4jSTA7YB3qGZPnhfEGgnhstMIOBud1WfMMHJa+78ZSy
	ufyaNj2vLbT5gNiAIAn7S8QDw805c51Jzev6eZwmid7+R9cd7nJAcIizp5M7mjkd
	3zqJrw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd4gtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 11:19:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e4f946461so60103985a.2
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 04:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782904781; x=1783509581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XjCW/Ye0yMNW9bajJ3o4jGFlID4CY7WbWyI3PBuG56Q=;
        b=L+U6ABAMnGUNQAupNKX4fDHKwweIhGUfADvyxPx4hstZ1wXCxqofq3433MQjKfau7O
         Q1Nd0uk8fIXD5H4N+kQYvYsRkrzIa1StCh5FiJ1Po645UZZkHwBJ2Zuw/LirgLFWIrvQ
         cw8i9nhm3hSaATSjwj25JRDn8zgXTPzAzQc3P9/+NfKd5XTIMcsImiUVGAesWBNFyg4R
         1in8b0MG2YevX612ZF7tI9yaWcUzOuKz55JVCxGzLrLR4eK0p/WYmFhnPXPb2YEbmkOq
         AUPUiNIK8mZSU4cA4E7oBz82cWkdCbmMNDDiyQxS6Z8A+Fzr1V+gIe5NeXuUX3H/O9jD
         mmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782904781; x=1783509581;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjCW/Ye0yMNW9bajJ3o4jGFlID4CY7WbWyI3PBuG56Q=;
        b=GsrD2hm20q0D4zcvTG/nBYjM7aB6w6K2CvUBkfIoO9hK6H6/p7ReELD90zMOA6uF+k
         ot/SR7qSCPGJKLAvXHHr7lAuiaDZ5HLzHlvqanUkahRHFa20l10IbWY9em67voFzAF5M
         pyIPi1Mnj8ZcNt6/SH7hCLAZElwdOvVnIzljHP28ZM9T0f4Rtf91m9H+lhgN9ytKN8o2
         J8rKFUeThVwLo6Br5qi6uaqoosBSoXrTX8h95kwIU0Udn4zSLwBUummWix3GZDsAU0AL
         DEgVgeU6Cdn4lXc15bFVmqyIv8zO/yTtVptfj9uDAzDtFkkvj3NQgrH8rTQ/rYfYSav6
         WznA==
X-Forwarded-Encrypted: i=1; AFNElJ8ojpuSWjuz8hIR62zD7PGvxTv8k3PUsA9RLsjWCXEuaQxTWiTpi0TFbHfYl5mnT/y3Tq9MqFQx7hwu@vger.kernel.org
X-Gm-Message-State: AOJu0YwlrYHJhbRYGZIy9TcPHenE64AhmTAVZ9bUWuXSly2i/ROBydqC
	uT1mCo1cmyaHBeHwjB1UNgIvUOOD/YjyjNBQragu0virPxpgvYUxEtRd+rVsKMFmOBGw5OUjBgJ
	pE1cVdgla5cQGkZfs+wV1rtr3A1N8heewMJ88+YlAxaibbK//099mXy3mmbwIQvuX
X-Gm-Gg: AfdE7clzCDP9f+P3cnAQB6z5nbpjkHKn53Zhnt83Rpo1IW3i8ELh6J1tP0Tlu14TEnv
	++v8mdJiZua3W+5LhGDJUkSmJpGnUBN+thpP1Fssyz6tQQjl2kXj4cmC4r0OSM8Nf4+1lmvEi39
	qiTmf4Gf3g2BdAyBkV2At7ef6akzl/Z10uIxC4o5ADY1FGCdf+3WaIHuzJbCwawJjkg4RzT8/OH
	ucmPHAOVT00nNfEobgjPEUsLAwsxk6TLowVM+IXM+sXSc2WPVXMsFL/lR99J71fR2j5/dbm1ccS
	QWl5kddxWUtw6zQt9sNWvp0Nntbak6rmIaa7hH5j1Aq4Qi/wFFcAOJARO7ycPPS8ADCXWwWPQGi
	QwdP+I7S1JSV7osvFodowjqQgmwNl6nc2EXF5Oc49
X-Received: by 2002:a05:620a:29d5:b0:92e:7733:e3ac with SMTP id af79cd13be357-92e7821eb62mr164745585a.20.1782904780956;
        Wed, 01 Jul 2026 04:19:40 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:92e:7733:e3ac with SMTP id af79cd13be357-92e7821eb62mr164740785a.20.1782904780475;
        Wed, 01 Jul 2026 04:19:40 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4fef11sm63536955e9.15.2026.07.01.04.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:19:39 -0700 (PDT)
Message-ID: <d9cc44b0-4153-4b52-b5e7-1f1ea1cde8d9@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:19:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: rockchip: grf: Narrow allowed reboot
 modes
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260701105849.197086-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260701105849.197086-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260701111041.A75C71F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260701111041.A75C71F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExOSBTYWx0ZWRfX71/OqpWIrF8g
 qoJsKN7KZwtGq3n/Zq9eQfbBUbWGoBTN9gLOIUntzZa8vZt2R1TDmQOjrEYh/mBPZXcncc6GNp2
 gj5aeiqJWOiWjdk5AlOlYa2tJ3kYc50=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44f7ce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=kEk1r3HJiqRx88LYBtUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: mEd7676xUqr_m5J5Cquv8Pob3eiItcuA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExOSBTYWx0ZWRfXyYe4AxNzCJbQ
 s12AVMrp49vxZ4oxvf9MtE8vmY9nVFTJ+aBzJqgf8l8VylyLfYgtllGRxfdHqtPjq/HLB9+TNxq
 qzsjGDja2+qXqQYaBbUsXB/h3zWr4X0kanqCDZYDfSXn20mIKgAPurEjzOWSHiWkH2P/FH299Z3
 JxN+wGDicSEag/espeoeJc3U1r3WfYW+f+tonGB42HwCEYiHOfsJ/e8yK2y/I9fJCyRkJfcJIVy
 gt7UwQ4uY/vrcJ6odn8oAUtT6fPWW0FWtOcNEq4AMLUWlcZoL+A3yzEQa/vHUnA/J1Agedab5nv
 jtieCY45AnvZah1jMJJtQG+e9uLTS0ZuVKvU8Y6PkCQM4BZlNo7xqRXJo8WOWaeN02lIf2ZeZGZ
 Qovwh/U4e4jlKXRCisPMHk8VzbrE9dIKi7moPFdcZUzRfh/FRM30TPQz6KpksRJGCw/Gya4+iNn
 9rxXhC3kWcI6WoSX/rg==
X-Proofpoint-GUID: mEd7676xUqr_m5J5Cquv8Pob3eiItcuA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010119

On 01/07/2026 13:10, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch introduces a new `patternProperties` constraint to tighten the `reboot-mode` schema, but places it inside a conditional `if` block that does not enumerate all relevant Rockchip platforms. Platforms such as `rockchip,rk3328-grf`, `rockchip,rk3562-pmu-grf`, `rockchip,rk3066-grf`, and `rockchip,rk3188-grf` use `reboot-mode` in their device trees but are missing from this `if` condition. As a result, they bypass the block entirely and evade the newly introduced constraint, making the schema tightening incomplete.
> --

False positive, additional restriction is placed in exact place which
allows reboot-mode.

Best regards,
Krzysztof
