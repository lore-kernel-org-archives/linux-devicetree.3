Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B593BADA9
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774516067; cv=none; b=DaWfq3AkuJo4WNL68ubT+Iv78iSnNxS+t89uzQCRb6y9IIIknPhSJz8JUzTU/xll7kcGwEcq18znF/uP2busKrg4IQHHac6iLFbdxnnfTrJFRaHx61K3YFy0VZ8aMIPmfpEMdL4sEc1KKjw8yEafE/7I3Rp5e7RCguD3Ea0l5Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774516067; c=relaxed/simple;
	bh=nApw0kQWc810vBzMMiVPM+TGaNIYxGfE/VG104jP+ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QUNEKwhRwk5txEdHHzyldak+8JaKma/8taPhKWiQW3CTsaVScahC0UoEw9sWkE/2FGQGzGyHuINK0Vp9ZxjyIsZHmYOh5KX20NV6q8PmvEauJQ/IGRymcDfVLdXbG4kDHdHnUY1KhTEIZl0Tk1NYR463f0yrT7pHf6zK/MfXF/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cM7llEjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Th6M0IGS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cM7llEjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Th6M0IGS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6B9IV1965120
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bPOQVGT19JgyNGrZiOTEkpfw4lSjz21DJ8/El5Wk6Dc=; b=cM7llEjV9Pqx/Ofs
	yztUbSsV+3CYEZ4anEKerucU+EooHmf2IqFcBpQscjxmHMeK3drUYBDe6e88CMuQ
	6vGwGVLNpgxCBcj7FUlyije4c1RGDZbqBuQy0f6s7YC5xriDEnfc7/mPV2SI4Bwx
	RoB6bIwV7tZAl0osH51K7m7gI7QGkxYD66tzM3gfNbHcUkMOzffMoYU7tAA5ySmD
	sCZNqMHX3fNwjrK/UfqNxjKgMAIq4gzDibkVHG3Tyk2XTrkY+dK0uqenGDVt7aKQ
	wH/x7OhTS/vC3JclQucsnUllpEe/qSPv2Q+6lLwW5js6kl6KpHS2UFECFrC2qSoG
	XEpLMw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4pymj3m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:07:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b9074bd42so2697401cf.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774516065; x=1775120865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPOQVGT19JgyNGrZiOTEkpfw4lSjz21DJ8/El5Wk6Dc=;
        b=Th6M0IGSxfKCwj3AeOokEgNVcgEsAVLWAbuWESX4TO7tRr4c4aSCPrw9VITye77Q5x
         oHWpHO8fBebn6CVNGMJ4xaK5QhPaUh5+e9q3ptZSP8gOHI8Do/bhxLIPodA4mxnMdZN7
         oQM371W8R/theUvRczXfGShToe92JV2QV0UrYQc3I40f2uiXnxDv+yAegYyGy1n++4Zv
         yi5ts6idO+xVEAUDXo1TtZnjL3/rU2O39U1tAX05Z5wJriX62uZuwCRCHdFBOkViLHOj
         /RfyshjpitppwW7yFXa2rS0uZ44sQt6JuDWeU6pfwQy6xUzdx1DXPJMA+XJgDAmZnorB
         j7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774516065; x=1775120865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPOQVGT19JgyNGrZiOTEkpfw4lSjz21DJ8/El5Wk6Dc=;
        b=emz1rb8E6TMVFra65Wme+1L1iL0Q1rfuO6wdX00yMdXi+ogJv53vtKZBkGcpcOLoWc
         L7H0tGdJkS59UfACi2aKFXtdC5SHFgme25M7mRj2w5BxVEWsSMwa+ho8jw9nNzFRqO2l
         hExxDfumKEkHdkfXs62KRGEuiUsnkkZbmK+GDkXDHsQtE/wJYQTEz8Kh3rQeMIqskGNU
         sFO9WiZ/2WDgXo/RgM5eHDra50imCBse+mM/sV4ngyDguwZqX4e9UZVkD486UfekHVP5
         FrhYk0bSYxpL2kf1mDu1gq9+uGC9EEq222CcT1qulOf8LQg+Dk4wgT/fejqxBBzUjhBT
         8feQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPfelftLHP2Wvydaa5D2rPoTJzBo4QodhI3cOx11ct6bwsNYprVJGZHK819jaZrFiz20SOJCjS8rqf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Ue1RQn39XlPrTbvEGLOjhoThTFX7CWsk42X6SMnpHhslVXtV
	bXdLSlz2C3jFSsMB0neN7ZgJsKWf8DJmNNRZL65+M5Zmnrw3FaajM1heDT6RWiWKjkMLg7NZDYS
	HZ5HbJH0kScw1hCwZswUHKcNrCn44KM9ni7n82rdJBkOJmfLneYN6mTuccKhblXys
