Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661106;
	b=MzG3R31jUeCCkM++7/bCkrSt3Mv8HTmppdRmCE341csGKuVlGHAy5P/t/ty+KF4rj0zo
	 oIw3GNYMfJCDtjq3+z7yZUXESfnshGDJTEbDZ+Xj4WQq5AUQWqX9qiyjhRPcaM/HyxGp1
	 1Jn8BEKO4jQNXxwuFX2T9l6BeNnRN/jFw77mAL1JRFwH1pJ3ABxx4dTICTXfcASL8GbuY
	 Y3bfnGVMYtt/yaWvMUY4EshjtmUAqYiFZ1dX4y5UG9H01Nbd1/qFKxlCobOxlcX97YXc4
	 4arH1V6Hqj1JydakIgep+e8P4kX3KztEzrhVP8EjTWkWadx6GrS5W+JOQZUMsHVdvmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZDyrDgRpyc93YfUqkragDvRCYl+joHD1buIS82tXjlM=;
	b=x5n6m8YqLdzSJri/fDVBBZtFjCVyw7UADK1gtDBQT/W9FdEL7PzpP5bI/KmYJLFqxzRP
	 EV+46Y21U+oB6I/kaAZAslYOD8oTqLtcJr5HlosVI/aOITncMje6f4/ZIk5JMXayS5CFk
	 pk9NAX/J2VCjOZ9P29xrX/g3wVhs94IKsYl/lyboka8XjrMm4tKo5RPBR9OMiyJtsc4UG
	 B/NSHdxfhI8XTYn+v1H0oFvmlr06A9gUJ2PR31MuFE1uUqQtB24K64bzAhOQJ+7nwB7Zi
	 7pvrmGrq91bnlCrbgxI9acjNI2/N6li4APsMw7FVPhKFzUTPlhTk/DRqjkdkMpGIj2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C8DjvWhK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPI5JC5s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CB9606A31F
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9CB9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C8DjvWhK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPI5JC5s
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M703sa3076607
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZDyrDgRpyc93YfUqkragDvRCYl+joHD1buIS82tXjlM=; b=C8DjvWhKPSwpRQ4d
	rw41rBEkaPMe6iGTZYzzOuDe6vhj3LT7InylFKVRaI69dK7LIRE7pHBSfA4cQgfm
	kIdyxUmOw2xSwKCP9qw4tGCE8zgDUhpZXlB9xaHe2CbUPL2Xkocv2gHMlth57qjm
	h7MitYMu9ftEQQbwnJHOLSbsXMnpcvDMmzxmdK4Wd8yEHjSy9BbNe0cja0QrQxW0
	Aj3FhUikXyA/L6VoZH1kJhnloIpcFJn+b2AaaKt308Wy/9C76dhE+KTn7cF/teS+
	2TWRa8v8T0bMACCYkm0ww6Hr1xr84m4EY1x33fgiIbfPYZ/WXpHrhjNyTZxBHLVL
	rgGbew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a1p29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:25:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so33618985a.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661104; x=1793265904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDyrDgRpyc93YfUqkragDvRCYl+joHD1buIS82tXjlM=;
        b=KPI5JC5seiCV9gjNNzY2sODQ1+/DEOQFOxHxPnXwT0xdcTd+HzA7cXafvJCZ8yPubw
         vKo2tkPqAii5f6BcC6o6p8aunSVg9ERTLSiJLPuzR6Q+oMx4Gf26GXzkP++JX1v8v8rm
         Grv+xclVIC9WpwPHebMG93ACDPlmTeYlIgAmRmkz5z6tlpvqytkdZ9AY3VVnBT5CVXJ3
         SS7BxJvzZCf5tVSUWzJHYYQtQ83PI1jBEle4QLWZWa9CSAGKgUFPF4QTGN1T5xzYiziF
         6EzNqVEnzD7/47TlRH2jhG6d+/XXuRIhDpgc+TrBKah8NsgWAK92tZW3HRbD2ZYu9s2l
         93tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661104; x=1793265904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDyrDgRpyc93YfUqkragDvRCYl+joHD1buIS82tXjlM=;
        b=S/F/K3H09qfbVClquRI6Vrw2GXRlNY9axjKBubC2PFWcgGk4JVlJnYWoWXYbfJlTBO
         aUrgWRZNnHhPj+mgNbbXACpyUXVEvHcF8oVuGO01bgXVaGwSIfsbBz3CR3S4enb6GhoU
         d9MyK8sxA+hYqA5s5jD9UZACL98s2NnnVkadfbLDk6bd6u6WooT2IZoGIQj2vWTvUgGP
         aTgAsQcFoxaf3gHlDFjrRTC8VyywImigYZozOz1prBQ14/DHCKA0VVIPrQXEq10YLu7K
         sQgiPX8yT6EJOXdkxGP1H2+HTHoaP3FI2cjmkz/9RAC5sjNXHLoLynZFcOAwD6P90SVX
         //IA==
