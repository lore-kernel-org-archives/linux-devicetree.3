Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F47E409613
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349323; cv=none; b=DHPyiw0FbIMNvuZIhMQwuXIUdWBxVMy7vrV/tliTXMXmrLnV3/wSmRuTzCQHXno40AuY6bXZ+VwsGEpVP+ktAceWsGcJ76hoYWAK1eR1KPeVmgQ5puuOwdm3BirNLOH+B6nwjaQ9xAKCEpLca2dBJLO2mWSUA7zCBF2GhPvZBSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349323; c=relaxed/simple;
	bh=04e/Vb8TzD7k0lpyz3v8T9K3xjbwU9F9Cf26pX1gqJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IzKrmIUS5CFq419WdJXHnSDTdcCdZ5eDSgwFUFbDpMnEUi02YanI3/1Z0Oo+WGJ7jz1p9p/zXKBjD0nAvaNjc/LrTZw5z2wPKuXH3j5UbPEMdqM0knnhZ0r5ijMF/MoS8OHqjxYgZdEBa7DFcDlgnIt8HfezuXcvP/ZRLC+G08Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0Cg0jXF; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0Cg0jXF"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so2042966f8f.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783349321; x=1783954121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+Rc67BgTH3+EnF6kyABEC4BScrr4lbwf75koOQCx0Q=;
        b=T0Cg0jXFiW/sf7z4mQpBgSbQzSJk/K87jJ/pxWbWn33Gsuk00e5xQoSjUSfwOtiWW+
         /q6IfG688t8dfc4UZfRdgzLEatU7NV3hiONzWU2gX7/cIrvNVHRkpEZgwJNeLEeI6iWw
         eEn+4Q4olvk/WJSORVqc1UQfPy5hSiDpUUxnidRNUoKQfRpoFLZk3F6IAjecTxPdEa59
         GlAuBCwo9iNwpUbuQCuFgmRiJd0X5YzGlJtEylfpV+x0kxF2Ujv4zaCUJrxxm9UtupTq
         b5uzHiy2bI0nXZWz5rCFjy+sv2W5a4f45kQavuXpzNFWlMyxd9d9hOXIzy9epJX3u/Wz
         wvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349321; x=1783954121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r+Rc67BgTH3+EnF6kyABEC4BScrr4lbwf75koOQCx0Q=;
        b=bJ2/bxyLLoBmSku8YddIlNWgj4CErDBRuPv1PEyq5qRiiGGjvUjgcXd2WB09/6i6k6
         XjUpt4LyPC4ejUyjBRD1fLdNWidjyZGt64iDNfJqy4YZJmSC6U41pCHAgJ9toL1LzP8I
         6UievbvPKss52CsSs+jFTSDfh88EAaZYdtFmpgaUS+N3kbOK/CG36KNgnpw2LGiHbPKB
         7kJYW0TE/oT+gTZn1v3yAI8yY0KeqRewct43W/uBJA0yInAYid3zJfxtAeTFszyIqihg
         cLxZ+ktZTV21BQ3FhAVTui7T3gIHTM6zWZm8K04/J/ZEsQJlLQGrQOwMa2rZzk5g4o8U
         vRsQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxMvMzicpk2EeFDtf7iv8O7HLpwtdI1aB3aCoD+y1A7g4fdko43qwGHzPUPGbGifDx0dlLIoOsNqss@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6CG+Kr0NYp44gSfjQySIKfsNlws5T8Km1Iz78IpFKCdzc7qF1
	wGYCcAz2ZzIq/3ACnvoOmDH5reXpckt4KHvKEGa2H0zApR57feVRzLJj
X-Gm-Gg: AfdE7ckYhvJcJpgxJqPc4VRiYUvoeOpESWCkkHZGzHTjkpX6te8i/c/LGxdod7Es+SH
	FBu/xDbb4lD1/2RT4TXrR2dTzv6gADKHYn51V2kx0ihoV4Hn5L8ip1GGdmreZ81g8X7tCy2VlUA
	zMbElG8F3tdStUi5n5j9h8vfjqPh6wDHehdRdl2M9rmnDoBxSEDrldt5H5ngPE7lITPFNk2T6gK
	b2lUwPPvr8RmTLUrW2BvuBiGjsMZSnpE/b04n65MIHfCVUPPP/BjVYsM2uLR42URDHWxkdwxnEU
	//Bj2nIrvHP46HlH+cJ16120R1vYP37oKwmIfgUVKDPGymcDHFbIw/zRSnQwDXWuGavCNBu/GK6
	f6BKMQHqi3E26bN603AJkntkiWa1d5xNBbbXLDcbdGAOtYTKF+o9w2gkuh6aUcX07TbKxjyQSXP
	gtxoSIBuyaqSB+mN/Y2dn7ZQw=
