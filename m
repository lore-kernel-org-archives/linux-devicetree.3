Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA0A344DAC
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154059; cv=none; b=PRNsbY/DAl/cyQsYRg5GaQ1N561+Zy1ONGo3UsPEv7+Ktq36uNyD94AUC7E778998zLVPkEFacMxUzCXYwg+ZvOdooA+xSbqmhcN3GaDfSv7++WfgY3CQOX8q9vZ1tCb7H75lO94buZfyFmlORYVTL5/fenS8FFKzMvMgAxKEG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154059; c=relaxed/simple;
	bh=mUskJ8SNq079LmNHg6tuDsqQTYd8lGSyihEzvrPy8dY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pt4UGCGWhrBlUk45XNEu1s9+qaqkxfjPxGn1qJXC8Eg3vAxxjgVDPOiUD8pzRoMGPBD3gmDarHxfKC1P/DcHEO00H17+gqf8pI6WEtfgZoe5fDBNuFp7/8Um815gt2sErgIY+Bxk1jILh81czjbXSEzIr7b6afekV9p6MFK8ZjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYq8bO8H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dquY3Gmf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYq8bO8H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dquY3Gmf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NVKk3091890
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQmMmpwIPQvIOq+S8oQSzNrPYjyqFaWUA0KmsRaonZM=; b=KYq8bO8HOSCsqDj/
	KO3KSDmlBODzOyWest/xhIPQbD33qxs9E7BPTrFJDtHbdXljJJNk4J2UeGRViv7U
	Hygq5NP7Qgz/iSGNFPQ7NcRjRXmdOyVVeidfJFUa1vxTe9PrqlFzWbtySX8v/z36
	92FoDt7aSJ+TfHKFWv6agZTcE5MSDmAfmNmzGJJtVJuurnp2BPf4UgwtkFqZXeiH
	ILi0aqPsrqSYklCDPJ4M+/1jSsknCG17sq2hOJYbUamwXe2V5P79PM6zDVCkLdun
	y104Lp2yzEbmO0VVG8tVJxJKDhsL08qeoDvEmuevYyUxeAuk6hRWL/6rhZh1PxJ7
	lsf7Gw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6v9mnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2c98c1be2so10337035ad.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154047; x=1781758847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQmMmpwIPQvIOq+S8oQSzNrPYjyqFaWUA0KmsRaonZM=;
        b=dquY3GmflPJWSCgnJPtP2zYFdxDE4NM4oTmzEIOOeni4gUGdC4RuPvkVljoCSRrC/f
         9zAuXg3KafwC5x25vaM+lCKJK/Gy14/4j+aoAnwCCH6TJtyGUQxXipgulScSXTsA/mYQ
         X8Og3JWu8qUnhMvS+zBOwhb6vTrEuaDYtNbb1nSSK6DMktRNax8jMLaYnD+iTQgTNUz2
         Vcb00vNc7eOUDpcSpJAGc+f5INgCIn6jHULMQTd6XeeF+Din48iY8PU28wYlcDE9kL3T
         onaaSYgYJxtgnCJlUBj0H19WobUdE/Izrk9Vye+ODIgXZWPOwtSgFGEYQnzjLzqkdqpD
         wFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154047; x=1781758847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xQmMmpwIPQvIOq+S8oQSzNrPYjyqFaWUA0KmsRaonZM=;
        b=JUj8VPfPpMIxDPe8X338FuP92Flx5MN9d39xfU+3bG+J8XxEg2IMNZ8dszKPpJ3vig
         DbWeO0n6paq9gDIZGWIWmLlPcn5TEew/hX45h23gjInkUlCy27Ca3wGFPF3ElWGQ0ZKx
         G+T8MJIOD4OHQlJiOYDaetszKA1GMQjFe8dLlpAWrFHpPalYK5oN1MqnT7yxVg8Cxjux
         8zCR/BoV14WO/LU6sLzG50dVcYX0pUy6rOqMoaLorgMzGMshGaNKUcQGhsPBrqnoy/mu
         CQqNq260a+spzcLxfGSwSugTBpQ2zwpUmysgEWpycWDOrNCCcpFvygVBp3rNpjgN7av8
         iAcA==
