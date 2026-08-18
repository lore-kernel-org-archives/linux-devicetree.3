Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7633C3F44
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044454; cv=none; b=KwWDOqIHmlyQGNgpZdxgKr6CTf6CPpDxYgatVv0Nm1snxoRdr0w2rFO3u9kj4wVMRcg4hjneMyIbS++YHwcki8o8DYMBkiny8etCZ3qhVrE5ChsZ5jh/lhCcw8xIEgiUkkanyYZsTJXND5T1ca27kUv+WQsr1QrHBWGE6c2VoXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044454; c=relaxed/simple;
	bh=lX3E5wAWkPFI3DxEwHWwZE7cR9g3fohzftcQlYu7Sp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOjt83ysSU4FXCsGxuvm5nW3X0syIq068Bs5q3smjbNhmVBS27OsnuB7xukrKxHkPnP6ITshxsF27KzajlHZZs5HuZKfiK9ZjvTHQZyjH+hBC+jz8S5eFU/qtgcVZFOhXbP1Aqa/DmsizWG5eJ5t+0F4oKK/wdbXsLBOeGot9DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QFokiNcO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jc7SYTgt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QFokiNcO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jc7SYTgt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8Ba9W645670
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6dllsyUPTaywsZ7RJW52PKhRGxc6/NCQk4NlA+DkgnY=; b=QFokiNcOZqq4prMR
	rWT+JXWNUdAODZjG0onFW7g1Q2aYmR19GRRA7yTqCkF1veDsJ4X3tTekRp8hyq1X
	4BBYW5vK2U2k0T8VvQ4jEmMLc5R4LWFovsJlutzfT/2iuolnr+/qCGK1As5nyXSc
	tIn6y9YzcStWZNNzfuD8GECqKgFV5kuAaU+qSWCw5AOTieJrilUF1/cQIpM7NSpC
	ft4XHziTJY3T/ZlQWQj+XJsb3BRJ0Tei6i+I8oj9ZN+rX4bYCTn/4iedgUDMehYn
	2IBmYyIj/H1gN31f77M8uToVnBL12pVZB3MPvAQoYCEReh4a7+60P4X1CSe3aGil
	imCAhQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611bs2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:14:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93495488976so116743685a.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787044451; x=1787649251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dllsyUPTaywsZ7RJW52PKhRGxc6/NCQk4NlA+DkgnY=;
        b=jc7SYTgtDUHj2o3NQapevbnHobPqCzmQGoFDzYHjg/xmEes4jq3t2ZqJ6K3ur16eZH
         GaiyX2qqLAaEp58bWYNft7RiTyt6kghqUxazw2q5CuVOcbYKwayQP6SxWYz8wQhL/mms
         3/cKMRaJoo4KAQpFKXE2Gge8yWBBsbHFTH7EgdHhendVT61dO2CHOzAKhfXYyZkVQ9iP
         /Anp4l4Y9nuYkPrf0usPhQwrs7MVfcJ1+d9RfpIan6UEaCz+97Fh0fdfduFcijHy2dYV
         Y/04B9MqdC4VJ2Fg1B9Jj6ZjPX0bu7Ii7rNApJMwhCw1x+i3NJKVVQ4TTA/32NIG6oFw
         kcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044451; x=1787649251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dllsyUPTaywsZ7RJW52PKhRGxc6/NCQk4NlA+DkgnY=;
        b=Zu0v57tirQZO/lYBWvmKUUqNwvXviTGti7L8/o+1f27SLNZjC9fFIMm9PT+P3KxvZA
         BncQ6cvsBQfhPd6mqXSwqvyGM5rAUp1pEnySK6ECEaI/Yah4KyHbbHa6/8zUprdehExs
         QYIcghSoKcxY7jX2cpTE6KmKusu2GlrUQQedlhewVnHORjatIFBAIucRJQuVPeZa0Th2
         cN+k/9TFRNhoDUCPXwP5kZFjIXpW68LCYezmzwPGu2Q8JrHQKCiriaf4wjoPawrkAeWG
         d5AkO54zhX7mtQ1aDAkFACVmdKNdogCgfLxUsBwr9zgZ7Qyyo4Us5B0bAqTL3c3+yjVm
         6mUQ==
X-Forwarded-Encrypted: i=1; AHgh+RoE0CQJzTAvEqIx/LA3kGTDcPbX9i7ffKSsTN3kvPIt6Gc7hlx/Q7ltzIDQp233O/NWoh5c6gC/tKtO@vger.kernel.org
X-Gm-Message-State: AOJu0YxTn/p4CYzj4YaZfhqrUC6EqqCAYUaHZq7gajKsXDWudjSZ7JDg
	jf/ldhAmZ0zjZBhR3AxGhF86IgN+mwfk8chgx9IBnfiU8nuVjL+KK2DfaVU2Tmte+hvQHxPkoYs
	89eFDdmc30SViw9F4/9PjF967uU4r3Um19lWLjKVMRU8+4oTOq/LJxTpr7UYPQrQ2
