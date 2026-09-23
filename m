Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30F748E0FF
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159300; cv=none; b=u5PvOHfTWSazRU/y5hIjvnmG/ClZ/tfp6dN5OrjZJWzXrBR8Uo7BKqgx9h/x/JciASW1n9xvh/k6Qt6QT3jTT8dnxTFz6UKMkPcBX7HQinP/qQ+IxaHHi4/V0+5nXOXK5A0w0yNTFJsgdXC2PephePPS9IlFyMdauTTRZTBVu1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159300; c=relaxed/simple;
	bh=9Iu2RNmzJyMYp7GrqKtMQuY4sh83/4hGFSK9f1mwzxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZbiqP2EmC4Qla1DWb+WpYb/4W3+DH7i16RY+XpXvAEV6zveML3/VLEOO6KXAIQYd71Sa+OB3LTtocW/SLq33yB8Lsvtv//F+jsxgLm1GnhMVdpiG56xYUhRjf1jYfwGsO9WSqDCFiANP/PUOjsu7du1AJ1dayd12tbCyIaGf45w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSo2N114; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZ7x4tBV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSo2N114";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZ7x4tBV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA30Wp4087726
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJOzJ9srOMosaldHRAHYeJVA1bT1kfaQQ3r/rKqtz88=; b=VSo2N114zfk0G/zm
	OKK8Kylhkp43W3IJph2g78Yt2TMOBvBBiIZAK+hwS7ewDDeLS6LwS5gEI6Kfu0X7
	d5td/98TptysDM1TEjzlYi+jfBDRBTETjzQgRQjp7Psbwjw4bcxtIPXR4RO+HFWU
	Wwf+2HBRGKJzR72Idpqv7GltaUNyAgkeVpKBpbCzu5CjZ6ELKl5D8gfn/x9Mu20t
	mr8DOmzUIQJVpn/3dckoIuKbjSZwrX0MLcdgkPOuU35PLqgD9VvqrC0AJccSsGRN
	dd72pJF8VBWy3+ajYVzqIWb17LDVqka7kZ6dPxltao308DQlxrWiuv0VenW5JJbu
	AWqFBA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c3vqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:28:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33f01b74124so233263eec.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159282; x=1790764082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJOzJ9srOMosaldHRAHYeJVA1bT1kfaQQ3r/rKqtz88=;
        b=KZ7x4tBVCtEzJ6/N2pjRxQXJ3Kngmw8iqUIrPP06uM0mEVwyf2PyOA9/DkuDp3F/18
         jwSQl5/Jox2RfBtD7tH3cTgvGICB4GL5JxDcagWTcGNcyeYspsZZR2hbpeCMPJcpHhg0
         bv4cOzUZa/FDpO4baN3A4WGUXga6UWa40Gt/WH8nTaPG9zPuhJ3cz05tHtlhf7sTKTb7
         vrIWybXwgazYGvqjOaBgNWuTxS6RjjS3i8+fqn23qC8UL3pshTHYn9Js41w0zDxx/uXT
         VXrizUU8Tb+Ct6NrBuNpGJWprHZeL+6LPc+w8xDCax7iKkgNLh4cjsw9DkvOrCZy/x1U
         DuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159282; x=1790764082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJOzJ9srOMosaldHRAHYeJVA1bT1kfaQQ3r/rKqtz88=;
        b=VCCdJMZ6MqhBb2isuxdPnRjqbOFlJHlYpQ1djVbZ+DFp/oSAzxw6a4BcZL92Yb60pI
         r9ZkF3u8b7EGyp9nBZ0omvyHmz5x1QKYE9fyd5Ei5umjo5QAkTBOgAUi1iwB1LAunk3T
         jURPtIV1Wm4TPmI2tFZ0fKeYXmEndwyJhprS1qllW12jkXKGORFt44C9cGjlRTX6VNgU
         tB/s8fjNpjWsBwgreRTdfAYQ56z9+3qaw5i3AzWzDRbiiDDOqYoYQ2g75VkUPJBsMlfI
         xmCve/qas2RGQjniUnU7arniw7ZT7pQh/2wbL8CoK86A6NcAfNqNGj+wp77ihi32j7Ib
         5AEg==
X-Forwarded-Encrypted: i=1; AKwUvByRzaVf/atxh6MdRV2bY0Qx4DO3OMkmyNWBZ/fkAPhfVQHjQ3NamRuiUIEwMqgPl3J7X29Y1jaMEYQW@vger.kernel.org
X-Gm-Message-State: AFuF++m+06Ky1sEsLJ8leXRcw92Uku+NQFziLEI12cpUQPLijB1p+hZy
	kYnU989AwJmDTWX1I2dzPBPz4STWECE1Rw07IXoOHg/H+dDLyQ0ZkqOGeIvAq2LOD1LUO6wkofZ
	qsYdvM9X1ZJrqEmlXPirEvrluXUv+6geSRGwseYn5tWpJQ+wOMoFIXkyyg8HmsL9z
