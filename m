Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795013896;
	b=XMOt02XCiTkpTzYq3RdABGNOayv5CFAb1S+gwXCHYkavr7P9R/DzeWdNFbT/RYoj0Cgo
	 k8yiZEA2KSHuWkegZbSMeTWP+OmWTQXEntOM0uZAQDGjR2NToBmYn66v8AHXnaLYR/jZ/
	 EOFOpbmpB0TZvFN2FmqVpc0wZqOI5WLQpypypHNvaHuoWpCSKc1upEXvLGi7AEO0rCi5Q
	 nQ3nuqtO3H+lqaGgnlf+2yaEgHZQEp/m1roeHW/yYqF4lk8/f31J+QiW/eHuCd6vUgCnf
	 F+aKLLBPB3LIUL7PPe/SSY7PfhcmsGv5NqqrkRjWcIF9db+MdIcbIC3D9Qe7ngRYOYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013896;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MOuIBGQWs5sGN8K5DHuPSVOwlo7mEm8DvQe1H+lfl4I=;
	b=XMmjkuGufpkr0Frmip1K7+60B9CpVbjRnQr5ROhrf9XFLu9l8elUCJs8nW1VO3yErXci
	 FU6xcG2P/w8oIKvlag0CBQz+nTLddBd5VUYS7wGceirJcB+gFVubFoWmfNri3W4+Rwjow
	 wYdLBHuTpD1RHs5pnJjEf3BRP3FXTTJRkBqKR/61/1vTcffmmtZqnS48CfoLS0Cy1fpV1
	 2EvPc6W8ACh71nOoSujZJDeA8fMuMcG6632uykBjVQ/UAlB5MV25a/zyhnFndPnKft0kv
	 nbasm0+rCprUit/JalLmk4IKIIC4oPH+TytLGuWlrpysnE72rQMImcTYTji5v1Gdf0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ab4JAKxm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A62606A332;
	Wed, 18 Nov 2026 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ab4JAKxm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795013896;
	b=hK7rxjS1cPZLCmKfvXIoP27VCxZNcUgtfHwdIGbA7J50hnpwZ1YrpUpvB5X6OSTd+/iL
	 S0SYej3GGbh3JlxeHt4CeObt2PMyhBt0mUMTcUxxCKCVVVkc4qstVP9J2A3fTB61GtbLx
	 pmeKtzzJeOPYID2FKaGKLvSMhSddtiamHV7Py9xnNPvuUeiWDZrNnMPbpUv1qjptYWGmd
	 aTi1tol70JLtlWwCAXSsl1Vev7NXdKG0PgpgnIxq8fIAmuqTfta8hktfBMJB3cxODYsf7
	 FhQNZt7c0N6DnUxAOhLYHDRIWD5V1r4qQYbqxiMia+4mojcaNXNMBLz90wTTIRVVxEA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795013896;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MOuIBGQWs5sGN8K5DHuPSVOwlo7mEm8DvQe1H+lfl4I=;
	b=eoDd018+XP7lfNtJS7ERJW10fxO7gZliRzrCGxKVVDt6g21zoErQKehaiLp00lkUPzKp
	 r42RHNzUCHFf7W4OTb4O4vl0M52SBsbtiJSAEjUJJVpglxplGeauiZAgU6OVVjfAsvNoi
	 cAucWjgbianojIZTtefHwanyG1ZsZCjB6wxzLw+TQ4DQFQTBfZha9VK3qnaoM2RX9QfpT
	 LpixsmhugFTx/tORqygjlHbKWzkasPQPvw5tBqO9dXz8S714+WkUY/55vBhI7KjEky4y9
	 mnsfOO8N0xZ2nYajhjeeFchqMcX8kSxeqGb6gYAooxskfKgg8+RAKTMR9I8+sC3hB/w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79BB51F000D2;
	Wed, 18 Nov 2026 14:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013896;
	bh=MOuIBGQWs5sGN8K5DHuPSVOwlo7mEm8DvQe1H+lfl4I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ab4JAKxml+etLmkynQlN+EZD8DWIQHrhtp3gRTjiP4qn2bYvK5KxbNTWgWH0+DYd3
	 dxyRejF4wDsa5nmNATtD01Nh9uxQ1QVk/Zy/aLoMLW1WqD28DnhxfrwuIGDNC3wIhI
	 HHXeSK+usdEgWtbswe+ztSENjvgxWh7WSEGwj+4i9hhJ/xrOr0x2zfng7qeElOFxmi
	 u/w8ReHq052Y83uxvJS/U+MRtZmT3p/Oied6KfnjqzyxktWyephbux59AAZhUuFNbD
	 u8/Fst4I1KpPmbrfT3kzB7d2V26+4/LCYc7qV51Mwhp26bFCEaIyP0F2dojaiGv/M5
	 mmGUcC292OQwQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E7CDE4ADFB;
	Wed, 18 Nov 2026 14:58:12 +0000 (UTC)
From: Alexandre Rapaille via B4 Relay <devnull+arapaille.atlr-engineering.com@kernel.org>
Date: Wed, 18 Nov 2026 15:57:59 +0100
Subject: [PATCH 1/3] ARM: dts: qcom: msm8974: Fix WCNSS wifi interrupt
 trigger type
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
Message-Id: <20261118-wcnss-series-v1-v1-1-a64d82e151bf@atlr-engineering.com>
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Luca Weiss <luca@lucaweiss.eu>, Eugene Krasnikov <k.eugene.e@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org, 
 linux-wireless@vger.kernel.org, 
 Alexandre Rapaille <arapaille@atlr-engineering.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795013892; l=1133;
 i=arapaille@atlr-engineering.com; s=20261118; h=from:subject:message-id;
 bh=MaQVT98wnph2fsIYy92R7mv28iUAmYxaqVosGLAJYjY=;
 b=qJE8Yy6dz5M3QuwzvE52yFw8Ya1IOwtAB1TFs/BE9pSEEzRQZytMHkzl8FBRWBFWVQhUPR0lE
 8r3KPFaElCSA2TRjFC1+uA670WVR9cDIuib+6Au2Wvrud/apnZ1DFla
X-Developer-Key: i=arapaille@atlr-engineering.com; a=ed25519;
 pk=xskH/sIiNU/aZCeGeBB1TK/AuiG3MXlX0m2wMlbMl08=
X-Endpoint-Received: by B4 Relay for
 arapaille@atlr-engineering.com/20261118 with auth_id=1560
X-Original-From: Alexandre Rapaille <arapaille@atlr-engineering.com>
Reply-To: arapaille@atlr-engineering.com
Content-Transfer-Encoding: 7bit

From: Alexandre Rapaille <arapaille@atlr-engineering.com>

wcn36xx requests tx/rx as IRQF_TRIGGER_HIGH, overriding this edge type, so
the re-probe after a WCNSS restart fails ("type mismatch, failed to map
hwirq-177") and wlan0 never returns. Use level high like other WCNSS SoCs.

Fixes: c7c0edecfba8 ("ARM: dts: msm8974: Introduce the wcnss remoteproc node")
Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index f300de74c4..b9666feb8b 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -814,8 +814,8 @@ bluetooth {
 					wifi {
 						compatible = "qcom,wcnss-wlan";
 
-						interrupts = <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>,
-							     <GIC_SPI 146 IRQ_TYPE_EDGE_RISING>;
+						interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+							     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
 						interrupt-names = "tx", "rx";
 
 						qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;

-- 
2.43.0


