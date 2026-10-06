Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575F449F12C
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302584; cv=none; b=I9IuxQOkhznh0sUKrHS+ltUJvyind27vULKP++CSsa4TzXw1siYvF0rc518qeU51lcw1Gd6+GKXiOKtO55IX5YEOTI7sO21G54Rav+ueiOrRXZLSlDi+NT2laD7gFkRuHvg4ySlug3nd6dzo45rRdQ0RZQEyC687g2AZisM/Okg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302584; c=relaxed/simple;
	bh=0e6tYFYX4RQShFvq6ANsw1VBCkVay04TpNqpD+jAhLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LNIJ7JGfd0gRCaBSNGFaZGGfisT2hWyYOBsGB+b7/HUPszFJWALmF06SQmgoWGYD5fCrf2WNeaeFtk2YWR2qq3kZgkmzg+mfXbbT64fQSGhOd3xfkB/UGUIx41jEdQMwn3CQGQENyyJnmbNSrhFJ30+bWLwvZBNE78qFOtwlBzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=lMY1PhzO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="lMY1PhzO"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afbd2c386so811287f8f.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 09:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1791302580; x=1791907380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFmPMHLkzQ2v2gUtJGa7P11ujTnCxcTV6HWX7PibVsQ=;
        b=lMY1PhzOh9Rjk//wb4nZO8TajTq7opBnGSiCNVCPfMu3Z+sjeAfWIDVMN6YYVTzFry
         0HiPdkAF1EPUqnuA/Col2t6oivQEYQ6QzkpdonL7AtKs4TLojf2KqEAKbpi4UJeUMf80
         5CrFVqYdyTc56+Dni2bike+ctxc1lIvWyZvWGjmdtIjlXR32KtTrjs0eSQ42q7+vx6Ys
         kMKswJ2p+wIkOO9AUkBk7Zk9V95Z5RD5+/WQwPzfgnU/MSP4opXnEQFIT7Mt7SkzF6kQ
         de9NhyAJLCEzBw2jUjgvj7ciZgD+Ckm3zd46Us//P9vZAf9EsiK9rZCizg5dxMwKd2l7
         AwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302580; x=1791907380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFmPMHLkzQ2v2gUtJGa7P11ujTnCxcTV6HWX7PibVsQ=;
        b=Pm03pYAz9o+fG/+dDZwE9ZhKx5iJs/9wkz8PxNt21D6ZlY8EifhSIoNkAn4Bt/EcHw
         KF20CTmzgGyQhQ18OYgtcChbTjBoWGr8O5Zth52pg9UvTGR81YkwM9zhjlKOfdNr/86a
         vzAGCi/Rf8wi0T0OWgDRx+Ci64DTSb0s1jtcotk0Jgqj7L3XTphmuApnwoVmw0rdOpD/
         M4Es3kktorxD/opVioQPRvRm6Eslrb/NfWfWJcKX+GS328NcC2rXuxBbW5h6oWAuZ9/4
         oXeBUv5hUbGhSvbh3i14buFIc1jBGKq7XDaC9U9ibLbc119eDiydYXCTCAICQg6qd+eE
         TW1w==
X-Forwarded-Encrypted: i=1; AKwUvBx3fLfHM7/ampDCUTy3h9TmxCcBP5uZ1JH+XUfJdiLIvU4FlqQXtiGXNFGFsXvw9UU90tOqBbHs1wPF@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0hylD3pN2482adswsUPjQrHG+6ja4pa6E0uipNlcgJ9xQuQKr
	q6kCAY52x27dWRJGq3LJeTVkC4OcTbdYMx+GtrwJi5MNVfd0pZT/dEk1DrmJRXrV+QM=
X-Gm-Gg: AYBFou1EvzEBXtFnSGDrHA86TX0iLrhyfjgAXgs44kOTY5oXAICSJnXl1iRXWL6lZ21
	95pGOrwCEuDTuKhVia6fhTGhi2uqIvkB1sRbBNUVo9ST9ao4oo5WpDn60uQ1Xxz95RoLnwd21x4
	Bhiy1mVwB4OSYLOoJnVc/fVy/zTxva+UnW26m6hOzTLUFBJ3K62X4GEdH/YUPuME2Wp0sAhZ0Qw
	hc1Pfm5zntJhpXdBx8TiY02E+RI1n8OybWBFvwO4PQt9CL9HncovlGYd4zxYtpez1h3WpKHpo1Z
	JhvnMfvTQxmOvYkhYonqUKH7YmjbnYdW2f0/cwanaoW2mX57nfuF0yF+spDoLUQsCGGOYWbrcJu
	GRfRkdrHnNg8LP60c9aYxYTuh3KO1NxAInsw0WwgCT4YgH/7g7HI+CBd0uiEUVoZjfHMw9zdgQa
	nuDuB4YjSJpWTsDBspNQu7qgx7JugRmVQJ/oX68i0zfzOvVjXnNuylaJq8Rv3wNrG0ZK1EBtEOc
	2WH75EhuJvE1sfmYA==
