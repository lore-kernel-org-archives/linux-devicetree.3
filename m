Received: from mta1.migadu.com (out-98.mta1.migadu.com [95.215.58.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DD73655C4
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743373; cv=none; b=UYIwt0PQaKqyaNWq0NLB47+sg4n00HCUFfmL8Uq28hRR1AGc4FL1UT0aFgMytUMw9ic1XCFlJzJAmv4H0Bg/9tHXFA/M4REGSVhBS4VNJUa45h1cdHwZWNX74Puh2cJG4rEUZyNDjO3MTAaq0+rzLIvWySBEjUcjdOi2h9ZHRLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743373; c=relaxed/simple;
	bh=fOb2OVVG3XUMB7ptZ91It5aeyBt3Cm8/AvkE/9QGcOI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NJTkKNwWSTrHybPqC/qvEnGnVca7zZvgLzoGG/64bRQjNpvDrzT7AQA1mKqbQFenIcMmBdPRVJwFE3lgjhk+OBk3M7bxDTHYCyHP337GiyTLKxheyhC/IBdzVzavUf71OMoCJ65buQniOedn5rMqbvt0HHYCnFKBFaOXt0lf1nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qTVAUsz5; arc=none smtp.client-ip=95.215.58.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qTVAUsz5"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fOb2OVVG3XUMB7ptZ91It5aeyBt3Cm8/AvkE/9QGcOI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787743369; v=1; x=1788348169;
 b=qTVAUsz56kdWzKHXD7Sxq+c9REwCKBeXG6iAA+abv5HxIXmMd+HIShDgDSF/XB7svBItpKo6
 L6YLf0ZgWY2Th+xQCDZlcoFxaJtl48IIcVJ8osbuqRfrxvvSSqjgfe9bzrysJJSlp0PtXZNEiMw
 92FjFCGxoaBgClS8prPlrCQY=
X-Envelope-To: devicetree@vger.kernel.org
Received: from claudy.local (2a01:4b00:ad36:1d00:3a05:25ff:fe33:35a9)
	by smtp.migadu.com with ESMTPS id 4d6852ff7c79a2e6;
	Wed, 26 Aug 2026 11:22:39 +0000
X-Mizu-Trace-ID: 4d6852ff7c79a2e6
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] of/irq: Fix device node refcount leak in of_irq_get_affinity()
Date: Wed, 26 Aug 2026 12:22:34 +0100
Message-Id: <20260826112234.1033974-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_irq_parse_one() raises the refcount of the interrupt controller node
on success, and of_irq_get_affinity() returns without putting it, so
every call past the parse leaks one reference. It is reached from
platform_get_irq_affinity(), used by arm_pmu, arm_spe_pmu and
coresight-trbe.

Put it once irq_populate_fwspec_info() has run: no in-tree
->get_fwspec_info() returns a mask that lives in the node.

Fixes: 5404f5c06dd4 ("of/irq: Add interrupt affinity reporting interface")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/of/irq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 967c191008797..ec035367c9500 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -563,7 +563,9 @@ const struct cpumask *of_irq_get_affinity(struct device_node *dev, int index)
 	of_phandle_args_to_fwspec(oirq.np, oirq.args, oirq.args_count,
 				  &fwspec);
 
-	if (irq_populate_fwspec_info(&fwspec, &info))
+	rc = irq_populate_fwspec_info(&fwspec, &info);
+	of_node_put(oirq.np);
+	if (rc)
 		return NULL;
 
 	return info.affinity;

base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
-- 
2.39.5

