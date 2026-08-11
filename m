Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41C5356741
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439468; cv=none; b=cx/+55tOVXaOPgm6074CGjnCTvAuO78F8afeAgkqHqvsfi1L+LZwEj7zh/MXoDF6Moia/QOa0CoJLXGHjL3XG+rqswxMQ1W20gDCoaFOLqnnu6k0tiEBi1ORBTNJJZ7tl4j80N8alZkEPJDIcGEIPWjdp6frJWzopofc0aSjtS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439468; c=relaxed/simple;
	bh=g/sbI5oXcAE+LgcHG3CEAclXiNKltiwKtzuhR22iZJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3nvnp0axeEkF9qtUufyBLmtPQBizMvtK+ZgNjWBLKCAN/LUwumhrCwDoGXuRdeX/mqW9eRTl6tkg+SL3bxGVY+Yp0raRGyQoWx0IB000fToEPfA9Yx6GVcWa6eGOIelxygLgDTJ9+plkoh+DDrYPNd4ah9mZrJh6QJZLnQgv5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjcosBLi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9Aumoqo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjcosBLi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9Aumoqo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B79w6L2705344
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6VViPe+Oj+T3kRKRU1AgaHow4Wbuy+422OfMAgT80X8=; b=YjcosBLiv/+poUe0
	6OrKxJu8hmzQ0iSgmf9s2h0iIKZjlHua7o5DrcgVD7dKEMc6xd/YrbXUBNZnKl2F
	uoaXVjyz21Y26qe1CKYDvLVxXJFkIf0rbXWtS4Gs2cE59x9bu+Vj8PB5LXYZTD4d
	a8stiUoMM765CxmkjXO3zE34wXoz1qD0hfzOsy8kTLBLkpT/FBEr5DUo0FmZlc2f
	mEbzVCOsBx13cg5mwHIez81gkwQruIUChl4SFQKdNYBgaGvuvbrlUDd0K20kRnao
	jPomNdpK3THtYsYFmsDfRAS+ZSPI2IqCyDqo4N0xy6U4GFSiLMu1DzmENKuKsjyH
	VPaI8g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk63bt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 09:11:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d02df2bf09so41877855ad.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786439465; x=1787044265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6VViPe+Oj+T3kRKRU1AgaHow4Wbuy+422OfMAgT80X8=;
        b=C9AumoqoA+TtEll4wpMDRd2Emsxj3GvksOqZ6AAYsVcVBY1m2DnsHsPl9NtOKnxp/C
         pdne6sw0GP6dJVHT/7gbHGVED8GxkRFqlIQoD2KxQymNcPYadwUaGmI4MnJ29GWQVQCg
         K9bRZ0YML3zBPzMn3u8zId2mAHneMfvD72NyemileGY+70sEDFZ1EZM2Qs3D1GGUv0jf
         AjfvPt9J0eIczjx/lMaGHa/ajA08GsTnO+Xojw5cqlGsFQ9eaYY8bDAKn6CqKS4Q+3Hf
         7fWT0axOoyH1fVJEWQhfqZkqFvqNJwjaAsx7y8KGBETiKgRbxhkSoU8Y0V/gcYdw42um
         WUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439465; x=1787044265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VViPe+Oj+T3kRKRU1AgaHow4Wbuy+422OfMAgT80X8=;
        b=J+oagGLLfM9572DLaZEA2OzJWv3HmkKp2In5WITRetYAbid5X9y6ho99kw6wq/YyW7
         jGJlLKd9MrDByD4HqjzCvSkJVxDR8ZKw6Y21WBe8CZr1Xd2bxQnA0V9K19KwN0QD4yx5
         uKSdWfsxQzRt4zoGH3s6wlHNh0kXBJgWnDu07E4ihAuzbEVbgxw2/8fd/QjyQlLUqFOp
         4N4gJFNXSTMAj4LIR5X5u9hywzfxhfkVIduhMiZUR6pXvFb74WFBilGo9cwzV7JKiYul
         cSRIVb5pKqC6lud1nZdvH2qcZI0syaz8OqGzPWTbyp49Ff+clyG17puBJVRY71jojOaU
         alUw==
X-Forwarded-Encrypted: i=1; AHgh+RofzDXYE3t8xDEBlhJSiJeGcO7TVkivJ3AwO6YqwEaYQSyj2+zmVHydMQnvwGD7ce/puiODdhYFn5tM@vger.kernel.org
X-Gm-Message-State: AOJu0YxhtEaKoNcEtmn1fpPKbKm7t+KP7aFCbpwkGJN0X1B1AA4RYQP7
	Nb+JifV1daYSNwhVU3mYfnDqTOxjauKz4MBYxRPzVK/jUGqaFnsJLByYmvLr26ldMxFDVHokz+6
	eHkEoIy8mmlbo/aSyaInkEmidZaF2u4+EJBfDqHBs8HE0xi66+PB17owU8/WwtBN0
