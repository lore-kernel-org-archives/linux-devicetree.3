Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BD833F5B8
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784701084; cv=none; b=hnXAzSBozuRY3tsrNXWydM1hr+VOdpmxUV4ZgKwclO7HwwWUwrJitIJpF7vxDq0TlCeAvemzxeoJbQ9Yery+vM9diqLkEe6BZrBwiQHb5E89KEA1nlmR/MWkLFlCRTCdYV7ZryWAm1hugjGN3kBDrLIH9cUb0a5YRf1RuAOC9EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784701084; c=relaxed/simple;
	bh=G84HH1LOpkPSp1HvYOBTuCUVmFdkRQgnbP/0rvjUH78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSg6FbQKqe3qb32jXwDieeWEqo3uGgHs9TaCvZdMseGuBdOYo/IMWtYdXZ1II+v6zgUVzTFxjR4C19gyuvTdJqmoGMC/8WzmYZy6PQmdoLx7qFa/FH0xCq9+WUthf4IZmWUL6ZYtL0kcOw3Jx7QewufL5VLyya8tDK9DqSwGx1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wh95EfzN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkwNU6rg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wh95EfzN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkwNU6rg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53v7H3996205
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NVstpW2+wYdXupyUPPVWJJdjejtyiZpF9FjfRv+QCY4=; b=Wh95EfzNtJn4QshN
	J4yBmNfDObjMPHM1WqpdpDIbudVzSexlfVRdC7+ObiEMKIBxsSPY7kkej11pADvn
	nGR9vtoynFTWTfbCrvz7ZnKdzP09A5sx+WBjEvaQ82YqsKoBjbCZc1nYz6/u+HL1
	WjmRVfwkiYrlMscRjdVhRKmFu2plR9/5U1BgF7O+czvGd5yb6QmeUDtgY/gzXI/M
	1teSNXkF/o6opsKmWmkUEI9toLgN40JRTTwwRZIqT2pMDDkC8Pm94BsYG24ITRgP
	UKGJI+o8mfMt1g5cRliwdBYwHN1KBtv+vEpRBMvJ2LtnNkNco9h/9a9YHOI/1EJm
	6nUw6Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d2gsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:17:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso102605301cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784701077; x=1785305877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NVstpW2+wYdXupyUPPVWJJdjejtyiZpF9FjfRv+QCY4=;
        b=NkwNU6rgzJ8oy9oAzg1MAbGwp95rnqnnkBbtaNi169p7Yua91gABbCI3RY7RKcS3fn
         CYsJjPrZG+v4tgj9NlLeXVnas0m+lIHmCakz5S9KlYLrZWeRmvwClSkVJLJzzDiQ0Amr
         xLjIPskrNiNTawMherRNudoLMdK4GErtDtSOE/YVS5YTZDyNqbWFFhIrS1f5guOBwj2D
         GviAV1hi/rz/i+G7PRnrYdzUNyMM4kj0uoNAE1VjgVZMR8Tx3gwqmtMF8dolI7qyKzVG
         nUVsLCDcxaWEQnTyDhmkkRjTcP+VQ56CD/sfrBzv2pelwzEEp9rwW+p3JoicxLE8/P/G
         r2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784701077; x=1785305877;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVstpW2+wYdXupyUPPVWJJdjejtyiZpF9FjfRv+QCY4=;
        b=qIY5lVOfX3hTaWlQb1eKDCRCviookySprSp3tyoCe0avEVGLmfVDPUIggZ6W218d1y
         yF4GZ2o/kviWb09LWoJhxBimRolc+gbpJSfl28CQpYA2499Ct7CertEGW24OkPHRc+d5
         6O76v2N6729i3Oj1DkS4iKvLpZmfpVO8KNtjpExE4LSzLneUMZV9uq3coZ1zLjMwgGb+
         43CPPXNySqocS8zfj97R5xg7ATwwPK7oQHicwmojF2VLIXyjSIHW4sR/2Q9NwAaHhq/Y
         MK5s+BT8sIZlyGYBJU5cwBNoGl00/k6UIAkWSGsJE5Kf2mVBzDO8UBL2O83WFDJ82WKH
         lGQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0US5Y9Zp//B8JjpIytgpukF9y/eDU6PdQ3NebbThZ1F/XhMt7Y8ig21O3Rt4uLwSOm5gXlfe3fI/p@vger.kernel.org
X-Gm-Message-State: AOJu0YwGYRtHjiQhCj5oxQczFmPPAWXrzkFfHdAnmjEwYfj1dpg+jnFy
	6A4ACVFev5e8C9JGuoW6G3Dw9Rl8QnJXRW956UrYMv0YywW0Jv8edndJ5S53yAqEcnQJepMab1X
	+ly/pJzUXK99ahWWNBXx1iJWRUTNdwpQpFCHsDt23oaQpK52lgCwT6J4NXCVjqsKV
