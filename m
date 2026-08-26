Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469693E5577;
	Wed, 26 Aug 2026 09:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737936; cv=none; b=EVfbV8dOo1iHv9J57/6lMjkBGMxny/rjO/qB0QgmbmfzdaKku/PJB/N2+F+n9gcGE5vK3AjW2is4dx0Ils8PCno1zS4exPQotwYh/NUWpNaNxJD2GGTxHnvzqSRL2vj8sCoUnrjnOHLFe5OT1ZYuY4Be6YPEybf9fdz347PrECU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737936; c=relaxed/simple;
	bh=95XNmSlZWRBa9XNGh4WHAmpLcqKTxfkO98NV72e94X8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EML0zDS4AGK5Q5c1911vuSdptD1C9RcZT7W9wdSaz+0OB5WiB6mb1b5O0VfZphpYzIhIW9xdlBiSrXDwE9s7VjfY14Hv3K9OT6WB1W2sGyInVBYLYy5ivti9kL3z6juwQwcUSDuDrd1QciiA4H4CkpM1IY22hzLF5nKgve3uTk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Msk2HIMr; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Msk2HIMr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E1B581A183D;
	Wed, 26 Aug 2026 09:52:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE073604EC;
	Wed, 26 Aug 2026 09:52:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F19C411C780F5;
	Wed, 26 Aug 2026 11:52:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737932; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=xUxd4wJcHfNJlqPdC/l9eM5qHnYq57UKtdElf7FctcM=;
	b=Msk2HIMrrKqIUiSwNoA2FgwdPT4dc2Bhwq6N+YbyGus5cHbsXivgGq7zdCMeOuwxc/lO9j
	A+TaSZt+bm4QzIZXHnQZwBs7XR0sX5oJD3P7CfiVSBHObrn2lJyChdlXhlZKKlQT9oqPBe
	iRLGtpHCcdfIUa9LijZdyto6X8PuX3yh+D8UC0UluERAaKuYPj6PjOKwfTaXD70VB6KMTF
	JMzuHK0Lt3obAiQDR2mvURPYymWpfb6g6zFryzlHxRSPkWEzgmSxHJMb8CaP1BoL0gv/oj
	yQHOZF6bkIFONiIKnowgodclYceUMnHuKAzg+wBA62opOmJtll3tot/0yfvzOQ==
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
Subject: [RFC PATCH v2 34/74] tests: metadata: Improve sort test to check for import symbols sorting
Date: Wed, 26 Aug 2026 11:49:03 +0200
Message-ID: <20260826094950.1088288-35-herve.codina@bootlin.com>
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

dtc is able to sort the import symbols list when the --sort option is
used.

Improve the metadata sort test to perform a check for this feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 tests/metadata_sort.dtb.dts.expect | 4 ++++
 tests/metadata_sort.dtb.expect     | 3 +++
 tests/metadata_sort.dts            | 4 ++++
 tests/run_tests.sh                 | 4 ++--
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/tests/metadata_sort.dtb.dts.expect b/tests/metadata_sort.dtb.dts.expect
index f07a42b2..270c06db 100644
--- a/tests/metadata_sort.dtb.dts.expect
+++ b/tests/metadata_sort.dtb.dts.expect
@@ -1,6 +1,10 @@
 /dts-v1/;
 /addon/;
 
+/import/ abc: "foo,bar";
+/import/ de1: "foo,bar";
+/import/ de2: "foo,bar";
+
 / {
 
 	node-a {
diff --git a/tests/metadata_sort.dtb.expect b/tests/metadata_sort.dtb.expect
index ed10b59a..d5e22674 100644
--- a/tests/metadata_sort.dtb.expect
+++ b/tests/metadata_sort.dtb.expect
@@ -13,3 +13,6 @@
         phandle = <0x00000001>;
     };
 };
+// [FDT_IMPORT_SYM] 'abc' (foo,bar)
+// [FDT_IMPORT_SYM] 'de1' (foo,bar)
+// [FDT_IMPORT_SYM] 'de2' (foo,bar)
diff --git a/tests/metadata_sort.dts b/tests/metadata_sort.dts
index 7d1cca7e..e523e209 100644
--- a/tests/metadata_sort.dts
+++ b/tests/metadata_sort.dts
@@ -6,6 +6,10 @@
 /dts-v1/;
 /addon/;
 
+/import/ de1: "foo,bar";
+/import/ abc: "foo,bar";
+/import/ de2: "foo,bar";
+
 / {
 	node_b: node-b {
 	};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 7a041aae..7c45835e 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1270,8 +1270,8 @@ metadata_tests() {
 
 	run_dtc_test -I dts -O dtb -s -o metadata_sort.dtb "$SRCDIR/metadata_sort.dts"
 	base_run_test wrap_fdtdump metadata_sort.dtb metadata_sort.dtb.out
-	# Remove unneeded comments
-	sed -i '/^\/\/ /d' metadata_sort.dtb.out
+	# Remove unneeded comments, keep comments in the form '// [xxxx'
+	sed -i '/^\/\/ [^\[]/d' metadata_sort.dtb.out
 	base_run_test check_diff metadata_sort.dtb.out "$SRCDIR/metadata_sort.dtb.expect"
 	run_dtc_test -I dtb -O dts -o metadata_sort.dtb.dts metadata_sort.dtb
 	base_run_test check_diff metadata_sort.dtb.dts "$SRCDIR/metadata_sort.dtb.dts.expect"
-- 
2.55.0

