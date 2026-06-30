Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D093A3D75C2
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 16:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782838651; cv=none; b=IsfeK1oSk+DRA78uLNvzw4gHpxVxkjhpU1tX6uh7TfsM61AngvP6gK4RYm/SbdG7KpAHb09PbH+DDw1RjWRIrQTnLWxIf/gymo+BiET+xjNvx6CbnzjKsPjEEISjcVzedOpf3HMl4pAkMdIbshaUY25EPZEk5Q/8p0vIUOw2DWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782838651; c=relaxed/simple;
	bh=FtSrgC45FXuU72qtV83eFk9spgUvKjy95UIvIbL30ec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CD6QI/dQmvjS3l4L+1guRUr57BBkfvck0yiQxATyqL5uFgTOe/PHeUNB/JCO0gqWY+CofAYCGgtIC4fSZWBxUuB8KyE6ox7aWuR82PDaqciRw9Jr1iqUgdEzb7l+B8CinY8rFNmjEN8gMGGP93LVefhK4v0PwrmWhvKBmTxM0ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHjaNpx8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOl8RRta; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHjaNpx8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOl8RRta"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDFJp2216759
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 16:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8YJC20VUmc8
	hG0TDIKBt7XhKJfZsFAsHt8W+4dAsV2E=; b=WHjaNpx8ZdH9l9N7AKcn3RmsStB
	L63mlhqo9Z72bhGi2ce3/Y20NPtFwoo2DatKVDWFL+Ajot/VpaTVa4aPKDmSBr6Y
	iRse/RcZgPvYULW6A2Tm+JoIDGE2yrf356yQC2f64bikg0kbAnD1CKXMV1te0DWR
	5njWZVHxuyhDaYZeUHDUDLxs+GJkTVjhJGl8qm9xL204i0JimQGK2rYvwY5cUcpR
	ueXYrmXsKGd2iwq9dxeSP4tB0cPhnR0yDCqZAWN5CWfZ3O07fSnExcI/M9eqU0la
	qWaSPIyPFbX+PCRIqHPZgWLo257koyjPdo7NKnwypFUjE8ZiAjesjjOCNZg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfku7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 16:57:29 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139f2c46ef1so3751836c88.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782838648; x=1783443448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YJC20VUmc8hG0TDIKBt7XhKJfZsFAsHt8W+4dAsV2E=;
        b=iOl8RRta71U5SEjbdNE7NBZvbFGTmsdn+oHe8DbM8zimF6aU9rvEbqN0ysbY+RkaQA
         OE1/mDPQ0NqtjPmJvAEBmsJOccAWF7zHr4LFKRu7fCKkNARgiXKreBpcQTzejk52rvwZ
         lX4EoUleMeRR9Q9eHWbT4dXcCrzqo0Lp5k3hcc32b2CF3VKrC+JKXmypdvtlw8oLlfT4
         IYE274MZqivNtmY05elXlb+/ZyNY3MEyfWwvAg5ee24Tm91E7Fj//Do9G6yfxzqUq85D
         5tRa4HRJVZUl9otpHkXAoAxCOVy0jkW4JpmR/isYtQ4R7G0FLkNnDBHuOQaC2YOafwxj
         QMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782838648; x=1783443448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8YJC20VUmc8hG0TDIKBt7XhKJfZsFAsHt8W+4dAsV2E=;
        b=az7atXOKZHGV6qSa55Kglltjko593TbliioHhbBhgGQvehRR/K4g/zELfERoUE8tR8
         QHND5WwOnhAvgyYNoLFNxaCH/GVfLDF8IrKgVSLsHp6TnzY5vNWXX7N1Dh86o2ju4WxJ
         I2OxFJlwLlhH/VW1tSwPlJg5WnHo7+XkiEPtlH3jRVTirpJrg8peSBeUh4D5UIJtUZee
         jLDsf1HgpNikxAnYNgY9uuzVenKTpHR2wBUs3FFNZu7otPj99xfuXkj7lu5klRK6AeNS
         TiZ7A1nMAOJ1GfkF+yK8rEM6S1EnXYgHfg9abAyOqh5wnA3zDN0TIWMPzswYBAcFLiCf
         SSSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/r3DhiUyyVeJpEK3T4cx5uA91UQyq+czZPoNg++i3ZXNAQTVpiq1/SPE/ZwtViHSWWeJDa+PIN/H1s@vger.kernel.org
X-Gm-Message-State: AOJu0YzdNGslQ1hxk7QbiUNMABxMaQ7gGp+jbUZrBYJ0IfmpjEqEHj7u
	ewIjroeZTFjon2O1ZEQB0j6/brIcM8a5egUwr1CLeVuOuhIyrX/4QZhEvKjGV2zPob9tz3qLCJ5
	Cv0567vG/tcBHPUZAyYr0+WRlA49q/6h4KhOqZiVUv4X7hMvkenB2NrNgrLTSavp1
