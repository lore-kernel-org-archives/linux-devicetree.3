Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DD8382397;
	Thu,  7 May 2026 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141901; cv=none; b=EjrREvWYx53XvZ1n9huEhEBSltf2iuwUlU54f9OUc6hrLvJ/1TWIkBbMGprlXderryPxc6yCkVhtKx2g/lXnWaa7CjpekHHPIEFrvjqhlO1qRfqjlvqhqxzdWqYNhiys6m1aEwn5nAJzmI0zbow9H809wZafLhYNaC+pYbS2UJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141901; c=relaxed/simple;
	bh=JBYr+BhvTaDlh8ZAuU2RX2I1ndmD3ivRFf7adDPcbJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IkiqX05oUhhOPrNbH6ZHlvS5vRU2IaokmtiNm0CkEM9Owf60zH6XLMvCZTVxKZ6NKc0Kr2FeQM+Yi7n7r0Bb46ZY7a0HFchSN4zoyB0b03u8ode4ZhAYwCbqgUJXKaSdEv/f0hPWWIgsk0viIztq7rTar+l4VWmW+JnFmud56MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAD32uHGSvxpM_1NEA--.16716S3;
	Thu, 07 May 2026 16:18:14 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v3 2/2] drivers/of: validate status properties in reconfig state changes
Date: Thu,  7 May 2026 16:18:11 +0800
Message-ID: <20260507081812.91838-2-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260507081812.91838-1-pengpeng@iscas.ac.cn>
References: <20260417223003.1-drivers-of-live-tree-v2-pengpeng@iscas.ac.cn>
 <20260507081812.91838-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD32uHGSvxpM_1NEA--.16716S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyxAFy7KFWkJry7Xw48tFb_yoW8ur15pF
	Wjvw4Yg3yUJrWrGa9rtw1ruF9xKr1ktFWxtF9rtw1UZ3WYga45AF17JryYgrn8Cr95Z3y5
	Ja1xuFyDGa1jkr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j6rxdM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1DMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1U3ktUUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Live-tree reconfiguration properties also carry raw values plus explicit
lengths. `of_reconfig_get_state_change()` currently treats `status`
property values as NUL-terminated strings and feeds them straight into
`strcmp()`.

Factor the `"okay"` / `"ok"` check out into a helper that first verifies
that the property contains a bounded C string within `prop->length`.
Malformed `status` updates should be treated as not enabling the node.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v2:
- no code change; carried with patch 1/2

Changes since v1:
- no change; carried in v2 because patch 1/2 was reworked

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

