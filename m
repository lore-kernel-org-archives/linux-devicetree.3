Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405302;
	b=EHWAYUXNPvpXpeIo789BT3jD9zzgeoJ4qjm3KdYoHxs9X37Y3D/JB27/8HQ6Q04xToUZ
	 G+voyPyUjJhG0+XCoHnwHrUi9d0CbIYiIbl0R8PjHo/QADG2EuFLnZXsY/d2Uj7jkW7wa
	 S3G16u4N5jILnhIECtAxoKkKhqWAiao4x/NLroz+pIc/3UN43av/KfkZEvtaVBYjGMKiB
	 cXghNUmGTjjLPNeUnYjjbOtVA7nwJDXkZnxpvpA6jYTWH+LdcesPuuqSxHGLfCsjqYYF6
	 JTBrkkwjyZetfzgFw4C5W5N5vl/bvAkcCnqPxGlM6L66hysWoPA8DRxH3ftIIMLMipw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405302;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VpAH/0mUJUkWVy1SXpnGYdECeWaz3fWTw17UYKA398Y=;
	b=V2oNtIFMr+8r9coskOYCBIcQ/g5oxdnVMOnckSN2cRWgtPucLYXQUCY+0K92Qup5B67q
	 HN3QR5LICuWhg1PSk7qNG0KOMhOQKxXBiHI/0Y8FABmKfMvSIzIctOh/NFCgKKZMUB5SF
	 mjS3tQpoQGJk6ZqmQLnwSs5avHHUFKZ+uaR3DJ1n0BVdeAkzrSgCMn+Y/2JnU7QEZIcAs
	 eydpCNXuufI7NDsiEMwDVwZFmtCreygxzFKNNmccPJTsqEq0ZmMP6pCdzzxUO9TCLXP/2
	 LbvDs4WNnaJkldIQKEABCbwvcOcSOZKX/S/z4Jqlw7yO2HkQJmWLxHPcSs01/kJuXkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kVyG+dO8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=INsB0tuu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BDD606A326
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5BDD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kVyG+dO8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=INsB0tuu
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZZaf2338796
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VpAH/0mUJUkWVy1SXpnGYdECeWaz3fWTw17UYKA398Y=; b=kVyG+dO8zANLoad/
	wQzD1VvOMsR5njVZRsBUAwr1vGCA+k1kx2rll10semchFO+6p06x2v6hw2XJbuCi
	diz9X8+HNoZpyuReAW57RdbkJcxDD0h27gVlSzcLKSa8fMDztQcZoha2DgXHJTGa
	wDz1IPHcQwWep6bpuI7VEDihm9deUngM6uxwM5HZ7QRwfsOmKUW+/dmYtZo7cmR+
	hoOYlZYrz1KalQs9VTuhI+Fi27Q+Yg71QDkPjxPIZ5No/MB8TvGpM8qQl+xzWyZ5
	fIqgAqGZihkbHZ5beE6FOr3ST5xApgQJcml7GzbF5viuYPQc/rfKEjc9p8s7Afto
	gelvmQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmaw1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:55:00 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99b715e4f44so1217270241.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 05:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794405300; x=1795010100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VpAH/0mUJUkWVy1SXpnGYdECeWaz3fWTw17UYKA398Y=;
        b=INsB0tuu7o7leLOp06wb8UvSl2tznoIEaTg/FRT/XY6/EeFBtBikngmzc6G0Ly0Np6
         DfTOApPCSMSZu/sA6bqeULTaxGWCnhmWRtXKrrfC/p0dxamDYYKU1vqDFMY8yIEESH0W
         zG5mteZdKYPa7Fn15773zSioJvcWdhJYuopcm9i/Ow8r+XQNv+TKL19UVvDk6gV4wmSp
         GV1h1BPOncxrhNVFM53plvEipqtYgCx+HT+PjAMaiGsfeBh5kt5lqpuOlEIFVMg4HWbt
         Pr14ISSVtuIJ/QUzKfP5fylJ2VYJ3/YFljMfVkbA3VbE91t0nTQfXrjQDu8m0NHEwbLr
         AdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405300; x=1795010100;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpAH/0mUJUkWVy1SXpnGYdECeWaz3fWTw17UYKA398Y=;
        b=Uws/hd9T5XQPYkTQ0/BWQumoITxZ+fC1aMuj5Ll8SzMGWJmrTG+pz4DZ9IiAB2T3wY
         4z78vLX4sJ7cxI8sgDH/0TYF+X2BAFunBIqJfdaRqaNxibg/zLe5eq6STetlWiARZgir
         sv/eDebACCRxh7nGjd+i7yu/d/RIuGXj8793oNXqS+DKBp6XjOZEE4CYVnyIxEFZ1wSv
         aJSNefaRgxPi+kLS70gLrNdjVYxPSgTApHXqjBh2sRlb1mvvzDMav4lmN43T4Q+DKnLz
         ifsqLm/yzc8+S6yQno2//IE9SQiUIj98c3kFADHO/s1Iobgh2Px5feOnb8mE/89CJ1jF
         q9ZA==
