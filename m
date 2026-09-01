Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99423542F6
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226169; cv=none; b=jLQ/WaydhNP5bRvMAR/kRU8kgWJNbb6x5JCCXcaf3foc/Pu45cYZgvCVjJJ3hWahvwABtBxD3sLVJ469kOj6hLXZal5n1ELYEi6c10rJ4YQJgGBE0oCQROgvzwRl0rxgIbPMLhjkPLXImQGWbTPxQQB/81Mzw4CcTXFly7DVijg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226169; c=relaxed/simple;
	bh=8tup3BrXuatgt9ny9hkAUJvdMsPCnKra0uY6v5dCjDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ImznyNfzagQG+Vfak4tiMAfRskBqnw7PuyfQCkZFwo4N6jIV77HYRWGoHScN0LmWX2aSFDPekdxwav6sDpeFj9Q1/a9Tc9DljghS5cps2yZwY2LZhPPGSfa6XDpHSPglxDb1u7XqD6mQTNnaPbzNA2+nLXrK6lRyOHNeeGFs87c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=PzEQzuD4; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="PzEQzuD4"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso411332a91.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788226166; x=1788830966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umF8Nph8/KcuZfFdxXQKAx8luRRJb4eIGgsAiBw9SHk=;
        b=PzEQzuD4+CCA7DgF7hN2LchDqC1kbhK+hWqA4bkqqiGwJQxNJr8GVPNK8gb83TVduw
         g8M1bycOKult69P9eyPNTIACEJnxUW+HgwfvYvq1DI63WFA2SfZ15pNgNIlGidYYHnQm
         ffJvNijQquHinGVqGY/pjRSGS3WiWRfE5qLEmNcWi684/77DdYmOAT7J/sqyv390k7YS
         /4ssYKWs/AsRmkGrKswctVYDtbmaKij526xqq1Kb/9Sf951nvHfMmhmoSOBKK9SSvTxT
         ZVno0UIGoQJNH14IVJ0rXfz+vNnfWmljbOkgoKQhLGouiamDKB18+l+h63PXLcHCShVb
         3Ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226166; x=1788830966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=umF8Nph8/KcuZfFdxXQKAx8luRRJb4eIGgsAiBw9SHk=;
        b=HR9SZ2fpRQ9ImMYDnJbjEDep3C20AVzi7hdbo5JnLgokQXXgMOYAZA+5wVbr9BAt5/
         R5e1iMhrgKfm76VBJ0ctFU6aw2DNXZ68roVUF4708zthH1PH/gBqg19dTNT/ukzHhnjp
         ikIgz+L7Vnbwcv9OBdz7UtxYnD6fhwOB2gyjZU8s1EGagHOHnXUGmeTJQIjzhzYEDc6G
         xZ541E0ep5WH05QQEL00K9sO26p6a4IzOFyNA2hYutzY0xOXAf+kva96eAWanX9r7q7U
         fo9sRXXIDNQ59f8O3ZFHZsRixWM/ciuMomTYhr5ZnYvlqEmathG5UQ3Z42PQQu1ebehk
         jpWg==
X-Gm-Message-State: AFuF++n67hLFwt9fM04Tu0L8y1A+2+9rVfsLinbGgYDcE64lmub8rLt7
	buUkkfubC5VR/2GAn12b5wuAgNowHB2ylgvKK3zaOo9lvi0XT37iy3UaUz1IZ2R1JPs=
X-Gm-Gg: AYBFou0vXOTTpWA0hVUTLMXMCEnE1mo+lLU4doSJLjatxcKDuItEW2Uq2DyFTDy6NjD
	FQXB6EYcSETezJhg7xiWT/WYTGJUn/g7hmcdXL8hJbd7jZ99W7O3WY/qobkPFd33vvHIwEyC+pB
	adyBL5VLdw6+i5DgBi0pMHV2mElTsdlsNJRLvdA5XJX6VF1Fo1xNF7IZv7q4cQC6D7kr2fWSCUb
	C9O0hXYRyZLwTcUmxJK2/WGg1wJBr7OOEmj5A24GEW3nzk3UPyjdJ56w6EXfESeHx50OrpEsHmn
	dLO1lDJQSLh0NvY+rP3WU59oxvkCugHMSg3fYB9qO9/ZYTixEESjP8YFODSVymr5nUID1WSboi/
	v2R2CwdvC3LA+8G7OYIQQdTON5s48Wkmh8GrVTTxMneBv09pAZ5ALAXl4vxinIbqnFkJjDPf71J
	el5QgUpoo/CAsxz5UJbbsEMCR1h6FNolxyV2O4tJKWUc+zV8OsLqpwSF+sYZqXQkg=
