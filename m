Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95D835C6A3
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 14:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789224461; cv=none; b=Dp8OnHmRUcfrfMTbGCnlEeqIKRidmL55fCNzSkoLEMKtF9zPRGWGAHm3QnGGrRaDuASbkBCfXfZz/XfFBUzUOJtZ8UCNmP7/EyBoeDctQ7Dkb4bxwxqGiw6Tt0AXlshy2VpdMCi7Ga5pc2wnZ3rOd/JhPGC5clSc4M3C5ss0BoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789224461; c=relaxed/simple;
	bh=m+orVjbrYOPpnTMcocWp5XwWThJkf2QCkbTZFw2UstY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNWOVvFxX0EyvpxLu0DDxUcXrA22EfRoUZZ8MdLz8jC+CCq8IGNSE85pAHSkGWWiVLkSFTzqvMaSUVntulmXqbmN7zijYDgiiX5hOmepVQNIIRNDJrU7qA81PokR+BKmSBXfgSnDac4eIq1ERexo/gnP1YfPfJ8ZNoCzCwNRtRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RfP0Ipre; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acaNxStZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RfP0Ipre";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acaNxStZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdfA13249794
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 14:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DX4wNWjesrloq9u2vm+bvbsCX/R2nLiI4EHDne68gKs=; b=RfP0Ipre5KZIIGme
	7aeeDu5OVJM3aRP+sHuk6E/7AjZyP1kOXPFv5baYv6kakb7yM3sRwwqzUErfkrce
	QcC1ykBxOKLLoimTLEqV6QpvJmBPf3E3HvD0dlBkYFZNINYj9lHN+v+YJW5k7LfT
	Gbk2RVnHsaSliDn4k77T0TxDAq6s5Vl8ruDX2dLZYawdNW+5d1nvpDDc1/4BHLGU
	q6EwObG/FajbtphUV65Git6T10XmbH7xSCsXtRMdQ+PfcBw+ve+wCHEdEZCeWcTk
	jRZYLjl8B+Dg+z6x7mlCYLn2yFFz0TMz5l4zk1gXm8n65/wNNgdGg4sHg4smfZ0r
	2fwGSg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c15me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 14:47:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so4491300a91.1
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 07:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789224457; x=1789829257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DX4wNWjesrloq9u2vm+bvbsCX/R2nLiI4EHDne68gKs=;
        b=acaNxStZjLkBXwC+1N3aHAJAFvsLwqU4G8gcEMKtm1jeDtE+C/ioQyny61X6ygCyvT
         w2H8HQ69cVR59btfLGngxNgfBlO17IJqVXRfnm+PBJcJ8HBNbdDh2ZPBK/apWnipZ34X
         93ImRaIr+ElICX78wjAqkBo7OXC2hdSy+xXZBUNraUUNfl+ZU5JeNWfY5r1/2WY9bqVG
         fiC3HFUZ/rGrZIk8rLsvXjkYcYsfzlNkNCTWzaKWOSBkX6tCNaKQ+d3FT01w4zgoEHYr
         6c2iCZJh39Hea2u7T4g2c3vaFghL0fVowtwV8h0d6nhsyQRymxWi/7l4pq92amzJO5w0
         uASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789224457; x=1789829257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DX4wNWjesrloq9u2vm+bvbsCX/R2nLiI4EHDne68gKs=;
        b=VWcyH9wAaM3ihayASLCoh90OhCgHCep1jZTkuQOdqaf1BYlMXkXW03kNy2EyyyvkHl
         1xcPaYNDHA+hiRih9BGYEwzEXct35uBmEbudbKpRHCZFy+6ST1Fr0Y7oIz806AucnmLb
         P+dR9F9i8Ae59BuDZZiMGm7uch0s/sAVF1IdaPKCp2dPt7nOPhtJ9BTzZZggEcfV1YNT
         BgV/d49xvrpGpD1r6cR/1nA41vUER6CUl6HWM822SOFpt3Aa8V9zmtGd2hUuD9FV+FxY
         UpiQd3KUCkgAjZUlOLwex2H7rt/hScAwbRROkA4iubdqY/Xr97ju5pqBZW/ZYAu0Q6Zc
         Cv7A==
X-Forwarded-Encrypted: i=1; AKwUvBxyyyIHk3f20iIxSs9daik8hKgoK/2oZrGclgrzk+81JyrsS9WVLEotG8nL7aNGlVflK4rZHra3eSYP@vger.kernel.org
X-Gm-Message-State: AFuF++nkuR6DJxqW2MsZKfdpBD6cZ1U8UbOoInFc01khkJI40+NXDJPt
	XK07gV+pD80TW6lNS7q+OLGjTc7HZFUd/0MLePNohFrxne1wXVj6niGXpLcbzIfV66SqYx/NsVq
	LSJunuAQ03+L/BVkxWQexIUoyJRxZrDswPncFgdmaQoO97sDtUjrZ6yC7K8ilOxE2
