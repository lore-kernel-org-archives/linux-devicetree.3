Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F83329C57;
	Fri,  3 Apr 2026 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775202916; cv=none; b=pcKE9TIpOFUApibMH2K4HAazgrEIkm5PSEiD/hil/B28oTo+UpcznhULy2uSGeP//O4BTctlbtCzCqgSO2hyQG4ViZdE3ED07wp1KKsvpL37CqWw3ugcLxZxTxpyOBiOO3oPQnncZMlAFiu613Nj/YFdvz3LLcFc0dXkkf8BZEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775202916; c=relaxed/simple;
	bh=RVvgNdsi1dOX7PNycn197fDsPTYs6Pyt69D0pjXXlEo=;
	h=From:Date:Message-ID:To:Cc:In-Reply-To:References:Subject; b=ZCmrsOg6Jhi9kuqZ9ZHtIlNSr9EA55paXM2AofrAvhd3g8DasIz+f80jeFX/zlbiKnqL8n/qjoXBzPKnOJ1VW4wW31e7z/uwVhceF1B+W3bA+aQP8tw5TFwlne1bmlUgcLrCCfMCHHdsQ7eg+tCSqNrD1eYgX4XIgZFN0usZT/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0002-drivers-of-reconfig-status.eml (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowABnh95ecs9pYqO9DA--.33532S2;
	Fri, 03 Apr 2026 15:55:10 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Fri, 3 Apr 2026 15:33:11 +0800
Message-ID: <20260403183502.2-drivers-of-reconfig-status-pengpeng@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
In-Reply-To: <20260403183501.1-drivers-of-live-tree-pengpeng@iscas.ac.cn>
References: <20260403183501.1-drivers-of-live-tree-pengpeng@iscas.ac.cn>
Subject: [PATCH 2/2] drivers/of: validate status properties in reconfig state
 changes
X-CM-TRANSID:rQCowABnh95ecs9pYqO9DA--.33532S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyxAFy7KFWfXrW3AFW5Wrg_yoW8Cw45pa
	yjqa1Yg3y8JrWrGa9xtw1ruF9xKr18tFWxtr9Fyw1UZ3WYga45AF17GryYgrn8Ar95Z3y5
	Ja1xuF98Ga1jkr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWU
	twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUe0PSUUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Live-tree reconfiguration properties also carry raw values plus explicit
lengths. `of_reconfig_get_state_change()` currently treats `status`
property values as NUL-terminated strings and feeds them straight into
`strcmp()`.

Factor the `"okay"` / `"ok"` check out into a helper that first verifies
that the property contains a bounded C string within `prop->length`.
Malformed `status` updates should be treated as not enabling the node.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

---
drivers/of/dynamic.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 1a06175def37..efee59ed371a 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -74,6 +74,20 @@ static const char *action_names[] = {
 	[OF_RECONFIG_UPDATE_PROPERTY] = "UPDATE_PROPERTY",
 };
 
+static bool of_property_status_ok(const struct property *prop)
+{
+	const char *status;
+
+	if (!prop || !prop->value || prop->length <= 0)
+		return false;
+
+	status = prop->value;
+	if (strnlen(status, prop->length) >= prop->length)
+		return false;
+
+	return !strcmp(status, "okay") || !strcmp(status, "ok");
+}
+
 #define _do_print(func, prefix, action, node, prop, ...) ({	\
 	func("changeset: " prefix "%-15s %pOF%s%s\n",		\
 	     ##__VA_ARGS__, action_names[action], node,		\
@@ -135,11 +149,9 @@ int of_reconfig_get_state_change(unsigned long action, struct of_reconfig_data *
 
 	if (prop && !strcmp(prop->name, "status")) {
 		is_status = 1;
-		status_state = !strcmp(prop->value, "okay") ||
-			       !strcmp(prop->value, "ok");
+		status_state = of_property_status_ok(prop);
 		if (old_prop)
-			old_status_state = !strcmp(old_prop->value, "okay") ||
-					   !strcmp(old_prop->value, "ok");
+			old_status_state = of_property_status_ok(old_prop);
 	}
 
 	switch (action) {
-- 
2.50.1 (Apple Git-155)