X-Forwarded-Encrypted: i=1; AKwUvBz9MHseYKjHbOYJdJMpK+XLRF/RaqR7twJFfb/OzA6y3zdKpmkLbA51ciJrAHoHj6w3pUlra/Qi0/dS@vger.kernel.org
X-Gm-Message-State: AFq9FYKiCfjAfAI3DWUWNz0mX30A7uBudtcRGsY1u1pxop1jF+xZWmbF
	MlVLi7Lo2nx2TcICo1eWaJ58mI8XUa0578mPOHsoNSSVzmkBIZ5XIPpjDFHWXoWDUEkrEVS1uzv
	KDAXiBR6PP+zZY6p2jdn1aOW2jFxLpjQC6MB87GiGWYxyFqh3aQwMNE8y6Q7cAoSD
X-Gm-Gg: AYBFou3kNY+LmWBOMEsV63EDVKh5LnUjH1rSFsSCQ/IBELjb4eW1JGmTfBVIQQnldMS
	d+V38SaYV9Kqrp8IPaCo4xr2ZXv3PQxkmldx0iUFdlSFAzweDeB+ArR943hoUe7l8zGnvPEUzJE
	NUHpnYyFUDgelMjnd0Yve0TKcedxIhQj2Y3QqgJvZoLRwib66g6TXrQHqn6WWTXL7pavCqernFC
	XFmjwry/qFxisNV0nCUoWXrLfPcibBRPZX/KUgrLeMFejBDMs5Lnp5QLs8mzINVSCECls3n7xOD
	drxILQ8Ph/9AzWzExx48MVSLI/QEJg7pWMsVMU5GxhJkscIHrVEE1C19n63JI1xrt0sS/qguoaJ
	xVCMEi+NGq+xxB4+rHN+Odg==
X-Received: by 2002:a05:620a:6087:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f57d6eb34mr986884085a.0.1792661104165;
        Thu, 22 Oct 2026 02:25:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f57d6eb34mr986881885a.0.1792661103736;
        Thu, 22 Oct 2026 02:25:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403130703sm1601567a12.24.2026.10.22.02.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:25:03 -0700 (PDT)
Message-ID: <91fd4f3c-ae73-4a51-8349-6c75b99a588f@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:24:56 +0200
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
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019-kebab_dts-v4-0-bb6db87ff15f@fhannenheim.net>
 <20261019-kebab_dts-v4-2-bb6db87ff15f@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-kebab_dts-v4-2-bb6db87ff15f@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX8DAvbC7EQ3+K
 sIB7az261hmVG4i5L24I8kY06t1TFLZP8nBwnGUpPBCKFtqxO9bp0bB+GY4887XGIodEhqm0NWd
 PACUsDx3XDLEZWC8iHPd6xMfrrAstXo5Rxz3wBCtNTC+C/WbmaJViCAoDA52guXiXREsYGXozLT
 SgFV2vjSvEjNOnC1gk6UX8FGhzWhWWlk6hQzXLuVuJlmn4/sslrnFiDxBs17qRbjATx9RmS53ye
 LaaWYMw0Q/J4N5hlcHa3/8pvZ+iU5a4BwcmEsvrsR0PzuYhN9+cFOjWGeJqCyZ14SfHNxnuY0OG
 wj9eL3Yh2C3eS+eZq5m899k5s3blAIwOlpZsQz+6e3qFpS06bCu2Gi2ZPN31G1dufnDBxNagyvC
 /0WiEQDiFncO71dGfF6uP7POC9HR12dd63TOspLpbzA0U2p5LTQAlc0M0ZOy+vpV2SkL6LEAZr0
 w7LlWGQQegPtg/PkKMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX7G4rwdGmz1MS
 5mYaLEkAXUWEibEjN8ipDr9urQFzrpy6wIVA5EnbYenCEFXbkTNzI0nx3dJ0t3nhXWXi67rR396
 BiN3Gvken0pPJS5LMIAfEP8SkWf8gbs=
X-Proofpoint-GUID: iTu1lOgC-PfmOsJWao9_oiLAwx174DrM
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ad9d671 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=WE8o4AYwAAAA:8 a=EUspDBNiAAAA:8 a=RDJzJV41rLCqGB0F5dMA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=6aV5INxNnvWGCTbEtcBN:22
X-Proofpoint-ORIG-GUID: iTu1lOgC-PfmOsJWao9_oiLAwx174DrM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

On 10/19/26 12:18 PM, Frieder Hannenheim wrote:
> This file contains common properties shared by all OnePlus devices using
> the Qualcomm sm8250 chipset.
> 
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
