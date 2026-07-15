Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790573C5DB8
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103119; cv=none; b=loAlE/tCkIFT0G7OoZYgJuragyUwRJKkPJz+/B4S0d/SNHOZNZqjebs99syF1yKsr+MJGhnpxQ8qxum5hOHcsU6mLbEa36X2Et3RapkBq8/eyTxHf8UPkHz32xJT7L/79IUWeOCVYc4mT/RMvxtQzwsk2gGjSEGVc3J8FHLXYvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103119; c=relaxed/simple;
	bh=Dn3AlNjz3WzHd2KHxN/GexTbkYP6o4IWjElyvS7sqIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m7BiSiF9H537Skj6inMsTTW80od5ch07CuXnnxi+YThjF3Q12ojYW0wlt0dKzODt0ESfT1cvSNxX4umwm35ArZHMcZvp0KWM1GZyX3ijGvLq6exYnR6zQEByUQ3h5/txW1hOy9bsaR9W2qyY6aP1Hr0caVIT6aBj3Yse9j5STKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2WS63Ov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zwprl451; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2WS63Ov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zwprl451"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F6hXod2796465
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dn3AlNjz3WzHd2KHxN/GexTbkYP6o4IWjElyvS7sqIY=; b=B2WS63OvFMmtHXUB
	BxrUqzEQxoKZYvtsum9IcOUP1tqNDNEcu2pf9LZDaMVeJA7nVTgCCaZieHfAZr3z
	0ykb++CHV0InE7TJe0FI4A8Svd3cp9MIGQtqgGu82FYWvz1nNYuLf2i5flPkehy8
	LoSx+BPy1W/XobhdPoKkO7wTtlZH1rvyL+l1rwHhC52oQKuEct9GgoYNL4evOw9k
	N0go0UvDgBbJK+0ltA3kjkcy+GJSLFraVIlVXzmdzi9Zpq2JWQ5wuWOAvHqQpWnI
	2WKX5Umjr2GRuxkGdXkcnSzO/6lBcB3+VQ4zYBoqIJPuPxzacf9pxXI+0l/SrSqM
	epH/mQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h8au1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:11:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so78352611cf.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784103116; x=1784707916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dn3AlNjz3WzHd2KHxN/GexTbkYP6o4IWjElyvS7sqIY=;
        b=Zwprl451UNtmnk8Si+1abeErEw1Ob9WUIBiRrlhPtXmzVec8zVZmHJKL14yxoYq91h
         yNWouCNkGVXuVXP1KkqYGxR//6xPiaYe9yvQuAHIZsdEpYiU5DHs3+FEflMguBxK2zqc
         bUIodJ61mTf4HECNw1VMEF7gOPNhw89f8XCcrQDyhxLg8ip8lwagGYy8nsPujhnTYFeu
         sbxBRkj9816/WDDzn/6r9PKsF/vfFxM5QRRtcetRv6T9Pq2d/SxOYE1qSSZuDGP999oi
         /ZpR0dLkyjIFv8xhomBMG63aPkAiMBeHCVLfdB5pdqjT0z3zV0Hj1MMUsUaJbCYwtaF1
         t2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784103116; x=1784707916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dn3AlNjz3WzHd2KHxN/GexTbkYP6o4IWjElyvS7sqIY=;
        b=HPQgOpIbqVuUBy785A3XkHTHlsulfbRcLNRKQqjY0Y9D4Lkj9fBtfZ9kICSSaumITx
         jcIKaZe7amHsQ8A1v4zAcDGRbqkjjcoRFaQKi8LZMjWB2OpG4x/8DfLE9JjjDs3MTnUM
         caM/Lg95YgAj+5t5PlQLloUM9vbJDPQf/JhqASY3bKlz1Blm12oYt0MeJoEt22DHuZ2W
         Wp5v/Wt/wNZjVZjz87c3YVInB8Lvr+4PMcS7miV8wFmRBtQaEtCdmgKh8B/RvEBDAcK1
         me5Jx+3EFkLzbMJC4efA4DAQEt9ouTzB3YiGK8IGWH0h9OUQ0D5AbSy/FqIGYgLFMZKa
         hGAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpW+R7ouvxbxpQaChc2taEfATG2MHbFpjYwe6XPPIUhNMU38mi1pylwL5ZryKYrTCuqzz5R4JKtQdKO@vger.kernel.org
X-Gm-Message-State: AOJu0Yya6MAkwAdKTuvOnGnDYN/yeJKYl7SlhK/txmGbBw96NXqiXSXr
	LRoBuNjo6Nste3ps0pD7uUa7A+wqFcvpEb/pe4BYZmK86vs9ZJstxkFk+HYMRAcs++bFxQij/FI
	+ImzC43/KxINqbvXwaaIdcClWbC+1zgWCfHAyELB3EUWsDezVbHMENsODUGSfYyKs