X-Gm-Gg: ATEYQzzgYFtEuHDPtUisbGlTHKi0SyCBoX2C71Q4JBssPehvIyaWCo1O9wcet3JSByj
	npG+UgzcrX2OGfo9vTTqwmnZllC3nE542RAeaGbzZh5EpEu6pm0Es5SqZC7ch/rO0kXjZKU5Wcw
	/yJgP2bxx1SbQVN5OtQC1I7DTlFPKsuTnC3TYJcWYKYAY7d+bsmi8a8l9TzKB5lFqyfnPFLeQn5
	h/kA7fGduNaySOh+8rQ+UmOdoh58DnPiVUVYxVsSDwsd+qTSmD+sQSx3v6DXbkCpZfhOnqkaadl
	qgB0C//d0n+euoWfR9iE6BD2/EoK+dGcRqjYPB7frmXTw+CJGvVBeiSxRF+1Xpw0OqNK3HyHyPc
	TQXaLkMQCSGmC9mZof0v60E7ZEJavPnZpS6C3gPo0orWAUtiOcYDp9utTDOEMvMJc9/nqNqcJ9u
	ucfjI=
X-Received: by 2002:a05:622a:6209:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50b80ccc148mr66925271cf.2.1774516064754;
        Thu, 26 Mar 2026 02:07:44 -0700 (PDT)
X-Received: by 2002:a05:622a:6209:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50b80ccc148mr66925031cf.2.1774516064301;
        Thu, 26 Mar 2026 02:07:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad5e3bb1csm770802a12.4.2026.03.26.02.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:07:43 -0700 (PDT)
Message-ID: <0c3c0d7d-b108-4295-96da-a261e65cd16e@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:07:40 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] spi: dt-bindings: qcom-qspi: Add QCS615 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-1-3efe59c1c119@oss.qualcomm.com>
 <20260325-vehement-bronze-manul-ce6bcb@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-vehement-bronze-manul-ce6bcb@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hte1OAmB95pyA2QmGcKUDxBJwXY_Gsft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2NiBTYWx0ZWRfX0H7oOBKCnydK
 nbpDuWoQg0ezNhC4NTduliAMVNyLdNLl08Qlmeb01Mg8rAJZbT/QLwg6K3jUxKBhDliPnXtzIrz
 SYLPJTxU5616wA7zlxl+8F4+yarMZRViJJSP6MTwIeeDO2nTGjleQgSV+leirJhKjl/RRT+A+bf
 ebJr4y008rX1H82P20ZSapifHHAy1ottkxs48Prhuw0f+B1joqSiy+weGjlFToMUmRVs0n214u7
 wmoyuyE8Q3E9pvxtHudfIvv1xlTWYa8HOmcPiHx9LWtlE8925/d0jXxfUa1eq+u2w3uxlxL3mgH
 PoxMohTmc/iFW/FDy3X5kWH8lbI/ZZUWoexo0cNMe6+oCG6fg9yRDh2O/VCcR5jlhjLgFtgcT3W
 a8inbaEEdo3aXJvGiIn4ml3FK+vrNa+4KlV25/kXb0GYXRSuuMP5R75UacjIWzk1AuYz/DEYNct
 Ddaxs54oQc22HTzwS/g==
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=69c4f761 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-OTHMHjyIvLZNMc1xfQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: hte1OAmB95pyA2QmGcKUDxBJwXY_Gsft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260066

On 3/25/26 12:12 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 24, 2026 at 06:43:18PM +0530, Viken Dadhaniya wrote:
>> Add the "qcom,qcs615-qspi" compatible string to the Qualcomm QSPI device-
>> tree binding
> 
> ^^ Full stop
> 
>> to enable QCS615-based platforms to use the existing QSPI
>> controller binding.
> 
> That's obvious, no need to state it. Writing longer texts without actual
> useful message is not helpful.
> 
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
>> index 1696ac46a660..d9aac33b695b 100644
>> --- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
>> @@ -20,6 +20,7 @@ properties:
>>    compatible:
>>      items:
>>        - enum:
>> +          - qcom,qcs615-qspi
> 
> Existing bindings allow flexible interconnects, but it should be
> constrained. At least for new variants. Please move allOf: to the bottom
> (after required:) and add there if:then: requiring min two interconnects
> for qcs615.

FWIW they should have never been flexible on any platform

Konrad