X-Forwarded-Encrypted: i=1; AFNElJ+aaihQyEVBqQRFlCjxba7qCc0kQht8mgGA3f7thBoLZmQutYFavk4+FH01VBfG33fMrfPi/ThY5KLS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw69Ar99Un+t7XpMUnSqVyMLO1oX1CJkcTzmRk+4dz3rRJcTQ0u
	w8TZH7UYN3m1mvdJlG52llUYCBGhDzmeJscSQBLgABIMv1GhIvN8pUjb9aq4syQi94eNUOyfGIP
	SZIKg+ZEQlQl7dlC0bjNFI0DE6poUdFy+tvtf6BbbOGCsdReBWPD8NpnyOyZyZKLn
X-Gm-Gg: Acq92OEJejtuefocS+ZJ1eHDobcfLg7ROxyd+eKk11SOxm4mOZ10R6PfI5v1Z0rAavF
	sc4BEtDLlDcqYW78VNLB7e7Oh8PftSsZXgHagUlD9F1snn0NR61M26xPJc2ifI+BBk2buw+/e3z
	7XKnGPwfO22jcXpOKmJv3i5T0J2FoOvuidGcuBO8216FQ6eIoeE+o8fuLbpu8ZmAawNP7JMbo37
	uIKisD4su4NJUPT8ljkMNqT0sgmRT93oB4o2dYq6upj+jSRUmVfQDyG0XHWeJRm03s3bVzyUaI4
	ioGoAfMtv3WHAnCah8kCZ7v7wPavherc+HWGIGoMYdDMN0yQ5SKs2F+n6M20VfPhtDdW+UelX64
	eXsyMj44CpY6F2EIEUuh3QPIgpEMHPyXLkNN15UQXmbGwtoaATyb2PP9gthoZFcY6Kbg=
X-Received: by 2002:a17:902:d4c7:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2c2f24a1843mr11523855ad.25.1781154042222;
        Wed, 10 Jun 2026 22:00:42 -0700 (PDT)
X-Received: by 2002:a17:902:d4c7:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2c2f24a1843mr11523415ad.25.1781154041664;
        Wed, 10 Jun 2026 22:00:41 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:41 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:03 +0530
Subject: [PATCH v2 27/37] arm64: dts: qcom: sc8280xp: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-27-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=11032;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=mUskJ8SNq079LmNHg6tuDsqQTYd8lGSyihEzvrPy8dY=;
 b=fFDsuKVpLhciftRUNpJi7oTKzck93kHrkr0eGmuL6mVrCRPymMbG4OJ9xmSkxYHpj3OAp1HK5
 0/F4Y1Vwoj0DM5ySm7zQSifRr2oTk7gWDFDCke+BY7NQbFvIPx8P4+m
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 2iggJVU8DZgfee7lRHACvZ352imH2sbn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX5jESrYswEpUh
 689fuUwuwxBqQVbD6soNCeqtX987HhiZEtosIvS/r0OrJASY+EX1IKG6G4g+/34prKO35Dbn1dZ
 rSo73QN5WDkKLclZ0KlQcNUZum+4M/o=
