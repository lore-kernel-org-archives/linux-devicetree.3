Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600951;
	b=VtAQvV5gwGjqCrwE0WU04ngRHSk7ZMMEfFI1wL3Grbe/fbYwZoAEpI20wOIPgIx/sVMP
	 z9TCCVB1thS6xbzI1jXTvtczJWUN5RKIjHcAV0CW7jpd3Alj6McTFkQLhomTS0fW34+NO
	 6d2ktfIi08p3j3RXK9yMP4nV3kDLS8xqcGPdri+IR/JTcO1b+jW2flX+MaTHkayS4pKuG
	 R2pGpGOt7dCmQ8e0lUsU1obC0AHH1BAaDPy2gpR3ogeSWhIhFtAotpvLhGBPbBQfbg/Z2
	 NftmFf1PhKX+ze+8scFkXDCFIfuMNYyGJt5p158lBoUTadCgDKlZ8FpYvzZ9XliHdWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4jrri4IWNeouBL88nLiVOIGLz5g8XwRnb/VwPuJcXio=;
	b=P5whQurSt7Ey9Z1V5CFpl22zZGSZtZtkqfmlchYbt3/KyGBxKz3J/J02Wkx2r7gBTmie
	 DOj3NlFrp+I+vKMbZ5Uf5HLf8Ro2dS0v9dWMvBVdVJn2Y9/M7foEYPRclxt55E277qO1B
	 SL1KTXp78WIWrmR4dige7WYVbAUiG/3fBo/+VjDJ5/McbmN+wagmBxELFZIvIpUGYFvj6
	 7umzlvz1emX/tf6gCW5TH09cOMOCnDexP1ahnBVuxJTBOy8razw0ekXQIWi+aBaGcnbVe
	 xP2abWhBu+C3kg9JWmXJgUgdnS5bVXOcTzkmpxAnSbinSkRxpbzkGAB1i2pPzW8VsuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nm1Em6hE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h5Ip1IY4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FC0606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69FC0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nm1Em6hE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h5Ip1IY4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mPZq555541
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4jrri4IWNeouBL88nLiVOIGLz5g8XwRnb/VwPuJcXio=; b=nm1Em6hEOIfw6dIl
	QjdFg1yKuYUHDS/iexnJqQI0Xa77ecz79gbmqdLRmzjrQ9DP9kdxJvZlHy2bQnCY
	mH5nfPS7f9uSIXkhwVXfUD10Zxsy4aOxJ2TfNm4Wan/BX4mDNzn8+Hgy81KvPQWk
	OqztoJA6MdcV69sAuKE9DZH9vLK5TSOZSt4vsKltJK0bPFSUkJbsAR3xDge2CkaG
	6ldCCHPzGC/MxEMIcjLxBTuCEPXiVSAbyOXOmIfJ9NR8NTNs+F5Pg9FuUwIaan/S
	3ctGwk9bk7Db7Tg2yxn7taJ2QlvALrkhPJHOT6LdeG+u/EwV4uB2qmPu/jP2FueW
	Mm2miQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnr7rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:02:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b41e8c1ac0so8108592a91.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600949; x=1796205749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jrri4IWNeouBL88nLiVOIGLz5g8XwRnb/VwPuJcXio=;
        b=h5Ip1IY4eSGc0Wo8HjTl9/wNNE8mWU0DC6Axb3TE6fiUDcEbazI8JFy1YywaAMxvYD
         UmuAlpnovK6lVdkjruBt+mZceg97uXpktfFMPZuO0NeZV/hI2UlTSKuq2o4qmF6GNrsv
         OGvPlUukc7iqGJ2415gHJFuv1XCRpc82JRPkOwmsAh6uJbYD62vvsiwRXheP+qAqXpLz
         YabtsHbUYv0+DGVrr8PVHa/D4SYCW52n4hVdh1ttnI9qlrg5XU+36F9nK1LhMto3Z4pu
         m5QWn3mB7XGpBlyXWAbSIX+IIXhSNOWKqIWjCjj+GSKHJC2pLIZGf059ZEy80D3+NF3P
         qThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600949; x=1796205749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4jrri4IWNeouBL88nLiVOIGLz5g8XwRnb/VwPuJcXio=;
        b=EHlCrrM3Su+VNM0WF/UhNzwH+LPBjBodpys2S7+qtlqOE5iYKEh0Pss9OJjTLYeIo7
         z7Q1GdKsPzCKjM8trFHbBSMu9khRKTlLYNBNSVjbwEWfvvpiDFmDtM83CKiiwPgC1Nmd
         Ojc7m8rIA7OkI2ScNW0pOdrrcAe1yTrqZQhQPtmDUeyp/S27x7ueQJImuUKywdk6Ndqc
         YbNLln4jaU1Otg367IQOUi6i9PHrmmCESsZkZqdvNnPzMwftsyfoQvZcQtX0z/u7J0MN
         pKYdQFpAjkq/0macBFd3+tyO8xH169R+KpfJg+rFrctI1T6779oNWW2RHUvSTWPXLjIk
         wGdw==
