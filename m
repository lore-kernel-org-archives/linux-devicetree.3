Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794306282;
	b=Gg02EirzSkqnBPVidCfMq0BdUO2dIb7y8ZRdmyZ0O2qIuCt8TMBgoMmx5NnTgLKkS3HQ
	 pZgbSpGm/qRFXkk1f229MiBJSgkzv1M+K2uKooSAi1QJMElsWn+3sgi7AUGbzocQa+Mho
	 LzlTS46gtF955Ub7K/kb0u7SGMp4xDjoKqJ70tVfUDJyJlkQoAPeuVTg0by3dOs8/2EiJ
	 zhvGPqXsm61g8QAW8vYdGPKe+ER4VILSKdIKVniIzds9OUt0koOnZR8drOQoSrZjv8OYG
	 8tZvb+RDg89K+bfIIUsp6VQEhat0mQJeUteyKJrVEsTG64MhF4Ju4AFYJ5EhYPoTEPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pCtU1KcayBeoT9zqqnQ07pWDW9ufhr8NXme2DICgWck=;
	b=xpIUb+avoC0G7MfrSMA2LH9N+9i+WyFaCsV+DDpOewlkprJqjAO5tOcaAK5DUu0U9ijQ
	 8SD+ZiqHIOnZlJq4tSMj0IIh+Ee1XehLWNhhUbw0yEm2UW1pg2KhtCTzXVfFscT0LF3Ed
	 ZYKKgw1DXcl2gIKeECKjk9geBAFQVJ2tlb69Z2u6tPfjSeEL8G/v/LNJI889lDfXyxgj0
	 a+qkjJu1nOXldRa8TD13VoTlXDqY3w0OB07v1vjopiHgKUbwpoFGodDmthTM/lsJ6aKmJ
	 Ys8aX5wUUbcb6bsrTRvP1aiCNKzVbyZrexTQjGEOutsc3k7iQhl3PQTeTLJfCw6P1VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZNzSO1b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WClujH5q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBED606B9AF
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DBED606B9AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZNzSO1b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WClujH5q
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8ZY8p1916743
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pCtU1KcayBeoT9zqqnQ07p
	WDW9ufhr8NXme2DICgWck=; b=VZNzSO1bZ2xnFZ1nEFqtFBTbM6C3Mylj5xZJC8
	YCsQFM1R0RYFOx9NhP7uve16JPMZLvXMIz0vxvnKfKuToqjJQ1lS+3uTYi10H41g
	RH/jhPCeRzdnaizsjt4Fm7Jp29NUzyu3A+iN/1aGb3SPageEl7fwwsvEmdOkPmyw
	ECjgxudRWwUkZB4100kk5OAQU54vPiA6fzrARzAtrGRNlX2z9c9JHlzRBXF8bqUK
	+O/fCnG+zjIZuQX+y65G5s1Fna0Xp8pcrDjZFG+pEAnFmYXMmuXQ6826mxNhUvFZ
	EEVOm17O6c8qnnUsfdskq0bPzbi/EB67Mc1qlGtNJwbwyqgA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw48cy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:24:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so3470086eec.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 02:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794306280; x=1794911080; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pCtU1KcayBeoT9zqqnQ07pWDW9ufhr8NXme2DICgWck=;
        b=WClujH5qUgtCIw56w2KFLzx9ciCbwhTkzHfsanCsDGorAeks9byTH9nVWco80t/Pkc
         JOov6LjvW2fePZSxXTCqAe+UqEukQjlU/Luq2hGuEpHecwTcltFu2Cr7gVS4nU800o/t
         3L0L45LbHAvuSAPNdLlH+K1lwn/D0UhUmi54/JuHiRrhhrdmQLVDqsvrxyHx+3YjjOVn
         fZJ0MuudUC74fsloZmh1raNWuNFtyeDzhpoUW5mZ7QKEFVIa31QP8R7o56PucSwXecjd
         PN5HVpBHs+Ai8i1B60Xr8htO6rhpC9/e/glQc5pE5iw59y2A5gu/GZZU+8Fm13wzTp+H
         TbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794306280; x=1794911080;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pCtU1KcayBeoT9zqqnQ07pWDW9ufhr8NXme2DICgWck=;
        b=PcESDTlhaTA1wznq9O8fXddHmFyzuxzeluqbGUu1FtV+7cmNIqP8TMQSROwGaP8Qkk
         T8RB+0uoEUBI1A76oThZywaGrMq4UvK+1jCJMNI2lWO+n51tR6GYNIviu8BB11SOxgJC
         8WWXrpjcyuiZLs/NgGOnaUfdySP67L0ZGCI6HkwK2EWscdIAD11zRfPQTJ4ZCSXzovpg
         HoGgGLOL/ztEIWEtJE8TozVZMUhQ1ZZcz0Ga4CZd4N6SHlkie2XluFJVfXDKdeMS5fuP
         FH5m06ZPnkRWjYyPV0u8kulG36dFzRVMBeaaYd9vWK/B2O/nJosx2iQJ9xIcgskuTnR7
         1aGw==
