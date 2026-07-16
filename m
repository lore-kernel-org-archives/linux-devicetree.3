Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4629F342CB2
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199085; cv=none; b=f0AbeRqn3D+iDGqBq8jZAAKIbVRvXfNERBjJABKZhGALyw0UJhhPqyKZjCKHxd/zrmLEHKQShjkzHj58kY1HmRwyS+IOsLcYlc6YAzv/+52yfRWA1XF+GwTPRwGqA4PsZpkMUVybb7HIjxW2v/ocgmj4MuF8PmLCoNaiqvjMVX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199085; c=relaxed/simple;
	bh=bUWlqlMCZXT45IAU/mYu7VFFMr5BGg3RfRinD8H70/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sgfcGhBn0/xv5xKzzs9ombOj7moj81/l5xg9deXNPB/npjfpuzIgeRoqg2NgBWxeyvCJ1DpCkFYiR9NQMmwsNJn1LdMY3sYtI5V20jXGlv7LQyQSYjfqkgrA9DBUTXNcSO0OGLPB+HKILGpCD4GH2Zk8DtfeKLOr7RmntK70m8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gprXMWsY; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gprXMWsY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E75FCC2B9DF;
	Thu, 16 Jul 2026 10:51:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73B44602B8;
	Thu, 16 Jul 2026 10:51:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5909411BD3CF2;
	Thu, 16 Jul 2026 12:51:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784199080; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Kmc0Wn0PZdNJ5mqOjQq4LelZGqsHkBXQBx4bQapvhq0=;
	b=gprXMWsYq+l+Vb2pzSW8TFVp7F7BS+dAly7Ywj3+q1r3Gm63YHNhlZVFRjVNHGLPHDfvsz
	y3wug352zrc2aEjKsKo3MIJ3iBgZiMtDDV0BsNYtRLE0INL8CytGpzhb7w1gJsZh3hvtrL
	lUyEDUX0igPhj7JV90mn6AflteEoi853jRgKFQOXq54lb/zkEZikCc6LFFhBrVdndoA9BQ
	qdWWGcg1sl+N7SJNGV0udJOHrOwX8AZ7oMdY8agP0dQ34znn0ETFX5Z+aFzC9Y9rHdUJYw
	mj7OWfy8/AYTgwbnftYAM0wU7NqO35SGI2qx/fX65FNo1CBHLEXG2Or6/twkhA==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Thu, 16 Jul 2026 12:51:12 +0200
Subject: [PATCH] of: base: Handle optional argument in
 of_parse_phandle_with_args_map()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-schneider-v7-2-rc1-eip-of-fix-v1-1-9b9383f936c6@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MOwqAMBBF0a3I1D5IAn63IhaajDpNlAmIINm7w
 fLc4r6UWIUTjdVLyrckOWOBrSvyxxJ3hoRicsa1prMtkj8iS2DF3cFBvQXLhXPDJg98b10zDGE
 1TU/lcSmX/P+nOecPiEwfM28AAAA=
X-Change-ID: 20260716-schneider-v7-2-rc1-eip-of-fix-c812599db058
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Pascal EBERHARD <pascal.eberhard@se.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The kernel doc claims out_args is optional. In practice, the function
unconditionally dereferences it. It feels like calling this function
with a NULL out_args argument may be a valid use case (in order to know
if the lookup would work, even though we might not care about the
result), even though in practice there seem to be no actual user of that
possibility. All callers give an on-stack object to fill.

There are two ways out: either we drop the "optional" wording from the
kernel doc, or we handle the NULL case properly. Since handling this
case goes in favor of more harmonization of the semantics and since
of_parse_phandle_with_args() actually do handle that situation
correctly, let's handle it in the _map() case as well.

Use a local on-stack object in case no argument is passed. This way, we
actually go through the same logic as if there was an argument. We may
however return rather early, since the second part of the function is
dedicated at filling that argument.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260710183359.61D3A1F000E9@smtp.kernel.org/
Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
---
The number of passing unit tests is identical before/after the commit:
[   10.774120] ### dt-test ### end of unittest - 426 passed, 1 failed
---
 drivers/of/base.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 6e7a42dedad3..dd7dda0e0a57 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1505,15 +1505,15 @@ EXPORT_SYMBOL(__of_parse_phandle_with_args);
  * @list_name:	property name that contains a list
  * @stem_name:	stem of property names that specify phandles' arguments count
  * @index:	index of a phandle to parse out
- * @out_args:	optional pointer to output arguments structure (will be filled)
+ * @_out_args:	optional pointer to output arguments structure (will be filled)
  *
  * This function is useful to parse lists of phandles and their arguments.
- * Returns 0 on success and fills out_args, on error returns appropriate errno
+ * Returns 0 on success and fills @_out_args, on error returns appropriate errno
  * value. The difference between this function and of_parse_phandle_with_args()
  * is that this API remaps a phandle if the node the phandle points to has
  * a <@stem_name>-map property.
  *
- * Caller is responsible to call of_node_put() on the returned out_args->np
+ * Caller is responsible to call of_node_put() on the returned @_out_args->np
  * pointer.
  *
  * Example::
@@ -1544,7 +1544,7 @@ EXPORT_SYMBOL(__of_parse_phandle_with_args);
 int of_parse_phandle_with_args_map(const struct device_node *np,
 				   const char *list_name,
 				   const char *stem_name,
-				   int index, struct of_phandle_args *out_args)
+				   int index, struct of_phandle_args *_out_args)
 {
 	char *cells_name __free(kfree) = kasprintf(GFP_KERNEL, "#%s-cells", stem_name);
 	char *map_name __free(kfree) = kasprintf(GFP_KERNEL, "%s-map", stem_name);
@@ -1554,6 +1554,8 @@ int of_parse_phandle_with_args_map(const struct device_node *np,
 	const __be32 *map, *mask, *pass;
 	static const __be32 dummy_mask[] = { [0 ... (MAX_PHANDLE_ARGS - 1)] = cpu_to_be32(~0) };
 	static const __be32 dummy_pass[] = { [0 ... (MAX_PHANDLE_ARGS - 1)] = cpu_to_be32(0) };
+	struct of_phandle_args _oa = {};
+	struct of_phandle_args *out_args = _out_args ? _out_args : &_oa;
 	__be32 initial_match_array[MAX_PHANDLE_ARGS];
 	const __be32 *match_array = initial_match_array;
 	int i, ret, map_len, match;
@@ -1585,6 +1587,8 @@ int of_parse_phandle_with_args_map(const struct device_node *np,
 		/* Get the <list>-map property */
 		map = of_get_property(cur, map_name, &map_len);
 		if (!map) {
+			if (!_out_args)
+				of_node_put(out_args->np);
 			return 0;
 		}
 		map_len /= sizeof(u32);

---
base-commit: 7f26e010764df304602f33912a0550dcf46e72c2
change-id: 20260716-schneider-v7-2-rc1-eip-of-fix-c812599db058

Best regards,
-- 
Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

