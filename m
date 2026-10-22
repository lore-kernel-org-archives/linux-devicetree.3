Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651190;
	b=Zz4Nh5SxPJv24HiPHKPJj42sOL1zFR9dpimUlKAth0kTvRqxBvH2IeUvsg2MzCJc5e7/
	 tnbfcuv5fnI72+Vi18oPKBIH9wwUMK/urhUCLhTb1BhgAvMxOzT3iDobS8GryQguFXv/e
	 ia6oe9x75u6MKDKIXBde3XAs06xv/qU8ftQxXYUIOBUiL11WWufDkR4gZFJpYEsOADQ0v
	 WZVdrCqYZohkS7J0YM5KMumftXKWhWCYEuWpUhDFzqkDulUAAQNPS7TRKIGQWJtXrkrDZ
	 9rD4gLyBAfFajzfzzv89ijXCdf/i63lpJq7/Sr8Z8K+wQQSAlkWXP18NKF90192UlQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=F5xNpfAD02cdt0fNkq//IluH1XyFdn8v8eKHcwoQ9gY=;
	b=Aqj/2zrtGiLOu1EB/dINSrrY+oz94J6ICaz75cV3/ljEfWFLCroQXR/hCwaQU4DiNkCu
	 J+yrYpop2I/2vtCAbLm4s/fRnecH9zkFvW4yDahPiEl9ATlxtwjMW3fdXAm/MfAAVuRh/
	 3qTYwFjTM6nqRzHrXPxp9sLmpYmZE/Y+ZlzGXVXY+oOFB88Gd5UufqB0PYUO8oL9srz3U
	 m4BWzz9KIVSWjRkFdoVQ6WKduPLkI0uSItVDxwHLHxOwkZ4/a+vi1TH3+QFvx1UtqzAk/
	 qvhwJ/xNaBFI5l6fGiaWQzOeAzZScgqVoYuXzfW8eQMLXjYS+fOLS6IFFT2ClPvUNmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S+FhUgHa;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869B9606A31F
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869B9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S+FhUgHa
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so1312852a91.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 23:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651189; x=1793255989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F5xNpfAD02cdt0fNkq//IluH1XyFdn8v8eKHcwoQ9gY=;
        b=S+FhUgHa7+uJvTERie8Eh+msu/qTG4smFNLP7wCxYwDWhkeJbRRuAkaHCtBDkN2fEL
         vTIyTesqVTz5mj+Kj5pqX2in9paYHMVI31pf+KR6BhS80h24s94OxeoGHU1EhzUzCD4v
         1bYTBaxHGRJNNe4kVXyokdUyndbRv+JcWmgi80V8XhMtZK4rcxdsHVh2HHE460qnLyZZ
         m0BJm0oSk/veJuxGfR31bNOzusliR9hLo1FznTK9+BFpAsDjaLnBbkt0nvzhgdYkvF+9
         ef1XE6lJv215fO7aJDmVWCGij9Jormnc4lhs5dvnaOj+FxvzBPK6fQVvKQyBSBJXVUoe
         U/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651189; x=1793255989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F5xNpfAD02cdt0fNkq//IluH1XyFdn8v8eKHcwoQ9gY=;
        b=KPTo6oD9YgcNMZMlzeWdg5aG3XWHx4SykFPCmmu41J6VRTFTxo0pu2Lzow4j7yvmH5
         2Siw/M5NmZudqjcrqP0PLmfAjomkLpun2kfFTfRhHcb5O0/bJ5pkuJJF3xIORYRpnBtG
         9oEBgeqmyPtNmBazjFjbTo9VxJb3odLU5Wefx1wpKAO85iIT4LdMQFeY+oVcxnEiPauD
         rVKIuPAB6anJQXQEQ4tyuWJ3J2WqR15GFnAtvuC8XlJCR8n/LEeMFrnW3HSMbiZ5ZLC6
         Au6Ie9VnmpYpohP0zmYdiysT20KF1I3No+Gps1C4g16Q0B7eXTM6UWOFiyydeIU4YX9B
         83bw==
