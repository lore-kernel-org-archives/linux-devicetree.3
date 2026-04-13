Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D362C382288
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776068758; cv=none; b=PVDb6aaDRMagrvj+Hxu1lbOcKRWpLk+OU5nZyA7D+7Kq/lCbtu9tHCV6XXwVfaLzUM6OQtOGTetFT0Nmc0sHiXL0wF3aUJqVCYYhe7/dx/HUsKMy+sbDrXKlV0hVWram7i+ermqKMYAspngIabtuOvLq3V63V87pd2d2BRw/gCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776068758; c=relaxed/simple;
	bh=WbaClpuiijaEJZhRB9Dc8DeF1n892C6setvc/IZwtMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c7CLNjL9BPbOhczfC5aMP14UKx67lto2Zi/DC8yO4UjCZ60IdAdVfC9XWxaM1MNE+lFRi3hbiU0q4RXBKBw/Ha6p6aKf17flSIMYNDdXuOATEEdna3Dukp6uiBTNL/Ok86pwaEOpqmRUE6ECgkwB5Wz846bBe/RGMHCILdnE0Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eC2Zia/R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgCObfj4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eC2Zia/R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZgCObfj4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6xndG2662866
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+fqw4fN0pTXLVOUOmnDw72S91boPNMgI00B4oKchFo=; b=eC2Zia/RNQk/1CJb
	7vKS95WJIoiYeUbj1v5MURU9ILPsfopYXjCuYJ5itFAPBLQRzh/2uXzlT8byOkp8
	Cs7eoEpH7tyGzE8EuceyxrY41VM24F/oDUHDYhjHTnmXhxNIsvEQVOIC88izi4ew
	WCYbU7qYfCw2bN16SSiGb870LffLbFYtXnMJrm9k980eybLQfWxm9tYMQ0jlJjs4
	OC78Nnz17bH19BEw62XToHoDhIuVPw2/eNwoKjX6/UrISq1J7QO3Ai0M6qoGG4ah
	Dgh2lXWTwFjeCglKCv+x0f9fHXAeNotPFj+lnnf63gpJejZngq8XHCBZs5sFCbXE
	kiW06A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6mdw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:25:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2955cc1eso6230781cf.2
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776068755; x=1776673555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+fqw4fN0pTXLVOUOmnDw72S91boPNMgI00B4oKchFo=;
        b=ZgCObfj4wZQWp08sYMowTSLIB43d3iLSQARUnecMC+d8roCEaralFG9q8izcsp101/
         9s1TWjyhBz03+hZghL0dIYDfd5Cwm+9Bc56569WNUebAGGl0aJETm77KoP6BZHXe06bb
         0XqbexRH62MYtN//oElbbGP04AqrSm69GGydQl8GvgNQOOQZugLDhVVOU24aJsbRcy62
         OddHKghF0n55p0mfDLw6VlSJ4OvLbnCuJVQtimELOpxFGAtdVyIKKEk5Hm/jENEPSrDj
         O13DygkG/uaQmVL4DJHhtTB+WwM1+PXWTLX00whW5mOF7CMFriVqlrIiUpv9nDwzN033
         KXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776068755; x=1776673555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+fqw4fN0pTXLVOUOmnDw72S91boPNMgI00B4oKchFo=;
        b=iHDBhmFt2mGII09IniBCDUeGaLtfiDFO05YGwRJz5idrIh/ElQR8ZRm74uPSFMr9IV
         wAOXe8cZqcPP2nxBnalPacGpL6lpzOB2MuIfvzMMDL4JWjMz8StMpREX0lDKEvS0fOxZ
         GmDEQ1OzgPBtVkpgVU7VQtyME8RlSeVDgMRNCfhua/VgMB/v0+Wd6eQpOSnoMUSrz96f
         TzOD77nSmRxGIQv/OMigc8B16DS9C5rw3/AOzs0B/zQ+bokzubEN6UIP69e8SG9hMsZF
         c7lJhmGlTjPyMICMh4nAqyPCvR3gH17jPkhNzOi3DuHpdmsEecpOV7E2UV4fZDNgzoAQ
         54og==
