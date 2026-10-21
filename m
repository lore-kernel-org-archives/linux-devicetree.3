Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586890;
	b=s4DJPHZJ02sroIzrBhkbAoQwKt/sWJC2RWtVDib3KfjEsaTYCpvM2joQAxCg016p1rkS
	 B6CLCOxKaQwxLwIMDc55VY0H9ZlrbhTob3lox8tEKRSYKnVc6cj7M7Rk9h1+nOmk/xJTs
	 S5AJxSw2cQIboho4pDJ09b4Qbtssju/6MIN3hc1kDoMXIWrwpWa43qee6ykVn3XdNKtob
	 rz12FAhNHlPWuQcBR0BaQawvI+nBjCRFsRED84dIDdVI+dDQeHyy+nRkwS4lkuOraRz0I
	 vPR4IDm51A3NiPfn/wIqqVJ0pfqWHKzFgODarn4zG4saZzLXuniZG1c3N0K9W3bD/4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ujKdY+HUMEpJhYBNB/aEMN+ZP7OG7I+LW7uZoMOirTI=;
	b=sxT/GUiWR+4L5OZxImspbCQSMtNh68fsA60RNLZ5rN4hjiMxDuBs42Hp7zDDZ4yd0zpO
	 sgQDU55dbVWw4CsEBlqR0iPQZEQRZMMr51mIJ0mh8md/tkpzWyiZgFPUT+T2fqwhhK9Lc
	 40xwjHU8kfp1A9veoYXRqE/9Hch8c4YTnh5ylpNXCUPy9r/Vn6UeK/dbWht9rzpgA6Awo
	 WhN9Uol1BaOHpJqXNzKgL5xEOhKDXe+OvqcstYaGZ0E6mzK96LW05JXRjm+1/+DO9M6JH
	 ZoIXUKNFLLWokNUwEYrLyS1dLtWl7RvlDWkehDF7f1esrB0irSNimzNDBwqfid9PbFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ctTKI+hl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HxPP9qQu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0190A606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0190A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ctTKI+hl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HxPP9qQu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg62m1599989
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ujKdY+HUMEpJhYBNB/aEMN+ZP7OG7I+LW7uZoMOirTI=; b=ctTKI+hlGosXLyS6
	qDExNv/VnhDYpf9ptalnk6nZQWvob4Wwv8GV4XEWCWSPABtV+Zf/z5fNQOjmXlB1
	193sEQrcFt3CLSbk3mcf0cCAmiJD4z1xmstU/+QEorwwXVLXJhNqhjVkFIR9qJ0W
	mUk78ljm0JWABsefyqKzhcFDupxVvjXjrXgjXOmlqv6yL6mfx1LdRMkVFWLpiYB+
	l39s9hFbfxrYVpjYQG4uECAqkDTk9HXgA4rKq3Sh02KY8nH0ZV9xv4wude/XRbUc
	Ub9xPxVv/c/zjr+4chYbyRxmtavRy+31FUnWB0byyBGk+lnAALTEhlKCPMUjsD8K
	NCmHGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhugfn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:48:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1440e081so16588185a.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792586888; x=1793191688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujKdY+HUMEpJhYBNB/aEMN+ZP7OG7I+LW7uZoMOirTI=;
        b=HxPP9qQuHV58/LRRhGWg+jHyfsbSQsojXyTpQDdVT41yXrTKZeQj8Z7Q4yLcMYRh4d
         XRynDTH+UWaJiV+WnONAfthEhsTJdV55ZeBzpN2X+Zebrzja+kcM1fyZ1EmnZVUnE9gm
         Ui52bM4MR2LSNol5s5Gu2TWJs0/3bSmIabadVEAwq+vHNfobGn4haVAryYgEXK5ORF9c
         276TYToyjttLDQ2bqYgGECizvB3MpBr8iaYvwjyBgUdGnReXlB70Qlgavq1XqK0E0qa0
         TJzdeGJqFUmcraPdPeVsBSl+KeGxWJcbPZT7eKQHtRZRLNjn2VOfzlzSvJL0fKdudY1d
         lwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586888; x=1793191688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ujKdY+HUMEpJhYBNB/aEMN+ZP7OG7I+LW7uZoMOirTI=;
        b=R44h3Z6/GYcxQ1M0qF6uA2hvQ8EpkIlLXXH3J5uhGhKDu/qChUp0stTEwNyLpF/9M0
         txgNKbS8IPZejbKc1Ve1axHyxHiY3Cc0CDaOsY8quLZC9HnQfQu6kaAb4T5rdI9cwNuE
         ILPyVU99pOIum/BCHgQPh8gpdML3bhfHownMvMd8exOXyzVA80wDCRyyCOu69VQZDLm1
         EZfI3f9iYKmYjjwUzrltW8hrSq8EFl+AcjvYsAFU9B+Hsuq+eLx2SKsm12lK2aeneW9s
         y8TH0G54ND0zByzNIG379G1EyXlQW140tpoc9eZtTm22qmydCIpLlSsY+sZ6vdqo4WoS
         kUKw==
