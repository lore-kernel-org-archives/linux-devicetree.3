Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02583D649D
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737917; cv=none; b=AcHRUVHDGW74YBcQTBdIO+ehMEvrZV3si/pJcCCJUB8VTy3urk/nGKAlayVXv1MplQvosXEkZN2i5Od4GO8U6mheBPuksov4qV3m8ITinEjvO9VbRebvZhF+OAV3onWItDufVmjtJEpXZjPXWGfMmAb5BbAilrqKRcvwdY/MICQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737917; c=relaxed/simple;
	bh=WkG10wqSpZt+o7CGVjM4PHr1dhyUXQJu+rrh5Lvd+MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVtXZ/QB1Gg2Ia5Zy/B+kMKFlTg/py43iWA9IO8feMuXDtsyHOYpKIyNNf1a6GOOdXaNl1xWhI6hceZlBzriQ7u8RXKjtOYKz6WK2RqAcz6RyFvgGh1vYx0beIsTZsOJ+3kJkzbDZOKAtyKi+OD1cpxyoCHsDpuGH+PSr7NS/KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nHY+Bq9b; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nHY+Bq9b"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4DD2E1A183D;
	Wed, 26 Aug 2026 09:51:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BD2D604EC;
	Wed, 26 Aug 2026 09:51:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E8DE11C7AD5B;
	Wed, 26 Aug 2026 11:51:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737912; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=XjMfx7c4mghrlelUrrqg7EoVqa7dbUdocfRTilLLReo=;
	b=nHY+Bq9bY6Tt8dOWG0qhGxY0/HpdzpuThwn3QR20XVWxOshWT2gTAzAulYjAmct22e3qVU
	hzrSsKnZdsbSrcrb7shlwXZZ1PQN5qbZoZ17faOlnrAYz0676YI5oXKu9x2+oCvCzEA5aT
	rZhVuX3Sx6jUoANew96Z8qCXmBoY6KR2c9HWPMh6zJL4euBicargM4+ejJMBMbYvb5Gp1H
	ihojwcjd6f6KbGpnOMZoBwoxyKCT7d5ni3wn/Ay6kja8RycmWx96WdM4+Qnka/ZxMRSQXv
	m9zCpgzWsW8EbpTqDyxnqI3ETyQ40J4mtVyuaZ954mYVFX4t04jx7nbWB9kVXg==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [RFC PATCH v2 24/74] tests: metadata: Add a test for export symbols sorting
Date: Wed, 26 Aug 2026 11:48:53 +0200
Message-ID: <20260826094950.1088288-25-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826094950.1088288-1-herve.codina@bootlin.com>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

dtc is able to sort the export symbols list when the --sort option is
used.

Add a test for this feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_sort.dtb.dts.expect | 18 ++++++++++++++++++
 tests/metadata_sort.dtb.expect     | 15 +++++++++++++++
 tests/metadata_sort.dts            | 21 +++++++++++++++++++++
 tests/run_tests.sh                 |  9 +++++++++
 4 files changed, 63 insertions(+)
 create mode 100644 tests/metadata_sort.dtb.dts.expect
 create mode 100644 tests/metadata_sort.dtb.expect
 create mode 100644 tests/metadata_sort.dts

diff --git a/tests/metadata_sort.dtb.dts.expect b/tests/metadata_sort.dtb.dts.expect
new file mode 100644
index 00000000..f07a42b2
--- /dev/null
+++ b/tests/metadata_sort.dtb.dts.expect
@@ -0,0 +1,18 @@
+/dts-v1/;
+/addon/;
+
+/ {
+
+	node-a {
+		prop_a = <0x1c8>;
+		prop_b = <0x7b>;
+
+		/export/ a: &{/node-b};
+		/export/ ba: &{/node-b};
+		/export/ bb: &{/node-b};
+	};
+
+	node-b {
+		phandle = <0x01>;
+	};
+};
diff --git a/tests/metadata_sort.dtb.expect b/tests/metadata_sort.dtb.expect
new file mode 100644
index 00000000..ed10b59a
--- /dev/null
+++ b/tests/metadata_sort.dtb.expect
@@ -0,0 +1,15 @@
+/dts-v1/;
+/addon/;
+
+/ {
+    node-a {
+        // [FDT_EXPORT_SYM] 'a' -> phandle 0x00000001
+        // [FDT_EXPORT_SYM] 'ba' -> phandle 0x00000001
+        // [FDT_EXPORT_SYM] 'bb' -> phandle 0x00000001
+        prop_a = <0x000001c8>;
+        prop_b = <0x0000007b>;
+    };
+    node-b {
+        phandle = <0x00000001>;
+    };
+};
diff --git a/tests/metadata_sort.dts b/tests/metadata_sort.dts
new file mode 100644
index 00000000..7d1cca7e
--- /dev/null
+++ b/tests/metadata_sort.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * Copyright (C) 2026 Bootlin
+ */
+
+/dts-v1/;
+/addon/;
+
+/ {
+	node_b: node-b {
+	};
+
+	node-a {
+		prop_b = <123>;
+		prop_a = <456>;
+
+		/export/ ba: &node_b;
+		/export/ bb: &node_b;
+		/export/ a: &node_b;
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 06c27b71..0c5f2849 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1266,6 +1266,15 @@ metadata_tests() {
 		sed -i '/^\/\/ /d' $dt.dtb.dts.dtb.out
 		base_run_test check_diff $dt.dtb.dts.dtb.out "$SRCDIR/$dt.dtb.expect"
 	done
+
+	run_dtc_test -I dts -O dtb -s -o metadata_sort.dtb "$SRCDIR/metadata_sort.dts"
+	base_run_test wrap_fdtdump metadata_sort.dtb metadata_sort.dtb.out
+	# Remove unneeded comments
+	sed -i '/^\/\/ /d' metadata_sort.dtb.out
+	base_run_test check_diff metadata_sort.dtb.out "$SRCDIR/metadata_sort.dtb.expect"
+	run_dtc_test -I dtb -O dts -o metadata_sort.dtb.dts metadata_sort.dtb
+	base_run_test check_diff metadata_sort.dtb.dts "$SRCDIR/metadata_sort.dtb.dts.expect"
+	run_test check_full metadata_sort.dtb
 }
 
 pylibfdt_tests () {
-- 
2.55.0

