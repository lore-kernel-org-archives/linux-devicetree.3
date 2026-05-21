Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEC53F4DD4
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374559; cv=none; b=CSRUN8HrzX4kyioCWrFQr4yH6KQQ/QBwelduvsB9ySsWjFTl3g9VPqhhpwHGkVqgxEAIxeYumFLHk6MRPDXvs81uW3VJ9v6lOglXTqZvVmj4QI0L9NMypYFMp5h798so+r/HGzzBvAQKyWmVnbc+s+c56qWybAfiijXiktvNXGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374559; c=relaxed/simple;
	bh=JLb8dakvmIkiwIQ9BNtmiqDgh2DZEgTaUcPC8AgYwes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wf2uYxo1K/24zKWMSMR0wqtt39Av8bU5HilakuS33Wm9JrczTzveFKWStGQk1QDScVGCNDzZA2trZsZqPUivDVyXGeZcJNEPHjc9msXDPCh9Fq/+oDDUvjIQl+2Pd8scwt/MIPqRHI/DOVEJuFcxzyS5yrkJWYDAMdgf+HhNQ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qKO9LRF2; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qKO9LRF2"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-65e39d1dd38so5735730d50.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779374557; x=1779979357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mENXEUb2I/IvitDd5eC5WRpQQNrmeFgj2UUSvwpfHeY=;
        b=qKO9LRF2UnxnP+DcHJPCXdI8rsrIvscuOah5ocTUWzIogWlUKpWso+CaPbRekC9se5
         sKvaUA9K5ks5HO/Aj/+tBlnrx1W/ftQV6/0oYrThZ3betqmbFMGV+zQioBHo/YlC9v1d
         EQjCocN+LduiD3lrVIGLCsvt1GpEMCyz54SRpSJH8nakZtEBfyzMR3S5dM1SSCifLFs+
         jiGR7nuL4T3sW5V1Qv10X5NW6/cp3nIbZRfdn5RUjOsCSH0OIYVpe983jzFQDZFxlO3/
         n9m5vB4S8skeNHGrtOfaCy2WoyjgseY+UzPT256DK/eg+8fpZtNi8A/IjRCO6AoVgln6
         V7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374557; x=1779979357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mENXEUb2I/IvitDd5eC5WRpQQNrmeFgj2UUSvwpfHeY=;
        b=eHnT0/6vMUK5edDx1YH3SLhbFUCv6n9bDhYWjp9mhrNxBSvN+BXmE0wjRKTr0uj/P+
         VufiE40jjwuSNMigkxJ4MA7rJb27+gnrZStgR6OX6RXH+LGqyjGSOA7N3excWUQulS99
         nxcQ7tws/BsXVbqAJXaihLcRrB7VJBopAxzqwa8s7r2I04vm1I0xYM2NwuT3p9FAtHvo
         KtUrT6MA5ETXKuBDQJvz9XB+1GN5K9Vi7ixxe6kX+x9HIGPqTWapOoT4XnXvtXtU/Urn
         s6QQ3Pm/E9eR6qKXvlK9hkpwW7ceHbnE+KrKsUTM8Bj74Qn8N6NxrexLSzmYmo74K62J
         pByA==
X-Forwarded-Encrypted: i=1; AFNElJ+ty2DNIkPEIm3o4/3hTdZsJnSUVitbKGYLXlKJkorPiipykr8w/Zg9maGCcRkW1kZLxbRieJv+5G4t@vger.kernel.org
X-Gm-Message-State: AOJu0YwYhzTakfjPvR7AaECqPoxQZJO7CojLZY1e1hMTkxFSlrBibRzJ
	EuLCFRV0/X+5ojFbedPSCBmkrlTexYLQAYb+q5Ht1hOL0oHR6VMs1AVr
X-Gm-Gg: Acq92OGRIgagQy8i/gNWH1/7LTDGE7ILsAw3wU0sQEhbffn3TBcuWOHfuO37yR59JNi
	x3OmmkScP9SVE1ZD48EASoeTm/24Hxo2oR+XutvY1gvmQhWqFfTnn9bq8dWRvF7W7xHkLWJFRa7
	W0x7IiHUTHk1aJC2Gwq61UvpsK9eRjQX3/7vadQTDaQLaNq5t5yQEwOvvCpNAep/pR5uXih8BM7
	UQGWsV7GUjK/vKdQaIP8DGPoTL2KRXL5bQHxvPQdf3CNSsBG237yyG23fkAAIF9sHQEnDgxbVaR
	gXTq+O/ry/SE/aOJXUotQ+7c534UEOLyk3ZaNjNxyyCVEzaVJng7WoJkgnLGCe+jITDOvjEJQRx
	I1w3dreyvKHqq77xz10vLFJv6Ce+2aRZoc5W/JmCxNkzegWN0nqsTvwXh5H8GlXuyjewGx9Yeqh
	d4owhhGE1s7M+YFOrBVxryVzMJahcq7h3o5WlvhM5ZrMVL/8cZX4VO
X-Received: by 2002:a05:690e:124d:b0:65d:8f98:6bb4 with SMTP id 956f58d0204a3-65eae00c434mr2809147d50.29.1779374556706;
        Thu, 21 May 2026 07:42:36 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d2cac72ebesm3596107b3.41.2026.05.21.07.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:42:36 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk+dt@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: net: mdio: remove deprecated .txt binding stub
Date: Thu, 21 May 2026 09:42:34 -0500
Message-ID: <20260521144235.3414-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The plain text binding file was superseded by the YAML schema in
commit 62d77ff7ecbf ("dt-bindings: net: Add a YAML schemas for the
generic MDIO options"). The file now contains only a redirect notice.
Remove it.

Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
---
 Documentation/devicetree/bindings/net/mdio.txt | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 Documentation/devicetree/bindings/net/mdio.txt

diff --git a/Documentation/devicetree/bindings/net/mdio.txt b/Documentation/devicetree/bindings/net/mdio.txt
deleted file mode 100644
index cf8a01054..000000000
--- a/Documentation/devicetree/bindings/net/mdio.txt
+++ /dev/null
@@ -1 +0,0 @@
-This file has moved to mdio.yaml.
-- 
2.54.0

