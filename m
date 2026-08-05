Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA87E470453;
	Wed,  5 Aug 2026 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934991; cv=none; b=gfKRut+gObwCJ3Z6re30epC5rcSYM+SEvoQPATXhSxWJykPqIgAaHRZsQYbJGI329Hpigahk6RX8SY3qrAWmzc5mUG4NVdPVfE7xYkipFWks5ITO4TweFGAjyPUbkfiagV7Viu56dNZ6p373hBRUrbO+4vFeyy6KaCfajVX1aRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934991; c=relaxed/simple;
	bh=k65C478t9LS6ybUmJ6TjN8D7vgzFZCksmeumxEQZ8Wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=omf5v/6duArtZrgtpqJxjbZq+7V9qZW+zYcntZgc2R9b6ArFRd41HoxmvuWm1DMIQ4CuDoDdCXZl3Auakq+bztAA8HJcJdHLW3AV+hgzK+092ebvUZAn9OZ/Gl9dcpg/zZD0XOrxxJuyoXwWxnbFjd3rsebmiVSO80D9P+9pZZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fxm5/cTh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fxm5/cTh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47479C2BCFC;
	Wed,  5 Aug 2026 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785934989;
	bh=k65C478t9LS6ybUmJ6TjN8D7vgzFZCksmeumxEQZ8Wo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Fxm5/cThPIOZevQ5H3UJS6ntN6TxdyemxKhBvJmyM8u0MsBV6hddkD/Ur1mSSd3Sl
	 T/J5Mhbxp00V3RaGs8ZMlEsI4+vrh56u5Oe6FF1s0k7xc6I6ZTxK8xK5Dess2ohh7E
	 do6/v73W8GXYHPJANpuXFET1Jdb9blfCJyCBbMogbNsLMDUoIxALwh50DZE4OcpzJ1
	 Nb8+cDCLmsF7SnZbG15MZVyeYnYfmmZ0or8T6GwPzi3D7pYB/L2A9wLbTFfCqSSwd6
	 CIvR9QYd7/ncACUbY8cVf4HUfTb2hONMzZIPrMmWSbrLr1t4WA1EdK9uTK00RxC1ry
	 ssnE+D1iHpwmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335F5C55ABA;
	Wed,  5 Aug 2026 13:03:09 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Wed, 05 Aug 2026 21:02:35 +0800
Subject: [PATCH v4 07/12] ARM: dts: aspeed: anacapa: Align PDB fan GPIO
 numbering
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-anacapa-devlop-phase-devicetree-v4-7-5d67e0efa6c5@gmail.com>
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
In-Reply-To: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Rex Fu <rex.fu.amd@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785934963; l=1875;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=3/IZc5ckSnwOY8uhbyA0jZSDZ3Dvh/PJORxqtTJG7yA=;
 b=O5IL2KSFBxgc8QKzSuEQthUwjyEZXJA7+1rRi8koNG46B/9VSFv59zU4WETzBSUE2UmRLIpNh
 In/jcJiv2YZDfHvX/UaW8z4IjDi/+VKmpHKJCx63UyyLW8D83EwJP7w
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Rex Fu <rex.fu.amd@gmail.com>

Update the LPDB and RPDB fan GPIO line names to align with the platform
fan numbering scheme.

The LPDB fan GPIOs are named FAN0 through FAN4, while the RPDB fan GPIOs
are named FAN5 through FAN8. This keeps the GPIO line names consistent
with the fan inventory and platform-level fan numbering.

Signed-off-by: Rex Fu <rex.fu.amd@gmail.com>
Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts    | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
index c7bffa7c6557..ff393ad7cdb7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
@@ -8,6 +8,39 @@ / {
 	compatible = "facebook,anacapa-bmc-evt2", "aspeed,ast2600";
 };
 
+// MB - PDB
+&i2c8 {
+	i2c-mux@72 {
+		i2c8mux0ch0: i2c@0 {
+			gpio@24 {
+				gpio-line-names =
+					"RPDB_EAM2_PRSNT_MOS_N_R", "RPDB_EAM3_PRSNT_MOS_N_R",
+					"RPDB_PWRGD_P50V_HSC4_SYS_R",
+					"RPDB_PWRGD_P50V_STBY_SYS_BUF_R",
+					"RPDB_P50V_FAN5_R2_PG", "RPDB_P50V_FAN6_R2_PG",
+					"RPDB_P50V_FAN7_R2_PG", "RPDB_P50V_FAN8_R2_PG",
+					"", "RPDB_FAN5_PRSNT_N_R",
+					"", "RPDB_FAN6_PRSNT_N_R",
+					"RPDB_FAN7_PRSNT_N_R", "RPDB_FAN8_PRSNT_N_R",
+					"", "";
+			};
+		};
+		i2c8mux0ch1: i2c@1 {
+			gpio@24 {
+				gpio-line-names =
+					"LPDB_P50V_FAN0_R2_PG","LPDB_P50V_FAN1_R2_PG",
+					"LPDB_P50V_FAN2_R2_PG","LPDB_P50V_FAN3_R2_PG",
+					"LPDB_P50V_FAN4_R2_PG","LPDB_FAN0_PRSNT_N_R",
+					"LPDB_FAN1_PRSNT_N_R","LPDB_FAN2_PRSNT_N_R",
+					"LPDB_FAN3_PRSNT_N_R","LPDB_FAN4_PRSNT_N_R",
+					"","",
+					"","",
+					"","";
+			};
+		};
+	};
+};
+
 // SCM
 &i2c9 {
 

-- 
2.34.1


