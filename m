Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731E73FFFB5
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005762; cv=none; b=Ymi0aKLMfELivtofzw6VA9VKFXLOeelHyIBvpjocdtSmTKDwO8BaWRipC/Yd+UEhJzJPaaQQoADmSqzAa30c648+wtt8voGbUPdKG0PYR5sX9lYTuEK1HFGMIFpWf8xpiF931jTGFkliG8rNz71CtcA0u5tO4pIhKgPiyd+SnKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005762; c=relaxed/simple;
	bh=UBZbAhx3whZDjCNyOyyrh2L0Ai8hRIBpb5mv2kUuO7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VKVvKOoBkUoGSpTYGFVvwz6iGFKNpWfyFnObegK+1dDjBlaf7bNmz4ErQv8fNhmsZo/WQIBVOsjnx2rHVzTHCzgbZxJykpMxOFlor91fYDDVD0AmB2oOMNxkWjwPt8qQ+zYS27G4P5dkHA26ANt+3aaTtdhmMYXY3gOnhihtH+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5uoxZcr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fIosF4l9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5uoxZcr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fIosF4l9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnGOw2491012
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 11:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V9NAMaDG1Y1ozc4IDVL9zgdHOjlqUw2haBkusjjTfy0=; b=j5uoxZcr1MW6IVWa
	gp5++5Qpl7fl8o4TwG7uDb34ZOYoe+w70Fm+2n8zZ1Ec6Ka+wytnhKx5bf5vNr6N
	gkZ5lSorkav9a7bnyxnvvo1THa66oK7mTE6Y82vCT7jrbClqjdE0fO47Q4586g8y
	CDU+SUZKW2ovisdo2v/T19yVX5LPpBcHheeDOIzXp8Ugzo48qLh4OOo5klvqBajD
	xl+4RGymB+3o9xWPgdDqXVVf+OYbiYzGGYZc5LJkF2o+HOH+IGgd0oMFNZW9D/y8
	F/HOxm8Q1/fuZOP/1LYJn7qtI5dzfACFkeAmMpVQGDa9ERSe+vQGzxS7iinOl5+C
	HE0iJA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds9buu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 11:49:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517ac42d958so55584461cf.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 04:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781005760; x=1781610560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9NAMaDG1Y1ozc4IDVL9zgdHOjlqUw2haBkusjjTfy0=;
        b=fIosF4l9yi2VPQav4+4pKoMCE20wM2cXqbsDGv85lFTXlN72Iqhm4YkghTL3mfllf6
         K/iT/HsTZ9u9i+5Ak7ZQHHyUfG2pMyypWbCwv/c0ZHLEFZ386J8VZPoOrJ7IxKyy8vG9
         5PZx8+IRKt4clDegUi7OB8I69mILdqAoD5posaLU7tkfrDND6/IZDabqqM88WNYf8XnZ
         SMI4wmpzOHS+IpTXR77aULommrNS1CnBUDvqDo7P9Y6vvqqDGgsA0WJ+WIQ/+9SNEnis
         eSzKNL1zQLyiQQgg5ysL83KYofXhh7P+Cyfim8vjc1ZeGl3s3sWYJp+/Ln2iuA5XeTyV
         Oycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005760; x=1781610560;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9NAMaDG1Y1ozc4IDVL9zgdHOjlqUw2haBkusjjTfy0=;
        b=l9llWql9LneA0rYuhfsN8LMiDBJ9gbVQ+NvgnTTkRjpD3FcCqHOEe2zv2mC8ckk8YS
         ls/y0gstqcZtGM7oYCeohSF17vUNR40t8uQTY3ATtJH0o5zGTiFRDNQwGL7eD2+MKzSf
         XtBSV2xoeg6OnEmfICoDd1SEjITOaxpfLrhQFdYT7biqXRnReOxuQwzuQoUJhTLeU30r
         tlh5GhUKBte4+XFD+Wc4nKGrvf9Hikbvg11BQslB2NyC4z25B2uX8cCfQDmYbE17+C/Z
         oQRyUjRFRwW4JH66XJY2sQEbww7qrZE1eoQpWmHmeMhJS7sFUh9zxcQhOsvKkqw85r8L
         koDA==
X-Forwarded-Encrypted: i=1; AFNElJ9rqP+He8Yvk1KZNzIjIhnq1k33tupPOs9xGi0DxY/pvvcUG6sQQp5Al2soIeQQyJa1vD2QKs3SO+Cs@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5zaZOJyWk+s8pL/+r5YqrI5BeDWzUu4FEmTB6IOnLI/BAUwnN
	y5ekK4lg/phcoE0g5CsRGq/t1B861LaQ9Px3lAk2dFULMwwipa5dEghWyYkgorOkDGz2uKv6aJW
	3/Pf1G11+4VHe8FqfodFImtnuY8MEBzVoB7+Tgo3KB7TGm2TKQEJZYUhoIzbjDj1u
