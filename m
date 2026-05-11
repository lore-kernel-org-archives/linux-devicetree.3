Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E59A38331C
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538273; cv=none; b=jdRU0b6Mnu7aAXjzsAVwcpB6xVd5nCniBF2r50sviyC1Q8pNbHX1uBJo8YHn2nrJlG12sziPzKLdm+VByQLPgH3lKMfIlCiYk2NN0mQSIAZaVNV2t3JJKhhXI/FE4sKFyj2U0IXmioTtK8rSK0GXEBU8u2FF9BXGswCM9wNXeJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538273; c=relaxed/simple;
	bh=iDb2uz96prvOPreAW7V7qXKBMuEzgLkBJlRJSuUvUNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cv07sr0Mn5d3V3bufI31jYqJ52ndA29WJ5dZT2RLY7qY4TCrAk8dq4P3K0Src/1ZJsv2OD3wev4pj5xDyxL8KRdmsvYsNfqDMLxVrXKsR8u36TRoxgsK8iX70ENns4bswwDQ1OCcmVKOWhsLGuUtdPV4unf+w9nmJATkHlX+QRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZC/G7Pte; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSepMl3m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZC/G7Pte";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JSepMl3m"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6ngq2519114
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ZYG25c/7YbG2u9v/KfIESsCF0E346q2C6Uk/dm+SG0=; b=ZC/G7PteSvshWYCT
	9Gwui2laiuBm9kj/hxGxf0eIf9fBSDWUxRdNVW8o8iQdm2xptrgwbqmGyjFXV7sz
	2rAKbMI0yuhUcuWWjdHZkj1aCEC+MbP2wg0vBU//sD2XLss0pUYatEvYE6ThAHvb
	oo7R6TLFSPicTu2u4au4A/M+YAfdx6ahgcWIGZJufATwrp1LRJgsnk1YyBfVUR1T
	mw1EYv5f7wsHQVIAFww+tFdPDfkg27E6Zx1og0xYCBQ23ajaHWtVDUDK4vwxQTuC
	UhkJTt1KVYtIyi8fwV1+sUkgj9jXCVd/zqbXQzzWbx5gpyigYPwrAjnVlEBlHSEp
	xCKxsQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1gfpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:24:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so5966487b3a.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538271; x=1779143071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZYG25c/7YbG2u9v/KfIESsCF0E346q2C6Uk/dm+SG0=;
        b=JSepMl3mKDW1UMR9dQZqluMpkFTYOPyVBt5SAvagSsGe2zxCGVKJnrOi6Gxfi065Fy
         J8WWDEip+ZeWomb1HM3xZX4QXr1x9g3gGLqvlVPWqgqpB96lDo+S/i6NN8DLFWD1zpGl
         DenP3eH7v8r3+U2RBdlNwttsj9J2FvXzRipBYVFiT6s6h2iRn/ca3p9OfqaxCiBnd01e
         yNlj7KOdK9jStwMxSLdbA6kVa4UFjG0Ag8GIxCR84mS1B4dfzgJZ7FqUocbAjEJC9z9N
         oTY5ktTUsvWSjKq7qE41weNeeD9cn5SaB8KUl/3tuQcLm9b/7cErYtnmkchINDmI9ihn
         9wRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538271; x=1779143071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1ZYG25c/7YbG2u9v/KfIESsCF0E346q2C6Uk/dm+SG0=;
        b=T74QofYPrwzc5vbyAVPvdlBnEkciwertNoAEy2lCUQIZjQc0dp6RWfo0Xmiyy1W9uw
         ewEnmqpVcPLOYkzKCo4MaQynk8KwQmgY7WPN9yjDWAB93mAISR/lGq1LZlI43R5LNNBX
         MGBbRE4h493cCPwJetbpk0wTgJIzRfwk/TJVqQV/jvmigIkwKQtyP15QKeuPiuPxigQT
         62n3EU/uwwjaoA7C6634Ck88//eR/gCkK1L0wetwBDXPVlhXdDaTE/kBBIQEba7TM2XE
         KzPJZDkGx3uE9Lwnnsp92XqetTQTmXRprMzUkVLy+oejYXdswSDNItMT8WnHIS7gOUAw
         hZSQ==
