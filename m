Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE13494A04
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644607; cv=none; b=qYlvPIB/YrqmRd/YycIrY6Twti3Cy/Y2ji4XYimRhZY4ReqM+3BGFOQ/h8I7A2nDRCIV0MIG78ghSHUD3j+JBVywvjn+QjkPZhPqRageaVRilywtq6NcACZKL7NFvpdT3NwQw1UVk/hY7R291BSGbF31/iS5yN0pVl6l93gdMLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644607; c=relaxed/simple;
	bh=VNS2F8DuQVPrWiyoPKjR1p2aeMoPTWtQW8rqvMOk5w0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=il9PjXvXVPinb3gbLhZ0Pg8f3/9guIjLMImxIV/yL5nYhsQCr6gpN2FptDogvqel3/lgmYVWez9533kz8IFUvxrYj+DjELWYldZOlmdj6dKyeYRun09rxN/nyjxMuTW3bWOmTkJV0OFSn0PaBvx8X2bEptiKoj/6oX/F9Eq2NbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lwoQO4uR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vw7/v7wd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lwoQO4uR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vw7/v7wd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg6Px1707990
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3fOp6jWZD3rD3U6d5eUkpHbkU5flf74+kOBxgF1vCE=; b=lwoQO4uRZWbuj6wI
	EvKnlBFtLaQFCfs/08rx+mBi7YlAacj/ESr95HBnO7iVLHWQbwGnfkP6F0NiAKdi
	hsFdO1mHpJQ1lIFiovq72rsYvqWpQ4lr5FgBYmMgaB8pZwdb7ZQ2ur4abeGMJWWU
	augjXuc37Nn+4/Jn5PXr47Vxiz1f3WAl+62Yai33wX3mF24u2wfGuoc1WfJ6J0Dv
	PT/fcqiNu1dFWIv9wq6IhFIDJ7ToSD0noiPw7ht89/Wq5DlDDZd9d3gx/DazoE4p
	f36rc0SRV2J2e/S/aJ53X1O8+6V5LP7UtSjMvydudPtxWzNlk/x54AoK/2Ns7xhG
	/7pJ4w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9ae8exf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:36:42 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bf89cfb2adso481736e0c.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784644602; x=1785249402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3fOp6jWZD3rD3U6d5eUkpHbkU5flf74+kOBxgF1vCE=;
        b=Vw7/v7wdjm/RY7JrtTk/xQ3n5H5NJzw0IK5+4oWwAVshgmfsWnpI5MyvRKrr6IsJPb
         1T2SupoqLmo3f3QyQ+lUaJw5v5t7hx7tnAYMXkcFc0yNIgYKRuOOzu+3zpolp6j62b87
         krQUr6ySr375wMw8Rfr/SwszylKHbwmamb3YCytZk6nkcpLFr5NQ2tCM1cNrYH/XAC/Q
         Y5c8oE2p141kWjDvLuIopxJ30WNajz2xiHAWQtscH+WhDXogLdfiQ3/Vd1073laAqOWk
         vcZUou5TTNMDH52duWKj4/RbaZJVUx8xHEfSF5CFhCEBh3Gg/n1ItucZigfyqraLEmLW
         CpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784644602; x=1785249402;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3fOp6jWZD3rD3U6d5eUkpHbkU5flf74+kOBxgF1vCE=;
        b=TIhwOm4fYxEt5TTKdniD1ahs0fDsI4542ey0vqNgWs0O77uzbdxz8jrCDLMK9icuID
         iI2qR8Q3eo8hlJRkS/XJ2q3LjU3UVG5q+qlA0aKh9OgNBip8Lvty5Kx7iZ9ruxFqAjIA
         +Iozygyty9GDYi+3fd9SV/t6v1pLTlpZ7Jlpzxmj0aV70L8e86+1ou6Nto3YBiJm7o7e
         GfF79dxWgeULbw7fdjs7lteWvtRwWSzlFNrRPUhsrre4qKqsgNmP1SAC/WwB39VNCB3Q
         6BDYw5mWqIkmGi6Dm5InkVZBouHPDIqWK8QnFa4wRZ+BkfVMVFQ+I1HLmibzeupNRrGJ
         3dmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdXFoudgNXPMxyXP8U6UQnT2LEjMz6farWypbto5DtIrSFo3DySvatOqxRX09o6vRUwTmcI84eyE0O@vger.kernel.org
X-Gm-Message-State: AOJu0YweyN4UMqn8yWzSFSjHxU9zEDCrzRQ3VgBPR9gfxTRooUF9LJAq
	x4eYzJbY3WDdxyY4fGtg8N6DX0+mQER4dzroWtHkyiRaojtdUhRHyp67YqosHreChX7RiSBvIIp
	ZRZEyz0emx+R+zqwQSWLli3PPLMrET3Flk0Odbc87ly2c/vmRP6fZF7hHAuLyf//r
