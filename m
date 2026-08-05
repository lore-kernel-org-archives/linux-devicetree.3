Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C4B46EF89
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 20:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785961885; cv=none; b=h8bdFtU6aRljx1/msZ3bZShvZbTGbJYL2cCMByNC8bZUZFsmW6kOPbM5z95178nI/KIHewPBFCRwJcbW6izr8yIOV54/XNU+FgwSmrhZKgaKWwuzvE2CbzAcW9glPC8xqhsJhWdigt68adI2yFjTV2FPpzHxdLdWWD+CQ6r7Dn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785961885; c=relaxed/simple;
	bh=N4nU42Pb17VPUomW04w1Rzq03lsv7rB2sUgDtnVs1xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSCqVGvHtbwTV1D38f6RirLIGEYBeDwjKdKpeycXXqlEzHsOUN3aN3WZjysV3oQWA2S9M8GvKQPKnLeIRxDsoUrAeJKA3+ZFNSV6tZytme5iWHLq9FVqSOwHpl0tIo8QjVIivnGtr8HnwsmnCpx1MK82w21WDHKSzJRihiFRHkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=QeqL5673; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="QeqL5673"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ced3386430so16560285ad.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1785961877; x=1786566677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=atpMixkx02Fo6agGmHIm2m7VVWrZXhm9tAKhq+tkC10=;
        b=QeqL5673h9E8ns/YCj1b0XFmgi7n5gFVr2EA2ldv3BmN+QGxCn6P/05b15R6V9W7vt
         G8lH/KtE0GteQWfdrBuCHWwETphFp4qFe/wiB3Bw56gIJ68WKgI6Ux5tyLrmiH0TUEyN
         TNMz+zI3/NKVfUJX9l2apzHPyrEmRpCQL2I24VKtwZCgmYYBqKYvyBXBSkq5TS8J64Mi
         zktnPiQ46tkvHKM7fNrm8HVYCd+ST84ynFH30Qaxw4f/7awvxunvtNnQwLlsPZrv1PXZ
         Dn5FFE6hBEZ/4t/0T4Va3w+KF8VK6kauDzR4u5E+KwDVY0bpRnUt3GWuIrfCYmOXIxP5
         yL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785961877; x=1786566677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=atpMixkx02Fo6agGmHIm2m7VVWrZXhm9tAKhq+tkC10=;
        b=nXpAHdwsB/3oDB5hZmhX7Bf/twgeUChTVgo2FmgA1L1+mkhN4uXqFCqjDIbioQvBUU
         edxo1BMdriLSlGhyCxkK8P9cX8cIzxvCnhslWPOwii4KqdDZiP2p/64I6I/8bFeVHYnB
         Xwvn/JIBVcbVHzguUIlm8ean0szfQpAvk+z3YegAqu4Y1Wq4BuILNPuee3tNeMy0Fw5I
         H0Wj5YwEMAne5xWzwWWXzKwB27inLA9sSpu6NNLs0bEV0f/3tJ6bsf/6sB/NMrZ2WNap
         N0zvz3Jx3t5ZaCbQtKZEMrjBgJ1s6qZEc9dbbx7i6sQftBBZkbNF/seh/tqhe2xwgLYs
         ratA==
X-Gm-Message-State: AOJu0YxrAZLKYXh2h0WHuQFKAOwsufx0LCrx/p31W+OiwurorAdRGfXJ
	6ukupmv3TLIkLwfMGJZpAS/Snezkc3Io7gYnx+PVPcjuw9vnHR12DsMATTlDE+dUnfjQCHO/b8w
	GFbk6jeQ=
X-Gm-Gg: AR+sD12ntvGNgNUuw8QQsSPpinZhiY1nQmzjr/HrDMepCFSvRo9QkOkg9B1osM8VSQk
	Qpp7LnWcjiyPI36j9i0s6liRESR5iRlxLgVGfdy5KfKm5DqpgIKsRPA8dKECd6NPAi8eBwzbi0n
	NW/+yxzdx73Gfuea/0DD7c+OGjT1zG3m6ppJHKwibqGuIVVj1EUEywpMmklLXyoejEU1Pql4jEI
	te4ms+MD9Z0oLp5K4K9qw2l7ZGFbBO6NHwa4rDgip1F1vkehE35wRb9KzAH4/6retsaRRtvcVBx
	JPfzKicS9pt8wtTrR0a1bbHGjFrDIWty58dn920cd2++F8si9Q1chP46mYwqIpSBJdj7brod/lN
	B0xduWvK5NaQULiCokI2GKNe8QBv0voMzlRO+9AKk8RqZpaHTsuh7jS5Q1rTxB85rDlyLnK380S
	SDJUFmPk3GPxWHxjUgzIC9kDl9FTWLv71465EMZ8ilBCL1n+V6sU34rVqrcE/dh/U=
X-Received: by 2002:a05:6a21:6b85:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3cb85dd6595mr11360152637.2.1785961877474;
        Wed, 05 Aug 2026 13:31:17 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca63ce12sm20694924c88.5.2026.08.05.13.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 13:31:16 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 05 Aug 2026 13:31:08 -0700
Subject: [PATCH v6 09/10] of/overlay: rewrite /aliases path values to
 live-tree paths
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-nh-of-alias-overlay-v6-9-74f21d440819@nexthop.ai>
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
In-Reply-To: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawn.guo@linaro.org>, 
 Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785961866; l=2368;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=N4nU42Pb17VPUomW04w1Rzq03lsv7rB2sUgDtnVs1xc=;
 b=6m7SFizqpHx5NGNWUhN2UDSksc2Afl0X6+xiyT2aV838zny8A4YN9MXD+M+wnoOjD+RgDtBPj
 Ta++AKO7DAWDzAoWMK6dVY2rIYWWoPlQ57SpcjS8veadcCf1ifDJpMq
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
index 99cea094943d..d74e2a3d6920 100644
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

