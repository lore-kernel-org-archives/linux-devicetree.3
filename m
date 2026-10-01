Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D174052B3
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 09:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848562; cv=none; b=ZZKppsc2A8qT/C0kDpzJwY05SweNReAjqLuyiimuMgsWGPUVZAAa5tK5tHU2rcwAuVM1hSYPj2zm7jLKNpcozP50FJ5jq0dY7NxKG8C5NIre51NX78QiL6Zt8Z6HskLLHgIZpHd7K4E3iRtsvFrI+ohRtY3VEBiA37QSD8RjnAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848562; c=relaxed/simple;
	bh=wdCmTU8p62hPrCu7nvMz3ehGADNp+2kO8cXkIPggcsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1JDzXxedPALUI/z8iDNijuwc0npHRt561dVHveRaCW0d9kfl4+Mh6OL0ubdvHVF32NQh6GXqXdfGkLogdw3MYM6IqAmFpFLjNUO8pGwVl+c5Q3qVev6erFXyIKwlE/la72vWPIcRHlwV+oz0tYC6Ndq5ANns0PIH9FRyV/I5iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNDOguyE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNz1s9gT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNDOguyE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNz1s9gT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xfIF1933325
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 09:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OmdWzDgQaJhw28/RsHEB8YAe
	ng3ivItati6H6co2/Pk=; b=RNDOguyEAiXYC0PxI/DoQfl0KQvRqFpSBIKN80Jd
	kwdlj6p3VhX1JHLBtw82NWqKvTzlVSk6EXtTAShw1Yy+CMB2Ufq1ccYLIJJyCGju
	ryonpVEPCeSKlKvrFEbcEJTf2/JrLSwfKNH43ZvyZIHjhhVuejMKtgJGi2FHnqU2
	DRQMBXVYVKt0pB6fR4BKpu/F7F77v/lyWK9zMRPw7598L/0KFKJI5gr+1t3ZdMBl
	1J5h+UKIQfRO36Whe1vx3imJmH7TgjAvEeiusx2+zf32xTrs4kFFI8bUtI9mO/T0
	8SuN2ishHHm82MrDgz/MAiVbtMgmT9hXDq2mfOCprWJjxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcfrtfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:55:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso281657985a.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 02:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790848558; x=1791453358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OmdWzDgQaJhw28/RsHEB8YAeng3ivItati6H6co2/Pk=;
        b=DNz1s9gT7HnOtFlXXazGa/0jjnApzscB8zaPbKLEyWkOJHZsCliDhV/1GB6co49R1X
         1cFu6gGnl5mfBcQWjxpE5rsG0tPQW0xhr0YzKuiu4L9FLrDivbBbP0wXtn8Ng+fa57vQ
         is1dRloCf2wuUErW5zxY74edjqg05UlTIzsECvn+dwf1mO9PwjAZzQ9yhKtbWnWXUrdO
         njXOSERES9AYa2F4Z49P80uRqCUdm7Ovl7TwfBuaHGUwIc/PotJddwwWKkCWK1Qj2Q6i
         e2HErcqCiWhtnt4w6J/KansrRRu4puPi2Cjb3B3tUDihf1PYSWosCUHZy588X/S6eiNp
         G1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848558; x=1791453358;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmdWzDgQaJhw28/RsHEB8YAeng3ivItati6H6co2/Pk=;
        b=wBynu9dDdvGKIxbq5Hr44yBgL7A5oTyCPj3BUzCTVNNoeQPK0I7N9/pgUCmTxB11QA
         JDSKlqTAEwOBrD4zZrydw+mD+tgd8g8jZP1lzDeB/N4PQucRReb0N5ZZCXyig1ivC7Wx
         FU9mi7Y2IsVfZQRFgn6u6D+bEtmm6i4j+BLmwnGWpVaQaAyLeafRHJC2TiXQkyy+S015
         aBbuN1KwSmryW+l7+lmhUSoXwQygLQ6w0frZcvd0ooV3LmojW6QbBf8LrsJA0W+IwdJ7
         YRb+gm8HTZZk/oU9bcQNBiKORSWo2ia3O9XggY+ORAiruSssgh+Jigf4JHdk76jO6N9E
         fWRw==
X-Forwarded-Encrypted: i=1; AKwUvBxk+IEk20W8c8/fpjQvjlJCIig3hwHu7ISdgILtyZkOU8pXzrxyT85HyUwhaTIgnPG907foKdTxDqs3@vger.kernel.org
X-Gm-Message-State: AFuF++kzZ0FjbgfbMgNrRFnXMUF2fij8+1urQrsZreKLRrTbMooccLhD
	AvzOJIp7ghuOGeVpP5arme7OipnYtvr1UZ/6oFQCx0YenxFLfs80p/wqtlAu35ZGqm1NMWwJx6i
	iqHhM+fEqeGYsdQWPgUuGWg0Td+2wqymNl8fyfSGF1+1+f3tpgc8ozMqBbbH6LjF/
