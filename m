Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EDF3E7BC7
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998207; cv=none; b=cUn1Kmef0hcDqr+lr5KYioszc7ksIVS9aquqGOlOZimY6R7DUxECjuN9QeRa/lLI18cp3eTs+URx4jTIgmUepDuN5mWfNvgXUVaefs3Mb1mFG7WFZHMm52KaEmd1+dbRhvhniiksn3zIfOWLgvcR60khbHTuA6aHdKJfc+M7w5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998207; c=relaxed/simple;
	bh=TvfIy379vvosIbtFVABd6KZoCjWl1ycLVvMkhEHVkXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFq0Oz4UCVcI6g54T/MyC42tTBOlNUeF8oBnicbYnvbo5VF4N93Ht4joKt0g6tngSpCzq39a7clzp4OeEhAms36QCNcD/TfV60sr73ld54upmsp+ClvQrg9Aj/0ErKtH6Zp59ooGRc7YqAEVuHAR/K+c87dEgWJpIEAWsoumCCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WagcQjIx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/7QGWBE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WagcQjIx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/7QGWBE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6598Whxo2129869
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUl8Sy5GMTXVRM2Bgsp87utS1pWmPxlAyMGccJDOZ5w=; b=WagcQjIx0QvVxsyu
	f0Y3jnVqGW0Qa0D8NdNr0HTk77L1e0cjAlNx9i4to7lq6VSddeA4P2lACS8SzVc+
	Y0W9oEFwoLjk965Gquwj3y2zcMIiSK2GIn/RR0Gx0rCdrXtt4S+pZkUDOPa19lin
	KpOGuBQ+yFoXZq34SLBz9gMb8QvntiuuIEOQxJuRsHWgD2PoKnzpRMgFHMUkL+10
	iJKjc5oNRyx1UDEHT0Ii6hp4ESmbZa7mUymk24wB2+0Gu6xKd6NcgnbcOq89iVrR
	A4mrH4uL62npxOG9onJRoDPGAFLcR9qVq4/8B5Kcp2Fsl/9g07SnO+wYGpdqbas4
	qxH+eg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt09ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:43:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2c305d0so3132175a12.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998203; x=1781603003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUl8Sy5GMTXVRM2Bgsp87utS1pWmPxlAyMGccJDOZ5w=;
        b=W/7QGWBEfD/JBEPhIrcFl0bPMlumwZqi3QKTwt1K4dGjYTtBvNrUXnILqv/WeuTO5X
         w+8INYeBjhryYYm81jVsgxAFTo7L+4aIBgooMpbCgHGGKbUvgEztQrYeqwLKTPpXUs/9
         Fok/2kk5N3INCyTWlHyLye4oOf8qOgzy6+ZvTsfbN7GZmPBFFxbY/lWdP8lye2ek78y6
         gEkpIMhMgdrsYji9Bx5uADxCM4mw3kMEtQc+y0Cc1TtLWtvxFxkm+vPSdm4nIYgqGAdQ
         ubX6dnIOqn90CVbIb8+1Oq5l2PYzhAooIw7YnQVUY5T2Qk6WM6WAG1moWaNdWLmKtsb7
         BSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998203; x=1781603003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUl8Sy5GMTXVRM2Bgsp87utS1pWmPxlAyMGccJDOZ5w=;
        b=a0y/CIbRzSkcj1NBT6vNdBP/TUuhw5csA6qysFwQSk4xPRLUlw1LvKn57KuBaTiJNq
         yskDdiEkPyG9oLqiNMQTweu4inJVKViA7udTz8IeDwOLkRYZyo/55Ol8693AH0jWvqqI
         KFLXx+1INC7oSVjYhoBx6QoZWbplkB03zDIYYpnwQcpl7J3fcW8uvdhkneUfgotb9nVy
         inRbb9BeFvmG38Fz77wq3la4oKPEzqGD7e/nsqM9ZU7ZhyYEpj1Zdnb4Anrvt3PnGVVs
         kotmNj0hrMyh97yyU6PbEKLexyI4KvhahCerM11Hk5t2Dk6mnDFYPcXG4KPxHd5W1112
         TJ/g==
X-Forwarded-Encrypted: i=1; AFNElJ+z8ZGtNRxPUZNGet1qTokpqTO6JrIL7sVinN1rI6VAHc9YJ2avKJYRFgJLS+XIeTHxx4uV7fA4Oh87@vger.kernel.org
X-Gm-Message-State: AOJu0YyxxoqwJTJKDU+/pG/Ys1J1SV3xCMHLrVfZQHxu2TAGdi7pYuj0
	CVoO+8gD5rwl5PSl5jhEV1KOBCLJ1NGLRDUB5nwCMXk70mqaMBZ2qAf5rmOrC6lH2RYcOwGSiVb
	reHVppfIu8ufWc+YNDuvS5RyFy8GFbZEvF8vHZfW4Xo7o+y5DEdYaurPcb8DtaXcD
