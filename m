Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760422;
	b=2Et7J4ZHjorLLjZp/8tUjGPXQ6ZSk6EOBO1b9rjZcJ9zYyzwhP0vZhfd8KSe4Iuv7NrE
	 z5rW1Ue60gFLnOzYcbeiMV/zr46GIGMSr2J9Ejzy1R8pbrjX7qMR/ZW+JwB2eTUHXiAA8
	 FXQby0UGggnHo6WpetNm5YbG3PyuuCLxMBeeDv6dcVVGFNdg/mhnou91c20hjW2POCJle
	 gaGyAYW+KTtw/JMvlXTNCOlU3W04I96jJVduT/2Ln16LT8fd+X9gW04Kpv7C4wDozndj1
	 lrTNJhJHZoMeYqyRuvPhNvfipro90hU/qwupRD02sp1iUXQOMs/54vZ5cvdrqisE8EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760422;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5bGzjW5BQVL4/1MWcPv0UVT5BAw+v3bGVIV2PO+7sv8=;
	b=IE2xgdeVY6zJew1Nv46Bg2cjBUJW8ecwHd2BY/cgofKxvrxA/PNnLRxGBfXOuIU9q/ny
	 puMH+st+/+zNZ0Pf4psmAtqt5Y9JgOYIdTE39dtNlC448L0SrP7xGLc1LGucaeKiPRPjc
	 5lCc9cMLBsYCjjw6e8rBIipK1KwEB6MuQh/dzhbd4+/wH2E5OkZNDnF8OycsKBegvXjdb
	 E50uqiYXk7bvwiN+YwZVqklaTTXitEz45/N0ezAkAOgYFMGXXi9WDslUMNYHf7UsSzOJa
	 fsu7DwmHYesSoyWsazk4WbkudcZctg/mSWjGM95vDcKNyqLCf6/TYQq3pSa622NSHwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XmieGpUX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyB60LJ5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96557606A322
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 13:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96557606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XmieGpUX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EyB60LJ5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZDM3045405
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 13:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5bGzjW5BQVL4/1MWcPv0UVT5BAw+v3bGVIV2PO+7sv8=; b=XmieGpUXPHVVAUJu
	9UoiWNBrGGKz23ng9ITn4UIRUpaNmNhV4PCqF3BwLOT9/SUIPwzBEcKo2LzdtdXy
	E74XOKzrIuOsQ2yVb74Z/CA3KitlpieCkhQ3u5hFxXpTcHX5S+iEbZ5K6myJ+a1Z
	dA5iV99IEbBbRHw8bYg+3+lwFS3PXLRZP/iyo1DNW4AzfXjQla5eTDAqIHKXpN9L
	szTrEtQnwSCX1c6+2FML5nK5/UkPFV34uJ4F/SiQibUnXR4acM0yXUqUbtGehsd+
	S+tF/b/61wu9Efkfy6yFZTmzSWDv+YE51LtTD1ZMpmP9SoDrwf/MwqIrGaJ64afD
	HPRfrg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjbs82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 13:00:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2bdebfc5so22697485a.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792760420; x=1793365220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bGzjW5BQVL4/1MWcPv0UVT5BAw+v3bGVIV2PO+7sv8=;
        b=EyB60LJ5uC9kaik7AmuuWZ8F11n0d2/NsnZY1scDZW00ZEOU//wEvtQK0bfIK3oMyF
         ZonF6z5OQPd/T+iSHsMWb10xdf8iG3Qk5RDanayDta1oC9RA75DyvlYXx4L42dJGdnYc
         a36PY86ejcT5q/fOqaL3777aTv71pZpuy4SsZGP10rfpHZjSHipHAvyH5RrQzl8Qz8Rn
         jbzb0A5QWHlMNw2UTrZxVnBQ9MyKjwbDOkBhSjJpz1ddxkDWiSOnkGbmX7bRBIC0eXom
         yym7HjpNAy3EkhPv8Sz7tAxCsLPLmOhw49arW1+l8ylw52pvyHoqyPv5+pYzbKpwtP8Z
         +iSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760420; x=1793365220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bGzjW5BQVL4/1MWcPv0UVT5BAw+v3bGVIV2PO+7sv8=;
        b=RVLJClyVqiGS85kU4mkH3a8Yia1rTKVR0UD3WSdmyuXV/2xtDTQz2uD6Y6lgzF+EfZ
         BTLncpxXUdt96JIUutw8jXViSsZRuMvgqRshNvPvkiOv3xefVIvHhyuLXenXOVuA9yY5
         FQQR1IOnpMGyEQ1Kb0dgWcj0NZeS5R6CY/iEoXLdSdZ+eB04/s03jX//BBPXB+9jimnW
         NJIIyoKItEbouTHZtvKaKcfMcLn10wqKfKUaPRCXQWJndjkNS+gRUqEP8Il5yoLqFB1P
         SyHgF3VIqPe/BA+klK5eLx0EpwpZucl2U0+pEH2BnGv2tvWfF6xnNaDaLPzHnANsUizv
         r7zQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhdE058Bl2GQolpnzQ3VSBWlMWAoj4jILQtaP/WDQBeVApPUhkyMMzbcKIbh27EEI+YAGdKMW57A07@vger.kernel.org