X-Forwarded-Encrypted: i=1; AFNElJ/S1FjwRP6zLBtCsV41v+iIXD5uhzCrg91EnSPFroF5Jla/niLxbdaTC78I24ZWXLLSLrmeZQ+5e7UC@vger.kernel.org
X-Gm-Message-State: AOJu0YxoaBMhVVyrhWLWGlCx1i86a2w96eYLYio3UYgUqUZImAPH5jgp
	O3ET7Hv44U5svnAiJZ4QIR6tZSrJzAPY5YKxiW6G8c3l/4nHnB+fsknFUWAddimB8q24aUko+n2
	9U80f4Ru+nV0rnHZYGx6JMFMWXMlUG893G0QqghjIth5R1Buv2F6PzAYBabT+uQlf
X-Gm-Gg: AeBDievhk4sj74lK7w7qHi0vpJJ7cUqhRVWR4d4TNV+B3f71jz5BfVpDAx2jemO6Uk6
	cZWhw+d4sStjkPvo/jlahmUoy0qSR9rxB9ckPnFE2ap0KIuYOObRgwMd+ClJUnOl/Zew+7Elc05
	fUjekdjzVXi0V+iLPnP1k+8Ey2HPZUPQsv/wRZbGaFWq7cB+g8YoLoEAZhqWK9+zXcYCVb8toPz
	CDPs2ha13Ctd0oHG44WFC23BZvWu5gqRNAUns2leml/Dcyfb5s3cfi/HB5d5RFGYj2OoK4ihacx
	HUUNDnxr0ChnV2VhE0q3sj0NERmSLN3EgUrIBY8nm2DgEsLdeS9+PxnyHS5AQyEEz+vLc91jfjy
	2bSAE8t9kEhrqNV8N7/KvUYV+JUwtheKSpunCZ3iQ8BZM+pUE1vvx68nmOIQS39juyGQQyFLjgU
	N4eG8=
X-Received: by 2002:ac8:7d90:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50dd7ccf4f5mr134206481cf.2.1776068755235;
        Mon, 13 Apr 2026 01:25:55 -0700 (PDT)
X-Received: by 2002:ac8:7d90:0:b0:509:1057:4a67 with SMTP id d75a77b69052e-50dd7ccf4f5mr134206261cf.2.1776068754884;
        Mon, 13 Apr 2026 01:25:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6708d902086sm2137057a12.1.2026.04.13.01.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:25:54 -0700 (PDT)
Message-ID: <b708b3e8-aec2-4c52-8a54-629c5cb2d0fb@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:25:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/35] irqchip/qcom-pdc: Use FIELD_GET() to extract bank
 index and bit position
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-7-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410184124.1068210-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MSBTYWx0ZWRfX4NXTfuzQuLBU
 3BaICKtFsAiaKerZOD6oZlk3Brr7XkaCbOIbKbfHJklgV/uXzM/ydF6urPw8Vko4/VyjSjp6OLL
 u4/o7eO74SzsZ/pTQPdDke3OEgNwMqD6LfKWF+8s7HOW+cGFVDzhv7xp38tOvmiKYFjJ9ZnDjQp
 zuy01sEAs9siLbA29Hd4HQB2TDcB1d3kytCJ3L3q6GlcLCvkQl3wFR7Vrl8LQqJBcq40skTnOkG
 f5hK6K5x6yTu+dlYs289KJA+nN9HQPNmKydfkpcCNwWnnoJjJAdu8y54Fh+SximYL/FM+a0/8Ah
 yu98CXSl9unmgpcqWupq2aYw90QiO9xMLbBko9DSyF1GR8AKFMabSKbvZlghNQlY3sDZVMTcxBh
 7ewkfVjtJcMH8zK05KdN+JOHx8A6NFxWPPTHD/j0HvLdTd4/HJoWwtCIriYs9Y1P7qPDyfLTVUE
 hZCGim/7QNUn9UVVbeQ==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69dca894 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GoGuyCN6GRDGdbe8FcUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: mQTBxFWw1a-2yKKs87I9YE9vyfmu8G-h
X-Proofpoint-ORIG-GUID: mQTBxFWw1a-2yKKs87I9YE9vyfmu8G-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130081

On 4/10/26 8:40 PM, Mukesh Ojha wrote:
> The IRQ_ENABLE_BANK register is a bank of 32-bit words where each bit
> represents one PDC pin. The bank index and bit position within the bank
> are encoded in the flat pin number as bits [31:5] and [4:0] respectively.
> 
> Replace the open-coded division and modulo with FIELD_GET() and GENMASK()
> to make the bit extraction self-documenting and consistent with the
> FIELD_PREP() style already used in the PDC_VERSION() macro.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
