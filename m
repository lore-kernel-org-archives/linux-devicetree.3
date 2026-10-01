Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB81853446D
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867900; cv=none; b=brvz4koCB6f3MVDzcKXb5sghPKDUDn6bDZbIPXR0AuxmelhpiFSfhECCmEIHZ7eyDUiEqQujFArd1ru4MHxQJglFKBxjtV5NBWMBWmJE0D5RwKuPUCyyODsIG43Ce2achdU4pDrQz+4gKVjfE7n8ujVZm+88V+jUBWl7myhs9DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867900; c=relaxed/simple;
	bh=5KV0AqXX2OEMwqqrKW1yCmYhVV+tDtyhJFj2NfkqB2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bn5j+Q7yNxzZOW2EapOI3/D+PIL/8FyVLU1FADnYqs5FXT0UFBJhAmYNnCPuyVRDLHWoAQX4E9fQA8OAG8h7FAKJLcEVawCheCRiUGzEa2urHBAyWdfmi3IZape3+6wIb2U67PRLcqVXAXtY5+F+/1xXNG7j2OXhL8M8ugqRe4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKY/NbOd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/sMhD8+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKY/NbOd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S/sMhD8+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjEWV3703732
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 15:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8jwmXUc8FQUFOKj0/6yhNhLY1kS74hceGiUFkR3ZhY=; b=XKY/NbOdlUui9Ojp
	qDH3nBxycXpLVRkUUYre34LEk1ujVox1wkIw5Qhqfe9DgKEQzidXbL6CCr+4s7Ti
	G6rVsZCDUgG7O8WzxHjPUpSEkqIf1cqBT6HPCOS19glQUewdAJCEiBMB5SDEfION
	K/kGvsXoW17RPlt2+dhwAwbEqPSNwb0JeILJceYCaHzWXU4oLUH0mzSjr0vFP4L/
	7zRuo4w2uia29meqOsaUIOK/cGIm5gaphMM5eQGJQtk+OUppA9Qahaz2E2vEeH2j
	tOuFkNIQFnNC8jbHSNMNfxMZOZOYG8VOwuQLekouvbAv1V16YAvWgu+K35KQeZ05
	qlQpDQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1hvkjcr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 15:18:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1466ab2bc8dso8837976c88.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867897; x=1791472697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8jwmXUc8FQUFOKj0/6yhNhLY1kS74hceGiUFkR3ZhY=;
        b=S/sMhD8+0m025H8h2FMM6cDH2Eut53eTT82jsqgP4si02g/sfZ4NB1hM2o+QBpIoW+
         R0XtHI14y+g8ziI6uvCQRVpH0dP5RuF7QTtMv5PuPj0TYvx0LHpWMQg+VCgO+d3tNU8+
         s8L+q0VziZSbzYnhMNY2sn1oIEwpe667lS70IY2qpJbSkRnNOUFkxnuNq9nLW4SPAKYl
         TyqMQJxM3zXunOMQYXy00fRw5ud0kqIYkjf56oNxUsOWJwpgyfn44D/zpTlI1iqEm01t
         DVAiALE/33I2Fv2VFeXaTESVHLVLUK01DxndcRBtPYzEIO3TMRGibHNAnXT44oNQpuy5
         WjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867897; x=1791472697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8jwmXUc8FQUFOKj0/6yhNhLY1kS74hceGiUFkR3ZhY=;
        b=iIHirV79Bn0k5zhUNE4dudYZwVcUaT23f5Uwvea89FyU2EA23JU2KXB+o3TUmXoM8h
         s3GHm1SQWc5EvS0eFsdW4llvAxfVbCGkCGtGgJsq0BjX4rHjfeugCiV+Ny8UGG3ZPZUO
         FzLtdERBY376eqQk7VpQ9LwTleJzmCW7A/4euZa/S7cwyR+887Rf2bsbGa0yJ6eb/QHW
         MkiHSQKYtjyseJb37dtwxaR4YfG5n7oLk87xA0Mr/RKRaVoBBKv80c9D3AyOXFnkxYXE
         d4ewfxmhgbImIlDvSN8Dmw0++ZZnyTqCe3nmzpQIP+7hHUF/+9HUZc8e5QuYSYBAhN5S
         ZR0g==
X-Forwarded-Encrypted: i=1; AKwUvBzWg3vvWNlYxEu/4Tj3o9DgPQ6IjxO5mHLfUWVe/YHNGQvjMLUuLj8g3zxz54xpY8ws6CSSFy1quO9I@vger.kernel.org
X-Gm-Message-State: AFuF++maZgTLhC0wpMu5t+TpBH3/qeTNofMnwDgAHzp3OQgJJR1wVqWd
	ApoEF7dmEOO0szxpPjkYiT/cBtS4oYuXzAAhK3kRPDAYzIg8Ui1q1DZN1De/1vxWBvMORBOTeNx
	4De8PspS0A/AmiuJbiOcAl1zoKBSTTSyH+x2xgFPBrU2WSyo5bYFE4K+rWk1TJP4W
