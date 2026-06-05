Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05BF21E091
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 08:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780647233; cv=none; b=nxY1BHBNj/SJ7IqVqB6oXa/DDZZGBJxg2Q+aHrrLTpR7NRNk2fd0z4vJ+CKvAXJ+vfavMpuAhoYJ2yiDkxc911tcI/DtNypnJXGmrRLIcIlmrKjBaywaX22Db6lC153b3pJXAG/O5VTu46gMIHF5JKmttKoYTI3Zgl055ihiwgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780647233; c=relaxed/simple;
	bh=oRAjiGpD7P1Ud6ErzTaM6Xngz8vzwGWWetH1gEJyS/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=no11RqbRqIi5ztQmuF9ZCEwSCkr8RsA8ECU82usb2F7Kb9u31jDkrthVarufGIP25Imxfv+W++GxDtAUiMsbEnQOXGIJ1ww7vv0KzhbmijRd8MTLTIbgm7NlBmUBpqeSztCHhmLQypP8q29f6XqRWsdkA312Dmg8LTrLI8UvvGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTyf2l1H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csnnT1TO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTyf2l1H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csnnT1TO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655750lW3528845
	for <devicetree@vger.kernel.org>; Fri, 5 Jun 2026 08:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2knAYQo8qTsSztcnLRKd5OpNfUB7oMRepo81yAe0UA=; b=kTyf2l1Ha3Q6YYnx
	tuzE3guEt2Ge86yi81CMWmmJzaDj0oGajfhciwNwcDTevtXuc2RJv6D87upb/oan
	0LANEcgHF/igs+WtMFv/Ykf4C8ZpcymxFPe3v3sxrZ+rmgNd66XMxivT2G+a5QNq
	O0qvRcozl07d4o1N2CCfyjNmn6ST9wf+iJ6yzS+q1el8arMYNiPWYfjoh01O8osL
	U1w3cHZM4xSbonHjbBywyOt36ZQY8m9+RAIPYRnKq/eXKWzlIoRw5nTM4GLkcVjp
	kJoSf88YzYwZ2vDYefKHXYw0vzOmLMimtih//LxY13087v7LHv7MOOIeVF4sYE0x
	75Y+lQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eksrp880p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 08:13:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84238e83851so1073497b3a.1
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 01:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780647231; x=1781252031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A2knAYQo8qTsSztcnLRKd5OpNfUB7oMRepo81yAe0UA=;
        b=csnnT1TONy7LtQcmovamyPuL46NmZv1iGD905mVtaJjZ2+2Qk8G3+hqCfe7j//RY2H
         kvQp1b70LWZA820fa6eRIcimBIeR81QAOMsy0GUIKNA99Ok+7/V4aVWav/6gVN0ccD0t
         Y25ESC8qZdFvpgEt7F9D1uDOvqPuq9pcSsjJ222OzvuaqbeWzp4trmDWCa4KC6atO3hx
         1iNGrew2EaXYc85Q5dqFniw8BohPp5gjlo7GHYzdK9XhSLebfnKQ8q2mgkW9rvNxQzXm
         JLAsxz0rzePUiswz1pAbee/ihsppSG1QwTpmwlylKsxrkCu0ZuQEzjNLzyT2+aRu+QgW
         tEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780647231; x=1781252031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2knAYQo8qTsSztcnLRKd5OpNfUB7oMRepo81yAe0UA=;
        b=cTr3SIuAJ9ElS7dwjnwTUiYMVLMT1cnk9r6h1WuHe0ef7ML6Kfyi5nxrm/rQ/NVVYk
         5RNdYCGnF8+hoP7Uhm0gBxuwUJw/J7O66gUzV5+zzVw3iZlXp2WlGZPfG0DDQt0LYDB3
         fWtnk3eiFwyF3ESa8f0emL3J1iA3jsPBVCDxmxxb101ieklEXqVgeIFJigJeE4tLugjx
         0ZmBchZMy6l/NfNciujxN25Q8MQbH+BOZT68RCZSCEYF6Ey50Tnb4KoQeFlBb90+JRqA
         tKDWbwlUvnXgXp4vmrkOW7+E76/5+1mi1roHqYEMpJHqtwWbE4l6VH/Yyd9Dl1Q1VJBG
         q42A==
X-Forwarded-Encrypted: i=1; AFNElJ++t+aoAbPNP3DJfaSx6+R7hI0y/rI/uNO69KNfaTFehRPPDPEjoWptJ3081WvodmD8FpuUhxy7DocE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx96hz97FFinOzsHZz7sxNzn1q66tFmJ9pT5c+sgXAMxNODywnE
	AkV/7Sy0GkE+66Crn+1JtBbH+D8wGzQow6Czoy9oobL7zSCuJWxHQMKmYWzwkma0E1bkpcQiaqk
	vqfw1VNacXnybr0C5V5QPaxwd+DeViVc0/zvr1tHFfGiid681cYPv0JrJcDWh4uKf
