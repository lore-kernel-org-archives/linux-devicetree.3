Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086429;
	b=jZDCW6iPe0z8wqQxZJlDMtlyvdXtjM5cpgulFv3CN1SnsMoaL+QO8tIye7ZHPg0Sohat
	 +3KXrRU6kEVKdtS7VQxMCixPj8RW8acLXSza/jX9YXECMOkIjqCeLloVamZSHKf25di7N
	 2JPVDrgzFmh8PIzfolFtdpizzOy3aXI0DSF/d9FNbk6e0to93f2sK8Y9h3f61t2g3F1XH
	 RyKwWHW7tqE65P9jSHEW32K4NmSgOmgyW4zoVMYeZvWvPTJeez4wBGuUzLGCx0BWfDjGr
	 hJFVXZP23i/kRQtUc2HiH5OrzUDITjOc2ky2zbrUho1FmRZnT2PjZfFEgAEwGQG0BUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086429;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wwnouJYD+nzpJg6HWwIkDfVSGS1KUb/CmR0yR3zipz4=;
	b=kXY+UsfjeNhGlCzDddFFK4E4jbsPNpRtGRe6mrUiO4l67UVqIBaCHHixzJJoB79IE1q8
	 DYHDJOT8/1ZQvatO5lm+pmACCENBhp30Hkmiwp9jJysnGCXGCqa/1Umr5IIPlcFdtuW8E
	 n4Rkzbv/cOt3Sn1hyJgicyFUpAvfqc3NyZ/oEpi6z6VTjDzZwlpY1GvyWm/DRMOCUAgGE
	 48+ohChpLWxzmIM11Fr2hMQrdB1wdpdt1vwJFeiGbJOlG0RN4gw4KW0VxHN7Re3KbcbiV
	 B2WcBNqulGjq/EVtObkOtrhpcIiG91kBwRSdAUHCi/mHtjRadp+5lO5IwxodZj6Hk1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q7R2roFX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rz96YG2x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D825D606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D825D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q7R2roFX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rz96YG2x
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R7Ivn11169118
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wwnouJYD+nzpJg6HWwIkDfVSGS1KUb/CmR0yR3zipz4=; b=Q7R2roFXRZ694ZsA
	oTuUuzcpbi4WErRSIKJ6v1VmZn8p0B1ww46xVLuB8yzMkDtKWr39blyalzr9j+Ja
	t9r5K1f5BEb3dP3j18GTrQLPNYQB4LC3noy33hHtRxfcAlDGQI2KhHEhcYZmzuDl
	QXP0oHh1mEPdrf5WwaDtsL8YShM/QUcwxEh2mXCZ2wJgAD5dBF0AUyH6sHXIhzJ0
	cC1t5XR2Y8yrgRowx6Bp8rpky8nJyGZckfu0GvHLFbwMswBiW9EK2q8MnR7On1OH
	50PUEjIPRoy3sMADroitJ/LTM+jIfy20yOZ2MWIHs313icj1OVY7QMMzND1oIFLC
	X1SFfA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5r1n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:33:47 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-49e5451d6a5so4646064fac.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 00:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793086427; x=1793691227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwnouJYD+nzpJg6HWwIkDfVSGS1KUb/CmR0yR3zipz4=;
        b=Rz96YG2xrpFcXPg6hEi6oJFz/6HOoOO9JeKiP1GkOaHLAbxohdJxH1UjegUzmKfMK4
         edmvaVbszLfi56bMQn06RV3aSRtDB1ntrScWebcS9erYjhH48NNt76cCG9ZCI9YtlxQU
         rcj4aq4XGuexEHKCKE6C77EgRQwGMVJUTXWwYsWf5fstC1EJOkm/8d7njx64hzitLBrM
         0hfWdlguRjM4e5zo5cCef3zGbKZ0Ew3+Ujs+umCbzi2IpFhl54Wp4L53VAneQF3GOsDq
         h2hwFufotcm78cRIRJVtijL43z9cRgrzGXAS+4+tb9zmf06w7v5Q+2AnjgBeIKEYfDO/
         NN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086427; x=1793691227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwnouJYD+nzpJg6HWwIkDfVSGS1KUb/CmR0yR3zipz4=;
        b=pERltkqVsj3TYCCVNG9L6nPaqGoE1zIS+8w+tuHWCpPPecO6LHZAHT43MkqYay4JbB
         crlWs3vOu4tEhDp7Awd3G0zHa1Z+ftAwpLxFr3YiZ2rEE0JYWdTfY9sKC2EtEc2ZwNvy
         c7pcHog9eFnn+TF0p4OrLsxEb68wRHEMNNYtFDaFPtaC3cnBqUfO7BT+ERbmePDGqPH9
         5mhyaFBLkj1OEgkW9sSToXd0bqmLI+A5hujEJmOPpQOEygZPacJe+RyiW3rAGJ4jo7Us
         +qZoFQtshJsG/B2StOp7zy3530wCHBtrJBYh8ABHLUrKNpFncoTmXKEEBp/5qaWUoG+V
         XpIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxN64t7ePKCK5w9sWST7Z2CwmNXJqsHTJ4yByytl82SkIeSgt2jKCS8uNbAUx7RDTcIaLUJF84qS19n@vger.kernel.org