X-Forwarded-Encrypted: i=1; AKwUvBwxI+ZtOaY81dypOz43PNZpW5+/dT/KUF/0fgz+KdV0IP6w+u8s0M39tM4R0Wey+d/v1Jd1n60BsOXR@vger.kernel.org
X-Gm-Message-State: AFq9FYJr9M7WdSVRdpeqr0gq+Q8zOHoLMk8vi4tZyv+Dv0G1jELfm+F5
	7Kj+uVJeOIjFClu40CHZh6cuH3hGArg9CSCqH/8nZcYuxMErxWZz4JJbP6jcfh3Gfqr/jrzo4iH
	Sl1/oKYh0M0CMILUDIfM6pwgKDTxNkbbvw8pNDadzrBD6TODQNxxETFAZbkkf+LYQ
X-Gm-Gg: AYBFou3fRf0Qn5CXPVZ36e5fdtDDRkFlwGAIyyN8DHAUZRqcYJshPQYocZq9Z/qR6Gn
	qIyNOxtsVtGfjOhBNvYOIkbVbPFw/20breWa39oZbLoEwWBGw23aIvN/c9JOtt7+uiZtsG2tFMo
	Vvg7/CoNJ07uab+OPiWDXDkMo+KtCKUR095M2kEKO0ob3rJrsBIbsVwLS6IFcWvB2J0eyBhCp/O
	2x89Ccs+a4/Zg/sdvVqIaA9QZH94obWHYbc1Jv5VnNGP13qDIiPBjC0g/BmYLCq3bPy433/v3g5
	Xx1VDb27TbPeEufxYaZoQboYBk/0MygFwtePNoWE99+DJSazleNOYSVf8FiKlInQ+1v6TNFPGXD
	2PlUjMK51AocRLy8BABd8SA==
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr471718985a.1.1792586888144;
        Wed, 21 Oct 2026 05:48:08 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr471671485a.1.1792586883333;
        Wed, 21 Oct 2026 05:48:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40316a2b3sm774673a12.35.2026.10.21.05.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:48:02 -0700 (PDT)
Message-ID: <74d7c3dc-0880-40a4-b056-f9a089a0ddc4@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:47:59 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI
To: Jianfeng Liu <liujianfeng1994@gmail.com>, jactry92@gmail.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        kaipeng94@gmail.com, konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, robh@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com
References: <13181dfa-b92c-43b5-ae12-912abaf79c41@gmail.com>
 <20261013015728.43307-1-liujianfeng1994@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013015728.43307-1-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8b489 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=tl9W2HV_90ib0x35Y-MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MCBTYWx0ZWRfX1Oi/0YGDva5O
 BZlKgfQsWXxKXXB00aoA8mNqdpofbkZwkwrT1cA0Owf5tMz+f8SCKowiJtFtxHXoIlI4EzaLR1W
 xp5XBO4QMIMev+y3gOZYo3zEu7q/W9Y=