X-Gm-Gg: AYBFou1tgfTcTxLnXbp6tYKhkMSISBeJB9ilSMextyHkiHZfghmMGVtLQulxE/MwTo5
	/5Nn+81oVxMsDI9RLghjzJnow3r+5xhN0EJ1Sl09znFfzGTHYs83s71hAbewvwRU7n2OTBtNphp
	R0KeBCsHAKvTSjLLAlw3m4CgUEVnpN6bINcW4J8sff6iayPCBRBfEhjMu3ZdI7RFnqGSO73SKk5
	DpBAm63lVDfRW4maqyDFrHww14dfJw/gDQjRYZeih8iNGVtSYCIeM/HpFtalPilrz1tdDbt3dl+
	XA86SmP4amsua9ZXjq0zrmD4E2J0Yn+28HVwSXdZmxvSVQYKdoG3LKat6ZKeqIVp1Rd2P74Fyiv
	h/X86RzxV8eHaY3M1gbeCF8jK0ToC5qHEwA==
X-Received: by 2002:a05:7022:ed02:b0:145:7a:7765 with SMTP id a92af1059eb24-14d331a6544mr4080619c88.36.1790867897141;
        Thu, 01 Oct 2026 08:18:17 -0700 (PDT)
X-Received: by 2002:a05:7022:ed02:b0:145:7a:7765 with SMTP id a92af1059eb24-14d331a6544mr4080593c88.36.1790867896233;
        Thu, 01 Oct 2026 08:18:16 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f246d32d2sm115700c88.1.2026.10.01.08.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:18:15 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:47:26 +0530
Subject: [PATCH v4 6/6] arm64: dts: qcom: kaanapali-mtp: enable iris video
 node on mtp board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-kaanapali-iris-v4-6-642f9ac5e699@oss.qualcomm.com>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
In-Reply-To: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790867851; l=963;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=5KV0AqXX2OEMwqqrKW1yCmYhVV+tDtyhJFj2NfkqB2Y=;
 b=1UY6xzT4aqvUmIBKJTk9yU2ObYQd4Uln0H0wq77IC++vzIUv58JOCkE/GMEFVgPM9tDWAqicp
 oza9/QuBBgYCp/e4rVQ605tNEgEATtK+FAungfosjQPyjxdI4X28TaI
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX/o1R25gqnXn0
 XOm/F9fN4gGVzLIfZzsrcXl4zUXjJor1PmJDfFY7drU/m19QEQgOLSNDGQ4nF4/+oB+671/jNV8
 Ph3hH8KQotzNb3KOlzc2DTRIkdA0FiE=
X-Proofpoint-ORIG-GUID: eZ2KiYNWpL7LZkpJI-5Zz2XPH5tS-wZV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX55KYfkZDMLto
 M+YrVs4XjEsBiCa1OGbvWhyGk5IFbuSXybDmBLjb3pP0q0p7AKzG1bhvunYwuVz0MS6pQ+w3VUb
 LOBSJH9Hc035pgMy9DU/oHp+VrUKCShhpv+RKcjBt4XawpuKLQINtSrkQ1VwBNIoO51qcTlRKtR
 AtXI89kOjPBtLpa1ELAxVWIjtrkty7Z4QMrCEs3r89MpcViMBnEKcwXrDDpvDfGaG4gxlWureqC
 O281XbcbYUvwuBrR5+z89MrHDOCXOsOMTErcU7tee2HmY5cx3XI1tWNqGyd+oAQimbSaJaGMd31
 e2G48neBM/dB/19viD+fX26zRxTeEtUkRDX9ld2uM9DPxrxLFGEc+SfDPW89bgIS6tEDLoEbbu9
 xDz/jzeiTlUNrI+6WCnDapheVVkpJLQ02HEAFazh9WHRlahco0qcdKWO3qmG8Wbq/A/C/BQWiOG
 KqP8my9LZhzkHgdabTw==
X-Authority-Analysis: v=2.4 cv=IY8Symqa c=1 sm=1 tr=0 ts=6abe79b9 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RDbdyBABLrhsN5S-fyAA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: eZ2KiYNWpL7LZkpJI-5Zz2XPH5tS-wZV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Enable the iris video codec on the kaanapali MTP reference board.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index 9eb02fd09dab6b3e3646753a880e4704a1abd503..4463ab8b136c6f3999198e159335e3096e181fd0 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -916,6 +916,12 @@ &gpu_zap_shader {
 	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu40_p2_s7.mbn";
+
+	status = "okay";
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.34.1

