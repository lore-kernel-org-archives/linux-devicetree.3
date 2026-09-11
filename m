Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A1C3BFAD9
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106876; cv=none; b=rhxNUrFQxtOgCHih89ATeDdMMlHgJspRx1QeX0Y3xX/GSqKVpg7ZviMcUgAhB1XqRo53Zcdme1obLxHdNrJEDXS4fVpNYetkvDVcgTuuRBKOClhsrd3UkTwHEFDEyK2gyTeNOBUx2ekd2gmU987aDnhVxABPfGmuc9xNIgElClA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106876; c=relaxed/simple;
	bh=Cd3mY4lw6O9CiLPwQeOysjmDupIzdSheTF0aAisYNPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BLqHBdb/ubRQJCrWHOII2TzBV3Fdsiw5sxeGCSwYuMQSjgpKg6ylxOKyh4/XTINc5tX5bRZoUUr09nop6Hba6azM9yffo+b44UJc2b3eZYBiXwYtALs1J7iHejBnh8ZMMshqa18ZTGdlLdEGLsDK98POyqn3ptUfk6dAyYt+85s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdQ2N6kI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NeHhdzOq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdQ2N6kI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NeHhdzOq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vYDa2634893
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yePI5KGQotMqq3u/jk5fb2td3xJ9uYISnnlPzF0G0sQ=; b=cdQ2N6kIF14wUYsQ
	oBAFowzdJM2T3zOxUez7GDYxXR9RB+DA3zOVNqpj0jF49kfQBFbd/Z+ebX/NXvaE
	wvjamZwLmAcyiImjY2yt7oRyF2qHY/GMdzqo0lyOew7WCrdAgg274t03rmz38GUW
	ntUCo93WUKu7bxxVoFGAipR8pEb4wQGqCZP94ANZg6skc4Pgbfr0jDdW0WUR+sV9
	3UuH3iBvYiv/Ejvt1U+jlOhFU/4zkOFf9VJywTYWP9ar0BwMgqHwhkr9MkVNZRaJ
	T7XeFXZIVP/n+pVk7fKYKoK4/Yem8si4nycIOEvN60kzvsE+XEZ+t9uTNoA/XxPK
	MQS+mg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx3njh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:07:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4a447d275so971306a12.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789106874; x=1789711674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yePI5KGQotMqq3u/jk5fb2td3xJ9uYISnnlPzF0G0sQ=;
        b=NeHhdzOqW5Cu1cZbv7omzSTQ1qbpvEnFaXr4rdcAjhsZOcfk1NZLYgNl/jEIOvzmhZ
         oWceTyIrBgTkf9mv5qWSZh2IZTQUoGpFEC4OUp37SpN3UpI/W7I/e0Y9Qfa5jFHF+/ny
         n1ctQoOqrxw+RV3V6/oEfbnC18oQ/YjMylTVQjX2ybB/EMTDEWcw57DDwKhKjcpi7QfP
         RXWztfydu0excRv8Ju4SEjzsmweXbLoIZ5viHfkd3SWKjIlf2eGUAjeK82H6M5VHpgAj
         KeJgSNyPjMIt+r7WjFuzic8gLm73L03H0izaR1GYIqkvYWC/Rn8jmeCYIcVFav+HRI1b
         agRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789106874; x=1789711674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yePI5KGQotMqq3u/jk5fb2td3xJ9uYISnnlPzF0G0sQ=;
        b=HYpU9eEUABcFxMYiB7kYaLa0y2uLt+KVL/C+rfQr0UdqY1todx9+y426ANVcJ9VRci
         tQorGIZsH8Su5tsX9w7YvHxraKnXWpSxlc8Rqj2BkCbBk6l/AHrs8/cQEi4Gguz4Kv/K
         9fxCk+/lCgU1mBB2NGjiYaRa+VnIAWY1qmPErMlsykdJX00Hg0GprHrjQwAxKu8qCNKw
         C65j3moZIgw5RXycQFotujKlH1j7BozmS1jdSzR/7VQ+XlD7QYSHljbpc6h/9JnCgvqs
         SciSEn7zad+1hQM6HJz8dQb/N+V0kIguzqS7RvF9LJgY/MrWO1X8FfLgA38t1Z5iRa+2
         OYSA==
X-Forwarded-Encrypted: i=1; AKwUvBzMl2aW+ka3pSWqjWJDZFi13jLL30lr3xOABGMJ70kcLEGq5MD8ojbRmTS1SLsYnLchT4X2ZT8qHEK2@vger.kernel.org
X-Gm-Message-State: AFuF++mV35V0qsVSiVf+UGSfWH8S3kL0PQpd4/MDYkwMNAibE8cKLIU+
	mqyRqJnQFcnQIzwBSU4nw+Ej68DsQNljtyiezpuH/J/Zka1AcROTsto8D5bKJJHrNEeobxpraKB
	fBIJeca/8zp4snYEVQ7PM4a82djlhlf3GMQyKHX1FOdDtGnk1PWTzIJ6g1tPuJU8W
