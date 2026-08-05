Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D7A429CF5
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 20:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785961885; cv=none; b=cEqLtiui+XFI62jfOgEzlXQgewYaZEJ4UjMX246dWWjZ2fQi0cXJF4J/lkRtjq4t2ninzczY+HdfshKwelU0+a9oiB5xcYTVOe6XUFudv7O1euyvPKQVifEObtpSLW8BtfiIqh8c+yU48CEz9BU3SFqEEApnrJ71/ZnDlpDIMos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785961885; c=relaxed/simple;
	bh=rtMHX9hWMpcieCzh+lEL0bv+hah6KKo01VRR5TnIRxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZamWBuegtYYRo4tQGPb7rLwI4xhpOOOhMw0FEKO9fgjc2VKF89kPHrVlUHkSEg98xn0ObY5NU26LGWHmCkVARu1G//iqF+fKa88Vo7yauu23/VaylujbAI5RwI6hIehCcp81fzD/aXi8QEqw+nKB/Z2zBXfJIYlD0eFMXY9T0ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=YFiI3oA+; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="YFiI3oA+"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so1111748a91.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1785961878; x=1786566678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBfNFbSVh1FYGWwWZzjs3Er9OcgI7SYTXtrFRcmH5Do=;
        b=YFiI3oA+8sXT+x889ggk/nfqTQO3BwhFAUWm2rDTLzU17VhOXh3pJZcUHtq7s6peAb
         z+jGe735owX1fp0Op2IdGe+rNjAb8DNJarW7amY1NSNJFDPSQ3XL6zVHD8YspeIBOmuQ
         pIJh10SNIs4cNTZTAf5AZ8x24hQVWxOpirbS1sKbe3VyxKqSBdfbH2Nf+4uPr3NvUuJG
         Ps4tB/lEjc3DyDJoUliiRDKqhcu/8Ih1QSctPM0O20qJE1xdKwBL4F/LBIaUAK3Bf9sM
         8cXRCprWSWcXkcY7UWHbiCPwYzyw1GT7e6IqpAnPXvZWhhui6tuZMfD1QzjzM3Qvgyp/
         9KQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785961878; x=1786566678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBfNFbSVh1FYGWwWZzjs3Er9OcgI7SYTXtrFRcmH5Do=;
        b=NQKXTWup6Gx1aC6ci2K5YzbEA29S9EDSzDdo8stRfE0mK53Jn0h23kTkIBOTI/hpU/
         a3D3wPb6ursB/PhNiaxtG+SBDid8ZzmdulWBfbYzDS2u/GiOYi5W6UAj+QZMKG9CDTS8
         X5LJgGXTK0h+lIpAr9anUiZBLjU3HJodBuPvmOZL/vHDKAHFyxgLt9xQu8tEartL68SA
         lGhkqOzsOTdrQAb7XSrpbF4MiFP11Edv06ntN2B1TpBpJFGkC8rkQ7oEsz7w+YO7pDuD
         CT779QNQOROay2IbAulFhUn+6spg4wu1Pmfc7uiQ9Bc92cdT6pPMR5og4scwIPJ6c4UK
         WpyA==
X-Gm-Message-State: AOJu0Yx1XfIztUZs5Kyf5rNZDbMEPQkfrlScfoxcwDu8+S64u/nbVPWK
	XWw71ZZ4GlG4By3AU5K46ZgvnbXfkM2X5mYNcX8hYA56aiGHKhDVEQLRRHReP5jPxBDaF3xGbl/
	48ONkCPE=
X-Gm-Gg: AR+sD13saP9Pt2sVXWaiVfPZkeodWolOifTt8eTdC22fvmc68UJpNbbNJ9hcyK77tUs
	FuRabb9/GEKadRfR+LVCW614b8wAX6cmR3ph54ZX1bKywDToF51/v7eK/EPZW9VmYbtjUkIpgl+
	s2Q2DJ7MU4qI2R9pHetxtpyQ+hQ9LY+ZrdvwEEK8UQRsKLzfx0GtEitf8CIX0gGwzQZN7gD9QL2
	Br1CP2QPh/lxsev5R6ZGnuPpFg7RAE8ILJHsDVA3CPabDRs5vPelVSljFc5pGI/MpSCTP4NnrJ9
	QTUVc2QyYxFESuSwKTzdQXq28GLiIGWn4Z8Cnpee1DE6d7bbSid+h7UhH3syqzrCA808CB3X54l
	RuBXnl+tBu4Wkw7rtrdZidIQz4X/VX3AnaaR4VWxYmomYc51fOwROwnPSvopaIdxadMOkw71XA6
	ykIXWemtitvvsnxJPwWHkKIG7pZ8Lw4xGANDhzU3eZbSaLsqH+AeCuJK8C1CUzCzs=
X-Received: by 2002:a17:90b:524c:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-3903c54b386mr9194151a91.3.1785961878428;
        Wed, 05 Aug 2026 13:31:18 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca63ce12sm20694924c88.5.2026.08.05.13.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 13:31:17 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 05 Aug 2026 13:31:09 -0700
Subject: [PATCH v6 10/10] of: unittest: cover /aliases updates from overlay
 apply/revert
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-nh-of-alias-overlay-v6-10-74f21d440819@nexthop.ai>
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
In-Reply-To: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawn.guo@linaro.org>, 
 Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785961866; l=6079;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=rtMHX9hWMpcieCzh+lEL0bv+hah6KKo01VRR5TnIRxg=;
 b=J2vflF8bV+KdsHqFUV1I2/2U7Yt/jQkPRdqmqJq3xyoTUJmt4hQhaw+UC2WaGkN5+JVA4TRfo
 Y11CmgSdvapAHSF4hjOwzK59Dm+BSkck3DC1WYI1PUAoYaGHuTjIPFg
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add overlay_alias.dtso and of_unittest_overlay_alias().

The overlay has two fragments: target-path="" grafts a labeled node
under the run-time target base, and target-path="/aliases" adds
`testcase-alias99 = &<label>` at the DT root. The runner applies it
with a non-NULL base via of_overlay_fdt_apply() (overlay_data_apply()
always passes NULL), asserts of_alias_get_id() on the grafted node
returns 99, reverts, and asserts of_alias_get_highest_id() reports
the stem gone. A precondition check runs before the apply.

This exercises the reconfig notifier, the absolute target-path
lookup, and the /aliases value rewrite together; any one missing
turns the get_id assertion into -ENODEV.

The grafted-node reference is dropped before of_overlay_remove():
overlay-created nodes must be back at refcount 1 when the changeset
is destroyed. The post-remove assertion uses of_alias_get_highest_id()
because it is keyed by stem and needs no node reference. The apply is
wrapped in EXPECT_BEGIN/END for the "memory leak will occur" warning
printed for properties added to nodes the overlay didn't create,
like the other overlay tests.

The overlay is not added to the fdtoverlay static build test:
fdtoverlay has no target-base concept, so the empty target-path
cannot be resolved statically.

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