X-Gm-Gg: AR+sD13Y4Rmcx86/0ibLvXVBboVMjB384evItid1NnoXA9RvZfD70HzW4b7XnFrWNEO
	XI/kQXwCQ18Eheu43KiJgTCEUeTTE713uWoLTPmYLfAavn24Ijun3lZMJtBYnoYj8TVcAcqlGnK
	edWuCckz+oOJ74caFm7AX4Ko7NDabrhn6Wn9aQx/ONwVrThuVQWMo0HGPqxqEBLvn6DMcjVb9BH
	88NruXp9VM97FZLjXzwSSj6sIkykCMTWzbMxGMuuzx19SRwtNnFOPQ3NQPplDjvpzZ7ikZzKIp1
	gBStiP/rffTRmnlkhNpcDDyMUeqXwDLNvb3uDgFn33POvh7/Xmo+0KtfrZGH1GFrR3Z5lgeJSv5
	/ybQynNHyvYcy00jmZPhIJLrN
X-Received: by 2002:a05:620a:7083:b0:930:a08c:cf9c with SMTP id af79cd13be357-936d239560dmr2241559885a.2.1787044450910;
        Tue, 18 Aug 2026 02:14:10 -0700 (PDT)
X-Received: by 2002:a05:620a:7083:b0:930:a08c:cf9c with SMTP id af79cd13be357-936d239560dmr2241555985a.2.1787044450420;
        Tue, 18 Aug 2026 02:14:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8596d4csm1480609a12.22.2026.08.18.02.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:14:08 -0700 (PDT)
Message-ID: <f7bdf9aa-13d4-42a4-b12f-9ebc28552760@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:14:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: Refine device support for Xiaomi
 Redmi 5A
To: Reza Kurniawan <imkyufie@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260810105337.855546-1-imkyufie@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810105337.855546-1-imkyufie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b5pg9DB_nV7dvEXT94IkOsLPumIpDeSA
X-Proofpoint-ORIG-GUID: b5pg9DB_nV7dvEXT94IkOsLPumIpDeSA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NyBTYWx0ZWRfX0bNAnhWK81RB
 IZu0UBvsxteqgPH+AqgyC0yegNFipwCZVyX8v4eULQHs+DLaVZRT5VJ3V7ATjZubp6Q9ZveFvj+
 rmL8KiwLhma059cO9urgCyMf9fOYa+U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NyBTYWx0ZWRfX9jVLL4odcW+j
 5Ph+wS4A9Xe/AsNFOi0Z+JtbzgWVftErZEHXVL6NA0lmLPB5uxOXXJIHgCmg9FubIZqCQq6sqE/
 Q7mGWJpZeri3v7sEe31VBeuYn8QBlf7gHLqndbdII+6hAEhQKRqr6cNMjWV1sGV6J5Ek6wD459y
 0fx+/r2vTdWeQ4h+YLS5UUVYP8b2AN//Q3Pf/0Gs5fG9kkUPpaaw5J6P8LCpl2SMfk1dZF8gIUo
 izXJKTSDWPYqnvlvvZtUEjUp9mpJQFFy8FPEoWzw8zsyTDK19IWXlKspoKEG8qKhU5Vxb3TKSSY
 XVGAYzTizsoIqqHMt+5GLqbgV/JcG8esCw4Ux2VXTGqOHKBEudjqMFb+1YdR2t+BDtuIgyKEEkq
 VbBstiLu9qEN15Kzz6skVExJT1hcbq7d3Mcxwp61s6kD6uD544dgPzDJvqe1uSGqqWTLOnlCJ4A
 yyPHHpmamW8DDQ+SJCw==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a842263 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=x_9zcg6Ql7LMdUlgRaEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180067

On 8/10/26 12:53 PM, Reza Kurniawan wrote:
> Thank you for the feedback. This is my first contribution and I'm not
> quite familiar with the process yet, apologies for the mistakes.
> 
> As instructed, I've added my name in the Signed-off-by field. Aside from
> that, since the changes are isolated from each other, the patch is split
> into multiple patches.

You're on good track. Please make sure all of the commits, apart from a
suitable title, also come with a commit message. This is important both
for the reviewer to more easily grok the change (or have confidence in
your understanding on the problem), as well as it brings historical
value for people that come after you - they can learn from your notes.

See: https://docs.kernel.org/process/submitting-patches.html#describe-your-changeslore

For the patch submission itself, there's a tool called b4 that takes
care of some of the headaches for you:

https://b4.docs.kernel.org/

Konrad
