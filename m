Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76D93546C4
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 20:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110985; cv=none; b=AzH+3/z68iY1xnghyLDszYYSQEUdbZWj71xnqisgTttTeXKeVFDlJOOebBnKBab8IqOOYHdBPpa7FugSdOd7zBAwUJwJ+eyyjQ5ai/cwG8qajE9JHCZrbJn2LrPKx8CipYPn5LimSsD695emSE0CP4xE7rKtpOIlrw1BwHi4YFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110985; c=relaxed/simple;
	bh=t3B1LGfw1dSrLsUJhY30F7R7B49EhUVLYMXvZJRb//w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uKXNWHzLCXbGg0HqHzAzDfTya16LiOJamX5sY9+Eh6ZNSpLw3kb3HFyiy0ZT+Iy+q0maamFiLzh+LQtnd8WQfqwWM/vabGgOSzVt0XW1r2diUSCIXDi5WLQCmLbgKMfMLJw9PRXsKzrAZ5Whd5NbL3JaeNc1euanOttMFt8qgOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NJ8mtjsQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0h/rb/x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NJ8mtjsQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0h/rb/x"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPaT9972994
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 20:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dOV6SNjFzG9X2tjzVk0oMjUqNu3RuI4o/7x3sDqaJQ=; b=NJ8mtjsQ5uk3031c
	1sHML28nZjDSTULG5cmU9dYBC52+Up47/RZ8EGa74eXGgGXlHkX1mRPa8fKIcB9J
	kR8IoDLwnkQisdxw+Ong7g0TWTtOxA8GLTXhi2VEMpEr12KUPnC3fG43yrkiCaoo
	on7VFUEktt8FnhCPil5kln5tE8FFOKp9GOSLkjWwhz+ZDjrKGlk4VVw8W8o8b7yP
	bkxo/wD8LklfrJ04RgY1ktF8i5vEj7f4+BELFuXzWhc4cgJPdAdNiqeGhx1NgcYs
	1eusB7Up1EI1OmFDAnGb1h4rdFaiwZGIaVD4lrqak95amlcOwWoprQX+T4IKzTpb
	C8Gefw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6b03a3a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 20:36:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88da04b719so692135a12.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 13:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110980; x=1783715780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dOV6SNjFzG9X2tjzVk0oMjUqNu3RuI4o/7x3sDqaJQ=;
        b=i0h/rb/xXcCYSXy5s5uQmPVwnbv/t2gVY9PmVnBEsquFxGDKqFZ0r2HIZ4WfbX9XgN
         QUAJXYTZUDToaCwEpmtwof2OtIhaNvuPfGBpIWyCOp1Mwges5z/2OoYKxV9v4ScrWlP0
         1zl6z70vUqZIlm0d7PNIMJv0ldW0gi67xvZP3ld4fQZYVSMXVfRj2i7rVyJN+V5xV6AK
         8jG0DVf5JH4OAqeSJIA5KUfiuzoNo+F6wAtfayb3wTBzVMzCNHA+S+H1cel6dJu9p6i9
         Jn3WkxbwwGjQc3AhTWm6k+k3uKHRX5kEWoQDCgvGFwkAwYyUAT6Ed/+yXpypAyrUXI0W
         fMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110980; x=1783715780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dOV6SNjFzG9X2tjzVk0oMjUqNu3RuI4o/7x3sDqaJQ=;
        b=TxaSpBEecAeB+5lkSlTxUFbfLkcG0V4xMqmnjC7ArSD5ivZeLazOJLYup/3svQ+SCg
         w15LbvgqzJmLh1dva5Xz/BN1EFNsiIRtnaS71QhAygZGfzDoLmW7R8EwcE/ygVW7tICA
         AcQU8SUKW9cOFqFOCvtZk6Fe1ip8keE4ZZzWQpsoK8pKq1Uu0dcWdbHMo4mRofNItHPC
         IV5WMFcvGmEwkHFejCltUU/1CT4JMoM9xAa5Y0Elu1+Wy29/OgAOTXtercQkF4bD3XL5
         yinRK9y0HYM4TE9xrV2MSipzIqsN9jdLjO+DYhAdy/QDH1Olbd9WFA+7UOHDmPGA118l
         wDUA==