X-Forwarded-Encrypted: i=1; AL+hErER7rXoQEKYJPXfErA3C8h9ThTTAFCOWcT2TppVYS3Jtpo0Ih5LLH7zz6tyJY+sOGeMOAuLfcRf34tb@vger.kernel.org
X-Gm-Message-State: APuU4Z88DEtQw0vANHUZ/Cwszv75Oc6tdIYZYFnpdISp4HFbVkkQHmh4
	HDmcEeT0+BK7leFVQjRD+ZEFOJz54nuKxpLVAUusErWdKSju7+nYfdxsaoS13MVs76dtRiIuKCc
	QWq05lfF8YhmOvBG61AIAGI3h8T19nUFfz/rtayIly1deuH321SI5Hpw0Tmnir10p
X-Gm-Gg: AYBFou3s+j3HaA5AmF0Sa6fhbzQl+PD/dC5/YFk4ROf9fe0jNN5RAg7snzPdTjemZKO
	BtbuB/3DHWFeSXCCNQ6JKRjv57d8z0994mq0k/dwbuWPWi1a+HLxMtM7DBxivYhK4LCgGs+2qwk
	+l3m2hnSI265EPVKpSYG7IV+0+Gx/BygLQaLfzKiCncusvolIdrjYqGvtOQ5hltq2Zv8VLg3RDq
	okdxv8ddz/DgaN+klBsTFVxwzFWkq39F1acCJG2WNSC0RRfpoe6caAMnR02iqATfj1QBiIY94g9
	0YfsDVi/5xmYMewDPrAEb1UzcpWLFwIV/mOMj97IvNep1eW/JRvBrOsaUaQjTYAwWh21UY2TIZJ
	aiq/gpW2jXEn6ufxEDx2E/NIHUGf/unaSEjS35F9Z4n2comrCRZiINZq/AIzXrxjTchyHsLSDkI
	Qi+QRh454qEQUP9eYzInc=
X-Received: by 2002:a05:7300:ea17:b0:36f:6d81:3fa6 with SMTP id 5a478bee46e88-3751fb34d2bmr2532801eec.6.1794306279643;
        Tue, 10 Nov 2026 02:24:39 -0800 (PST)
X-Received: by 2002:a05:7300:ea17:b0:36f:6d81:3fa6 with SMTP id 5a478bee46e88-3751fb34d2bmr2532766eec.6.1794306279060;
        Tue, 10 Nov 2026 02:24:39 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm6270742eec.25.2026.11.10.02.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:24:38 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 02:24:35 -0800
Subject: [PATCH v2] arm64: dts: qcom: glymur-qcb: Add PCIe3a support
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
Message-Id: <20261110-glymur_qcb_pcie3a_1110-v2-1-5f00e79613c4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOLw8moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MD3fScytzSovjC5KT4guTMVOPEeLBwWppFkrllsrmZaYqpElBzQVF
 qWmYF2ODoWAi/uDQpKzW5BGSaUm0tAKuijrB6AAAA
