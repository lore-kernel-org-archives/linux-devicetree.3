Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F243DCD80
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 20:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785961882; cv=none; b=uSNYtavaqSXHg/K8DAj7FhddzXMKQ+kHKTTzH53HI4w0Qh1O1c/yndoZ95L6DyzISTmPTjQTM7JQOtW70dKvpAv3m0tuyeGrhqHclnpZj8lOJ8LkXJLma1s7cSM4lCWqZXb2mMdv9/H9wmzEHMWj5m82ZKc8XpHl/OtuG1p8+84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785961882; c=relaxed/simple;
	bh=uf2DvX8OK9pwtfhfHWyR6w2v1HFCYdPTaTaeKyV/B2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d/mYrw2SOrg2Tj38n6liTeGhjAFCfzd39ttFBuKSqg6eRcz3yDR0js61mpULcBRsPIrTx0/OFrJskh+qt+dBONy+gQJyt/j9Aqu04qG7neUjeuZ1CDwbmJYORgo2MilBYBYsCiaTqVB051z0++5demjwubzyoXrnYP/0Unus9RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=XvD/114u; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="XvD/114u"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1470653a91.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1785961876; x=1786566676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWf3onSOOHHmu4G6uaS3lf5o7e8XAcC0VzFCmK/OsDs=;
        b=XvD/114usRRHYvUGxyLsXxOxUidqUhiD/YlJ095XrTmSVaOyDZOrgFmL+hL1qpheHM
         NWqPNRxM5q2a/2CEMIjlZzTQX4wgDxUcAU1PkHni29cWAVVuB+w9yKQCAwIRaYoFA51z
         Prn0SJ38I11tct4D0/Plds03kAdHbWt+dfkj+iBVmpdoJs2NMXZutT3RFhNJyGlQZSDu
         RY4uoeXSGxAyf5KQ0KXudMiq9iFPOMhKdUeAjlZwHOjGV6uoFQ/6AjdWZePtHajw9Iae
         pJDKwzirQonL51OxRR2gNGFZK4IONC0dJVWPB6XlN543+uQZ6iZz43VN9kXgjsdlsR1e
         SNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785961876; x=1786566676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eWf3onSOOHHmu4G6uaS3lf5o7e8XAcC0VzFCmK/OsDs=;
        b=hplrvI67zlQ8/DF0l7dtf118ILcCp2PeBUoOFHrXZyXU7wLOxckJ07jQ30J10u/o/R
         jIkWrGzD5VBQaOvb0qzJtTuGB9BCg81v62ZpPDak2GgPo3d8pl2dRnaKk5z0Wz6waZBc
         ccGiWBw48dAbCNy67Uv8KGNlqawjZ2cnY32mCj7pT64Skegz4UcwUF+ZJYGhJlFgkUc+
         TdI1pHg4wB8NOSoDj9r6OvdN7zIFHyitOYUSBPzU1AOmYnfZ3yJ3IwZEVHO27x2H9oH+
         80pZxasQuwMVcEwfPXqoIoyyF6Q+SVNwx3srbmXjVhQz5FPr0U8PdGvdE8qUVj7RoLQf
         9AEw==
X-Gm-Message-State: AOJu0Yyi9JNpqgbVtdZgdv1N28/6lCWKTPBh1yB2JO4teBk37zLb6CIN
	Bl5oNW/pSmbcd/d+TbXqk6n1gr8841w6aR8mfatzsRDdebpz7/4v8trb/SaOkGEcebMdrZoOxjZ
	zVOgVfIc=
X-Gm-Gg: AR+sD12peppJWHfPZiTYrJBLw1TDoTIYx+n7k6jB1LJIG+H0GhkaMYChSCAeL4HN5S9
	LxUxafw7HAu5LwGpA3pfsAprYbRDSuQJURHUjmZZZz8yLmj/TH6bjw1uOMHVsSJYAKDduhX2ell
	aDHJIveEcXii3demK8tabjj0kOsMGY3kZSirFxrZyTJxq1Dm+/nVdKoj7YRcOujk3ghgaEqY2T0
	KmSkm5qNdeScFkezxo4kKQP5faUPXsMCNMlsnwAH7zDzGVCbW+1X9e+DLB3cfF0AGZ81FDBzeI9
	5mQusd3ULOD4t4/ZJ/j6qB9EDX28FIU41BFqFZbzKEj73cQ2Yl/kCQUZOEeppQ+RLWQloJyapYo
	z93oqMejot4SGTa0QitzRd07yjPmdUtTTI0rXQOWiPZZ8ojfcnv2z/CTU8O6PQZ57upbHl7/Y/b
	xH5Yb//Q6xa1X1xxBAQtLFipDe+zFTXPklDA7TIwxboj8Fhl2UpBrJ1nxVSKqIwP3ckTyF2DXLP
	Q==
X-Received: by 2002:a17:90b:4f91:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-3903c542f55mr8214659a91.1.1785961876471;
        Wed, 05 Aug 2026 13:31:16 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca63ce12sm20694924c88.5.2026.08.05.13.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 13:31:15 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 05 Aug 2026 13:31:07 -0700
