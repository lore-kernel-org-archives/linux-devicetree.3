Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420356;
	b=FfTHnaljsy7T3BxjAdT7KEuI7DuFFT789bXjS//BftLFNYgEkiaAl7Nh5MB3t3vLN66t
	 zmnvU6HWR7y5dlxhGjnySAObYJ3BZW2sNkUe7Nj/ONO+puETFzTbWBbCXpe/HWI7cTN+S
	 uZt0A0aczJc2lWcSsbuO7Fjh57p+H6UMe5FdzWzPQENhd7FePd2vSOVcGyNmiEcJZquhI
	 yFMQfBDsU8wv0V+jImsA2GDIMMIrh/l1SfCtIpdylLEVcLfGZgZmcnSSkjeT9cxvT1P7U
	 fj0rmMfc168JiSuUXkAL33RIJISSgmjumR+wmW8vXRNcLE+6b28Z5eQrfpAHqgA6k6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420356;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5gealjh6ZNGo6eLjGBgtYQumk7p6vPIIjmFui9l+xfg=;
	b=rQVW/Cwrvu94MQLF0bIDfgchpUTEo1irL1QPlAe6ntz/pNndkhaaQZ069e259/fVg1fF
	 daQBqeOlc/PuHSUCqVjrH2PgCciyY5FfPnJ1fjMrSesOGPzqAE0myjmHcTBFg+GJS06Ua
	 SJcrkegHBRRzBLNGAdFM6DwTaOKyxntDPj2ELmHfTUyViBfJD1ghxmlwb8LK0mHMeBv3I
	 lo7/Fdc7lf3/q1b2aSKNZ/ErH1gULIoszr6Gxv2Tg3j6QPM8dBJQq+ZfmRGsD31aZO0+8
	 YXsSWGddbVKJ6IyTQWxekGz3IKZr2sgiL10AvHOZtvlIzk8xwwr73yKOuYqB35CV37g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJwLpcqz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Am76AyIr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1A9606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A1A9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OJwLpcqz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Am76AyIr
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHt3u13989169
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5gealjh6ZNGo6eLjGBgtYQumk7p6vPIIjmFui9l+xfg=; b=OJwLpcqzCAs4cZ9R
	z79WRUa3kfaODLgha23FN8hrLdUhGKs74uKbdt+Yf4oI6veasW64FLMOCaf6OAGk
	mFD6WbWeItjFQqohIZRDhLa/oD1OJ01Vp+BQZhIJvAJBcY96SJ8tVICiiVsbF1qP
	2QCBcEpHn9TtvGFPszk4VAPyBbrw5FQsLLF6++mJ9pfOUhwaZrXCQ8dfcoiFHKMa
	Li1a/UZjBq58QfHz7MzQg5nOZRS8xt0uJNha7EGAQkdau2p3fWrWHyoys+6z5lQc
	3hWEcFu4wnISOXhzfeqWm7eBMhW/FIRcVup46XwiRSjbNG6JPpUduS9BM2AEeHho
	ED0h9w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1u8yj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:05:55 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98a9c848bf0so479953241.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420354; x=1795025154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5gealjh6ZNGo6eLjGBgtYQumk7p6vPIIjmFui9l+xfg=;
        b=Am76AyIrpUwIqPQ3D2u2pn/RwXeY2UXIMJixmbV8ObLuRXb7Gb//G5FrRezs+7qyZE
         ioOp/8gfJQrYva5o9fizUCWsy1on8TbspSWq5AfjZtM9NTmUEdphiVKVS9pjJmkYZTSC
         KV7KpV3quh/LlkPj4EjCMEm3qDuK9xRVKW9IqB2diQc8aVrGiBBU94JOX7E8WVA34vOf
         WYTIcqwtyQ1JHN6TFLMCOw21j/DRY1ZG9LnEK5CT2CUNk5lsxRCG259Cnax7BXgQj3S2
         D5jPEv8V8dwbmsTgRoiwJEE7xekf7fZ+5j3Z0sHWOWkfbGW1byYHaNeJN9M0CJjsEjpq
         g1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420354; x=1795025154;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5gealjh6ZNGo6eLjGBgtYQumk7p6vPIIjmFui9l+xfg=;
        b=ho3m2HC2nfJEoB5qkc3JNv6P/5WVZzlYHIPaJQX+i4oUbelo2AAyOsJyPJBoVvu+nY
         xCw0hzipoteFQ5tpFY0x7Flcurs5DCw1C2/pSF+maA9WuV2gPgsr798yFJmXLij9ED/o
         DU2Kg99y9GJghog0XO9zaaJBMO0eSxcdv+d9dZwtiT+J73dK9ZreBPdIK/YwbxnRe7yR
         JLWn1rAk9XfuboYIzNepLTJYEb6+L9s/14RkIdN8TF1DK5DzW2SPhr6lzxqke8X9UDX6
         nvckSIhxE+QPenf624XntCN0PuDS1M70/z2CAh8QGQV4mP1R9J4hFHOicaTz/rqXx3XI
         zqdg==
