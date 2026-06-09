Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A820416CEA
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007704; cv=none; b=Esj7v8j0PntLHW7N5DzXczhj/gv6mRcQSvctQqroLE1yrpuXc2GNj/ZwcNU0Ygkhc2o9kpofzBR9AF/l87+ljQSfqmo6XTCkZyZAfqN0uNAlxQDroD1Xi5bzeWPQDAyLpw+YkZfZroCcpx5Jzc0Vl2tugcRFRVlUU/CjF7SWJPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007704; c=relaxed/simple;
	bh=Al+O4ZpsG/tKercA/jEl/ceexyd5wh9GxKJA5iW2SWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btgMDqL4fZGbDxG2yyqNJCTJYOhi0rauaWasZ3rCL/OS/9zd1TIC7jia8L9BrQvkmkQ/gTsrTOFg5c67oqUkSaKpgjQF6R3B0F4t4eNtb39K79mODGFF1lgUEdbHV8hRcwNp6Wr+pezWJWCfJgx0j2p4uAJMr8opciiApA9cM24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FXIGF+M7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tsqvi/lq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXIGF+M7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tsqvi/lq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnMAN2051739
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 12:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tA5KTvMfXzI2+w13xoj+haJfk2LLPyT/kYUCzPHF2/c=; b=FXIGF+M7jddR6ztP
	Jg1qfzQKf0wnWqNx94rsO50EHvAckOVh/w/0rSpnkRZSfaJwR2SMKJRHMHdQ7IHe
	Duc+ASZjmMe1vtbJDG7gE2N17Or6PBBOw5CDkjOZxAid54sn0hHaMWoeccht3hxE
	58qxG6lTVXLntwb/QFNn9ENm94sueJredZZmO1J26Etl2pFudOc6GAtzeU/WgF4N
	mfgsKffNnyf+xWHnwgUhQGmbq6H4jFYepxghD0PPXmUEmmfMsyWpPZV85emSa7dE
	BGlE+DhxoM8WOE3QYZ6F/2g7TbKvWYR6GgMO+7JpehrEYvhLBDITYnKNvmKl11U5
	/dYqmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr94dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 12:21:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915737aaf0bso136402885a.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781007702; x=1781612502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tA5KTvMfXzI2+w13xoj+haJfk2LLPyT/kYUCzPHF2/c=;
        b=Tsqvi/lqVLGFV6rbaLoAjo+gF2GAsllBycL7mSBZZ6Z0P1cvC197C9+af6ST+O+QtO
         cTjLwrADwBT+ARpuM84lPHAvfQPEHr/hmIsY1GGaTLag/NW/3fZnBKsFcafu9WGsKO/f
         GPzk0iexqo7h1BmQp3+nhOmOHXo5sHtfbgT/mfuNHW4v2a9Eu/WFjT9ubEMOW0q2nTaG
         w+krs6Qn7vBqFATGRsS9oWX/4aAHGEO+5woLUCt3lUYnKGEH2tCoMrkda5V0jS1j/BMG
         1SoadxaIT/+8yA15NKvzfh14ikDgpLS0QqSNrP4dLykv3snDVvz6/QKQMOYX12Zb6yNK
         qZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007702; x=1781612502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tA5KTvMfXzI2+w13xoj+haJfk2LLPyT/kYUCzPHF2/c=;
        b=rJORZVjxWel7/qjSDmgg5CTEtXNMBk7kqVxa/BLVmhSm59ZSsuApOMKfhGVmrsRxFE
         nTUotJrYxJ/4/wJc+APyvRrVNWlxUx3Y9hUeL1Qu2KnP5goaQUwbBDvMkGm9HxAYhx5L
         K/CIjni4cgFVsScjWa2y/VMuuazILH+LzFBX9wx3FFSrIdg0uJpxS7a9OZlkSG/MW/Nc
         1n2RageIxglimD2nPScK7bap3HuHd6Kmv3RLxIs6ws+/twFrf+1TORnFvC5cu9wSXjAk
         IV5BgTNvhXiIWfMOzgkwY0xt4y4r/z7ptycO1yBn4Xo7Ndka52euREU8EsG2qc2qbx7W
         zaVw==
X-Forwarded-Encrypted: i=1; AFNElJ+3kd+t3kh2ItpRijZ/NceF3xwb6mkW4G0aEXsleRTVuWAzYuFpPgQNDFXM1/meSJTp+GOyf+0XoI6z@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj6qVK/BL2rzlNy5MxoT1Y78u7eirNsoZKGt74xd/Uheqjs8S4
	SLCUatrzEX2KUs5qSxGZKg8SkfJ4ZmOPGA8yVRzqO+ObYSNKmRtQA2G95qfyMsfFzr4yYBtxssO
	b7Msp5ZacfuZgoykiLkYFtOc0qCbYBXfKikEz5OXeyNSJ3gXRJY0okLoiZdvgmCjI