X-Gm-Gg: Acq92OFl0UuQ/YJkYsA50yGcNIfIAVNnJO49loGp1gIficE0WIlv9dDnd6QKXxhT1SN
	7g5p6h5eYkC/dNeXmAYgd2o5jqBDD7EhqHZ7zft0bNZACjmDFyaBQ3ZB7hsxY5GV6iCQsZb3ats
	y0T9iZweV3s2EyUXQUU+Rgq0JFCIKsLxLqypU9j8tdhTd/hHEObxr+FMMQNp1mhHAS+3mOLX0Vg
	Y8hHQmiKus8hEMeo0RDeWddDTcgektdyMgx9EaIQswr4W07YwlCuFDEBAts4Ze26AxhNUTY94n1
	Prp66EiGmEyGWqmbCF2j9CeH7IhrY0973/rkZ/Z+1kTlbUmKzJzGeAWmtswnxHo2K3zu6rvAhp0
	/ufPUzKMRhfg3aFzywToJkfnGPaUKPjYz46lBVJzbwXNR66hMBQ4/22Olizu9XY2Nm+Os6gZs+3
	rYAQ==
X-Received: by 2002:a05:6a00:4c0a:b0:83e:b443:965e with SMTP id d2e1a72fcca58-842b0e2f87fmr2314745b3a.3.1780647230657;
        Fri, 05 Jun 2026 01:13:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c0a:b0:83e:b443:965e with SMTP id d2e1a72fcca58-842b0e2f87fmr2314711b3a.3.1780647230199;
        Fri, 05 Jun 2026 01:13:50 -0700 (PDT)
Received: from [10.152.203.161] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428221d1absm10011448b3a.9.2026.06.05.01.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 01:13:49 -0700 (PDT)
Message-ID: <4e50e30e-e9dc-40b0-bf6c-f0642ed44b9b@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 13:43:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] regulator: dt-bindings: qcom,sdm845-refgen-regulator:
 Document IPQ9650
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
 <20260602-ipq9650_refgen-v1-1-55e2afa5ff64@oss.qualcomm.com>
 <b8758150-00a8-4d6e-bd2d-c1985d70ceac@kernel.org>
 <d24238d5-7b71-40e6-b6dd-c2f1aa150d77@oss.qualcomm.com>
 <926487d1-d949-4516-b906-892d46cb956c@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <926487d1-d949-4516-b906-892d46cb956c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vCZpzCpweb_eqy1ZykWDIQr4z69LTgLT
X-Proofpoint-ORIG-GUID: vCZpzCpweb_eqy1ZykWDIQr4z69LTgLT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA3OCBTYWx0ZWRfX8xnubgwvmBZP
 Xigya/fV8CYVjzwkkMkazkH9tnz9HD9jxBOEqyKre51SdmPFtonTvd0PJBN4X01WHxFZiXNY4ec
 Ss+kmDuQXeTXSDy1EhvPqkMBNTMkIVBy1+i1bQ/6+LyslglTlXEzAR3hCnlJ0GdcSHHBV/g6YPp
 I67OZBcgsl9G9pnzdpYcOjSa8Ve9soXWKsk3Y3w7PTb651nuEIoRWQwAghFc7jjI9Bm9SyzX1J1
 oNblsHyLQpHSUPBzr4PY069ft338Pb27hAjK+Kec5X0B/1kINq6Rn+EVfwx+vphVsueXUR8LfPF
 X7k+B2VL3aZF2AEkfVt1El3XqbZio1tVLnTX5RvwU+R/sWXlmpx3nIiJNF8pKJ9dd4REo5vnOzQ
 OkW5mHb7mj8Rlfguoyb2YrzCB78qEew0uu9GJwIVViIr0Okv2iyMI36oDypO43CYt6TCMeXwi3/
 yXwFyYkApxEsl7xMcdw==
X-Authority-Analysis: v=2.4 cv=bJEm5v+Z c=1 sm=1 tr=0 ts=6a22853f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Dzw-2j_16JttndEX2SAA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050078


On 6/5/2026 1:33 PM, Krzysztof Kozlowski wrote:
> On 05/06/2026 08:51, Kathiravan Thirumoorthy wrote:
>
>>>>    
>>>> +  clocks:
>>>> +    items:
>>>> +      - description: Core reference clock
>>>> +      - description: AHB interface clock
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: core
>>>> +      - const: hclk
>>> You just added clocks to each variant, which is not explained in commit
>>> msg. And it would be a separate commit anyway. Probably you wanted to
>>> add proper constraints (:false).
>> Ack, will make the change to define the clock and clock-names only for
>> IPQ9650 compatible under the allOf block.
>
> No, That;s not what I said. That definition is fine, but you miss
> constraints. See example-schema.

Thanks.. Let me add the constraints with the else block.

>
>
> Best regards,
> Krzysztof
