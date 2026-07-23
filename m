Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B2F364042
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784776801; cv=none; b=tswwqXfncP5Oh2N6zM8l3pPwIfz3k9RHAdcv3ctMnqUN80FYKs+UypNgDORXxvPa3jCcX4hALnkF1fQ3IHyAN19Al8TmWRefJMmZDZhyAE1zC3twOgiqgEo8ggoBRFCvOeSXJHgz6ZnKFL8/5it5ERk+tvREMc2Pkh3nsie9SCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784776801; c=relaxed/simple;
	bh=q6Ij35o5ZF2RoKcxwQYgmY5XfSWE46siWFJxO/TKcaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e19M4OmfLYzwEXu+nI1chG3J1YHr+njbkITnT0TC1id9R1ehHEwZljwr3u2HfXw4qQFvZQJoNhtDUL3SShzgYKAwxGXroZpuHl79b1V4YZ4gN52rYlNlD+L4xu9Vqj6Ys7zVcpHFCOOdBcHSyJf2AI70y5HBm5bDMfYDpQvdja8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=NOmFCbdx; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="NOmFCbdx"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so155179b3a.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784776796; x=1785381596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzjRD582rf+tZhKKl0DwhMekWNlTzSLHfavCOSotFVo=;
        b=NOmFCbdx5HA/6B7iLDizqTmG1RdzxdL30SyJnzwW26EW5738nm1bNO+b3a2WXeK5Qq
         mo4uSPCItiqat3HUVhu4ni2sF7phfkqcTRuAOLW2j+tE+F+5TUWiQtTzDazxBkJqdjhX
         G4zxPpLd4v05KJGv1L2Ahzz4+OvGsYKHKSwcIhCTxKyFPMd6VAHGAPQrNabqzUJ5e6/w
         1VrnR5fghqhUxKUYgsQtph1KXF10DzZlJCAOPmBMQpM41eCoEZgcXJSxGsRoaOySuL00
         E1QzGaikBJMY/UvcriZLxyCWEszBedov2tQU9uU/Ti1F59PZLHiwXf934ueQld15xjUr
         umEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784776796; x=1785381596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RzjRD582rf+tZhKKl0DwhMekWNlTzSLHfavCOSotFVo=;
        b=KTv3qGE1UdkwN31O6zGbo/n2lU6PVzhO3uRFd7Kpo+iaAUYucrP8orU+5U7rFvh2h4
         8MxZmaBahLU8cCRvjyzZOz1GikfooeZoobzGTruzZ7EiY19thw5AZ1xHW4ysU7um3c/z
         Pki1YTchd4B7JMd//mW8bdbfUmWLv1wnR/6X2UNCt5giOyXH1dWriehfuuUP8cpDWtDx
         o2qTERxYaRWRSwPAqiuzuAiMcZbwbbXIl5V+0BFD7ZhXqoSGR2299TGsTqoMFRWPbv4f
         tGhNq+7mreNc87YuGzNnky/2GVxHQLP3o6Ddgg9sXVZIpskH27KNVXa8eyLie+e/SA2E
         1v0Q==
X-Gm-Message-State: AOJu0YwdbLpRRlAUaTUTuAEEt/t2Fd1zDTOC32oNGy+hVbBFQ+l8bgHV
	GyFwcxqdeJz+cXYU1WNopGxYZNZXrDl5ein6JhPKMUiUnS1WWwbDR83RdAugQa5c8cwy53qdR8y
	hWiX39zA=
X-Gm-Gg: AR+sD122IGAxnSZig364uScwhRsxMMJtS7Po227ladcE4zoCkJmwhj38xxZz1FmWcpl
	8FS2pLcXP5/lmh8BbM3EFLSse+ctXKQeCf7rdYJDBd4PIUosVXdJ9gQaDVxDvcIhbkXM08/AiBe
	uQ34XbVhTVPcU21jHjqEUofKz9a2LXoQB1Gcu9HK8TjMfNEoR5YyoDYYeWxYL0opp701YCd9i5V
	imdZYmD2K57RLAbeT+0j2fTnOU7cbXV+K88oBHKEHPHLwiSRugqn7GanIq6D8xDxKFFY+uZfKQA
	ztNQh4xKSV+6X+7sYuiadyo4CPrmJ6bDWwcAlqztDas7d26EU43LQkJ6Gmx0lm42vje0GMD4+Yf
	59lolew/novVg9zAJoulqusBnPBJ0WlPMuqwmiyLWuA1iCXDitugeaSHxpZSnytS2a+71f9FH+I
	567b13/rB1Dniww9M=
X-Received: by 2002:a05:6a20:9395:b0:3c3:a41f:ce7d with SMTP id adf61e73a8af0-3c44ac1e447mr1413048637.0.1784776795756;
        Wed, 22 Jul 2026 20:19:55 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm13826080eec.26.2026.07.22.20.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 20:19:55 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 22 Jul 2026 20:19:49 -0700
Subject: [PATCH v5 8/9] of/overlay: rewrite /aliases path values to
 live-tree paths
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-nh-of-alias-overlay-v5-8-2abe2bb9cdbc@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
In-Reply-To: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784776787; l=2368;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=q6Ij35o5ZF2RoKcxwQYgmY5XfSWE46siWFJxO/TKcaM=;
 b=zAkNSh7AWDUONPU7sflGorFo4ckNjJges57JQcGrst2yYNGaUu692PyxLI2RslsXCsum/QbK9
 7FuJ+GVWKl+AhMkjdc71+mnpcASxkaKpT4ReirNI4b2gddw9bnnEK1E
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
index 1a2df83fbd8d..27a460daeed9 100644
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