X-Gm-Gg: Acq92OF4tSvWS9ex8V/NvKxZqDd8NJarzXsv1Vt8+C07jo4KlxoTOP04Y7ye+Ti0XGC
	9D0j+J5xR7RBiTpDkao9YNBMYiha7/PJ3SHqauZX+LOgt9dq3XYI9M02DvXWwToW3d0bfmsW8o9
	JUqdflaagDTtk7+EuxLLc87L29ftpiIlg08s3zpZDhXagRdifxaEu768VE71YW1FbvYQjX8/e0m
	TlUptlzZvZ1jBPePJZt/uxjXyg8YCFvw8aEdtQxMm/YThJ8Fjll5PG83TAZTnJlr1H8Fp1Ixs4b
	XD4/GmSysp2gTcelLDSG6DOGK53EAVN2UUz+w6ewL4Ac/hMxMKEExRlA6MWuYLI3pWPWp0OjCkn
	Ftg29V+n5OwAqQCP4eVWk0jBljX8FPQnHAOy28kSb0LTw7A0wLdQ5iMzAY+pGlixwJwgqIJuAqW
	ij
X-Received: by 2002:a05:6a00:2d07:b0:842:4bf8:cfdb with SMTP id d2e1a72fcca58-842b0f83825mr20435907b3a.32.1780998202853;
        Tue, 09 Jun 2026 02:43:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d07:b0:842:4bf8:cfdb with SMTP id d2e1a72fcca58-842b0f83825mr20435867b3a.32.1780998202391;
        Tue, 09 Jun 2026 02:43:22 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282374300sm24783245b3a.20.2026.06.09.02.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:43:21 -0700 (PDT)
Message-ID: <585db96d-0c65-46ac-93b3-67107a6159e1@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:13:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: PCI: qcom,pcie-ipq9574: Add IPQ9650
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-ipq9650_pcie_binding-v1-1-486a535da8c5@oss.qualcomm.com>
 <20260608-wonderful-controversial-toucan-daab4f@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260608-wonderful-controversial-toucan-daab4f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hFdtO2HRcp5F3eKNyH4YZAipf7HbznTe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MCBTYWx0ZWRfXzf3j5sb8YRTR
 gvGcC+twXEvpWzjac5lbKH1tzams/wFGrvnku/aWdTqhLc+S0VTb5fnDXqDaPQyrusUhuk0cD25
 HWkON6ZEh9WJU9QUEDq90c+lqmBcCtfCtb8umzzvrgeNj03EVQjEuPur7cau4LBCfziO90TVkx0
 8jF3jGXWFsJOdYSkv1KVbK2OGyt4Tnv5qa7zqwkpGPVXcbbpB0/AfIk9FzZ6G5ppS0b8/TDADg9
 FRpI4KyTOt/3KgAgfajPtBKxFU74VRS8jwqeHorfhvyo7Ix6wRk7TMrUVpSsfXk+SndocBE3f+h
 hoy/+s5W1ymwqMiiRdNBkF0tSQ/HvW+YObdMwkXfVXVD9fLVq9PyCmPQPeUhCSVLG7hNWP1y2YS
 L77bMNcmDVpMJ1agS6TefqJW1hbsLfa8p3v+sIr4R4pLUJEeQKx8OCWO7BbkJ93yD+fYT0Qg/cG
 azDMc8AtSkDcZlCjejA==
X-Proofpoint-GUID: hFdtO2HRcp5F3eKNyH4YZAipf7HbznTe
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a27e03b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4EjJ1Zh6womSNn8TGqsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090090


On 6/8/2026 3:48 PM, Krzysztof Kozlowski wrote:
> On Tue, Jun 02, 2026 at 03:06:18PM +0530, Kathiravan Thirumoorthy wrote:
>> Add the IPQ9650 PCIe compatible to the IPQ9574 binding, as the IPQ9650
>> controller is compatible with IPQ9574 and uses it as the fallback.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/pci/qcom,pcie-ipq9574.yaml | 1 +
>>   1 file changed, 1 insertion(+)
> Any reason why global interrupt is optional? Older devices were
> incomplete, but new ones should come fully described.

Sure. Let me add constraints for the same.

>
> Best regards,
> Krzysztof
>