X-Forwarded-Encrypted: i=1; AL+hErGYOur3oufUS0CzaUZ5RI81RiZrLJss0ZvkwKn7TZuL5hhEa6sRooakEcLjNhrD45ehdc3nDn7QodDk@vger.kernel.org
X-Gm-Message-State: APuU4Z/kc2I9Z5OjqtzbVS8Vaaa4SOX1zu5zS69OJ0cXWGbHihWbFFwS
	2RLfRBBlYgXLI9n580IZ6Ub8GUGdhu00R2p3hDbSvtqhJVtWcUSbylh3t6QxVs2/DDR7Fa3W34y
	w/zwXNLbxgVUcMfAy7CX/ynn6PlEmSvvFropfDzg1FCS8sV00bpNLLj+G+7h3g03Z
X-Gm-Gg: AZFdTZeBlehrRiG9odQMJI1Ivgv7FD4+VOFi5hUjsGnFl1fhRPgdz3D5iV2QKAL34pe
	/wkOgKTqSgMYXeQRWsVOQKp7sayOnXqVvyBnI6wHHGjMYF8OTKwPZzCLX2cxTNpUl8LjLLJjTSo
	OFIW1ISCDfQTai0yyFOXPP+Gr7cfmVlOXSttSvkDnYlqgbpSqRiiP7jRc2dwh9T2CwofmMXYpYv
	gopFqKPrBS3jnWspCRQ7Tkwg8Z7guQJD0T8iXqBdHFA3bQ2UJGcqXhiBuPypZ1N9GRFAgRb3GBV
	/imUxqiGl8Ygca60dNwa9FJLp34VAHExaIux8uRU6Lmny+sg/lvVKGN6PPcDZi4GceljcNax4Ov
	6imr5S8xyWCAGZnSRyX7xmmJNweYzeCO98hySGe66R3SnYgcyH0XcBceJZHeKHy9fXXz6Y18ipa
	Sj7qmJxQuuUQuo+VTUsBYePU9h0ArVqv7+lO4yzfUCEQ==
X-Received: by 2002:a17:90b:442c:b0:3ac:9f00:3bc7 with SMTP id 98e67ed59e1d1-3b41c92a922mr16922063a91.33.1795600949152;
        Wed, 25 Nov 2026 02:02:29 -0800 (PST)
X-Received: by 2002:a17:90b:442c:b0:3ac:9f00:3bc7 with SMTP id 98e67ed59e1d1-3b41c92a922mr16922038a91.33.1795600948678;
        Wed, 25 Nov 2026 02:02:28 -0800 (PST)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm29610915a91.16.2026.11.25.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:02:27 -0800 (PST)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:02:09 +0800
