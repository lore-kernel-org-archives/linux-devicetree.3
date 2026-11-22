Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795383992;
	b=PsSFnt9G3SrboxLSwTTAWh/SeQ9sUhkvzvd9DMGlBzNfm/++GW/GI4TK7w6782WM1waa
	 vfG7pR81GeVJRMxnF/ZbBVC5Z/e8MAkgZgUwOhkvIxmjwLKlqJmr08KCh4OGs6bUIKaM8
	 MXOgS2bUusvUuxNrKzssD9GOEI9VY6f2692mHm7sgVH5qa6UCNElktp0WaNjuxoE2yJYu
	 WChhuvmAX2thON3M+1SKLNqC0Y+Y2/HiXBTRy/2W8CsobrL2Vt1Cy3KLIx1ZFdxMdMESC
	 FPMie2GOKA7a7PeApvA8ozJtJqyHZMaUD1L8RPhfMe2bI5Tu0DF89uIjFegAzq9yMsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795383992;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VMStjEXHIyLNfpeETwzCuBR1doycrm+luPBNQ3UKWpI=;
	b=B2uCIXn1epuTmPS44MVEIzgT33D5jzaDe+CwezcFH/3HVetZbsPPCfEWCIhPeuhj8Aps
	 +HNmsl0sK0uLpQhcaw7aS0+hLhcstxdAmh1ygX6UGkgHd3+ehKY0H6bi3RWW2C70SEn4E
	 cue6Gw/K8HbwZsC+y94ZUsuar774yWGj0X4C2p/EE5s0Suc4k8WRvsrBvM5ExwL47Ed3k
	 NsuLzJIrVTchOlflc8ybqsz3/SMmlg7HjUC10ZARDKwfHm/AZaimVoJ7hEQtBEUclkBag
	 lfd0nq7QM9SyUFuVCPSmnlE7VwRJr/UNMt5UImftgHdXi1ZRVFpIGW0YaSrNOl2CGPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GYiUg+SK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A25606A33A;
	Sun, 22 Nov 2026 21:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GYiUg+SK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795383991;
	b=LKz4Fprzl4ljdcvrIisceHxUxoef0aFh5VVy7e/xejMtl+gRzSM3I1qWFDOVmjsx/VnE
	 LgeWACqrEdSUejNiiiUhwc9ZmcNSIlcfs5ZLUGjcGSXD4KfiUPzfyA/x2NbjfpsH0Q87q
	 oM1WfigPayUVjVpkP5+lHthSJg2fIrM6WSrFs8ABWxtHUyab8n1Ok0kIzX9Wa5CKTLVSk
	 SEFLDkzyQtSBm635FQWmNLJGCh1MxYUFwsYjfELcvw4aEtJAq0Z9ZHZfOZVdyp7AAiUhn
	 KoLcFMOQpgqAgQl40+7Yd8fqi8HhNOjPFEW48dnNJ9UcTm0RrSi22wma6DzBkxgo2Xg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795383991;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VMStjEXHIyLNfpeETwzCuBR1doycrm+luPBNQ3UKWpI=;
	b=rLjzm1s24767lSJvdZ8tExm0uBBLyBsmaPxJBFLsKEhVoVFPvK3FrLyNWg4Ud+VDKkgg
	 I9Eub0qKEFArrAtIBsx2Pra7uKwX9KWQOIWePZ//DDaja/yQ2Qilo45xcoxnlDkg7dmH4
	 vC6nMD6X+olBFeVVnnpmYWHN8Fpsit0d0JbhWxd5RaKeOXKa/Px4f7+kTMVg8BaNlCv5f
	 UsQV2zius5FPVIQ7RYK041YBO7MdEmgKgfHSeyRiBqZhYjCzQLBojMQBPmV6SlmoyjAfP
	 0A/bPoOT/RDEwx62ccyEDRkblhXbxWzrOq87+fLGgIiDo4ZVQNQ9Uv7lqFoNeFv8ohA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B8181F000D3;
	Sun, 22 Nov 2026 21:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795383991;
	bh=VMStjEXHIyLNfpeETwzCuBR1doycrm+luPBNQ3UKWpI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GYiUg+SKJKHFnZCU0dOMQU9BC0tUAwcidoRJJ7qIMqe8tEvZql7Anx/F+WPcpPtXD
	 E4Ly/E88yOQsME9BkCnXGssskFytMnzjM20tWq7w6uIjt5DVPolch6C84z0JdXITqL
	 A1TlQzOyTmzGyYcQp74+y+Hq5yEuiK1AVKsTMCoA9PN6WRYTu+QFODoqDRCCtmVH0J
	 3UP65pK0Sw6uVLw4iIepJRscsWRns+oU11i2UupQpjQ+o0OP8pfS9b1otzCSslDn+z
	 syNUlF+pFw3coLa2MKyP92PTc943g3E3xk8w9x4ka/kOJs/HEIwzpSjLW1EajeMuoa
	 11SBXdS72Fvhw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AACBE4C21B;
	Sun, 22 Nov 2026 21:46:20 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 15:46:19 -0600
Subject: [PATCH 4/4] arm64: dts: qcom: qcs8550-retroidpocket-rp6: Enable
 panel
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
Message-Id: <20261122-rp-qcs8550-display-v1-4-d513d9819a34@gmail.com>
References: <20261122-rp-qcs8550-display-v1-0-d513d9819a34@gmail.com>
In-Reply-To: <20261122-rp-qcs8550-display-v1-0-d513d9819a34@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795383979; l=1393;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=sS5jhdq9h9XCoaTgODmQdhNRvP+F/XPgg9IT8jRPQa8=;
 b=zUIshMSKq8Px7GuMZJr598a35qPlLtS8GUNerLpan6tj2oVOxmT5NfJeYgAn6RBgbknYPmwsx
 RuGg3U+O+ArAzuAfWe3Con77SJWqLWqWAkix6WDOd7fVAP7pNnckOX8
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
Content-Transfer-Encoding: 7bit

From: Aaron Kling <webgeek1234@gmail.com>

This is supported by the Visionox vtdr6130 driver.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 .../boot/dts/qcom/qcs8550-retroidpocket-rp6.dts    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts
index 91fed8795d611..5bbec9e1bae7c 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts
@@ -84,6 +84,45 @@ touchscreen@38 {
 	};
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+
+	panel@0 {
+		reg = <0>;
+		compatible = "retroidpocket,rp6-panel", "visionox,vtdr6130";
+
+		pinctrl-0 = <&dsi_p_rst_active>, <&dsi_p_te_active>;
+		pinctrl-1 = <&dsi_p_rst_suspend>, <&dsi_p_te_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		vddio-supply = <&vdd_disp_1v8>;
+		vci-supply = <&vdd_disp_2v8>;
+
+		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+		rotation = <270>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l1e_0p88>;
+
+	status = "okay";
+};
+
 &mdss_dsi1 {
 	status = "disabled";
 };

-- 
2.56.0