X-Forwarded-Encrypted: i=1; AL+hErFm10eih6leTTyU4ttg8jWqkKgXdcjy4kMQ7Ehl9lqUOhD0ux+bpg81sygZjrGYj7Uq6imOICr2wbFZ@vger.kernel.org
X-Gm-Message-State: APuU4Z85NEXAstZVp/hxYUFDvXJHHLbV7V3zLiuqKK3vShA5yC0Ueaj9
	9FqmOw/lEnhFCrb4zNgiMqUJoVZUuGi7cH+d7zltq9pMz0Wd8IXtl+gnV1Peoo1dhdZCP//zDEl
	Cc33ecRVYdOJ/V2NPsDQkBnTGyoAp+C5lKckZkNkfnkegfKooIMYmAr3teTab+PmF
X-Gm-Gg: AYBFou0KcVh8+/OVTpqv13pF9f138osgIu6AkcNtjos1PAnjWCJssnqUGwWheRz+Ano
	kE1bZ6szZOK9dutKgv0KETRsjsgN1+b34260F1bisuNFQw+JSS1DLoD0THr7KBpXZvdjKdx9ET6
	gag3XsI/kASa7QTJH5bf6eaXuipghUc3hcg7QyVEoHXNhUnj1l+/CUcvapC4mZV0DxEOKm8PDvC
	y9uLl94yX1qr14t7jXkbU/BWSJ9pbz2YWSm4D7qgRofKJ4L9ccndr9Z3eVrMP66K+0CTJBXFUmO
	PGommKNqO63cb+8wkafvJ8C44/yI69p73FmNRBaNCYEsCDTMYtuf9PO9VYb+p88O8EMOK8J5+J/
	HIwgwW8Qsh03Undw6bCAW29bUY55Y8RdpU+Q4A2/bWhISUozAmq355OgU32Ej2G5QqepJzPn2Bs
	g=
X-Received: by 2002:a05:6102:3fa7:b0:7d2:7dcd:7c99 with SMTP id ada2fe7eead31-7d4fb22fca9mr601660137.7.1794405299747;
        Wed, 11 Nov 2026 05:54:59 -0800 (PST)
X-Received: by 2002:a05:6102:3fa7:b0:7d2:7dcd:7c99 with SMTP id ada2fe7eead31-7d4fb22fca9mr601610137.7.1794405299222;
        Wed, 11 Nov 2026 05:54:59 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2c5asm217004135e9.5.2026.11.11.05.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 05:54:58 -0800 (PST)
Message-ID: <8a557bae-42ae-42bd-a149-cf854b7af9d5@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:54:54 +0100
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
Subject: Re: [PATCH] dt-bindings: display: panel: Make DSI panels port
 optional
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich
 <akoskovich@pm.me>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Michael Walle
 <mwalle@kernel.org>,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Svyatoslav Ryhel
 <clamor95@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Jens Reidel <adrian@travitia.xyz>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Shawn Guo <shawn.guo@linaro.org>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Alexander Baransky <sanyapilot496@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Romain TISSERAND <romain.tisserand@gmail.com>
