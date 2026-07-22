Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C51360EDE
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682120; cv=none; b=KtinmObFRqxIuuwlV7DIyK6buKI5TkfKLlLP5sPBdYL4Exr3J2L7Ac7KI5SpAxugRqajhS/iddyoQL0q9sAurNz50KIoKaDRVIRAQXHKX7de/Ui3nin6n0UiNbLbQk5fA75dMng1x07kVHLXipeB95oqulerKnR9N1wr4cFpAlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682120; c=relaxed/simple;
	bh=GiQ8QmcT52eeZQ8hU0W7klQyaak1qO4zuG4S19GZ1Eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iBksncDeTNLvYwgv+5eF8EoTOb+HSUo+cIB9uAPunuY+F0v1JejSUPDZF2i4UrhWuZDdXnSMY69/qzx6WMyT7sy0i6PxI0WDQxsrT7zvXD+iV0IdX+RbodBLERr8XOFtF0cdnr6+WMU4IvEiazLrwWUbEZqV4wCCBVKeujIczG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=ScDy/Aws; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="ScDy/Aws"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso2585480a91.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784682116; x=1785286916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3gS4IFrL1u/fKDkWRYURGH9FqMyDvXnOF4aO0ajrY4=;
        b=ScDy/AwsZXPd9BNS1XD98CA+oLHwjA/LLRJH1STD5qNo/jbJGoyGPxj02DSWVi03DQ
         CMUzxMSNnrbtIsUgpn8l0GBxSiFpLULT6LAejj2H+XMz4faVGO2DZQCdEAbjIHRIliaG
         XtXBTd9+L0v263rz758fUkkS4sLNn3I6/X5+vlbqy4IBsGpuDuZAG0//37ARdSGPjj/7
         U4tHtfYxdcT7+uWtknoA7ro1LUDbLn9QERfhoVTgk1N88PPvBSzkQvE7+DuIWhWHPkNm
         d9btNJXpO8qFmgkh77Lbx4+vFYsLX30YMKqoEF17KkCvKkO+h5gVf1fbUZCSCXrnilMC
         zMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682116; x=1785286916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3gS4IFrL1u/fKDkWRYURGH9FqMyDvXnOF4aO0ajrY4=;
        b=g8+nKuRW3b2JKiDAWxdfBGOmG3VZ0uDxZQLb8J5ICeGAJQ/ydarcN4arqKaagQtKvx
         e4jb7UPh2yAG9DwYTPdLAWx3S0VOQZQYHxu+OBajQsSIoA4hfTWJANoqe2owNn0IV5yR
         wzqD0HlUy10LnOs7IOGNpaeFRrRZOmd1ISVa3+ofqohj4pAjbL01ncTzvXk3UtXcty0y
         D0WdWS9HTRAwJU222LBv3Vqggd6oDnA3vQIa6l6DDgE3s4R1KFkGWuUzvWvpDpUtG7xp
         AdGwuI2QuSGedRNzCyDaLmQ443Gi4RtXk2PBqG7pLOz8paSFnWXYQdZWRU0RFc34j3B2
         fyhQ==
X-Gm-Message-State: AOJu0YxYxPLDNFPS3czJ/9+LbeusvSTm4cMh81PBfAYOw8zeqyUjUViz
	zlz5DuScTsEWCo6xuReG0C/PBPDd5r8MXfRdfPA88vNYAbDbFXwhuzDfcGHkwuLorrmtNQ642Sn
	IYw0VThU=
X-Gm-Gg: AR+sD11udtKU/psDsSNLgRToAW/sjsYOkd7s4/NSEU0+Kf0nuM3Ar+sAXbVtha7UIYV
	bdCK6d0SrFqYQeea+Q2yK0sUmWRpkv9Mo820AEKA7ao0xdI3aGOL3zjYRQ/DlWi4763Crfd+7AY
	Nk2zL7mw9BQGzlXor2yZpPlN6LPntdGQagvRbDWpiYLzjnqxl1tyibAArZgBkZDE5qSlaxR5C9J
	CbFiK2D1s181zJ7TUXpK+q7f5wzVIFHasyaxhFYqaj+TuHrpxdXaiEdA+wjdDlMY+t8ipyCQsQx
	Hii4Z08GpQw/rL/fURYlpAmtljrPcmK6PmjkfOtZrkpZCkjE1lfJc+qqaiNrIEelasITv1wgSGS
	4sBFnrYr6CeLjK/CcLsyrT92nCNm5wHzH1ICpLqoLyf31txeo0UnXvZL2y+3e8kQlAUbv0xYjyi
	iqcH63dum77WCGhXc=