X-Proofpoint-GUID: SCpith-KkDO3oC8mWJ7qPyLFQjGjVsm6
X-Proofpoint-ORIG-GUID: SCpith-KkDO3oC8mWJ7qPyLFQjGjVsm6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MCBTYWx0ZWRfX51Az8hd7cf4Q
 RsbLzG9/ntWD+nx6XHlpDVFokVSAAW/Thco6/MBFHRBJHc1WwQ3RWCf/u1mTMK09A/8+lKsyksl
 L+3ewVlxHDVvj51AbRBRLVlIZLayqAsR2MNgkTBG10FJHXg//RGIAsaspVCFBKTvZnxHhjGKXW4
 i0piX0Aizw0ChU08LiJxp0i2cjMJeU6BvwT1SEWDkbhILEAt64ac1DjagMTrUOZl7Z2OXBjv7lr
 8y+pKR54Rruh4kut7mDfiqv376zdjAuBCfr7OgZUm03eMASXWUL/RgSsh7BmZTdwxTqTjkXPlqZ
 tiBs+y7Q19ibLDf/syqrb5K6wrmV5/dit4RGFtIg8qM6P3eeFXUK1n+cBGMnWiOtTHDfiB1rA+W
 P5pPilrD8pW6FVPITKvbQZtKLF5nT1OjnJ5ugWRkFdzpDzTmHGIVRf+Wq0jFnzobRr+rO2wC65I
 3WlQJxy92MN3XMf+jwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210050

On 10/13/26 3:57 AM, Jianfeng Liu wrote:
> Hi,
> 
> On Mon, 12 Oct 2026 22:18:13 +0800, Jactry Zeng wrote:
>> I think we are about confusing the product name and the model name here?
>> It is clear that the product name is Acer Swift (aka '非凡' in Chinese) Go 
>> Pro AI; the link to Ubuntu stubble you provided also reveals this somehow.
> I agree the product name / model name distinction is the right frame. It
> turns out we can settle the product name fairly directly, though: if I look
> my machine up on Acer's support site by its SNID, it resolves to
> "Swift SFA14-11" in every region I tried — Japan, US, Australia, UK —
> and on the China support site as well. So within Acer's support database
> the product name is uniformly "Swift SFA14-11", and "非凡 Go Pro AI" was
> only the retail marketing name used on the Chinese storefront, whose page
> has since been taken down. It is not even a China-vs-global split — the
> support identification is the same everywhere.
> 
>> Also, IMHO, I think we can't use 'stable' to describe this situation. As
>> soon as the product is produced, it was given a product/model name;
>> unless Acer renames it, this is it. The vendor can also remove the
>> support page that you referred to sometime in the future, just like they
>> removed the product page; this isn't rare; I think we always shouldn't
>> depend on it.
> I fully agree that web pages are not a sound basis — so I'm happy to drop
> page-based arguments altogether. That leaves the two sources that cannot be
> taken down: the DMI tables provided by the firmware (Product Name:
> SFA14-11, which is also what Windows displays as the model) and the SNID
> label physically on the machine (SFA14-11-QWU1 on my unit). Both are
> model-name only.
> 
> I think the resolution follows from the product/model split itself: the
> model property is human-readable free text, and per the conventions in tree
> (e.g. "Dell XPS 13 9345", "Lenovo ThinkPad T14s Gen 6") it is free to carry
> the marketing name — so something like "Acer Swift Go Pro AI (SFA14-11)"
> works fine there, and users who bought it as 非凡 Go Pro AI can recognize
> their machine by it. The compatible, on the other hand, is the machine
> identifier, and it should correspond to what the firmware reports —
> either the model-only "acer,sfa14-11" (my v1, following the DMI) or family
> + model "acer,swift-sfa14-11" (what the maintainers asked me to use on my
> series). I'd rather not embed a retail marketing name in the compatible.
> I'll leave the final call to the maintainers.

This makes it sound like the retailer made up / confused some names,
let's just go with what the manufacturer says

Konrad
