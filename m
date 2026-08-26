Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97813BFAF5;
	Wed, 26 Aug 2026 09:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737856; cv=none; b=Yc18PWQdTOzWg9qaejPJufbzCwOUSfjR9tfqs8AKnxHmrZ1PUMXIpZEpcT8H5U8kzOHkIPQYtD9pc5y14LQcpscE1AkUwE8nKb51cCYTSXyPPWvIk+Rt2HWCii6gjKeyFqj0Ft7qOnfXNAP7MA2xRqyy/gz9nobWyO07AHWyTbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737856; c=relaxed/simple;
	bh=qGKkETYE0KCtR8h7Xqu60SUvNStWxJJUyP48j2JQ9NA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MAOExZhEu3uTBxqwDjjw6AfXSCR5IPkRAEusZvZyUmW3La9we1v0BJ1C9yCFSjwsJ58dMDWfv0rb5YUC/eGWKgjv3I36OjqFuwSf+Yn5N6sEauqjwcAEtu8Gbektw3f31W7js4o8X7uWg9LPO0g3aDiDEpVl/Xkje/Mwv3ZATaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=o8NGR1+P; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="o8NGR1+P"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8EE4D1A183A;
	Wed, 26 Aug 2026 09:50:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 62F9A604EC;
	Wed, 26 Aug 2026 09:50:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B52D411C7AD56;
	Wed, 26 Aug 2026 11:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787737845; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EF95EYAVIjXmPQPZnHstkIoY4jBFJn736uZMQeOgu/8=;
	b=o8NGR1+P4JNx1JgmTXcQLxzKXGI8Wuhc8bau6xxHlNJWN29xL7BuZmdd8cBLvkLcXAkdmj
	9eooepU7ellJnz5OiDPjqXSDX8XaEC3PmJIQEdCAZgu7kajeAMo7I47kFWW3rvnD+qghU1
	ip7MunPL8/+4HVkiDHRrk5EzxWc7aIb6fFYoajEkYuSb1MKtwUuYfoiIVyeHqe+5HXX9KA
	NJ2aC4K3/hrjsZ2RiE7+XImQVv+uH0OGxYiRsgaMhJ6ZRKORFSKI/juFn1PWxeVmHQ8F2E
	91WJuyiijYqZ2XRzsrQRKPQg92sVl6zW+PH6jpL0TNR7/hdQbtNARm9jvpL0NA==
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
Subject: [RFC PATCH v2 06/74] dtc: Move fill_fullpaths() into build_dt_info()
Date: Wed, 26 Aug 2026 11:48:35 +0200
Message-ID: <20260826094950.1088288-7-herve.codina@bootlin.com>
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

fill_fullpaths() is called unconditionally after parsing to set the full
path of each node in the parsed device tree.

There is no reason to call it outside build_dt_info().

Furthermore, future metadata support will need post-parsing operations
in build_dt_info() to produce a fully consistent dt_info. Those future
operations will need the full paths filled by fill_fullpaths().

Move the fill_fullpaths() call into build_dt_info() in preparation.
No functional change expected.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtc.c      | 19 -------------------
 livetree.c | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/dtc.c b/dtc.c
index 6dae60de..e5068375 100644
--- a/dtc.c
+++ b/dtc.c
@@ -28,23 +28,6 @@ static int is_power_of_2(int x)
 	return (x > 0) && ((x & (x - 1)) == 0);
 }
 
-static void fill_fullpaths(struct node *tree, const char *prefix)
-{
-	struct node *child;
-	const char *unit;
-
-	tree->fullpath = join_path(prefix, tree->name);
-
-	unit = strchr(tree->name, '@');
-	if (unit)
-		tree->basenamelen = unit - tree->name;
-	else
-		tree->basenamelen = strlen(tree->name);
-
-	for_each_child(tree, child)
-		fill_fullpaths(child, tree->fullpath);
-}
-
 /* Usage related data. */
 static const char usage_synopsis[] = "dtc [options] <input file>";
 static const char usage_short_opts[] = "qI:O:o:V:d:R:S:p:a:fb:i:H:sW:E:@LAThv";
@@ -326,8 +309,6 @@ int main(int argc, char *argv[])
 	if (cmdline_boot_cpuid != -1)
 		dti->boot_cpuid_phys = cmdline_boot_cpuid;
 
-	fill_fullpaths(dti->dt, "");
-
 	/* on a plugin, generate by default */
 	if (dti->dtsflags & DTSF_PLUGIN) {
 		generate_fixups = 1;
diff --git a/livetree.c b/livetree.c
index 8baed1fc..abe73de1 100644
--- a/livetree.c
+++ b/livetree.c
@@ -448,6 +448,23 @@ struct reserve_info *add_reserve_entry(struct reserve_info *list,
 	return list;
 }
 
+static void fill_fullpaths(struct node *tree, const char *prefix)
+{
+	struct node *child;
+	const char *unit;
+
+	tree->fullpath = join_path(prefix, tree->name);
+
+	unit = strchr(tree->name, '@');
+	if (unit)
+		tree->basenamelen = unit - tree->name;
+	else
+		tree->basenamelen = strlen(tree->name);
+
+	for_each_child(tree, child)
+		fill_fullpaths(child, tree->fullpath);
+}
+
 struct dt_info *build_dt_info(unsigned int dtsflags,
 			      struct reserve_info *reservelist,
 			      struct node *tree, uint32_t boot_cpuid_phys)
@@ -460,6 +477,8 @@ struct dt_info *build_dt_info(unsigned int dtsflags,
 	dti->dt = tree;
 	dti->boot_cpuid_phys = boot_cpuid_phys;
 
+	fill_fullpaths(dti->dt, "");
+
 	return dti;
 }
 
-- 
2.55.0

