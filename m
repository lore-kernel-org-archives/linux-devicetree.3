Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D792A372EFA
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165797; cv=none; b=G8drhxciKQqhTBYaj0aEAPXB8NUi8as3Vy2LpvWctwjjweBJSjpN1xPKeh0pNyvSkHwDJxetppzo9RU09W2wKdCuDsNH9DW5KOf3Qn4ZDf78UWXwu9PB+XwdfTIZCbecI31IG/ugpqUJVYZhPD3gv6fkQ5Z2RsIa9CchkD/vt/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165797; c=relaxed/simple;
	bh=l4FiHCpPsfoQnm+7s3ixfK4Agn6c35MKJ9w4PZwkHR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncuPeD72kXumDrzXTpREj/tjJdcE7P+SWtNNmokzfKbtGjGOWn0Eco0SJIDGCp7LPgMVQPuAygaZxO4IsbV9DRQYT58DZ+Bs+QrbbQ9e3jOJ8AyeMp/Ev1J64iZsTQafaWP2tvOFDQUADLR2/yOWN0M59TlXsGTqndREKx8ewjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LVhjJJW0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+KFq1kS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LVhjJJW0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+KFq1kS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GCh13843644
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YmVRebGlcvPJSWCU4070GFPfnGQnX9+1PkM8+LYFJ00=; b=LVhjJJW0g2x9YpFV
	rhbW0NZbDk/RLc9Y3CtEzTEq1h7LXb7SVved16kboiRZFKoKFAjVOmp6oL7F9ZOd
	wq3DcPIglsw9fRTSAhSxApQ3YvMui6ZG2emo7IUKYv7DIvE+dig907dSOg6YRrXe
	EJzLayWt1e+dnyUpq+0vOxTobpULPydh0ePzxuFBlfCD3+Pf9LPFm5Dr7STS9Iyf
	YM93UgGCStL1WwmOT/c6Pf1N22E/9LMa63tLNJ9bqvcbCGIx8lFxfmx2BesXHJLT
	M6uGXqpDeSn85eTa+ys5sM4Wt8jxiJXkwkBUNw6AnnwF0rU1PAp1SypDwhgL7Ywn
	wWr/LA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe702cgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:16:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccd1c3b9caso18428866d6.3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 01:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781165794; x=1781770594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YmVRebGlcvPJSWCU4070GFPfnGQnX9+1PkM8+LYFJ00=;
        b=A+KFq1kSLY31W8bf6evFQ611SJ2lqiaomYBMvBJfMCw9DW2qphdmBa4o0+BsLzF//7
         mca9F2xB7H4h5Xsm4CUu+dTbIlAUwW/7HaiXx6cc5TBH0xeCdv5o4VAX+SYUROUDnbhd
         PVtUGpTHlpLw/Yb2xYFondaR3qNMKBp/KL9JAl1UaKituZa9kmwCU0WYlenl4gzC5pDi
         FIccwtkCDT2UoxR/rCYYedhygR1xPbRh6UQpdCFMphSRGHYPw0COzgrAXf8t38gnrHw4
         LKGXElKL7w45kI0VESkLpAJsOTgH1XJy1iv3aAb2BbMUs/NE9dfArEzOzXZDoTFag12y
         9oYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165794; x=1781770594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmVRebGlcvPJSWCU4070GFPfnGQnX9+1PkM8+LYFJ00=;
        b=bIM1MWM8Gdh4vJBLa3ZV4vmsBgraIwBFASarAc7hhVZ4MAtR7cCurbLalvJ8i3O3aN
         8FCSjTnTvZPfAMwEB/0Z8XGgxkAUaHY5xwOkEPHqtsA8xaXPzhUUp139IFYuNKBaUfkm
         9wwE8M/SQso5KMMYoDV0YRYgG1UIZizCCegHcsLueAhsFGHU4ZQvliES7PkWMzGDBTEw
         PkkIKZ6vCGQ9H6iAqLrFoOBLP27z7jcbqCG2i9J95mJCbJUqRiVFDHZJYdMKQZX5gDuB
         ealx3jAmsbIKBgTOpVes+gxOtdhZV2ejcEel4MfBLJtTtYureSK9Bc/jvJZlaedjITPq
         3zzg==
