Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0448C3DB622
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603153; cv=none; b=GKHNzwhLkz8eSu/j94eATQ9sF1PxrMrS38n3mRN/yHP6oWG90hEoMRPvydpLlAYC7GGAdEeM7I8SMqVv0dr3J6Hk69O6B6Z+OiJZePeMxlgdffFM5sXdV9k6EC9xRQGbu375na7qbyyVlgg8b2o7uFHZCY7iW0l2xmjonnH1Gdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603153; c=relaxed/simple;
	bh=xXX6viTTK4rT+ZYOh0YjJH5pssE8usT9kMlI3qREXKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tnuj3XRrAligaMSCzKjflM2Hjc0/lHxlP4YLTaspvvnrRQVLB0x1KqxhiRIHDpYG3UeV29TyzlbgqWJ/R2JltXLB0DhFB73dVD2MczJfQiJ3IIdtddBqWELXlgrp2u3KWmnRnOJMwaj/YGaXSv/gb1JeZY/6zqrZHd2b/WA13Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6HT+idO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kP844j74; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6HT+idO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kP844j74"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wFEU1710589
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kap8a2d5utPscRD6dfcnTmPrvWlPawGV72177e7PtSE=; b=M6HT+idORQ04IMt3
	269W5hBiYbrTuYY6bJkV7cXYBNGp4ZiLvnf1zPQ6vxmqz5MLoN2HWEw5EsbnbxqT
	oNYMPjD7dDx6+dPX0nivQixL9AMn73OvvfqE5+KvnrP1FgxRqh6LHTSGNNo5afAk
	Qth5n6YDaHTS4rwZCd+ulTL9624A45lClb0fNtSrBvLEEVgA99g4JMx/hVbBGZyR
	uof+ENbHxetLIBn/vYpI6Kdr+U/W3tnqQK1YPZg/I2Y7NzW7iHwTRXpi/PaoRZBx
	n+TqFiszV/+4BW/cJtwGZ7DTf36bG0vQoiQn4LznKcJi0/w5hH+YN5+HWHEEPcoG
	t+Ai4g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxvjbd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:19:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89ccf10567dso8199746d6.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774603147; x=1775207947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kap8a2d5utPscRD6dfcnTmPrvWlPawGV72177e7PtSE=;
        b=kP844j74KQst6iVXFiTsD06A4p4+C597LHqHrHGajNC1bEJkPXBenypqsG65+Zx5KS
         p4bXxfR0S/iBC27N+IoC7E2Gfv+0pvZciatRGZSEbmz53uyOBiAaw7ba/4s7v61KnO7x
         ABkD884ZVPKE+zLV9TC6ikM/RO0+qHbvu+xTRMq6XT9tTJYKzFVZd2d4FyVNx/iW1JFN
         6HvHs2jmLalv5brt1C7LiKaI2vcKoUPrc9hvz0pRYH4PtQXpAdU6Ibf6WTT45mxLxCfO
         S1QMtxoaMBmfC4mXcCJEt5QK61McpjU7lwBATgyWkW6BkyRgkP23jN8rVViAgV2NfyGP
         w+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774603147; x=1775207947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kap8a2d5utPscRD6dfcnTmPrvWlPawGV72177e7PtSE=;
        b=WBm+1MI9YlPJ55ur3GlshKU4O27TBHsU/bOhDtDXSRMEXmy8HzLUI+Wi+ESZwCYnmu
         tjC8wM7U0nlIkMNhcx6bwH4d8779TgMKTiAsAu2Xlt4HSWcBUhcIIImuIx/j1yjKE75k
         BydRQRuO7FO5GAwd1Z6ddHYQtkqFIqghIRIdmcw792faHjPKvUPJKI0997JV9C1sItrZ
         /rC3AkMcynk07wjdiknT8Ue05joJQpAf6AVVLQLo70tG5DvpmGoazS7FTC6JvcgpALza
         qTjfKImXI5lvq9tU2732l4H56AJjqwwXWMltqgOA/jLtvr4iI5FmjYe1l++oTVlrun4E
         b8Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXP4ha4U13M9EvZXg0iTrJRbSjG2b4oPLbeJllBkyDnKVJHWxmGzsWLrxlh9VCv9BPSKpDhb1//HBdw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7he5Hk7usLLl++fZnr9p6awFjvE7OEd4UfuGltPKVu0UJBhuz
	dInJIsHAn8lVmD0zbrgTh4dKXGyvgCjUzcWWGNFBtcPzxuZ/a0ndjuUya8H6cqA0RpN2DFkQVvo
	bJhNhUUvd7wUNInBaKDiqiXRKI+//KmwWfj8RmHU5EiKWQNY/G/CCD6JLirbmN9c+
