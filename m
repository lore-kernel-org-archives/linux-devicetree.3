Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECC1443E53
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344672; cv=none; b=b0PVNQqrSt6cCucqXWqhMlCMGRY07F2/czR7/Ay0Jn4CllDL5yyIiTrV3pptGn03GHVvoOZaZpSp5g2rSqqsnycI/2Mmj4S+n++IIiYDddjgTlHUbBb9nX2adKbJtVpoKe8dhglv6PSooQ/xPGzAXM8K7QgKJHnyALzXLVGXv5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344672; c=relaxed/simple;
	bh=iCb8yX7RPhl+yn5F/5/P8HVWlsw7cIAmXa/n6DkPaD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XvXSxBb8s+VpDusiK+Lk3PrN2Tlob7wHkyDTb2lxHzWA/Nwlygv+hvs87nd0IJbpj+ivUESMVDDztt9kFGW7o5K3RfYjU6jnbPiHbuD8RVnQyxSXHLCEtU+HcCg1RwPATuq2pfiG+L4PssO2MCBJ1GGouRNdBFhhufIZXgA4BDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDnQO6IP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEUuAyG+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDnQO6IP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEUuAyG+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NSE01349248
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 10:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EXTLbvkaIocNmvnJYqZPtiPMWVNU4SP5kdw8z+YoAD0=; b=EDnQO6IP+tQp0z5Q
	zGMt5ErvlK2OPTNxWQUUox9ndmqg1TC+JrCBHxfla8b2h+CzcOmlpN7RuV2KneL7
	sCbV1L4w4W9TSQgSdHgqXUEiuzNXhxrqbwxzaovDZwe3e/zm+d+jwWHExJLEPX+1
	eqyIhKpVrcEMDarlbZaFPNRn0YAUbPwdz7MUb5FJV60WnPoVEARYX0h6XdE0lZYP
	5gEiuffia1E8E679nTgTKxiLMVxhdAPHPiV1ln0is8DV5PTQXjn6wMb886cXSs6r
	xzupbu2LX3c1LBXjRkmI9BrYy/I528B8GOfZz4pn/r3uKkwpzFcOvW//U4ak7GvF
	fWoLKA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge3n0udyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 10:24:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e38fbc5so170941185a.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 03:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344664; x=1788949464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EXTLbvkaIocNmvnJYqZPtiPMWVNU4SP5kdw8z+YoAD0=;
        b=SEUuAyG+FCP4HcoUqqX6SC1QviUTn4b0+nzhHkphugL+HY4706iy7jQkHizXAtzlr3
         vJnWt20bESRBwaORBhM3qKIvUGwuJGia1O2rmygDvw1xEaRucynTVw5q8k3OMt9Oa3yX
         1n5r0ewdHGduAbVFLMt/79Di7Exh2E6ugv9wyqv2LZCsc6igakpBG7NcqEsHtnGHN/yj
         fvZSu7DUD0e0H1bbPWDVX+hkSyGSFVqvG7C2VzrI0QZlkRUKDmG0w+TfvwaPN6PijGrG
         2Q+bKBtJoZ+/s/HKj3Ab/oSskYaDLNEqsb0yoC8gvEtHOk4HtDLqJxDvgcCMq81LyZin
         LG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344664; x=1788949464;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXTLbvkaIocNmvnJYqZPtiPMWVNU4SP5kdw8z+YoAD0=;
        b=Fg+osVwM1dnnbYaZxPHQnVGs0G1vVRL40f7wXEzvd2VX5zfBj47sQfFKDlXd1p5b5/
         0fTOokbFeePs3IlLZY3Jrjs3Q2jtqDQAN9m2CxWONmVHOZL39qiZGT80V0bvASxObLza
         FZQLGz6b3x9INvZno8069ErmnACFtkXq3Gyd8d3JKtCmYG1hVEj5WIlJ5Vbyqdg93NRK
         anj1RqeGqxbv9O+bEwltMM+AjoW2Dho0EwftIQIIEXStf+IdD1l1Dm5Q3hoeQYUsn+Bo
         /ByfINsrPAXLv9w4/vW6zv71u3wNJoZm+P3ZXCshlFRR0r5lCURtNCOeD6wDQ1Rug6ei
         L1rw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5NUiOEJ3wc49tJDpgxv6KsiHJR7UT+gDOC3j3hIYXQR23sRgcEugRSfj/sZYo+Vb8O16wcgQ4NpRF@vger.kernel.org
X-Gm-Message-State: AFuF++m8wph94/YZRKOMrQDMLm2wrJnYfN1TmPunkpYUo6QtL9KSQEP8
	aevlLhFmX7DxLgDUR69akiIyU+0KzM6SScnGfDEfGkap7cIyi7i6FHyXLXs+l5WyeRLsEw9YI8X
	/w1Ze+oLUQlMwjH5qxGVkeaxD1mR5JApn8LFahMaMiRPn3bTUUnuFawhq4TJdw2Ip
