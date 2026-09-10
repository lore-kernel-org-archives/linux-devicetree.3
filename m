Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB184AA1FF
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047084; cv=none; b=hhpGyLTqmhOaubh57Ig+D0SVTgR10DPeMifYirx8o/btk17ZdlcoCe06upJWWrhlPpqJppf9bXiICWHhJpKClozV0tBD2376aiuLybgQSi+iefFde9xlTa5AalBs9EW+08+PpE2OsXiQnZPTrMIqWRbA5LBzFl5aZCXZQQVepNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047084; c=relaxed/simple;
	bh=UkOEj53S9OPwwL+enaw9an0CYMHAcaW8Wl9DTd2ZYtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jgP5l2dUlcL2DFK3CN5lshtmfQnYOXzdGv2WGUIHbrvbk+Z0t0HVqmQ+0tRtF5n6SfkKsut3saGgtvqX0+houFTjKfJEXNc9JEtMyMUeC7XL3MF72m8clWYYixonmEhdAgNyG8Rtx3A4uPwflxR7he5voozLz/ja1FeYMqrwR7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+c+gsdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECERvEmQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+c+gsdm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECERvEmQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7eIw3893129
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OXQpCYf5rFJ5/aBZJc2dAXdAUl8vYeSnY84QxhDN5qw=; b=S+c+gsdm6QVRITwz
	LuCD3g/dWkOkSvmLF/LdlI5KZDqZHwOvobUtdy+/QnxZc1tXwayuNjZS56FalaxD
	z1mRwPzj5Yjy/JbEXj4ubmfRg6/ESqynEdiBAyF0jzjnkcXKlTKMhfKDoSelQFIC
	jnTwdCwmSCwaNxXeLx4BewI12oH4QH8TW4c0BBwe8bxpRK/4Owi2b3OkUqTO7znU
	YErxYxJO3NO1fAQV6I8AmFJXnEof5zA1s8amBieeNZ24JQuBAwm3PePuDX5p/80d
	vPqJ+RGtvZVLUZrn9nuY58QQ3CkJl8HfJCtqTSILYUc4+3xMkvDea8KsLjmApZx4
	pHkkpw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8s20q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 13:31:22 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46ac13882ccso6734243fac.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047081; x=1789651881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXQpCYf5rFJ5/aBZJc2dAXdAUl8vYeSnY84QxhDN5qw=;
        b=ECERvEmQEU9qK3BQZN4AmHWyU5kc1UOMzvRPhhi9vryUvP5717qcbZ8jNh0nLezO4m
         B/InnOgQHUpgPvJBU5yNxvEgePq2+1WXUHjaqAPVzaOB9jvTmTgwcpCtQc0H2ZI28zq9
         2dzkhPWIVJL2YwZkX3bcIf0ff6Tbhr5VhaS8qB4KvEokaEmGwUNl62epGg2FwQtGMrBV
         tEERS6RlxL9x0wZZlktuppJcWq4DPBWeTZYEQtiuZTOpqAcZXK4IPnis9jYNk+P7h/eQ
         QKAQHwZAZK7iF5jJysz9EyF2gqS6RWhnLACFsLjXuI93HZ70y6lpnz5fC2qYg18A/IfY
         UL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047081; x=1789651881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXQpCYf5rFJ5/aBZJc2dAXdAUl8vYeSnY84QxhDN5qw=;
        b=Bd7maVZQUYHp4AoZ8bilPx1YRGrU72gBmYkZyePxKlXV+FPVzd10/sZL/8tG3O4Jqp
         sT4V4xnoU7rFQ24tClG4dE0wGkTpcHm8d8wGFZnKqZ9HbuVDKVp+yFbKtUAMNQSN58p9
         3MK1KfXOYFmxnHtJ+YgU+mZC5LsL8qXev6Rxt2JHnzeHsrNNycQ5Egp7Dl/7RIZhSe/9
         7fLVby+r2V2ADJdE/gnuB7z4O9nDSzIfIBDQiz9vLKf3A0FJN8+mHzC7RM56FRVtNgGU
         cQRt4yd4DbHlI1626zU7mg+H3seg7OE+tP//bVrDqtSxwl+C+wa6/utIsama4bi4929K
         wQuA==
X-Forwarded-Encrypted: i=1; AKwUvBy2AeVSelZX1+KXEZ6x/BhHfGicB9Yej0fU5n+j0GlWMUNzdQArrdzXJLUGKZqyKU77vLpDJWh0glI1@vger.kernel.org
X-Gm-Message-State: AFuF++nq6ZHSa1u6iEyPnZn5b9YQlza5E3EuJEHg533OBI2nS2Z0ysCQ
	KUERUnGOj6/vulPGmGK0rx8RF9nExAFtrETKJVUruGdadf1ilHA7ugX0n5/AmxiZc8Z7X49d7EQ
	qtfhJaYCHDCIpDrsvKRvK/5k6w268vZ+c3h0VJLrEygxk6VZA0jn1kNciyftNoBC8
