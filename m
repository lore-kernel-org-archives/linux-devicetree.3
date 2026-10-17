Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64D63D3326
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 19:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266818; cv=none; b=exTWFD2v04kvN0HA4Zqj2rdiHFnQ8qHacrVD6wivxV+qoT4TnJS3DqgSXXGOfDU0Oip3R6l1WfHnh4/rFIv1Cwag8QPOMbG3lcPs+Cvr1iPe4hxU0MUfrZFjDVyun75Hq8GyXrBfA02JIQBWBmbBzvfOlULNoFizfGtXlqtKVPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266818; c=relaxed/simple;
	bh=xZ0mPLMCwDzY8Ny6l4vz2klxVY5qj+EkWBSLeSH6W5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tdU6Akmn4CoGNZ/8+d/32fpGdDzhP0TkzhFvOMSPJGgeIOQAOqsBy6z74MiZEQ/0lAKuIM0GFDcC5mf2oyEipeF4vJaXWL6+KXi0Az5KFA8WoYVrMF80by2/d53U+vn8Nim1RdoBkYHMtuzsEIrJb9KPI0XZE0d9gaH1/KaoY40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f65ByNgI; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f65ByNgI"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8256106635eso324292a34.0
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 12:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266816; x=1792871616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xcmdGAknSlSB095s7l2UZ1pCIYoSMNB0vG29+Hnkm4I=;
        b=f65ByNgIfIleIx42TUxXKQ3kbznOH5PUQYcrPtMS3Nzi+/Z9sQ5x5E09cqlluKbzZL
         mz9mpjaTxnZnrzW7I8zIuV5GNlsb+3wn/KaQahLYS/ZnFlw54C7o7qk/3g8fU+9eMSuK
         Bg4r+j4ONZDuTw7EPZ3tParsLZwAWbRf3hUUupAfWIp+TMH2svKwH5l/JWuLL88HaOJJ
         OCkOXgJ7D002XANkNFOVvZsVnzgz6pCF4MeEke2s19FJMx989Un6b2JaiH6vg/TdArhT
         DMG8wBTZ3VXZumZn3YcMdjjlbX84U0TLHGP7pN6IhXIn/rAvE5+dJYJ9lYBiHWPtMRTW
         B2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266816; x=1792871616;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xcmdGAknSlSB095s7l2UZ1pCIYoSMNB0vG29+Hnkm4I=;
        b=wJJc4NLdBQp5Onu0shYwvJf5CYJejJji64M0w5KzttN65fH7mQyNxBKzvRdYrXRI4s
         ckZO4uLx9X0mKgC4LVx8gU9NONst5BKTNcrET4fkSZF1nJpbKwU3HPPzEq8zVjRp+ZFe
         WJgxf2RHwYEvgi4LQU0CCV8FCXi0/lSGR+8rcMBNQVT0Y1Jj06zhcb+wdAeh9n0k+PLc
         u90xRwY/8HGLIZYNlIF8iZV0JNBCwzJNJqzC6g42NVEcdBEqHvbo9B+Sq1BOCsOK8ZkY
         /itDKPtGibrre3xYuVD7Xak2WrF83U9clzGu2VW94Xfs0N2no0NaLTs4uUoFdY2lisH9
         turA==
X-Forwarded-Encrypted: i=1; AKwUvBz1+oHSDakPWmn4ZMQu/eC7V0DGsu7fz8sJAGe0KS7VVf6vuuc7p7LCQbIloMGPZnGc0fcaD5HsRWPT@vger.kernel.org
X-Gm-Message-State: AFq9FYLEubXicQ3OUvPkH6qk0diS78UBjtSxoT8/AjK9oAgxCNxcqF0H
	zbD+PntrRKBvMj6i0f7YVod6tQZv99A4nZRkAah0nKlQHImE5tStMJqg
X-Gm-Gg: AYBFou0DE240HvpzwJhoREx/RJfgtJOueRi6UOB6MeKIfMrhiI8REuGdTT+yywPIyuK
	kGE6uhWlBoaRPz5oxBHRD8xexIIZ4WrVmcm2XUaTSb1deRRuZUYHnTufKBlsj7QVDy+VeEF+fLB
	tVRQaXO3JfMr/XgxfYp/ADxkkJoAiXd9yq1ECH7LlHjnDmAQW0EVxmRhjDsR9vlJEJlOzENbY21
	tbkB3EJWavduAK7d9eKeFKomfm+LStBzaTYFjCakJyDM3J6xWkrFC1UbCyWyj9hYOYeMO3jaV8T
	Y78z8VNNTdVG6jaCJPy4zzPQDQw3WCP4c+b427rDHp7sqB/juTvN+rmyEthoL8AXc7HUxyPirvE
	2UiXCpv+7ZZrqoe0YZ/VNU9t2TiKKmqzlhfuipVm7EbL4oMavVJpPgjbIhYClc+Ozb1I05otEOq
	j6wYmd+wbtfxWR3hxHh21pbm53a6tEcyX11HqEtIL76Su025MOlqyiFSijkNdPq+UTWMk3IoQaW
	UcaIzt1CbynpzNbjyjnvE9k61egNOH+6qvfqlnnB7w0ODtbj++0PmpR4xUmL2Ua8k9tdti8CFxi
	lZDlGQOTeuZPAw7AwLR5AHwb5hpPXYIDX+TCgA5+yrNfO+PWK1ylfkXVAjnC34vJKZK2MDEFPT6
	agqut6/KTMwBK/VrVvuSeGNbfzFp/XHXKeNO6fylua06mumvFWpjbWQ==
X-Received: by 2002:a05:6830:4129:b0:83c:2a05:c65d with SMTP id 46e09a7af769-844ff4249d6mr3801148a34.18.1792266816507;
        Sat, 17 Oct 2026 12:53:36 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-845b9e280dbsm2212064a34.19.2026.10.17.12.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:53:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: [PATCH v9 15/18] mtd: rawnand: sunxi: avoid duplicate chip setup before page commands
Date: Sat, 17 Oct 2026 13:53:04 -0600
Message-ID: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-15-5af9a1be16ef@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
Content-Transfer-Encoding: 8bit

sunxi_nfc_select_chip() programs chip selection, timing and the
spare-area base. The page-read callbacks and PIO page/subpage writers
call it directly, then immediately call nand_read_page_op() or
nand_prog_page_begin_op(). Those helpers dispatch through
sunxi_nfc_exec_op(), which performs the same selection before executing
the command. No controller access between the two selections needs the
first one.

Remove the duplicate calls from those callbacks. Keep selection in the
DMA writer: it accesses registers and prepares DMA before program-begin,
so it cannot rely on the later exec_op() call. This removes redundant
setup only; selection still runs for each executed operation, with no
new cached state to invalidate after resets or chip switches.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 993e2efcee04..45172175d4e6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1685,8 +1685,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1712,8 +1710,6 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1739,8 +1735,6 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1769,8 +1763,6 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_read_page_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1794,8 +1786,6 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;
@@ -1839,8 +1829,6 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret = 0, i, cur_off = 0;
 
-	sunxi_nfc_select_chip(nand, nand->cur_cs);
-
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
 	if (ret)
 		return ret;

-- 
2.53.0

