Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016577;
	b=gwlbouwEZXUy+cvKTsvswIG2nMksscmaCSIHguiGbzzDKsE+OqHVoEeC39vRZrHIXrS5
	 aMhQWy9mmQmxoY221bY0JFOjnxjGvF2v3nZiih+CE0NZAdfFU5/N+y91YHHnyVXT+tZKB
	 TOyHVakkOJglj8AP+cbtTAvFqkBZBZI/N3S3AJVsRbmnKBOKtF2OlZoOODTP9SqIM8Lfo
	 YrpaV3llhGTAI1jDh78pbqwhnumZxaowFVotq7LbG9zR2u5e9lvNMDej7wB74zbPFAGFK
	 Fv0JP5hxDyacs5CGMHYfEhwm0i/FgQlMFh0XXCF5exYJqoVc2bpKyvf873lPIQ+ywrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eRu2LVCDgubTg9L+en5PQ0GMG00gbHZnnd7yh4N4PMs=;
	b=Rigk1XjRC9CP1D4YODKIzC0dXcTmNaKaxsyqVQ7aashpRJQAW+UoNcAbvyQ46F6eVzF4
	 aM7HQ+YjzCucG9zM/AT8R+jHnsGCxnX/hP4CdnNuMhlHnUwdjG6Ie+/i1zmse5+7fqZjJ
	 0xh25UmJZsL5KTIJwxcsK35kIiSOZcFR0PIU0oOJiXQdesaz1/1d98o7rVWu7q6eD56al
	 YoHoWOFFj9Vp2RId5WPWe6RacwgaJ1QB8XyxBsCZj4XFVHxVZIZoiHWf3yFAskHspFgnv
	 cMbKxe81n3jbKUG6gKxuUsoVPDZkVGK/7z8nscSypz/pgM6tTUmwW+rf8i34DsiZ9aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="IQs2v/0j";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EBF606A33E
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49EBF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IQs2v/0j
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214af2076so20400665e9.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016576; x=1793621376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRu2LVCDgubTg9L+en5PQ0GMG00gbHZnnd7yh4N4PMs=;
        b=IQs2v/0jC8aDeoR5P+VbANJ7GL91aY0Nfs2pVHNy3kzjK3e0LNrpttJ2VkKaCz60JU
         SJJu2wEmAqxG8I2srwK7U6Cvg2noGm2Yax8ylVX/AcOsQHasnUVzieRYN2P7l8ToyrgJ
         zxLZN9DcYU7hQ6muYRJ4VTvNwJACEormO7ZV+tzApPKQ20xuYiEaqTudSHuxDqcktWN8
         mCohN/TFVUZ0+c89kiIn6RgTL60cZ4EmzX4WMoDyBVVscwyrpkaTUYBf1BpwG5PtlNyZ
         l4D0/bVzD1TNFNuOvmDNPE23gdPz58SGq6iMr3/hE1lYTiqX2URfk1wkIC+QNh9IcvtL
         r76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016576; x=1793621376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRu2LVCDgubTg9L+en5PQ0GMG00gbHZnnd7yh4N4PMs=;
        b=BeknGCmbDLL9VEWJVRE222AzkC14AjqWcnNHuLNM1/PxhC6RQXQTEiwgefNrduhlSY
         DyoJaL9Fu9VGXP0g3l4R5fu8lh+sUL1Wi0SmvKNtbbk63ZruWn93sC7NBzvRlyqt4aPu
         TJAPogz8IqcWnIOKQvQLtBZJbR+1cDuKgoK8qCMqBb+zyRq1Kh77CFPo0I5oEM0oD/xi
         cOXg35h5cVyhnqMV7zsPwLTh9xBvhF90je6WMDdvRIC1y0Bwm+DqFXSoHuzt9Uk2g6KI
         28Tub6DTPup+XzI2/eoh2TqG3lD7bLxbf9VYkR21rW8WX9850ImphaROhi32AGbGUWFN
         XXRw==
X-Forwarded-Encrypted: i=1; AKwUvBys1iVGpx7msx92jmZMuhnOt7CdYJQOAO3UXTol77eXUtW02qzHNLw4Gm40fKh9OhF03btazJsOl6o8@vger.kernel.org
X-Gm-Message-State: AFq9FYJKPO7ijs0j4JtmPbmaaYVMF6WVILjCEV7OoUYXYUV8eihsamVX
	kosTPAFXa6xyVf4fKr4U9mD/8XjJqQY6DEhagnCapbZkT2EK9rEE4kgA