X-Gm-Gg: AYBFou1p/2VcM+Rxi+5MN5u3b2m+3mH081z546vo00wxtid8WHLxRVD4REJVUd3hnBv
	uakVLdqYYoDeVZPhYe3r6Y++gS0eHUT0JvFVz43rjyLCW2qXaidqoKhMEbH0ux/UwtErLZ1zbaE
	vdbU4WeY3Jya/JG+I93kwjUTnDfK7ZD+l0or0eLN08JhpxwvCbDaB8NZqFf22s4GvqxS8Yx0UB0
	lmXyusGxOF9GKOJjTa9xY6qjiXHl4HnJOwvUIuYhiVQYIEDQshmT+3y+NaSDPmzbIf+7tGF7ppS
	tzvXJidvPNHNNtr9rA4GeaiJb4TV6zjBmWjJ7zrgDS/0AihJzOSDtrSabKeMIm0QnjdSI9nm12R
	Sr9u66YzbR5E0H6U=
X-Received: by 2002:a17:90a:e7cb:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39d9b960826mr6552992a91.0.1789224457441;
        Sat, 12 Sep 2026 07:47:37 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cb:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39d9b960826mr6552933a91.0.1789224457001;
        Sat, 12 Sep 2026 07:47:37 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f7390csm14344833eec.26.2026.09.12.07.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:47:36 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 20:17:03 +0530
Subject: [PATCH v9 3/3] arm64: dts: qcom: shikra: Enable USB controllers
 and primary Type-C support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-usb-shikra-v7-v9-3-c7b507a0ec27@oss.qualcomm.com>
References: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
In-Reply-To: <20260912-usb-shikra-v7-v9-0-c7b507a0ec27@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789224435; l=5483;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=3uKBvxyWjcwLrJKwPEarFukDhI+wcZDsP0yuO/Zjgfg=;
 b=1L20gFn0OLBfREYmcfO91jX5AoZ5j7dpOO6zxQRefVYkXYhGqE9RV6hneWi2795T5fTG/Mxui
 e51uemnd1xCD776BwCjNfD1KDs+WoB55t7wxVtqPYMbV4fmUE3c1HIJ
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: bK-6eO9m0vXQPoQtuuCs_6XjFnrfOIFs
X-Proofpoint-GUID: bK-6eO9m0vXQPoQtuuCs_6XjFnrfOIFs
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa5660a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1_fiUyOONLQHFIvD_h0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIxMyBTYWx0ZWRfX1XvfKKyyLoY4
 56ErXxaNx5/w6vfR3TGOT+gafjDD0Lo0loIOAmHvNYUcIeAqta5FbD8b0wXlr2LY1A0FNL7p/K3
 MEpJieACmVFrFxhK5xItIge1DoOeey7/zA5HDstHqfGH97oHRUmgtgqHLByZgQjcxRePBK8vKzs
 iayeGahzEkUAhZdyLCUIKA4UR13H7/HlXJTet4DG5o5M/x355zXtajTG20HTCkro7bonyCXqhl1
 CviuOyA/zQsRbhYSNdQo3EZObwwcN9zTNb1YX3k4t5elOsC7cGuOrzqqsnQFTb/khHr9+MkQr5t
 JQmTEhZ2P+4Ijyx38IIWwoSORF6DYvGx3Dyie2Fq4/wqxyJ5wjU5JVQxPtO0qtEDTgtwElaEldQ
 +bM3aA/HtHfgoRSuOqKKLyoMXqKUMCXEGQairkPTZo4Tnw0/hTHI7q7VJg4tVgd+XEStBEriUal
 Ij6AX160pwSFg8edrhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIxMyBTYWx0ZWRfX7up2aG5LtmMF
 eBD6pUfQV0OLyse5klPOl1cOpxVbjjpqaFRBV31HMxRDajWDFzugcDPPSaAq7RLHUIicb8IXAFB
 37j6WEHPj0QqJrS9z4EilJLCW+t2flY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120213

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Enable USB controller nodes across Shikra platform device trees and add
primary Type-C controller wiring for CQM/CQS variants.

- Enable USB controller blocks for shikra-cqm-evk, shikra-cqs-evk
  and shikra-iqs-evk
- Add Type-C support on the primary controller for CQM/CQS boards,
  including role-switch and connector integration

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 43 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 41 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  | 43 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi     | 12 ++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  | 23 +++++++++++++++
 5 files changed, 162 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b112b21b1d79..2d26435b257a 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,14 @@ chosen {
 	};
 };
 
+&pm4125_hs_in {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&pm4125_ss_in {
+	remote-endpoint = <&usb_qmpphy_out>;
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -57,3 +65,38 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "otg";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index fde7fc035bf5..541ba278bb2e 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -85,6 +85,47 @@ &pm4125_resin {
 	status = "okay";
 };
 
+&pm4125_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		vbus-supply = <&pm4125_vbus>;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pm4125_hs_in: endpoint {
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				pm4125_ss_in: endpoint {
+				};
+			};
+		};
+	};
+};
+
+&pm4125_vbus {
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+
+	status = "okay";
+};
+
 &pm8005_regulators {
 	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71f..fcafd8aa6384 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,14 @@ chosen {
 	};
 };
 
+&pm4125_hs_in {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&pm4125_ss_in {
+	remote-endpoint = <&usb_qmpphy_out>;
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -57,3 +65,38 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "otg";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 4b9452d9e93f..7cdbd257e9c9 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -20,3 +20,15 @@ &qupv3_0 {
 &uart0 {
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 727809430fd1..779b9582c011 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -57,3 +57,26 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&usb_1_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&pm8150_l4>;
+	vdda-pll-supply = <&pm8150_l12>;
+	vdda-phy-dpdm-supply = <&pm8150_l13>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};

-- 
2.34.1