Subject: [PATCH v6 08/10] of/overlay: return ERR_PTR from
 dup_and_fixup_symbol_prop()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-nh-of-alias-overlay-v6-8-74f21d440819@nexthop.ai>
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
In-Reply-To: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawn.guo@linaro.org>, 
 Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785961866; l=4363;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=uf2DvX8OK9pwtfhfHWyR6w2v1HFCYdPTaTaeKyV/B2o=;
 b=mBtIs2KFqvLl/gNEMLp20JSf5Fka0sEnUisSG3iwGSqKilHA2ZZWaJRDwaGo95zb2WPasg0yh
 pXFctQfIhN+ByR2w46YExvTohykYxl11MBC1587kfd9zzowiiE79EmU
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

dup_and_fixup_symbol_prop() returns NULL for malformed values, for
values that are not paths into one of the overlay's fragments, and
for allocation failures. The caller reports all of them as -ENOMEM,
so a structural problem in /__symbols__ is diagnosed as memory
exhaustion.

A later patch reuses the helper for /aliases values and must handle
the three cases differently: copy verbatim, warn, or fail the apply.
Return ERR_PTR(-EINVAL), ERR_PTR(-ENODEV) and ERR_PTR(-ENOMEM)
respectively and propagate the errno in the /__symbols__ caller.

Also verify that the value descends through the matched fragment's
__overlay__ node before cutting the prefix. Only the first path
component was resolved, so an absolute live-tree value sharing its
first component with a fragment name was sliced at the prefix length
and rewritten to garbage. A prefix mismatch returns -ENODEV.

Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 89a9fe6d6e78..99cea094943d 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -206,6 +206,10 @@ static void overlay_fw_devlink_refresh(struct overlay_changeset *ovcs)
  * The duplicated property value will be modified by replacing the
  * "/fragment_name/__overlay/" portion of the value  with the target
  * path from the fragment node.
+ *
+ * Return: the fixed-up property, or ERR_PTR: -EINVAL if @prop's value
+ * is not a valid non-empty C string, -ENODEV if it is not a path into
+ * one of @ovcs's fragments, -ENOMEM on allocation failure.
  */
 static struct property *dup_and_fixup_symbol_prop(
 		struct overlay_changeset *ovcs, const struct property *prop)
@@ -217,6 +221,8 @@ static struct property *dup_and_fixup_symbol_prop(
 	const char *path;
 	const char *path_tail;
 	const char *target_path;
+	char *overlay_name;
+	bool mismatch;
 	int k;
 	int overlay_name_len;
 	int path_len;
@@ -224,14 +230,14 @@ static struct property *dup_and_fixup_symbol_prop(
 	int target_path_len;
 
 	if (!prop->value)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	if (strnlen(prop->value, prop->length) >= prop->length)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	path = prop->value;
 	path_len = strlen(path);
 
 	if (path_len < 1)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	fragment_node = __of_find_node_by_path(ovcs->overlay_root, path + 1);
 	overlay_node = __of_find_node_by_path(fragment_node, "__overlay__/");
 	of_node_put(fragment_node);
@@ -243,18 +249,27 @@ static struct property *dup_and_fixup_symbol_prop(
 			break;
 	}
 	if (k >= ovcs->count)
-		return NULL;
+		return ERR_PTR(-ENODEV);
+
+	overlay_name = kasprintf(GFP_KERNEL, "%pOF", fragment->overlay);
+	if (!overlay_name)
+		return ERR_PTR(-ENOMEM);
+	overlay_name_len = strlen(overlay_name);
 
-	overlay_name_len = snprintf(NULL, 0, "%pOF", fragment->overlay);
+	/* @path must descend through this fragment's __overlay__ node */
+	mismatch = overlay_name_len > path_len ||
+		   strncmp(path, overlay_name, overlay_name_len) != 0 ||
+		   (path[overlay_name_len] != '/' && path[overlay_name_len]);
+	kfree(overlay_name);
+	if (mismatch)
+		return ERR_PTR(-ENODEV);
 
-	if (overlay_name_len > path_len)
-		return NULL;
 	path_tail = path + overlay_name_len;
 	path_tail_len = strlen(path_tail);
 
 	target_path = kasprintf(GFP_KERNEL, "%pOF", fragment->target);
 	if (!target_path)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	target_path_len = strlen(target_path);
 	/* a root target renders as "/"; drop it to avoid "//" results */
 	if (target_path_len == 1 && target_path[0] == '/' && path_tail_len)
@@ -284,7 +299,7 @@ static struct property *dup_and_fixup_symbol_prop(
 err_free_target_path:
 	kfree(target_path);
 
-	return NULL;
+	return ERR_PTR(-ENOMEM);
 }
 
 /**
@@ -353,6 +368,8 @@ static int add_changeset_property(struct overlay_changeset *ovcs,
 		if (prop)
 			return -EINVAL;
 		new_prop = dup_and_fixup_symbol_prop(ovcs, overlay_prop);
+		if (IS_ERR(new_prop))
+			return PTR_ERR(new_prop);
 	} else {
 		new_prop = __of_prop_dup(overlay_prop, GFP_KERNEL);
 	}

-- 
2.54.0

