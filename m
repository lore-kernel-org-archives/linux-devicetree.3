Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFCA3CF1EB;
	Tue, 16 Jun 2026 05:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781587640; cv=none; b=rZDJs+8fB+PuVW7NJH4zNgJIA76PwS5dmTK3mmW1IjHP7+FeeRKyGfO+m963/RbLUaDaSC0Em4FGLYfU25F6sFiuhIQT090A9H86dE99601hs4wf+vxjfxIkve2sdXwal9n0liNKT2kFpLBVOBeFKwiBOOuTBjXe2OstaVPtpjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781587640; c=relaxed/simple;
	bh=i1Bm72bIG8D6guEkwqf8CQUEp4uFLMIi8TOBJCNHR8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IrwAKeKttLcpGe7K4AItRHS+m7gbtc9cADKPsyRfgh0T3ESB1k3UwLcn7IV5lngyYLLZQZHrVHk+Qnl0N1CI8QMRfd/NzeB8l7fwjXxXdEucc10/0YnLFH9XG3FK0ckfZNURZv4315kuXZf3z8g+N6s1rJU7qjTDA+mixgT4b60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mnw0o1be; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mnw0o1be"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBA24C4AF0D;
	Tue, 16 Jun 2026 05:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781587639;
	bh=i1Bm72bIG8D6guEkwqf8CQUEp4uFLMIi8TOBJCNHR8I=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Mnw0o1beq6J6geLEU++LFn51rB3ZoE4W1s/Lj0iWVQ0zRN94HKonWpq48e+EK1US9
	 rNhOg4OvIiH7uASy2OyF9gOzmWIlD7PpuC52dupKDqPlgKCYc5IuyEhgI9m2IR/M+W
	 dvM9wVfSMziehc/QTsPbXwq8lke8W1rs94eLyuTMXzU2dw/njWlPnRLlMz/pFxzr3C
	 QB9c3c/3fz7wDFt2n/NHRnMU3idFYuNzVNmp8FaBdE9I34WF80DV4xW4zc3P6+S+Dd
	 w/QKEAKRWTn/qo4C25lrbc1bvtHFeqMzv53V7YOEkVaqRgI72AfoLrvh1YrC7XaY9O
	 Vlgng7oCFWqow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BC8CD8CA8;
	Tue, 16 Jun 2026 05:27:19 +0000 (UTC)
From: Sam Day via B4 Relay <devnull+me.samcday.com@kernel.org>
Date: Tue, 16 Jun 2026 15:27:12 +1000
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus: add panel rails to
 simplefb
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-sdm845-oneplus-simplefb-regulators-v1-1-1db1804acef6@samcday.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQqEMAxA0atI1gZUtOhcZXDhtKkGaluScRgQ7
 25x+Tb/n6AkTAqv6gShHyunWNDWFdhtiSshu2Loms40pjWobh/7AVOkHA5F5T0H8h8UWo+wfJM
 oejuNdnDemYmghLKQ5/8zec/XdQPlhJp+dAAAAA==
X-Change-ID: 20260616-sdm845-oneplus-simplefb-regulators-fc98c5dfd69e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sam Day <me@samcday.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781587638; l=1167;
 i=me@samcday.com; s=20240502; h=from:subject:message-id;
 bh=zy9XPoerjyypgnPLHLVXSffI5hSRg9aWPbyKM9SQImM=;
 b=GjKaOznZOn4JpE2UCxKDFsFD4fC83SiGMBofvlvhXYFrHiA7MLo4D2ZI5WCJxCn9C5GBzxHvE
 4tWK9W3sPycC4Oo9OV5+uLR5tV3SYejpQl/SFfHnyeQZIUv5LsJ7FrA
X-Developer-Key: i=me@samcday.com; a=ed25519;
 pk=bzyS0akxWMqr9+AXzgBRIp28KKpEOs+GjYMc2yf+aeU=
X-Endpoint-Received: by B4 Relay for me@samcday.com/20240502 with
 auth_id=595
X-Original-From: Sam Day <me@samcday.com>
Reply-To: me@samcday.com

From: Sam Day <me@samcday.com>

These regulators are marked regulator-boot-on, but that doesn't
guarantee they'll stay alive as long as the simplefb does. Adding the
explicit supplies ensures that booting with MDSS disabled doesn't
switch the panel off 30 seconds after boot.

Signed-off-by: Sam Day <me@samcday.com>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index a6c2519a418d9..fc6ac8668a7bd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -75,6 +75,9 @@ chosen {
 		framebuffer: framebuffer {
 			compatible = "simple-framebuffer";
 			memory-region = <&cont_splash_mem>;
+			vddio-supply = <&vreg_l14a_1p88>;
+			vci-supply = <&panel_vci_3v3>;
+			poc-supply = <&panel_vddi_poc_1p8>;
 
 			format = "a8r8g8b8";
 			stride = <(1080 * 4)>;

---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260616-sdm845-oneplus-simplefb-regulators-fc98c5dfd69e

Best regards,
-- 
Sam Day <me@samcday.com>