X-Proofpoint-GUID: 2iggJVU8DZgfee7lRHACvZ352imH2sbn
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a40ff cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xdgaKNo_m9sR3IVs-GIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX9Kaa7tzNhGsa
 Sn/b6H/PjG9ExTP9uyoW8bipFDGdU24YCZCXG2rdTW4seFy0QJ5HwkdLUcRH+0p1MyiDmLEzzDz
 TbadAF07hu4Tzmpi+4krLSQ6oN/Fh+uGr3Q9VSBLJp3bsi/MqMQ/o/KBooRoHH2zpMglkVOUo1f
 G7mVFYmWvDSrOwLHinht3N87YruIyV38tHDShz4tF+qVykCgFA1UStrm8/Fu3FzFhzy3xXL7v1W
 TXwcIdgOtWwk1luwkrho4SY1otVoz8FzOC3yQaYXedh6CdABEFzqYR13L6x3+Uw6IgEvOu0BoSg
 sYGojaMTsOnl6p9ulDRC/ZyqwZ9CJUwinCZL8Jd+0JtlgkswwSiuRcNhXRWhFe/LhTAdlqq9O40
 VnllRet97WwM+UH5cf+Y1Tv7qcXdc4u0UJ774SIgvXYI8y7mSeSD2vcK1BWjBrjH24u44hwSGQo
 tRq47Ejub4CnEhZeGYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