X-Gm-Gg: ATEYQzwvZyc4FFO3tHpTMR/LoWmOXjj9ibp263/KxdYjktlTwWFeyiU1JAa/foKbkN4
	Sog967GsGXY7FqEPAczEBpmUTHoOwrSnG4YGImN2WkV9DFuOoWTC0PfWPv+HY1omWHoBukuSznY
	5+5rji9nXSpMlLPjljTRm3VREzYgheHaW+NAovKKRZ2awhPK1fEJJ9HiB8XRxrPDSW4TAjw95vv
	ZFNt0fqFf4Ib9mx5ZpXttHBxsIIouV0sW5FGk0bx6nUjjvUjxONLFcetC7nn1qO3AisV1QtKFbH
	CZbywF+qvIO9tpRv3d5/ZRmxlNHsPMUdgTHTEp9K4X7cfxeuiOaQ2MOJck/x+BsFT3y86mipvNt
	qlMSAxiKhQD/f4q/nP+06t5avCmlaMJ8Txpn4W8WhQ9emAy/o0ruFo3GiCG8QUidlow6XTVHLtz
	VvHyw=
X-Received: by 2002:a05:6214:2124:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-89ce8e27f81mr15161836d6.5.1774603146752;
        Fri, 27 Mar 2026 02:19:06 -0700 (PDT)
X-Received: by 2002:a05:6214:2124:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-89ce8e27f81mr15161476d6.5.1774603146205;
        Fri, 27 Mar 2026 02:19:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b202663a3sm217738266b.25.2026.03.27.02.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:19:04 -0700 (PDT)
Message-ID: <5f054c57-edec-4847-84d8-f0c769f917cf@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:19:01 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260326184126.9280-1-nathbappai@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326184126.9280-1-nathbappai@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8gJJTf8eJp70SD2F8KyBIoWQZmeiHIop
X-Proofpoint-ORIG-GUID: 8gJJTf8eJp70SD2F8KyBIoWQZmeiHIop
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2OCBTYWx0ZWRfX6zHsZmzsEYzh
 P4zgLx/N+faQmWbhBclyByqD7Gxwh2u6wNkJvSACQDdcvWUTkKTnh/opXIYWUco4u7/X/EKgoEO
 RnzNzooS3crvDahH+YocqxQXJN2wOXxvFdsN7h9aN9uYyllfK8gr3OnUGHv8NkFVTs6BpFZnC85
 jCeBwjZq+uSWhXqugavdz2RGTbxBs3d5xVO0kU9Gh0UAF9YMBAdhPaK2kA4x87/Ebf8ErnIaFk3
 Gp0M4GfOAUZRfJIHH9HzIqzX9uXn2T7GjRSY5Ba5yRwL2C7wWbqX5+swKkyUB/WS0vivRWvOps0
 e4/LK61SMvrVk+Vm3PVtKWKfEPBtVJ2awWvNmg2EGasEAlUzCgsXrpDOXQBm6G4m0sOYw2gYW1O
 8/5i/lYQcWNDsdxtNrOmqyQXiy+7pJMSRC9dIzkl0c8vurGeCZWnP4MycIn1ZSI2rh2X4kk39OF
 hNkr+nJ6dXAWev780Hg==
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69c64b8b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=PhFLAuRYng8QIqNMAF0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270068

On 3/26/26 7:41 PM, Biswapriyo Nath wrote:
> On Thu, 26 Mar 2026 10:29:49 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
>>> The IR transmitting LED is connected to SPI8 controller.
>>>
>>> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +&spi8 {
>>> +	status = "okay";
>>> +
>>> +	irled@1 {
>>> +		compatible = "ir-spi-led";
>>> +		reg = <1>;
>>> +
>>> +		duty-cycle = /bits/ 8 <30>;
>>> +		spi-max-frequency = <1000000>;
>>
>> I see the binding allows a power-supply handle - do you need one?
>>
>> Konrad
>>
> 
> I have tested the IR transmitter with my TV and set-top box both.
> power-supply is not required and not mentioned in Android devicetree.

Thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
