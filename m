Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601680;
	b=kZaD+yXp1Xg4dk7E8AEKw4s4v0upqGiTGs4jJqq28wz0eozAeV7lsp+4AfJQBOWR72ti
	 QwbvBEpq9ca06Cs+f4P9YUDJfNv/2aUjyTtmZf47/v+NrnYvumVi5ro8a5SMzpkbu3IGv
	 +WBBPxzIb0uhu0/B2d/sY9c/sdRYDRpRb9tRJLXOR0ffidsQCM3HInGeRVlptscv8gAlx
	 4hhfUO/PFdVWG9YoP7s4psPLU3LsPJKdzp+QEzPNIe1rQW0RxuMx3cpJPoMGF0Fhb4mkw
	 ARxlTNIH8LjpapAR223ahs4mhbfLuiDmc7/o6wINZ7k858HsWDTaNEXxtPGhVvCMTUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HVdsA47aDoI4CMQ+bLdyYMuFiKteKzxJMFZ8slEZfaw=;
	b=0e6vHCgRaqsmFKZFVdZI3u5DYvq864MrCuTgVf7v7ho2GWJ+nETJubC8uO+ruahmUOV/
	 UxfDmp2q4LbZ4SCUlwTD2MaT0iUxvxOhWDMhhTl8LxNjgd61TjjmgwY5QqhOKtgTtWV3s
	 LcKlub6HSb86JE+i1cU2XZvIj89mGJeef/gr6DVEmGxdHvDSXMZXTGOzQe+Rq5k4Pk15k
	 r0mQofJhwHeokJoORnorVvT1cCD1kCOZHuluXeIWdrU+z5kgt5R9cI6nyR4EFy1NR8cvk
	 LMn+a3fsPdf3NTEc0yggXc6TWcgWgJ7rxtr9iMJVCYNLnhsYumRZBVpAWiyODn+HOkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nhJEjgl2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HMbRbE26;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BD9606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24BD9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nhJEjgl2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HMbRbE26
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9m8J74130788
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HVdsA47aDoI
	4CMQ+bLdyYMuFiKteKzxJMFZ8slEZfaw=; b=nhJEjgl2y/o4dWRJQXhb3irWSqo
	3v08ifC5n1ZKlNSSPCfwWU+klZNlvPKSwLl3L3JyaKgFOBltKsOtsOEgSiVIR29F
	c5qrDL2tN+hRucvwk2TnDvorH1m5ecFjscYULfMJV1C5UC7JqJ46//eqqWnkGCJu
	RkGxW2goq2gE78THjTotQI9Jo//44rK7UdxYAd1Eoi4PRY9aq/Af0ThJLaYCo5+P
	4jr53dQ2KYTobcNl3hh6DxIZEEiJowrvDIbWmh4vd+UZtZHZpz3PIQ8Y0+VjrpPu
	Zzq+8FoT2olOsXUO2cvosGToCx+njYSPj7Dfi6inZXlIxKW3fr+KJVBgr/w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhracw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:14:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0578f1d51so56391455ad.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601678; x=1796206478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVdsA47aDoI4CMQ+bLdyYMuFiKteKzxJMFZ8slEZfaw=;
        b=HMbRbE264zxJQf3kKhzRFUOphLByXq9E/IV3nzUYCeOV2LDqgQyMR+JvpjmXVTZG6e
         nfXnyYzFINYj6rbw52bytqs9MXXPl97mGlAxJFJw82/wjllp8TFX6xaHjXIp1lwaHw/8
         0OzhitHy78ReD6YCRUWCvK7lzw/mQW+PoZX2FPDA9OlLI/xAz+2+YU5LktVk9gkRykl4
         R3K3ObdjNdq5prRRXSDt8TwRh7Rx4D3ujATDHUi5MRJ5gSTtEmUc3AfVcT9tYoG8Dke2
         Npqp8Rh+iJWmaCAV0YAW3eE+3oVl9/wi7yiwJE24DVic6Oqj6Kye8saMNoZYMrwVJleE
         qA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601678; x=1796206478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HVdsA47aDoI4CMQ+bLdyYMuFiKteKzxJMFZ8slEZfaw=;
        b=lVS/uw5u7n/ysD7NdyoGoIzwcsengi6MeaoqIe5eUYV2mGNk1pdpWrTADCE81o85nH
         tUrBVMh6bt5uCy2MrijWA+EXS00h72OvxyqxsS9Fc2CL6h2685F+ppVzg3GNixIFuOMs
         vLFGPbm+fmo0T2DVgnv7rtBbrwFx96he6wdzuDxjHXPZYQbYlIuZ0a/kkuKtHch11A6j
         FHLFabZSfy+YnnCwvFvOnbb6oZZ4THv3MnuGN84WSPcwVONL8PZpuZUe2bbd6MFjfjF8
         kJ6LApotylz+/kBOLKBvki7jktUO8rF+26hq9nTgGmXzcQkyT0A9YkN0q5JL5Md7gDXN
         c4uw==
