Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786B22DB7AE;
	Sat, 25 Jul 2026 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784987295; cv=none; b=ZEqnrfBqUknngC/KH6IWozrjrtSC0RtnMGv4+kg4sCqEpzjyqpcJkaZI7uyqcY4Pe93+NBruxKFFEhehtcen++GIg0wwR/QQISM7MaeZoIj9H0IpRp5olbGL4zN+CRX21hJZBofgy6T80+wgyYgnHz9QjLh4LC5VEwxAMksRmhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784987295; c=relaxed/simple;
	bh=H6pjygtQG/V5utkuQd2IOUdBc7yYoI96jgGjwLdNwf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GIXUQ9mAYYxuGMDXLCImPc2uVmt8tJ4EIvUDb05z6eUmZVDT8adzEcoRBha3ak4rvxV501aXQFwSLYFxbzOMugb5nR6cpE+/Nmn0zlbAL86kH554U8zAYiRlBiMaT8CehQlaHv1ck8lIIFwNGijzj039os7xf6fvlhvF8t4CR+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=VRaMVxXI; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="VRaMVxXI"
Received: by chaosmail.tech (Postfix) id 1CF7A1C8829;
	Sat, 25 Jul 2026 13:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784987290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=icTggAy3gbl2+A7cAXhm51k/YneL2/ZKYWfIfpCPKGQ=;
	b=VRaMVxXIQH/oUVE5NoFqio0JDnmFZzP6DMRU6B/11cHX9pjWe1MDgxcbar2aunGS/w6zJh
	l7K7HrYDkw0x+Fq2iImJN0TRG+jeRA8HsWFuGQJu9TvWdeQIBYt3f68Rn9A84c1/kC1SYh
	rmL8LigIno74Eo0v1XL5BOdozBbVklg=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 25 Jul 2026 15:47:59 +0200
Subject: [PATCH 2/7] spmi: apple: Validate FIFO state
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-t603x-spmi-v1-2-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
In-Reply-To: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784987288; l=1469;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=s+zw2P+Wx9EvyJyi9jeYYrUjVBBFmgRieWNPRCaUoyU=;
 b=ZEgDFOgRB3QxgfFZUeoIfQvhkipMQ7Tkku4/hoDMbRU9iYTHjQ9tuqd77r3ImJya7bJluEoGP
 xpi4Ue2XjYFCAzXKyurcbm0YkWZECRaV4cXVlDOcAlS0HpQlWPpFJ9E
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

From: Alba Mendez <me@alba.sh>

Check for data before reading the body of a reply, and check for
end of data afterwards.

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 376cf682c43e..b4f442d0b4ad 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -78,6 +78,10 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	/* Read SPMI data reply */
 	while (len_read < len) {
+		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
+			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");
+			return -EIO;
+		}
 		rsp = readl(spmi->regs + SPMI_RSP_REG);
 		i = 0;
 		while ((len_read < len) && (i < 4)) {
@@ -86,6 +90,9 @@ static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 		}
 	}
 
+	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
+		dev_warn(&ctrl->dev, "FIFO has extra data\n");
+
 	return 0;
 }
 
@@ -115,6 +122,9 @@ static int spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	/* Discard */
 	readl(spmi->regs + SPMI_RSP_REG);
 
+	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
+		dev_warn(&ctrl->dev, "FIFO has extra data\n");
+
 	return 0;
 }
 

-- 
2.55.0

