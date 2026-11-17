Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922926;
	b=3A2MmQezSRHUWGbPH0KGO0aazxhcmDYDXzd4ieL12JCXVNfI+/eo9AghtcIpxgPOQj+5
	 fZxXD7XZOnYfMfTyKNUXzlqpDRRTRLsE7BEpAa19n70OxZqz13nX+xP+t3THuanXgCJay
	 uvBj6I3Bdyt4+wvXbeaWTdh/WcWEOM/oJ/JimDwR3IKsBytArSIrw/1hINCKL+JpRy5CJ
	 KfUtpoGrsWeGKJlp8CiEIrayFH3mUXpaTBrJYO0VnxdS1VH8fPua+SSqHnRn79a4Jde4P
	 4zZQyJyiHPkkDbjx3yJv/DZEItQrP0Vjgw9/R3uA6Q90CwptbcV25i/g+5PVVepNBrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EBYE1poZLtf5AVV7eO44k1qDi58YcG4fcPuqIb90KEQ=;
	b=e3nni2vw2k966wOwavrE51D4Vn5sxv+HBjw5yEi6LzOVTXInMF1QH4J0TovIuIH+fStA
	 6JU1lnmJsRXFKiNaUA8AXlCeJC1WVT+hJkw+hQyrHRXz8+ANxhItnbaLLrNG0ItO7xqhG
	 XS5neBoYxoT0/dCEyGrEBlwGeVSQa85DJietrb0qxMyJPChsCr/xKoPSlJhE5WXN0MbN3
	 phHKUiAxSS2CaxTD6pGen8yBSWp8iVii5tv0dQI3krwG6HKYkHpzsmGxaFFlrQAkVgjxh
	 xQdsQpwxT6kYbvvaxCtra6po8Yw49ssNgsPgPodD8WstRGHPjqOylzAI4xB6dFMJedw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dckrF8Bh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eNYP2kZO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9A2606A329
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D9A2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dckrF8Bh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eNYP2kZO
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0rnr1457413
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EBYE1poZLtf5AVV7eO44k1qDi58YcG4fcPuqIb90KEQ=; b=dckrF8Bhirhdbxf4
	+mdH4R0eGB4BFPnP9uZE6GWViJbg/6EleLYhqoRK0viYCXNnMuHnYhoLUVs8KgnU
	ZNTRsp6MU8CvGL/0wm66m8rPXyAIU3xzcgonDw1O53fdejMmIc4v+K6H9+5JDZje
	z/jMO2Xus0zQkSlCG+F++bfGWCDERAV/CgAbqwYXJ9kMeDh7lJKRQNCRdtduKdBi
	LPPhmsHXCK1drBkldw/fGkGH/nP5yyJEfNQoWaMTnVCo5WJibfyyZNTA6IiNd+XA
	og+EIdP84OeSdQx+79s8pg9HLVjnx2Ad5aW18cASiLEZ9tYLwUe3OxPxHZ4WHF4q
	kLrtXw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0nc80q9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:42:05 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99e0e6de971so381366241.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922925; x=1795527725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBYE1poZLtf5AVV7eO44k1qDi58YcG4fcPuqIb90KEQ=;
        b=eNYP2kZO/PAe40BXR8CiFhL0Y5qLeF/JV0uDrg9vB10GFE0TNNostk+8ECHCLu/fmf
         TSwQzIjhhyORTQoPjSjr+lW8t3MG1MgekDhAFIsb0qaioAh8ni27XnNRhqX11IUjiRnS
         kW4LwodQEdAAaniT1b8cezkQSr0xS0q8yOVF7ZqD/sHXtk3E1wLjbQ87u+VZs2zS7Leh
         11kK+qG/NqwQJ6/aosSKcK4ReQU2Bfbw6pm9d0vcIR4H2d/+Y91oxF1pisG8PzE9XSLE
         d9K/ROVStytx4zMN2J3ezw4oQAl6n6eQkVIGoFrmqGEv2ckziQrUb7hv099qn2cvf6m4
         j4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922925; x=1795527725;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBYE1poZLtf5AVV7eO44k1qDi58YcG4fcPuqIb90KEQ=;
        b=fPF/Lc3Q8wcPne6tjDuOsqIXE4XSPD4kmJQE+hs39a13oglsqoPrEuQkSrrUohBOm3
         NbwI3RQLChD1atLJuZY/DgdfamC6mwvM+7rugY925o6x93yyTe1E39jfcMns20Dy7NMh
         u8dPKZF0WnniBEzfTDCS2BDr4Z6IEEUTSQFaRZYPkXxncE5QIxxvIQgF2C2/xz4m9cOR
         gh6UDs31JvTMrj4x+WG2CpPOmu/erCB5XguFy1CydGxH49ZrkCUL7A0QNGS4I5W4NmVT
         GO+oY/dWL76FNl05/BdRyNYEgGDBbxJI5H1pbCTfGxKkrs+wNkfGNP826b4fTI25mZFH
         ZneA==