X-Gm-Gg: AYBFou3k6YyANxubbGpl0oWWB04Xfnk5c1uNlUU37sgHYlOyWMIDSV/dXDAd4zgnJ1G
	7VnZO4ztx7bOS5IDy7102HWY3DedqJx300FgAbJ1qglKdtpL2tOwnzdLQi4WVsdixNFepipjtXD
	aSFOepRsOfi8WuTLSZVZhoFxdbED8+rOF/ZfJLU7/fdYTHt5Yt+y8JRDFacCIITf4lPm1GZRcZU
	eC6WC+6PVOEnL5oJXCZfDE4Mnfy7Gp6DVRMVfDeJEDV83buvli89zWb4/LZkbWxpSRYHehgIiGp
	T2nrLJ7UlH1UxELiWED8iPIONjLGNgmEWBCPVl9yAEWOPEErUJLn9EQSHJe/LhBNdMJou6vGXAo
	t7NzWQo5G8WMYCFd9mbhJl7emMU+YmzIEL78OITErKpfzD5ik5KdyDy60PAV+UTE7qnmFOgeM6q
	aZnUt0VInOKzr8
X-Received: by 2002:a05:620a:370a:b0:93c:b47b:26f with SMTP id af79cd13be357-93cb47b0cd1mr495778785a.49.1790848557909;
        Thu, 01 Oct 2026 02:55:57 -0700 (PDT)
X-Received: by 2002:a05:620a:370a:b0:93c:b47b:26f with SMTP id af79cd13be357-93cb47b0cd1mr495776285a.49.1790848557435;
        Thu, 01 Oct 2026 02:55:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbb999sm603556e87.62.2026.10.01.02.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:55:56 -0700 (PDT)
Date: Thu, 1 Oct 2026 12:55:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        devicetree@vger.kernel.org, rajeevny@qti.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add optional wled-supply
Message-ID: <cebrka4ya7u32ntiya42yx4txa3uryf5k2di234zm4enz3a6vy@xhily6qqmevo>
References: <20260929-wled-supply-series-v1-0-75d0a83b4b00@oss.qualcomm.com>
 <20260929-wled-supply-series-v1-1-75d0a83b4b00@oss.qualcomm.com>
 <20261001-private-wooden-chachalaca-51aa57@quoll>
 <997cefa0-384c-466f-b318-077939946768@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <997cefa0-384c-466f-b318-077939946768@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOSBTYWx0ZWRfX8F/Egqfuc+bE
 QN9ySPgc1q3WPdY39rOODSyzfmfMZcUqvX6uu8i80fCqpGcAxPFcsNgjeEancZ78qul29ayFNRY
 8qpL0fiymL9bE+UJa9qsO8mGAGgL7U8=
X-Proofpoint-GUID: iGn8vzwVlvZfdvMFHEwsjA2N_QPamaVA
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe2e2e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=rj3IgQrshAo4T4ftDsUA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: iGn8vzwVlvZfdvMFHEwsjA2N_QPamaVA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOSBTYWx0ZWRfXzM3bvqro6ufm
 h4WdoxmsYwmh7fcNw4LYd6CbKJ27l+JqqHgOj3xCbAo0Lf3swPSalMFdQJP796QpxwjqEOqyhMH
 UG9zRUlJjJzFSkeIek9RS5RMKW7a//NQahvEFmylstdotKkXgOWCHnj+sbpmQz7eOgh2B8f90pO
 NlXANGVoEoUvzJt5pOTE6jfh9K1AKRQ//ShbNK4D2xpWKSCYqTBla+cdsZ61ja9I+D8QFVPl/h2
 Sxya7oE47sa4SJK58GbOiEvFuHisAMlzYBf7GdaIHQBnm05KPOoFmL3ySn+MF5IRMLYMWcYyPys
 2PlsrRBWYkOVxH8nsjKlZc6Z42PehAhV4EiF1gasPmHFGeMJN4KYAyOrFGTrkqKVNVzMyc6dDrV
 C2PT7eRnhaWLN4o75GgdA9DZlorhYVYuJzZ4cClaLmAX1sRQTh8x6ZDGN1hO/3PQAYSzBik94KV
 TVuucW3u52+adf7qGnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010039

On Thu, Oct 01, 2026 at 08:57:52AM +0200, Krzysztof Kozlowski wrote:
> On 01/10/2026 08:55, Krzysztof Kozlowski wrote:
> > On Tue, Sep 29, 2026 at 06:42:20PM +0530, Arpit Saini wrote:
> >> Some boards drive the ILI7807S panel's backlight from an external
> >> WLED driver whose enable input is wired to a GPIO, typically modeled
> >> as a fixed regulator (e.g. vreg_wled).
> > 
> > You describe something else. What's fixed regulator should not matter
> > here. Which pin is it in ILI7807S?
> > 
> > It seems you just want to represent GPIO with a regulator. This is just
> > confusing and typical downstream workaround.
> 
> What's more, you basically REVERT the review YOU RECEIVED in v1. Really,
> just sneak the same stuff 3 months after like the review never happened.
> 
> NAK

After discussing this offline with Krzysztof. It's not a supply (my
fault), it's an LCD driver. So, the best way to handle your displaycard
seems to add a gpio-backlight, reference it from the panel and then in
the driver check for the backlight's max_brightness level. If it's 1,
then you have to send extra DCS commands to control PWM. If it's
higher, use normal backlight class controls.

-- 
With best wishes
Dmitry