X-Change-ID: 20261110-glymur_qcb_pcie3a_1110-ff8b79c765d5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794306278; l=4575;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=BCBTA/frB76SuiJPkvLW3JXK5QM4du9paQKutT4KVrA=;
 b=8E7L+tdnJFc5ZXRIw8FavsRfBzlyeY39WvOBPjEY0ew4lE0REcqZFiE51woDXDU+LMw4/04t7
 SN6u7VkScHvBY/MndkrpXG5LnoKBWsoQouc1FOhncyRXair8ocjeR/p
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0MSBTYWx0ZWRfX+AKb2BZizcn0
 qGqxqtdMpNJoHlgBI5eURuKBpAzuEWXTQUCyMpHO3Q8+pUBPTspCD2NetXz19YpOQfRJRHkZJKM
 oLtwW5BCoIad3uVVUaXbSsvjA6EDhSgU4f8EhMubdZybVRgKyflfWZd+YhJQwznWkz+KgYseo+S
 17lpWBZFpT/vbWu3fnWdExEE9/wql+t8ny+Pa2Y5g7tF7Uj7Vpqnpjj4HNbdWHk435pUvZFubWS
 eCYIj6IQY13a+/clWpiSDD95mjOPFviqrWLdKWohvqiLPn1cZ1c2WatSn/YrLXdotnIpQ/PJvOa
 VfI2zwXj233Tm80zwWWyhxXjwnqayBjNnrIoK105FqnW768g1GJhVZgXe616ISb523h4I6swGet
 mTCNSLk8lZqv0j0K8QcT9Co/9K1nO2FpSPMle9gDV4Z+B4958aZ69U/PtpvBnr///0v37rEzzrQ
 f3YLH+6yQPEw+9F1sHQ==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af2f0e8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_DYB0qbgoRNhAtT3QCUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0MSBTYWx0ZWRfX7uBMW/moDKoZ
 GUNrZutRIFVvqgkjicsYclMnrKbuRBi6MzOYKsMpbugD7SU/wRxonuroD3D8wjrqbezgFHCtCX7
 p3vdxPBXvEHQsaHdilgPYplZYtR45fs=
X-Proofpoint-GUID: oeuEco5GCdl9GKqqaRRpfVpeLujpV2CS
X-Proofpoint-ORIG-GUID: oeuEco5GCdl9GKqqaRRpfVpeLujpV2CS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100041

Add support for the PCIe3a x8 slot on the Glymur QCB board, wiring up its
regulators, pinctrl states, and PHY/port power supplies.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
This patch depends on patch series:
https://lore.kernel.org/all/20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com/

Changes in v2:
- Rebase on patch series [PATCH 0/4] arm64: dts: qcom: Add support for Mahua QCB
- Drop output-enable and output-high from pcie_x8_12v, pm_aux_3p3_en and pm_main_3p3_en.
- Link to v1: https://lore.kernel.org/all/20261105-pcie3a_x8_1105-v1-1-d09aa0601186@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/glymur-qcb.dts  | 50 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/glymur-qcb.dtsi | 63 ++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index f0ed47adfc2f..e0abdd8c5941 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -13,6 +13,31 @@ / {
 	compatible = "qcom,glymur-qcb", "qcom,glymur";
 };
 
+&pcie3a {
+	pinctrl-0 = <&pcie3a_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&pcie3a_port0 {
+	vpcie12v-supply = <&vreg_pcie_12v>;
+	vpcie3v3-supply = <&vreg_pcie_3v3>;
+	vpcie3v3aux-supply = <&vreg_pcie_3v3_aux>;
+
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &tcsr {
 	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
 	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
@@ -32,3 +57,28 @@ &tcsr {
 	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
 	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
 };
+
+&tlmm {
+	pcie3a_default: pcie3a-default-state {
+		clkreq-n-pins {
+			pins = "gpio144";
+			function = "pcie3a_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio143";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio145";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi b/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
index 9751fbcc5f82..51fd34d335eb 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
@@ -71,6 +71,48 @@ vreg_nvme: regulator-nvme {
 		regulator-boot-on;
 	};
 
+	vreg_pcie_12v: regulator-pcie-12v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+
+		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pcie_x8_12v>;
+		pinctrl-names = "default";
+	};
+
+	vreg_pcie_3v3: regulator-pcie-3v3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 135 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pm_main_3p3_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_3P3_AUX";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 136 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pm_aux_3p3_en>;
+		pinctrl-names = "default";
+	};
+
 	vreg_wcn_0p95: regulator-wcn-0p95 {
 		compatible = "regulator-fixed";
 
@@ -631,6 +673,27 @@ wake-n-pins {
 		};
 	};
 
+	pcie_x8_12v: pcie-12v-default-state {
+		pins = "gpio26";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	pm_aux_3p3_en: pcie-aux-3p3-default-state {
+		pins = "gpio136";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	pm_main_3p3_en: pcie-main-3p3-default-state {
+		pins = "gpio135";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
 		pins = "gpio116", "gpio117";
 		function = "gpio";

---
base-commit: e23355aedabc4e1161ce8789f7f00d4554ef84d9
change-id: 20261110-glymur_qcb_pcie3a_1110-ff8b79c765d5

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