X-Gm-Gg: AR+sD12xWe22EEz0N24iCF5FBiImLoXPYZTFxS7LDxezZaLuM+t//+pJBL2j9BdqDNM
	rcOJHVvzShGmp0UJBAYvq4wBiv2RukvGhI6ZFb9yXuUwDkBXLPv7Z0fkFiQHR/35iMGJ7gJV7pD
	E9iOmfzfMufKfbQo/2NX3cl0IFWa8aS88r2mzBdILp54pdwm5zod/jBaiUDZIDeSj5g8XG3TuUE
	QnQCAbv5tymbW4MR1eLEGEOkJh3tUeT7Q2cmGHD3FRUxMjWm2NIh577c8S2YPdCl1U2RkaS3DCG
	k46C6+JY+9Y3mPRnsw2tAWWoh5k1j2A7lEAADOcoKWYuASYr6gFt4enyIm8FqikFQGHPK1xC9eA
	/aDVpd3KbiggqXLHKZ5HsSfMoJ6Q=
X-Received: by 2002:a05:620a:a0cd:20b0:934:aa56:45df with SMTP id af79cd13be357-93960df450fmr373922385a.11.1788344663544;
        Wed, 02 Sep 2026 03:24:23 -0700 (PDT)
X-Received: by 2002:a05:620a:a0cd:20b0:934:aa56:45df with SMTP id af79cd13be357-93960df450fmr373916685a.11.1788344663027;
        Wed, 02 Sep 2026 03:24:23 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b759:bed7:f8b6:ccad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e04csm132554105e9.10.2026.09.02.03.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:24:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: qcom: Add PMAU0102 GPIO support
Date: Wed,  2 Sep 2026 12:24:20 +0200
Message-ID: <178834465640.12889.17588552466171610581.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
References: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX9kKab/iPA6er
 pNCC3LBla6gdwceidycxadLp8ELdERU6LJOHcpyCbVENVi2e09PfsD8+dtQLGyKlE7ZMQndjY8I
 2Z5xWLZv0kAYoWjPH4amruD73HxPUiVLcx46n1WshFZoXl+vJY7ojMOg37jKenZ13lnkWN6Io2Z
 LtPyOtDMWsmFHWtWvRsfLOPoa3h2b/3kjSC/w2jQF4D9SMtgSXUBUYuDOVnjSMY/JfEw7ycYYJ7
 Fa1HnjC+gBcCYSvXou3lUza/svMvGsX2/Zcfcz+JWnt6MzbmNzQnJdxqyz2yXdJ+Jov4IV7lEvx
 K8iWNnyJkg1N1u4ZP9tMoTwUdWA2v/VX1nt8f1g2QXhjZ6ppQOetY3WKLhfB9xxOWwvU4ccpuD7
 ARluCyTNvab11qoit01MwpQiMzu9p6pqHstiWN4smy/IdyZfNZUUe/OiOAw/rhUB1RZnF622Q1S
 Y61y9TrcVT5r5n8i2+A==
X-Proofpoint-GUID: 3O4DNmrhGbS_rwOH5Om7yBA_f5kNE8JB
X-Proofpoint-ORIG-GUID: 3O4DNmrhGbS_rwOH5Om7yBA_f5kNE8JB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX3Ly7Xow65B9+
 FjCMUwOeoKvQ5+2d71HeGUbPv24iq2EYH2IOhrzJ+yYZOP4Q1IYjwg88+zOcWydTZ0yclK4gEGB
 k50K4dNnhNs3ITJKEsqz267/Ydn1nzI=
X-Authority-Analysis: v=2.4 cv=R9oz39RX c=1 sm=1 tr=0 ts=6a97f958 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WFjrMyYTNELkhRd79CkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020091


On Sun, 30 Aug 2026 12:29:37 +0800, Shawn Guo wrote:
> PMAU0102 is a new PMIC used on the Qualcomm Nord platform. It exposes
> a 12-GPIO block that is compatible with the existing SPMI PMIC GPIO
> programming model, so support amounts to documenting and registering
> a new compatible string.
> 
> Dhruvin Rajpura (2):
>   dt-bindings: pinctrl: qcom,pmic-gpio: Document PMAU0102 GPIO support
>   pinctrl: qcom: spmi-gpio: Add PMAU0102 GPIO support
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Document PMAU0102 GPIO support
      https://git.kernel.org/brgl/c/25f42a33ecf914e6d8da6eed2cdf7ad86c9a904b
[2/2] pinctrl: qcom: spmi-gpio: Add PMAU0102 GPIO support
      https://git.kernel.org/brgl/c/1cc8b87bd9719f5c496d27a1b4d2892947ba70d5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