X-Gm-Message-State: AFq9FYKQ2pF4M3gaiXGLQ9HpujlHxDV7LDe5Kk3X6Afg09+G5LRZC5Q9
	Poqikckj0ffDxjVCb0m9S9dVwZ0k8YYp9r5Otfr4Vwh+Mq4MvxahZPeU++XLTgjiWAUYhHxWEeb
	znq/t1xsBBZs7hH8yDxxZIICcsXPfypZtG5KgYSlt8ddrX0uewRW8hOhKyqnyuMLa
X-Gm-Gg: AYBFou1vxwyy6SdT6sbVHR9+tPPK65SK7bMuRQqwlHQ9LHrWQCewep3xfcW/O658M+3
	KNZUqQ2QDtlKs/gVQZHIwhz52f1TM4OI6jCQLb8O+BTdkbTPS+bsTWYQNsWBh7z/xUmGvtFDJ6e
	+f2hjRDq2jFEXYfhdUNVj4hWd8AXppiKXvonnCP8DXF+mqmFOLXoXiySvxNh3ukPuBVAQTF5RMb
	MObLWIgMcHIZlcINaA586HWh0Kocx30WEHlZTtUwrooVl+ZzIw0nVATzuW5Y59ImChJtjEe6GGO
	xqevqkSIthEX8hlKTM6rJtGi4kJsdOQZDYa3Si3K7eOlLXSIZ8Nj8mhss5+MrU6/D70SKjfDa27
	k+6q95U8KzkT9vvdef/FvIw==
X-Received: by 2002:a05:620a:a182:10b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f6f9c2625mr365493285a.6.1792760419418;
        Fri, 23 Oct 2026 06:00:19 -0700 (PDT)
X-Received: by 2002:a05:620a:a182:10b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f6f9c2625mr365480285a.6.1792760418192;
        Fri, 23 Oct 2026 06:00:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5ca4fadsm100981166b.50.2026.10.23.06.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 06:00:17 -0700 (PDT)
Message-ID: <497c1d50-195b-43cc-85df-edb7f4babd16@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 15:00:14 +0200
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
To: Kaipeng Zeng <kaipeng94@gmail.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, jactry92@gmail.com,
        andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, robh@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com
