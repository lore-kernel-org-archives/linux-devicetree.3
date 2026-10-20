Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480290;
	b=ACHH6ISmb+tepA7SwY7bx/8Aw+L6mXRDLdaf8ZCGfU2iH5wSO2Zwp7zXfWyBe7P99Olz
	 k4uOyFgzl/VEYxqdowPL+kutdLh/JpMJrVniFp8HmKABCCVDSEMuZGLxxyAbSqM1PA2Oc
	 zNYW+XSmem5kJk8c696tz2s8RKfyy12T8PH+jlxAUXyi3Kq8M0eZQi+cZ9v7KgnW8tGCe
	 UsCToL4vCaI73WrYwwOKPj3nS3xtCo5DVwKBj4whRbUdeYlmmisA4vYNk3dheg3cCRFi0
	 xvFsaRjBxIqiWxZ24lktdbRiPciBsFU+zPWNgkE78BLwuqgNDZdVkgkYOl16/uTiZTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480290;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wTX1XPUrH8Y+FoYjz13zUU9//OlPh4ZooYpUqnx0wTA=;
	b=XHQJubJfwxiXUzkEIltCcmMpQkkMTLOKfW7IB7HOgkz5kW+sBsORHKXKXeQTuVVXUNRo
	 Mef2M+O7aMquENJ2eeEYOWAfMl4oXCiMQvikqR8OZZmW8wy4xwuSh56zJ2dfzOEdAkRt1
	 b2m5uzLB6lareIzifAT8FAJg2Fp3pE881wM+fZWFv5CqeWULZFBv/7p0N22tHW2WJ8U9l
	 yU6kIo6lKFjLIFc/PtE1IV+LVsIAP3wQYy2U3671tDpkKuA1PRii60GR03kiynhEnmOnh
	 HRx/lrxlx3z9wDc0nRc4NNSS/sdaUYjIpoP/mZRqVRckwdAPPK0z8by9WIvI8Qpn7WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLerq1Xf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evDz+Z51;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7A5606A336
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF7A5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLerq1Xf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evDz+Z51
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tGkl1254986
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wTX1XPUrH8Y+FoYjz13zUU9//OlPh4ZooYpUqnx0wTA=; b=fLerq1XfWL0LqVaw
	Ktqz+9wIp9AdPxGf5kZdqOdJj6h4ARs0mg51SqZhjHHJbom0WLOIMreSGHtGmb9x
	bno2pBWyH+3b+DKnUPt3pEfX2d6kN242wgNvc2h+Cw9CPPUJHfZx2vOvxloqkJgd
	YAcsOxVknSZ10CRZwdcWCA79VO6+oIz/QeX+yxfZliso3Cu3GqyvXoGgszgLeIEI
	g12cPBYCp6T7yhfZyUKYld/yS57OHooBztGXO53qMWlkuKWUg4lc4UN4PhDisVly
	EL56zvL6g8TQQWKmDhNHwQ3z4hgX7er0sKXTUN0X8uAIpsIhmWIvb0Cvw9lMSimb
	9FfV6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n9afq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:11:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93df7a9466bso43793885a.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792480287; x=1793085087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTX1XPUrH8Y+FoYjz13zUU9//OlPh4ZooYpUqnx0wTA=;
        b=evDz+Z51PVZQCgJ6QR0OfOlawoPCURORf4Re5W3IAIYXIrgtdWkOe1qgbZF/8Vhe5H
         2PqPwF25Avx4/ZPmOU/yqMuFvJH4+PTa6+cuoSvQE6AOLp/7Sy9l2IkN53LfO9T9JHlh
         gqWHwxVQ1ImHLijlNVBhmPmdlt0UjGakZN4GNp5XeoKvPZkSlxz4iYDZYNT13Pwxzv1J
         7i2455Dx0xG/dVkh97ZVizQezpqDo4oZmEHhajkyyjg+b7vEA2KosnebjR6/IIEeJTNA
         IfycqoPNlx5zwFcszKDg/EvdhTLWm8GYnajF+SI9pKHqzO/vTyGfHdo8+Z8uXKYAdd2K
         9ySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480287; x=1793085087;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTX1XPUrH8Y+FoYjz13zUU9//OlPh4ZooYpUqnx0wTA=;
        b=IkcZv9/A6s/pRy+A2GNwtlsx8tvjYXy4+pBH3pMZu2XXHwhBXeQB8nRzV+c9T5XKbG
         Xz1Bt51kF5u8kL767peXLFA23gTJr+/3TmOMujoWUXGtUZli3i8/t7+ePtHyyWUG/wwg
         iYDTVS/FCpF6wSeQa4uE9cLGKVeMWgvezfDkRCsbLn5wcR9pJQIGhtRir49rtjtIGU5j
         Vle6iyub7N6S8DyeDSxMP6SXeXArIA8cPaXE8rSuNAJ6YAFlBh9kdJdTOGUTsFdDc5yS
         0kfE+gsozctQGvXB1dwCbM4u1hrVvguFiAzYweobnp0qYWCUvEOrODCfuuhdhM/abbZE
         2U1w==
