Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB43F37701A
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 13:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518093; cv=none; b=kJHy9fFwDy3brTIUr6bFSHMmtv9soLNiWIkDncFVA0zq7UgoLJVzV3qklfHjNqBHjlprt4/OtfttdzLjBsnnYlmBajaAQ1lfVFmgfR2YYKl3UQJtji0CZ9uzVB8YyBH145g1oJ4D5yX9jRBfdchwO0nIaddputAirhYtTVtM8n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518093; c=relaxed/simple;
	bh=KFQdtZQUjbmVwnYD1nP9VRox/c9a/BcIswBEt7Piod4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MD2bXLEYGtjgl8FVnz5lw/47Tp7BmkZB7T27rOrQcEurdxS11LYK6C6WQgxHZomO/EgQV8IGDH8UG0VwBTqO8msHQsiVWOjxoS6oisMz7uRhulpAnhIvb165U2+nNM81+3muh/MfNOoHvkF9jyPEY3zvMN+jWtL3846lHt/+xuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DnaCcWKh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dlH+tVwS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DnaCcWKh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dlH+tVwS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C45Ze2716591
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 13:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cyzbVXqOxQ0lRxphI7MsEng9+COKL6/2C9LvfjUznZ0=; b=DnaCcWKhVz8p8UjR
	poXCjnT3uYYe0a10krQ49xnRpFQaTZOnO8raaX/F9ayb69pgkzjsZbjQgnrnP/LO
	ZrVDvoOqzaUo4ywzxDNi5IT6dkSb0MKsprEJBUXWCbZ3jNpr1zmH9fc6peN3gdN0
	lKg2K5TupL96NIayGPf4JbQMQ0j6d1mfIQNl1USwrnyryRHVrzwcClOzaOk9x7kx
	X2hlvLOOyLKtW2swBOZzCo6v3F4e874a1kOc59pdahNQ0yhGvBuuuy75R8F+7tTs
	zuQHQAYzeqS4JoyS7ebhqdyGaab7u2fe5O+R8sp7wz58uVDMnDmD0fHHsJHu4Hsa
	Um3Y2Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd4pc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 13:41:30 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bf5b976952so24332e0c.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783518090; x=1784122890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyzbVXqOxQ0lRxphI7MsEng9+COKL6/2C9LvfjUznZ0=;
        b=dlH+tVwShjwICJDpdZ8Qs3LHXFCIPuRMaukdy1NtL0zPsPyOObDGZ+BHos7MOS/ysK
         LHMOsUn2flNi8EY5qo5N8KQD8Of8rYpNViaqXaXM/INt2cdEW9wNSZjgEQF+nh3IF8oT
         pJdIzEUu6S2HAnIWACA3cP3CbV9K7DCxj3UhNp4CaEIZuxj5sItpvWJUBp43bdgK+T+U
         hQwGCxqJafuZwgw4kKOsoUOEQZGRjKjf3imAtv7wQ2AsyFtKUQp0JWwt3z5KmDakEzF1
         7i/LZzQOBqs9A8MJxhuKjconRrGouqayNPNeMAvH3m8r53OaohpMV/2RjGA8vzN9ToXW
         hCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783518090; x=1784122890;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyzbVXqOxQ0lRxphI7MsEng9+COKL6/2C9LvfjUznZ0=;
        b=sRtv3EqktVNpqRNvC/VV4XdQyN9uB9dLyfmkfVi+eUMe0zATvlNObqGuBmHTWVBqZE
         B1ir1/eNsHq2giPEOG+CZFBez4vI9Vq0hTzWyl5UC0O5EWx1PiQ4HlsiaVFmYRfmuSuU
         cr7awdG3TKa0J/vWetQNclefDFiia2EOBqbXQZ1mbLGitJr0vA3VGOar5KrteYJpK/45
         QWnT4oTJ+sHCpJdcahgbfNQ8go0zZk8mpOx1pPy36gp7HC3BLiBu8PDfQGUrAqw3qNnn
         4HMD4c/LcU0RF/InSFQfJjaFmHbre/ysynzASAD99arKZeeS9CSUQXsIz6e54gPaanhc
         GTiA==
