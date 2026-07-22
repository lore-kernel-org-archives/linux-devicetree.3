Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC89B3624AB
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682117; cv=none; b=qC1jZnKzslQ7Km7/NCAg1iEQOmZwcyE0qIyZyR6DOEKX+eB10ATUzksfYJeTea4vEfR3jJtTeDfQP422krnto8+AMxkE9wgQudXsPl8DAfHQhSYMOijBM1ptmIE0gtGTbtq52FZknzdgzd1M6389Pbv/jeEOZ1bLxcnWj/Mm8Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682117; c=relaxed/simple;
	bh=kRpIeIkOBNbm/VqI0BkoZECW2QHfP+btpWk4Ns3ReaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZySfS+KIoM+oLRG31B5oPvcY2cpdAi8FkU5FYqklB5/6KvpwyfFwtCW6AOKDoNZMviA0BCDASh20RlMdVzMq+/YimsfKKDtud13jqDGSQlxnQmfeVNHDI3Bjdad15bxZEgcC8SnPeWiKo44SEiNxFaWDh2j/Oj8WHNqsi09QRSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=eVI2nQ+w; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="eVI2nQ+w"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso5345142a12.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784682113; x=1785286913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dw4LW8kSdGmcldnGWhnWc2M/cNC9RFM1UCRX4bcCtw=;
        b=eVI2nQ+wYGjbrpBk3TJuxBBdfKCKJhc/vKp1taPdF9OxyWbzy3WXkEHpd4Txlq2uZQ
         cBGLzlW5p2+4Rud4cu95Vyt70cDVHjGSP1yyvUNL2crHhSzknk5dcJmHkMm2mQP5gbtB
         FbzX06lP+ZSZFM5hdU7Nb0QsxmdAGMmqbmvU/WzYBbSXh6dJfKt2bTQns8cXr0iZUReF
         BUmwXcs/N+VvjR6jHkD0O6r60aV5Sw/W6HkWbx38p3/VZyFHj2j9Rx/LteXMyMiCLqVK
         kfM+71rEm1JD2h4QieMn0H767d2ry+y5nRzWbzlcRWwFnRP3BrQe8fdCwrCyV9Pk1mdZ
         KjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682113; x=1785286913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1dw4LW8kSdGmcldnGWhnWc2M/cNC9RFM1UCRX4bcCtw=;
        b=o1Dd48JRdtcOxTqqPgDoD2K8pR3Q8k0m/H03V8TjQBoEgitx1EPm5MUjw+s/dcUxln
         rNm/XCmCG88vDYXRZiegJRmAkgTEqv0iKJda+/giaXUIwDTGNgu6A8WGh++NcjGyDiL7
         euj7gQ7KH1/aIv666Ofu3EWKh8LooLPm+an45da8Krrrx/WE1E+kV0WRRw3VtrWLWs+4
         Bp692E5FBWNpkNX+RKkPbcNAP22L6hw/7ZnDGWfou4nnoHxTIkLSoUHv88KmyqvCjYcB
         Czi8+oUgSm2lRH28P+zfI4ax6A+7/GBjHv7S68lDeWep4vwC4AVyjnjxh49QENDVQKyg
         8ehg==
X-Gm-Message-State: AOJu0YxVTdfH8h7THniz1i379xHV2zqwuW6wD2wVMZeAelHvXcr52juB
	NyfxdgkxdkkKbhOWimqm+1DBq3coxC/IjJkxg6Oa7kCRkKScetooX8NNr2EiymksqBntVOLPC+R
	WE3Zey/A=
X-Gm-Gg: AR+sD11OwoaFTCvY+UJQ/HIZWOXLGomlAVCzqDQYob45Y6CYYxfdF1Npc2YybqIPx0P
	rjPNIq9q0xOa0SkwRIuz5utsQK7LOCOo5n3GfaOUsVtWMwbfT9PPRp2R5FcfzsLLRGkuZ/lBNcV
	B/KxqliHCs0gyPmX1o2tRYIgkSCv/0MiiWH4TyfNA9Y1Cv/4etHo9BUJq1RAut6DPJb320oTD1R
	3SIr5CqvVJzMUQHDA7128Z9iDPZI8Vr++edUUOqYyN0sH8kp9ykGVhbMJRjlJeVuLvPjhK6ixd3
	mJZmg4WScgSwydm5YbuOKmYWOv9G6njzxZs1FiPw9dlb86GC1USO944pvz78x7fwRJM9SUicEMV
	/vxFHEmLXGghy75k6sqH1t6GFeHODHTF3f6XZUE6aBSh4IjtYZUM6u6/rtNH+6g9m84ZWTpZZkZ
	TaJQk0
X-Received: by 2002:a05:6300:141:b0:3bf:63af:85d with SMTP id adf61e73a8af0-3c3ad7f9c33mr22691710637.18.1784682113003;
        Tue, 21 Jul 2026 18:01:53 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a689sm3141207eec.4.2026.07.21.18.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 18:01:52 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 21 Jul 2026 18:01:48 -0700
Subject: [PATCH v4 3/6] of/overlay: look up absolute target-paths
 absolutely
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-nh-of-alias-overlay-v4-3-8ad097e31e36@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
In-Reply-To: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784682109; l=4474;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=kRpIeIkOBNbm/VqI0BkoZECW2QHfP+btpWk4Ns3ReaI=;
 b=5ijyVEp1xZ9Z3BnjZUvplK7hk36P7eSeU4T8wKCEQ6Ha3YFD5wzM5j6/yJXNsP2DmWQS1ki3F
 OgKVtSY32A9AsZCftxmvou9r9feTq4vrns9BFw0lIYbmXZunndo1YCc
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

When of_overlay_fdt_apply() is called with a non-NULL target base,
find_target() currently concatenates the base's full path with every
fragment's target-path via "%pOF%s" — so target-path="" resolves to
the base itself (the intended common case), but target-path="/foo"
resolves to "<base>/foo" (never the DT root) and target-path="/" to
"<base>/" (never a valid node at all).

That makes it impossible for a two-fragment overlay to modify one
subtree under the base and one node at the DT root — a shape that
arises naturally when a PCI-attached device wants to declare its
peripherals under dev_of_node(&pdev->dev) AND add /aliases entries
so alias-aware drivers (i2c-xiic, spi, tty, ...) can pin bus numbers.

Treat target-path as absolute whenever it is non-empty. An empty
target-path continues to mean "the target base itself", preserving
the existing shape used by drivers/misc/lan966x_pci.c and its dtso
(the only in-tree of_overlay_fdt_apply() caller today that passes a
non-NULL base).

Spell the new contract out in the kernel-doc for @base and
@target_base and in find_target()'s strategy comment, so out-of-tree
callers that modeled a base-relative target-path on the old
concatenation behavior have a documented signal that the semantics
changed.

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