X-Gm-Message-State: AFq9FYITGm8cwcdPEB1OFpcrnp6ALFjixxN6WtkXW5/kYN6uAkfVExUD
	K2EZiYAR17POchhQ8sLAvlNSqoJYQWIzgQRpXAyNZc4xJWPfHnQq90N1t+BwK0UeZWpjgYVtTdj
	8RxuXg7/L4v5axMwVBmhkhSXuF+bYxYzZw17lvxbJ1jiqYrlHYCZJqrxwLO1q4J2z
X-Gm-Gg: AYBFou3lc56o0/tfa0r8g1RY9orZ1jrn/9UdBzacif90PGd6Wm3wcbrnX2U8HAJsFL+
	eAv5OOW5NtMqSGPbOP9pj6Acvqg3FovcFkmBFnT4HTHBHNAqRfM9uhhnBKq1c6WrjYSllNrBnGl
	3jiUe4rRG0QWP5clYhrbg+KxrSnCaMq2vdzSSqYgu6WBiuS52ICB3x2PTmgLmK1mLHakHqoAsLS
	2IpeyDZfS5xHTH5EaAjRnnRRPJsH3diOo8tlgMBQ41224UutvqCBLpoxUHXtdoLyG8ICv/8wLFg
	yDe+EfSIwK3t2E/CgUdVjCsUz7dyGdF79aJHJRpgIwxFkvcZ6LKLFEkhl0IqgX2Ca4o0ini4+g4
	jOrXbzbN5Y8SsqMQ6EpN/P0R2dFPiL2dF5H3BzfSZssKdYeroKF6Wr9Q+/ndIAaz9
X-Received: by 2002:a05:6871:5298:b0:493:8967:86c2 with SMTP id 586e51a60fabf-4a83f4eb4c0mr5116191fac.16.1793086427283;
        Tue, 27 Oct 2026 00:33:47 -0700 (PDT)
X-Received: by 2002:a05:6871:5298:b0:493:8967:86c2 with SMTP id 586e51a60fabf-4a83f4eb4c0mr5116170fac.16.1793086426651;
        Tue, 27 Oct 2026 00:33:46 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm6181923fac.15.2026.10.27.00.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:33:46 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 00:33:33 -0700
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
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
Message-Id: <20261027-mahua-surface-laptop-v2-1-7dd903a12d22@oss.qualcomm.com>
References: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
In-Reply-To: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793086424; l=712;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=I5VGgvURKCSh7RVlYn3xw6pmM2/y68t8tHmKUFQr6Nc=;
 b=k0RlEAFG+6mYw2LZ2mOH7ywRiIRgsH7NO3QjxcnAGxl8AE89aMSwrSxYS/2AHMfMSjGuEkv6z
 XREfC8bq6aaD0ehDBkKI+mDKwIf/KeWydhGGVgs9CQnsD4tA9Rm3BNk
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyOCBTYWx0ZWRfXzROXqUXnjd6x
 IemzE4BrjcZ9lNyxhTO4JcSp5mNgSGFCzybI2Nlzi5bbB2aCwKfr67IUIlXcTIgQim+sXLO4ulw
 bu82hoAEbsg0s+Y8IVjVsf/psUaxJgw=
X-Proofpoint-ORIG-GUID: OkQDQWFeKb-mxfLRN6T3FPj8cvYxxZCI
X-Proofpoint-GUID: OkQDQWFeKb-mxfLRN6T3FPj8cvYxxZCI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyOCBTYWx0ZWRfXw8X30AVs6FJv
 iiIbV4jszPMZliPV8B8ku7ddiuRthKOEJZVonRanpBrD2toBh4tLc0VpGjtKvx9R4fV4RqJxaBl
 IoPq32IButRl8hjNNNLBcZYOf2+PEHmYWCUjj9XJSu8RB/FtooQiju+Pz2/U1uaG4pM8nOYpk/M
 8/Fxo+MB66CocluPUUyxTm2vY3wOGBg51xjfylumzs3Yja6AJBm14XIKWoyAcGWMK0iYKzyQG8H
 EKh75dbQnzgioyinprkpXnfWHWi3G6B+/TBC1wwBHX74gd6r0RL1BW5Km9G8ztVnBaPR4IR5cZG
 4dd4MXw2cB0eyYQsBggU59lEc2g1EYYzUp088lcIhiQgmVaVlieXxhvxCDMvCXflPO1FO4GrsQm
 QrGny+v/Kt8zGTO2J4oWu0QbWWgsMlcbl1Fc4ba4oBxlDYjPY8BTFG02Bj2mmyG2pmHyfFfwbzB
 lHFwty7l97rn5pLTxjQ==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae053db cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KuocmVZnZXzmgL9DMHkA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270028

Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..14941a0b0854 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
 
       - items:
           - enum:
+              - microsoft,surface-laptop-8-13p8
               - qcom,mahua-crd
           - const: qcom,mahua
 

-- 
2.34.1

