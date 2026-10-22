Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651191;
	b=SxvB2KXDBDkXsKk5T1OmmUZJVbOcMiLQSEuXwoDNSV3qTpw9ee654OpnEeGA2tEGxB5Q
	 OdsadhLDEU1Aapr1aydQkJOu2NXXyshui93LthlfMcB0arGdCfYfNHbbiYOxO0z9kN6WX
	 1xgEsWSORInz6tJ9sqsaBDqNHZtOHFTscHgu8IeDJS1etFH9mungPkJNhPNRbEYpdp5iN
	 RJyP/rZsvllJFPc3F9bDbYRqhy1PVODYXoK9GFvq33rjzZtocDdvflDyvfO8pHvoeLReI
	 6wBJzEvNGPim5tv0IbLwe8Xd//B8kguQNlt6VHiyE+J0KHxVttsD3lllf00oBpTdKJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0oGfI5y7RM0zVga9sjfE4GNp8DkV1WYfD04Z0CFgmnw=;
	b=vXIsUooGSRRn3RIVdU/jRRLbrE98vfwq+NSLPswsxyc+BlyFS2I3BmXiXH/1qZVaxXsU
	 N/q1oGcopYLyyZbSkO10bFvcRwqOMvcH9kELIo9RxmLET54kKD3BFqb7QWQ0VqkHeISHg
	 bZvsbBbrofobJjQ3VCb4/E5K2aMyeSdsbGtxTgK8aoaq5QCUdN9dLQIzg2DaAqTgYgxac
	 YwRSScRDoBnYxoRvVaix5dUjffKd88Zv/vmhWTPVYcq2YS9tZjIBAJL+CMAHqw4/s3x15
	 R77EDBdNCzSwC3vwRmtpBzx897mQZ8FOM952Wb8iuI1TKQoIQBDSoCyZH489th9QnnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FBQjdyyh;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122EB606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 122EB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FBQjdyyh
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so1570954a91.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 23:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651190; x=1793255990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oGfI5y7RM0zVga9sjfE4GNp8DkV1WYfD04Z0CFgmnw=;
        b=FBQjdyyhSwLLCSJuniqU96oNfOWxUFoKtajyUpBO4bWxAFTO++N7cqrv9/xPF5xY7W
         11iFJ1cOV9Yo+vhuQ/1YGiEMwnJjkh4rGYE8MpAEMi8AQYaoyVHwQPFTotwKvZH6jlz6
         2JLsVTF7km1HQFp9U8f69EUEAiJDpL1Ms1BEKfPyccQ+lknUtgpQIraok2VFstRAs7cA
         SPD7pdqADnC+8kvmzglmRe3waHJCLEJYBXPfjFhvVZHtMlkFRSSIaGzSVbbjKeoDHFFT
         N/RSsyoS2nuNSSd/ZKIQJaK4UB+Sms0GNrRdyBYJ8E46/BAf0n2mVb7I8hMbyerw1ZjA
         3C+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651190; x=1793255990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0oGfI5y7RM0zVga9sjfE4GNp8DkV1WYfD04Z0CFgmnw=;
        b=2hrfRD2RvF+IF/LpKRZ12N8Zsan1/gRH3eGhWxjN1JP2PeDcywaZTZNjD8LAYYMdlr
         qsukEexzsmQJA9i/wyK4JzGpsiLD8P2mc8WLUz3kTjzwRndwlGmXVvRky+nq49MvFTf/
         xIHGNhqo53/904brNdMV3H3m/P+wWULXU2SFpWi6iBVQ8IyOGjVUlrCX1WXvMSsYx1Mg
         OkBG4rQZxkhVAhrqBDEfl/iqZv0KbVSv+qNesrdVu0vAexTHR34N+jqXly8mf+xdKRIX
         608gmq/AAFiOxMnCKrlk4Erf9AIiw63kZP6ADEubmYBB7v+HzsBDSq6eHlraw0aLcL7Q
         1iXA==
X-Forwarded-Encrypted: i=1; AKwUvBzOOsP434PQp65zNy5GIkLZDxvqqHtjYX2D0Z1Xzvifk7uzjaeQnFM+PyXq4prt0AUhQOhYpGChWVoX@vger.kernel.org
X-Gm-Message-State: AFq9FYKcrRDR2IqBuJ15sTpWozGEpALNyR1U+5+i6/O1ryJrXsMJYBy8
	7QmCJwHB5DluegrfaRWHjGhvRmLt+xQxDNIrq8buLqhdcbYalyImKBLz
X-Gm-Gg: AYBFou1v2NSdPLwikWIxNIMm5YVerHdyXP2JzzrER4y7++o8zit+9rgxJqN8s+Y7ZYo
	HE0BTlMqn1EQAajMTsnqLOTEPLnbczXf1HpT9Wvsqs6cI9pY1YMv4UajGyA/SNtpU2kqiWtxR0G
	EpAznOg2CxeRJSyuJcwrac8AHyy7wjjB9hHZTmDZnQhqMHNyX00X1tE/cJzHkev4NfDrcV1gFmF
	BzQdrZaQT5wdFhcP964fJR5XYcost5TEPSAJfIkLSP+IkkZdXT4nTP1zWGTzARjNts7Qhx1cho1
	+i1+bDeBIQW0dsa+hyQjMnJFrExYIW/diWiQ/KY27eJCvuxn3WKmgRREn9lvBc3LWSKdikFz0Ai
	G1A9PEffYORtwBdYJqVAkIKIsowRPZiTd8eRXcHBV8J3p4CKK7E7j/EUIohUPvWu8ChMcCwTKrL
	Q2HAz2juQ426Ox1qj82LgcKUkJAJyks8RJ4p+dTr13112pLcaawKOc+rSUr3zDnqttMtgCT0Y/c
	7vZ6PvjizCIT37MHS6lxSD46ws6rCaQp35qdSB75O5iCz2xw0kyZCLB8K1CCQycCw+TbXPDm2yj
	VhtSzgXxXVHIDg==