X-Gm-Gg: AYBFou2VNdugPJycGppMCmQO/jTRKV9LQvVF4NbMhbLRR395PjgQWMHRqWBZitLdvGb
	rYA+3tgAFlkv2PeEeQRztDb4qA9eFbFjJuTMMZngv8+bef3tqe+yJ2wF0/zaIwwDYxXdT6lGbRa
	LR5PSGk5z6DiuTGJMLvdSzAvqYI1Epscgzmhu5TAnUABDNwyc6/dakAjvw5IFYD9AZRYABwFRv4
	aN9V3jKFm6mUSqwD6zqfkbM8hlFi//5nMzDb2NFV0WZfpxVEAegqgOvfX9vvehMPmlhFd/72eYF
	6m3lJ2k+G27Dwc5CfNXtZ3dZIYIlIVbyzFJHrdNNW1Gj7Wd/hD99SbtzChBPTT4KiRmeeu4rMEh
	Q6flz8WnyeOKFhaI=
X-Received: by 2002:a17:90b:35cf:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39d9c2114a0mr4364282a91.13.1789106873774;
        Thu, 10 Sep 2026 23:07:53 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39d9c2114a0mr4364215a91.13.1789106873257;
        Thu, 10 Sep 2026 23:07:53 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fb3ddasm2989933eec.30.2026.09.10.23.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:07:52 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 11:37:20 +0530
Subject: [PATCH v8 3/3] arm64: dts: qcom: shikra: Enable USB controllers
 and primary Type-C support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-usb-shikra-v7-v8-3-851ee4bc0eec@oss.qualcomm.com>
References: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
In-Reply-To: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789106853; l=5483;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IADNJGu05uB5Yv3hUj9tBA9g+5avzypFsPKYMeiw32s=;
 b=G1rszEnMIndUp4/CXfGvoZvcoCN5IcTKDF0Pxq8X8FgtnlKUcFC9xkr1rySkJ/OEaK/Dwcw9f
 DQW+R+QBrniDGlxiwcnJIvYGcJS72vx3qFCkx5aQyqr/Fe4vsZSOvm4
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4MyBTYWx0ZWRfXxVVSX25viZm+
 zc+g5C4WzAQEkC7wov9aGisAaOYsxqqQ/Jn6IDbY/GAUjhgagzSU0WENgaYFo3qjkQ6wS1rYYit
 D0TkwhNA6LvgcvPHgcYfEHsPi7rh5V8lgKgHyJ6Fvke+GdbJobT1Ykp8hzY+S3pSrv5fZH6LRm1
 ptiueNtx8pJdGBmFrbpN5UtNgqQgoGLSGKCHZiYepCTDTITTkEJfDKVegpRLgc8z81woWnNWz6M
 sX5VzQ7hiZds4W83vVq/0CA0WQhtjHg7YrXL1TqSpJjadyy7YojaGJLQOEUFc90sm3mmAwTrBab
 dn3wb+XqJHL2PPZvRf48nJXNsS4sgTwx1P7vOM6LGticuHnumXnu2ImHYc85qrqDOrTxRZMvfyj
 /2/PfwoykbYkRXil7Lkaq4Lmn3hud4VZumyqRtvsbMRpr8+nftohGFTUI4NCicy1puIfTw9gYW3
 jVAvZoJ5T2+n3RICGYw==
X-Proofpoint-ORIG-GUID: XLAoDJ5NSSBPENwYPlF4OkoiuxmkXOAZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4MyBTYWx0ZWRfX9jp2GA632S/S
 g+PM4ftgPdf5/XfS7VF6yogcmt5fUvUmAVDxLXCi8BqVCwqzYq0+ZOWIl0BQxjJ0KcDpXZfbBwu
 UnhjAMY7yaF03eU+D4IrpsaDuIvqg7Y=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa39aba cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rgYtWjQHuMCZsFrwjbgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: XLAoDJ5NSSBPENwYPlF4OkoiuxmkXOAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110083

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
index b112b21b1d79..286ea46d0c36 100644
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
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
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
index e62ba5aef71f..01400612d147 100644
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
+
+&usb_2_hsphy {
+	vdd-supply = <&pm4125_l12>;
+	vdda-pll-supply = <&pm4125_l13>;
+	vdda-phy-dpdm-supply = <&pm4125_l21>;
+
+	status = "okay";
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
index 727809430fd1..543d769125ef 100644
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
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
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

-- 
2.34.1