X-Gm-Gg: Acq92OFECOBRZ0t/hs+EKW6EP00QOU4dazlSujD2KiI5mYYkKbD1rPUbl/PVy6/V07V
	5YnisAsqm2NfVjCwKabjAVunCk0it7dwH7VoPzZxTaiViu23+CZyN9JD1qBRXXeBtkUmYsjOf6D
	VPHR6twjMFw6bnFphxEDY98dkbG6iXIaPQMdENoE3nWXXe2GIz86nn4rARJYo6890lhSp0n/tox
	uvtf9wgwwvuqr6Z8o27wAeVYa4vA6UkdVCvKcOn8kWh5mK6tbbTi5Fl21sQrNyGXVw87DrZ/S0r
	lOCImACs87bwuJnqsE+4ZrkYx1ramv89CboKjBN6a4kTZZOkAJ5wSZB4pM9SElliei+Gr+byWnl
	PNMgPRv9W4IXEv4t2WlREQUMSc1LcB5rYZZvpySc7fnyq4LCDzaGQ9AH49ZkVww==
X-Received: by 2002:a05:622a:164e:b0:517:21c9:a22a with SMTP id d75a77b69052e-51795be96bemr287107151cf.54.1781005759659;
        Tue, 09 Jun 2026 04:49:19 -0700 (PDT)
X-Received: by 2002:a05:622a:164e:b0:517:21c9:a22a with SMTP id d75a77b69052e-51795be96bemr287106671cf.54.1781005759119;
        Tue, 09 Jun 2026 04:49:19 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm50579818f8f.32.2026.06.09.04.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 04:49:18 -0700 (PDT)
Message-ID: <1a66f1a6-840b-4de4-8e65-a3456b654044@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 13:49:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] dt-bindings: mmc: sdhci-msm: Add ICE phandle
To: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, ulf.hansson@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
References: <20260608041650.541502-1-neeraj.soni@oss.qualcomm.com>
 <20260608041650.541502-2-neeraj.soni@oss.qualcomm.com>
 <dc833e56-e127-47b7-9ea5-58d6d2cc193a@oss.qualcomm.com>
 <c8da8a89-e372-ca87-cdca-396c754ef5d7@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c8da8a89-e372-ca87-cdca-396c754ef5d7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -TMNNhz2EcNvtOfvmAk-_l1fK05lpPOC
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27fdc0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=lOk5vIY1-vP44UW2zVIA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -TMNNhz2EcNvtOfvmAk-_l1fK05lpPOC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExMiBTYWx0ZWRfX+08zmrpLNQJd
 N/IRpYIV5Z0G0kmYpU7LDxv8b36Zw89CMbu5p6yAQHjmXiJP9uNycBpGhQWdkZgNU1wxwsoZfGu
 LYylSVHVXXThmASMv9Zw3eajQa1jahKD+qYL3gA7x5xEDDekVyIWKGsp+AHkvsf3nD4ykq44PHU
 c32lZ3jQvoH9/+5Drnllh6pBdr6byaeVDBGyFqn/RM4ebRdP9lZUrKREZgcNgjueZEZNvMCrdz5
 SmgKsWMN5e1FRc7+H+QXRCHN5eDPC4h9ks2e93PryvxMlSZ4MKyYU0aWrkdmJg1m3EXRMqHgT3x
 lbFINZkeZHfmnuh3693pJTas/XLRXmaNtlOT8wSf49yMnx/E3hU2P82Zna+U6HJAaE0pR3pKTDR
 3qnYSnjmG3XXefdZ4SmjAJEM9GgZ780CzscuK4Jle1R2S2bASjHdKoX9A224io03jKr32eST3pe
 4WD4wOU/bs0SSxv9BAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090112

On 09/06/2026 10:18, Neeraj Soni wrote:
> 
> 
> On 6/8/2026 11:40 AM, Kuldeep Singh wrote:
>> On 08-06-2026 09:46, Neeraj Soni wrote:
>>> Starting with sc7280(kodiak), the ICE will have its own device-tree node.
>>> So add the qcom,ice property to reference it.
>>>
>>> To avoid double-modeling, when qcom,ice is present, disallow an embedded
>>> ICE register region in the SDHCI node. Older SoCs without ICE remain
>>> valid as no additional requirement is imposed.
>>>
>>> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> Co-developed-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
>>> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
>>> Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> Link: https://lore.kernel.org/r/20260310113557.348502-2-neeraj.soni@oss.qualcomm.com
>>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>>
>> Link should go below "---" to specify previous discussions.
>>
>> Usually maintainers add link of patchset being merged here while merging
>> changes in their tree but authors don't add it here.
>>
> Do not see any such restrictions here https://www.kernel.org/doc/html/latest/process/submitting-patches.html

What do you provide that Link for? What does it bring?

Best regards,
Krzysztof
