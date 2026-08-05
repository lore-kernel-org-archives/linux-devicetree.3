Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DF43E95B2
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 20:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785961879; cv=none; b=WfbZLny/SFKurs4yml3OiQj7Yx/10ZFabrtKJXTh+gifXNPg63NdDy4ewVf6xx4X3KHiqqjBfAbRwL2ncSWzBDGfAuewQ13aOgLiE+YmoYB3uNG5X3AsOT8bcvrjMXcjmO53vMTZcCISGGRPnmUjsZ8Yf6mMrn+2ITLgG6MQS58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785961879; c=relaxed/simple;
	bh=y82td47R6V/tWGYU6bxKbZBUuC/UthUD3LtG/Zph//U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RR2FwdUuJHUd9RhoJoGaH519Hf+0/o4IIMfIXCnnI5ac4puON3s3su0nF6rPBm//ui8TzOY5PwIKVnx8qVe8s+b4ojDWQ2hGr4P4KCBlDiitFrcMw7yOY/UinRI3ILQAvLjNioEg+qrj4bPP89IZkyE/hqoGgsFk6jbs70xvjvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=MiY1sIjS; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="MiY1sIjS"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1587537a91.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1785961873; x=1786566673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GC82QffMucP6sKMAwijB741bfjScziJk9di2u49dRhg=;
        b=MiY1sIjShNiBm0AM1BjvRKkv7k52JpQpdg8kvsrF0uRoxL6d4n4B6RY6QAlrvXUmiE
         vJ46axuqaMLO1X5f0KiuFyYZvAv7ec1M4SLNgHa1+oYbOQd+aYJE8F8KOOviDoeHAzgl
         Qv1ULJEm2PlEkjeRVGiKaI+p1Hcg8EGbvbwGXRuvaWd0wJtvTS/K4agTwaKaotdJVI0H
         aXoXQorSjejiTQKGrPcnxFJ4Q7g47WxJlSR2PyXAQv535jgO5hit2QSsw3OXXrFI74ol
         VbpjoB6C6IUNy2XkSfqJr7bZLmk7B220fO9bSuH3sEx72u9MLkCobwIuUBgk+8u5jKwI
         3aTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785961873; x=1786566673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GC82QffMucP6sKMAwijB741bfjScziJk9di2u49dRhg=;
        b=K2n3xxZxhDMukspB/jD11jbju8e4FHTK9lvGIIriPoCYe4s408LCMYI2DPNeHgstvb
         dyZaSbLIMo44NvUstnjTih0S9G7BtL/HVIN1SzWphsZlBA57qjH7hBXWE43Cx4FOZDgv
         2RtgkgcjXwo6uCdhWkRD5xI2j4m1x0zfjffCqtFdjjNJb6hvu61dh9vXFUX6ud5CmfsU
         yHQYQlh/5lIkClgGEtSQZiD0Vx8L0N4fBh+2Hhc9i0K63c+YziXLl1289stTegIzJ4CT
         APaWUBNNk1osInTBFsT3pLd3se5X9ABpkk7ZGui4gRlazJEPJlpBBD/dMRVt3iAtqerO
         UaNA==
X-Gm-Message-State: AOJu0YxJKuCkUMOaj5Kpzg74ypBHXjWHzZY2fj6J0TCFSAvp7SQVYwcQ
	6td6xARnhOdoSc4ES5XF3VgW2JjvV3Ty9D8fm5B40xebRDquqIt8bxNUqECdreRGw+iYaUgkEdo
	UoiMkP2Y=
X-Gm-Gg: AR+sD113FFvGwDr9eZ3zbbvlD3Z7CNU1rtafKa0FGIh66AIhaFCSbFNizJQDi13sUzZ
	/ZSd+ReFz6G2rL8OTXfV3z0GOE62gZguK556X/N1CStWA7BFgxsMDAUsAXrcq8OVlrXaIHLzps8
	CQZ2eSgTjLQ7acXI3Jr0wtKviZwLD6ujCyMM4RsOzfeupr6WmlaZnN470h1n+8z4Mk5i9TQG3Dv
	A4b5FMtOcohR8pCCxmugsEmijSCKdWENvULzUaxWYf1F++RhbuYtsNX/v8ypWGyAeELgNP716y8
	bFbQzzj8xBvQFQdzfJtFj8hzttxy2C8lY7BX62rzeRTvkDd2QFNu5hLIShrP6tEu5ynwLKmq/2E
	TS/rOk44qXbHVfSRdt+v/8/2O3aNOuo4qYGPVpa5WyEyP2igTArhzlzF0TCDi5KySjouK0igxWS
	lV/XTtHVcnYmFof/Koe4XmbqvcCqhroQ+ZVwQMAPVRraL9TWn3qrZZM8aRSyI85ys=
X-Received: by 2002:a17:90b:4b81:b0:38e:7f1b:efa with SMTP id 98e67ed59e1d1-3903c582798mr8498748a91.11.1785961873006;
        Wed, 05 Aug 2026 13:31:13 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca63ce12sm20694924c88.5.2026.08.05.13.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 13:31:12 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 05 Aug 2026 13:31:04 -0700
Subject: [PATCH v6 05/10] of/overlay: put property on deadprops only after
 changeset add succeeds
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-nh-of-alias-overlay-v6-5-74f21d440819@nexthop.ai>
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
In-Reply-To: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawn.guo@linaro.org>, 
 Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785961866; l=1617;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=y82td47R6V/tWGYU6bxKbZBUuC/UthUD3LtG/Zph//U=;
 b=ZNFXgYfP48+jI+CiDhAPnYsZEKJ/OcRK5O2igRXNZHo/h9h1FxGIzyjjjeVrgNPp+GTo3tpLA
 9ShZJF5B/X4CW3s+BcOV1NmfzEXsUFfJHyFxz/lCMOI80I/FrvtbNnT
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

