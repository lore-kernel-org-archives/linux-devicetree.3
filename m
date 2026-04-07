Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20762F28E3
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 10:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557824; cv=none; b=pXZlnU1UJrQ3G4emMRt4KdJ7BSusc/UCfNEui8oX3DrpwZfJHKVBONnaFyVPIQM2k7UiD1dnXsy4ZbPnX6JGe+nq+rByTXCPeGHwTeT0Zk6kQgr4w8Pzy39CV87pJvRCn2iWJrP3TZbzgvRn/aiMw3Dz8+GDD2GNIZsiO3F3lko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557824; c=relaxed/simple;
	bh=kfFx7m0Kla4Oibk5jdaHYReFM8hCk3zhSmSJxrtCcHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9dOwHm08MTm4cRE6A1ylFHsSblLJCEeZc/uHOaDfC8l0adVXyVfMn0iMcKUKfYF3+9FvnCWyHB3RkIApWbdhgiZaECfoo14hDlgmW7Beo5CW1/p8bjl3rpkeOusNEsQyq6g+f6y3LTeGeJ5ss70A4dHIa0UWkvI9uB66HydRtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXS8Wm+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTVYR1O7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXS8Wm+/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTVYR1O7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376XZHk2550172
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 10:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NmHqlg54vBPFph368wjHJzU6/A3tTDeU3UW0DJZT35g=; b=lXS8Wm+/sHuYTbr2
	fUqPTFB7C3j4FBWch5Llgs8xNJuJJYrCNg7YOtmT7ptcFOkjJw+ccSw6GGEetUWA
	NmcvLOBQfrclKzZvB2yeVhaejt5P/duE2mCawpkgXS/N9f6OVu7xO5nIOG2xHma4
	yyaIgtpQ9AnrtBvp2kIUYJvkuseEJ6Bg8KiHinvJx2sg/AMvuKDmFkLT1RIUGD+n
	OlBk0cJNWTywB/6VWkVSPSM7wE6wGs34z7698N7ViBWr6pw2krIlr94Bb1NGt/NY
	RBfCTeYjtEuN3DT5e9hh7PEJkC90tISQVUVaJtLgjorh3WGre0/iPbCqyhQO6ET2
	EL041g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrea9yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 10:30:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfd003bfe2so131127585a.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 03:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557822; x=1776162622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NmHqlg54vBPFph368wjHJzU6/A3tTDeU3UW0DJZT35g=;
        b=CTVYR1O73IVZAI8xtynf6UaLBP6t867+i1O9xoL2JqN3/TE5kdo/u9+V/M5hW1g03S
         K34UfxF7P+Whayh1rZrzBl0nCD2pxdYghlXxH7FR3GT964ca0blhC8VoWlobfMDTMax0
         7mMvWW9QTY/2xMQpYg2PVl2mTWT30jYIVXVCfVGlgMoNnpz1cGh4MwWF/TsiZf71yaCX
         rRIxyxmhn1EhbWHvnkHyONSlBasBP/xWofVWpWJbebiTUTh1EpC1gcZUupnMQ/zxZlQj
         fgznqRyaYp89QVWQuh9BMIRjf8pupdLjp9CzpYR+Z+X3FdiGn97jmFc1vrLpWFOFCrRU
         gxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557822; x=1776162622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NmHqlg54vBPFph368wjHJzU6/A3tTDeU3UW0DJZT35g=;
        b=n9Un1KnsXtO7HeSPy8k7Jl2zz+QpM41xncXJB7lDb4SoLX5Y7E9cM2ymy3L7h8ogRr
         ROujI8SdZ9D8smyKK+ChOj0KC4ri6NWNZwzVzTEh+tKvwQFGXkbEgmQ3kRBuylegjO04
         RTAjxUuSF+Pyyw+bcDwclsD48JLvTcVRqoEXKCRESmXUBgyEmDpc+G3UijXfWLR1mRUv
         n/U8ybN9EwVpIgZ//k8Q8yI/qZfwKY8XrjwEKWFNTnd56EufIUo7vgDSpj4WdfUDDKJu
         Bvk+WkAVpaLcC+JG7K8BZBVbNRRt3hIJdeUYZdGoyXwNhaqQVjaYJQeiYOoTxCbI64e5
         lQGA==