X-Received: by 2002:a17:90b:314e:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-398c3ca354fmr20325515a91.18.1788226166384;
        Mon, 31 Aug 2026 18:29:26 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm19390817eec.12.2026.08.31.18.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:29:25 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 31 Aug 2026 18:29:19 -0700
Subject: [PATCH v7 01/10] of: hold a reference on of_aliases during alias
 path resolution
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-nh-of-alias-overlay-v7-1-02754604805a@nexthop.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788226164; l=3636;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=8tup3BrXuatgt9ny9hkAUJvdMsPCnKra0uY6v5dCjDE=;
 b=ZbRUgfacsqPh/5HiLuma3U63NxSpJqiiWmlWqJOaladB4CCnLh7l7xgcG82y2oZF/Dp7YdTUB
 P4FAhUF2SkpBVYzsiBR4VDoMsVZ1jbPGGY79D8ABflo8J+OQNzQKhiD
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

of_find_node_opts_by_path() walks the property list of of_aliases
without taking a reference on the node and passes pp->value straight
to of_find_node_by_path().

Take a reference across the walk. The walk itself stays lock-free
like every other property iteration: it can race property surgery and
see a stale view (a removed property's ->next is repointed at the
deadprops list), but nothing it can reach is freed while the node
reference is held. The pointer load itself needs no locking:
of_aliases always holds a reference on the node it points to, so a
reader that observes a non-NULL pointer observes a live node. A later
patch in this series clears of_aliases and drops that reference when
the node is detached at runtime; the detach path holds its own
references across the transition.

Validate the value before resolving it. of_alias_value_ok() requires
a non-empty, NUL-terminated, absolute path:

  - an empty property has a NULL value and crashes in strchr()
  - a value without a NUL inside the property is read past its end
  - a relative value naming another alias (loop = "loop") recurses
    through of_find_node_by_path() until the stack is exhausted

All three are reachable with a malformed boot FDT today.

The name comparison loses its redundant strlen() pass while here.

Fixes: c22e650e66b8 ("of: Make of_find_node_by_path() handle /aliases")
Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/base.c       | 17 ++++++++++++-----
 drivers/of/of_private.h |  8 ++++++++
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 378703dbc11f..f7aa14d90e50 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -995,6 +995,8 @@ struct device_node *of_find_node_opts_by_path(const char *path, const char **opt
 
 	/* The path could begin with an alias */
 	if (*path != '/') {
+		struct device_node *aliases;
+		const char *value = NULL;
 		int len;
 		const char *p = strchrnul(path, '/');
 
@@ -1002,16 +1004,21 @@ struct device_node *of_find_node_opts_by_path(const char *path, const char **opt
 			p = separator;
 		len = p - path;
 
-		/* of_aliases must not be NULL */
-		if (!of_aliases)
+		aliases = of_node_get(of_aliases);
+		if (!aliases)
 			return NULL;
 
-		for_each_property_of_node(of_aliases, pp) {
-			if (strlen(pp->name) == len && !strncmp(pp->name, path, len)) {
-				np = of_find_node_by_path(pp->value);
+		for_each_property_of_node(aliases, pp) {
+			if (!strncmp(pp->name, path, len) && !pp->name[len]) {
+				if (of_alias_value_ok(pp))
+					value = pp->value;
 				break;
 			}
 		}
+		/* the reference on @aliases keeps @value alive */
+		if (value)
+			np = of_find_node_by_path(value);
+		of_node_put(aliases);
 		if (!np)
 			return NULL;
 		path = p;
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..9bba999f0bf8 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -215,6 +215,14 @@ static inline bool is_pseudo_property(const char *prop_name)
 		!of_prop_cmp(prop_name, "linux,phandle");
 }
 
+/* alias values must be absolute paths NUL-terminated within length */
+static inline bool of_alias_value_ok(const struct property *pp)
+{
+	return pp->value && pp->length >= 2 &&
+	       *(const char *)pp->value == '/' &&
+	       strnlen(pp->value, pp->length) < pp->length;
+}
+
 #if IS_ENABLED(CONFIG_KUNIT)
 int __of_address_resource_bounds(struct resource *r, u64 start, u64 size);
 #endif

-- 
2.54.0

