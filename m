Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491393;
	b=Q0gu6qKI7T6+xQqbM8rpj8P/a9GjnzlKlvxGebeeob8ZiJ1ezjoP0FdJOUXlDpTAB61E
	 HH4FN3l4D3uTEOAyWfRjP7bRZIb55yxngdrGYJG3G51HHoXazixjq/hhinLnQngCJeXh4
	 hrZa0Y3hgbwdFhIHCW1yG00l7hAo/EQINUKcfoyA4blmMXz3EZyeZBs7wu0UI4n6eOQkz
	 f+LL/SQhINg3XxV9/caPu+8Rm5kMi6+70Mz2xpDzNYdvjwDMBOLVCLybkuTo3bhfNZGPL
	 /QfY9GMOaLSxBXUJy2hS0pC9sk8zWu/hNbBL/WNs2JaCz8xdk2t5k2onbTlPGtFGlIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491393;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=in+fhMuXoIFRUp0erX4Nc1Z1jlL2QFiRRzQJd1Ie8yY=;
	b=AfLe8oXYFhVKnbZiQFFkYYwhyBrplprC7cckiGewdiBLMli3zvwy6cRMyCrnXq3lAlWG
	 zcjaKIBb5KWrHtai53Mh/CWdbbAkIscx+yKUE+vSfN3NEAxCoUjqUmaHaOlbpl0a+ws5s
	 dOnrXszH1dh+aAKnO/5Etxu1jl7rjPjhleLSiXJI0RvwMs5BzweBoxjVQUFzfh31PYPoo
	 d/9nI3r+g1hlVmB/SmsZ8ft3VLAMFnJ9ZadRnSM2yaSBvMhEAgOXHzYCwcvzA18IYwQ/7
	 qwmLj8Rs7A3BQe1rGJV07Rbx2lXguCnRo+62PgULmuXa6KmnoBmDct8fCDO5yrcoHjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M7m5X7eB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpK7mf0+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5E660A2611
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB5E660A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M7m5X7eB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpK7mf0+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8NNE23485726
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	in+fhMuXoIFRUp0erX4Nc1Z1jlL2QFiRRzQJd1Ie8yY=; b=M7m5X7eB1t4mV70V
	CVRgyiEhRWBi2+jzFZm0kcZfn/KilXnnSV9KfM3336T9YaCxrxPyQ2tb8UlR1cqp
	31hsVz6srU4q6y5GJ7+EYmmSSnTTvNjAw+rjw2FSYK0W68hDqRWTm7a1Zs4pga/n
	z9K2gA/ai3XnoCCgxVZc+0VkjjOd7IqB9n4687tBeQdjnkGqzwftNcUad1whN8xb
	Xit7Sw2/izjW3e8TwPpj/9zcUY4KGppNggJqh2rvEanB1Jz0POCIQY0HN5Op8KKt
	7g7z4yo1yiDPDqXQMydBrWcnjSKjhGtWwKIdKIFnJJTlVmYWrA/Vxf32Ih77EWc7
	Ik41SA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n20x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:16:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so74979085a.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 03:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792491391; x=1793096191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=in+fhMuXoIFRUp0erX4Nc1Z1jlL2QFiRRzQJd1Ie8yY=;
        b=KpK7mf0+ln8S9o+AYHdf/5Qge1jvuO6z3SwLsGhapaHa64XplPWXiucO5/plflhG1O
         p6X1pcawiqve1c4k7TZP4Zc4T+gPcjhn0vUirBS2W0xyRUijcmLVWXo4hldOg2AuQABM
         0fJ1QGU09nh/sZVuQT9v6qDNLIHuu0GLWsvX/S7odYhkmwUnXoXHj0V31HAyg14T2VQ4
         WYsOwXP7rFeCKe4JImvCuTX9glDBtRICdUN/agUqtk4Hq87yZShX93NKkgOsL4sspaRO
         4H1cCC8LQU1rufQBUcAaYBik33fnFKur8/rwqtY8oQ6PdpjHb4EYi626aJJJ9zpDe+fJ
         RZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491391; x=1793096191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=in+fhMuXoIFRUp0erX4Nc1Z1jlL2QFiRRzQJd1Ie8yY=;
        b=o7W3OZsevWZuanuCxF+vwzOTuDkV+bKnW9u4g8xwTN0oXdjLwmRwmwszbmXclZu6st
         DJGfTUfo8OwXH7xkUVmm89N49ZTv7w88qrDoMmT1QZ166gYXCzF3L11Y+6ZpTw6XyQmv
         nDSokFG8A4eK3R4XAfFdr4lVEfBSdGW9ZpIJBjBUZuONhUtbYa4A4honHcLpTFrAvGnI
         LPMtM+dwtbBDSqBPkySr7EOT8wn4fDDgMAM7k2YYzFnqrEr1mk+t2jcEOVpUuGBHM+VT
         osWdRZSdpPfHkdRlsB4xmOvtX73LzWmMBnTnAsP8uRiGLWISxRo3gfsVpqLXMleVbgRs
         z2Uw==
X-Forwarded-Encrypted: i=1; AKwUvBwm5hl/7GLBeINA4OUTjlhkOwU+0cxhapc6ABZFFVzJ0w5+PFeJEXEtJWwWNqPJd/9MEHulxpBHv7vw@vger.kernel.org
X-Gm-Message-State: AFq9FYJzIYTzz/sqdy83SPPfV6xa8+7dFL40GkpqTSOdDlAgopt7WX1s
	fBekGB9h6vBBKVL68Sj33XKAWuAw3YhNGdnfY0PRdgvnTnTTojdAuI23apbrjRSViCk7QKe0q4d
	lA/71V1rEz8s0Ocr+jkin0HBpIvLrOqRbAmJvL2FMrzx8EHnPVotZ4K6BXECMXBaZ