X-Gm-Gg: AfdE7ckg3tO+QjJcxZciUjXNsoyHSkU4bdmXY51m0pUWkeYOCTHbmLCyqngcxRPg23n
	j9sp5O0IaDeHiPiRNbtppUF37JRa7n2vw9i882qTM5o9PABDGQKbLAm63j93VRPD73MaviK8ikl
	ehJeieo1xJv0mCiQkEXcvl1xO+x71cX8bV+M2979ec6+IZCoPpmFFFAYCrCCAavM/j2RS2bAYmF
	vmlrO56y3nycyyyXjRlzMGjH1g6rXN1w3FJTLYRFv2Y5sLkqkDmn1ij2nzoV1Zp2FTfC2IUeyfX
	Kf+g28X1hxgOchXzdosBsLvQqZpMBbgMRTyFInLxlJ8kZX9ug3A8WN2mi8y0e/8NbhK14pXSEhB
	51ZKfxh+D7k5XXY7/iNfaQIM1ESvHWzDj26+voLmeUTn+D9zLfpDa35D1156JS3RMMqPMmgMLkE
	REqxdrblbX
X-Received: by 2002:a05:622a:15cf:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-51e4ede80d5mr17803941cf.9.1784103116613;
        Wed, 15 Jul 2026 01:11:56 -0700 (PDT)
X-Received: by 2002:a05:622a:15cf:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-51e4ede80d5mr17803691cf.9.1784103116215;
        Wed, 15 Jul 2026 01:11:56 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15beb53b86sm1142891566b.25.2026.07.15.01.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 01:11:55 -0700 (PDT)
Message-ID: <61d147cc-9baa-4304-b03a-beb342faf690@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 11:11:53 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-4-atanas.filipov@oss.qualcomm.com>
 <alOpwQx-43WNPHcL@baldur>
 <ecf8cad1-47cc-4b07-bab2-d0fef6648bae@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <ecf8cad1-47cc-4b07-bab2-d0fef6648bae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3NyBTYWx0ZWRfX3vHzbDgNaB3x
 yJO7pD7QOH94+QPfvzCsK3U1nFdX4fyJOPWjrqxBzGJrKz1AcCUg7HoJNI4BjuSiRDH9laYWbg/
 DObPBkPX3OFowiN4GU5hKsskiWwF+tY=
X-Proofpoint-ORIG-GUID: RNz3I-Y_qHO_dMKmu30ITXkBd5YpvZqZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3NyBTYWx0ZWRfX087OMLrVGWAK
 msxEz/gfw0rIS16Z4xiN+YRuEgi1JJ094D8/tyBdJOcvAkVZdV8nObpUkSNygc3bORsmKB4JF52
 06o7/VQRemaPWy+D5TUahkgw7SMJ1p98XxgiSoejaVBEWcQ3i/2tZTPkn5wWPqkw5bdgpXBFREn
 yQtNlhvvEX4jgmnRcvFhSrwQ9Shse7AtPQIJ94OGzVxdM6SRJKStpMCHO6qy9hcQVTqx0CS31CH
 mbh2q3BKZ4V14nPu8OVqHK++ptlxyKJBXErQ+bZ51x4N+Gler/GQU/o/BIGufahbiZcoYS6nb7a
 3y4Tzjn45gKJC/dFsTJhRZAngcZMVKYKi9Frqnn92TOxN8X+D2nZptcPnkOH8eAbpWHHJS5PG+b
 z9MWyo7lJze/gJAHVymwGLKLNyZjjwih7IaDbM8FCnfT/z/cSzlqHhQ6jhdnHMmGSiSLqNMaoc5
 5HHxeXnovnwumLIHUFQ==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a5740cd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PfuqhoIL75c5hKM3NgMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: RNz3I-Y_qHO_dMKmu30ITXkBd5YpvZqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150077

Hi Bjorn,

On 7/13/2026 11:38 AM, Atanas Filipov wrote:
> On 7/12/2026 5:55 PM, Bjorn Andersson wrote:
>> On Mon, Jul 06, 2026 at 10:11:11AM +0300, Atanas Filipov wrote:
>>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
>>> present in SM8250 (Kona) SoCs.
>>>
>>> The JPEG encoder is a standalone hardware IP within the camera subsystem
>>> that performs JPEG compression in memory-to-memory fashion.  It is
>>> separate from the CAMSS ISP pipeline and has its own register space,
>>> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
>>>
>>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>> ---
>>>   .../bindings/media/qcom,jpeg-encoder.yaml     | 151 ++++++++++++++++++
>>>   1 file changed, 151 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>> new file mode 100644
>>> index 000000000000..e4c16388ef07
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>> @@ -0,0 +1,151 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm JPEG Encoder
>>> +
>>> +maintainers:
>>> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>> +
>>> +description:
>>> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,sm8250-jenc
>>
>> I suspect you find it obvious
>> that this is the block than is used to enc the js, but I don't.
>>
>> We have space, can we please use some more letters here? How about
>> inflating this to qcom,sm8250-jpeg-enc?
>>
>> Is there a qcom,sm8250-jdec as well? Is that a completely separate
>> block, or is this IP-block actually the qcom,scm8250-jpeg block doing
>> both encoding and decoding?
>>
Just to add that it is separate block and is doing only encoding, jpeg
decoder i believe is not available as hw block for this Soc.

~Gjorgji