X-Gm-Gg: AYBFou2pE1hq5aEzg3rUYq5bE8brDFp/WlOjD7KoFhw1zTcYu3ntU2bhHYWJuIVKQL5
	oBxhu68+1LshCF9Gs3pZEv5tpWC5Kr5xYYLUwwE2lMxOzRzqryNg7Mxr7EUojMY51ExFsBXUVwP
	FgP86AnyG21iSjMrUyJVHV03Me1eP4LLrj0o3rJMM5Z4CEwF6quhGvB49/j/BzRGUb2sXk4sw+b
	TBCQXkOrCuC7WhULF1rZaVOnkOkoZll0o6CuUh2i6d9D3jC6sRDqq2nvvhCguQFX1zV5omgE1SI
	8SO7K1LtDII076wrzB+huIjg6cWRtAw6k3qkhy5BAuNUB1w1NU8BrnJsChlNzX5eiJqqB9YpSy1
	RYLoJXlet/BMBfyv1l5iBtixZsun/FjqUSdE=
X-Received: by 2002:a05:6820:810a:b0:6ac:b6c0:2bf6 with SMTP id 006d021491bc7-6b6fabd2f22mr23234207eaf.5.1789047081178;
        Thu, 10 Sep 2026 06:31:21 -0700 (PDT)
X-Received: by 2002:a05:6820:810a:b0:6ac:b6c0:2bf6 with SMTP id 006d021491bc7-6b6fabd2f22mr23234170eaf.5.1789047080677;
        Thu, 10 Sep 2026 06:31:20 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:31:20 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:20 +0530
Subject: [PATCH 31/34] arm64: dts: qcom: sm8650: Move PCIe phy and GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260910-root_port-v1-31-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=6282;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=UkOEj53S9OPwwL+enaw9an0CYMHAcaW8Wl9DTd2ZYtQ=;
 b=Yk7r/126fsVFqIkRtgEtkg/SmEsaf+7/pkv0uHTNSZbIwMseFkOEB4aYcjS4m01OFofwgXlj6
 N0Hcm2cYtYzCtwFtUfaq6KXy5rSwPGMa1KOJ+ijRmqrAsoEIbKHcHJg
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 4GXEiv-JpRw9AEpJTtAW9uYEm6SLlcQa
X-Proofpoint-ORIG-GUID: 4GXEiv-JpRw9AEpJTtAW9uYEm6SLlcQa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXwarT4aOyGbHh
 g0oIcXNlCpt2e4IQsQ8ZDxWL6EqnIHpMep543nZauim9fVvazhj5MN2RVPoMz6QmixocyFjHp3W
 kv7I3pJSfOlnS4HYM2bCQlSrwjj7c4JRt2bttyXPbdVPgB1udJZwKxEcr5RTSMZXgUzTCNaPiB1
 yEMj1DVcktnWW3r15SMPJ+8H6Mkw8YDSeYlkm9Ik87csFMFuiTmyp7sEIEESXrkAPXkgmXRUvLX
 UZIR1BXrq+OKmWTzulTXf6Cwd8OXoEPVMrPJEPslzqRMxh+j30KUH4AXar385Yxo9iHf3COgio4
 JEf4c6/vPMp2/J45Ep9zwIVrb6Pq0yKIzvIhdvETJ5tcKqzIpK6u1TEMx7dZcDukmhjzMffKPur
 5eGGkjAYth7HJH577lQbKlH1SGbmwUh8heW2JnflfrWihXkVghEfHRrLKRP6Fx9A5IWf+2qvAb5
 /dRfNVAM0cyyeFFNCLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX8Cj00spIPzwI
 oVnojLZ2UoAyBRUTChhlho4X+GK62nylLC5+2I6TZXThZ6YbcNNNTrCL4nM4FZyDnfcgCDknFYy
 hflcHtI/KXF7OxuxBhLUrLV6P+/b7uk=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa2b12a cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=i5f7Ji4RTl7zrp8u-5cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
the existing pcieport0 and pcie1_port0, allowing board-level
overrides. Move perst-gpios/wake-gpios from the controller overrides
to the respective port nodes in the board files, renaming perst-gpios
to reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 14 ++++++++------
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 14 ++++++++------
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts              |  6 +++---
 arch/arm64/boot/dts/qcom/sm8650.dtsi                 | 10 ++++------
 5 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 668c183bc177..9fb53fd8c3f5 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1074,9 +1074,6 @@ &mdss_dp0_out {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1084,6 +1081,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1108,15 +1108,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_port0 {
 	/* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */
 	usb-controller@0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index b73ad7861eb4..b0dc9f134497 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -1027,9 +1027,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1037,6 +1034,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1061,15 +1061,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3e_0p9>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 1332c864801f..945ebe063dac 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -642,15 +642,17 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1i_0p88>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
@@ -659,15 +661,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3e_0p9>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 2e874f046a0e..c1971638561b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -1021,9 +1021,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1031,6 +1028,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d..39ecf4686c4b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3700,9 +3700,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			num-lanes = <2>;
 			bus-range = <0 0xff>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges = <0x01000000 0 0x00000000 0 0x60200000 0 0x100000>,
@@ -3769,6 +3766,8 @@ pcieport0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -3893,9 +3892,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			num-lanes = <2>;
 			bus-range = <0 0xff>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			dma-coherent;
 
 			#address-cells = <3>;
@@ -3978,6 +3974,8 @@ pcie1_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

