Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0E135F8D2
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784776810; cv=none; b=cVYyMDSlMXjvsiaJe+3BRHs0nIx0l1CJvnw474fIR5bByGn55dYoV3Uy6mQF1/fLcp+FXezcHEbMaggIasVpZQ02v9cu3pnfpXYS3JGrZsTv4EExaWq3hU/d6BGIKd+a+pBGDZn9AcgcoXHUBIul5ooAYs/+8+e3XwscJA2K9BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784776810; c=relaxed/simple;
	bh=rtMHX9hWMpcieCzh+lEL0bv+hah6KKo01VRR5TnIRxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfZQlzRjo7fmOpQB14CgHrVB92rX34SAp2iZ+r9bTKEiDWxzkcal1e4YSpmBK+0MNDs48kh7oI3qg2Rf2oLohuUiaayvuwYKZW6T1fAWCnNzLdQrWcX3oi+FWZsgU7ACTcoCDurf4ObI4czIjjtkkTMVpfHlam4eyJTGLu0Umjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=MygdN7k+; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="MygdN7k+"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceae1ed204so1691815ad.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784776797; x=1785381597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBfNFbSVh1FYGWwWZzjs3Er9OcgI7SYTXtrFRcmH5Do=;
        b=MygdN7k+d7Dn0nRcGBCK/3LT5vk6J+9DjQJ+5f8YKCbZz/NUOVjHQuSZab8YRB7iOI
         c77rSNI+qwt8xox5Hk4Ww7clc1raHOz9rSLzyz/zp+WSG3vMcTgJW3/IJkeGiPMP6+9L
         9t558mnYKc7P2TQhlQqHJOldz+D46awimLfwSPm1aZ/ufM2JEIuV2yupW2zPWDEjkhqj
         V82IfaZwVumZn4cthYNhPghT3Bs1dqfyVQCzRIcRoPJKgtN0NLXDczCNr4e/6kX3QgS6
         +szWSIZ9HUjF3zpcIuscGTd0nIwzVCp9F3KXDrTeI7E1GAh4ixfiZ6qlkx5HkK/U69G9
         iHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784776797; x=1785381597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBfNFbSVh1FYGWwWZzjs3Er9OcgI7SYTXtrFRcmH5Do=;
        b=j+iOvCW3s+lL4wKLdyhxlaN6dKAmLe8DSAsbGPfM9rvWyjXSWvDaAr98TeeMikxwBV
         f3VMWqxMkP7v76Nh2QIhzkdbDlqrw6JUKXgVNyJqAVi24HG/MTvcFnncSWISKaNjPdjj
         KZ+9fafwuSMtfgolgT/ONgINt/O/A25bQQvunkplQ8qCrHy358CNMAWsTXrvdCYUkY58
         r4dzI8BjKVpyRntaT6UJCFJzOhlox+vw5swSS6KGk4hb2MoIfwNC0aQQQT+ribpTXQki
         F8dVx8fv0UEWNQEQQIog1hwevok84aoXD5cLwLz5HzHqPhqEEmb4xUqwI7PaafDh+1Cw
         OXKw==
X-Gm-Message-State: AOJu0YwVb43lQJcYQICp15K/drRVnwir8vAo0SBYlVz9GyCnduH9Xiks
	KZ5XwPqM/x7KcbK7MLB2cVf66j9kpTMOJAXe6VzVhZwJ51NRq5yhQvznibDxyO+FLXXCRX3umhQ
	Pg+qovy4=
X-Gm-Gg: AR+sD11BxiDqfR2JgK0T2MGFrwxkJb62UffONflllaY2y1CI/GTLMd4aGftrDBkpXEj
	SHicaAO75BL0S/c5a8gUFde26Prfz2R7zIy+JMLW392XgYOcz2B+1XA/oVjoIOLoXGgDO68QZ7z
	zM+oDvmSOD+dLzm0tRy6dLwoDqaHssIZv+IfiiLDJ3fd8yr9o0k4vu5MjysN2RFa1CzQc4EVXJd
	yA0WZ3Q4RxBozP/AmoJup3DteR0vOPCwuvWLIcD6M3IfSn5QxVK8Kmc+nqoMhc6fHz33KZ6K+2D
	aC+eJ1nUpF14XhxzZVka2XTi+PSOqhPh5yLD5Up/Qu+sfXO17E5fLWOn16UnQXWAJ9gTgdGTOWQ
	YIIA7ukZhvXnjI3ESvR1Pka9vvFzIeZ19lOVOYmd2jGBP7ggvLahaSXhUTRSbT+Ng4FTSFBu5cX
	rugPNlGr1VO1xEZWs=
X-Received: by 2002:a05:6a20:734b:b0:3c0:b766:750c with SMTP id adf61e73a8af0-3c44b24d3b9mr1322097637.58.1784776796832;
        Wed, 22 Jul 2026 20:19:56 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm13826080eec.26.2026.07.22.20.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 20:19:56 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 22 Jul 2026 20:19:50 -0700
Subject: [PATCH v5 9/9] of: unittest: cover /aliases updates from overlay
 apply/revert
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-nh-of-alias-overlay-v5-9-2abe2bb9cdbc@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
In-Reply-To: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784776787; l=6079;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=rtMHX9hWMpcieCzh+lEL0bv+hah6KKo01VRR5TnIRxg=;
 b=u4muQ98YCHoyue5Up82bPt0OOkTbg5FAVJ+0WbGjEqQcvVwhGgdFBFq5ZilJF9RncXLqUkH1M
 Z0ckzxDmbl1C1WWUUdwHbRRVhp0Ob8l9js3oisXm/oKDaP9GUFaKauN
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