X-Received: by 2002:a5d:6541:0:b0:478:2698:72f8 with SMTP id ffacd0b85a97d-47de66e581amr498285f8f.49.1783349320613;
        Mon, 06 Jul 2026 07:48:40 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm26798473f8f.26.2026.07.06.07.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:48:39 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	joel@jms.id.au
Subject: [PATCH v4 2/3] docs: watchdog: npcm: Add reset status description
Date: Mon,  6 Jul 2026 17:48:27 +0300
Message-Id: <20260706144828.3517631-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706144828.3517631-1-tmaimon77@gmail.com>
References: <20260706144828.3517631-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation describing how the NPCM watchdog driver reports reset
causes through bootstatus on NPCM750 and NPCM845 systems.

Document the reset flag mapping, the watchdog instance mapping for
WDIOF_CARDRESET, and the NPCM750/NPCM845 latch handling. Also mention
sysfs bootstatus reporting when watchdog sysfs support is enabled.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 Documentation/watchdog/index.rst    |  1 +
 Documentation/watchdog/npcm_wdt.rst | 71 +++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/watchdog/npcm_wdt.rst

diff --git a/Documentation/watchdog/index.rst b/Documentation/watchdog/index.rst
index dbc702b31a43..eb9e76275fa0 100644
--- a/Documentation/watchdog/index.rst
+++ b/Documentation/watchdog/index.rst
@@ -25,4 +25,5 @@ Driver specific
     hpwdt
     ics-wdt
     mlx-wdt
+    npcm_wdt
     pcwd-watchdog
diff --git a/Documentation/watchdog/npcm_wdt.rst b/Documentation/watchdog/npcm_wdt.rst
new file mode 100644
index 000000000000..cdc45ade9e0d
--- /dev/null
+++ b/Documentation/watchdog/npcm_wdt.rst
@@ -0,0 +1,71 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============
+NPCM Watchdog
+=============
+
+The NPCM watchdog driver can report reset-cause information on
+``nuvoton,npcm750-wdt`` and ``nuvoton,npcm845-wdt`` systems.
+
+Userspace can read the latched reset cause through
+``WDIOC_GETBOOTSTATUS``. When ``CONFIG_WATCHDOG_SYSFS`` is enabled, the
+same value is also visible through ``/sys/class/watchdog/watchdogN/bootstatus``.
+
+The mapping is fixed in the driver. It exposes the SoC reset indications
+through the generic watchdog bootstatus flags and is not configurable from
+Device Tree.
+
+.. list-table:: Reset-cause mapping
+   :header-rows: 1
+
+   * - Platform
+     - Reset indication
+     - Bootstatus flag
+     - Reported meaning
+   * - NPCM750 and NPCM845
+     - ``PORST``
+     - ``WDIOF_OVERHEAT``
+     - power-on reset
+   * - NPCM750 and NPCM845
+     - ``CORST``
+     - ``WDIOF_FANFAULT``
+     - core reset
+   * - NPCM750 and NPCM845
+     - ``SWR1RST``
+     - ``WDIOF_EXTERN1``
+     - software reset source 1
+   * - NPCM750 and NPCM845
+     - ``SWR2RST``
+     - ``WDIOF_EXTERN2``
+     - software reset source 2
+   * - NPCM750 and NPCM845
+     - ``SWR3RST``
+     - ``WDIOF_POWERUNDER``
+     - software reset source 3
+   * - NPCM750
+     - ``SWR4RST``
+     - ``WDIOF_POWEROVER``
+     - software reset source 4
+   * - NPCM845
+     - ``TIP reset`` (``INTCR2[25]``)
+     - ``WDIOF_POWEROVER``
+     - TIP reset
+
+``WDIOF_CARDRESET`` is reported only for the watchdog instance whose own
+reset-status bit is latched. On systems with three watchdog instances, this
+maps ``WD0RST``, ``WD1RST``, and ``WD2RST`` to ``watchdog0``, ``watchdog1``,
+and ``watchdog2`` respectively.
+
+The driver may report ``WDIOF_CARDRESET`` together with one or more of the
+reset-cause flags listed above.
+
+On NPCM750, the driver samples ``RESSR``. When reset bits are still latched,
+it clears them and stores the sampled value in ``SCRPAD2`` so later watchdog
+probes can report the same boot-time state.
+
+On NPCM845, the driver samples ``INTCR2``. When reset bits are still latched,
+it clears them and stores the sampled value in ``SCRPAD10`` so later watchdog
+probes can report the same boot-time state.
+
+The WPCM450 watchdog continues to operate without this reset-indication
+mapping.
-- 
2.34.1