X-Forwarded-Encrypted: i=1; AKwUvBw8iROmD0011P2dq7xp0icAgmnydlY2/Aa4W1GEyVdAK88SG+2dGede6UZP6E+GLPrEZ7HNAV17fk5V@vger.kernel.org
X-Gm-Message-State: AFq9FYLDCYhhraUahNBv8BvE799CeK5ZsCDI79LOgCZasvoNbk6nPYoI
	01bDKZkD/ouMH+O28FzRYAHNHj51twumD6bnZlFzcgCX7W8CfJNf73bF
X-Gm-Gg: AYBFou1R6sqe33G42BM6vfjqSt6hS2dm4vROKLmvrCqOb4IcYASWi4+8cRtGEyHBlMl
	6Exx9ZhMPNHl0RW4tEkdgSbTYq5AKm6X+DcU/JUckv7UZk0z5rv859r3jOq71U/woSKk6SDTwcg
	SnohjVfe8r2GdvX+km5hxgBtfKytvvyK1tL5sVc6gQpcgwg5xPLdSRwqYSLFq+293ZRT/iGJyq4
	s1fqy0lbS9upRgWB6xmkqqCCvm8855hrHcmm177P/yU3ZlGOKc8UhkuoLuY3+Ua/yYJ/Fo1Pqp8
	KvJFYX5D/CM0L8BVimNMfDDfvYbER+sD2S7tLyGcE1olH9+5Fs6/GFnJts3STtmrdvQCNegbQOC
	tSmJMn0rery+oHyhNW1aC/6+N3JzgZK9XX75+2H+DzmW9+5jaReLTjukdh82rcdu2vq9myou1Ul
	SNI6AkMemDZHgJuyl/tSG1YVoyw9AjIv/x7kFFx3nVWjVlSf6JyYmUV6CRcHfnkAMRVA3fjQWrF
	TJT9kSv07zBHejiOBBzRmJHqMDhtjTaFlYGDJuCi43AtgDRRge/QFSNTBu2rTXlY/eY0biAZuya
	qZ2nXEIWKeVA7Q==
X-Received: by 2002:a17:90b:17c5:b0:3ac:adce:60be with SMTP id 98e67ed59e1d1-3ad86f44ed6mr4102493a91.21.1792651188958;
        Wed, 21 Oct 2026 23:39:48 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm2784741a91.2.2026.10.21.23.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:39:48 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: glaubitz@physik.fu-berlin.de
Cc: dalias@libc.org,
	ysato@users.sourceforge.jp,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	Artem Novak <artem122novak@gmail.com>
Subject: [RFC PATCH 1/2] sh: dts: add Casio fx-9750GIII board
Date: Thu, 22 Oct 2026 00:39:35 -0600
Message-ID: <20261022063936.472520-2-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022063936.472520-1-artem122novak@gmail.com>
References: <20261022063936.472520-1-artem122novak@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Casio fx-9750GIII graphing calculator, which uses the Renesas SH7305 processor.

Added the board Device Tree and its DTB build rule.
The description uses existing SH7305 SoC include
and affirm the calculator memory region.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/sh/boot/dts/Makefile       |  1 +
 arch/sh/boot/dts/fx9750giii.dts | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 arch/sh/boot/dts/fx9750giii.dts

diff --git a/arch/sh/boot/dts/Makefile b/arch/sh/boot/dts/Makefile
index d109978a5eb9..4887fb16dbf2 100644
--- a/arch/sh/boot/dts/Makefile
+++ b/arch/sh/boot/dts/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+dtb-$(CONFIG_SH_FX9750GIII) += fx9750giii.dtb
 obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_NAME))
diff --git a/arch/sh/boot/dts/fx9750giii.dts b/arch/sh/boot/dts/fx9750giii.dts
new file mode 100644
index 000000000000..bccae22e4899
--- /dev/null
+++ b/arch/sh/boot/dts/fx9750giii.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2026 Artem Novak
+/dts-v1/;
+
+#include "sh7305.dtsi"
+
+/ {
+	model = "Casio fx-9750GIII";
+	compatible = "casio,fx-9750giii", "renesas,sh7305";
+
+	memory@8000000 {
+		device_type = "memory";
+		reg = <0x08000000 0x00080000>;
+	};
+};
-- 
2.56.0