X-Gm-Gg: AR+sD11G7s9IIzGDf7JxOJOzg9TsAzErBGMeGMKzaFEqKdObMdkL7iOj0okpuQKlO1B
	icWkpFuqv615YW0SbvJWYFrtmXbv7xtJYFb1DOUyHOjeNERLGF1hy66Hh3mT3/AwKxOGpCmhFjd
	dU/K1oLIdtSv4yxwdiA4i0hBb3T9K/nd0gDi/uUEeG7KQoY2S64mY2WUAz+KnWI+m+rwzQncMBq
	xNwvw9ELXRLYPzHT2LT8hH1Gub9FaxdkjcaxblD5hr9dInAsY/cKmcj3P+SDiJBvBTvQBiFN0xA
	lUjTY+oYlBEA+m21mTehzdr0CyNuBdU/Iji5KDAavDnzrtZoa1DG+/lYDWaKluQjiqEy63hOmBO
	XLo+VKG18WlaT1p4naOvrfP6R
X-Received: by 2002:a17:902:eb8b:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2d3177cce77mr22356225ad.2.1786439464691;
        Tue, 11 Aug 2026 02:11:04 -0700 (PDT)
X-Received: by 2002:a17:902:eb8b:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2d3177cce77mr22355575ad.2.1786439464191;
        Tue, 11 Aug 2026 02:11:04 -0700 (PDT)
Received: from [10.64.68.239] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d31621a0dasm4306675ad.69.2026.08.11.02.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 02:11:03 -0700 (PDT)
Message-ID: <ef0b034b-a969-409e-a2c2-4c7fa95b57c3@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 17:10:59 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] dt-bindings: interconnect: qcom-bwmon: Add
 Maili cpu-bwmon compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811-bwmon-v2-1-80f7f150ab9e@oss.qualcomm.com>
 <366132c2-273f-4b8e-948d-4956e5241881@oss.qualcomm.com>
 <d8d89181-bc76-4023-87fd-02e85f5c8d49@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <d8d89181-bc76-4023-87fd-02e85f5c8d49@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Nb3WEWD4 c=1 sm=1 tr=0 ts=6a7ae729 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DiU9YXepysN1ymkdEgsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: fOpYFXFfV-YtZOigLon-9aMypZcZAqDy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3NSBTYWx0ZWRfX6miM+wQJtlzX
 1C9hjkMXU0iANNJOs2P6U0YVpaHQW/Hdda1hd7ZFaFTwAHnBPvjHc7VQ5VbwpkcQph5mKrdj8pt
 J+r7q6KnQMUILsMyFkjxzdstGpgucug=
X-Proofpoint-GUID: fOpYFXFfV-YtZOigLon-9aMypZcZAqDy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3NSBTYWx0ZWRfX8FrhhDeGIHOL
 jfWUzYyh+NFFyKk/7rOZHe0dewMResCHs/ZHBtB8xuk5gzF2QYONq8fRRIA4FsFOu5YoqXm7cvD
 UUrZpw7tpEg3HqipTTCT4M3ZaHV6OPiRQfbvN7Ql09sCY9VsXLCXO8/qQ7W6z/0ZIUuohD1u81U
 Vd9aeHmaKxtmNy69R+rj0Lne1FABptjxNod+Dyncz6wZEdfHS4AspoBdOsLigo0rvdsQc8xZs97
 ictoOd9JPaeTEuCBddlWhkfFzEske9I5AgT4yLKERH2yVbMsuQvm7AzaOg9amntQAfG4jVTHahz
 Mtmf2vmLNenAAdI6cUZ3LZ9c8lSywW2kOkR2ztJ1/CEUaCBKBB0KoyJGde/OHDCSRIZOk8DAR65
 wA3BK5rg5IuPn1hEc9aXb4ug9BIlY+l+jVJO1yxJcnqmVJxX+pul+TGw2BfwlRLly96fWokkbVt
 CGj7xtTgR6YEvWA/H0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110075



On 8/11/2026 4:57 PM, Krzysztof Kozlowski wrote:
> On 11/08/2026 10:53, Yijie Yang wrote:
>>> ---
>>> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
>>> change-id: 20260512-bwmon-ecb43fda63c9
>>>
>>> Best regards,
>>> --
>>> Yijie Yang <yijie.yang@oss.qualcomm.com>
>>
>> Sorry for missing the previous Reviewed-by and Acked-by tags. I'll send
>> a v3 update to include them.
>>
> 
> So how is this resend actually helping to get the code merged. :/
> 
> Best regards,
> Krzysztof

Fair point. The patch itself hasn't changed. I only realized after 
sending the RESEND that I had dropped the previously received 
Reviewed-by and Acked-by tags. I won't spinning a new version just for that.

Previously received trailers:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

-- 
Best Regards,
Yijie

