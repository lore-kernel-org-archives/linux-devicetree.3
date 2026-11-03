Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736374;
	b=jEr3YFqbINkhcl1K0H6nZb0vW1lGKitaZbwyXE9XyZ+LYb+1AdKSAOrxUUke90Fg6aEE
	 whTnHQ/niUKF+da0cApJlphQIQjORY5ScrcdTUTNOOpfjPvwYa+9uZHJg2iQ6R+ZQw7jI
	 4rtF2ux7wXYuaGa+jJpxeUOR37eFlpe4d+Z/Ef9RVnZBxR4a3jBxNmUNOagVZ0oMhcCE/
	 oTW8/YeRKPLzzwWx6Oobd2Y49NA0ps4x9E3RtaxogF80tq++qVtFOcEgwPQb6sScC/h3E
	 gX8EOk4t3uTEBCKKmhvZ//m6oz7K9XI5gHeBgjlpbte5DQMUkPWXakouAzAAKCVjqcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736374;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
	b=07Mr7kXYCXCw+pON7H1N+O06YbstaSGEJ54pP52b1Dqb4SQluoE2BvhBTkxFaKWNkEnB
	 h4QBV8fZJBaLktmyztjUHxsMeb+O2rXiZjpfaSaE+jCyOAAOJX0FvQ+uokrsfx9WTk9j7
	 Imsp6ruxVY4kOpifecqXC0WXT+C5GUWSMJGbOAsCmRbD9TDZDrZtnI0ge0sDVEB/jfdgm
	 WcvRkCtgDBR+pywZ3crzu1zpPMt8iD/ej7yfcR0Nfsv3eJUqyBTxwpG3Bmw0jvQv2bJjQ
	 o3YUB9f712l2rKaCAHXjyIQqvWuVNbicqhkcLDcKzEyzR9hsRC0t6m7LN72SBuz7IjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTPtOJ+f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iUjeFRwu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7404606EE86
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7404606EE86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dTPtOJ+f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iUjeFRwu
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3J5xPA125423
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 20:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=; b=dTPtOJ+frAPEorJS
	bZEoMEy5MLagE9LydR1o2a5KL8mOWL5LJGPzqQozeomkGsOkzzPZfAU1TZ1I20jo
	fAzhG+f5J6G5mWL8NWHg2NcmWT6SvcdqLZK184nFS2ZCg4Tgt1EBpIEFcCoX7i5z
	U5FsxG9HRlL3OqhSE2ZyJkx7Thy83SSmbuSc1q+cEnZNz+U7a0U55AtObRsyYvcX
	2xI10a3ohK5rNmDnMO9qcKPSNLE/z9OxIUFADrdcxCCyloKtxvy6pJkQuagPm+iO
	0oEYWbdgIStIQLWe8cOtOVmyB8RC2N8psgTGg+uPgC4qatSD7jAvAsoRc+smEpzv
	1qIIuA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgp8vq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 20:06:12 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b206156cc6so3289998137.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 12:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736372; x=1794341172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
        b=iUjeFRwumnTO7C4i+M6RvgCYXOdfIWovdu7k/uKP/4gkQQT3SO9jzivQls+UTvNI6S
         rgUq05Yja4QeEFZlIjoXp8EnQ2yY6DCK2HPjg9tzNJ0mYJCIaHN/divs0CCEE53pc5G8
         UzWW7S77IkifsxLzpdLYjj2mhLZM+73yRMxGztohsusaV3nz6dCV89cyTPP59R0BdFeJ
         jmh4L+Sf5o14yYycRTDq3/OnuHO+/7YeNJZSdUXQ/TE5eGBO4ZAxwuBc7eyJEOTIseOw
         vdRgk6FM2LjGHKDC2uqwxFxXO8C6gCkxS1Ta+t8bv/v6TyRhNL2G/ZNs8QZ1Sl4jPNH4
         mOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736372; x=1794341172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
        b=Qsccfd7t717MSZjTY84zt8A9WPUX8hypW8culJORCKBOAALxWF2sFn7GyRzJU7FwXR
         bqUlqq/uGUUFh9KbVKCwOIqT0bBm4k597Tga54ojZ8ftJ6ROBBRgnbFR43UAaSbt9NVK
         4O2SR2wqhVwW85sm4zfSPmORQHH+bcJSuN0lugLbesg91XctCq06SYXdFoQRqqtLMDyk
         r17b1wSD3A5Nu3ImmoZEj6v7Kz4pkRDq/Pomll7VBMh9mRiN9+4gRfOv4aKgS/N0Y+JK
         29TZL4RWq1aK1Uun188tHZV9Jj0bkDTaLNml8MFvNZx4/vQB3151hBpFb9Ar/p4H1joF
         hNlw==