X-Forwarded-Encrypted: i=1; AFNElJ9U89qYA5m3bmyOV3JMNoR/AMPxU8G0C5Bu9A30xXQxg3+C/nwqbkhdRvwCd+CRFAPqMdW7NOyohwcV@vger.kernel.org
X-Gm-Message-State: AOJu0YyL40LIwZ8aSvCU4Ie/HoHff7T86duGaGZIlsDvmyB8CqdVN9Z7
	Yt16AW4jblHHoXs3Q9dNFLpW/u55/8yLOMvCPRVE8P5vHuO4wDMrNgOgYwxEZlP72kGXOiKgAVY
	iFmSigdY+6IBrtWQpXOY934HAAr1ZMic0kq5uyfMJoEiO3mj/HNKL6g8iBpnvGvIZ
X-Gm-Gg: Acq92OH+wg4VNV5bo/r7AnZFFdTH15ex+7kVRFB0WMewfAgsy2CbBZ3IA7WjtylJLKK
	4r/gozzpS3uDclfs5t5K1DxiFfAMviylFGMvH4Mbq+HzsXmrhFJ8RlIAL3MM3HbMBBTCRBt2Txq
	tPKMBzOZjZX835/ZL2v8i6e5FRRXn9cmWK48ouhjqdbQgRv1yTp1fQ71BLazYK2HeuuRxH5RUGh
	mwwabud46iAghqLIo2zX/HayexowFgxFQnic82uraFNo95l0lTM/gUY4d5MB8Moe6c+Mez1Tjyw
	yHrtxARyttYidRzH3rczCPEibGxBxzcgraIqZMMDk0vq1KfSkjbR5qcuMpnM/3rFwpQpLtGhVKh
	wjWKINElycZ8cEuMtMkJKuQBKYhLA56WQk68aP6+/DIT06sTnTdwYJqZj
X-Received: by 2002:a05:622a:4089:b0:50e:a1ab:67e6 with SMTP id d75a77b69052e-517ee1d5c09mr16697051cf.4.1781165794160;
        Thu, 11 Jun 2026 01:16:34 -0700 (PDT)
X-Received: by 2002:a05:622a:4089:b0:50e:a1ab:67e6 with SMTP id d75a77b69052e-517ee1d5c09mr16696731cf.4.1781165793685;
        Thu, 11 Jun 2026 01:16:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcadd198a8sm28512466b.0.2026.06.11.01.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:16:32 -0700 (PDT)
Message-ID: <0e19fe82-7bd2-40c5-854f-052f6a987240@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:16:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Add missing PCIe global IRQs
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610-ipq9574_pcie_global_irq-v1-1-6d6333b95c43@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-ipq9574_pcie_global_irq-v1-1-6d6333b95c43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uXwOo4506kCnUOg6EslFThxDorUbPIyi
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a6ee2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TUoNoqIjxyoQ0TlcC58A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4MCBTYWx0ZWRfXwK61nq6WAGPB
 Jy6q49dHScgCjzf7uzulwr5SB89cMaiGiUmMC3wpoRiPXtIQCXQaMxBn8yFcj6KzVd2+i3vEgmX
 +lefsakrQPfEheG7Q5ciOw1+EFYUgI90CiubZLnXHsFfe77rc607gGJi4HyBqJEq/FfHk+bEGjL
 w84UQ5rXwODNPB6ORPC9QBT0UZ3+JHxJ2UkRLpC6IdZu1U8t3ateN76AED6qPHAI4ZWQ2ffZDgF
 qANidOKW3ZDtCo8AZmb6VxS6n+ng/NvIF8Bc6TmceoRkwZNeXfpwTJvUFShSA+6hiVKoUIGq/mz
 1DNhWM48xbiyjqUPbK4S3bqR4e/eNJDKMN7vXJmovIVAT65h9Qe7n4KJEkPw/5es0F9QYgF5yEC
 ZjTZ5V+54H9q/ifaZ7pF4y/OiKL7IK2RuwhjXpFVt/bMZrBTOx0xhldZeifNs+71ynbkpsLV6at
 hNL6OesBUMXynBsAhnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4MCBTYWx0ZWRfX2p2LrqyDWbl3
 xzOaBbCudoq5gp1VIlzT+ErvKMwyuqdiGOTBlG++kAeOf7Zvx0EiFDlH47FD/1V5h3F/1waxLnF
 ZdGl6v9exl6+MWtp1e6LMrM5Kf+Aag0=
X-Proofpoint-ORIG-GUID: uXwOo4506kCnUOg6EslFThxDorUbPIyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110080

On 6/10/26 6:58 PM, Kathiravan Thirumoorthy wrote:
> IPQ9574 also has the dedicated 'global' IRQ line for each PCIe controller.
> Add the same.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