X-Received: by 2002:a17:90a:e70e:b0:3ab:c674:cad9 with SMTP id 98e67ed59e1d1-3ad86cc21c0mr3645525a91.54.1792651190526;
        Wed, 21 Oct 2026 23:39:50 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm2784741a91.2.2026.10.21.23.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:39:50 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: glaubitz@physik.fu-berlin.de
Cc: dalias@libc.org,
	ysato@users.sourceforge.jp,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	Artem Novak <artem122novak@gmail.com>
Subject: [RFC PATCH 2/2] sh: fx9750giii: add board support
Date: Thu, 22 Oct 2026 00:39:36 -0600
Message-ID: <20261022063936.472520-3-artem122novak@gmail.com>
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

Add minimal machine support for the Casio fx-9750GIII graphing calculator.

Introducing a board Kconfig option and registration on its machine vector.
Wire the board directory into the SuperH build system.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/sh/Makefile                        |  1 +
 arch/sh/boards/Kconfig                  | 12 ++++++++++++
 arch/sh/boards/Makefile                 |  1 +
 arch/sh/boards/mach-fx9750giii/Makefile |  2 ++
 arch/sh/boards/mach-fx9750giii/setup.c  | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 arch/sh/boards/mach-fx9750giii/Makefile
 create mode 100644 arch/sh/boards/mach-fx9750giii/setup.c

diff --git a/arch/sh/Makefile b/arch/sh/Makefile
index 380e3b7dc597..28b431a8c8d9 100644
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -128,6 +128,7 @@ machdir-$(CONFIG_SH_KFR2R09)			+= mach-kfr2r09
 machdir-$(CONFIG_SH_ECOVEC)			+= mach-ecovec24
 machdir-$(CONFIG_SH_SDK7786)			+= mach-sdk7786
 machdir-$(CONFIG_SH_X3PROTO)			+= mach-x3proto
+machdir-$(CONFIG_SH_FX9750GIII)		+= mach-fx9750giii
 machdir-$(CONFIG_SH_LANDISK)			+= mach-landisk
 machdir-y					+= mach-common
 
diff --git a/arch/sh/boards/Kconfig b/arch/sh/boards/Kconfig
index d89b74177233..f1571b0e5f1f 100644
--- a/arch/sh/boards/Kconfig
+++ b/arch/sh/boards/Kconfig
@@ -326,6 +326,18 @@ config SH_LBOX_RE2
 	help
 	  Select L-BOX RE2 if configuring for the NTT COMWARE L-BOX RE2.
 
+
+config SH_FX9750GIII
+	bool "Casio fx-9750GIII"
+	depends on CPU_SUBTYPE_SH7305
+	select OF
+	select OF_EARLY_FLATTREE
+	help
+	  Enable board support for the Casio fx-9750GIII
+	  graphing calculator, based on the Renesas SH7305.
+	  This selects the calculator machine vector and
+	  enables early Device Tree support for the board.
+
 config SH_X3PROTO
 	bool "SH-X3 Prototype board"
 	depends on CPU_SUBTYPE_SHX3
diff --git a/arch/sh/boards/Makefile b/arch/sh/boards/Makefile
index fbbc350ca854..c60d038872e9 100644
--- a/arch/sh/boards/Makefile
+++ b/arch/sh/boards/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_SH_ECOVEC)		+= mach-ecovec24/
 obj-$(CONFIG_SH_SDK7780)	+= mach-sdk7780/
 obj-$(CONFIG_SH_SDK7786)	+= mach-sdk7786/
 obj-$(CONFIG_SH_X3PROTO)	+= mach-x3proto/
+obj-$(CONFIG_SH_FX9750GIII)	+= mach-fx9750giii/
 obj-$(CONFIG_SH_SH7763RDP)	+= mach-sh7763rdp/
 obj-$(CONFIG_SH_LANDISK)	+= mach-landisk/
 obj-$(CONFIG_SH_LBOX_RE2)	+= mach-lboxre2/
diff --git a/arch/sh/boards/mach-fx9750giii/Makefile b/arch/sh/boards/mach-fx9750giii/Makefile
new file mode 100644
index 000000000000..0d6df7044567
--- /dev/null
+++ b/arch/sh/boards/mach-fx9750giii/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-y += setup.o
diff --git a/arch/sh/boards/mach-fx9750giii/setup.c b/arch/sh/boards/mach-fx9750giii/setup.c
new file mode 100644
index 000000000000..233decdd1bfe
--- /dev/null
+++ b/arch/sh/boards/mach-fx9750giii/setup.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2026 Artem Novak
+/*
+ * Casio fx-9750GIII platform support
+ *
+ */
+
+#include <linux/init.h>
+
+#include <asm/machvec.h>
+
+static struct sh_machine_vector mv_fx9750giii __initmv = {
+	.mv_name	= "Casio fx-9750GIII",
+};
-- 
2.56.0