X-Forwarded-Encrypted: i=1; AKwUvBwskNSCwKtpFtqy46yUxGlO/RbE+a/m0+7HZs1BxmL/tg13C273Kfq9Ff38kWw3QoqK1vbyJNDiDkws@vger.kernel.org
X-Gm-Message-State: AFq9FYK4Qtk+TI4NDw5zhOF4RcfgrLGqE0q2+cAmLLmudJyuJJZTFXNY
	v+TRW6j0NlEE4+Bw3Gvkhlm1Y/VmyyAc8tDCUmQu+Whc3Y9izxQ75+nOJTri+wcGoTyNTUcDwn3
	4VL+tyAPh1PQR6W3k4qJWTpofBScTRDRfeFPPsXiJlJR+D0pMrrBJFFDavkw7u+tW
X-Gm-Gg: AYBFou0fOmF93TC3uSFoy6yK6KGz/sETGNhOuWZ73mp6euUskJYN+5bqAZpJ32pXBwV
	i0K5o30bYOLuhZiJ2s4iKMw61vkoLmqFrJfKYnvEjOOk9jfhMcMzjudABk0c1OgCP4T4TFv25n5
	nHgTfDAux3u/Ek9/820mW4N5AGoltuiyBJJlVswZRtOQ3dyXg0bGyvxgiBR+g4n/1+abLu93MrY
	F3N/wAmL7OIEYXUD8L0oYGA+7DseG+yKCmLXlqIkcXwHndWsT6W8ozG0ngsK55T9fB1Wdl/MuD6
	MdsrCpDqGaUf8H7A15poagN45tNOryeJEAXuPhCqB3g5vyELIuWamkLaGimDTB+sOVGw2CNpzTn
	K8zyEyq3necYDYTB/kOzwHA==
X-Received: by 2002:a05:620a:c4f:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f29cf1ca8mr1876234885a.4.1792480286838;
        Tue, 20 Oct 2026 00:11:26 -0700 (PDT)
X-Received: by 2002:a05:620a:c4f:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f29cf1ca8mr1876231685a.4.1792480286369;
        Tue, 20 Oct 2026 00:11:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091fade41sm448370066b.82.2026.10.20.00.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:11:25 -0700 (PDT)
Message-ID: <c694383b-7a22-4cfd-81e9-0a06ded60393@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:11:22 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: msm8998: add interconnect provider
 nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
 <20261019-msm8998-icc-v1-7-c2da3934b6c8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-icc-v1-7-c2da3934b6c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9XByfbs112z0uXoMzSEEslPB6wlRK63h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfX2X+Yz6t1pKdo
 iRwtdXPO6XZqY8amR00LXEX75MXdDoncYja/iCzUAUti7PZk56Ex5OU9jvZszQGShUxHou/AYG4
 jeMfrp0SQDjf6kw+e7LA0pVUC6QvibbsXm8nTsNCYMMf07QSVlaA0nJqo+zSB67kFMKcpqWCO9T
 EfKFXWzi8Hca8gJdLKj26CR7OyXTEY0ugtORLHRT8zjZ/ei5anqO5+sFUOGb+Yyiyicvx2m799P
 tRrvpQr+GOVY9TSbt6CVt8y2jqBpRS8ti8W3kADa5zqB/ksIUGv7FSV0pJSUkS/qkKKEf4LDmC0
 CwqZJb8XoE1g2h9zh8ncKT40JM1ypyjnAKUzQumNvptFxnOlu1/W4tv/SaDE6pM3YBIqHkBKrUC
 PrQomN1ulSeF9/Ay/M6idlaUuamVWSz7jf9l4BF87+g1nBCdhTFAu0m+MTKres+caJR8oDZEOBX
 U9boS0nZFGVl2Oi4GBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfX9rCWiOCVagJr
 7KcZMP5XK2i6E6eyFE/6PlLlKNSdKG2gcit5A3nTdsdWvW+2y/widj9ejnpx5VZErhwv33qyy3H
 4VlgqsYww+o9t5k4L0fGYK5HdIqJW7U=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad7141f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QbpiU1Sgz_2JnChUH38A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 9XByfbs112z0uXoMzSEEslPB6wlRK63h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200028

On 10/19/26 4:12 PM, Dmitry Baryshkov wrote:
> MSM8998 has an interconnect provider driver, but the SoC device tree
> describes none of the NoC devices it binds to, so no bus bandwidth or
> NoC clock scaling is possible and every consumer that wants to vote is
> left without a provider.
> 
> Add the eight NoC nodes.  The AHB MMSS NoC shares its register space
> with the MMSS NoC and is described as its child.  The A1NoC and A2NoC
> register ranges are shrunk compared to the downstream ones, which
> overlap the SMMU and the MMSS NoC respectively.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