X-Forwarded-Encrypted: i=1; AL+hErGT5bj9kLSzahDX+rZZwwny5cxPbwIJYaqVh3a4J5H3+Z1wykykSJ4DNbADhtQHVDk43PeleZLjRDq7@vger.kernel.org
X-Gm-Message-State: APuU4Z8NmVqTiPTsWmiKUoCP+GQoI1gpnot0l22KY4NzgEfTnEjY/4TB
	u44qKHv4A3ZYCfiaOYW1o8MrShggJSfyIVTFnqv+OIaXO7OPESL5aHK6USfYWqjCuDNQ2LsvxDq
	ipyPDedWQ3Di1g+w18SbaA0qaICCqgXY6AxdwEoQ1VaoKvdD6hjnBnPKQEs18rGyC
X-Gm-Gg: AZFdTZenp2kXryVC0r6/z/U8S9I6OdDH1EPK4O6TeDSndB8ZLuVqukr8qGTz0zYAFXo
	94ie91ypd8o5p/Dfdow83uaE5ULQLciqAIbCiyXKVlEaEwfkXH8JN4qDYJynnm1PwAn+ZU7/kLg
	rsXv9tgFSTM6CVUY9FFSkxN7+BSPfPxiAWPr9d/jAhOf5PxSB/YYC9v3Izb6/3sjYO12gkflGh7
	HrdRVvnczsizsnGzeezN8KQt0NBNcehBEo28PtmmPgVR/w8umBYxiV404YR3D+QH9fXQN8O9wEY
	yTmTyk+SxC+lo2wyklh/KCSL6XojjD/pAYedqAKeKiJ2gKHr35oGDLVk+MNWXRrmR7Vlxj8t8xd
	cON0uPn0L9VDeoBI4jgOc6BkJ9RH8hBF+P6rx71qVSWNAbBjfF4HBGJNaxKJgdFY6L4yM19wwyB
	miX7K5Ms78vO7DSl4vK+yuxvVohHpVz1PZZlyJKOLRgsU/sAZ/VFcnTP/H
X-Received: by 2002:a17:902:ef45:b0:2ef:ee1b:8e50 with SMTP id d9443c01a7336-2f03f0fc314mr164139735ad.18.1795601677854;
        Wed, 25 Nov 2026 02:14:37 -0800 (PST)
X-Received: by 2002:a17:902:ef45:b0:2ef:ee1b:8e50 with SMTP id d9443c01a7336-2f03f0fc314mr164139575ad.18.1795601677447;
        Wed, 25 Nov 2026 02:14:37 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b76sm84036135ad.50.2026.11.25.02.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:14:37 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: Add compatible for Seca SoC
Date: Wed, 25 Nov 2026 15:44:30 +0530
Message-ID: <20261125101430.231766-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6835fb3e-5f05-4f32-bf5e-85c5c5803459@kernel.org>
References: <0439e03884c02c9edbec89132b526aaf8f54ae23.1795517696.git.yadu.mg@oss.qualcomm.com> <6835fb3e-5f05-4f32-bf5e-85c5c5803459@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06b50e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=nsDU7YxpfX31B6LV5i4A:9
 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 4_h27tNTcHMGEm2N4TX8FcKK46oG3l3R
X-Proofpoint-ORIG-GUID: 4_h27tNTcHMGEm2N4TX8FcKK46oG3l3R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX6zy4tg1QgcGp
 BAZiibMpmHcNCgfHNUe+s56ijVwRJtikjVqOr65PNSObPFsZOQrYnkSJNnDB+SS/RijPLhSmTSc
 zMC5JI1jVokScF3w2KPW5faCbKF1BGY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXzHt08exFR5Y5
 0PPStgUCWwwV2qsYFMKJpFfKRmHZM6hb0T9vSN1t2dD4IOJIbnEyie8L8fhawfbT3PWpQo4afZg
 p4IMvJEw6yPlUTeJmuk2E7snw1ilByxTKamA7ikWNGLM+3bQXewhuK3OopaT1Ns8a+s4e+sjTQW
 3kIonB7jy8S3actxSN3QulX1aoutr4fk06K1s7Zv5fb1OBouClxGotPKnGJAeWQkrcyTfypWk7H
 mpmtMYB6SAFovOBB1w6c+1kyLOiu6CG7U1LLz3Gh+1U/rwKnWT1ULRYbbJJYsG8qOkivDGY6hNM
 zGs8PUfUozc4/CFFHKWEhO3c/2b7JvoUdV8nlwpJ0srAEa9okoO6MDSHJ1JKH878nIIWVKQd/ZZ
 ofS9k8tqP/fqfbIvk81m4rJI6BcRaM6bDzap3hFaSNkOkBJtXZQo3AKXFum+q6Ayc2EnRCg5is1
 KbWe0k8EwhzOQ5wb4qQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

On 24/11/2026 16:46, Krzysztof Kozlowski wrote:
> That's enum with previous entry. I am dropping all your patches from DT
> patchwork, to avoid repeated feedback.

Ack. v2 folds the new compatible into an enum with the SA8797P entry,
here and in the SPI, UART, UFS and QUP wrapper bindings, and will be
sent as fresh, regrouped postings.

Yadu
