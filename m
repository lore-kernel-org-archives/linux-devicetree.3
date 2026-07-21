Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C12B402453
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 02:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784602344; cv=none; b=LhcFADdBlBaZ1mTNBPbRO/5nSbGRhleIuQFZRMY4zqVcOuVwDRCFdABGaXqthqQwD3m8sFVTU7pzuUhOyO7WHj0QSlF/3APfAGIHn6ULTYIH/ZpevVgofnNC2LirpZp94h0Y0T3NS+jqii3iF7dIsZ0zntTtffqRpMogieltg5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784602344; c=relaxed/simple;
	bh=iGWdJ4L5f5PhXUJWpbe2stIHXNaMh0PyRFQdLM6T2KQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EXvUDZYs+EPhpdEU7LllC7csHudxGCba343jCMtpOEzK9YCTvpicckbvuv3eQPNBKTbHIdqMeueh91JlYGioj6px7CcdKARVU491wq/X/5+HhbULpfBHMIO6H61u0DcEKnsVuLDoS+gpvyngGHzk4sPi/rT2Y3gEXD1m2w8ASqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=fV+OO7pe; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="fV+OO7pe"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso4570209a12.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 19:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784602342; x=1785207142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGMP5Dip13MgtJqhnlj6cH7hgyPXYLqPSL+6bi+f51M=;
        b=fV+OO7peizJMNrkT7ZPq8Bw1JVqf7DbABiR0vkQ+tFgbcHmPeOsBZeQ7tG59N5ljmR
         1ZMiUfCtVHrPUo4qiXtCHDZxtQYywNNiI4cINnECmKlskia3WA+3Y2wftXlFPbiNizXq
         e33ZgqEQ6KSbH+Zo6F/0zilGfWASwxV0lcYISeG9uQabEHLRf3AJPnCYAdHfW9DykA5U
         oivfjLkbyovj+OXDiARx4N4wW7gDVDixn/omrtKEuZ12GdxkhAhfbOKGc8U0NWJ+UnTs
         rUv3fMnBJhWScpErWCGO2bUrm74kXz1UX/c/EZeXqEK4FlyzROT8LoWC4aipKvTPT1zR
         KL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784602342; x=1785207142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGMP5Dip13MgtJqhnlj6cH7hgyPXYLqPSL+6bi+f51M=;
        b=EqOpF0iXdZHEAHdzvH42nVlHtBYs3YiMI4Xq4CS/ZBbxYr9T8938qJvnHOCWdQDM78
         wGyifIjppNwA45E6SohbCl2w3CHDbuzFud+wHw+i1YCk5C/r7//qMdkzh+8xZ34DWEt9
         4+5zG+Um5F5o0RMiFguPqoLtJmpGo1G0f6Kmiv5xTrBOJnv7GPIgPZqrOp11yD0GoHpj
         lWu2NbPeRDE8xWuGhHu/ItjjRsxdURdAkUx8jT273bfEtSbdmoBd8ggRa4/OeYnVpRyE
         eE60k59d4/S8NTu+ncR275B/Et6Z8xFzsKoht+6aeafkjDxGucY/XqQV+KHV508jFH4N
         yfAQ==
X-Gm-Message-State: AOJu0YzeR4iVz/+zNQSHc8VDXslN5GsOEppAhbcVBIuFJ4vE3hS3rG9R
	5BZGcDZppQzj3M6jzubV+ti9m6bRbr4Or06PkBH4/BHovBle5/kvFsl5qLZwtIMqY3DwtUjVPmA
	FaDGg4CI=
X-Gm-Gg: AfdE7clBVVuNWcmqjCJBpsWpLSm34/esotcit8aaqYyldnjJ8QxclD0GV4nb6uNNIjK
	aUDgjbtm/6Y11VrViR2XBlyUPMG/Hl8+169U79UfjAtGbLux6ZiVPCF4PR8Uoh+fwSafGXAqLx7
	Riy9mYb6ynF63RZ5TBYNok2xk8RoDIU3nLsQhdapsEk4/OzJJIdoPH9XQl+HFGRfLK6DMIQEvBb
	nUUgnfekr8M+giZs1+GrhvlYghDL/dwHZvnyptRxGaDRwcx1KnbmZunnYLwTtuWG0OQKv5e0+kK
	GqISfeCXtrthaS1ISLpms+kaPA8CpySVFgAr97zOfWhogTN7DilIAE9RVD4WIaStSWM+A/N1rgc
	3wy0FbZd6mTUkHJz7HmxAKMBao2ZhpQvz8azJ4TiUgEdwX2mWWOgH7jZPfSFSXTWplzEU7Lm7c+
	2PQWHw
