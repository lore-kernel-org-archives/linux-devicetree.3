Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1B223BCF7
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226179; cv=none; b=SJ4E1uilv+NG251Qcnk7YKOpPesMQkUjCnjFgCM2bZj9fLRDNEr3bFTZMB/8uTCt+6amZlwNeIMW3SyXEgtFG68uz+1zfk9klvJ/yhfKiGFYrfh0HKrXMrPdEQWbmjPJIwfPnioJOVyuBdKIQLtNv44tSazwT0phQxTHNfCUz6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226179; c=relaxed/simple;
	bh=acOJS8se6Bn7H5ej5P3wKdM0zO0DOnFCnriESzJEpQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CqTtv02Yo/enbeC9TmoxFC2BE1jnosQoai6I4HuCrIAyagP1w4ua5n8S/G2Cah0IOMxGxi0I/OxF//1O3plysCFm5VRtxIMLC70qLESGnlkySFdhLMpdLAca366CvVN/vEtTo9UzUYZ4FBya9JU0iNasiTO4y1rVjQY4SwPd9sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=OPJo5cs4; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="OPJo5cs4"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1ceadbd16so4549871a12.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788226174; x=1788830974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ma3PelxrCs1dceTiy4AcSJOVkhz7U1Hwxq7XQ/KQJhE=;
        b=OPJo5cs4yuomqyProIj4iKk8jtZmrApYS57xkjMSVzbg86dvleLFR7rk5/lnBGNpB7
         ec0H0VA3+F8kWPAIGXwWfCFp7Dc7i7o5S71hpiR9zOEWx25Mwqn2H3xTgexQ8BaUJ/4i
         7lALu/MPb34kwxJl6MHcrDlcDfwLRblJ6W/+m7reZLi3nAr9ssCHWC2uHe0clgfXAI06
         VZP5ZlnXdAZ5NK0pJUc8eGg9mHOsmaIZQ9sXHwahbKWg6RrFmDxLGvz6JUTSIrdLar8u
         hpXKvXhYHAptZf0HuymL5eM+1dQJpoJ04bqW3Rky3x2jkD+N3odbs5PTh4bDb+faSLX5
         BrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226174; x=1788830974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ma3PelxrCs1dceTiy4AcSJOVkhz7U1Hwxq7XQ/KQJhE=;
        b=pkNyNb1xdeMWvu6CeunIZcLYxlEJFYde0d92VqV5gYo0imkjhThiq+Zzrm9PFDAcPo
         pdt+EZshhcx0msOeq2i2UlWNzrQDkPkCAzoINcvSNr6qGEMa4r/UgNsxXt/9pQ0TmWx5
         XJjDH/EfMK9jHw7vtlq2oRrMmez0ev16lQdeTkEhWH/k+VdDUBS3OuQNo64jYVMhT04f
         klXJ+3aK3gRRAyWLVXpeVPwSzJjy/xrZMHZgVLHcwjvNfuT/2PFJA67O9sInxDxxkAsB
         KWxc/fbXS3cY2ubFQkiZMfF+E8SL7a2sUbArPSxZUnYb/ze+B+gI9fZDt6l/RW3Swv9E
         xsvw==
X-Gm-Message-State: AFuF++mxhrG/34UyTzkeC4FEQhqDdwvGAjglv6ijOIeXSfLgFFz2ZIxP
	SY986c6M9VKkoSnNxsp6D7dTQZFuYwAWs77Zo1kXanNAAKSYFrRnLI+8OuvD0mTdFqI=
X-Gm-Gg: AR+sD12iYNtTJHkJMzEqJqwcj5/go28L94QvnfMYi0kUNNjAhupA9krUOdXSM0yJBx+
	c1HwKyfJac9i3nAIgF3klZxITlXy0xAA8P++RVNNlTqhFgXrhWwuz0/Mryt90EOKC/NNO0SDSwH
	aqcgSyH7m9dbQJLzUOq5Est7g8NnRjze1USaJcjjwlkRR7gnGYS1u4JcnQVqVNNeN0ZB0CU6u+q
	NB8rQr2GLTqioR85WkuAiSnR2yLhCUyzVckL2QnKkptoFgBv+muE8y1HlUlVo/Eky0GQghCXDkO
	sSJUSR23u4KPfrY6WY+6xJmD7uKN+Wa/HPKGNDtww5mCIzOxLAVz68fo9m/f7oUBI4e+IWuKJ1M
	8cAv7hoi8tUGUAWCRTOny6J29yrW+Tj6l2X5tB1V9tZ5v3iaaiZhBonLd5JmQAACGtFYSaTaTv9
	BqDhQCD0/IbKMCAEsMOlyH1bIhuH/HSFSi/NKtXj0OwoeoNie1+49gVow3r92vDvU=
X-Received: by 2002:a05:6a21:3947:b0:3d3:ae40:51e0 with SMTP id adf61e73a8af0-3d3ae40563cmr34941450637.20.1788226173716;
        Mon, 31 Aug 2026 18:29:33 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm19390817eec.12.2026.08.31.18.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:29:33 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 31 Aug 2026 18:29:26 -0700
Subject: [PATCH v7 08/10] of/overlay: return ERR_PTR from
 dup_and_fixup_symbol_prop()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-nh-of-alias-overlay-v7-8-02754604805a@nexthop.ai>
References: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
In-Reply-To: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Grant Likely <grant.likely@linaro.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 David Daney <david.daney@cavium.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788226164; l=4363;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=acOJS8se6Bn7H5ej5P3wKdM0zO0DOnFCnriESzJEpQE=;
 b=F4s/DIjXalAldRlKbPPw41masS2dqAOkIG255BI9qGHyGIcfKYPHYIjxmyTmx7RR1hYqm4r8W
 74ejSJE3Y3QCY0FiP1WX4W3VBpl8JWqdwHZVHBEaWzFo2prFnXh0RUz
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
index 6f2d7872028a..bc0c879dd807 100644
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

