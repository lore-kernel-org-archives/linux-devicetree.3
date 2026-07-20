Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FAE3B71B1
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784531003; cv=none; b=sXrvGFAlYJpxz44rC/giet+Nvj02vWp068noAStV/vXwV/aYzWIGSdcsLKiVlsc5HvVXxVPevttenGeBXZ4iS+l+q4izfmF8tau+kni0ETPpqEwe5DgzWtAEBNcWldTbv8NNEa9awg4Ae7ML1l31OwRBl39OovjPniGIFmiRA5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784531003; c=relaxed/simple;
	bh=ukiUyExq0XnTaCqoO00vJRBVYD+CBNPsreTEPosjgA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yn6aG7Vw2JAuA4miAGqblkW5mspp2PP51wuA5cyrC5bdNPqdVFHdeajHuzbmkxZT7UmOwZ6QXslU2ODMBfIFmH1yWvL+C7FxZIYqhCN7wyS7KNMJFCh1Wx0g0Sv1ksTuYiXpwcy81gf9BTFz2ekYDl3Td4fxpBgVyQDxA9Yj2uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=FrzAGAu9; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="FrzAGAu9"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cace91f112so98743125ad.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 00:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784531001; x=1785135801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3pCI8QzdNtZEY1wJy1ziEltENbQOXThfdEHc5FunM0=;
        b=FrzAGAu9NqVdnNmW6KufJQcoeElVkzTz0lxV4TySd7Chccu7zufDtq+bmIUwYTD17y
         s7okRgJspqtJDMMlsWrx1lOreGLYU6uiI3aDstcqCLqDiJxNCAe5Z12rhnYdPbHCrQEf
         l9R2NHg6VHDuVc5qfTFFqZg1WsVF4oPrWWGHJo5UlA3Wbd2dvNOBtaAj5OBAsf+OrXKn
         1MyHAti6k8bX5z5VeU8eUb5rXbUK4C2aU6cOM+IAmUxV+UTpCVvpGhykOS5KQH9qxBnt
         zMtbUqltwBWQ6xeFzevsijUgVtKmVUyQb9inE+VqoOXw43FuG8GKy/5AJf80gjiBZlza
         qHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784531001; x=1785135801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l3pCI8QzdNtZEY1wJy1ziEltENbQOXThfdEHc5FunM0=;
        b=Ko3+2gHoIDBQ/2WL8eiN7Tz8DnChszZ1j57NdZ3IiWKXzpdbnAal2mfkL2dTf8p35l
         W7n5mhyMyPOa8BXnOt0Bt6hd5mXf61fJ9ed7z3fqOL/shkiv5WVFvVWOuQbCBBHaPSpd
         /U6THVHaToNPKuvvVczWqrEG8vLDvSAnwTN4gwC7076RPHqY3/KSV71o2BKnZoABKVEP
         bwFakKI86yVbH5JAZ0g29a6J+MSsvh7348NnIHf1Cc7NB9DeK60knuzV27qz5FIN8EZm
         G4K2bJhLi/DOnvS++RZeEi93dnbByi+Ar9GWZILRhUI53u/Rp1jBFCQN/vyIYpMMDff8
         flHg==
X-Gm-Message-State: AOJu0YyEKQxDW0auYB8aB0hNWF97XhkyvxKZkcOuJd0NWN8a8mthJ1JQ
	D9sCZ9xTpabzLnT4T0csP5ZB76GeIIbUd+KFEb52VT8ebfs37slCkyRLpilFlIe6vJJzdNA/AAJ
	aMxu3ckY=
X-Gm-Gg: AR+sD13kmi7CCJS3/s4tUsCqw9zdE8RXiylRVIqa9RrneyqkAKPTDBKwGwUfFy5oK/i
	z2ykQ0tXyYmFXFN7EPC4yfb2gsj6g6perO3UeTIpJYY+AVWX9VpwQUjynvy1T8Hz5b8n014NFHh
	lFEWEctczwIvQDMM/ppoG27rxvgcJdmDKi4+InNEIMAB4VgSiPCdiPiksM82BLK2xpQq46BeQSv
	I6Tlz8eHDha4Cy2ClJgP0okRnsomYNPDnc0N1cXp0pSVGzx//8X+o+TlU8uj2SYagV7tfjaA5TX
	r6n7N4iVIkWQVKLLNphMoiF5vcmGeFZ2kM4gb3dfVFiylwX18Bvzo0/0iA8vi3IH9GkeCfvQL4N
	Ki/wTdoO2kQB5eo4mH9a78+xgq5neW2Z2OeAqG5n09HvVdwFNBlWG20OxXokBQ5PBVJ0zmnpI05
	KcTSIaAFTYG4OL/CU=
X-Received: by 2002:a17:90b:3942:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-38e4b5d99a6mr13188088a91.38.1784531001215;
        Mon, 20 Jul 2026 00:03:21 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e60cc2ad5sm463052a91.4.2026.07.20.00.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:03:20 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 20 Jul 2026 00:02:52 -0700
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
Message-Id: <20260720-nh-of-alias-overlay-v1-3-f1e5d9889b30@nexthop.ai>
References: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
In-Reply-To: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784530997; l=2365;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=ukiUyExq0XnTaCqoO00vJRBVYD+CBNPsreTEPosjgA8=;
 b=Lx6z57+d2jdA1VGsy6etjNt16LDdRIrsalsiQOtAlkxNeFaVYZaPIxW2DlipW0MzzQCf8kQ37
 zUQKvREMdxtBD7Qs5Xw5MnulyxyWljFwOplN9J+oc9cWto6Gj+T2EIq
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
dup_and_fixup_symbol_prop() as well. Fall back to a raw dup when the
value is not a rewritable fragment path (legacy string aliases like
"ttyS0" that some out-of-tree code writes verbatim).

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 654a70d5cb07..338786cef17a 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -350,6 +350,19 @@ static int add_changeset_property(struct overlay_changeset *ovcs,
 		if (prop)
 			return -EINVAL;
 		new_prop = dup_and_fixup_symbol_prop(ovcs, overlay_prop);
+	} else if (target->np->parent &&
+		   of_node_is_root(target->np->parent) &&
+		   of_node_name_eq(target->np, "aliases")) {
+		/*
+		 * /aliases property values are string paths in the same
+		 * "/fragment@N/__overlay__/..." form as /__symbols__.
+		 * Rewrite them to live-tree paths so of_alias_get_id() can
+		 * resolve them; fall back to a raw dup for non-fragment
+		 * values (e.g. legacy string aliases like "ttyS0").
+		 */
+		new_prop = dup_and_fixup_symbol_prop(ovcs, overlay_prop);
+		if (!new_prop)
+			new_prop = __of_prop_dup(overlay_prop, GFP_KERNEL);
 	} else {
 		new_prop = __of_prop_dup(overlay_prop, GFP_KERNEL);
 	}

-- 
2.54.0

