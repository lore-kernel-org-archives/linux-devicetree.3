Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287EB47D938;
	Tue, 11 Aug 2026 21:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484355; cv=none; b=UY/dekhuEj8ENOG5R5s8AjSAuaazkKjX3eCJqogoHEfUGv0RVpG2thn6Nv9Lp4OqSpBBlSalTGV6G9SMyvWNUAZ6xmjIGQxyEfAj/D9sGyGWngxkfuangV5EDdh0umut7oAVqRV9DES61gKGgvcvOfT5YuIhFiVqE8HF0T74Y4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484355; c=relaxed/simple;
	bh=TW+w2E+KvLigY2p9YCQJmvdZ1RAFhVF6BWHbgpKRE/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Lg25AXt5OdKDnaPkV6gQq3YVOug0O+n/8izdnq9nZFNLQoI68nIweilT7lYr03jVHJdsRtu05lltF1ITW0sCv1gpVQQg0e9M7HWSuM9rsTvYuXN6y+gwEW6VhPwLCq8HlGbLDM5NXvRQpYISTm0vnFE+WlMHil8hzSgHMRvnHSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=upxwjVe1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="upxwjVe1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7DCCC2BCF4;
	Tue, 11 Aug 2026 21:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786484354;
	bh=TW+w2E+KvLigY2p9YCQJmvdZ1RAFhVF6BWHbgpKRE/M=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=upxwjVe1MYrXqVW9UAh+611Sv+W+W7B4TAkg6BGC4+H4CCqGM1rTcWBTmEoGfhxXB
	 9u0rnYZ37hIfAZuxkAiLjX9E1SY6riydCn3yEHXi/iTAGqK8CdcTuvcfQbWjncWAqG
	 +IWB2XRgXe1rb2WCyAYpFm2JxQbfXP4xsIvMVlq9zvPK9whUwfNLLd2/OI523oZiLO
	 M5t/s1QPnc9LgUcd17P3yymVOqtv5gtwdLUxjzW/uAIne3m2PGExq1hWUpjZr+sFDY
	 NY9K3+pOZctE3GYfDs+ypptuISjzcgIO7ji+5zoJzYH75cYusupd6f/eRrx1O2+nso
	 WrIYUF3wPAmYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9ADC5CFC1;
	Tue, 11 Aug 2026 21:39:14 +0000 (UTC)
From: Robin Snyders via B4 Relay <devnull+robin.snyders.xyz@kernel.org>
Date: Tue, 11 Aug 2026 23:39:12 +0200
Subject: [PATCH v2] arm64: dts: qcom: sm8150: describe download mode
 register
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-submit-sm8150-dload-v2-1-fb688ac4896b@snyders.xyz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NTQ6CMBCFr0JmbU1bIy2uvIdhUdpBJpGfdLABC
 Xe3cgDzVt9L3vc2YIyEDLdig4iJmMYhgz4V4Ds3PFFQyAxa6lJapQS/m55mwb1VVynCa3RBXKy
 VukE0xleQl1PElpbD+qgzd8TzGNfjJKlf+9+XlMhx1iC2WHpb3XlYA0Y+L+sH6n3fv+Ah53O4A
 AAA
X-Change-ID: 20260811-submit-sm8150-dload-38802bee77c9
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robin Snyders <robin@snyders.xyz>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786484351; l=2109;
 i=robin@snyders.xyz; s=default; h=from:subject:message-id;
 bh=/TfmrFMiLTSWdo6283UVZZe99/UGMS7loU8I4UkGqso=;
 b=yOAgwKjWGsx0P0mkCM/aVbZ0qXSxT3LiiIjPwvZ21GGq5Il7ygFlqyNicqKJf3Sf6NuwXzUEQ
 p+hZWAwgc6SDTYDDBglLvfTJBVpq3c8eLcEPrA4NISVHXdAVWlmunNd
X-Developer-Key: i=robin@snyders.xyz; a=ed25519;
 pk=Mdk5dNn+Tkcy7BWexDxBLR/s1BNz8WdqDPnr3qtYBIU=
X-Endpoint-Received: by B4 Relay for robin@snyders.xyz/default with
 auth_id=938
X-Original-From: Robin Snyders <robin@snyders.xyz>
Reply-To: robin@snyders.xyz

From: Robin Snyders <robin@snyders.xyz>

The SM8150 SCM node does not describe the TCSR download-mode register.
Without it, the SCM driver falls back to a firmware call and the
mode cookie may remain set across a warm reset, causing the next boot to
enter the Qualcomm crashdump transport.

Describe the TCSR window and point qcom,dload-mode at offset 0x13000,
matching the layout used by SM8250 and other related Qualcomm platforms.

On a OnePlus 7T Pro this changes software reboot from a reproducible
05c6:900e transition to six consecutive successful boots.

Signed-off-by: Robin Snyders <robin@snyders.xyz>
---
Describe the SM8150 TCSR download-mode register so warm reboot clears the
download cookie through the SCM driver's MMIO path instead of falling back to
firmware. This was validated on a OnePlus 7T Pro with six consecutive software
reboots that returned to Linux rather than Qualcomm crashdump mode.
---
Changes in v2:
- Place the TCSR syscon node in unit-address order.
- Link to v1: https://lore.kernel.org/r/20260811-submit-sm8150-dload-v1-1-1a87eefe6c89@snyders.xyz
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..46183687a5e3 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -610,6 +610,7 @@ cpu7_opp20: opp-2841600000 {
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-sm8150", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x13000>;
 			#reset-cells = <1>;
 		};
 	};
@@ -2181,6 +2182,11 @@ tcsr_regs_1: syscon@1f60000 {
 			reg = <0x0 0x01f60000 0x0 0x20000>;
 		};
 
+		tcsr: syscon@1fc0000 {
+			compatible = "qcom,sm8150-tcsr", "syscon";
+			reg = <0x0 0x01fc0000 0x0 0x30000>;
+		};
+
 		remoteproc_slpi: remoteproc@2400000 {
 			compatible = "qcom,sm8150-slpi-pas";
 			reg = <0x0 0x02400000 0x0 0x4040>;

---
base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
change-id: 20260811-submit-sm8150-dload-38802bee77c9

Best regards,
-- 
Robin Snyders <robin@snyders.xyz>


