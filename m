Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D323DA5B8
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704459; cv=none; b=OyK+LT9HEPrDg9cYghYT3GDrfr888v0/IiuzM3QhPYVijJG12PK8/lmWSlB7MYgB3dgZZt48Br896E/LuxITtKgNQ/5/R6v6DZ6Q9yNf5bIHqZ3DRudChgTYiY/apbg4N8W4GjxDoWiCs+kE+gVZGqgRbJm/i6psfOHUBmyeDh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704459; c=relaxed/simple;
	bh=zybjIXFHNavrw8uY4Okis92bt3g9zNjWZIZ9RQh5a8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g4ur8rMWMJD8RwREDgIiT+bNIn7a0qagDjKBPwwgS4awJRj5326Ee79T21K1O7cfMiA8s/fg3VNk0MHajtFgIgKCwUNcRsvyMNNBsYdSWXNTMcnsMrarcVVsj5K9bGtmb6/z4qhWnrenl17O1BDYE8byEifsVzb9noy0xznpWzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=k2PqF/MD; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="k2PqF/MD"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8487088510aso12295574b3a.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 00:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784704455; x=1785309255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fbAB56al18SncLTES8Sq3tgbthMQkR3WWR1QBsCKMJw=;
        b=k2PqF/MDDkLXJu+oGaeNO+BFeNVVh/sD+kxjCInZ2H1ztWSX9FWQ5BzmeCZuZAmyys
         Vg1wgaL1hQm8i3i3cODqJDNyot+ksvxKVpW3Mfoaz2bAqtWZ8y/f1hyAu5VDw8GIbO38
         AXNNeKnzBNRP8EzEaRbckg3V+2VdqT4WvJsEsr0SSVlV+m6zKQpt2rXt49MhsewxQ6Pk
         R93PTZyxtjEej7jkZ6tZPD3uymSvpWJwhrvNkIMiJG6lAIus91LiphnCVfIswI9ydX8F
         QLkSdadyb+6HYX+Ye7wDJUa3897xrbCmqzXui6wnsQABIxBiFRnGwu+J6I6aSMsMy7DN
         W8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784704455; x=1785309255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fbAB56al18SncLTES8Sq3tgbthMQkR3WWR1QBsCKMJw=;
        b=JbsPrhH3ptYX/PKPPzq74KR1OS0u2odtcGwD0JahZquZ5KR1N1u66aLuJ//ImzugOi
         anBLojTwHuxHDHD6yL8Wdib8R2cR0m1DkGHQkAvpaeRz4ksA6TbSKR2XEh/2oTAULnHI
         tD8h072ub/AW0RqOleA5yO2OUSW38knJZcaiCtSt8rOFFLX7HCGh3VkkZxm9riF6TQ/1
         7iLeUuEqHkidNTJM9d0QT6GsMpobjWWMxMV56stwwDp5y2tBp4+NDdXQppm+EsmH+QD+
         QqsHpfLuaqGi++lmkNHP6egvFL+ftiHs4MONwA5wxOZUIpxWHZmtyXQF+bG/WlqfSqUj
         7Tog==
X-Gm-Message-State: AOJu0YzspCk5ukNNnesbejFe5sJUi16kpUiZynon9McU12O26t4eXL3l
	R84eFReHytf6KAF7v4oMSvUvWb5HieKdYaW9+IxmGGSQ/yys6HwnCK/eus3vLaKM0aELePgrHVV
	jcPehcoQ=
X-Gm-Gg: AR+sD13ASaC7Wk1WoFlPTB+RL0uybggE5/GffXFstMU6TUV2N0dFT+RwQriIuI75sCm
	StorwfACZNJ5aYHXdoPFAqBZwHlqTwp9ZpVvqfimr4l2dwXIZqot4glY8obFnEBKzem4xemqs1D
	BUCcNxrbUE7LF5PWH3pbPjDbg2jC4/KbYYtdi8DBpTvjnCKt+P2WyJeS/BctJQYAZZBgN6PlVHB
	LcVpW4T1Vu4hJAesuT4MM0WVAjD0Oi+oYuFazQ9YQclhwmMS4IJqZCZ6wUTXNtvIOoMAg0GOrIl
	9CvUlKQ1Glqpz0+CI3KjZl7kS5qEN9lSUbidR1WXwTf7fts8ES+K1fZjAz+8iSRv7PUfENu13Sl
	Usd4n30K1/6M1H3568XR/E4hNrelcKMf9cnhnJ60fcaVwoI9CvQMJJT+7A7nP98c15PPfMHckEd
	aC0eK0