X-Received: by 2002:a05:6000:1868:b0:48b:1b1:af12 with SMTP id ffacd0b85a97d-48c6d1b289cmr3246959f8f.56.1791302580197;
        Tue, 06 Oct 2026 09:03:00 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.85.242.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2014asm369641f8f.38.2026.10.06.09.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:02:59 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 06 Oct 2026 20:02:41 +0400
Subject: [PATCH v3 3/5] power: reset: syscon-reboot-mode: enable supplies
 for the next stage
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-rk3576-reboot-mode-v3-3-6edba064693b@flipper.net>
References: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
In-Reply-To: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, 
 Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4150; i=alchark@flipper.net;
 h=from:subject:message-id; bh=0e6tYFYX4RQShFvq6ANsw1VBCkVay04TpNqpD+jAhLg=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQdlV6dmFi/P2DCg2L+uH3PrBfJ8925eMmo71bowYTPB
 +w1bVeu6pjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqH/5nZFiU9lPx6e+jf3wi1h681HXUY2HK4e8zbOJfqMVeMLj0rDaQkeFWWZR
 QnENJ8uWYz7/q9nPtv7y+ZfbpojXXJ/Qf/TBPyI8FAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Requesting a boot mode on some SoCs such as the Rockchip RK3576 hands the
request to the boot ROM in a register that a full reset would clear, so
any reset that carries it has to leave the PMIC untouched. This means that
the regulators stay in whichever power state the running OS left them,
which may be unsuitable for the early boot code. E.g. on RK3576 the DDR
initialization blob runs on the way back and accesses registers which
Linux normally leaves powered down, resulting in an unrecoverable abort.

Get every supply named in the reboot mode node and enable it when a mode
is written, which is when a mode is being requested. The supplies are
deliberately left enabled afterwards: the system is on its way down, and
what runs next cannot turn them on.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>

------

Current implementation of of_regulator_bulk_get_all() never writes the
supply names, instead leaving them uninitialized, while the regulator
core uses the field in error paths to provide meaningful error messages
to the user. This has been highlighted by Sashiko on v1, and is addressed
separately in [1]

[1] https://lore.kernel.org/all/20260929-regulator-get-all-v1-1-e887c66a47f1@flipper.net/
---
 drivers/power/reset/syscon-reboot-mode.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7..5ef882d81816 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -10,6 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
 #include <linux/mfd/syscon.h>
 #include <linux/reboot-mode.h>
 
@@ -18,6 +20,8 @@ struct syscon_reboot_mode {
 	struct reboot_mode_driver reboot;
 	u32 offset;
 	u32 mask;
+	struct regulator_bulk_data *supplies;
+	int num_supplies;
 };
 
 static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
@@ -28,6 +32,20 @@ static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
 
 	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
 
+	/*
+	 * Whatever acts on the mode (e.g. boot ROM) runs before the operating
+	 * system, and may need supplies that the running system had powered
+	 * down. Enable them here, and deliberately leave them enabled: the
+	 * system is on its way down, and what runs next may not know how to
+	 * turn them on.
+	 */
+	if (syscon_rbm->num_supplies) {
+		ret = regulator_bulk_enable(syscon_rbm->num_supplies,
+					    syscon_rbm->supplies);
+		if (ret < 0)
+			dev_err(reboot->dev, "enabling reboot mode supplies failed\n");
+	}
+
 	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
 				 syscon_rbm->mask, magic);
 	if (ret < 0)
@@ -36,6 +54,14 @@ static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
 	return ret;
 }
 
+static void syscon_reboot_mode_put_supplies(void *data)
+{
+	struct syscon_reboot_mode *syscon_rbm = data;
+
+	regulator_bulk_free(syscon_rbm->num_supplies, syscon_rbm->supplies);
+	kfree(syscon_rbm->supplies);
+}
+
 static int syscon_reboot_mode_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -59,6 +85,21 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 
 	of_property_read_u32(pdev->dev.of_node, "mask", &syscon_rbm->mask);
 
+	ret = of_regulator_bulk_get_all(&pdev->dev, pdev->dev.of_node,
+					&syscon_rbm->supplies);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't get reboot mode supplies\n");
+
+	syscon_rbm->num_supplies = ret;
+	if (syscon_rbm->num_supplies) {
+		ret = devm_add_action_or_reset(&pdev->dev,
+					       syscon_reboot_mode_put_supplies,
+					       syscon_rbm);
+		if (ret)
+			return ret;
+	}
+
 	ret = devm_reboot_mode_register(&pdev->dev, &syscon_rbm->reboot);
 	if (ret)
 		dev_err(&pdev->dev, "can't register reboot mode\n");

-- 
2.55.0