X-Received: by 2002:a05:6a20:244c:b0:3c3:7fff:ba77 with SMTP id adf61e73a8af0-3c3ad973f68mr21115284637.42.1784682115750;
        Tue, 21 Jul 2026 18:01:55 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a689sm3141207eec.4.2026.07.21.18.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 18:01:55 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 21 Jul 2026 18:01:51 -0700
Subject: [PATCH v4 6/6] of: unittest: cover /aliases updates from overlay
 apply/revert
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-nh-of-alias-overlay-v4-6-8ad097e31e36@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
In-Reply-To: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784682109; l=6951;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=GiQ8QmcT52eeZQ8hU0W7klQyaak1qO4zuG4S19GZ1Eo=;
 b=kaF+TPamx+WeqjjMa9P8S8tKYPLbJ0Utab3dOA6LcHvy8dU4cDRuzD4OSnR75PDFH7krararu
 f+yU4NK0zFYB09h5b109mM6VZ0TbJSHCYKRlUkNj5bj/9g66J1GXcQC
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add overlay_alias.dtso plus of_unittest_overlay_alias() to cover the
"aliases inside an overlay" flow end-to-end.

The overlay has two fragments:

  fragment@0: target-path="" grafts a labeled node under target_base.
  fragment@1: target-path="/aliases" adds `testcase-alias99 =
              &<label>` at DT-root /aliases.

The runner applies the overlay with a non-NULL target_base via
of_overlay_fdt_apply() directly (rather than the overlay_data_apply()
wrapper, which always passes NULL), then asserts of_alias_get_id() on
the grafted node returns 99 after the apply and that
of_alias_get_highest_id() reports the stem gone after the revert,
with a matching precondition check before the apply.

The apply is wrapped in EXPECT_BEGIN/END for the "memory leak will
occur" warning that add_changeset_property() prints for any property
added to a node the overlay didn't create — /aliases here — matching
the other overlay tests that add properties to pre-existing nodes.

The grafted-node reference is dropped before of_overlay_remove():
overlay-created nodes must be back to refcount 1 when the changeset
is destroyed, or __of_changeset_entry_destroy() logs a leak error and
the node is never freed. The post-remove assertion therefore uses
of_alias_get_highest_id(), which is keyed by stem and needs no node
reference.

Exercises the three functional patches earlier in this series
together:

  * the reconfig notifier is what mutates aliases_lookup on
    apply/revert;
  * find_target()'s absolute-target-path handling is what lets
    fragment@1's target-path="/aliases" reach the DT root when
    target_base is non-NULL;
  * dup_and_fixup_symbol_prop()'s /aliases branch is what rewrites
    the fragment-internal alias value ("&<label>" -> fragment path)
    into the live-tree path that of_find_node_by_path() can resolve.

Any one of the three missing turns the middle assertion (get_id -> 99)
into -ENODEV.

The overlay is not added to the fdtoverlay static build test:
fdtoverlay has no target-base concept, so fragment@0's empty
target-path (meaning "the target base itself" at run time) cannot be
resolved statically.

Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/unittest-data/Makefile           |  5 ++
 drivers/of/unittest-data/overlay_alias.dtso | 25 ++++++++++
 drivers/of/unittest.c                       | 73 +++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)

diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index 01a966e39f23..fdfec5a7923b 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_OF_OVERLAY) += overlay.dtbo.o \
 			    overlay_18.dtbo.o \
 			    overlay_19.dtbo.o \
 			    overlay_20.dtbo.o \
+			    overlay_alias.dtbo.o \
 			    overlay_bad_add_dup_node.dtbo.o \
 			    overlay_bad_add_dup_prop.dtbo.o \
 			    overlay_bad_phandle.dtbo.o \
@@ -66,6 +67,10 @@ DTC_FLAGS_testcases += -Wno-interrupts_property \
 #			  overlay_bad_add_dup_prop.dtbo \
 #			  overlay_bad_phandle.dtbo \
 #			  overlay_bad_symbol.dtbo \