X-Received: by 2002:a05:6a00:4215:b0:848:5ed6:9d27 with SMTP id d2e1a72fcca58-84c294d4401mr22091120b3a.36.1784704455221;
        Wed, 22 Jul 2026 00:14:15 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175f3180sm843890b3a.56.2026.07.22.00.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:14:14 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 22 Jul 2026 00:14:11 -0700
Subject: [PATCH v4 6/7] of/overlay: rewrite /aliases path values to
 live-tree paths
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260722-nh-of-alias-overlay-v4-6-fc96a40d2761@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v4-0-fc96a40d2761@nexthop.ai>
In-Reply-To: <20260722-nh-of-alias-overlay-v4-0-fc96a40d2761@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784704448; l=3894;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=zybjIXFHNavrw8uY4Okis92bt3g9zNjWZIZ9RQh5a8c=;
 b=WIAtCu8rho7K3VrHV14+snVW/Rk0fqMEHbPqG5ikYK3bjGoby/692T6YIslCHOWHn908VGKH6
 cTpr+1KTH68DB/oDjSOY24ZDM6Q+Pn8F4o3p8JR2756dkQOIiTU7EeN
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
/aliases target node (of_node_is_aliases(), the same predicate the
reconfig notifier uses) and offer every non-pseudo property to
dup_and_fixup_symbol_prop(); the previous patch made its return value
carry the distinction this needs. A value that resolves inside one of
the overlay's fragments is stored rewritten. -ENODEV means the value
is not a path into this overlay — legacy string aliases like "ttyS0",
or absolute live-tree paths — and is copied verbatim, as before this
series. -EINVAL means the value is not a valid non-empty C string; it
is also copied verbatim, but with a warning: consumers
(of_alias_create() and the alias path lookup) validate before
dereferencing, so a malformed alias is inert rather than a reason to
reject an otherwise-valid overlay that applied cleanly before this
series. Only -ENOMEM fails the apply.

Matching on where the value resolves rather than on a "/fragment@"
name prefix matters: init_overlay_changeset() accepts fragments with
any node name, and dtc emits the actual fragment name into the alias
value, so a prefix test would silently leave a hand-named fragment's
alias unrewritten (and misroute a live-tree path that happens to
start with "/fragment@").

Pseudo-properties (name, phandle, linux,phandle) are exempt from the
/aliases handling: the is_pseudo_property() skip at the top of
add_changeset_property() only covers targets already in the live
tree, so a phandle of a newly created /aliases node would otherwise
reach the rewriter — and a phandle value is a raw cell, not a C
string. Such properties take the plain __of_prop_dup() path as
before this patch; of_alias_create() skips them at notifier time.

Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index d4d2591e735a..aabe8c8bea4b 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -367,6 +367,19 @@ static int add_changeset_property(struct overlay_changeset *ovcs,
 		new_prop = dup_and_fixup_symbol_prop(ovcs, overlay_prop);
 		if (IS_ERR(new_prop))
 			return PTR_ERR(new_prop);
+	} else if (!is_pseudo_property(overlay_prop->name) &&
+		   of_node_is_aliases(target->np)) {
+		/* rewrite overlay-internal alias values to live-tree paths */
+		new_prop = dup_and_fixup_symbol_prop(ovcs, overlay_prop);
+		if (new_prop == ERR_PTR(-ENOMEM))
+			return -ENOMEM;
+		if (IS_ERR(new_prop)) {
+			if (new_prop == ERR_PTR(-EINVAL))
+				pr_warn("%pOF/%s is not a valid string; alias will be inert\n",
+					target->np, overlay_prop->name);
+			/* not overlay-internal: copy verbatim, consumers validate */
+			new_prop = __of_prop_dup(overlay_prop, GFP_KERNEL);
+		}
 	} else {
 		new_prop = __of_prop_dup(overlay_prop, GFP_KERNEL);
 	}

-- 
2.54.0

