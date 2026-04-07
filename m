Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCE421257F
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 18:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775586905; cv=none; b=CSlgDIi/8DyVvKzu1e0F4y2otq/XZYzHCm1v5GjbxEx+EsxfNY629hOnagy9jHQCGOVAF56ck0iyVk7zF0aWZplTQORGys4hXDG5W6eCtzkt6Npr2ErSnhQWsXh9eBFyhj4jk8bTTrLR3zCyrNpNrFD5sMik3cQHWrlktXWPvDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775586905; c=relaxed/simple;
	bh=e6zLGCWKG44Q6CpIMyHF06pldNfJdlFQblcr2W88R/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hA2cTzfzcSBjknm7aWg8TTlGTnN1yfUee+vWSo9PcJEy9h14MabwJDAAFkX7ga36xHm3C83KFcNrdERC8cdxALSvXJPLzrluLuFVX/JX5QIyJKUgGCU/U4Zva9xq2jIJpPqyzf+GBvLeE6g1V3AJE4XMBLwIlaN3SL/wwRDD6jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAzNrVHb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTg7QCVm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAzNrVHb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTg7QCVm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637DV1xc493369
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 18:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1GSrAmuKrIi32WHQZ3k6P9UtXY6AROmfCS8TaAEi9bM=; b=VAzNrVHbGu1fuNrW
	BniHQ+kMFar5BQK+qOko0vJ1nkEO8zoGOkj9PoqCnIrOkVSBYiwQM/Gn3tfmKgJi
	oznSrDkOXKRmhFcuiZ1pnkUzYuZtC/rDOunTqV9vBo7mkZ6wY/F1BQlaA5hbrStj
	x1Fr5NBj+cVCFMbCUM73RDmC47JMdTsSwmqOikoIkAGig3mcOySFk/uACS3pxFha
	OZA13E+L5AtUkZphM72UulMlWpqt8YOyk63olOFD97pFWzGp2P8OtniUQFkl09ra
	L0ZA+FeTIGWj4gLVQwGA5DpauUxXREGUMjbqKNRjK4OS0bVdq2DfpFRgi2tyy9Hd
	vvcY9Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8v32x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 18:35:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82cf8dcd079so3800681b3a.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 11:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775586902; x=1776191702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1GSrAmuKrIi32WHQZ3k6P9UtXY6AROmfCS8TaAEi9bM=;
        b=OTg7QCVmcCD7laWwdef4hfJvCZAf0L5AMstR3lqAC0fzwmkIaKuie/N9BxpHnCvjQX
         xoRt6I9CoEPpg135RgvQLjonXpmtIlLMm6fk/AmvHL8pICR+R+VVxws+9JCjmu4pQLil
         1k5iirE+RFDV18aD5g22s9Xv7HkHqn87lcrS/CWzvSVvbYammvqCv7PKD45G3zuB9eHh
         AhSys+Ki+ELAJXpZ8joF9rUZMaz1B5wnJy8COjRgzpSEP8a10InnPzKVydTYeDYXijm2
         /oSC+E07d/g+kdEVefBYoa9GteomH/7cDKoJrZ7E0DbxIifWTclL6QySxrQ4mHo3IIOy
         spsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775586902; x=1776191702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GSrAmuKrIi32WHQZ3k6P9UtXY6AROmfCS8TaAEi9bM=;
        b=mGtlGLBL0Wivu+RmT/t/83XMs1rWAzxDb/20bNHRuTJxuAVp4oUvsO4wEwmj7/4BWK
         cZR/xDOtpHMO8JZoX9WNbwncQxOXyPqWK6p5la39qGr/rkUP7abV/DN9LU0XNpEGsUdi
         XEtGWhPci74EIY2qF+ywBMz6viZNCd9t8lt6AXSqkAIYIoKkjCsuq3qB5LJqWk3t4Mk/
         9dEtSYmDEq5q+b/qcpJ4ct9Nd3SF1ywKu53YMgLGYZgKaUvhYPI6rUo19U0WKgKJNqvz
         aGW2G9tdmhTaQ8VWIb+mrw4s2oZqBDPTtnVVZDQ0sS0CXmGdstQ8NqcaeIpOsfVgZOqq
         vpRg==