X-Forwarded-Encrypted: i=1; AFNElJ+yxl1IKR1DohnQGERrukUY6hnDKKQ3s9ADLDAV4OiFftRn8IrgrGiXOackmBqKYXiLgaSLVY30DEFy@vger.kernel.org
X-Gm-Message-State: AOJu0YzKy8zU+1kvt8iJqjsSjprjrRa3k3ZUd0DdrP1I4Xy3S9qUC/8q
	huv4z3nlhSCRNyEGbiZZlIPdLCmQJ06jCpTdGYH6lDLw11UB0r/53hnloowqnjf4XSJ8jXkM1YF
	scwB/He9NXaFkXuFb8zZn8mJmiIAVPBceURhJPKfUWioNW1glb52K91dEGV8tbhGH05ro0eeo
X-Gm-Gg: AfdE7cmrTUcKu3EPOiJMZqamS8VZTFycjcyH51B1YyeH+R2Qvoik5a0gEvprtEvHyjJ
	rhBxurimOAhGJ4ZxS94xbweEEmcy7OTHgVSaEaCpMxLrdr1c0HSu+Uvb8pHnasKNVCXLhno/9fL
	FonstV0ZtlfYpkGxCcynT00vPez29XcTtTyO9QWgxsK+tyY6CT6SszuR3zAgNqBpn+F7ndWWwow
	pZIntKnFyLSSmNakgs6e89Mr61nmeOosNVB95c7BqVJfEZv6SzplS7xKsk0wtRnDSzjLcz/vrOB
	eg4GDMCduY7fuLXR6Eo44Km8pYTasOt1aDtzKOk5hSRQROQSbVg411mME8aHMmT1AHqbQqmdLbx
	kLW3/E+hnY0gpGVQE8SsI5E0w3BDc3KePDKc=
X-Received: by 2002:a05:6a21:2983:b0:3bf:aa1a:d303 with SMTP id adf61e73a8af0-3c03e5941eemr781924637.49.1783110979733;
        Fri, 03 Jul 2026 13:36:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:2983:b0:3bf:aa1a:d303 with SMTP id adf61e73a8af0-3c03e5941eemr781871637.49.1783110979257;
        Fri, 03 Jul 2026 13:36:19 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:36:18 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:33 +0530
Subject: [PATCH v4 7/9] arm64: dts: qcom: shikra-cqm-evk: Enable A704 GPU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-7-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=894;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=sXVW7HyYn+zboxV3uVHhdySY2TiXHDOOKyfpwcYtiUI=;
 b=wYeDLz1Q3es0EoxTF9BBwaEzt+JV7f7Dw9TzAL+RcikJnuzjboL+RivQ+2cjiKzDhlI1C6Fhp
 /ea/aVQfkA4BAyda+/hRZFvmLi52/KE7U9JGNJ4rGuOGiA+uglghbOd
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX7BejYVuuH72c
 FJ5vTgkoIZcK4yqW9l4pIDUCsAqZ1A2qvRPEA3kM3D1WgcV9owgW0DS6kEkV7Es34mrWSiw25P5
 KroNdfGrAEXTVJkZ4okTNHRxqo93r5Y=
X-Proofpoint-GUID: GOxBTouUql6Pu4XarNv_xYGPqxlK2k2I
X-Authority-Analysis: v=2.4 cv=FoY1OWrq c=1 sm=1 tr=0 ts=6a481d44 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JW4bpjJLMT2bmMDKeKQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX45zkdFrnDKYI
 eWSjGe1EaERFBkTiAFgpPyyd9mJkPupX8sUr5m0bsXvaRj9i+T0vHqNXQCGX4lZdDeUTL2d/sWW
 MvoINufgcDFsgh+UMZIcXEx96ElN+6Nr42q8K0wnR2F7dXxNksdYIiS5tyC+kRJvIb0qD5JAini
 E67SZhc5mKITorZCgVYKg+4FRFqeI5by4T1/gmH2WTQ7Uc6xjr2FWJAvkYlsLIDZ4sT5hF4P6jP
 Ibkj+6XYaetJK+bwGNNxobgY622QdBcUQO5IP89CjrLUzy9xF8wUjbVvbIGpu4+YpDgP5V7hz86
 btJuQVWRgAfbb0QO+2p3giDuxjHnf20hbHa/vXb+fg4cQ3yiqSpBoJ01xW+xJB5pGb4Cjnepu2V
 55Bk/ITmyBHNASOkxkQx+dvLQ0VhdeDxoFa7AxW26pFoU8fGiJCMxLBN5aTV/QG6Se1OzO3L67D
 vcfKW8wBX3FmOBwXPhA==
X-Proofpoint-ORIG-GUID: GOxBTouUql6Pu4XarNv_xYGPqxlK2k2I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra CQM EVK board.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 269e11bd44f6..8206dddcfc75 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -50,6 +50,14 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/shikra/a704_zap.mbn";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;

-- 
2.54.0

