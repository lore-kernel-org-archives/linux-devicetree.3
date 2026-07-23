Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3573203B4
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784776793; cv=none; b=J6DTrsO2DRAejV4Q80pUMacf2UZCJH131/9cf2B1JmL+JwxDyYuUMzIn86r7bKLWqePKEc13PLzS+WE+uBg1k2U6xUVP7WeZp4I/lxGiitN8hYegl0bHy8qljA56r8rWMpjFIufbtNhPLn8i8nm7wBemtMmBESnOB6CCEuZe+Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784776793; c=relaxed/simple;
	bh=i+iwVi9KMRy/SRzPz0dFMHY5QfWjU3ehExfRWdvyWCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PRLfA8E9mbPsw6aeWVwGrd5I4H+w2LTnr8exnnodAU9OCVPyCicZz7kkU8SPa77BxMgPIH2ALgmMfoHjQ1k7QJ/UjTrZegOt22YiKP5OiFgNJ+MF/yx0mVLJoJx8hG8sXIT/CSKhOE5x32ZAYhUK+ole2n73rYU0kAju04benR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=i1wiQKdT; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="i1wiQKdT"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so141705a12.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784776791; x=1785381591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUT2qIYHjpXWpwH1J8XuYKZa+9kxUUZTpxZC6ZkH8Ds=;
        b=i1wiQKdTz6eRXOBiSGmhBpFiuhq06BeUnIp+LB2sbdEI/PXbQtxLHPTQhNj9DdGo76
         tkxNwvEkGqYckm+WeEpIoHCrpXJ6OGbZY4cm7rxXj/eIp76YqSn3ygsCTrbmgRz2RLgH
         5jhm+pV15y59m7wtOSzJC+kDjNntYD4JiP/YdRLRv5J43RMI0emqpLthcrRNS+ZbXYW7
         ORMCx0WCW+sgLST88gRoXCI0DvCuCkr95B54AB/GU8XqtBMyOT8L4vsP8pAKTiRS0WA+
         3xRNt7dZ/FhENqrfkdo+ObFZOVczccJki2x/ZKuvLpBN/Q32LSaWtkQn/UESpOQoKa0l
         oO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784776791; x=1785381591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUT2qIYHjpXWpwH1J8XuYKZa+9kxUUZTpxZC6ZkH8Ds=;
        b=IIHAJTWbyS66PlxzIzbMuNPGbNzlhYE0ZVBGdw7nxpQuVS6WIMR46UT44AeL5hpo4m
         ASqXHS/lWAGmxkZr3Prg0Y22QtCu3nqMBBg5EkOWy2F9F+bmoPq9yW0n8l3T5llP96aF
         eeJahrhRYotlZwtaeAa6oQN07dn3Z8Mks0TtDRxfO+IAGOPTzwcx+Kgh/KUlsp0Yroy/
         PtrQFxT6Y22hfT20o16BGDmZk9VIIc28frFSTSORXoLaYSgf4kJ0vIapHap5E5ivCLVW
         iJ4trBFFV72AkLLs7+9Q/7WDFbHEnWkHUH+oDRDQGRJGZCNsThvqztpyNP8wA/6I2PSa
         eL3w==
X-Gm-Message-State: AOJu0YwbR8f1kxo/eDHYq8bLtTdEKotWIGgwj39krZniQS+pKNiZxx49
	UmQHFtY8hMRai7XQ6oYRvSs0z1GskpIEqi41MkT7JmC0RiVXHvRHfrWN62MPWTHx0bWxlWOAODU
	SLw2EJpk=
X-Gm-Gg: AR+sD13ajydZ48L9wgO8ahKmP4WeJedIIJUfaO2BWr0eO5dr9/U0cpVcVcc6K/8/Ers
	y0pSMPwXFmS6qFiJYhkUVzIuCyrL46WqOOlORlbsPZgz+8IQQ25oAmcG6vhbF3BSmKDHw9DpDVd
	MC3HAn++wTg//2yH7Oe+OPsnknwTgy2HUZmc24SnGDiXcCPj1Ow5St0tLM84o6cnSWYEH0jEQEi
	K7qm8quUaQQHnrxhAFi1PHqmTwqJ47UuUqqkdeZgJMv507DHtn3/nkDfbILCvaTjdQUa8ylWd8+
	k3lj/MiBjao1CF/7HZKpfARSj46mgyJuE7/H+tl5dYeNuLdY6ORyUUZ4PD4UudZ+gJpWfXGClhN
	5ZjBkFBzTmx82jeYENaYopeRkvu2rTECY6eVEX059NAQvzB3N/6tGzA5mrDAJ+kWfQzr+nH8SCb
	R7T9cL
X-Received: by 2002:a05:6a20:6a1c:b0:3c3:aabb:dba3 with SMTP id adf61e73a8af0-3c44b2c1e80mr1212936637.76.1784776791005;
        Wed, 22 Jul 2026 20:19:51 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm13826080eec.26.2026.07.22.20.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 20:19:50 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 22 Jul 2026 20:19:44 -0700
Subject: [PATCH v5 3/9] of/overlay: look up absolute target-paths
 absolutely
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-nh-of-alias-overlay-v5-3-2abe2bb9cdbc@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
In-Reply-To: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784776786; l=3883;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=i+iwVi9KMRy/SRzPz0dFMHY5QfWjU3ehExfRWdvyWCg=;
 b=l0wvTeuAKY9+ho8vKXqb9+Xkgl9tdYYYlW6Cnd27Unt+4yQcFrFxGQxeUHWIK0nsMfVdMGIvz
 0h1grSUgjUGBeRxsk+zVG3uW7cAt/pW6J5cbB2/kHLlzVbKz+YZUEfe
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