References: <20261111110338.81717-2-krzysztof.kozlowski@oss.qualcomm.com>
 <avRM_GhtR8vMdTO4@houat>
 <c8dea6ad-ce41-44d2-96ab-233b0a4b1340@oss.qualcomm.com>
 <43373a9e-9ff3-4641-b961-b63f4de21cb9@oss.qualcomm.com>
 <oubzclitudtqiv64wvg5lvxvbhuffxmc5bgbsdz4ou24pfhbb4@decarhvjzl2a>
 <0f2c0eae-ed05-41a2-8688-e4b6fe1b7ff3@oss.qualcomm.com>
 <avRy_D6MTK5u01_9@houat>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <avRy_D6MTK5u01_9@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uf45d9Wpfn9do8L01zl2YvZFDCYCwRuj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NSBTYWx0ZWRfXwB/C2rucZeQq
 wbjetlurPuhoRRPuccZx8MSe/5DXKUKKMa9b4jsfCcMaNjdUaG7HRvO0q1gAOOEFv9APnJlenXd
 cWTnAZY4bKAAdcwRtMrTMbCPnHx+J6M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NSBTYWx0ZWRfX3WNumedpybg0
 Yj/TrIIz9QjCFi7H7A6tbK1RLS+1Duh4etaDkCe4kazSShR3XVwoiJxHRGfWGGuGwGiv/6hM3DY
 zVwAwrJ/wN167o67i7e61LnbTAWSGpp6DwXrM2+AZMxu7R6ip1+XpxLM6s0Qo1Fvkj+puKurm3T
 XFNsvH4zFv+m5Qu4s+Wi8bKZSBQOOupwet+i55kjMrNZrJ72hGg5cm+ZVQEHX4DEn9bYos7aj0u
 e7OglFSHSuy170klQxr909GATNpnT/ezJWb2QI4YhEu942MgrSvTitZUWdtq6b9goB0GY29nbdW
 kv1sV/ed7wcSY0Z4zLjHrOE9q5/VLSvIuWlFmYHUdPOf9mMP14gip9DLOgGi7LuI/4prhCS/4mA
 YmxCA6Q7mVGcudfOngFrSkD1DfC4XattOdAUkzte2y8PJodoYjEVNBsEYIGPnFTzctNB0o5il6N
 zCkml3sADhCHCJhhVaQ==
X-Proofpoint-GUID: uf45d9Wpfn9do8L01zl2YvZFDCYCwRuj
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af473b4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=24t1FKQVs-zwlIjxmd8A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110055

On 11/11/2026 14:52, Maxime Ripard wrote:
> On Wed, Nov 11, 2026 at 01:44:23PM +0100, Krzysztof Kozlowski wrote:
>> On 11/11/2026 13:37, Dmitry Baryshkov wrote:
>>> On Wed, Nov 11, 2026 at 01:31:39PM +0100, Krzysztof Kozlowski wrote:
>>>> On 11/11/2026 13:30, Krzysztof Kozlowski wrote:
>>>>> On 11/11/2026 12:13, Maxime Ripard wrote:
>>>>>> On Wed, Nov 11, 2026 at 12:03:39PM +0100, Krzysztof Kozlowski wrote:
>>>>>>> DSI panels can be placed under DSI bus directly and many Linux DRM
>>>>>>> drivers will work fine with it: mipi_dsi_host_register() adds device for
>>>>>>> such panel and DRM driver does not use OF graph to configure lanes.
>>>>>>
>>>>>> That's not true. We do use the endpoints to configure the lanes through
>>>>>> the data-lanes property. See drm_of_get_data_lanes*
>>>>>
>>>>> Some drivers use endpoints, some not. As discussed on other thread,
>>>>> there are more than which do not.
>>>>
>>>> "there are more than one which do not."
>>>
>>> Which means that those should be fixed. We have legacy cases where the
>>> drivers assumed that, but we should not target legacy.
>>
>> These legacy drivers work fine for 10 or 15 years, like Exynos.
>>
>> You can improve them, for sure, but if no one does that then requiring a
>> graph is a mistake there, from the panel point of view.
> 
> At the very least the commit log needs some work then, because the
> situation you describe in it is simply wrong, and quite different to the
> situation you then described.


Commit msg said:
"many Linux DRM drivers will work fine with it"

So many->some? Is this the only problem? What else is not described in
commit msg?


Best regards,
Krzysztof
