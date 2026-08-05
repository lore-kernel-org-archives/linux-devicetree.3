Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93753429CF5
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 20:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785961874; cv=none; b=Hp0RCqSVM9SPEwbBZaUPlSfzZ+SsefmKgP+TZMdCtwx5JFQEm8sswYmPE6FK98h4g6NuiyBFSJce4FtYDXLi3Yaqna2UWsForPTqb1rZvngO/nIMZszB20ZrQUShg99cj82I/tI6FE7JggCqtl95ewfnZvscN03C9ly4fFLsXq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785961874; c=relaxed/simple;
	bh=i+iwVi9KMRy/SRzPz0dFMHY5QfWjU3ehExfRWdvyWCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D5ttfzzGntO2lwb4am8WYAURnjVk915CXZeVgZgmsC/MUplNbk8V7Nt8AVKoKwa3f0AXPLLDJ/7VuptsgT7TvYUgybOJLQE/P2AkKuGdBrFEUI6pPtzi6hQgzcSFnSwBXBFbN6bDYv9aj1QhKg8SVO+U5KQHLl3aQv6t1dmgqgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=ii3Zx1oN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="ii3Zx1oN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc891373e0so18508715ad.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1785961872; x=1786566672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUT2qIYHjpXWpwH1J8XuYKZa+9kxUUZTpxZC6ZkH8Ds=;
        b=ii3Zx1oN94t7vrNzV4xeY0LoxSvde3wkIOxFY6YbtZTZ/X/NU5UQXXiBx2CCr/Fuim
         ttQkVaJ1Ijjf+HipVrEN7SsX4a+3tHiYd1z8vArU/DyehriYXaWL0FD+OAPXWYwHeeOv
         UipGZWOSSltzqRWha+G6lEq5mrne6DCXP+cwL4UaB3tV3Kk5W16cHVaPRtWwmI0wEPxn
         ugOwca+tJmnb6INYg/B+FIh0zdQHdM/+FDsk0xVCn0p+oClKSHfM6ksV0CyW1Xjg+lGf
         13AKd/ovvWJg0XKN2djf/Th+wjZ1YUuOHKJbTu5oCeycDrbHt7HpU9Sq6OrvETJupgK8
         yHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785961872; x=1786566672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUT2qIYHjpXWpwH1J8XuYKZa+9kxUUZTpxZC6ZkH8Ds=;
        b=niUzSdT8KNWuD4YVhC1XlGNo+BS2QPN14gYHIIDmCt/sFjoIslFpTOySDlIY2vaQL0
         N8LqsAYykxHiJWhTUajvq8Lh0/4kbbfD/Lzxiggk/P+4YQpbIp1QkD/G3bMh4E7MPemM
         wHVnxQM98yGoWnx0G596ymAMjd99YZmjPgTGm3OZSE9P7gVK56SCrcTOlWIgii7WYyRu
         RbpKPQNWAYBF7b0XWA4auCCYZKDT4ofvftm71BUPhuotEr5SajAbhP6DYjtebg5umB8x
         OScoa2/azzm+N/Dh16aQT31MUYHT5m2A47ndSESEUZxqeXl/sIHX+h8Heb2yDp3v6/ZU
         gYYA==
X-Gm-Message-State: AOJu0Yx1+XBvplLBV66fY2S6xld2W7xGs4I29HZ4N9uNLgktuqXMB/j4
	FSPfkYuZZSxuNkS9NY/1AU9I1vpa+N2GTk3wAb1rcynNfnRJz4FVkZ2WgjB2XqIaNmXIO0TExxS
	0Yp4ky6U=
X-Gm-Gg: AR+sD13FDkm8duen9x4Pj1LWyQqjFrwSIDuT2Jw3VNNpALM1dx2YGzqIArP6yUn85yL
	zVRZ3K5GVMwho7lwowR437BcFzGgBLDF3WYAbKXE13K56FYa3cqlwXjCQUE9MwDdj9V5LSUCQRm
	QtzYWKccE1pSz9bajzspcaS17SyzKPNN2AftCuelMg1mjgH0+HBXvwtuAZNnGlmlSthRViS2eSS
	34om3D2REcGU3gDlDyXZCURMYmzbcdUhRrr4xTddW8ryU10PHgLfR1m+0z81hh1IVXb9uotXMtS
	KdZF4iSnu3x/INQCbDXmHNGa/P1wRcHhyYwEqMLkTgUu+LWNCFVMcIgAx/wqSetOsr5PdcE68+d
	zDLo6BvnZf2xd8NZsnBvRWgdjJG1xaA0WG6msXt2/eOxSOVQrZ8ccDkKfeL+IMJ0FK6Pi10CAnm
	xqpWVI/kGdXjZO8eAFt5b4n5kdaMSfEUDdfZI0B2QqEuAb9bU9E1zsr2I4FNMCqlc=
