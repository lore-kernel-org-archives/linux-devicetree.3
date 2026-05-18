Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08F82E764D
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119631; cv=none; b=Qhlgb7S/6mPMS3n9+kWSKrMmc5QCLCIAEyl2a4D73NwRJRZsU6c/vJG9dYQZZmOr8hGTcPbTytUbUQbcHKoP6+o54mWGYm6mnNdhQUWZZ2Aot53BazFCjOPwRzNQ4WnzSHsVzqoBnVK/7V29V+9Q2z6O+/D7gVQqkNaqooD9KVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119631; c=relaxed/simple;
	bh=BDBX1xjAJ0LRJ669WLtKgmM/iN83kf6G8Zqu5Nhk7tY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1t6WbOX1ySJ8CAqdS+fXgKBY1p4/TDH1G1G0NE2jPc/Hw/b2gaKWC7ZTE5Hd2VWiCrX0CfWnSDaA1wUT+UuYVqrNTqoL2wMRU7wkhUvZph4VJQ3MDFs+L2CbaUYrTSZl5vY41MITo0Tnz8g+nOOikvM4gHTtoA+AJCxdG3oWAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3WvuLxM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3WvuLxM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so27639245e9.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779119614; x=1779724414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uJv70dl9pxlSstZxADnST4TafBrOMHuR9XAmS5GRB8=;
        b=s3WvuLxMILjGpxqPsyRzJJCKHk5YO06+QBENgSlg/1Q3LN3C1x74AY3G+hDh37LauM
         mm4KyZEr75ILS1pFCg8y8ATZ4ITyzv3RpPbjb+k7H0B4gKN2n1XRgBoAicICrd78trJj
         K3JK5zXZ/DIF5ySFUnIsAhXjCdecWOUhza9krnBh+yHNe5zHRqsmpxjFx1vAs8EGW5Jj
         DGm57LeXs13qwifSwwAeZhxJE2Gy3Dn4fBpxxdxCckLMyzuLch6WmpFRm6+oWdrla0As
         tzT93l1LNgj+g1Z0153IYuDl/2r5vRZIKarwwVereKH3l+LLRw8vMRrrXhpkn3Cc4YJu
         RBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779119614; x=1779724414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+uJv70dl9pxlSstZxADnST4TafBrOMHuR9XAmS5GRB8=;
        b=R0gcybZ4C+PT9nq9rMWWB72jTq8gUrRFVIBABAldWwMvzISLDcXLVm3keTH47R45nx
         uJKold86t579SIrzIaFiKmiWOEeaUu2b5KHmOwPNliTzvHUN77OY/z/4sT/iAxlEYKQm
         BK/R46ESuznjGLKrndj0UBYFIiGU95YG0GBrqxAY99yKx+i9fMViCRuAzUh2HTMYIu9w
         7/MrtcskP9oIcKVO4h+tGWIfF0/Tz/kk8qKa+SicSJD0gDM+XOjhuP7rgq+sszugtP+t
         AJt7Dq9Aof1+paEdGs8l+WtnnFYnnupCnbJki1RBr2X9YnaQQ3f+2w8tDUC7G7lo2aSY
         qMQA==
X-Forwarded-Encrypted: i=1; AFNElJ8cTGSOIKmJbQdh2I5paoLWVPY3uJNfbH+k6sfVblrC8PBiTHazCpBiUr3Fs0t4tx85och3n0YREw8F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+QIPXyVFhlqISared22RSzXf2342lgN0MqAH8W8YBq33knKEQ
	Pz4PCkrcR1f6L81pLalf3ffbe6ZKp1doi9LCLfjwtSZiui9lGKGT9fMI
X-Gm-Gg: Acq92OF/GZ0GrI4IKg4Tlbq8y+wKkv6uE34QnAYKQ7KGOO3ZoKYoStjuthn/0ajYY1K
	gWRj25Ohpw+nh9YoUPxXnPpvaLydA8CF8tTXYdsuaThz6E743JDt/ahOdLD9s4vKh4pcdhZT0YQ
	LXWvDxlntjZqHglF1hc8BZqqAn93N3cuCnAlLDiB5kYHYqaLI6czOfThwJ3VuJVliD3nzRGZJRx
	a/qVrpO0sdy718ZrWUjsrkZooxiYlgCusImUG7iggVexZ+Th0PZecVrG7Tgsq/eyFF+3IKq7Sim
	kuogKNrzaBdVjQWTVAfsD3O241sO6OCsA/darydKT55/n9xFVrlqAVlUV15isiyYOOp6bAKNDAy
	aJsIeXR0slKjrYemAj05IYDN//zDQK6s05yypWZk1Gz4xjBDY/O6XnbgUobadERh7C9UQgAqFG9
	RC+63NMwA0lyi9rHLnkWifDpadSDF8MaCfgXnfX9TSgpnzZAgSK8V498BHtrIIAfu4R6k4X0yAm
	EFFVdV+1ei+Pl1cK2zR3WL2W61PnmvuczmheQIm3MHgwdN6
X-Received: by 2002:a05:600c:698d:b0:48f:e230:2a1c with SMTP id 5b1f17b1804b1-48fe6631158mr251523225e9.31.1779119613752;
        Mon, 18 May 2026 08:53:33 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2409:d26f:6d8b:b2cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm450054575e9.1.2026.05.18.08.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:53:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
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
Subject: [PATCH v2 2/4] PCI: rzg3s-host: Use shared reset controls for power domain resets
Date: Mon, 18 May 2026 16:53:22 +0100
Message-ID: <20260518155324.168948-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518155324.168948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260518155324.168948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

