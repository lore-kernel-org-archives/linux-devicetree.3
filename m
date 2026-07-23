Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08C93264F4
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 03:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784776794; cv=none; b=lD9GbKLetJwAdey3X2/mzpNNDs+x0jZzZRvgXBgbN3r2ygUqjav8EnHydxBBIr0Unow3zS3oY605lO0j8iDR6/C9P7e6GpjlNVR41+zFnoCMupaeFHCIfjs10HrHMKXI8YuPVVlWdT/PQecDROlA7Sy4uYzgZosi7WGmo5svT1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784776794; c=relaxed/simple;
	bh=y82td47R6V/tWGYU6bxKbZBUuC/UthUD3LtG/Zph//U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JdzfI95IL7tvpa8kTxBQ3oMl5i9UCrh4+sbN5fR1sHOKnfJzZiI3fUf5FTU2vPaN1bUJR+2ycjAlfnN17HApTBDxUyimEV5XZawNMHuOJjh5SMsna7QGKeoXzWJ2LJnvbaOWphNy/WlK1AOhFd/uIwi4NKRT3yG3p1Q5QXc2zEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=VW9EoQ/2; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="VW9EoQ/2"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso119990a12.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784776792; x=1785381592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GC82QffMucP6sKMAwijB741bfjScziJk9di2u49dRhg=;
        b=VW9EoQ/21ADgGDpoBlPg8IXpNiZt+MsfrBoPZQpPFycW7UKkd4PyczKbJ3/6bQHjzh
         W60bq3I9/UScnSAng65Znhyv4gxrUuW59+8KjSaJi/GlZX9Ex+OTDH57B5GquK3NeU23
         06BumfE/QrGSK6ZRMaCWFchWIHXuri9U0b/qItGyHkoNd9cE1NdPZMpVjIEUJLyqM7Zq
         EFiNv3tclIpFrrcXo9ScQTP9iLh24upN4x+AZWkVW6IVK4PEYkzuSlsNqERMowkVDI4i
         4SuWz0SR90LdaVETwxaxSnV8wuj5AQ8JqqZKWqFJticwwNR6ASaPenzf7R94zvgIgjj2
         gCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784776792; x=1785381592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GC82QffMucP6sKMAwijB741bfjScziJk9di2u49dRhg=;
        b=c8xK2FVKdkGN589AIsXJ9TEO99bcxVXvGL+kfj+RIZwAR2eU5grFZ/JKDOP+SPvVXC
         Bgc8oCrI8alkVX+cn0L2h0mVgE6fm2wZ9yO1QJYbGb+ZwEsLml268UFcHE0MqBIFZqZW
         pVEMUa4loFVtQvMsbFghZYTzcUd/t8QBAv52TuhW2sVZlX3faYQQMy/cgooj332qi4py
         GHLvetWgFIgtuBmlYn9DnDXhhtA5CE+iEfGvtJxFoinEQWaCit7vbEg1/SsjXJYk9XBu
         K+gitx/1+hqRhPCZrlOR8W52YmXwevMyNLkG595TZUgt9bqCqeCrwWE3DsuosntatDgE
         qSFA==
X-Gm-Message-State: AOJu0YwAHGZEPyPXopYNywZRwsYNK/IK6A9wGYdiZutgZqykKiUAg4Vl
	9xu9CNOeNvIHZb0HlcwJlI/bGBSlStDzTYD0MDaHpU7/tV3QKCNq1xAZKYpO/UsyrzvS/3PFpYt
	3SknTXJc=
X-Gm-Gg: AR+sD11yFWMR6GFlfqrA8TwzboVPjnSYWTpdmb5SImqSInsrYSt/ziB/BKJYcWFFXtA
	GeSmcv1MkjDX+zx7l4M9lVV8NNUypGdZvGG6N2zvXAnmFEe8AIpTYIsPX5RafP7c8SGGWZYnbZg
	slsGHuEyQLt8NoFffINR7QyGUKwICpdhnH732FT+hyLhQaP46A2y8Seqz1VBNpwxbx5YtTSWzLf
	kwgrHk//qqGrc7ZZ+rbEbp2mAdbZzVfaM7N9wTM1JHfVHqVhCzfsnzFeg3H4TRniFw4naOF4z2O
	+nRI4xLiNApWIrEBXRVyRDDhHcFiGfC1nvtdjLsdBV/lVW93SKY6bEms7fYpdM9PAMfKKxI20q2
	ESZdqlRYEC6RDL9pwdCCFH4Dv0em17QJMbIK77ubkpPNnEJO1azQ6ysqDaITDc7klY0H4Fuds+G
	Cf3DFf
X-Received: by 2002:a05:6a20:9398:b0:3c3:66c5:68d6 with SMTP id adf61e73a8af0-3c44afce727mr1346558637.9.1784776792037;
        Wed, 22 Jul 2026 20:19:52 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm13826080eec.26.2026.07.22.20.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 20:19:51 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 22 Jul 2026 20:19:45 -0700
Subject: [PATCH v5 4/9] of/overlay: put property on deadprops only after
 changeset add succeeds
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-nh-of-alias-overlay-v5-4-2abe2bb9cdbc@nexthop.ai>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
In-Reply-To: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784776786; l=1617;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=y82td47R6V/tWGYU6bxKbZBUuC/UthUD3LtG/Zph//U=;
 b=Orwg/c5ZlWJdMJQf0tep4akQt9jToVvlCTDcva+pScmy/pwPmQKCsHc8NzgP1UE9JcTODBLAS
 SCoe/ZTQ+G2Bqq4eZq5TZaLrr2GfjSERRy3IQVOBgoJ7FXxi8elnObB
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

add_changeset_property() links a new property of a not-yet-live
target node into the node's deadprops list before handing it to
of_changeset_add_property(). If that fails, the error path frees the
property but leaves the freed pointer linked in deadprops, and
of_node_release() frees it a second time when the aborted overlay's
node is released.

Record the changeset entry first and link the property into deadprops
only on success. of_changeset_add_property() never looks at the
node's property lists, so the order of the two steps is otherwise
immaterial, and the error path frees a property that nothing
references.

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

