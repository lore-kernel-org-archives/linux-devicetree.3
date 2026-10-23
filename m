Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746445;
	b=VK1p18DTPyb13O8RRAdawUNQ23eRguelbA1Z7gazzUZopKEvHDsNtYUK9mMOBOuxk3Aa
	 jOU2cIj2UbMnzgByI2ewZvYLQkrH2RiLSdT2aMKvcu0IAe/hip/u2Ht6BCbcpx3mtiSTj
	 8Gmyh+w56F4QnAU258qHr6QYCvFtDd8DV980dsuiim6I/Awkzhh5slxWolZt8irpXNFhw
	 v0qZWsbVTTrRBhijRQl4sPixt1ua+79hDObLub/FkmTX0DX9OuCb/NlMpQkl7sgFV3Eam
	 IGVsjCWQZ00s/C/VqaZ4Kokc37YR7bre9E6ZRTN+GW0TKA/v/fKqKBuBxCpk90uCWRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746445;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dqGyeZV3oX3j3YBuq5s/ny+BKNGQxGrSV/QQaPdBNdA=;
	b=UV8qgkm4egC6MDBWcooSVrRgk/EE8g5BVbBxhzj4BmhRoV5gdeyefTkJBHjPyKxcKls0
	 HI+vvMm/yvmqIbjAPXrTVuAApUUEJX3tp18souV4PAdf9xHqHBKcUiiTAPQnFhAl6FMrP
	 w5BCQ1HFQfkPLkpBq4pGI3eQ73gxrT5+3ORcKc96800CQeHSfNAxF8ddtWsNrFYiQMKQN
	 9GKQ8Gc8f92IdqJ9eqO/kIaWncH1uckFy/2VKlj9TFjxxo/Riux3P5rZYm/PP2uX3B2LV
	 z4iBmYB6DbaR2UmEgk+OVgvuyS0SnXFRfB8E8TxY8tW9d6vlWok9ZTCAWsdnH/7py7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KY82gwWr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FkkpH780;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE7B606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEE7B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KY82gwWr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FkkpH780
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FLqw3167877
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqGyeZV3oX3j3YBuq5s/ny+BKNGQxGrSV/QQaPdBNdA=; b=KY82gwWrd88cyQoO
	N6VlcU0gEPxvfRxtihd6fFVUqe/HVjFBPuj5QU6HCwf4iUSVGmrmoodDM615Fv/L
	5WF5N8yYHJ3QOop8lFziY7+6bQQP68JTtZSiwhEW1ppn2yQNkLNUeyi7xPEqkF6D
	aJYeZK9W0tXW2vYv4rk7a/kLW0QbGepz1AqaX4JoB7b4OQTDjLxNtOAmeXc7ZWDE
	9Q3sVrH/80ogpAiFWvkTc0Ol08FB3G8RqjkNpCWqj91cqcXnVgX6Bu9ICK/M//aY
	czsMLj0lcdJVA9Ff9gi7aygTYcUW411MmtqbYTOPS6JT5MQprgdcav8W7WoQbqES
	OhHC3w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpauue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:07:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a04d1cb2so2161236d6.0
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746443; x=1793351243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqGyeZV3oX3j3YBuq5s/ny+BKNGQxGrSV/QQaPdBNdA=;
        b=FkkpH780nU05h0VcjynCf85HyrJlLBiuS4jNCYBL8MI/P24dINq2qDkZ6gecnqV6ve
         t/+rzliSahc68/Y/T4fot54qIzfR+23nz6LuIa97BT8/dddB1hdaagA2VBMsVC8NPC3M
         kDVd60FItrX4r2uXcbWdqdGExLL3zOwUW+EQRTYCNvlRUYgcGXm0UtLD9CZGjBrrXrei
         LEFYebCXq57ReTh/LGk4iRNIY1E4c12UJiZ3y1xL4ifqcNOR8nhfnUNM0HHtYdaQv3kT
         CZSf8Ic3dByy7HcgiwVMqtmFvPbZA9ufkN6ENxbCzF69gHaEc8u3PgRY5EPkVATdn1im
         SgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746443; x=1793351243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqGyeZV3oX3j3YBuq5s/ny+BKNGQxGrSV/QQaPdBNdA=;
        b=serFz9o6qtNSEQXcuLlEyq1vhwzBJpzeBfj7I4ip/gXHHsez2UEKkkla9B3XF3WAhn
         +rjAq47yco3RGCY97/zUsC4C9drmBq6z6t3LeFyHhA8fUWLHVPbBPQFQFB7ivLPbgYqf
         n4CxRTPT/uQH+hhzcudtoIJcQPCHG1W/HWcYFUO1aUyBChhXOwvWx3bl1qVWSJUqXyYR
         KjMg7mAl8CK2QrN+gTUJAo+azsYYGHS+l8O1Ve3MGKjPWCWLO6qe05gNjOYO/Yd7MBeO
         yP2QBdzIIUuIQXeHiIdlwtXSmvtITjdyorm2piVid/89GhS5Grfe+4szQ7RCIlRMIAkd
         E3Sw==
