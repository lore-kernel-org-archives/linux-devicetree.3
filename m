Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E837C3806DA;
	Thu,  9 Jul 2026 08:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585613; cv=none; b=njLNgelu4yHjA2xyd7z0jBquTg5kR1W7DQTEhvneEAx4CgxX3AGIca6Hsj5l+s856z4jH6Moj4+JrRyDPTWDl8dHidjyvM83T1vcazL127oshZZcdmdGOEkMJkP0H9iMMnDNJbzIDy1pmZ2o32b3Z0EVDfwdiBWvcD5a/unjYLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585613; c=relaxed/simple;
	bh=wy5SZcpI6/jWc/lOr/zKxKWEbpIR/CMuHGQUzKbv9qY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AqZw+FU6u03QI/PXNAVYlVOPM+jo44FR0LL5h1RhKRqtgjcDBJyiKpZ/z3QS/VVJn2WXBTGg74QH0zO/Qmp1evYKohBulMPUa7uIu9d4Bd2T1G1izEBIxreMoslNBrKC2+HpzBjmiTMafyqzLO+q+xiFHRZkHxV7yAlvsFcvVig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCLhaRXO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCLhaRXO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9668CC2BCB7;
	Thu,  9 Jul 2026 08:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783585612;
	bh=wy5SZcpI6/jWc/lOr/zKxKWEbpIR/CMuHGQUzKbv9qY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VCLhaRXOUoZ7zkZUf3rbYh6H6r9VVysnQmXfaOT9ZaJOldwR489rV1Ga3nToRF+Vi
	 aATrIp6IaeRsOKOzDyghiCzWbgqTmzBufW6RzdsIlSOe2dyI5AOtlSpUYeCI2dW9j8
	 1GGY3prAEbIQ1RVw5mZirDSmHOLLOIj8kECIoBdeWBMN6ss9JfEeYsgGn7oft/HEzh
	 vEZDV+YwjF47N+J4DGm5YcZ1SzNZwTuAyE6kLyes0Ujx+woxrgJZb9aSWodK3wz18U
	 S2G4f62ZpZS+KaJwGwdbnZQLgcgKV8mCQAoqtNYT4snm1FOW3wXHQjQKJYfYS/tBK4
	 /2fiO522uIwAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78BBCC44501;
	Thu,  9 Jul 2026 08:26:52 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 09 Jul 2026 08:26:48 +0000
Subject: [PATCH 1/3] dt-bindings: reset: amlogic: Add A9 reset compatibles
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-a9-reset-v1-1-fd7cf039b853@amlogic.com>
References: <20260709-a9-reset-v1-0-fd7cf039b853@amlogic.com>
In-Reply-To: <20260709-a9-reset-v1-0-fd7cf039b853@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783585609; l=1435;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=7LNW8ZvaZWeVEkBMdvk9VNvgoGwo+rCuBHKz7WRUMqs=;
 b=uONKi2L9TMAYQPdEjU+xjWFSPacFpUyOPj/7ey/WJawPT5d9d7oUYGyYwElqMKrmSROx/YAT6
 mvpejoyMxsQC/NK7D3hLvk4NGmdJN1+MHHtqheucvSKrVtHXXoHJ2wc
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Document the reset controller compatibles used by the Amlogic A9 SoC.
Add support for the A9 AO reset controller and add the A9 reset
compatible with the T7 reset controller as fallback.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
index 150e95c0d9be..e585f71879f2 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -19,6 +19,7 @@ properties:
           - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
           - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
           - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
+          - amlogic,a9-ao-reset
           - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
           - amlogic,t7-reset
       - items:
@@ -26,6 +27,10 @@ properties:
               - amlogic,a4-reset
               - amlogic,a5-reset
           - const: amlogic,meson-s4-reset
+      - items:
+          - enum:
+              - amlogic,a9-reset
+          - const: amlogic,t7-reset
 
   reg:
     maxItems: 1

-- 
2.52.0


