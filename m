Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2EF49EC6D
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 16:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302582; cv=none; b=jrqdK+vbU0EtmDBd11PPqaSvfGzguU6MbaLD9173zmhhp7jhkEIoeuq/ZRSIRJArE592ODY/4mtHBkl4CNweokMD20zWJQO6qCBueFV6xbdFWilJe9FxXMv9JL/hVx7RD9hEh7HD2S/uJ93K/AY7WiMBhBlFumGaZeRJHtALkcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302582; c=relaxed/simple;
	bh=Qk5juJXyHQAA0FzltH0EG8o2EdUhAIQpUus6d2gQKFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CnOOhMSx5Xbzo4uU6J0vNhjBjFfaeIMe7zDvagmDbdvwfZqCcBxBPPXw1khBNoQYpBnMjCEA0dPSSaR87EXWgHlDPoEczz7xK2dp4wC7Xiv9wlGBMp3r8eTLFY6MwtKe6OSqsqR49FWkDFbnJMrOJAUzO0vaZnir8vjkuoItb3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=tfPt7BVO; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="tfPt7BVO"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso617618f8f.2
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 09:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1791302579; x=1791907379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lAKGigWSN+rmthZd67UvTxza7+7ujThB0c4R/68QCpQ=;
        b=tfPt7BVOOgUN3dFO5QifMZqX1tWg8CR4dy5RDH4Di2ywAhcPSGQC4Q7FwelDleLUi4
         v5d4HBU+yJrjgieHmT6z6KMvU2ucobZgraBlhJf3RZ/JOTp5uw8TjsuqrCQA1JdJdY8w
         lQbpogvPyrKmas0lh+Uq1QRYwbGPoG2ZQ4xpvl2kq2f3LiQVgcBG/cyCuD2sD5/D4beb
         3QGQ9VbKdqXO+rf1gTe6ogbNir2rxAUkhJyqq66l4EHCygG6EphofGPiOoU6ceFjXG7F
         tuZiKc3pAROvhFuUhvHGFZsjfIftrbkr/vpXtM9jLX7efkRHlteQJPaA+BWJiKFrtpmx
         KtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302579; x=1791907379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lAKGigWSN+rmthZd67UvTxza7+7ujThB0c4R/68QCpQ=;
        b=VpSxFI/WeJL/wmRrdEX4w1b5dmlMM8nInr8sBZ1r7Ri7V2Sj00h9iaXeMQTRUi/H7D
         fvcVS77fR1eUepLq6OSkEVPmI+MQ+0eM2zcYWwSMxVohTn/2ZXLke6pLc9FaDX1v32dz
         bFTPKUXKcAXflXMeqHSFqGo68oz/Ei0LRt7/HY0pftAb44hSMrbX6v0G3Dc1ygBkE/g/
         DvaP3owKxs65AqtVQH+IoGPshj7ZGIZqr3rDOmMgiBFLKdFGtIRW8CaI6v4MQJeiF/za
         uNQCcFlXITOybnrt3dQRwKnN9OLv630fVuwIsdxzT9dHwJ3pJBVz1Z+Th+yNxlyG0pcB
         ePkg==
X-Forwarded-Encrypted: i=1; AKwUvBxAnI0iN2+bnxIGVAbAGL6UK/lhaFpVbXiGLTr/hI0suCRWL9MCxwN9rTG6coqhn01+BY3uo4O5ZaUI@vger.kernel.org
X-Gm-Message-State: AFq9FYKtuK4YNqyLfqIcdrH1N5EquItF5Xm/pD0vwPYo1PEDyOleYwrL
	PF+89fQvP+eQFGur1pCa9KJEjV/9VRilpDkypxOuF3x9WHeBRO9FTqWXmIbrKQho9nI=
X-Gm-Gg: AYBFou1XIFQwL4noB7a7zqvM8cuGAJqKol7TP/b54uVaWtRNJMMh/EdxOjGJ6LQVFQV
	NixodrCA3bPl9xQHHkRVEt2QGHBe24F+TNn/Uo9JbTRirHit/HqBXxRcy1uuOQhiewEVGnTUsCV
	wAuYu3tImm4wGACpRz1IvHLRD/e7Fp0ei1Ohh7vazw3m9IC0VjIKOZN8UHCVE8jOKU3ysb6IUbE
	PEeLDmjD+p3Ajm8spVR13o1MVNuYoF10qzXF74Ay0wxbcFAwjVx8swwtf8jx+fufQHWrd0OlYAC
	kpj0nW3GFne7B4LS2BJ1/+ynGPBoPQfJpBa3SSC3TRUrLzKbGw3IRXJp9aBzYueDQIeMmEwYN0i
	qMWWfa8TOzPr3TEhpOp2flpClQocZlS3PBlypnrpi4N/+dz+/WB5AEf0gxuYTKti4W+TMIp0Ch/
	QsMinr9/y5Zr8EKhpWmHNqEFmYeVojBKlTXnqPkmasIGMCuFP1nISTukCzGCRlqUHB4muPmmEWJ
	pEEVkZoPnRw2OBTgg==
X-Received: by 2002:a05:6000:2c04:b0:48c:55c1:fb50 with SMTP id ffacd0b85a97d-48c6d1cbc24mr3125986f8f.40.1791302579018;
        Tue, 06 Oct 2026 09:02:59 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.85.242.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2014asm369641f8f.38.2026.10.06.09.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:02:58 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 06 Oct 2026 20:02:40 +0400
Subject: [PATCH v3 2/5] dt-bindings: power: reset: syscon-reboot-mode:
 allow supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-rk3576-reboot-mode-v3-2-6edba064693b@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Qk5juJXyHQAA0FzltH0EG8o2EdUhAIQpUus6d2gQKFo=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQdlV69416CV0SY0q2a6g3/lvREXw3JaLVe8uyHhWGR7
 GMBx/nRHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy14HFGhk4V3ggHMe6XpyPkA48GW/nN6T3hbZU8zyvO5D3b5Ip3cQz/QxiLTU0
 r8xh17WrDPwscuvcndcftWYsZL9Slchi2tJ9gBgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Whatever program that acts on a reboot mode runs before a full OS, so it
may lack the capability to enable the regulators it depends on, and a
reset that preserves the mode register generally leaves the regulators as
the previously running system left them.

Allow a reboot mode node to name such supplies, so that they can be
turned on while the mode is being requested.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/power/reset/syscon-reboot-mode.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
index 79ffc78b23ea..5ed70c87269e 100644
--- a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
+++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.yaml
@@ -36,6 +36,14 @@ patternProperties:
   "^mode-.*$":
     maxItems: 1
 
+  "^[a-z0-9]+(-[a-z0-9]+)*-supply$":
+    description:
+      Supply that has to be powered for whatever program acts on the mode.
+      That could be a boot ROM with no access to regulators, and a warm reset
+      leaves them as the previously running system left them and not necessarily
+      what their expected out-of-reboot state is. Any supply described here is
+      enabled when a mode is requested, and stays enabled.
+
 unevaluatedProperties: false
 
 required:

-- 
2.55.0

