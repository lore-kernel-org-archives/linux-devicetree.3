Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4538E4DDB5D
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659718; cv=none; b=Kn39Iq5PcxJBiSsXxpuqbHu1hFACXP0FleFZuh8dX8Errfoni0SvnYVcRCAmPJ7/ga/xdjlVofBi+/uQnkwA7qOiKlaaUhLSHTJTASbdNmX6MndT/qj/fNbHSi/eFmq+tzKMJBzNUDiqdTH+oenUpEkoiAHvZDLstYqVZ9kwKFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659718; c=relaxed/simple;
	bh=Tuw8fjQ4Nitl5LlGiEpAxv/8p17A8gL6CzHwHUI51iM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m3ftTVXTlpBc1ZU0HrRWKiOD5JJg6qfmxTN/FzKIl4bpk9Wl2Uhd6+d/V+3/oayt39PZ43HCyb4ppUWd0oOcjUo0/2j/nAqK0Zb4IENDiseeXbgwHDu1jC+OIeg0J5EzvdA6o3D/qZrQqPFDLbImQYutb+FgmkvFo4L7d9F3ppk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKfXsseR; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKfXsseR"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so683642f8f.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659704; x=1790264504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogUWVPuPz4Wv0AWXXjemfDDswNqsh12xy3+UrN+ebnA=;
        b=hKfXsseRydZBb9cblvkW0Vxuv3UfJjmWrQf9M+2J37yq3iLMzvhvIeNxnKA9JcWEz5
         XX8y/MiY+qUKlt+uU93hO/IQ/hlFWbGJVMUYIwgbC8B7lRIGurCovQw3XmxtKCBXEQ+4
         H1xu1qgrRwr2r5d59uLW9TIYB/MoVvIs+OXoUE/zxl3oOTNatfb61i4s5Dokr05Hh1/m
         Bs/0Tat1hTRDtAoyAhe3akoPJMpbxv18hU6oJzW5CnidNrunSbXDDPat+U7eSph8jCf0
         UTHFdEthvm1LssryMuXMGPO8WwIMgt1N0XxCw8V0javRnTwkxwE2pFx1qw+h8lYk2NkF
         VVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659704; x=1790264504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ogUWVPuPz4Wv0AWXXjemfDDswNqsh12xy3+UrN+ebnA=;
        b=2tKsk7Ulqf+IT0Sq10WmVlMbqps8Mvy783MkXoesAqiy3GmfxTFONOtW5IscfAbpZY
         BpNkxjEO1JarlqHXXgpfB3DQgfZUHrwrG4wD/u6NsFNKQpN8HS9Oh6cB6CT6xSOafvYq
         Pjv4RBQI7r+wdXn5QgWPv7xNoLosro1NHGgP4+chymcn5mCN18Cljnv/8EXi85TKy0aE
         qJAQ9HNiP5ap3uWuKhCSBCNrqdAkLGK4L65uzqvMpAOchg8aSgMEdOzK9uLrEx3VuEg7
         pjkqGh1bHRS/xAHX39AdOVCai/URgtfvvCP8BSMxkEGMT1OUn+OVuK0KiIHMWdFFog0P
         tIGQ==
X-Forwarded-Encrypted: i=1; AKwUvByOJzFSQbLoQxnYiXfXBJGLUmVXiWQEC+3mSo4gKGSFOUrmrZl8M89ontu7KrfHdCrZQo6ybSRxE9MT@vger.kernel.org
X-Gm-Message-State: AFuF++n9Up21kL3gurP0jkSwHE7evST66xudLB1CviiL7iV3wVbK+9fe
	aGFeg8xRu9gQXVba2/7KIJpH5Fp9VRAR9FbHd2RfGE/j0l5zdBeoH13I
X-Gm-Gg: AYBFou3TQLeIycwEHDaVwkHLPGNQhMte+X/Rm2njgZZHuv2JT/AI0VZrgc4aAtTBwv3
	t96bQ1l58ftWayjVdCeGK9Pg8TRFw7p0wslw9FP5cfgFNq/JtCqDiwGd8jbsnRbiyZOE80QS8K2
	UVK5tA62JcfrY+DC5KXSu9Xdy4CfgnFLX0SSyVwKXkJbnaqHsJW4PfK75XqpsR4RlC33EVQYDoF
	5Ka0UVWPpoKoxCW+ZAmZIc8zr3k/4lwdYUWOIZV5xL2oxJps63qWzapRcw06Y6eCjPy7RDEKGuN
	aU0dJG72OQBROFdJaqSbMtM3Lt0Vf2+5IwbRl/SKoxP6fgOy3Y/41ClzcqqZZRWsGu1oLLnWBzN
	g6c4HpVw+g6hlk6XJZn/P4e2iyKiXMHNMH0T2VPCPjdSzLeK+KTT6oo41WVewfFWAtgWzZY/reK
	wsD6WvaieHjK4BV5kqOz5G9bakUbRuHtVskR0aRyJnMMDoHzMVDDoJ4nkmmytqRmurLYp4ZV2Yh
	wJnhEBDIY4mwYkmaF2UuTnh5ATtHMY1FS9vgNNP6uxGaMU0opJpUbkwcWXIViLAgDlAD5gy9/Ns
	yZQVVWbGDe+K2j6vvQ7ePw==
X-Received: by 2002:a05:600c:8b81:b0:49e:69e3:884d with SMTP id 5b1f17b1804b1-49eac45ba21mr81456555e9.4.1789659702746;
        Thu, 17 Sep 2026 08:41:42 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm100124235e9.2.2026.09.17.08.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:42 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v2 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Date: Thu, 17 Sep 2026 17:41:29 +0200
Message-ID: <57aacae2f4f57e877ba32d8082915d6d6bcd3803.1789659585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789659585.git.stefano.r@variscite.com>
References: <cover.1789659585.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM available on the Variscite DART-MX8M-MINI SOM.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Add tpm pinctrl
 - Add comment on tpm reset line

 .../boot/dts/freescale/imx8mm-var-dart.dtsi      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index c7a9eb23e5e8..953950e55bf9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -138,6 +138,16 @@ &i2c1 {
 	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
+	st33ktpm2xi2c_som: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_tpm_reset>;
+		label = "tpm";
+		/* active-low TPM reset line. */
+		reset-gpios = <&gpio4 31 GPIO_ACTIVE_HIGH>;
+	};
+
 	pmic@4b {
 		compatible = "rohm,bd71847";
 		reg = <0x4b>;
@@ -452,6 +462,12 @@ MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK		0xd6
 		>;
 	};
 
+	pinctrl_tpm_reset: tpm-resetgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_TXFS_GPIO4_IO31		0x19
+		>;
+	};
+
 	pinctrl_uart4: uart4grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_ECSPI2_SCLK_UART4_DCE_RX		0x140
-- 
2.47.3