X-Gm-Gg: AYBFou1xKCF4E+KE9Mgxp1Cu/gLj8Jk5LhH5oWVRNtKGBmC9VgHQxjDZHBbedduBEox
	LmEEA/UVxJK7ETeYv0rPcbm14qMPLan1/UH7KDWYfxa1t6WJKNmah05SKAUOqXB+pbV2pdRa6EJ
	jgZnsB3Gpl1FrlHfsGXbHOALrM6+b0eud131S/320hmgekq1muPfzqCeEmgHSpfnLcSpgHaCNKf
	CKV00DB8iY+4PsbTLjcenKzINjbtYkRP6iyaZlgfdXil+aHq4Jtud7ci7dynAOoKuqbwSSs92Pd
	XKnPXk3rcY4sbPUsmFw2jKPZOPtk6l86+ZqkJ+7cRgy2o56Pc+UUoi3IFuBOH1VYB09wErzraxQ
	rKxohkwvFdEbYb7LORXwFO9GfEht8TQk+T0w0Ltq52+FgoINWwGmMU9FK4kscxPvZ5QV4q3hlfU
	vLWYdiJAT24s+PIUUUlAjkPialKGnKTE42jNsTlhuWZto/XUOUUT620xEugsNUIoewIlR8jvNvM
	m2fgDrwXSUi8s299ruJD8ivue13I7IZ3A5l2HGhioDyEkRLI0FkKgPvzi2DzUmu6V+TPwA43BXk
	JGoQ4uiPY7cWjPwHRrTjQT+r6JvUwsrgF4rN4M4BkSMWyA014Sc310Va/RkM7QPGmoRuUPYhGUv
	tZOH+
X-Received: by 2002:a05:600c:a012:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4a35ac95b2dmr110048655e9.16.1793016575542;
        Mon, 26 Oct 2026 05:09:35 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-234.xnet.hr. [88.207.14.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm152200695e9.3.2026.10.26.05.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:09:35 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: ipq8074: Add CMN PLL
Date: Mon, 26 Oct 2026 13:08:15 +0100
Message-ID: <20261026120920.1667982-4-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the CMN PLL node, it will be used to feed the required fixed clocks
to networking subsystem.

CMN PLL provides bias_pll_cc and bias_pll_nss_noc to GCC.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
- Drop the _clk suffix from the GCC CMN PLL input names.

 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 75a5ae30d966..b08efc959379 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-ipq8074.h>
+#include <dt-bindings/clock/qcom,ipq8074-cmn-pll.h>
 
 / {
 	#address-cells = <2>;
@@ -15,6 +16,12 @@ / {
 	interrupt-parent = <&intc>;
 
 	clocks {
+		ref_48mhz_clk: ref-48mhz-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <48000000>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep_clk {
 			compatible = "fixed-clock";
 			clock-frequency = <32768>;
@@ -257,6 +264,18 @@ mdio: mdio@90000 {
 			status = "disabled";
 		};
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq8074-cmn-pll";
+			reg = <0x0009b000 0x800>;
+			clocks = <&ref_48mhz_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref", "ahb", "sys";
+			#clock-cells = <1>;
+			assigned-clocks = <&cmn_pll IPQ8074_CMN_PLL_CLK>;
+			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
+		};
+
 		qfprom: efuse@a4000 {
 			compatible = "qcom,ipq8074-qfprom", "qcom,qfprom";
 			reg = <0x000a4000 0x2000>;
@@ -369,11 +388,15 @@ gcc: clock-controller@1800000 {
 			clocks = <&xo>,
 				 <&sleep_clk>,
 				 <&pcie_qmp0>,
-				 <&pcie_qmp1>;
+				 <&pcie_qmp1>,
+				 <&cmn_pll IPQ8074_BIAS_PLL_CC_CLK>,
+				 <&cmn_pll IPQ8074_BIAS_PLL_NSS_NOC_CLK>;
 			clock-names = "xo",
 				      "sleep_clk",
 				      "pcie0_pipe",
-				      "pcie1_pipe";
+				      "pcie1_pipe",
+				      "bias_pll_cc",
+				      "bias_pll_nss_noc";
 			#clock-cells = <1>;
 			#power-domain-cells = <1>;
 			#reset-cells = <1>;
-- 
2.56.0