X-Gm-Gg: Acq92OH7ONlPW0uBY3ovz4arcosAurRRhx9nPu836nqiHs8PgDlIXPI/fRXTq+gR2qz
	+qnMGNIQ5S6iZSo1PH+9df9hRFpFXYUr79U+wFQ+JTNHP0cLXWkOdxsnERQoshg6f6iEMsISNm7
	oa8zas/sgY6k9MK+PL93Vi+q0HH2hkAPSJ08y9b9dV2vfmy+odlU8Mnxb8bbnetsW0luSqGT0Zk
	GvrHkQhQSdMxU7oApjrVfTyYvTkZbpv08bogVglbWVeQfznBsGFVHRb2NGlT+br3E8k0N0/Th8w
	Hvi8/RgvDoZaifVLYI6ZsY7U5lXjhINFxCZYNHxXcssDpVbIBCKt7nNna0nEYgSjAgNIh6swR7C
	B2AOqcANvXU4RRysVzi9xqaqQvLNWCvc3KhVjzpuxHZJwqcLBbEqr9TI3
X-Received: by 2002:a05:620a:4694:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-915e6d7a074mr264143685a.4.1781007701705;
        Tue, 09 Jun 2026 05:21:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4694:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-915e6d7a074mr264139785a.4.1781007701248;
        Tue, 09 Jun 2026 05:21:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e05199sm1006369066b.29.2026.06.09.05.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:21:40 -0700 (PDT)
Message-ID: <1d15a420-7360-429e-a451-ec1f012a0346@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:21:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] ARM: dts: qcom: msm8960: add RPM clock
 controller and fix USB clocks
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n_schLdl9FtpRoJKynOq1phqWMBb0gJD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNiBTYWx0ZWRfXwlnaD24yrxxf
 KuxN2aIFvQCOwVWBXjI6lIkSC7TFRsW9PU0lO1C9yww7xVMB7Abn47N6OW9Xh1dizVfq37tevUG
 m2GtopdFG3yUv5n6aBynOz0rF7DALI2O3LlueA9n6KVCYVdlGpaFDj4grnSchM/iVpcbpgkecco
 lqDW+F3g+7AGyo0tfLHr6yV7OfpAtFkTgWvWTQrXaf1ZzL0o99bdplIQSRuATA1PsN85CFTThjd
 9Ago7T0npBz15lLQEabQyNleG1t4LkaC6nfVf/+hGHfQzYl6dnizo6LA/oI1wTO5x0j11wlWdyR
 ekIFycY6/zV7xj849MQVBzDS51D544xEblQpI8hFDHFkfeOVCVED1gB0iZc5iz/hq9U7TTDE+gp
 52ffUPBfZXYiXf2TlBoan1FBpsRYXtii0hAKX32FqIWQN+72UTlmATxNfP2bJoBpbEFK0pZAeZA
 ahXcTvHKaln5bW9ZMsg==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a280556 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=wxLWbCv9AAAA:8 a=RM3L-PboR186kqoymW8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: n_schLdl9FtpRoJKynOq1phqWMBb0gJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090116

On 6/1/26 10:51 AM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> The RPM clock controller manages clocks shared between the application
> processor and the RPM firmware, including fabric and bus clocks required
> by several peripherals.
> 
> With the RPM clock controller now available in the device tree, the USB
> controller must explicitly declare its dependency on
> RPM_DAYTONA_FABRIC_CLK. Without this declaration, the clock framework
> would consider it unused and disable it, breaking USB functionality.
> 
> This also corrects the previous misuse of USB_HS1_XCVR_CLK as the core
> clock. The XCVR clock is in fact used for PHY/reset handling rather than
> as the main core clock.
> 
> A similar issue has been observed on APQ8064, where missing the RPM
> fabric clock dependency leads to broken USB.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---


> @@ -507,8 +519,12 @@ usb1: usb@12500000 {
>  			reg = <0x12500000 0x200>,
>  			      <0x12500200 0x200>;
>  			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
> -			clock-names = "core", "iface";
> +			clocks = <&gcc USB_HS1_H_CLK>,
> +				 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
> +				 <&gcc USB_HS1_XCVR_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "fs";

The bindings change you sent changes the expectations - "core" used
to be the first clock. And I would guesstimate that the
DAYTONA_FABRIC clock is not really "core" - does downstream do any
ratesetting on the other two?

Konrad