X-Gm-Gg: AfdE7cmVclcRoL+57Z1wFkp3L2GlmBQsO4e6o2W9WZIiXrxrtKoMwHLD00ezhDSwWHt
	CN8RnuCBl5oLiEdZswXjUkoXW22YVH2/FdOOlNq6ratTRcVpGtfIgRt2m+7JERb9bFc8Y6skqWJ
	mt0V6NKKUId65n5wiUgnQy8SeLk+cyc9uHVQWaoDzFKMVTxKTBzJAKsXoCnPRfSOWeKpcL+nLF5
	SUiD6ifiOMIzvYkprzFLYVKg+DAZ1cjnvtVu2E4b7f7U0G36wP33XpvezJfk7V8+Yu49gyiVckX
	yKnBaWO3c/Zi1wkyvJQagKnuHa7QXxGilpq9PIFMQmqNS38JSkN9okWJSduZV7KkrKLeKn95vFs
	vq+aSNSOSq8SCyx02jYp+4nxkWQ08aMazzowyURDRopvkjQ==
X-Received: by 2002:a05:7022:1e10:b0:139:f6bb:c907 with SMTP id a92af1059eb24-13b3142abe4mr854589c88.18.1782838648454;
        Tue, 30 Jun 2026 09:57:28 -0700 (PDT)
X-Received: by 2002:a05:7022:1e10:b0:139:f6bb:c907 with SMTP id a92af1059eb24-13b3142abe4mr854548c88.18.1782838647886;
        Tue, 30 Jun 2026 09:57:27 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2a9b425asm12690272c88.0.2026.06.30.09.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:57:27 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V2 2/2] arm64: dts: qcom: Enable SD card for Shikra EVK
Date: Tue, 30 Jun 2026 22:27:00 +0530
Message-Id: <20260630165700.1886608-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630165700.1886608-1-monish.chunara@oss.qualcomm.com>
References: <20260630165700.1886608-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Sq5n7kdmeODrV725vbamYxayD30rJYZG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE2MSBTYWx0ZWRfX/bh8wXtOBJ/C
 b9Ll6pUYt6nJTRFeS6xm9C3a0lWVKDlr0iqzIlfE7UkPm+oGifLn/1l1cucWzUbK2youxIMMI4I
 kqt5uwTftUJWFSpWbUTbpm//+j/REZ80f9yNJrTVnEWvh6QBO0rBJ4NCtAhNLhbeE9q5xeaoJ9d
 tesJbTJOow9GXRuXwlISNgJztBFxrVYQH3cgO7O66zb0A2S8DiN6ZPfPxDSaS2tOGmoF5X6l65+
 NXtWaNgcHr7vnBr/scSkmFq8s7XSX2A4ZNtYdpcjZxZG0eJZhKDWd5VaJVmheyC0CHr+XbGDFBe
 wqqddNFkuRpuYKSsfbHE8aTruW9/5RQ8+yRxiXOwIQ3mP537vFD82TZ7VU6sR8ijVGKXC+Cofop
 JvK1FwJ96fWGzZww3rBVJ25YkO+xFpt3OwcPNc0sG6h8i/T0KrlOazp5UGvFSrvLnZAC4Ei/j5s
 OK4XTAI4YSNULcBm7uA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE2MSBTYWx0ZWRfX+LCKMJ+IBjQZ
 rhO6+XfmEt2DPSM5Dq0EMIzmMQr8DgZxoXynG0iSpZj9QFyqclXsFS5T0SmjS6a9W4OV6FOSGPR
 /+uYbxELjH63wgriaNXiRsdGC0lcRTg=
X-Proofpoint-GUID: Sq5n7kdmeODrV725vbamYxayD30rJYZG
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43f579 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=5uGxXp5b2Q1zeZBlDmAA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300161

Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
vmmc/vqmmc regulators and gpio-based card detection for each board
variant.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 18 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 18 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 18 ++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 683b5245923b..8212bd41f74e 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra CQM EVK";
@@ -15,6 +16,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 		serial1 = &uart8;
 	};
@@ -95,6 +97,22 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm4125_l21>;
+	vqmmc-supply = <&pm4125_l4>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 26ff8007a819..5341e145977c 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-cqm-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
@@ -15,6 +16,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 		serial1 = &uart8;
 	};
@@ -95,6 +97,22 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm4125_l21>;
+	vqmmc-supply = <&pm4125_l4>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index fd691d53a0fa..0548de0d3a74 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -7,6 +7,7 @@
 
 #include "shikra-iqs-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
@@ -15,6 +16,7 @@ / {
 
 	aliases {
 		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 		serial0 = &uart0;
 		serial1 = &uart8;
 	};
@@ -103,6 +105,22 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	vmmc-supply = <&pm8150_l10>;
+	vqmmc-supply = <&pm8150_l2>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	cd-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
 &uart8 {
 	status = "okay";
 
-- 
2.34.1