X-Gm-Gg: AR+sD12bEDf6e9MN8+w4IHwFLH0nSV96BY1VwGLQfhaapzWsftn7TxZO/cafFepmicn
	di4x968hUKeQdRhNu0jY8/CU91PTvOvVhCJ+tte+dAHXF1+DXln9SsU+CCfhOAs/H8kJ0Gxu9Xi
	V+//46OqY2nugQ78Mqab8Q5Nwk7MB4H1anpVEqwr1T4B6xkd1T8glkSOlQO6Ki1VUv+RNyZU6b6
	lLBZL7XUiMN4M4DCCngVv1awpFZcD/8CNXwjSTUDMNzWD0wSxtaDLdUUsypwvkYYLPyHI87HuQn
	mvSit4CXRjooDybGW6gGanfovfB99UFypKX6pmWlauVHYEtuwzk9fS1eKUy3v1YJdYT5NAYYbbD
	iMV1DEYioj301weDL/jMtgAbrg1OSWQ==
X-Received: by 2002:a05:622a:1c05:b0:516:7a83:8c37 with SMTP id d75a77b69052e-527a640e6eemr30117591cf.11.1784701076848;
        Tue, 21 Jul 2026 23:17:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1c05:b0:516:7a83:8c37 with SMTP id d75a77b69052e-527a640e6eemr30117461cf.11.1784701076379;
        Tue, 21 Jul 2026 23:17:56 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c532d4sm2789520f8f.22.2026.07.21.23.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 23:17:55 -0700 (PDT)
Message-ID: <584cd58a-a8c1-4f5c-abbc-ff514c5fe08b@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 08:17:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: dt: writing-schema: Extend expectations about
 example part of binding
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721103031.82188-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260721-pancreas-chive-3b9bd907a4de@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721-pancreas-chive-3b9bd907a4de@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3xDnJnjXU10OdCQwR0XFjWhqzCVWa7kN
X-Proofpoint-ORIG-GUID: 3xDnJnjXU10OdCQwR0XFjWhqzCVWa7kN
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a606095 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=CgmMvGpFnInxdOuTFvgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NSBTYWx0ZWRfX5gDlO072/GNV
 mEn705DEBgd79FcTY6c4qPVh0otlaFNSud4uSeNERwLazhnzRnvfmFKjAZJ+9h+KcX3YbKcUajs
 ZApFuZ/LvjkG3ZwuPcHVQu9f14ApFLGygODcU6zqKrpCAOcSn+sGNhuAdriwip77uYmqRiwgL5D
 qpcGb5L7Scj9qFoe7AWgdOrTKpzS/JCR37Z9UzRZQ8uE6MquQWmUQHZQCVESATZuTRmQxk8mpHp
 NklS3rUbauUfgCBx4PKbwl319UsKiec1lBjXU2Xjq3hkCVnzjKDnM06KJyctQkmftkBCNhmrekP
 zNfw8G/IgQzWK9vnADDZsxnbnXd6vRGPfw+HcDJNylzwdXIKuRj4mGCGv7vzLaOfhpM5vDnC63u
 leFGazZCF0GkhcS7d+Z9kGvX7cfARh7WAoEGMqd00FsDxIkHL6FqrWWHXLoG0wf+M85gyVZxzbu
 cSxDrB/rOo52KpYaCrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NSBTYWx0ZWRfX35TDdYQOoDSp
 3nkiwPYbbmLPFhnbWmFKB/7P9F72/78+Ad+33xSaiIdTS55aIrIBNt1+Ph06xzkNSoFNa+WIzPS
 sR+7Fj3SWY21pKKzM6IdftfWzLXXAso=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220055

On 21/07/2026 17:44, Conor Dooley wrote:
>>
>> diff --git a/Documentation/devicetree/bindings/writing-schema.rst b/Documentation/devicetree/bindings/writing-schema.rst
>> index 3ffd0828617a..0f665b13c126 100644
>> --- a/Documentation/devicetree/bindings/writing-schema.rst
>> +++ b/Documentation/devicetree/bindings/writing-schema.rst
>> @@ -127,9 +127,16 @@ additionalProperties / unevaluatedProperties
>>          two above cases ('false').
>>  
>>  examples
>> -  Optional. A list of one or more DTS hunks implementing this binding only.
>> -  Example should not contain unrelated device nodes, e.g. consumer nodes in a
>> -  provider binding, other nodes referenced by phandle.
>> +  Optional, although expected in every device binding. A list of one or more
> 
> I think this first sentence doesn't really get across the "final device"
> point you were going for. I think it should probably say something like
> "although expected outside of bindings describing common properties or
> sub-blocks of more complex devices." I think being clear only benefits
> us here.

Ack

Best regards,
Krzysztof
