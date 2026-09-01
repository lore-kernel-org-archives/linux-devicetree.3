Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200983B14B5
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226180; cv=none; b=Xm8nS+j8u1TB57y9PBX+lsGVV0bDqK1AuvUbL0OUWQma4Ddj2LfZEgDCCNXcD/E+3qjTof/4VRn5yT2EtUF3kYHbs1H8e9lHpvsnx9f4sNcTI6kboIj06bnKnobACdM4zp4PQj/CenByQFKr7cy8H1Dh+07mP4umT9ZRFWwxoOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226180; c=relaxed/simple;
	bh=gghIcfA0E5etGc3q/zBB+/m+pufUJ9ndp76omnr8Zck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R10ShAOoUeubXLBLx9yOGtrs8rQq+wyMKFBSoBK7Z6jOLePrCYRn9k/mIV2XAzmGGdzrLCL4GSSRMYPDeYvP0MJRNa3LgJhWOJfNG7b89sDwQpHXYnnnRdraCUGLgWi35KlaWf70FyJ5eP6B4c42uW84lNj9x/UFQgFcQLBK+FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=RsN+lLaL; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="RsN+lLaL"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso3679781a12.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788226176; x=1788830976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/l8H8s7+Ljb2oSYjq14mfIjexLlHVwt32RckwPqIL50=;
        b=RsN+lLaLeBqapFumfi3FxEEU3RQVVsETFnHJAYLFJ0vZn0yGQWxmynMxPMQ2mtPawD
         grEv8hXh5XR9P//P8EkxgTanMMoey3Tgaa2Nn6PYy9TcmUHUGmZNqCBJiv8dThVt2Yr3
         iingkF5T5s8vFxtAPPgjz8pzT3Ehhu0/rcPb1LbLBi7wHTO8NrL/j14izj/cT+X8LTZR
         vhh5FR0AKERZykP1Iqjk3oHKKk4gq2zj8rOqM20MF1Hd3mMws9O9y/I5H1efDL5JaHnN
         ZDiCZAqzrIVkePF07AcYbCGfVADomfc5UTUPe8yCVOdQ7TUst4E5ME1ozx6GmDumKAA8
         AOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226176; x=1788830976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/l8H8s7+Ljb2oSYjq14mfIjexLlHVwt32RckwPqIL50=;
        b=qRpX/5XtJrf0eYKnGGOmfIL5g5nn8tShDYZTYmaCXaFoE4EORbQTEyyVuYWGC901zG
         4s83+i0ueriosceWwfvm0yG92/uTnXjOJ2LAwvJhs1j0oghtWQvypj9f5mym8UO8FrEy
         7gqLvti/m6+gx1RXHa0hQL7/4vAeHcoXPR0lsPwtNlBHIluG2mMJftmt2VT8vgv6H6j8
         7k5csflMudNX/A++exyZBsCTuG3582wX/EIX4iJwpK+4l/n87mwmnxMFq18Q9qVmU7lb
         +MW+uJbYFOmuKD7wDiDBan/BzytQZxDfogfd24yFbsEB7x7/uSTjsEK78SnvWlRMHWTF
         bvTw==
X-Gm-Message-State: AFuF++meyQU7MipAkhhiKZ14GpHzWYBVRRykIkrEC0oiKVLMlcFczbhJ
	7pr7lGf8jomi4qticdFzARaqn0VxU/9paMtUsvJ7Bj0+foZdoVRoGlRI5dyczFknEBQ=
X-Gm-Gg: AYBFou1xbNKRfFjVUgFcxDfT6C+qQk0ncp5MUINESz3HDJzuB1EKz4xdi/YH7jIWCoy
	7sxv2K0P6Y1QDQujDH9a/yRJXG1Rb7WumGqUIJkJ9KY1tmP9umkk6rnlYs+Ff5TkEnV+Ts1jd9F
	7FS+SQ/HShN6YbUyiYcJBLVO6YPIiM6N0Wqkk9GavfGKsNxb5EAYDx/3Vz4iOI184pdSoc9ZOTM
	3Qq6W/tCKV9EpTdBErEq2fZafXnQJFj677eSlXE3YBulCj5zNVBqhRPesxmaEY6Ul7DdbuTV1+Q
	MNs0735cPN7p8ZLsMFUVXPfD/J2722b8zfKa8w7UY4KwJvPMfsvaZnby0CxVcud63m/NuV/gctW
	2B5XFN7Imj7JeN4cv0Q/i1rQMmHgswoAb1QbJ52xpJ8K5k+hkX7gX7ewFEbZfL3wI8uCbo7T55+
	JcI7ISgC0YDaNYbzICl3VPuglycS0PKybOxvCAOeVL0Nn6LLR+Up/3divYvjt9Yyg=
X-Received: by 2002:a17:90b:17ca:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39907d65648mr5286523a91.16.1788226175501;
        Mon, 31 Aug 2026 18:29:35 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm19390817eec.12.2026.08.31.18.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:29:34 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 31 Aug 2026 18:29:27 -0700
Subject: [PATCH v7 09/10] of/overlay: rewrite /aliases path values to
 live-tree paths
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-nh-of-alias-overlay-v7-9-02754604805a@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788226164; l=2368;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=gghIcfA0E5etGc3q/zBB+/m+pufUJ9ndp76omnr8Zck=;
 b=aCAARdMYQw95Hss3hPDMbX1z0tIcx67W6xf675nR/F0vPSDepbn9Y5hJ0ZsoKHtw/hg7vNjic
 DG27SRu1ydsDGyTZpUoEmJD8BvsUvjJt/Fw/gbSRN0XqNo7qhoyyujv
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

An /aliases property added by an overlay references labeled nodes as
"&label", which dtc renders as an overlay-internal path such as
"/fragment@1/__overlay__/i2c@40000". The value is copied verbatim
into the live tree, of_find_node_by_path() cannot resolve it, and
of_alias_get_id() keeps returning -ENODEV.

/__symbols__ values follow the same convention and are already
rewritten by dup_and_fixup_symbol_prop(). Use it for properties of
the /aliases node too:

  - a value that resolves inside one of the overlay's fragments is
    stored rewritten to the live-tree path
  - -ENODEV (legacy string aliases, absolute live-tree paths) is
    copied verbatim, as before this series
  - -EINVAL (not a NUL-terminated string) is copied verbatim with a
    warning; consumers validate before dereferencing, and an overlay
    that applied before this series keeps applying
  - only -ENOMEM fails the apply

Pseudo-properties are exempt: the is_pseudo_property() check at the
top of add_changeset_property() only covers live-tree targets, and a
phandle of a newly created /aliases node is a cell, not a string.

Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index bc0c879dd807..2af9ffb08691 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -370,6 +370,19 @@ static int add_changeset_property(struct overlay_changeset *ovcs,
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