X-Forwarded-Encrypted: i=1; AKwUvBwIWgOyS6KUVcJBlqk5xUAfoP2U7gh052OgRD4h1M0Hz7UYowlLuo7nF8W1MG6PPeNE/DuHWN5MoRih@vger.kernel.org
X-Gm-Message-State: APuU4Z+rH6r6kwPJBOvCkYpCDLu/jL5iBiLt0dAsas8cyf2rCe9MS0bl
	Zw75zaxNfIYaQ9fC4ave/6cP4mabOyKgrYFmZjWZDASXDVGPch6UZ+smrf9fn6eAdD7nqta/ett
	VcYC/ayDbGz+Q//4QRTO7V9RHRvgOu9NU8ktSD0koxvIMcAbIEbidubMVEhf12yKC
X-Gm-Gg: AYBFou1GGgCKqm8YUCXX2q2slF015H9tk/PAqRfWKyMUoKKwt7X15Xw1vfotf0OEzr9
	Tpu51+5nk8P3c2tEkn/jrnV1cyeqHqR59mFuHUFY0Ua4bv0ulkPUalLe5R2kRviaUslQZv2hPl4
	gGfF8wxBCGoDWaFoss52MEUn8z2zl8gD2thvr5w8vGjN1pw70gWoTmn0KkTovt28GCwplpHrwHf
	Sa1wBMb3mry+hFBjOZBaXTaaPL7lqc6MqJhnv7in8jkj4x1qxGGgxNUt0B55R4oM1lWxtUHjZwR
	BZNLZPIIBMN9n7rSLRI6qy1RWhnqYZIVcjLzDUuJwdvvYk5IGxu4WcAsu02V28UQqJpwjAUBXZb
	N19yJRaA6RWpxiC6OBXfNR8YHmahPGBCPp86c7eEcE7fOmVouEXw2EMlUyUpxK+9m+dMq857rf8
	ai5H4ygHzO/lGkrcEjA9RuS3DtMdBwdoa2zSVrcGZQVNYKExPOyj9FGCLMYkiHADjdgmD4k8tsP
	69wKN/BMR52OCOK4r/b3wepFr8T
X-Received: by 2002:a05:6102:580c:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d072bc7564mr5895192137.8.1793736371776;
        Tue, 03 Nov 2026 12:06:11 -0800 (PST)
X-Received: by 2002:a05:6102:580c:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7d072bc7564mr5895172137.8.1793736371275;
        Tue, 03 Nov 2026 12:06:11 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:06:09 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:53 +0100
Subject: [PATCH v13 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-camss-isp-ope-v13-9-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfXyMnjjvzOaH+Z
 ftgQdHtieSdt3+S0u5LXeF5H5hNClgoDg+QhnzOk3zrqcAb3syOzngGc7a/lz2I4kzGGgSo7v0U
 eBEXo59s/E212iCoQIkjCDaFaYj2krkV574GVvMv+ymPtosLTtZmr8swgD5vxdE0nXMZO20VW6B
 2/HD4riZhKc8mopBFRlcQQyuZ36S2i5BxF9z4/fxDoz1k7ton4szfKa7/chI22dvlDorB0+6a+N
 oLXFyUSPtqi9MC5QNewQ4AQVgZmPiyhWfBruV0vccnj8/ExTkhM/u2+L3mr9qdzTK0Hwanqxpa7
 eLK9td5prhcLuAi7FdaBszMeKwMu2MI3dyic3NiPxqlI8uccZ1VXRAOt00NXe1JWCh47rNWpakA
 hAhVmUvX2MnkW4iL3FM7mCbqZeqsdExst6gOYxCWbCFr+vZBOm0htAENIB2VEU8BgcDUdBC3P/A
 3cDpgAX3Qdl6LD6VUPQ==
X-Proofpoint-GUID: HcPjVDmMuxU0GggvvTXG6G3yc9qmxsqH
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aea3eb4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=MWvNLhr-pL88feDBzY0A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfXyr76RnNqZtVK
 HzjbSTeaBmw708yZ6TdnDLWCsF8UNROo6A0C0oihM2jJxd6yz1T4oOgVXK0MRK5TvEDgXn0abSx
 vrEq6EJVhpEUJNUSTARoLxEOAMP12HM=
X-Proofpoint-ORIG-GUID: HcPjVDmMuxU0GggvvTXG6G3yc9qmxsqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030080

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Link: https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1/
Link: https://github.com/loicpoulain/camss-isp-m2m-test
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c440c7912f0a24665bdb7010d9e4..6ce0907bfa8eedccd05c91dca45ad7c18fdb37cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -942,6 +942,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

