Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CE93630AC
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784682119; cv=none; b=OTLPevCWorw+A2eyLZ0Rr4634uInkFx5Lvn/yDmB0mymeLGe7nlNZktKXUFMH1bswL/MKgNI5gZwvuMP/Y2CqhjEnTebn/jufxh5QS/xguSsMULmBzzOGLyYpXhP8n9waqhKLXZQKg+Dr8iS8OB20wzZ3VVrQO6IWlqxP2/ztD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784682119; c=relaxed/simple;
	bh=0ohr3ai49eqwG8m8my5lvmnqSRw5RzvE46mSA+j7yUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PWPpWzdR9fKA+/bhxTijUQ9U6m5gFPaTpwWlddAv2cKb9FJ8pRcZG9AmfljhKSlrXcKuJxY3uXROAfWMCuX25cMrhMQ6GKy3hJ62xcplZA6lpuMptv89RFUAh1XA3+Ad52EkvkXqRubXMZmSIiMnx4ofFqPYSDvuhrEjx3uBntA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=EAnpasY/; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="EAnpasY/"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so8615262a12.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784682115; x=1785286915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hvLIlMFPJGt7jq/BkMyrua/J1s+njTaPVLS8zaead4=;
        b=EAnpasY/HXLB/XjGgBQ1HOPEqA5BqBSCeEEbrSTrsv9bFYjabJ1OIxvb+NszoJExTV
         8CIdp3NlD7RdZxNd4/FzjPyz69KUNtuOGckrZ/f9JMgPnBdX30xhAy2nFUdkysf4917S
         NHPEZ4Bj9AVsu2lCpwrb+G3VCqYelUYpIo1D+ySxfSk7cGDnWWemRcW5vTkxQ7gdIOUe
         VPnpyHjHlmsBTuD/7NTkIA17HmnU52n0EIVrAbrkr8Sw3zf2r+eJqEe3oCvdlkMsSnGF
         syQssDEWlglAqJps4HiaFE50ioHo4RG86whHryVQYViQLcNpCon1aA2nS/GQpmvkOpcG
         sU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784682115; x=1785286915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hvLIlMFPJGt7jq/BkMyrua/J1s+njTaPVLS8zaead4=;
        b=qMPEf293gXagGegniaVFl7paxiuF6fqs4j1YCJP9KhyLRjhXsun20KTHDRC2P5fPlW
         bDTzfa/lxEUf0s+q7qrSJ/0VUMO8ZtxA8W12uR8tHvx/bn77kZqZZ8FxA0N6w1kzL2Vw
         M0olV82BmnlAlQaplzwVTkYH/2QckV9OTEVQR07i+EcS3BwbLpL5aZME2glz00hVgR3S
         MtQ6fPwMSodatHzbR1eGzf22yS05mVPe39YTSAwhPehfo7H+o+ortwIeeGoujDy8a1nX
         JGbqUzBgyhGb7Z9YTVImF+kTBn5FbgQcZCm3DeMxcqqmvKH4LqG4J1W+5l9F82f5Fcqq
         xSAg==
X-Gm-Message-State: AOJu0Yx5WT45oOweT7/LbeAYwnWDrLN2blaaRozbKjFe4CKVwRC+FSRl
	R/lxo8rz/fEguC1LeHuRePjCHoNj21q/T4WG4ke9W01HVBMkv490wXBAWemhkBAyRL/Pxgh+XwB
	ZXEMlZj0=
X-Gm-Gg: AR+sD12cC5O8ZICkqOuaRqyYZo92FAJ3BQV3q2g5tnL4tqlZjgwCVxtFOS22Ys2M0sN
	A+oIgkh42LYTYl87nzwG3XMtwr1KxX5IwOdum/rlDydWxubs6JS35jXCWlhgdrHGtPtbTMp0yJN
	RGY5hMYE/OTkX9Nm3jyPkfEbee6LjC59Ll1rHsNHvbLIa0Dogk3lmv7yY1Fv9FIEir25WLJtSJQ
	9c0GPYl9Lf4R2y4qOyk6JAnmHFkugYGAMjs6ucSOAvOnDyP1hNWON56ayI39mSaPg9e+OZ+KbNq
	kMUOgO0DZzJvKUKcDOEq6rHNDtJ5Py5mx0eMBdbWMF/y5nLYx7DZX7fqDEDv6Ut40MGcZgLlk/W
	Mj1kDhsjODuWvF+aWBJg7q+lh8RLrO1izFi4zS/0AKB7LnLKyfBffwhGzWlzyHbNUUV5oVVAafg
	gRZ+LN
X-Received: by 2002:a05:6a21:6110:b0:3b4:71a9:cd8f with SMTP id adf61e73a8af0-3c3ad947df1mr24250388637.41.1784682114646;
        Tue, 21 Jul 2026 18:01:54 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a689sm3141207eec.4.2026.07.21.18.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 18:01:54 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 21 Jul 2026 18:01:50 -0700
Subject: [PATCH v4 5/6] of/overlay: rewrite /aliases path values to
 live-tree paths
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-nh-of-alias-overlay-v4-5-8ad097e31e36@nexthop.ai>
References: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
In-Reply-To: <20260721-nh-of-alias-overlay-v4-0-8ad097e31e36@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784682109; l=3894;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=0ohr3ai49eqwG8m8my5lvmnqSRw5RzvE46mSA+j7yUo=;
 b=V0VzmeZWCl+Yn44Np+rub0/SOwtCbBsPHtb9r9b0aCzutB8DxqqCxMsQqqDCTyRMsr/RLczbF
 t0YLnxf7d/jCeWl6r/o845jewHyZDesPrMGe4q/DXZp7VQS6RWyKC2K
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
index ad4e50482515..2a37b5260ba7 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -356,6 +356,19 @@ static int add_changeset_property(struct overlay_changeset *ovcs,
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

