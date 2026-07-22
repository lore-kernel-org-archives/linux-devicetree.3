Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186303DA5AB
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704455; cv=none; b=hD9FGNfCtdNyKSgPPUQNsOEhhKvvYee/H7sdY2ZszrfSWljhse5G2zWL/sqffP8B3OYSbvLe6+qdtwj73pMkwzBBRya+284bfVb1rREjGA3Zm2qZgbjE0f/2jBeWE95kp8SM6nvBkdbgr+uZxxH3lJxMLf65vJ3OS9yVXpDfu3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704455; c=relaxed/simple;
	bh=AB5Ed4fodLCRymlKclDBO+9rLTYghZ/tdB5y6s3AQQg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cYKkBKpF76oVwND4gERAOlTml9HsUKuEILLYQvwprkaB5B5Qf2GXCR6dQhj0Pyqe6bI4c3klgEXKEkYl6pFbQmpfXCa9nXmGwjaDbni9lAoXESGfxHnMiidd6dVRKJjQmaoWGWI2Z7zfWMmyCiH9G6N55uBHH4jqgACLf5NbpSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=ECZlTj61; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="ECZlTj61"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso7117387a12.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 00:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784704453; x=1785309253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROWj2nRa0GLCu+9OGXMhneBFv3OXk9O/to00GwrjIbo=;
        b=ECZlTj6181bPMnAr/Pb+LmkJj93XeVL7HtQxTcOrgB1Dt+Xi2obVfKa17W/6vTiq0X
         dUI0xr5Iwez2stYYyQIzkAEaTt2VGvKeMO8xuwBqXCLREBoKFjWULj6ZKMbB/yD+Gui+
         PsT6EW6s00lujHPHFf5fIGOuTBOYdBKv8gP4zNIWWE3hf9sGGBMfnGGpKJhR4cJp/THg
         KT8akIQMZan80tSWi45p7DOc8G4Aepfvema9NxcWtRU+MpL3ACU2+IUC4kRQpuZwaspJ
         cNQIsuJFkpVmnmmH0uclmdQskLJG7LbwryXCkWtVZJ2MrzmUX+y2ItQVkiqRcBtPeZBU
         cOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784704453; x=1785309253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROWj2nRa0GLCu+9OGXMhneBFv3OXk9O/to00GwrjIbo=;
        b=Mqj1giOB15jFNXd40z168vL8sLA6iY8J0v0L82alaAu4P+ek6+9G6Ztt16/0mmvo/F
         9bM2v4XKlCg00W1JKbNpjokOIH1k/wsd0cEL0ak4VdLJyzWGC4hocxRyQ9GbM8eDtNwO
         tzziUb06bspa3tbgDgzMbgy6QAIq/X9vBu/zQHO3oLjFSrZvxIQ1+0W66o18B+K+AHxO
         qoVu1sdPBmnTuui6ouSHcbaY8GgBF3TOnGe7g1rMrVboaLqe5Ps1r2n4o0ZYjuh+K0Mz
         jgeyWs0wKiadAOb///QuYFMCO3/7oKzKq680u4SFww97u1puDDcKQjEHYCp2qn0Y+q0f
         vMJA==
X-Gm-Message-State: AOJu0YxvHUFrpBixeevQe2o4we5p71Nc6B2fb5Aee2JKzA5cAmU5QeiL
	mqAzzM99ZfdM49PsfgHza7+Y4ldy9NaFnP9+1NO+FoXX6n+tpbJKQV989pv1CzIQw4TeQ+Tnt7y
	3VOQD6ik=
X-Gm-Gg: AR+sD10hq7yETyPhXyGSbPD1oV4y0tnEEzMfcpQtG1j44w0KKTv3dL1UOCiugswm89e
	qneER7AbH0iAh2TB5bEVSmLN4f/9FmmiU78aulegkK0V5nvNgaH14SgWSEHx++mu0qYsyMPvEAi
	fC/bGr4dsOzd9W6Mnv3uSN/5gjSisbIJ8nRBIdJtMXUD7KwptckLwAzjWAMhgC7uzyJVBd86wdT
	cOczE+NB0Gog6Ws8K+qJTeuFG9p9qY0+dAsZ5IdDyW7y2r815mxDc9cGmB+Am+P4d26ZzTcXIdp
	NlPyIaYzoOPTAplcKEVIynZbtlLDkG7DANKOBu2VwO4NdnWGCvV+iqT4VjyEE5lXZaw0Hi7PNVU
	W5oxp5fEuhz5sSlh17iH1/nYkoyUG2FpW71jlKMKs4/cUluKYEd+aUSVaTKvCiwSfb5itMmDbRn
	QmAgnG
X-Received: by 2002:a05:6a00:8008:b0:848:767c:452f with SMTP id d2e1a72fcca58-84c29501a69mr22295483b3a.48.1784704453394;
        Wed, 22 Jul 2026 00:14:13 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175f3180sm843890b3a.56.2026.07.22.00.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:14:12 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 22 Jul 2026 00:14:09 -0700
Subject: [PATCH v4 4/7] of/overlay: put property on deadprops only after
 changeset add succeeds
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260722-nh-of-alias-overlay-v4-4-fc96a40d2761@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v4-0-fc96a40d2761@nexthop.ai>
In-Reply-To: <20260722-nh-of-alias-overlay-v4-0-fc96a40d2761@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784704448; l=1786;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=AB5Ed4fodLCRymlKclDBO+9rLTYghZ/tdB5y6s3AQQg=;
 b=BYa7Zu9dCUDbUP3nOajIh4PjrvleUwyzBC7YnmaDfwHJ2+zlJGnGqOR1g1xjn8Bvss7mKm4Ad
 zBf6VcVdIEyDDnuJtQMn/hmCmCyPhdk7utPWGpULsJ1UZ1H5g329TmW
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

add_changeset_property() links a new property of a not-yet-live
target node into the node's deadprops list before handing it to
of_changeset_add_property(). If that fails, the error path frees the
property with __of_prop_free() but leaves the freed pointer linked in
deadprops. When the aborted overlay's node is later released,
of_node_release() walks deadprops and frees the property a second
time — a use-after-free followed by a double-free.

Record the changeset entry first and link the property into deadprops
only on success. of_changeset_add_property() only allocates and
queues the changeset entry — it never looks at the node's property
lists — so the order of the two steps is otherwise immaterial, and
the error path is left freeing a property that nothing references.

Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 74aea704835a..284c9bc6c9cf 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -358,12 +358,13 @@ static int add_changeset_property(struct overlay_changeset *ovcs,
 		return -ENOMEM;
 
 	if (!prop) {
-		if (!target->in_livetree) {
+		ret = of_changeset_add_property(&ovcs->cset, target->np,
+						new_prop);
+		/* the detached node owns the property until the apply */
+		if (!ret && !target->in_livetree) {
 			new_prop->next = target->np->deadprops;
 			target->np->deadprops = new_prop;
 		}
-		ret = of_changeset_add_property(&ovcs->cset, target->np,
-						new_prop);
 	} else {
 		ret = of_changeset_update_property(&ovcs->cset, target->np,
 						   new_prop);

-- 
2.54.0