X-Received: by 2002:a05:6300:4049:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3cb85e9920dmr11209730637.3.1785961871923;
        Wed, 05 Aug 2026 13:31:11 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca63ce12sm20694924c88.5.2026.08.05.13.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 13:31:11 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 05 Aug 2026 13:31:03 -0700
Subject: [PATCH v6 04/10] of/overlay: look up absolute target-paths
 absolutely
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-nh-of-alias-overlay-v6-4-74f21d440819@nexthop.ai>
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
In-Reply-To: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawn.guo@linaro.org>, 
 Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785961866; l=3883;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=i+iwVi9KMRy/SRzPz0dFMHY5QfWjU3ehExfRWdvyWCg=;
 b=lrB8lQimiqH02owqqjAaVe+5c+ax/rWTOmwpAjaTTGl4vLfVHC+4sR3boy1JNqFa/yVaf2HUX
 kJqubsnjFgrC6g2RC+9gG6esc2l/raGc767SipTRbQwVz4iGvCOMxo8
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

find_target() with a non-NULL target base concatenates the base path
and the fragment's target-path via "%pOF%s": target-path="/foo"
resolves to "<base>/foo" and can never reach the DT root. An overlay
applied with a base cannot both extend the base subtree and add
/aliases entries, which is what a PCI device declaring its
peripherals under dev_of_node() needs for alias-based bus numbering.

Treat any non-empty target-path as absolute. An empty target-path
still means the base itself, the only form used by the one in-tree
caller passing a base (drivers/misc/lan966x_pci.c).

Spell the contract out in the kernel-doc for @base/@target_base and
in find_target()'s strategy comment.

Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 08d5351746be..74aea704835a 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -688,12 +688,15 @@ static int build_changeset(struct overlay_changeset *ovcs)
  *
  * 1) "target" property containing the phandle of the target
  * 2) "target-path" property containing the path of the target
+ *
+ * With a non-NULL @target_base, an empty "target-path" means
+ * @target_base itself; any non-empty "target-path" is resolved
+ * absolutely from the live-tree root.
  */
 static struct device_node *find_target(const struct device_node *info_node,
 				       const struct device_node *target_base)
 {
 	struct device_node *node;
-	char *target_path;
 	const char *path;
 	u32 val;
 	int ret;
@@ -709,23 +712,14 @@ static struct device_node *find_target(const struct device_node *info_node,
 
 	ret = of_property_read_string(info_node, "target-path", &path);
 	if (!ret) {
-		if (target_base) {
-			target_path = kasprintf(GFP_KERNEL, "%pOF%s", target_base, path);
-			if (!target_path)
-				return NULL;
-			node = of_find_node_by_path(target_path);
-			if (!node) {
-				pr_err("find target, node: %pOF, path '%s' not found\n",
-				       info_node, target_path);
-			}
-			kfree(target_path);
-		} else {
-			node =  of_find_node_by_path(path);
-			if (!node) {
-				pr_err("find target, node: %pOF, path '%s' not found\n",
-				       info_node, path);
-			}
-		}
+		/* an empty target-path means the target base itself */
+		if (target_base && path[0] == '\0')
+			return of_node_get((struct device_node *)target_base);
+
+		node = of_find_node_by_path(path);
+		if (!node)
+			pr_err("find target, node: %pOF, path '%s' not found\n",
+			       info_node, path);
 		return node;
 	}
 
@@ -737,7 +731,9 @@ static struct device_node *find_target(const struct device_node *info_node,
 /**
  * init_overlay_changeset() - initialize overlay changeset from overlay tree
  * @ovcs:		Overlay changeset to build
- * @target_base:	Point to the target node to apply overlay
+ * @target_base:	Target for fragments with an empty "target-path";
+ *			fragments with a non-empty "target-path" resolve
+ *			absolutely and ignore @target_base
  *
  * Initialize @ovcs.  Populate @ovcs->fragments with node information from
  * the top level of @overlay_root.  The relevant top level nodes are the
@@ -982,7 +978,9 @@ static int of_overlay_apply(struct overlay_changeset *ovcs,
  * @overlay_fdt:	pointer to overlay FDT
  * @overlay_fdt_size:	number of bytes in @overlay_fdt
  * @ret_ovcs_id:	pointer for returning created changeset id
- * @base:		pointer for the target node to apply overlay
+ * @base:		target for fragments with an empty "target-path";
+ *			fragments with a non-empty "target-path" resolve
+ *			absolutely and ignore @base
  *
  * Creates and applies an overlay changeset.
  *

-- 
2.54.0

