Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F2E3A6F19;
	Mon, 29 Jun 2026 06:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715774; cv=none; b=caYh5KV+Tspb/0iMB+6YzTVp80+FOzM9BAXuvrTeKZaGSQfd36CVtUFOUcJbmseF9X3H2H6In5xZFmVwi7NFzyRsRH/PJCKhyBqorJRydqe58XktHG0VS+O1OVabSmOVVwRnybUxzY93V6qaYd1+bwtRq9Kh4uGsYFfv6tkVqEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715774; c=relaxed/simple;
	bh=o9rQxS6VSnLZ8UKdGcYxwjs9cwreXI3LIctajGTw3oc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L0J98Hyh5GaZqSNlhDWM0Zb66w8VmA52JqZfH2QTTb9CPsnvt06XxLUqjmlDiLj/efrmYgROxiv6u5OGH+BN1aDR/rNvappqdY8NPnKkMknKxkHS748T1cPA8lUUBX5Mt3Ob0YB14FXBIJ0fkC81NzRH2H+IuLFH15NmqujYRrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jO8UnOjM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jO8UnOjM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED214C2BCF6;
	Mon, 29 Jun 2026 06:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782715774;
	bh=o9rQxS6VSnLZ8UKdGcYxwjs9cwreXI3LIctajGTw3oc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jO8UnOjMxgR7T59iLunDizziDNuV9ICXSGMpyrRKLa5eU5bVC3K23QiQ2zRu3Q6B7
	 n+D2MbuYJ2iitwtqZtWECRmaK7XM4a8uiEP6sY31YHsw9E004TMM5BHk459ZqgGzlK
	 uMIjAuDvLkEYOoF4dV8D6RSMa2PyFZOSwLEFY9eBKydN3OB1gtbKp0O02lKjbhDSZP
	 lzYASnAPeTykIhgyr/rld767lCazOM8u/AHfP/aU5z6Q+ZVa+3Te+upwTt3GKrU/et
	 euImpHD4B4TLWaH3PYxdMOZ5daR5uTcqZVRUv9EMd3Q3NvmYBF91PZxBLdwEVYRtG8
	 cp7rltm1ZAs6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4F3C43602;
	Mon, 29 Jun 2026 06:49:33 +0000 (UTC)
From: Yu-Che Hsieh via B4 Relay <devnull+yc_hsieh.aspeedtech.com@kernel.org>
Date: Mon, 29 Jun 2026 14:48:59 +0800
Subject: [PATCH 2/4] ipmi: bt-bmc: Track open state per device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-aspeed-bt-bmc-multichannel-v1-2-fc23ee337f7a@aspeedtech.com>
References: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
In-Reply-To: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
To: Corey Minyard <corey@minyard.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715772; l=1964;
 i=yc_hsieh@aspeedtech.com; s=20260629; h=from:subject:message-id;
 bh=kkcdpH7g4gFHRExA7T4VUvsyg0bKpkuItRJGEI3xPJA=;
 b=yHQTY1jCvmxKBbcWqHMlIZQ8QIbmxk/w14R13q3bhtuzMgZpj11PsEVwfZCzFGlKhBzXd+Lfs
 TSHkqXBCUHbCjiz3yJ7vSAa2XwHJor+R157niWVbLj+PCVz3VziveqT
X-Developer-Key: i=yc_hsieh@aspeedtech.com; a=ed25519;
 pk=kLxUeF7g6teciq79it9N3tYNgp3yCspZ+AHlYSnZ0gs=
X-Endpoint-Received: by B4 Relay for yc_hsieh@aspeedtech.com/20260629 with
 auth_id=844
X-Original-From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
Reply-To: yc_hsieh@aspeedtech.com

From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>

The driver uses a global open count to allow only one userspace client

to open the BT device at a time. This works for a single device, but

also prevents independent BT device instances from being opened

concurrently.

Move the open count into struct bt_bmc so each device instance tracks

its own open state. This preserves the single-open behavior per device

while allowing multiple BT devices to operate independently.

Signed-off-by: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
---
 drivers/char/ipmi/bt-bmc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
index f3c67272502f..486ecc0b6815 100644
--- a/drivers/char/ipmi/bt-bmc.c
+++ b/drivers/char/ipmi/bt-bmc.c
@@ -64,10 +64,9 @@ struct bt_bmc {
 	wait_queue_head_t	queue;
 	struct timer_list	poll_timer;
 	struct mutex		mutex;
+	atomic_t		open_count;
 };
 
-static atomic_t open_count = ATOMIC_INIT(0);
-
 static u8 bt_inb(struct bt_bmc *bt_bmc, int reg)
 {
 	return readb(bt_bmc->base + reg);
@@ -152,12 +151,12 @@ static int bt_bmc_open(struct inode *inode, struct file *file)
 {
 	struct bt_bmc *bt_bmc = file_bt_bmc(file);
 
-	if (atomic_inc_return(&open_count) == 1) {
+	if (atomic_inc_return(&bt_bmc->open_count) == 1) {
 		clr_b_busy(bt_bmc);
 		return 0;
 	}
 
-	atomic_dec(&open_count);
+	atomic_dec(&bt_bmc->open_count);
 	return -EBUSY;
 }
 
@@ -313,7 +312,7 @@ static int bt_bmc_release(struct inode *inode, struct file *file)
 {
 	struct bt_bmc *bt_bmc = file_bt_bmc(file);
 
-	atomic_dec(&open_count);
+	atomic_dec(&bt_bmc->open_count);
 	set_b_busy(bt_bmc);
 	return 0;
 }
@@ -425,6 +424,8 @@ static int bt_bmc_probe(struct platform_device *pdev)
 	if (IS_ERR(bt_bmc->base))
 		return PTR_ERR(bt_bmc->base);
 
+	atomic_set(&bt_bmc->open_count, 0);
+
 	mutex_init(&bt_bmc->mutex);
 	init_waitqueue_head(&bt_bmc->queue);
 

-- 
2.34.1


