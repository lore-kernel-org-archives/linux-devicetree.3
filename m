Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795128015;
	b=dH158H4fmwvXtmZ8eDSNuXtBwSR0CBuOFf+ZIz4aQPBYH6NKpJwP8WxE2tu55WcP0sl4
	 KWn1tnGa9IqYk9htWWhF2dKgUbjjv7gVp1n3oZMU69toWI51OrL89louygv6aru2JUpx+
	 h/y5F6ixAvzPv06w5zFImTm+gjFolDGqmUHzr2jCaryzh6emOFx2cG7jk4RVgVtfuVzSY
	 7tgNE2jaKL8KAo9ShZ/1/hsLbdJ96pigmXufXuxGu70GWIlNe7xu+yvuaX+OWOJJti+qk
	 43uTdwQQtGnZ33sVh0M+qE4ljgtpfs7Mr/9ebgmljLzeaKSIrpgGtAXNNGECBQUWKHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128015;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JCe/uZVvgGff5XsbOGPVLaxDyiBZTkB+1L/ktif2TQ4=;
	b=qJQEx0QklC+vy2Taze3AKjvox9SgnX4T/g8yJQALqeLUJx24sFGcxLKwTgLqZ4G72G3Y
	 DpzjcaKiOtkpNAIKdr3DmU7xROtxP9c7XZqtfqjq79gMygITKl7WBSAs0ybG3dexsn0lS
	 RNqPgXAMHtbT53QynR5Oyr+AtWT7Cm6a7hcq2f9sPUW8jENb+nejVZRy8DgB4ov8dg1VD
	 GwIXhlffCOlED7IJBM8kNt5+0SNlW1VImrJaLFCifxUbR8tbhCPFL3OOZCkLcnGKAkik0
	 zQn7ydkY4+xSbTc3BS7PWnV17tJLdFxkWFtOPLvpg2NxviBuAMivY1/s2CzT/e9RTvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SnrSLpY9;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A5B606A334;
	Thu, 19 Nov 2026 22:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SnrSLpY9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795128015;
	b=VnSs3GanDJMOqSrse2tV5qZnJL2yk+ldlZVphnRGzT8X6h/dPjxsRfgSPYBFPTkWQbfx
	 wmt6m8FG86Qy8Uy8JYl5j1XiJOqa5v+y5sEaW/pMCnXaGtCugOea0FCYtFxOEcrzNdIRB
	 GIh8e2NiMBp6gDSsiCXafsxIjI2MSGDnqEzwlus1Rs1PlcAgqR/dPmxxKCRkhC28UGt1w
	 YZv8SFaIDBlAB8T/GzceWyMq4mZjGvc7PRcfUG6qDvszoRqd/5kJetsNXyBIpWGLQw8rk
	 zRGtZUknOuKw8s8Ex2SdI0RrND5QtSGKqfwPSdjQtyV9ms5tWHsrudApz3srTYxFGCg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795128015;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JCe/uZVvgGff5XsbOGPVLaxDyiBZTkB+1L/ktif2TQ4=;
	b=kcBlOjz1lp6Rbcl80e7wJw/1CbT7/Q0PxeUMeXRiuMsUQzlNglxfDGQ5TLPKkc02xZ8C
	 idWDfOIZUso9UZeA39IicpsI1crTZEgvEax5SX/aZcPAxHpHpMbQSDrK15ocFqEv/BsMC
	 EIzDbl3KBRbF25r6XSrPQVhmXKZjbXDFJkrxVVkEEFs6SclkrDObRrCkrw4uYBC9mdDPr
	 OKBNdlCREAfuo9MB9u+3t71jdcRqky2WDDdXf77yYnaSTJOdTN8M7ykxkfA5KSsjBzWVc
	 8kNaePBYbH2lvGW0X6gWnh+oCpQBGJ7B/OKFJq4U6r21SLQZ5qLf00TLuo2DaknQ4sQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 498851F000C0;
	Thu, 19 Nov 2026 22:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795128015;
	bh=JCe/uZVvgGff5XsbOGPVLaxDyiBZTkB+1L/ktif2TQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SnrSLpY9UFS6L9ydaJLrkO+bjYDKLtw1BXIMGr5mhyPr4ESV128fP3Xes9OzEheho
	 PaZqMaS37080TXyi8q4hc0ci7XfPaUYplWtBMgRWW721AB1wB/C9mLAXr91lGmQXu4
	 bqBvfqcJV0l24l/CCt9gKHIjxF2aN0NGotx8+aH/LUiEYJXRW/6TTnt4rRigCALgNZ
	 FW4c6UTEEibFtWADnUUhuJ14Ez2SbcYJZIX5fImZK0C1mxmz+dkOw5V6zKfROR/rvI
	 YF5psIFbZ4fcdukoZj05Sf1iHOe1d1M/2gBO2iZQHb5dBIt/QvU7HuEO9QZe6e0QGd
	 c+2I1gQXh15MQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CE758422CC;
	Thu, 19 Nov 2026 22:40:13 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Date: Thu, 19 Nov 2026 23:40:05 +0100
Subject: [PATCH 2/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Add GPIO
 vibrator
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
Message-Id: <20261119-b4-gts9wifi-followups-v1-2-2e2388589a62@dxdmail.cc>
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nizat Mikayilli <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795128013; l=1114;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=LNUGNkotVCwE1oY6OrzDcZJUYNIfY57QMi/3bSwKTao=;
 b=yYmfAn/ldoSlJGnJQOy5sEd3RNTETVwppDlYOHDW7qw1Mgu2sC0OmQ5wwKO/d9SJqEDpbivAR
 x+oPHPXlHCwDizIvKwRVBLQgO4BZdknI+kBSrczDApI2+EY16snO9DU
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc
Content-Transfer-Encoding: 7bit

From: Nizat Mikayilli <nacht@dxdmail.cc>

The vibration motor is switched on and off by TLMM GPIO 18. Describe
it as a gpio-vibrator.

Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
---
 arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
index 8e906b7e2af4..3832ea0deb46 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
@@ -161,6 +161,13 @@ platform {
 		};
 	};
 
+	vibrator {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vib_en>;
+		pinctrl-names = "default";
+	};
+
 	wcn6855-pmu {
 		compatible = "qcom,wcn6855-pmu";
 
@@ -800,6 +807,13 @@ tdm0_ws_active: tdm0-ws-active-state {
 		bias-disable;
 	};
 
+	vib_en: vib-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	wlan_en: wlan-en-state {
 		pins = "gpio80";
 		function = "gpio";

-- 
2.56.1