Subject: [PATCH v2 1/2] arm64: dts: qcom: maili-mtp: Add WCN7850 WLAN
 support
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
Message-Id: <20261125-wlan-bt-v2-1-3ee862fec57a@oss.qualcomm.com>
References: <20261125-wlan-bt-v2-0-3ee862fec57a@oss.qualcomm.com>
In-Reply-To: <20261125-wlan-bt-v2-0-3ee862fec57a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795600942; l=3144;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=4xpAeV657+F5cP1FIk6WeWwuNZbSbN0fEfOJppsTcsg=;
 b=iw7Pulk05XE/HRfbnZgfKMm4tiRYO5zseCPPp2d0EE33EB50i8lHD33mJb+BxXuNfNn95e/g0
 UmBXGloKlsJCe21jh4wL6CYYSIewjVE/hpnX3ZPLfEAa3R309ABVevt
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfXw3GpMFJIWVuM
 EqW/rwafiMCgyEDB2aqwe3hE31eBMAjhKlO1oiCr6IZlD7h2gpAYISZuHqXHGNEjFMZSkBRVOMc
 VoGp9VOndrTE7QMbRBfOD18NxvQBqNSZmbSwfdKzXaydBiUJLAgemHKKayAN2ZW7qzAivoUzqAV
 vhtXna9kzCk+NkfEtdS6GgCvxNhAXuHeUmoGZc4mA0pUoOqfqS1PoMB200UhCKRXRzbndITGQFv
 WS5Yjkm1vQo99GLeVXNxtFs+Wu//AsFU3d3y0hWIIwSFS9pEbsX2qLEyyiUKXfvwUcKyzUENLti
 FYfe0tiPdZOvAxV1kebLYgwYtkFnZt/r/2r3itQuJflR9QuoMeSzKyuG1TQX2mr6riFVmSdqxZj
 ool54AuPmmBi0pSouA83vLCZxokDPznycRRsG586nkZjsHgK8NmrPYKCDJQa9MiBnJ2Nxb3Ftaf
 fKEHgUyUjiGdoQg/XNw==
X-Proofpoint-ORIG-GUID: xK_Zx0enFZawDCO_d1BJGBbr_KGXUhcq
X-Proofpoint-GUID: xK_Zx0enFZawDCO_d1BJGBbr_KGXUhcq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfXzSFEJLDQtI2b
 aLvv+zL89SBJubKBZZCcjlch2w0GzlbqxWY2Du0+BbHOEr7LczCWs2Fr/NTOdBr16A6cqBC4WHy
 VMo69MgQ+sQwWTvtoP70ikpG/JeI3no=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06b236 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4V4p8McF_eF-Umsk-awA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

Enable WCN785x Wi-Fi on Maili MTP board.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 88 ++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index 5409d0a7ec2e0..09d5ba4190151 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -142,6 +142,63 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
 
 		vin-supply = <&vreg_bob1>;
 	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-0 = <&wlan_en>, <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		wlan-enable-gpios = <&pmh0104_c_e0_gpios 7 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s1j_0p8>;
+		vddio-supply = <&vreg_l2d_1p8>;
+		vddio1p2-supply = <&vreg_l4g_1p2>;
+		vddaon-supply = <&vreg_s9d_1p0>;
+		vdddig-supply = <&vreg_s3c_1p2>;
+		vddrfa1p2-supply = <&vreg_s9d_1p0>;
+		vddrfa1p8-supply = <&vreg_s7g_1p2>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -757,6 +814,21 @@ &pcie0_phy {
 &pcie_port0 {
 	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pcie1 {
@@ -808,6 +880,16 @@ sd_card_eldo_en: sd-card-eldo-en-state {
 		output-low;
 		power-source = <0>;
 	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio7";
+		function = "normal";
+		input-disable;
+		output-enable;
+		output-low;
+		bias-disable;
+		power-source = <1>;
+	};
 };
 
 &pmh0110_i_e0_gpios {
@@ -906,6 +988,12 @@ &tlmm {
 			       <119 2>,	/* SoCCP */
 			       <144 2>,	/* CXM UART */
 			       <211 1>; /* NFC Secure IO */
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio18";
+		function = "gpio";
+		bias-pull-down;
+	};
 };
 
 &uart7 {

-- 
2.34.1

