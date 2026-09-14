Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEB03DAABC
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383690; cv=none; b=fsgQFVk/o8G9i5ubPUcNqIAdt6S0UalTrNU59eA2BjczxaPVYtR8dUlkwg5E0LL+1uDASQpWVbOwv34ufG7a7kBJxypjodONDQHjxlkPlc66dCiYCXUHu/lKdn+eyfkbh95fUkPxL+YPFoGzuJ7RwI3A+7unbYipR4fi+jgug28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383690; c=relaxed/simple;
	bh=NqPCmk4Z54CGp183Dy5ykZwaZOrEpc71vqW5Cm11q9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nI/AfwERj50+A5Ha+RtHAMvCUpKBHTAUoPlBySRGbeZwAdgzth7KuXcThPAgZJSYoDS7hzTCJDqw+KOM8/gG1YRVAKDEvXvQZ/tBhYamphKShTL1La4oXmzo11DSaMZOF/luFluSMo94ZKIIpUNZMSLlzYo+AMdeQ9fgykkfSDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASrX1lgC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3tJ1F70; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ASrX1lgC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3tJ1F70"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmjeq216287
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pInAVHMlf/Eve6upG1Qt9AIC7c+11ZMyUtGAROpIvvI=; b=ASrX1lgCvhQIVIvO
	1EG760KUa7qJodiqESefAiJoWTwkFlGbr74Q8ShN9j3PL446Ml5p97Gcs4ss1BwS
	QeVC/LI6fNBy1rKgSvNmNuwTt6eRDZBvKhHYsk2vuz/RbsKNMSn5Zc0WrflUfJ4p
	Zi2g57bvCtQM+Go/fyMSBFu06T8qUI2545mhi8Tp2EAWNP9u7vj9l7O5OE0/npve
	y9tqDbOxa4lsl8BIsJJKmQwyH/F1qGsCZ8iV7j0bpcSvOgOjwdCvcrDcQKJJCLhl
	B0dhUtHq1uMzb4MoJGoDQO6i4TQiYRDGdi1mzniqlgHr8blWOaFeVF8b2yzCq6S6
	KIxBIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dea6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:01:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f4002c1aso38613485a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383682; x=1789988482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pInAVHMlf/Eve6upG1Qt9AIC7c+11ZMyUtGAROpIvvI=;
        b=V3tJ1F70PejshscYpC6BsBxp3/28QtZrXcjDIvxGsnjLUTCvIFo4tsrbyjXMCYT6LC
         r5Mq0xxMol4cjWozN2DJKTP+QpJpXMieCJIKbjCWbPDI7n5nBNIGIBiEERsUvcdtfxOD
         9oZTlHiYk299vVGy7nfAtAB1e2balRVfE9FepNcLloH81dv1k0sqxzWC8QLbtQVj6Ujm
         qCw4mDcBY+914sKeVeVY3VsxbCrlKs2cwaZ47SuVskEdiLKHC408pCjid6TTfxhUUZMN
         q2fIb4kRKWtbj4aJsfpEnHMdB1FND/nyjGNdIFIQQEXxhtOoI+4hT/oHbX5IzIpIe4Pn
         TmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383682; x=1789988482;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pInAVHMlf/Eve6upG1Qt9AIC7c+11ZMyUtGAROpIvvI=;
        b=nspXUnUxQIXAIYphohCjSr/JNzQk1VGuS1pq5F3v5X4oZQE31bxIZqsCPQS20fgYuY
         PnQ3bZD9AY0Yn6TwOgevIooI+97A3J/vcfdu7M7q87hIfR+QcIw0ab61fpHeg/cbc22w
         gbFsmX87rk598w2Uubm9L1Zq2TxtgMyy/EFI0b6JDd77n9jTEWRHVoxkxbXtVJZ0g6FD
         yjbU9OyP0AstWkZQEOjYOIuFxhTOPEe4yn3ipfI/yRt+xI0lgptBNoDsDWgdTRAaUObR
         mPtKiHx+bZtH22hDxjlbN5Pl1LweaZoK/BhZcQgxH0ip9sLUQvMbp3ZxXbgO/QC/Y+3M
         7ceA==