X-Received: by 2002:a05:6a20:9143:b0:3c3:83e8:c209 with SMTP id adf61e73a8af0-3c3adb15e21mr18779209637.71.1784602342521;
        Mon, 20 Jul 2026 19:52:22 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm41167294eec.24.2026.07.20.19.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:52:22 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 20 Jul 2026 19:52:17 -0700
Subject: [PATCH RFC 3/4] of/overlay: rewrite /aliases path values to
 live-tree paths
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260720-nh-of-alias-overlay-v1-3-27da6848dd84@nexthop.ai>
References: <20260720-nh-of-alias-overlay-v1-0-27da6848dd84@nexthop.ai>
In-Reply-To: <20260720-nh-of-alias-overlay-v1-0-27da6848dd84@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784602339; l=3793;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=iGWdJ4L5f5PhXUJWpbe2stIHXNaMh0PyRFQdLM6T2KQ=;
 b=s8Grg44XJ77C3cN110g+/qMJJmWoEBtOW0k15SkgFI5mceaPwLzOXcCeH7tyRejcKTe3IieUw
 pdW+6vCkfnjByjMqgJibfToBlCcRZEM9+EZCqiFCFyEO92V5pLkgHYF
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

/aliases entries added by an overlay reference labeled nodes inside
the overlay via '&label' in the .dtso. dtc renders those references
as string paths at compile time, but the paths encode the overlay's
internal fragment layout (e.g. "/fragment@1/__overlay__/fpga@0/i2c@40000")
rather than the location where the node will live after apply.

Currently only /__symbols__ has its property values rewritten from
overlay-internal paths to live-tree paths by dup_and_fixup_symbol_prop().
/aliases values fall through the plain __of_prop_dup() path and are
copied byte-for-byte, so of_find_node_by_path() on such a value returns
NULL, of_alias_get_id() reports -ENODEV — and the reconfig notifier
added earlier in this series sees uninterpretable paths and can't
populate aliases_lookup for overlay-declared aliases.

The values in /aliases follow the same textual convention as
/__symbols__, so we can reuse the existing rewriter. Detect the
/aliases target node and route its properties through
dup_and_fixup_symbol_prop() only when the value actually looks like a
fragment-internal path (non-empty, null-terminated within pp->length,
"/fragment@" prefix); other alias values — legacy string aliases like
"ttyS0" that some out-of-tree code writes verbatim — pass through the
plain __of_prop_dup() path unchanged.

Discriminating up-front rather than falling back on a NULL return
matters because dup_and_fixup_symbol_prop() also returns NULL on
allocation failure and on malformed values. A blanket fallback would
mask -ENOMEM as "not our shape" and, worse, would copy a
non-null-terminated value byte-for-byte into the live tree — where
the alias reconfig notifier's downstream of_find_node_by_path() would
treat it as a C string and read past the end. Structural validation
here means a NULL from dup_and_fixup_symbol_prop() below can only be
-ENOMEM and is propagated as such.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 654a70d5cb07..69358811a7f9 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -350,6 +350,33 @@ static int add_changeset_property(struct overlay_changeset *ovcs,
 		if (prop)
 			return -EINVAL;
 		new_prop = dup_and_fixup_symbol_prop(ovcs, overlay_prop);
+	} else if (target->np->parent &&
+		   of_node_is_root(target->np->parent) &&
+		   of_node_name_eq(target->np, "aliases") &&
+		   overlay_prop->length >= sizeof("/fragment@") &&
+		   overlay_prop->value &&
+		   strnlen(overlay_prop->value, overlay_prop->length) <
+			overlay_prop->length &&
+		   !strncmp(overlay_prop->value, "/fragment@",
+			    strlen("/fragment@"))) {
+		/*
+		 * /aliases property values that reference a labeled node
+		 * inside this overlay are rendered by dtc as string paths
+		 * "/fragment@N/__overlay__/..." — the overlay's internal
+		 * layout rather than where the node lives after apply.
+		 * Reuse dup_and_fixup_symbol_prop() (which already handles
+		 * this rewrite for /__symbols__) so of_alias_get_id() can
+		 * resolve the value in the live tree.
+		 *
+		 * The property-value shape (non-empty, null-terminated
+		 * within pp->length, prefix "/fragment@") is validated
+		 * above so a NULL return from dup_and_fixup_symbol_prop()
+		 * here means -ENOMEM, not "not our shape"; let the shared
+		 * -ENOMEM check below handle it rather than falling back
+		 * to a raw dup that would inject an unresolvable path
+		 * into the live tree.
+		 */
+		new_prop = dup_and_fixup_symbol_prop(ovcs, overlay_prop);
 	} else {
 		new_prop = __of_prop_dup(overlay_prop, GFP_KERNEL);
 	}

-- 
2.54.0