X-Forwarded-Encrypted: i=1; AL+hErFcmMuxYcFaXpqV38+Z1w1mXPxAGfmbGT+5zFldXGS76kIYx0Cl0SaGIVyLE9yJ/6Erwx4mqOrSfMdm@vger.kernel.org
X-Gm-Message-State: APuU4Z8X27JzX6TMjDtCKu1rBu/2vkQEsQSojbjSDG2Lo5/KmUGpuxGD
	J33q25+0/5pl3LpjIt0pW9keFUvwxHvlJkSlh13UkfOCEG7oNRadx7HDHeYlMs7KOBH0lcz8eUy
	7/RivcJkRMMagP4t/mDxh5S7Nr9LkeUif0zJWaUrxOwchu9/iRQXyyFtSSt0Jsh9LTzgW8tyY
X-Gm-Gg: AYBFou1IT3Br7Iir+bxjmoIxdzwUt4LGr6W4QYNgmpFn1irQ/DmZVncU8neKiDYlZHx
	tT+A3ytnPhDfPLPe800SwnSsPUpGX83JUNu8/CSUm/w7ijSrEncfs4U1/Wfbt2ihgmZrQAhLVRS
	Rh+49e5maJiV2VzrDf9hBLO84SEVw4AoCTTD2bpDS9gIMFs94b5pvu4l2MtXxevCLDAV+kqAzsB
	j6dQrE96IorB/z61qnZlMuAxf6N+mF03MgtItuYhzEXHsSQE1dyMbF4+qk2kcF+C4m1hTF9JGE5
	GiUqvpmPhgnYDiiRYcboX4IL/pOOQ7SYyN8GN+31pOAXtolkAl3CgcgBrEZAGPeg7kLpswr9WUa
	L22bt5/ZtskJCxQa/mFBuAE2wQLqAlibn3+xyZF4rI+MgojbfTQDlWLasidihdGE7F+ypuEls4o
	I=
X-Received: by 2002:a05:6102:d91:b0:7c5:4da3:aefd with SMTP id ada2fe7eead31-7d64d6f5f73mr3467010137.15.1794922924689;
        Tue, 17 Nov 2026 05:42:04 -0800 (PST)
X-Received: by 2002:a05:6102:d91:b0:7c5:4da3:aefd with SMTP id ada2fe7eead31-7d64d6f5f73mr3467004137.15.1794922924252;
        Tue, 17 Nov 2026 05:42:04 -0800 (PST)
Received: from [172.20.97.102] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm38621785e9.15.2026.11.17.05.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:42:03 -0800 (PST)
Message-ID: <3afc4286-78d3-484e-a213-8e4e917aec74@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:42:01 +0100
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
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
To: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-218859@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-218859@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LaipeTfi c=1 sm=1 tr=0 ts=6afc59ad cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=kE8215XNsLT8r3ff5lgA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfXzkCQ8Iqq4kNm
 m6Dw5mOOa1TI42kvF7rMD8EKWXJEsMDcFB118Kyq77lcl5il53lt1Df6C4bCbV97mgNGtQ0ninp
 DW3z6r+A133wfsKXMDMMo7Vka6edFkg=
X-Proofpoint-GUID: _7iT1PpJvUbjeyeIuUta6zpKJGcJx_94
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX3Inw7o2worJ+
 LMWAamafvXpGVXgXLbC4wYJJVCf/KwcEp1/OaAWVXVXf0dyqcdL0mkvaMIzyvauzZa1vAgxGjYS
 YvNhs9lSa+6BITF+K9DSSaYGSKKPokgmuL9oByPPTnkG48u6oQQI389qMu8ly9Z6xHtAdy52Q2k
 1192YIodPKcixSWXfCnC0VNCsXWhOP5KVOgdDyeoyFJewH90dYXPeVjRWXr8WejoXAtRqVI9bYI
 bwFuUPNPsoxtNrjmD5mMKn7xHGdBBodwJIDzZaiUtL/cPVS1Bprcaz71zTeg67/KZth2C05a3HH
 DFSQT10Kw0gP0akHmhqM4KAml6XWmLOc6eseh8FI4UKX2sptnbWz+2tLJNSECbkHkblgJFHvDyr
 E35yp+JoM3RPkeNyqKSGgQfrLv899SFtjnK/oMp8VKN4R2+vNHlWtnKrhnd9e18UALnmHKhxLiQ
 tTkLqlKArIOyBRV3GTQ==
X-Proofpoint-ORIG-GUID: _7iT1PpJvUbjeyeIuUta6zpKJGcJx_94
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

On 17/11/2026 14:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [High] arm64: dts: mediatek: removing gce aliases causes unclocked
>   MMIO in cmdq_init()
> - [High] arm64: dts: mediatek: removing ovl_adaptor aliases breaks
>   ovl_adaptor_comp_init()
> - [High] arm64: dts: mediatek: removing ddp and mutex aliases breaks
>   mtk_drm_probe()

All intentional.

> - [Low] arm64: dts: mediatek: mt8173: incomplete removal of undocumented
>   mdp-* aliases
> --

I'll fix it in v2, if needed.


Best regards,
Krzysztof