References: <13181dfa-b92c-43b5-ae12-912abaf79c41@gmail.com>
 <20261013015728.43307-1-liujianfeng1994@gmail.com>
 <74d7c3dc-0880-40a4-b056-f9a089a0ddc4@oss.qualcomm.com>
 <CAHk8ZdvrVt8TkZrSd7qyzi5AirL+FtwUpHT0QLcUd5qBJmhy+w@mail.gmail.com>
 <f5d77b3d-a6b3-42ea-8b20-939a301ae331@oss.qualcomm.com>
 <CAHk8ZdvqoEE66xPJmV_p-2nCrqNj9yQ6RbjD_wTrZZM84bYS4A@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAHk8ZdvqoEE66xPJmV_p-2nCrqNj9yQ6RbjD_wTrZZM84bYS4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ilAnkc_Ta_3x5A00Q9mQFGXmFoIUyyAN
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb5a64 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=a4NEJbfMAAAA:8 a=RowYqNY7AAAA:8 a=CREK5DSrAAAA:8 a=EUspDBNiAAAA:8
 a=sngenQoBvZswEJlz6_oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MCBTYWx0ZWRfX8HQuu5HBcEdc
 EVFXGt4/FeTalOzfNpnAaOw9/zBQ0xU16xhGa80LzdmUrc6hotYyONDE7XQJtgV1SGVlzvIJPgG
 6yj9EEgOZHM8I444E8A0Tx2d1Cv/Fx8=
X-Proofpoint-ORIG-GUID: ilAnkc_Ta_3x5A00Q9mQFGXmFoIUyyAN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MCBTYWx0ZWRfX4tUCuAOeo4zr
 MT6KLlLXFLa5gNJOszw5YQPEQ4g6jNayGFH5hieLedmEws+sniEOXFUDutXGa0kNvz/7bszrGA/
 HrfHdKVPS8rRizrlN1UUHps0dP25fjT8E0sktE40bbQ1CZ9FcUO+I9fwpT+v20Z6SfN009A3Vy8
 yhbclwIzaIZ6lwqfUVNjOfCoDm6zP3dglZXcN51ljFArGu5Ga5ZHMUHRwVV+38rFJSAOS3QVYjF
 U7ITIWfa/1S/sFMOICA/wIljGUOlNlw0ye8R5SNS248d6UGRcZQAt7GBr/wJK2tvAHpa09o0Lc3
 hFAoUzx/jUtTcEXCas3MbbYfCHZlHSTfQgrz/1Wy8ojJdPwJHUVgURXlxYsLyQIl4VQ4X5P2/9+
 kJpf0Qu7xBYnEpO76zdwJRMKiWBum6GBAfhpiOniYwv4Kqdi2cNIEJizFiaVlyOQxhyG2JYiwol
 y5YfbyA8V1TnK34wf8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230050

On 10/22/26 11:03 AM, Kaipeng Zeng wrote:
> On Thu, Oct 22, 2026 at 4:00 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> My reading of Jianfeng's email is that the "Go Pro AI" part does
>> not appear on the Acer sites
> 
> Thanks for the explanation!
> 
> It does? https://web.archive.org/web/20260314171131/https://www.acer.com.cn/product_list.html?parentid=323
> ("非凡Go Pro AI" on this page, '非凡' is the Chinese translation of Swift)

Okay then let's go with this

Konrad

> 
> I don't think the name (Swift SFA14-11) on the support page is the
> official product name; for example, you can find Acer Swift 14 AI[1]
> is named as Swift SF14-11 in there:
> https://www.acer.com/us-en/support/product-support/SF14-11
> If we are going to call 'Acer Swift Go Pro AI' as 'Swift SFA14-11',
> will we call 'Acer Swift 14 AI' as 'Swift SF14-11' in the future? In
> order to make the naming rule consistent.
> Sure, we can name 'Acer Swift 14 AI' as 'Swift SF14-11' in the future;
> then we lose recognizability?
> 
> It is awkward that Acer only sells Swift Go Pro AI (SFA14-11) in the
> Chinese market; so we can only find it from the Chinese website, and
> we don't know what product name will be given to this machine when it
> is sold in the global market.
> 
> [1] https://store.acer.com/en-us/swift-14-ai-laptop-sf14-11-x128
