Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E802942DFEA
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 21:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669802; cv=none; b=olsENM44jZGoCnGzwC9P5DyiQ6hGqke3LIkyN6vSoCaYGxJLYItaB/CHYE2fy1mgpupEw3JnCeY4XGGOeujZ1nRZxZXDw/68AzQX70zCIPnP2DcjvjoHdKezZSJGYw+dZLNfwisao0rjk6J0pUu/uPG33xUzn2F1HjdCuxFk1Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669802; c=relaxed/simple;
	bh=DiTw4KlHNXPwCjxJDfLPQbOAtNxlbFmiz5S0sKBzzWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oYOgc7ZpFLonMmhlnQVMPDc9HPOHmTfqYSNdtk7Bu6wWukRVLsLvkfZ0dzqdb0Y18wUiwqkxAyhmCLSUBFx9uvN8zn0NIT/WbiTD3odZVOjrO2ttmC0PzISfttOPfpYJcjmyvW0SvFFFyQuB1fG0nh6sDBAU/QNUxSWSE7SqvC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=GZm+0t5V; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="GZm+0t5V"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3811f512167so11448104a91.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784669800; x=1785274600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GW1Ca5rj7SkxZR/f2O8Y4WbAS6oHI0QQpqNUYxnjmuE=;
        b=GZm+0t5Vbuu7P6S6Ra0j7K8ifZ1FdQGBPbcIksl9jPb5d0vtmjyiMrkc5myzSWb+SW
         /LsNFCzcF4caCh5CDVFeOO7EltZ9dw4quph3fY94Ymv9kGjdtN7lFq5v8dFDmhCqWJ+t
         kZf/wRk8Z7KINxe/UxFhPWX5lu+MHS7rik6a15iMMAj1XyNIkwpSFuDDW69Iw7UuCnPT
         lenWeMcNQSsMPIAOMN59Zzn+dnIvjWlovh51mGS3SfGa09ScVldZx9bq7LFX9YUjyGO+
         nLXu7RGUNzRtgFmukteNAFqEFbUULEG2YNJeG42Z1pDG8vkkZFN9rCFca7tgRZXUR39w
         VguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669800; x=1785274600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GW1Ca5rj7SkxZR/f2O8Y4WbAS6oHI0QQpqNUYxnjmuE=;
        b=ebOmcnWJUol0I7owJQ7ixPUJPVUfJpKbPmdvNxZ/dW4W3Iv2FJHCxW1oM6fsbI9caD
         6KNHGg+VF0wsL1IEiuOgzicwUf/iveWS3nEdtmWhPHFJ1bML3+q40GpK1XmEo0vsxF/X
         UB7Zt+fERh/mk9/qLuSrO9NWYzBS7bejNzLkLURRpFQhEEfQCnRWFafJ5WwJJ2WICphl
         UWu3pm22Eq3jmqa+w2e3YFfrizQzFTWwTsKkZqm2cGMCf2/Wi2AL4bCfaYUKTyEdHyTD
         BOYvawuOTd+/lk9x8e3rBiXzfZcpw8Jpx/pZdvx8feMFmOv6GdBxGJu45cuPYYGZRIFQ
         qWAQ==
X-Gm-Message-State: AOJu0YxtLSLL5Xq+jEu1/E/DBqD/OspzwBlYf7KiAc7xtOTFYVULtUiM
	GeNhFmhC8awDL8O/bsQPILjhlCA22rZpTK8BiOlQOKhHJKgmQcT7SAcW27xw4dG4oNcdBlX8x3k
	KA3RK7xM=