X-Forwarded-Encrypted: i=1; AKwUvBxVJjo67ptOZjRuU4ca7oa0WtnYNGxGkwpcgkBGvgyQMPRC9zwUyLIkG5sUtahLHVtNxpm47yOS6fAZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLT+7Rz8Cqysm6JIrfwzxRWr9QGzQGHxBiGsZrpFyCQsaNOey3S
	zp1f6rOOZkpKa+Spy31czrfi86/Exav0jQLVTORmW8ZS1ScNwp2HW1ZRQGV8tIRxo1j3VnLVhD2
	bnHrZvHi9dXr0uuqTZYaPmdeLaYB2XHejDpT1CHCTUZ9r1gSaTkRTHLaD0dVEpVqF
X-Gm-Gg: AYBFou0Yymxkww+qtGgngktgGWpnxeIMqi3RsZhYsEbPhoPDXQddVsdN0OmEL9ljyEA
	YChUHlHd3zlUHHximxOYVefQ89RzLLBJDDPhFxGajL592U+cZOnPfn87orslY77WJSi2cU/kfa2
	FXkyPijlGX7BLnMcAjReIzuZOaKzJmUdXhauCWSkQQSMJONNwD2D3PoCjjsxpojXCyvNbTyrWi/
	zIdYF3KveBXHjaKAmyETOrHSGt9mN95ASbeAsgHhqLLH8FoZLd8jkqebmCKzdSZTAoAnfEmwdFT
	ctqhl7aXQpaogMkX7RzXiFt14RAWflYMGXXv5OY5UxjWagiHASl66mAjKWodTDn2q8zGIHbUAd1
	2qH3Q3lwudakqG0dvwWQ4yQ==
X-Received: by 2002:ae9:e507:0:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f6fa10fabmr286066885a.5.1792746443080;
        Fri, 23 Oct 2026 02:07:23 -0700 (PDT)
X-Received: by 2002:ae9:e507:0:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f6fa10fabmr286062885a.5.1792746442626;
        Fri, 23 Oct 2026 02:07:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cf09c7sm80166066b.77.2026.10.23.02.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:07:21 -0700 (PDT)
Message-ID: <81d21974-9242-4caf-8792-bcd8d59d9191@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 11:07:19 +0200
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
Subject: Re: [PATCH v2 2/4] drm/msm/a6xx: Add a bandwidth table for the Adreno
 620 GMU
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261023-adreno-a620-v2-0-1d654c3f52d5@brar.si>
 <20261023-adreno-a620-v2-2-1d654c3f52d5@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023-adreno-a620-v2-2-1d654c3f52d5@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNiBTYWx0ZWRfX6NJ9RJ2PInO3
 zCm9OC5u52CLUsBzRtwstvpJcyP7cJ5eXYcVq+LpjX/HE6qypUjnTrcFgGZ+EhqwD1b5v1tYMlh
 gS1V4lHIVCjHNeX83BSruBzg2dowgsA=
X-Proofpoint-GUID: YnfrxkjiqXNYhtUk1Mqm4ajuV3iscXE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNiBTYWx0ZWRfXx0YHzxb2uvK9
 h1XLAk7FGtXj3OEuWjJaW0AgDRhlTPQfy4/aNfKbLBr3k7eqzgfuUvg/jCfQJriJ0wFE4YvJnLK
 9wKQnFsqg+zOv/+I5BJjCU5VhWOvEVLoDkNSetwqoj5V7RIDfxphKKlnc35KU6mHXxz/8/4tvuQ
 jhXLEIGcRjLNDkI1mN8Gfv1lXF26/Nu3Ej8bNS2/wShlFNNVqkF/TOk7ozM6Gqs+B+LfmjeeJey
 hYEzAiO44oCJcQTZRfQSZbS7iocrR7Ld7wkYHdyvABQyIpvts9qUK/Q+YBZ08SGqBqZWXHVYTo1
 rbWBTpwP6cfWMvZpBFsQQ2gBYO4Ekx6IgPYy40NUmIWR28o/XTdigcGDhY9PmQncyjtmFtlOWWZ
 zj8V2KMHxyYQSVsXNwaRykEFS/nb+eZD+pPLRAzMooAcQaErCknpwXJBHkfhaY1N1203y7i0AcC
 87RDubILbVZHUcXVvMg==
X-Proofpoint-ORIG-GUID: YnfrxkjiqXNYhtUk1Mqm4ajuV3iscXE_
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb23cc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=uaad06dfl4CJDRj71lEA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230036

On 10/23/26 10:49 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Without an A620 specific table the GMU falls back to the generic A630
> one, whose BCM addresses do not exist on SM7250, and the first GX
> performance vote times out.
> 
> Like the A650 one, send a single "off" entry just to get things running,
> with the BCM addresses looked up in cmd-db. This is only used while the
> GPU OPP table has no bandwidth levels; with them, the table is generated
> from the BCMs listed in the catalog entry. Add adreno_is_a620() for the
> selection.

Please just add the BCMs for your GPU:

.bcms = (const struct a6xx_bcm[]) {
	{ .name = "SH0", .buswidth = 16 },
	{ .name = "MC0", .buswidth = 4 },
	{
		.name = "ACV",
		.fixed = true,
		.perfmode = BIT(3),
	},
	{ /* sentinel */ }
};

You can factor it out since it's common across many a6xx GPUs
and &refer to it from the entry for a620

Konrad