the existing pcie2a_port0, pcie2b_port0, pcie3a_port0, pcie3b_port0,
and pcie4_port0 nodes. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board files,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          | 24 +++++++++++++--------
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      | 14 ++++++------
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 22 +++++++++++--------
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 22 +++++++++++--------
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 14 ++++++------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 25 +++++++++-------------
 6 files changed, 67 insertions(+), 54 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index c53e00cae465..4c2700e9b00d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -628,9 +628,6 @@ keyboard@68 {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-names = "default";
@@ -639,6 +636,11 @@ &pcie2a {
 	status = "okay";
 };
 
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2a_phy {
 	vdda-phy-supply = <&vreg_l6d>;
 	vdda-pll-supply = <&vreg_l4d>;
@@ -647,9 +649,6 @@ &pcie2a_phy {
 };
 
 &pcie3a {
-	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wwan>;
 
 	pinctrl-names = "default";
@@ -658,6 +657,11 @@ &pcie3a {
 	status = "okay";
 };
 
+&pcie3a_port0 {
+	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3a_phy {
 	vdda-phy-supply = <&vreg_l6d>;
 	vdda-pll-supply = <&vreg_l4d>;
@@ -668,9 +672,6 @@ &pcie3a_phy {
 &pcie4 {
 	max-link-speed = <2>;
 
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wlan>;
 
 	pinctrl-names = "default";
@@ -679,6 +680,11 @@ &pcie4 {
 	status = "okay";
 };
 
+&pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+};
+
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l6d>;
 	vdda-pll-supply = <&vreg_l4d>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 9819454abe13..1aba18ae301d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -739,9 +739,6 @@ &mdss0_dp1_out {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-0 = <&pcie2a_default>;
@@ -750,6 +747,11 @@ &pcie2a {
 	status = "okay";
 };
 
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2a_phy {
 	vdda-phy-supply = <&vreg_l6d>;
 	vdda-pll-supply = <&vreg_l4d>;
@@ -760,9 +762,6 @@ &pcie2a_phy {
 &pcie4 {
 	max-link-speed = <2>;
 
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wlan>;
 
 	pinctrl-0 = <&pcie4_default>;
@@ -772,6 +771,9 @@ &pcie4 {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..603184a7c06c 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -933,9 +933,6 @@ keyboard@68 {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-names = "default";
@@ -944,6 +941,11 @@ &pcie2a {
 	status = "okay";
 };
 
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2a_phy {
 	vdda-phy-supply = <&vreg_l6d>;
 	vdda-pll-supply = <&vreg_l4d>;
@@ -952,9 +954,6 @@ &pcie2a_phy {
 };
 
 &pcie3a {
-	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wwan>;
 
 	pinctrl-names = "default";
@@ -963,6 +962,11 @@ &pcie3a {
 	status = "okay";
 };
 
+&pcie3a_port0 {
+	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3a_phy {
 	vdda-phy-supply = <&vreg_l6d>;
 	vdda-pll-supply = <&vreg_l4d>;
@@ -973,9 +977,6 @@ &pcie3a_phy {
 &pcie4 {
 	max-link-speed = <2>;
 
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wlan>;
 
 	pinctrl-names = "default";
@@ -985,6 +986,9 @@ &pcie4 {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index f2b4470d4407..4dd287e6fb95 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -486,9 +486,6 @@ &mdss0_dp1_out {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-0 = <&pcie2a_default>;
@@ -497,6 +494,11 @@ &pcie2a {
 	status = "okay";
 };
 
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2a_phy {
 	vdda-phy-supply = <&vreg_l6d>;
 	vdda-pll-supply = <&vreg_l4d>;
@@ -505,9 +507,6 @@ &pcie2a_phy {
 };
 
 &pcie3a {
-	perst-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wwan>;
 
 	pinctrl-0 = <&pcie3a_default>;
@@ -516,6 +515,11 @@ &pcie3a {
 	status = "okay";
 };
 
+&pcie3a_port0 {
+	reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3a_phy {
 	vdda-phy-supply = <&vreg_l6d>;
 	vdda-pll-supply = <&vreg_l4d>;
@@ -526,9 +530,6 @@ &pcie3a_phy {
 &pcie4 {
 	max-link-speed = <2>;
 
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wlan>;
 
 	pinctrl-0 = <&pcie4_default>;
@@ -538,6 +539,9 @@ &pcie4 {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index 00bbeeef6f14..21438e638da6 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -624,9 +624,6 @@ &mdss0_dp2_phy {
 };
 
 &pcie2a {
-	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_nvme>;
 
 	pinctrl-0 = <&pcie2a_default>;
@@ -635,6 +632,11 @@ &pcie2a {
 	status = "okay";
 };
 
+&pcie2a_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2a_phy {
 	vdda-phy-supply = <&vreg_l4d>;
 	vdda-pll-supply = <&vreg_l6d>;
@@ -645,9 +647,6 @@ &pcie2a_phy {
 &pcie4 {
 	max-link-speed = <2>;
 
-	perst-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
-
 	vddpe-3v3-supply = <&vreg_wlan>;
 
 	pinctrl-0 = <&pcie4_default>;
@@ -657,6 +656,9 @@ &pcie4 {
 };
 
 &pcie4_port0 {
+	reset-gpios = <&tlmm 141 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 139 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..c59d7b499008 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2220,9 +2220,6 @@ pcie4: pcie@1c00000 {
 			power-domains = <&gcc PCIE_4_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
-			phys = <&pcie4_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcie4_port0: pcie@0 {
@@ -2233,6 +2230,8 @@ pcie4_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie4_phy>;
 			};
 		};
 
@@ -2331,9 +2330,6 @@ pcie3b: pcie@1c08000 {
 			power-domains = <&gcc PCIE_3B_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
-			phys = <&pcie3b_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcie3b_port0: pcie@0 {
@@ -2344,6 +2340,8 @@ pcie3b_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie3b_phy>;
 			};
 		};
 
@@ -2442,9 +2440,6 @@ pcie3a: pcie@1c10000 {
 			power-domains = <&gcc PCIE_3A_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
-			phys = <&pcie3a_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcie3a_port0: pcie@0 {
@@ -2455,6 +2450,8 @@ pcie3a_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie3a_phy>;
 			};
 		};
 
@@ -2556,9 +2553,6 @@ pcie2b: pcie@1c18000 {
 			power-domains = <&gcc PCIE_2B_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
-			phys = <&pcie2b_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcie2b_port0: pcie@0 {
@@ -2569,6 +2563,8 @@ pcie2b_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie2b_phy>;
 			};
 		};
 
@@ -2667,9 +2663,6 @@ pcie2a: pcie@1c20000 {
 			power-domains = <&gcc PCIE_2A_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
-			phys = <&pcie2a_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcie2a_port0: pcie@0 {
@@ -2680,6 +2673,8 @@ pcie2a_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie2a_phy>;
 			};
 		};
 

-- 
2.34.1