X-Forwarded-Encrypted: i=1; AFNElJ8EyRCMfi10HsXnUS23zOqad4qrZNARyDz2yrPAmPVUA9tyDh1yA2UNv097TzprX96KQguKrfZGQwN9@vger.kernel.org
X-Gm-Message-State: AOJu0YyM++lWuYhXrj4A8z5eDl3ly8iOyRovoSoubeEQSXE7v9ua63u+
	sgIn3om1kzw/9UjThNwD2mBZzS2xUJyLMjUQbnVNIzIiA+PYY4ligK+FWir1M/VK7h66EQV5z+u
	qZEtGNU20/yV4k2wVT5C4FMS4tjJC/OzKIgSVzcLnkU8HmnA5+CRjTB0zNaeZUmxg
X-Gm-Gg: Acq92OHv7O4W55e6WDW4AAgRqwwqGU6zhh0yHBYb5er9eO28OWob8kauoQosIMe0igC
	J/59HWYex1yWc20bN4WfwtEhiBUwwJnQvTWuEl5FKNVOaTHdh/1AlwPEls7WC2iu+TD26IxUZ7V
	tnawu4kC+W2tr6h/zezZE9kOtqIcas2sk8YXdc2HbGQfv/HQy11DOTpiSnpQpgdN6E2FyZrKYCU
	IytCtg1Q24Jy0rY4US15ftRXPSW2MvIkGpD7KCkIv7okuVEPi44MBjeuP4wbjmmf095uk6ukd2v
	euoodzz3LNpX+yYEFiCCHRWmpD4Pvhy2Cf5hesmjGO8WpPfyVgxvoOqswtOCA99IZHPL5seT9Gp
	8u+umblC/cbj6Y6ukTvhE+Q3vu+/IRhO8tofbsryfkribIA==
X-Received: by 2002:a05:6a00:35c3:b0:838:127d:a161 with SMTP id d2e1a72fcca58-83eebb5f055mr337125b3a.18.1778538270724;
        Mon, 11 May 2026 15:24:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:35c3:b0:838:127d:a161 with SMTP id d2e1a72fcca58-83eebb5f055mr337094b3a.18.1778538270230;
        Mon, 11 May 2026 15:24:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:24:29 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:21 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: kaanapali-mtp: Enable GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-7-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=783;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=iDb2uz96prvOPreAW7V7qXKBMuEzgLkBJlRJSuUvUNE=;
 b=4L1Wf2OEP3HGXs8rkRNKP6ek9eUFrozE8QJtVasyeMz6R2v98M71tEUIV3XtOxqXKwovkzpPV
 E/IxoUX+YlzD2Rsmsy46DBTmOK2mKwzeMLD8gf2BtnmIQ/LQd2gkE6P
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: q-NUcFpEO1AxXhpH4UWozS4d_H5j2nJL
X-Proofpoint-ORIG-GUID: q-NUcFpEO1AxXhpH4UWozS4d_H5j2nJL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfX2REhcjF+iTZ7
 qr1oJxmEJZnUl/8jjmkMJjmh9+0NjCO0OSkEiaIgpQ85nVlqYEcW4aYSouYMC28XFwwi1ex3mQa
 2qe7Aj9oHlJ14DpBsXyYyXtasCdHsftthCpIw6zDhiMI9mC/Bo6M5P53v9dT1bKUPY4/bm48G/W
 HeguGLD1OxVaHWLqaPpKJTVERabgfDr8YQg/Fe6zyLtNTetVxvSA87RegpSXmsPpXHDsQ8ZZrrE
 1uemTAJvQxSIBPFkserX1rITWfJq54w/oI4sHcVaDWEqMEBEJCiMKBIJTyotwo/J6a2L6OnUGID
 05UcjQxGDDulr6GMzAevmb+Wqrm3yhtgMHcIskJ5P25Gkq7Sht5frgawF63BbHAPDIwQG7bzFca
 0B9+fUlECdPoCIkPaVr3Fbf6JwaqZfwKm0k6EIYrX4HdGx0IHQ1c21lWE8MswSaNmDshHSsraBP
 RQUm43uJLA+h36yxGvQ==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a02571f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VHn1p_zO8-rooJRYzQAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605110236

Add the secure firmware name property and enable GPU support on
Kaanapali MTP device.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index f9b5b5718b90..ba256039dd3c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -865,6 +865,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.51.0

