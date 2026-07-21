Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFF0401A01
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784602343; cv=none; b=VAx4NuDWnqlonjT4ylJdVRX4FEMVNCdJILUQkR1l1ecvPOUp+oVXpJ6XvWWXbd/MGAeOIIgdIMJ3jo+LhaBwFadTdxz+C3vH+bhc32tC4YgZTyNRbx0Xx5Wzj6lURyZGipjRW6odjWCHnaFXuzcPPKMKHghSxDEAQcaXwZvPjCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784602343; c=relaxed/simple;
	bh=R6tBpLfkSYlFbeXQtoe6ybjEQWYkSemCib35gwY2h1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dBJhWCwidh6toQLAwFeMF2K9jAfyQL8Jffn585PH69OhkwQNWu4P0jUQcCzzSn7z0N7eV2LWRcloZekH1hHj3hQIMAVAAxJsCcrNfR46NJZ8874umtwTkMmkfs/gcte56ikfan9rH5xfLjtP/trPZQAOF+WyJMXpMforPsYghlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=AXEMFLEg; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="AXEMFLEg"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so7450949a12.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 19:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784602342; x=1785207142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jb3SzunVzCrAW1kpVHD7vkFwItBmsZgciNXBopwYDGc=;
        b=AXEMFLEg9jxaPgwL9qANAkAZchYTbcq4zUTwYLVN4Esy67WOvvrvYDB17RRV3n2KNm
         Skk+8sa8fYxeZvOXVMNsPT/I9pGcWHydnEdHVkbGVCSzb3xdrscRWBltxBfcV+EsZ8r+
         f2my5y41gAcJAlSA1lo0G9YLVf5bJd7pJlEpjA3Z2vjL2e6zGoxykd14B2+fnFoCz9sb
         kBm9BXlYMOa+6Us1BIeDzfHTGcH+5JpstkS9j76YbtKw69EKnvCeauBZqk2XR0TvxbTt
         m4GjxKeY8DDkmTniV0WvPAzcOJregB3/w8rgrbeVq20B2nMosufTH5faXd4iTUtc7K9j
         l1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784602342; x=1785207142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jb3SzunVzCrAW1kpVHD7vkFwItBmsZgciNXBopwYDGc=;
        b=V9bpetrQmiqDynEcNNwpGEQFc/lckry41d2pdVDlu9wALD3xCRZ0QUOs3ZQgthEr2s
         iMzWvkW0N47NB78ttXtDjqkQwmB2+JDlpfJLEj2QejmRdDBHiZPS5NK4KFzK74bLOEyU
         FzuI0hd0rAqpxqBy53xz9P8671bZl5LGVtkc+nJIYcaE0pBMEHBuZOjnhOTsJtK87w2T
         9ScnKnNb8h7OCh90fMG0vyqVfGWf7wwV1YA0k2CNMBDTveV5YG3GclkVkjfph9IExKFi
         VJHlc+ZMbGAhUPjqUdelAvN62SicqGlUO82CISuu+wMPWalz2vl0+7dof9O0fqvd89JQ
         tREA==
X-Gm-Message-State: AOJu0YyJQno6UKBd1KZHXl3sMrnLufmvyVENV03YVvfzIGFunfi/pfLa
	bp6zjMolTu36GFYVLX2Dt3SbVEehOQxcOQVTs0H/cjxVkdtwRTVUCE8yBzvUbaQBW3ZJcWJro4F
	+963LVNs=
X-Gm-Gg: AfdE7ck9aY20Ia8aDACqJGZHGK5lKjB/Nd1BJWhrMj/kiwu0EnVf/Bz86hfXCSShami
	AKpY8Hbi4sl4qG6mvfc1psCW9VRf4Wql4E5sN/MfI3Vp1EiTWSE7pLOwp0kFg89BOKyT3pxk8NW
	hyTnMAQ7+yMHz9UeYdA3fdOhLxV6lQIgzeYfrFKZz8ULeowr112HKYg0kRXhb2S3zDtCVNpkYkT
	PA06yYevjUiAgb/Au+Lyi0tgCk8TuhmIjdJQM790lNMl0xplHxX2TMS1JIhaF46ntVjOJer6PnX
	FHnE3Nkys3BV28soEV9lyHMmrWXrDNJvSJ3lgTtBXX35FGlKO2T6ADDJb5/WVl+Cwoecheir4sH
	ZfCCK/REOqTZgUJeyFJmyB8u0CW14NaDWADTjXEcv7S+I/YoOdWe+vVDy9tmwwkLz7R1/y4dPys
	fA2xgkvVGDKfEHWd0=
X-Received: by 2002:a05:6a20:9148:b0:3a8:9dd:75d5 with SMTP id adf61e73a8af0-3c3ad66833dmr19084843637.24.1784602341768;
        Mon, 20 Jul 2026 19:52:21 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41167294eec.24.2026.07.20.19.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:52:21 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 20 Jul 2026 19:52:16 -0700
Subject: [PATCH RFC 2/4] of/overlay: look up absolute target-paths
 absolutely
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260720-nh-of-alias-overlay-v1-2-27da6848dd84@nexthop.ai>
References: <20260720-nh-of-alias-overlay-v1-0-27da6848dd84@nexthop.ai>
In-Reply-To: <20260720-nh-of-alias-overlay-v1-0-27da6848dd84@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784602339; l=3039;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=R6tBpLfkSYlFbeXQtoe6ybjEQWYkSemCib35gwY2h1U=;
 b=yt2GfxHQrIY8Z2eAvW7m7IeX9EvWMV3QYggBALOn9yd+GDXFOG10OiNvY9UWpmha1XDchmGaN
 7GsZEFB/f41CKuTeCmoZ5Miuhsl1fZqU2vZ/ywngYvV5GksQYMadug0
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

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 08d5351746be..654a70d5cb07 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -693,7 +693,6 @@ static struct device_node *find_target(const struct device_node *info_node,
 				       const struct device_node *target_base)
 {
 	struct device_node *node;
-	char *target_path;
 	const char *path;
 	u32 val;
 	int ret;
@@ -709,23 +708,22 @@ static struct device_node *find_target(const struct device_node *info_node,
 
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
+		/*
+		 * With a non-NULL @target_base, an empty target-path means
+		 * "the target base itself" — this is the common
+		 * of_overlay_fdt_apply(..., base) form used by e.g. the
+		 * LAN966x PCI overlay. Any other target-path is looked up
+		 * absolutely, so overlays that also need to reach the DT
+		 * root (e.g. to add /aliases entries alongside a base-
+		 * relative fragment) can do so with target-path="/aliases".
+		 */
+		if (target_base && path[0] == '\0')
+			return of_node_get((struct device_node *)target_base);
+
+		node = of_find_node_by_path(path);
+		if (!node)
+			pr_err("find target, node: %pOF, path '%s' not found\n",
+			       info_node, path);
 		return node;
 	}
 

-- 
2.54.0