X-Gm-Gg: AYBFou3fZ6HQ0rXMHdnmCQj4H4TBA2cnxnneUtprUiwi2qEnU29PmRWIsUm/iuXRoGm
	BlS7BGi8WgI1/jz/bUaNXhgouGpBj3K7TAa8dmGJMOny9UYjsDWJy9eNiRvKJWvGxmMAkHFp9jO
	6wh2WmjMmOQHLo9qlqFrXwpJgSkiiz4xtv+66aO9i7jWdlJct3uEWBqEehv4OuQRQStY0soLwXu
	v8lWAVK4TYRURdhRTncLCPU7VGHlOVkkIpvg5AYX/jCU7M8zLGRnQSKyCaUK8COH7X3Fpyz58Qz
	D7j1d5ab8e32J69Nrwq/u4HBhgv8Mlf1cSpfnYByJEaRrv/tyRv10jPYchsT/LuAw7keu03+R2L
	T9D7AdbDk/tH5jfC31cD7Nbg=
X-Received: by 2002:a05:7022:b051:10b0:144:dc45:91a2 with SMTP id a92af1059eb24-144ef1fee35mr2380578c88.23.1790159282491;
        Wed, 23 Sep 2026 03:28:02 -0700 (PDT)
X-Received: by 2002:a05:7022:b051:10b0:144:dc45:91a2 with SMTP id a92af1059eb24-144ef1fee35mr2380549c88.23.1790159281883;
        Wed, 23 Sep 2026 03:28:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:28:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:55 +0530
Subject: [PATCH 15/15] arm64: dts: qcom: maili-mtp: Enable GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-15-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=777;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=eKiUsBNhuhpANIu3zPjDmXfBzq8uzmsYtvGThaw8i9g=;
 b=oTucU2pHz+0kJn0XJLB2P55JznrHw4kc2XiOpgWY9Y4niLKlf9mz/lMqhVAoHQaqpkO+RLoRC
 V7ojlwv33lUBSe1R5puE980u2yX89hfBmI9gLIGacE3GYVLxIQRfgtr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX40KtiFMyGcVZ
 Bvce8/3TWH5NdYxjsSCduf1dvfGA+yi1K9f8FMwaJqAk3Vsc5HC1TIcIAiUHplMdUbONRPuWp5C
 8Qf8kaX0CfWWr4SJaf6hbv/Sx1p58qP8QkDHHiheDmLGqYnN0XjsbTVjtMCLPsjMy6rcQLVLZUz
 0VDFgE4ScXQjckt+986q5CWsz67HT/7vCsItYW6eKWE9yzYZEnetHixT96yX84Xtu/WNcOH3yWi
 HQYaSnbtwkGLKYZykcaXTuIGWCxWntsXacyUc3VK75SKSCAYxL2CriGh+Nusf7gFG70Lzwc44A+
 fslAzJ7NWB79sLJPKBKgDIsRz3UD6sXPDRW+Mo+AHDy8m4u+52Brb1c0HT7wRHhHAGy+xTyyqDo
 gk1phHf4Yf5s8P9gQ6Y76o/DzZJby2Ut+yyxcwzxxWE0bEGk9ZhTh0TnVctHegReCXLVuo1gYr3
 Upw66I3n0mW3Ho6VMCQ==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab3a9b3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=bOBbJXBpTyr2JeYZIkIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: uIjKKlrpd5EoamE28PGDvu1dqyPgitCZ
X-Proofpoint-GUID: uIjKKlrpd5EoamE28PGDvu1dqyPgitCZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX9LayWHCIfDji
 Zq8Cr2BK+pjNcHF3T+XIZvLNvhakiemkfdHOmzgauyRtMHjGeEXvEkmPhULevtk72S0tMMHljLj
 Wnux1095zJKUjFDVs+Ko743ehxxUBJc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

From: Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>

Add the secure firmware name property and enable GPU support on
Maili MTP device.

Signed-off-by: Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index 1fdc91e03271..27facd4b2a13 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -908,6 +908,14 @@ &tlmm {
 			       <211 1>; /* NFC Secure IO */
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/maili/gen81100_zap.mbn";
+};
+
 &uart7 {
 	status = "okay";
 };

-- 
2.55.0