X-Forwarded-Encrypted: i=1; AJvYcCXY1m1amuXDJei2fa1JsTCJUxJoyf4Pwq6wobZXI2o/V9/XsxvyW2CzIsBANRJD/s+XuCi06i8Q1WaN@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz+AQV0ry7XU+Xby6iOFIjjYxtvbn62guT6B/SVd9tJ8f+ti49
	fs67TIngeEnR1lEAHTm3/0I/TmeIj1lTyGJu7ZlTdEXZay2dnwEIxELl+B649OQvNoiRpm7R6P8
	3xFKvhc07qEvrlVBWeRxLzLFuSaNTBrrgB6Y7MlMERbAuc9dno513bSU3EG1DCOkU
X-Gm-Gg: AeBDieseX/ebtwXBtxAbUctvyasTEFZF7ELbVDuMt7i7B+1cu2krBZ3WQtmXswYWICu
	bqCYidLwrR6byBF1Uh8LNrPVDQxmzHuMIB0w111X0tgQT7pzMyksNGKzM71t6bPGK3wa1wjWWi+
	VvSU1f1kWCOSXi01CK056rFi6a47/tz3VSNFOlcymVJaW+Hu/vmL2z/jRGMT9zlQgPYFDUmazBf
	OKnf88qaKJEX1w6kEDA0KVUbwL1NJIOO7qx9Qwo5OTUUTg/O1p7kCnOAxxUljfb8HCajPeoyFmk
	UC1UaxhYpwaHSQ6SXRIrFGkb5bmUL/VWdwImlk1StDR2mqLVhT7HE9fckeNmAGsG2OXfuKXCXP4
	WDQjwyCNauAOxLMkYlA6y097BLZVSzZBotYPxiaHQWm2876PSRDgwEKk53xI7W4+6yzaoyCZQHF
	bYDkA=
X-Received: by 2002:a05:620a:199d:b0:8cf:c757:f1e8 with SMTP id af79cd13be357-8d41e81fe78mr1565719285a.7.1775557821885;
        Tue, 07 Apr 2026 03:30:21 -0700 (PDT)
X-Received: by 2002:a05:620a:199d:b0:8cf:c757:f1e8 with SMTP id af79cd13be357-8d41e81fe78mr1565714485a.7.1775557821327;
        Tue, 07 Apr 2026 03:30:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a74e8sm4185135a12.16.2026.04.07.03.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:30:20 -0700 (PDT)
Message-ID: <9788748f-fd4b-474e-9378-8ffdb9b18527@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:30:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: milos: Add IPA node
To: Luca Weiss <luca.weiss@fairphone.com>, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
 <20260403-milos-ipa-v1-5-01e9e4e03d3e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-milos-ipa-v1-5-01e9e4e03d3e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4dcbe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=apJo_pz1HnjGAtgFfvkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: FwSg3UZJIMmHmVDFwo1gGaEKwJyTEo7O
X-Proofpoint-ORIG-GUID: FwSg3UZJIMmHmVDFwo1gGaEKwJyTEo7O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NyBTYWx0ZWRfX8TmmF3DQZ/gO
 ZleU87wNvRWqiMNjEXbMN+vjS1EZNDmHxcme8NuN25mGelZIJ+9/fz8TQafEOGm130IWd4SoJKg
 5Ea93i8xPzXZaf+tjpO4bJgAEmGIM2cF6MDTlQ0MVOjNnye23pLaZSNbrVMfij9VK+Nl+IW1WLn
 w0P6jZLjuQ4fR7B4kdVgzy2myDphKiBoq87NGhUe+qSk3UmeIdb2l7YXEDLTX1IshiSFsusLfW8
 d0vt2b3nvyCM7wea4wPvg673f50EXL508x2m5jI6GIvIaMcfSmPIgEZ9hWvhnNds4exyUInpAzF
 dnYS05hopRPN6qIK1GhJLNc7z2ib1Tq3SG8THZCaMM+voSGg23yA8W3ZgjWS7T8XBLV8eVJx9kS
 tCRdUrs952TgDD/24Do1Zfv098UBPC9Qrn7gjR08wVYuluhwpspogemcq1R6CwyjNjkC94byLCJ
 vNnseNcxHEVKqUa2X5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070097

On 4/3/26 6:43 PM, Luca Weiss wrote:
> Add the description of the IPA block in the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


> +			iommus = <&apps_smmu 0x4a0 0x0>,
> +				 <&apps_smmu 0x4a2 0x0>;

P.S.

I don't know what's the scope of upstream IPA today, but it seems like
there's two additional SIDs: 0x4a1 attached to an "ipa_smmu_wlan"
subnode and another one (0x4a4) called ipa_smmu_11ad, perhaps for
some tighter integration with ath1xk_ahb?

But again, I don't know much.

Konrad
