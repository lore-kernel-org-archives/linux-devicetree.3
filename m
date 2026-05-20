Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D623352C52
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295757; cv=none; b=N8suuguJ//+idCTBRcFTtkrsQCkIimm1WMwKm6sstBsapzsClU375FkGv1xK4vKlDHQoUXn15iqk74MwuaCi0G23thCZyBjH20sIs5MXuona4GO3xaFzbXKfUwHjWcmomkKFUGFGh9B//jxxNSaL4ugqnQpuZ4bfYKnJwjjYmuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295757; c=relaxed/simple;
	bh=KHCNdg8WDuW8IcELyLOslLxssl5wbWlUe6xFPFofttA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ha4veNG3wo64PSPLJ95+geol48GoHpb9hEDNznMFhgcVeeRwfJbGqnM/kpf17ebQHKXbYZg8A5EbCJ05jRkRDR7hr5RdaAGVuoB4tC11HbIu/S/8IH3KmWeAfJKTzgL730gWbLvskbnwDkS0bX/M4HDSUcg7ArKYNurD9x+KfOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVk8b0L+; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVk8b0L+"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso29002785e9.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779295753; x=1779900553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRMlPPpvWg0+TEQtNgaYgNZz3rw+h40bKIEhdoGDsxg=;
        b=YVk8b0L+rlmt6P9fuWhXkVZ7LDvpGLj3gturB7s9lnZyek0mTr+WEBQnK7AmXtmtT3
         ie0UzU5iUKazHnLpjfcFuS7/gM66R801sqqkKfqs/tGyQeDJqMCfN3d+wMVA4K4LRvuh
         4F1knett9Iw/BcbZZRsc1JfFpIhlUCvL12wS2ArEDh9kOCzkTFDV6hAj0XxKFNVVlKt9
         BjmU4AJEdVja1gNhwEf4+SkT54/6+/fuRiQLY1GCGBPZtlXN5+B3zMPSDpQOIguRK8At
         4tcjqIoKB8asUzhUkrMq9tDx8mzc0zBtzTfAVwwzHQzuMmDuyaGsZLQX5ZhZTRen7aiO
         tphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779295753; x=1779900553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uRMlPPpvWg0+TEQtNgaYgNZz3rw+h40bKIEhdoGDsxg=;
        b=JUQ7FUTMuKePxyp1yQMYI1wQzidgJsBjR+XjRB9NLsIbmBah/ENL0y2o96djzl5g0P
         77uLKCMqwfZjgtAnwraWo+td/TDCP8oBp+gpwSKK6A68EmuPfeFcUqWf6+/QLd9A2H57
         Yu3pO68uU8MjN4lqxhtaFV+PeDPMvelOvm+IKtxJPs8lgQ8iXHENAXFTi5c6pyGXImEB
         FbpwFvYtsArQwznHriYUIGmVh5OlFTa/F3ka2znSkej2da0Mq/ILbeN5q2iz2rC0xis+
         XW27/cpAUiMYVYgUZsiJ50KIKyGyA2hOVg52/KsH9SzPBZh50TLWhM9rT3yh0CsNQ97q
         943g==
X-Forwarded-Encrypted: i=1; AFNElJ+EcyzaVHxj74RrFu5nHTf7rP1NxpA/p8Wv4HM+gEygENvLIcF4NLVj7YBx/EWY/0qMYq9Yqsa2N+0A@vger.kernel.org
X-Gm-Message-State: AOJu0YyUm5sRVINCJ6KPfm3SA3TD0zzroqvDy6KJYBUND2ZW0l6JUMfx
	l0PC71eJmShjhA8u1w+y0pwQe9qiGoJmLmf1PVvhi9HZrnwpQeWirnJx
X-Gm-Gg: Acq92OE266R3rzyh2wifADtOaSDjnDzjtIuFMR5dQMsXahijgJk2VllNUjZJccegPdd
	aw1J6FtZvaaYE3AGpBLgH1yL1vyxt7hfNIm28Gm/JwWhl27USDXjHDFOpjWxscR2YGmDZpsVNbf
	0eKz6a2GeMTcyqLmBSb+DFktae/tmRETHS2AnSHip9AD7titQGDTaVoRmPr2/af0BCbWwQj3FqI
	gjdkPtBPYkarKagPsDkijjF33HWBxcq6+48x6NHe9wun4k9ARln0dUZy7ti3gIEfSptsDKgsRN0
	i123wpf5AH5ZpBBo7v0I7Wjp6SePJl2/IyM/64T7eZnniUMCT/Y6Py+efg3RiwsILOEeBVJAc3K
	aW3qG3vRA9HkspA1ACrcfC9bHjGf+64phQsHSlsnZYJB0jaXcIVvMh6+40D4iRBIsiemTkMTTjY
	bproPuY6OK2mCh+ffQbE66qPq/dtLuiLozDzmLooch9XFpuJJPIVsGClDnE8bc51Ap4Yox5P62k
	IF6wmoA4FhG7gKDqmUYHtep/UYC8rScd+VvXQXMuAFaKzOuFh4gwTrpyQ==
X-Received: by 2002:a05:600c:4692:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-48fe63253e0mr403611915e9.20.1779295752770;
        Wed, 20 May 2026 09:49:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:dcb8:81c1:dc9e:cd68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e71dsm3110285e9.9.2026.05.20.09.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:49:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/4] PCI: rzg3s-host: Use shared reset controls for power domain resets
Date: Wed, 20 May 2026 17:48:21 +0100
Message-ID: <20260520164823.436992-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520164823.436992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260520164823.436992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
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