X-Forwarded-Encrypted: i=1; AHgh+RqLLQmsqpRF5qHrIRe3XkutGD/ouMjLAcgAnT3UzW1FkRZHqtcx9gPVrjJdjCHdl9F4EfamFqziV+Hh@vger.kernel.org
X-Gm-Message-State: AOJu0YzqH3e/masZVEijEySLZJ6sjBE0U8B8NKvuwjDp26oSZuIMUEBI
	CGHObEOuCR+0gWMxNgRsnu6c7+mhe+U7GfMgMPZgKs7E7jDUEtWB2KSy3ynBtZbZb2ljo+AMiST
	EcttqApa1hk5P7JPPILMfg7+0Gs+zKJwPNUT2NrGf6uzN41Dg5CYClHUqGPC6nmys
X-Gm-Gg: AfdE7cnutJ9gIy8xMxm5N+4vI2Dn3zkZ8+Zgr4TZCG6euXsi+t8eSF5WZsa0lrXsxV/
	Kuskj3uJm7G4hfAx6JtGp09Kg5GW0EFMWqd6c8aCQZV0FgOO1Bznnq+vSX59NFsefYjrvkyvaTo
	T3WteiH6eqh1LYQn+xqLE7aALh1WvPgf0k278tRu7ONyShYZ3Eng6IXBYCuCz7fe1KkpwgjtFtg
	Zp+m0WehkdYjF66yO0MMRnaSGwNNNG0bNHI6Su6Yck19IofrnWs08E16XbN7kGPuJBYx5ny+MQi
	fcKUOOwVnIOgJlnr+Ex9escB2qQfJV5tbNHccdYd3UizLjSkGd/GCUTR5AIUYkpxFMAftv8poqm
	Cq3O6jqBPbQEj83pG+kxlln4RyZqQFk4jrTA=
X-Received: by 2002:a05:6102:c0e:b0:744:ddf2:afdb with SMTP id ada2fe7eead31-744dff8e891mr447032137.6.1783518090126;
        Wed, 08 Jul 2026 06:41:30 -0700 (PDT)
X-Received: by 2002:a05:6102:c0e:b0:744:ddf2:afdb with SMTP id ada2fe7eead31-744dff8e891mr447017137.6.1783518089586;
        Wed, 08 Jul 2026 06:41:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb417sm4432418e87.50.2026.07.08.06.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:41:28 -0700 (PDT)
Message-ID: <cc934e7b-25bb-4e57-80f6-dbde3b9e263a@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:41:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260708-dts-qcom-eliza-add-bwmon-v1-1-602a409f550f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzNCBTYWx0ZWRfX5lCNPFQTyXwV
 7PH9wauVX4fKDgkN6ep1NxOKnMcFg95z3k7skCW9EL+8Yn/3wGZ7ukvc4Ns7vuzqwIRJAAWsIeb
 POgJgXvklq7OCo56tpbH5toQkdOV+HcrzQ2u7Y76Eepahmk3/kx06pEU0Ddw02s/eMxXUxiYL82
 55sa2B69sUpiAgRm4Ql/8gKZA0H1zjPd+OyTnz7/oUAP5vOf7G/35gQbMiDZ98tG5hiAq5abAvD
 F/A0yFKnMyz2LdZgNg/gK6mWdD3Lsi2Us4p5V4wYPnAZAT+s3XIpCO4iOSDH9br4meUXq1ulAMc
 3oxOVNG6LBJvZQem5wfIVfHb9Bwu1u78NKRz6PUibS7yxcSy01ehX6EkQTrdN4xMk7MXkSRUK0i
 2KDGCupNDk8zTef8a9U1hUtYc1XGOUu/8D/F9pKlxkHjIjyiaZsar/ycHR0cGAM7nJ6fMimDvx8
 yYBq/rHGONfq5pQqF+g==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4e538a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=T3cQ91Bvcxg1os4lQNMA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: eWGkFxou_QY0UJ0aqxp1lXeUcjcOjhOE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzNCBTYWx0ZWRfX0GqUIUecgzwF
 IKE35DfcBf6MbF2ike/tSKxGjBA1s3CQ3JbFcQKqGqcs08ixvW0c5OMbGXYEWWNCcUNRfjcwEf2
 rjb5MdiiFv7N1iZmOwfUs5QJ2OeTXUQ=
X-Proofpoint-GUID: eWGkFxou_QY0UJ0aqxp1lXeUcjcOjhOE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080134

On 7/8/26 2:29 PM, Abel Vesa wrote:
> Describe the CPU and LLCC bandwidth monitor nodes for Eliza, together
> with the corresponding OPP tables.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
