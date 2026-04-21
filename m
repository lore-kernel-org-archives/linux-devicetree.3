Received: from mail-m1973173.qiye.163.com (mail-m1973173.qiye.163.com [220.197.31.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EFD288B1;
	Tue, 21 Apr 2026 04:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776744178; cv=none; b=fYLa49exgZc1PRo7wkQJy/sxH+TmoVxl1bx9U66hOrE05PUzO4XrhKwZP15fCJS0pxmHSQJN/NO9LI5fZ49StRZpUawDUCfT0ep5vbFNgrY3xacs+rluOP/QR8sjZnaMJjzwk/3efOpNQJe6m3SYsXCE2L0XpYLKp+e9QXont2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776744178; c=relaxed/simple;
	bh=qx/k57IVn+hrU1TkQZBd7wTQp0lrUEdP2yhaD4T6+Ss=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=sm9+BvHSONpSYBFlhh47K6RsSU3Z9cSSrjAqbfKT50XOpjSygvYt16ut9RaXS+L/oTCq0BueGK6wdrSdeN2WxcmYhQNTLsJbw8yYKuRhKU4Z2SsP7LtLVnjnhjG6pT+Oi89XYTn0x9khrcQNqmtky2Pbr38DsSWyp62fQrHkqbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=AfpZZdii; arc=none smtp.client-ip=220.197.31.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="AfpZZdii"
Received: from localhost.localdomain (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3b7d2085b;
	Tue, 21 Apr 2026 10:47:02 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 1/2] dt-bindings: mmc: Add cap-aggressive-pm property
Date: Tue, 21 Apr 2026 10:46:48 +0800
Message-Id: <1776739609-122962-2-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1776739609-122962-1-git-send-email-shawn.lin@rock-chips.com>
References: <1776739609-122962-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0a9dadef1e0909cckunme87b03509c05d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQklOVhodTkxMGEhKHkxMHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVU
	pCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=AfpZZdii6j6c4T5P0EnlHgLFthxg4SGqV5+dOZqVWWXhDkFcd6eBrrCUgpPzO0zybrnV3ZWOL6ih+iZo4saUa44f4DLE6fxnCJCtTgthrEBtaMUdi2evnegsNTSQ+TYDsViXMMo8p025TlwDD2PtkYBE048dlSQZTM2wxZapDls=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=dVhwfaRaNvF279kTgGjazKzy0rZD3rGMfZq1ez2Ru0I=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Introduce a new optional device tree property cap-aggressive-pm for
the mmc framework to perform aggressive power management strategy.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 3d7195e..3c3e5ce 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -177,6 +177,11 @@ properties:
     description:
       enable SDIO IRQ signalling on this interface
 
+  cap-aggressive-pm:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Enable aggressive power management strategy.
+
   full-pwr-cycle:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-- 
2.7.4