X-Forwarded-Encrypted: i=1; AKwUvBx6x3Q2YZ5SDNrwB9nKTFKXiKbYfTp+9+bKQh7F9bgZNPJl/1Vo7g0I77WwcLCMDFhp6hcwhkTJB7lt@vger.kernel.org
X-Gm-Message-State: AFuF++l69vX2TJoFFFk8UsdqBTeYXL1VyTCRNc4QKSVDTo7Nu6H1UuMi
	urC8XwtgWV2JT0XIIUIoWhsXOeseFdPN1ob3iWIRXHAbK/wYdu9AC3C7D3kJAY/RZ2KyCyodI6S
	BLFhT6LxVopfBBao1w0k9G+a8uEFLUVAF8+9Ztwbd1EfPdR3C/4v62s4InRKMaN4d
X-Gm-Gg: AYBFou3kxm4kSW/RaKzjFR1VZ4HU7xfe7BLWKKQP0V3tnr7e9je9zsi76DJSCg7vfPa
	haGcHM+ecwA8/mL6+9Dt9cGcC497fTnTev9B/mTAKV1DB4t93AX9czewudqKkMlm/l8vCtP+g/z
	i7XESFAgakjh366jyKhRtPH3NMMexzLaZ/w42KIa6zNKBNuydhcGbx4a+dZZbrcimBeyA/On42R
	/Kh5h1P/BT6uDI+Sd3AWBZGVMBD1tyjdVXwkxJTs11OXFn9lRgdWuwFf4Z94rrnGAHa/NIreFd+
	X9a1/xUGH5RUxtZAPAEZV7IGOE/KUye4D9NBw7mTyCGI1ksEEAKHJINqrpb4JXvSaULZRakD9FX
	+SCow7IkvML8tKidvyQo2aA==
X-Received: by 2002:a05:620a:3704:b0:939:9ef4:79eb with SMTP id af79cd13be357-93a29d48104mr216543785a.6.1789383661730;
        Mon, 14 Sep 2026 04:01:01 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:939:9ef4:79eb with SMTP id af79cd13be357-93a29d48104mr216340985a.6.1789383649101;
        Mon, 14 Sep 2026 04:00:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966063a2asm405283366b.27.2026.09.14.04.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:00:48 -0700 (PDT)
Message-ID: <72b187a4-fa20-4bcf-86c8-55475643db4d@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:00:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/34] arm64: dts: qcom: qcs8550-rb5gen2: Move PCIe phy
 and GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-10-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-10-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX38T6hhdBtNPd
 F9bYQ8ziAGdZf+N8Oy1ES+FYZ3H2Ca2BjwSOU3IS1CNWgD5xyoPPqF/KY049vrtCwuPPOO5zuGm
 aB8xf3UqdFbYGVH7zWFf6gIMY0H07ejwwFZPaISRnMlALPgCMn0VuXH/DaGA7MdL4X6zA283OVK
 ULnW3i/wkHbqoqmYEsskngJFNTj8trY75Av5y9/ZD0JSfqx9tT8V1j3FS/rfduY+5tlzq9wOicM
 KPXvmAGiWLdihjt+Z/tTyqD/lbaoxO5+FxNNszUhxds2bcR6C7wWJtUczvV0mZKLvToeX84T06A
 W+vqj6r+zbLI1csSuEL0yLp2a1iqEWoCoptkzBiNnkfsRrd8+Llh9bW3VyyOCsqwjA/BSlZvNvt
 GMV9UvObohThkhJzQwlKSXmrltanry896zAsspgs1uW/l1Dwer88mOaxQXi/aulcoQsVmCtloK9
 AWrxTmsfUWpKYvxaTbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfXzYy6fz/5Q+x6
 RZFu0TK98HWQWHVESmOTQAl06h06i5ppsci83/GFtQCoSrM5rxhArCLh+T0fHZzzEqW1xoPJlHe
 Bjl68AgE78BpgDkJOjaHEMP5moFFtQY=
X-Proofpoint-GUID: a_SnW4YULJ9o0TllrOX43myUzI6Cz-eK
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7d402 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pBeMIvr_L55ZrqE9P54A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: a_SnW4YULJ9o0TllrOX43myUzI6Cz-eK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140156

On 9/10/26 3:28 PM, Krishna Chaitanya Chundru wrote:
> The perst/wake GPIO properties are per root port and belong in the
> root port node, not in the RC controller node. Move perst-gpios/
> wake-gpios from the &pcie0/&pcie1 controller overrides to the
> respective &pcie0_port0/&pcie1_port0 nodes, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

splitting sm8550-renamed from sm8550 is a bit excessive, but anyway:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