X-Gm-Gg: AR+sD133/VbC5J5VVE/bP7ijGuZyfYIE3SBn1aB4yU2ivD32N7juVKvq8qcd7/PqZbh
	ziVQaronYADfM2DSkJ4F1tu4dEQ/HD6gRxccnEKWqt97zoSq/OYcXIpia1AJXGP5K70lRIiDQSI
	VoxRvO3BrwKNRtbWo3f4drk7EKqtrVVUUACtZEXM1fE/dvfuvMtSbMYpwEPOK/iohtxg1U9x4it
	m4+QLM+1dPufeOEUK+AfFgNwoCWdUauokv107HmmYuherxn/rFNRGRS1j7IFLLoJV5YX+Ngalm9
	xqULzvYqe5dAWMaxrhKjsEUHkyL/3PJStaPAmxcZRDXHvtJDyOtLG0rbPUkO6hB4KDjnERwXw+R
	21u/NkkmzE8tkW3xzU/XLDkJR
X-Received: by 2002:a05:6102:800d:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-74abc0b9b24mr601409137.1.1784644601974;
        Tue, 21 Jul 2026 07:36:41 -0700 (PDT)
X-Received: by 2002:a05:6102:800d:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-74abc0b9b24mr601395137.1.1784644601491;
        Tue, 21 Jul 2026 07:36:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009adfe7sm603614366b.6.2026.07.21.07.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:36:40 -0700 (PDT)
Message-ID: <e2b0e9c7-c14c-4a93-845a-50a902c6fa09@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:36:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add FastRPC support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4_ynJXQWL0q60nJI0HyImQTst12Tl0eV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfXzuHySKm5+0m4
 lVrCnmP6qXof7v4qtf9joj+HtwDTqvfE7Q84G/COzmoAw5AXSgQ09b2lhQsEsh0y6SV8S9xxBrx
 ujc14beQhW6Q2mKnbMCWmJ9aj4/ZFlY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfX6Nuwq8hd8uVX
 Gb2SPD9fmAfCCuX/x3uoHSTJrSfjks+V+L6gub3TM0KC688Zyu1x9lnRGIGdVc3/GprZqID6uNb
 S2zIseZ+smpkWzlOLYbRrfK3ymaUkqvS/BRU5VN9Ey/Z7YIZer59NJkvjjVtMoakWEyvbtQbnPb
 gh7CiQlIFURM8M69h4Z3ne3HiEFBCeaINp1Q+ydq+NJUIZU3MAgCnrd07dOc9w5fOlR8icCHOCq
 5HnRTuKib8CFrqXsYZEW5pnmA3wVtWRjsZ4+pD+gT1v7cQc1tMcNSkEIOCjbai/u3dcxzRQnl9j
 YC8kD5xMaKLGUsiyoEeurXTH0kgGigl4ddVjK4tZuuUj6jzdXZp4rvowbDBQ9YRnqagFE0X7irC
 +uXHHAX+AasQm5DiuFDvVdK7Hh0LIeryMDANrzwT/BFUV+u8qvq7KT5dlz6Ba74dWoMZkoh+rQC
 Sc5ENxBGMXQS5vTPRVg==
X-Proofpoint-GUID: 4_ynJXQWL0q60nJI0HyImQTst12Tl0eV
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5f83fa cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mryI3Znvg-k109Y4wc0A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210155

On 7/21/26 11:30 AM, Abel Vesa wrote:
> Describe the glink-edge for CDSP and the FastRPC subnodes for both ADSP
> and CDSP.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> FastRPC nodes were not part of the remoteprocs patchsets because they
> weren't tested in time in order to be sent along.
> ---

[...]

> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +
> +					label = "adsp";
> +
> +					qcom,non-secure-domain;
> +
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +
> +						iommus = <&apps_smmu 0x1003 0x80>,
> +							 <&apps_smmu 0x1043 0x20>;

nit: the doc specifies '0x1063 0x20' etc. for the secondary
streams. They are of course equivalent with the mask

[...]

> +					compute-cb@7 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <7>;
> +
> +						iommus = <&apps_smmu 0x1007 0x40>,
> +							 <&apps_smmu 0x1067 0x0>,
> +							 <&apps_smmu 0x1087 0x0>;

Why does only this one get the tertiary stream?

[...]

> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "cdsp";
> +					qcom,non-secure-domain;
> +					#address-cells = <1>;
> +					#size-cells = <0>;

also 0x0c00 @0 I believe?

Konrad
