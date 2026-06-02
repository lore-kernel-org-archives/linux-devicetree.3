Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D062D839C
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 19:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429830; cv=none; b=WCAJGHJrMOvlHraPMpJ1svo2e5G+BNUFmRgB4gIOHCouyhodVIHsAPnmfvXePd7UiTYiZIjNVYUladtjN7ay+13dkGOxOyomJXw3zwQxpAEAfuK1zNbm1xnl81YlApgcK9m4njfGPtYnJElHycFqkUOGJ1L3l6k+Ulx2bncZlNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429830; c=relaxed/simple;
	bh=ICsOPPnxezUsTeLqn0LswfluUIrWBBXoACSLyfd4mJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z3RJ6K5wDUO+U8XEiRu/yjazHd30EfzSU1y+5lNucg6WS99BQYM53+EwyfEXTa8IaqAfsdHJoczkGTZJ4qnDfaaYTFx8sPs2rN2dg8xeH1QzCR1a+4rUEPBTcB1Zjgct3WvzcpdBLu5XOSpjdIzRsivAXTm6Eyy1RUQynsVelmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNnZCnSZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNnZCnSZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso3991715e9.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780429825; x=1781034625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYXbG4suH7pFw0IrR422TpDoJXmZjD7Z4NW2wPRZuB8=;
        b=PNnZCnSZUZJCqguLnv3g3BQ4UAjf1JPFev/n5LqI2oKMFezB4q/wXw7sfvj0kLu2w3
         i9U8RrKJmFwkWncF5JMzWGwnRy5YM3sBnjay7cgqcuTW8BDA23MJILtG9PunEuct0uw/
         c4YGWB+zUS9ORS2DEXz7AX7odQaQeOn+RPqLHUD4TowKekH7UfW9bwn/2fq+r8guiUQY
         x66IayqvwyWy7l1t/pX0rSXTOhdGp264RV9p6mm2Xi7OAmC2kX2Yc4dTiRn7KVwThjxf
         SCGavamo2CGzFyT+UztAP1zLQsCn6kU9wqzcVCWld7ODRJU6WTnGqMi2nHGUpUNXbRr7
         c7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780429825; x=1781034625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZYXbG4suH7pFw0IrR422TpDoJXmZjD7Z4NW2wPRZuB8=;
        b=JbZwDXtMQf6VodpFiP7jbpDNJAjIcNtBERebLISGxrHHXwhFo8F8Hj1WjtCHQtKK/+
         1/HwlCFg2Ba3v0UEKzpuGunKGkJEU0LaF3KQ1m9MT0w0pAGXhBfj7tDwY2ddOUjmtpXp
         2jHrm7M4HcQhCFFoh2O+jcz3WKkyk5uSr1UlVBOBqfp9W4GQMYb6/Ha/Gem5ch1tL1/Y
         5oqmyizR0NdTlCQbbIEj2PDO7jTXA2sHLGoc1Kod4Gg5TGFRXY+1TkFVeZZ904KUKieb
         GUxVazUOiIoIdYb4amiSC8uGcY/gB/BTbs+2p4FBsGpraG2I0ZL1kJgJMQGWgrtWcCGZ
         ifeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GVAr8CcOA93NCePNbZurJz22KrTku5SdW8/0v97VZFkPdVpMawI83C/P6VTHXIpAQuqLMd/+6YeMX@vger.kernel.org
X-Gm-Message-State: AOJu0YzRwjLXgRZOEUfua2RNEZ0qqFQvhP/OYZInV5RQSe34oycPI31c
	3yKKl0XDCE/HJeISWbXwNBSQ+Ryy0Ue5ir9jm27im3mG/t7qmblkzc4Y
X-Gm-Gg: Acq92OEa242gccGvs52vdKZpZDOMGcBClUQvfZSS8JS7hku8DO4U//i2knRat4w/61Y
	YvKEXrGHedsHcblOJDfKD0liI5T2JbnmHKIkOBE/kNxlSFcb07FeuhtB2R8uttz17e4wgMotXf3
	1H2o+mYMkCaqYiD1U6Ya+h4m615P+2788/hDkog4nz4rDluQXDAZydz9FlbsjyfVxn8/051Sanc
	hs0BT0qj8ngogJlsdfiWHXwmF8Eizp2gT5Lhj36DmCAtlPCQcwnEDxafp9HK/oqFr2GclBC/EfB
	JHAX5eMdjLP/DviGG725o6CDxNBsd8L+r7rnN7XHAANgXA218Z1Nz8CAfCe2XILnydb1TZLf2Uz
	95myUCJ7BG3oNrCoO7P7i5LV5jqR5yJB07MRF1OUwv5DIn5j+mXadEDueieofgpdeQDNJZh2UOH
	FBGoUg6EY2lWamExXds/7k2DjqpblWNOa7ExY0he6IAvv7UtaYQX4i5gbhsJySafPnb3O1lLYHt
	RDMCQKw/742f1dcV029Bct3m70OEk14485VYry59lgixOn2IF5eQs++
X-Received: by 2002:a05:600c:a49:b0:490:b3e7:4614 with SMTP id 5b1f17b1804b1-490b5e64ac8mr3939265e9.25.1780429825427;
        Tue, 02 Jun 2026 12:50:25 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e13eefsm87353395e9.2.2026.06.02.12.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:50:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/4] PCI: rzg3s-host: Use shared reset controls for power domain resets
Date: Tue,  2 Jun 2026 20:50:17 +0100
Message-ID: <20260602195019.1798126-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Switch to shared reset controls for PCIe power resets to prepare for
RZ/V2H(P) support. On this platform, multiple PCIe controllers share
the same reset line, requiring shared ownership of the reset control.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v3->v4:
- Added RB/TB tags.

v2->v3:
- No change.

v1->v2:
- Updated commit message.
---
 drivers/pci/controller/pcie-rzg3s-host.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index d86e7516dcc2..a5192e4b58df 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1276,9 +1276,9 @@ static int rzg3s_pcie_resets_prepare_and_get(struct rzg3s_pcie_host *host)
 	for (i = 0; i < data->num_cfg_resets; i++)
 		host->cfg_resets[i].id = data->cfg_resets[i];
 
-	ret = devm_reset_control_bulk_get_exclusive(host->dev,
-						    data->num_power_resets,
-						    host->power_resets);
+	ret = devm_reset_control_bulk_get_shared(host->dev,
+						 data->num_power_resets,
+						 host->power_resets);
 	if (ret)
 		return ret;
 
-- 
2.54.0

