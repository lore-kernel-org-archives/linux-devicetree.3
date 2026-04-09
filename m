Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA86364946;
	Thu,  9 Apr 2026 02:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775701363; cv=none; b=kAGgOVUDNyLVEOGEGaOVK+AwMbwxVBHL+7h/Fa3cYNfDvbZKGiSz9vp8JeIESaIi9HcxOOjdWW8hD1ZB7C2S+eaXGZ29JRbjE0eEDw+q+N2RJljQgZhfgK9Gd5CTDw8gbLReBrZdLXJfi7CKHphJ6NFhSIhH/1y0EvKpHT11sjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775701363; c=relaxed/simple;
	bh=UJMv3wK8OWOgWMvRa8idznhH0AwTgTCogVObQl/K87o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IHDtNPt3WMe3jO72yUR0JS7EonmPtinhH+DuC8/ptzP15XvbOgnmwhUBeTNGCX1Ik68NG5Rl+bOrmUS4iroa3HQ1qcDsYQ/+dxawbYvAL5x2I9NpX2AUuHM8BQXro/ts1s9zLjqvXTseERmEy2jcRcSX2S10uQ5chGb9Jv8sPrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAA33mlrDddpWiiyDA--.15423S2;
	Thu, 09 Apr 2026 10:22:35 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: robh@kernel.org,
	saravanak@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] of: unittest: fix use-after-free in of_unittest_changeset()
Date: Thu,  9 Apr 2026 02:22:33 +0000
Message-Id: <20260409022233.418103-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA33mlrDddpWiiyDA--.15423S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw1fKw1DtFy3ury5WryfJFb_yoW8XFy7pr
	Wa9a42yrWDJF47Jay0v347ZFyayasxtrWrGF1UK3WFvan8JFy7Ar1UJayYgFyDuFn7uas0
	v3W0qr1UX3WjyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUS1v3UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ8MA2nW9r9e9QAAsU

The variable 'parent' is assigned the value of 'nchangeset' earlier in the
function, meaning both point to the same struct device_node. The call to
of_node_put(nchangeset) can decrement the reference count to zero and
free the node if there are no other holders. After that, the code still
uses 'parent' to check for the presence of a property and to read a
string property, leading to a use-after-free.

Fix this by moving the of_node_put() call after the last access to
'parent', avoiding the UAF.

Fixes: 1c668ea65506 ("of: unittest: Use of_property_present()")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/of/unittest.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 2940295843e6..eae7ebdf5130 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -896,8 +896,6 @@ static void __init of_unittest_changeset(void)
 
 	unittest(!of_changeset_apply(&chgset), "apply failed\n");
 
-	of_node_put(nchangeset);
-
 	/* Make sure node names are constructed correctly */
 	unittest((np = of_find_node_by_path("/testcase-data/changeset/n2/n21")),
 		 "'%pOF' not added\n", n21);
@@ -919,6 +917,7 @@ static void __init of_unittest_changeset(void)
 	if (!ret)
 		unittest(strcmp(propstr, "hello") == 0, "original value not in updated property after revert");
 
+	of_node_put(nchangeset);
 	of_changeset_destroy(&chgset);
 
 	of_node_put(n1);
-- 
2.34.1