X-Forwarded-Encrypted: i=1; AJvYcCUexGzSmdY/twR7zjC99/Fv0nNP60D3yqK9hqQXsnGZE47HYGN7Y2JJEX+z1bVBSEiKb3xUKHyoKEew@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8fG/nQaG8tYqXPXtq/Tvlhsit7vICXih7GxEf7OJ9IqiuLmFS
	yndwyMj7vgXTYmM7Zpq3KCLLL90AXURwoqll45X9S58LVdO0qs+0HnNyyCmW507l3O47/c0Bgt8
	HUcJ2l6Muqwn0lk4fhqKUR8lI64260j7J+iwsg7RyuLV6HfnKgg8ye7Ifi4A0V0R2
X-Gm-Gg: AeBDiesD7svJ3d4rz10MokUCsBofaj5+hBueRl4lnwBOIE7HqDkog7jVvvdN4gyMhfS
	7saLxGfl+cLJ4t6UoqaH41Gh/A4LxmN1IKkg5l4dvmkPydqzuooSPERanOBnGhJdxoKg8UqlcGY
	El+g3R43i53E6DAwiTzRnVsyTO+GE4oOcJIiO353IAfs5B/xCrm7zlfB3wOl+vmoOaHlj8rnMUR
	lm2c2sA24bCs1rDkjNuMgKilEek1MGjzqwJGZkUKBfInNM+gM7n9D/T2KvJGancnaMwBjVhL8kd
	hFnkgrOjAvTaSuTM2P+S9lWi4oWjXUXG4Fo9SB0TzU4LdGJ+LE/pxNIO/SA/iHKCyDQbLLaexLf
	995P4Y/pwQDO0FevWBmGJoyO8xhkxgRPg8OLiPEesLWKC0KKMnQ==
X-Received: by 2002:a05:6a00:2e85:b0:824:3bd9:aac6 with SMTP id d2e1a72fcca58-82d0da66c8emr18127705b3a.16.1775586902399;
        Tue, 07 Apr 2026 11:35:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e85:b0:824:3bd9:aac6 with SMTP id d2e1a72fcca58-82d0da66c8emr18127675b3a.16.1775586901889;
        Tue, 07 Apr 2026 11:35:01 -0700 (PDT)
Received: from [192.168.1.58] ([49.205.241.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c9ba21sm24353765b3a.51.2026.04.07.11.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 11:35:01 -0700 (PDT)
Message-ID: <b204ebc2-8260-45aa-af33-5fbe680acd12@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 00:04:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: crypto: qcom-qce: Add Qualcomm Eliza QCE
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
 <20260407-crypto-qcom-eliza-v1-1-40f61a1454a2@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260407-crypto-qcom-eliza-v1-1-40f61a1454a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V3RYiRbol8Z3ZLzbQhaXnSG7XG9pxzEI
X-Proofpoint-ORIG-GUID: V3RYiRbol8Z3ZLzbQhaXnSG7XG9pxzEI
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d54e57 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Rz+oJFlrletnL8nt2WZDKg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Xf1yJYGQRHwPKPLo8RgA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE2OCBTYWx0ZWRfX/WL93xuvEQ75
 4rEkqYLSsdPXSAQ09B34RwInqyCdAihQQXztD+JNY2s+cAKdbw1MUuXRkztN+cfAGdYqjCQzj46
 gqAcTRi2b626piTzrs7XpYCdMfi4zD1eTCvg5Iz8BPHlU2je5QNXnXWY0EmnraAl7d3BIfbPyEh
 OC0PRG/uGpKWj2ZcFwVzlevMBw2UYUh/52/rYtM4pHfCA0aXRlSytlsHizTEuVmPOX1EaikA1f4
 DgwTZZQlAu/46F2EQqKh9Ej2jtBaVVaDTDyQazdYfiXGGifL0Jqk03GZI6DSi1p5gjATjIVjIH+
 DaDm/seH8rGWtRNQP/82cquEksC+OUr2cdNcHjyNrzNZn/+skzTdCERWbc1hUw3dTqJy0Ri1sCH
 3m68DHAbwQIvkzM/ljYlAM2HqmSUKkxhVFsg3mV5vE1hwa6tszAl1KlrLiTY3RmUoQUA4hTHYF9
 9hT+6sYcP5wKpoGoRZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070168



On 4/7/2026 7:21 PM, Krzysztof Kozlowski wrote:
> Document the QCE crypto engine on Qualcomm Eliza SoC, fully compatible
> with earlier generations.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal

