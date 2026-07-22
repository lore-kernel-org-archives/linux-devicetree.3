Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E065C446069;
	Wed, 22 Jul 2026 07:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705775; cv=none; b=dtqbpPktuqNACcBfQ65jQIK65qTUbh5UcPRja5lQ1hbGO8uNvgVzX3lRMfISIy0vrx+SB4kKcEhz8Tq7ewUmIFA5bfcfkkQ2YXA8W5qeahyxb8SmdVYkgnjQ0WALqljcVxyMl0x5pIx2dxWSEjmfLAAAfv0za2RI5toeqUWyu1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705775; c=relaxed/simple;
	bh=pFrNQ+vXwn2SVn0jpMivPcgXgNhBFkuVJxH9gKNMncQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYiJ0vBcfqZLPtDxHbc6eQ+ZgkGR37tGBDcv+/CF7Z5GQWqUkY4sMk1INtwq3qeCR4PVO0Cod6a92FEHjJO+pZIbG4hsfFVnhZ++t3dIQggjKa+XYZF46HHn5YX2Xd4pAcJQLrFXdfg+1CBVZm9+4Tvq6ZIyWrg/GOZA3dBIw5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLbLa5ci; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLbLa5ci"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5CFFC2BCFF;
	Wed, 22 Jul 2026 07:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784705774;
	bh=pFrNQ+vXwn2SVn0jpMivPcgXgNhBFkuVJxH9gKNMncQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jLbLa5cizNxLbE+tBTLDEsKwfI811ppf6aV+Nuyj4x06Y14tCMQljYJWOt8daVlq0
	 wr9084x/4iMIOhdGZSVwq+rsOvFi2Jb+iNLXpZ2+7jFPho3zgqh073KYfWVi+IZ75X
	 Cd3LNOEAqaMJfWjz9XWQlZoOIPs5kvanRmTC9pt+Z6dbvEH2rwuDoVrHaYRvcDcyvc
	 PW72YV76wk01psNcFqMYuUsr7CsqJPpP/iDg89x36VrCZ3MGDDKdxVwW6VzvBbCiOP
	 eEUfhr40aZ4HwPz0/Xl5kgQb0+/eBHzDAK2Kc4+iPDcOykBEdUY+OH6oNJyovVrFgG
	 VQIZJ2NUP+cXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F77C4451C;
	Wed, 22 Jul 2026 07:36:14 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Date: Wed, 22 Jul 2026 14:36:13 +0700
Subject: [PATCH v4 2/3] arm64: dts: qcom: sm8550: add UART11 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-pocketds-v4-2-438704cd51f7@gmail.com>
References: <20260722-pocketds-v4-0-438704cd51f7@gmail.com>
In-Reply-To: <20260722-pocketds-v4-0-438704cd51f7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784705771; l=2426;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=UsTWpRDwbdpHTBDdFtzyoL0z7QNs2yHTYuBRh3JZWP0=;
 b=1rICPAMpgfzaqLRPMsXK8tCSy/BSx181XYOQ9ipNkPbK9eQVv0Hb6RRFW/yoA6r3DolZts84h
 JedRbmtzHqrBZoPvtB28dmv00SU+2b1hyGQCyw9WGlxU327sntx+W4j
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com

From: Alexandre Hamamdjian <azkali.limited@gmail.com>

Add the QUPv3_2 SE3 UART (UART11) controller node and its default
pinctrl state to sm8550.dtsi, so boards with a peripheral wired to
that serial engine can enable it through &uart11.

The serial engine at 0x88c000 is already described as i2c11 and spi11,
so the UART node takes the same qup_opp_table_120mhz they use: it is
the same block behind the same GCC_QUPV3_WRAP2_S3_CLK, and its core
clock tops out at 120 MHz rather than the 100 MHz the other table
allows. TX and RX are biased pull-up, matching qup_uart14_default, so
the lines idle high on boards that do not fit external pull-ups.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6..165c0248da53 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1084,6 +1084,24 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				status = "disabled";
 			};
 
+			uart11: serial@88c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x0088c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH 0>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart11_default>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core", "qup-config";
+				operating-points-v2 = <&qup_opp_table_120mhz>;
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				status = "disabled";
+			};
+
 			i2c12: i2c@890000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00890000 0 0x4000>;
@@ -5102,6 +5120,14 @@ qup_uart7_default: qup-uart7-default-state {
 				bias-disable;
 			};
 
+			qup_uart11_default: qup-uart11-default-state {
+				/* TX, RX */
+				pins = "gpio70", "gpio71";
+				function = "qup2_se3";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			qup_uart14_default: qup-uart14-default-state {
 				/* TX, RX */
 				pins = "gpio78", "gpio79";

-- 
2.55.0