X-Gm-Gg: AYBFou05Qk96cfTSf13iuTAOy/5YoS0jFVNjYJOG6jwnRAEW6/siEynirV5sLD+1Yqr
	eE9SmHgnphRXvOe7XobnBqMr1p9g39L9RDA5b04Vg6zuhleenIz6heLP/KE79CVkrIhlxk5+f5Q
	DTT8xJ6D4GE9qn5qOMfF8gKc2WidEekxPquiMfP5KM5/6gkfvRyYyQ374017glGuwtqHa9+b0Ku
	1GOA/mtX+1ZFUnmpteqZoXGpPwDReUAmhjJTnHRg3jql4uzdXzZ68KqzyeK6MXanE6mS/Ix2q/O
	ZcBx6EGkaGLrHR/Duhr4cdmsq9ux15131KjvheAvpe99FX8zSspsSTee1F5pEBe0PzFZ+f/QY+6
	Pd9W/0KcAYz5S2zSZBC4KTA==
X-Received: by 2002:a05:620a:618e:b0:939:8bc:8826 with SMTP id af79cd13be357-93f29b72ce3mr1977419885a.2.1792491391037;
        Tue, 20 Oct 2026 03:16:31 -0700 (PDT)
X-Received: by 2002:a05:620a:618e:b0:939:8bc:8826 with SMTP id af79cd13be357-93f29b72ce3mr1977416585a.2.1792491390567;
        Tue, 20 Oct 2026 03:16:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32bc33sm468649366b.5.2026.10.20.03.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:16:29 -0700 (PDT)
Message-ID: <40a4cdde-6eee-4018-9358-2779a9fd7328@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:16:27 +0200
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
Subject: Re: [PATCH v3 3/7] pmdomain: qcom: rpmpd: Split SDM632 pm domains
 from MSM8953
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold
 <stephan@gerhold.net>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-3-95c47d0f26cf@mainlining.org>
 <i4zm6zil2qyfdrclkxf6sifgup4phi6dlggspxrd7khlvbqv4e@yxotc3cslqss>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <i4zm6zil2qyfdrclkxf6sifgup4phi6dlggspxrd7khlvbqv4e@yxotc3cslqss>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad73f80 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=OuZLqq7tAAAA:8 a=7gWwhKplwqCMDIKiNsEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX9cIe6AbIrBCn
 XS1cfW2Kd/a6o01lNHbHc5eVT4IQ106sW48XOZWswj0BcKDOMwKPuElZnST7U8E37tgXDd1zTH2
 o7jrLkqbLu28HKQSIc0u0YVSyg/dlsc=
X-Proofpoint-GUID: 3V1cr5VuphC7kPlHprKrpZ7j3J72jcON
X-Proofpoint-ORIG-GUID: 3V1cr5VuphC7kPlHprKrpZ7j3J72jcON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX+Hrummh18biV
 tXE+Gx7F1ZFttYG1cbUtVqoq7/eB1++WUSDh95TC3xtLppwpchM7w11p6kXY5YtIS6EM1eq+Gp9
 oaKvJAl78nlmNzpq+lCjekSdShbogeH2J+7F3Wrmmn438ROUzCtA9dOg9HjZEzRRSiKi47CO3yP
 AYatn2dv1HTppjgCRg+ocbKz5v5yjFyOhWmwvSIyT6uCroTdwARfAQiAisy/OOlYIBnILEKBMMB
 14ID/WYwfXZ9PxisA90+pb04+zToGkEVNF8CaMXq0ZwIU0gCFGGAyS1ZEO02CknhMi29+4wOkCb
 7d8Ssy5mGWPSOCCwzAn3HWdeKRl1CUCNfM+bVzK9sizSyHv0pyg/O8nhtorH6XzhyOMZNfgXW4j
 vuVYO+gMPqBLoYEawDwUHwA0q7VeIWXISxXTE82RnfLoNxkGbha9mz+n3jq7OCUqE0FXjLDZOG/
 HEE5ALtC3ZJxmJ4513A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200040

On 10/5/26 9:04 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 02, 2026 at 12:38:31AM +0200, Barnabás Czémán wrote:
>> Remove modem related pm domains from MSM8953 rpmpd because MSM8953 MSS
>> is using mss-supply as regulator.
>> Split SDM632 rpmpd from MSM8953 because SDM632 MSS is using mss-supply
>> as pm domain.
>>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  drivers/pmdomain/qcom/rpmpd.c | 29 ++++++++++++++++-------------
>>  1 file changed, 16 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
>> index 5f55fc791131..c37a79d6bc43 100644
>> --- a/drivers/pmdomain/qcom/rpmpd.c
>> +++ b/drivers/pmdomain/qcom/rpmpd.c
>> @@ -503,19 +503,8 @@ static struct rpmpd md_s1a_corner_ao = {
>>  	.key = KEY_CORNER,
>>  };
>>  
>> -static struct rpmpd md_s1a_lvl_ao;
> 
> I'd rather see #define RPMPD_VDDMD_AO unless you have a good reason to
> drop it.

It's software anyway, and I don't think there's a need for
"keep the modem power domain oneline unless the cpu is
asleep"

Konrad
