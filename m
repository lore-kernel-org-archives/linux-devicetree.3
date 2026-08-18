Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9998F478E20;
	Tue, 18 Aug 2026 18:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787078031; cv=none; b=uguHU9ghamJd8SHsR1ojDIi+UklfRL9UQQZN4AxUy813ESND1zn7vBuW4OkD0cnzftjjmNuqmFPileK44Ozx7/Ke9RJDKOKmne2y8aobzeqL6IPBQlBaPSK7u1nF35l+WrTJRn1s5UHQuSrgBd8Dmra8tbzkI4eusbc8/aXsNiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787078031; c=relaxed/simple;
	bh=FY6nUFUsg5ykRDaCyNCZU21elpZrnVLRtGzYwII8m2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=imPL2LX051rUbvf7J8S/r7DWY1I0971yitrPR4UR3YdMCNk+5bwzUjJYfZV6r2BfmV1gifQBqR1ev6XO06i2cdWZVoCjc19kToapoHpBbwxSaSvRJHnK4e3HQ5S+JCjqCCbdKW0LWCPh1gdpTRx8OKnZ0msvLNBxgg6IBZtvA/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=UbnTWzWd; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="UbnTWzWd"
Received: by chaosmail.tech (Postfix) id A6B201C97BC;
	Tue, 18 Aug 2026 18:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787078020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wVHbMMgwTRdvhl3Xmvr04M/6W1HqFA3Q/iNZoN90xm8=;
	b=UbnTWzWdX6r7+Cck/ugPPW9pzgrzLStwpWfinOclMLxzBZlnbOdYkwiBNk+nyKh2uVsuMM
	rIhuAuCFiSMRVgiuOgbyIFdyKY8kxrIykZXbZuAlmnGRrSC0appXgQpNA2wL1OJ+BcKDuZ
	0IX3tXhFXFvbNr6jdNXiTsWKKBHuv1Y=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 18 Aug 2026 20:32:44 +0200
Subject: [PATCH v7 5/6] spmi: apple: lock around FIFOs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-t603x-spmi-v7-5-dafebe6e7739@chaosmail.tech>
References: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
In-Reply-To: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787078015; l=1392;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=/okjDmX4WP5ORuj7W0YBcJBa1hZOvGWaK9RmHtLYrOM=;
 b=evNw5E/4Td1efYc72rUid+cmqXQbiLrXofStbjqd1j19XLq5xXXKuZX6wAa3RNkKGZ/r3lgNL
 Z4fio3Dwge8AU/3BU+6pY8ttvEPKr0y9CgB8CaOsXnd+Lv2NB2AbDjQ
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

The driver was missing locking around register interactions.

Signed-off-by: Alba Mendez <me@alba.sh>
Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 9843dc871d6c..fabccd25aa0d 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -16,6 +16,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/spmi.h>
 
@@ -39,6 +40,7 @@
 
 struct apple_spmi {
 	void __iomem *regs;
+	struct mutex fifo_lock;
 	bool prev_fail;
 };
 
@@ -78,6 +80,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid, u16 param,
 	size_t i = 0, j;
 	int ret;
 
+	guard(mutex)(&spmi->fifo_lock);
+
 	if (spmi->prev_fail) {
 		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
 		spmi->prev_fail = false;
@@ -195,6 +199,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	spmi = spmi_controller_get_drvdata(ctrl);
+	mutex_init(&spmi->fifo_lock);
 
 	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spmi->regs))

-- 
2.55.0