+#
+# overlay_alias.dtbo needs a run-time target base for its empty target-path;
+# fdtoverlay has no equivalent, so it is also not included:
+#			  overlay_alias.dtbo \
 
 apply_static_overlay_1 := overlay_0.dtbo \
 			  overlay_1.dtbo \
diff --git a/drivers/of/unittest-data/overlay_alias.dtso b/drivers/of/unittest-data/overlay_alias.dtso
new file mode 100644
index 000000000000..17e02d1940f6
--- /dev/null
+++ b/drivers/of/unittest-data/overlay_alias.dtso
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+/*
+ * overlay_alias - declare an /aliases entry that points, via label, at a
+ * node grafted under the run-time target base (empty target-path).
+ */
+
+/ {
+	fragment@0 {
+		target-path = "";
+		__overlay__ {
+			testcase_target: alias-target {
+			};
+		};
+	};
+
+	fragment@1 {
+		target-path = "/aliases";
+		__overlay__ {
+			testcase-alias99 = &testcase_target;
+		};
+	};
+};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index e255f54f4d76..2f5e4056efae 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -3475,6 +3475,77 @@ static struct notifier_block of_nb = {
 	.notifier_call = of_notify,
 };
 
+/* created by cmd_wrap_S_dtbo in scripts/Makefile.dtbs */
+extern uint8_t __dtbo_overlay_alias_begin[];
+extern uint8_t __dtbo_overlay_alias_end[];
+
+static void __init of_unittest_overlay_alias(void)
+{
+	const char *base_path =
+		"/testcase-data/overlay-node/test-bus/test-unittest100";
+	const char *target_path =
+		"/testcase-data/overlay-node/test-bus/test-unittest100/alias-target";
+	u32 size = __dtbo_overlay_alias_end - __dtbo_overlay_alias_begin;
+	struct device_node *base, *target;
+	int ovcs_id = 0;
+	int id, ret;
+
+	base = of_find_node_by_path(base_path);
+	if (!base) {
+		unittest(0, "could not find alias target base %s\n", base_path);
+		return;
+	}
+
+	id = of_alias_get_highest_id("testcase-alias");
+	if (id != -ENODEV) {
+		unittest(0, "unexpected testcase-alias%d before overlay apply\n",
+			 id);
+		goto out_put_base;
+	}
+
+	EXPECT_BEGIN(KERN_INFO,
+		     "OF: overlay: WARNING: memory leak will occur if overlay removed, property: /aliases/testcase-alias99");
+
+	ret = of_overlay_fdt_apply(__dtbo_overlay_alias_begin, size,
+				   &ovcs_id, base);
+
+	EXPECT_END(KERN_INFO,
+		   "OF: overlay: WARNING: memory leak will occur if overlay removed, property: /aliases/testcase-alias99");
+
+	if (ret < 0) {
+		unittest(0, "overlay_alias apply failed, ret = %d\n", ret);
+		if (ovcs_id)
+			of_overlay_remove(&ovcs_id);
+		goto out_put_base;
+	}
+
+	target = of_find_node_by_path(target_path);
+	if (!target) {
+		unittest(0, "could not find grafted target %s\n", target_path);
+	} else {
+		id = of_alias_get_id(target, "testcase-alias");
+		unittest(id == 99,
+			 "of_alias_get_id() = %d after overlay apply, expected 99\n",
+			 id);
+		/* changeset destroy expects overlay nodes back at refcount 1 */
+		of_node_put(target);
+	}
+
+	ret = of_overlay_remove(&ovcs_id);
+	if (ret) {
+		unittest(0, "overlay_alias remove failed, ret = %d\n", ret);
+		goto out_put_base;
+	}
+
+	id = of_alias_get_highest_id("testcase-alias");
+	unittest(id == -ENODEV,
+		 "of_alias_get_highest_id() = %d after overlay remove, expected -ENODEV\n",
+		 id);
+
+out_put_base:
+	of_node_put(base);
+}
+
 static void __init of_unittest_overlay_notify(void)
 {
 	int ovcs_id;
@@ -3649,6 +3720,8 @@ static void __init of_unittest_overlay(void)
 
 	of_unittest_overlay_gpio();
 
+	of_unittest_overlay_alias();
+
 	of_unittest_remove_tracked_overlays();
 
 	of_unittest_overlay_notify();

-- 
2.54.0