X-Forwarded-Encrypted: i=1; AL+hErG5jXBruOLYxERM/Bg8VjFsc98CMISnJ2DbURG4nnaO5R9+f+jye4P2hsF9I8u19FbFo6oOIVST6ga1@vger.kernel.org
X-Gm-Message-State: APuU4Z+rdkNr+fEQ8NqOEY5OVbiU09HDjBJNsl8uauRAJjF2RdtSmiqx
	nKS5GaNp9x6WzB2qwFr9EefX/TKidY7JgvHn7ALexHouUihBU3nXYS9bnGuhyiPPG86hjqEeakH
	fD3Hk/ZW5JxH/GX3QR0N443wrK791SEPIF+YLYdnaLGjjv/9iAlZm5XrEzN8YCu5c
X-Gm-Gg: AYBFou0jt/J8NnK3NETXcphStILY4fcq2U5Z/46SiCZpvwtOV9qUlcn521wrNtEyBRx
	bHZfE9IOKgi7P4/RMbKllkcnVJnmbMFZ1LfJz9UVBsFopn+kLUYh9R+mB0VlqWXquTut8oGkYoW
	7159euzVNTMFrsUp6yM2P/W/xt7ge5q4VsKmHlirSEXATPetgD2/2E7b8hC3KW4TeMCBDpeqU1l
	w6cPIqDpyXOLPpfjF+S2xq8HMmwKQG+WxC8GIYzWxW3GE4sieHStrT9NT4B82sHs27jvGpBdP8+
	jZGlf+QxAWxcli2K82OSRsOOuj84bnmlQXiKYEbUgpQB/uoRFmaszOPK76B/nC84ZW3YTtpnuMY
	uJvZj5Lcp2HVrViQY5SUg/2gbIdENkMYD+fFogXMioePblPcpPC3mRkQkviZZRaCt+BOm1DqS9X
	c=
X-Received: by 2002:a05:6122:8f89:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5ee1c443198mr1237707e0c.14.1794420354400;
        Wed, 11 Nov 2026 10:05:54 -0800 (PST)
X-Received: by 2002:a05:6122:8f89:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5ee1c443198mr1237606e0c.14.1794420353724;
        Wed, 11 Nov 2026 10:05:53 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49944d646f9sm8588796f8f.32.2026.11.11.10.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:05:52 -0800 (PST)
Message-ID: <72bc9dbf-a4d3-45e8-8647-a8c4a41045d1@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 19:05:48 +0100
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
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
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
 <8a557bae-42ae-42bd-a149-cf854b7af9d5@oss.qualcomm.com>
 <dki5db5xizrwwijmjbnbx7irg6if24l7punctr2wx35j4toi5c@4rip7azwzt2k>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <dki5db5xizrwwijmjbnbx7irg6if24l7punctr2wx35j4toi5c@4rip7azwzt2k>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX90f59tU3wzpk
 idmdzoTbXA78uDG6Xl0sjc0Uby374NMgt5pGlgozDwi4dOzrrhm0ZCQcKUQXyIrXoszIBRUwkaK
 5edN8dBnpVfPGRJlZcOAtCowmeRaewY=
X-Proofpoint-GUID: 7f41j3HkzTZq_mzs13FT749mP5rQV_s3
X-Proofpoint-ORIG-GUID: 7f41j3HkzTZq_mzs13FT749mP5rQV_s3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfXyotC/h5NGOdl
 LSzCOEZUoyWMn93KspaQIl746VcFKpMQxlTUw4Cs8uQzzzBpGQWL/r+VVgwby56L4roH36r1joa
 1fOjNzGgBkA2lPwZ6dQzKRAufUqHM/wcWRPLUfYYZIx73zyLF4kYnooSWEh0ekOTUXVyVizryCT
 1MG4tARBrdpfvbdaOjdpLcJVaMpU/SP1z1pr38UDG3TM+snV4yHUbnJR6FIy5miPEjaLxpuJRAh
 kSML4/b90vYN6Hm9aID+FbYIckIlZ5747viRkLUEzdCs+2XsZ0tffMZWnOwNboRSOWnLH9SCGJp
 LrndTx467nKsSk5lNo07y7L6uzEE8kAQdy5P3VAHgKMpLeu9rdPBSV8sdVk1wket5B/ENNakgyE
 pJ1ylKm2GoDs0goPo2GEoQDoLDJfv/gknNo/coCychb0TQpoUdT0IrUS5TSVDG8XAzzaYwf9Nfs
 UI70mamMoeXPMUHcdnQ==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af4ae83 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=fswbabxtGTeL9KkrVe0A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110072

On 11/11/2026 18:55, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 02:54:54PM +0100, Krzysztof Kozlowski wrote:
>>
>> Commit msg said:
>> "many Linux DRM drivers will work fine with it"
>>
>> So many->some? Is this the only problem? What else is not described in
>> commit msg?
> 
> The commit message points out that a minority of drivers use and require
> the port, while majority of the drivers don't. I think up to now only

Ack

> the Exynos and sunXi were mentioned. From my point of view, it would be
> better to change corresponding DSI host bindings to allow port bindings
> and then define the OF graph connecting DSI host to DSI panel (which
> might be done gradually, etc.) even if the OF graph is not used nowadays
> by those drivers instead of providing a false signal that it's okay to
> have DSI links without OF graph connection. It's not future-proof and
> not okay, especially for the new designs.

Around 33% of DSI panels bindings do not require port, so to fulfill
above their bindings should be changed and ABI broken by requiring now a
panel.

Even though neither the panel hardware nor the panel driver needs the port.

The requirement of the port is on DSI host drivers, thus it should be
required there, just like I did for MSM bindings today.

Best regards,
Krzysztof