X-Gm-Gg: AR+sD10iHFgwVIS3J4IOfbu10j79xmmqrKPaSqg3/jYNOBHPAH7Cc8SkpTi28c+1jo0
	0Ho8/iVBv8vXHKd0zn5uPeNPR1RvRyQp89CoH9vbLKCKfxzibB++5rkbFVoSaRtMGfNveg7jOSg
	vrcWrGfaP4wAW6rzRlT0u+22SY+oAEb3vmxZzrN2XDaOEvkLy4FlkpUC2FEAr6/O7J4oJtQnGRQ
	6zJfl1WXRg6/T0qaMyxE28qxtjDXeiRRrwG4c1NIbJZJVYG3Wjnd2gDXLYA+18ynfqj4eBQLS9x
	8bkgwpx6SMCwIkdhDwgnAWoUHECIxxBQ9/Z3xjCZUbHjGWeHIaFEe111R2fap/2nW0IeYQ8OcFb
	Rrh0ES9o5b3ztDD9pNHuJo9VuueB4UIEi2yfwbaR332JKkNx08ugMSduoI5A1KbO6A7+PEn7TMX
	gGBaoF
X-Received: by 2002:a17:90b:5604:b0:37f:e1af:df22 with SMTP id 98e67ed59e1d1-38e4b4312b7mr22172001a91.17.1784669800426;
        Tue, 21 Jul 2026 14:36:40 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm40706521c88.9.2026.07.21.14.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:36:39 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 21 Jul 2026 14:36:34 -0700
Subject: [PATCH v3 3/4] of/overlay: rewrite /aliases path values to
 live-tree paths
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-nh-of-alias-overlay-v3-3-7001028fe2f5@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
In-Reply-To: <20260721-nh-of-alias-overlay-v3-0-7001028fe2f5@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784669796; l=3285;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=DiTw4KlHNXPwCjxJDfLPQbOAtNxlbFmiz5S0sKBzzWc=;
 b=PoUStDLuHf5Zx89MELwfA26Q3ZKaj1x1TzPHUEpT6is+cPVhMGlxV1ZxZyMSsmyQh/t1jV6W9
 DNt5MrrluVPApfo5j+YisaTi8nzdP94Kc+Uko6e67JVdcuWVjmBuuLa
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
/aliases target node, reject values that aren't non-empty C strings
null-terminated within pp->length (of_alias_get_id() and
of_find_node_by_path() dereference alias values as C strings, so a
malformed one must not reach the live tree through either dup path),
and then route values with a "/fragment@" prefix through
dup_and_fixup_symbol_prop(). Other alias values — legacy string
aliases like "ttyS0" that some out-of-tree code writes verbatim —
pass through the plain __of_prop_dup() path unchanged.

Discriminating up-front instead of falling back to a raw dup when
dup_and_fixup_symbol_prop() returns NULL matters: a fallback would
inject the unrewritten fragment path into the live tree where nothing
can resolve it. With the string shape validated here, a NULL return
means either allocation failure or a fragment path that doesn't
resolve within the overlay; both are reported as -ENOMEM, matching
the existing /__symbols__ handling of the same helper. Distinguishing
the two would require an ERR_PTR conversion of the shared helper and
is left for a separate cleanup.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index b6545905cf67..9f85278c577a 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -350,6 +350,21 @@ static int add_changeset_property(struct overlay_changeset *ovcs,
 		if (prop)
 			return -EINVAL;
 		new_prop = dup_and_fixup_symbol_prop(ovcs, overlay_prop);
+	} else if (target->np->parent &&
+		   of_node_is_root(target->np->parent) &&
+		   of_node_name_eq(target->np, "aliases")) {
+		/* /aliases values are deref'd as C strings; reject malformed input */
+		if (!overlay_prop->value || overlay_prop->length < 2 ||
+		    strnlen(overlay_prop->value, overlay_prop->length) >=
+			overlay_prop->length)
+			return -EINVAL;
+
+		/* rewrite overlay-internal paths to live-tree paths */
+		if (!strncmp(overlay_prop->value, "/fragment@",
+			     strlen("/fragment@")))
+			new_prop = dup_and_fixup_symbol_prop(ovcs, overlay_prop);
+		else
+			new_prop = __of_prop_dup(overlay_prop, GFP_KERNEL);
 	} else {
 		new_prop = __of_prop_dup(overlay_prop, GFP_KERNEL);
 	}

-- 
2.54.0

