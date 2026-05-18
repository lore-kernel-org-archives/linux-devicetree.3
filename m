Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4F63DD51F
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092028; cv=none; b=Vv9Ksg5g/A+Z1IzjDAiDTLJOeQn/T7P7Q/rL4PUH7Mj5lYga8qj8JMuO6TdL+qLu3w9CodAbWTJwueP4YzgYWAYagD+WPMio1K2nU3RpoZp09gjN/tpaQogFmqUhMaJh+KGHKzZ8WZssxIu7aKLq7IWmxk7NEFrdA4vnLl2FyEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092028; c=relaxed/simple;
	bh=S7dWrYvFIldw2l1SOFgEAr+X6zlqSVikajVanVBoRe8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=omEusWn7tfyM+JQ9OSTj2L4xpfzHu58/BCg4zTf4axHrzeQXkoHBtClXiquJWIzBX+EC3Db3O1807nvlCQMhicALibjAg5rmwABLveHeySo7o7fNqNzYyNKahlncU3GXVbTXYWKRx5QZNRFY9c6gEo5mAWLW8N3XJK6GaqgwY2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igHGEYKo; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igHGEYKo"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so694508a12.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 01:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779092026; x=1779696826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HR4Kjt+Vrl/yVgY170pfdcB9p9LiTbCCTUEcbYkBEOU=;
        b=igHGEYKoGi6HdgS51ao02NAnH2yw7sdBTfcdT3DVLnOuwXXufrUssMyhdMTsD5pLMU
         C5YsIdFgbWqkakzYurh/AXnj0bOVBKry/6XhNAYHX+VaNrBlatMUqxXBtGP4n0l0qxM/
         w0Wxh/+32SB20Bol6OSVfZucwJ8n5KXOzEXgU8OrGyacaQAZVbGXIej/iihYD/K7EYEG
         Tp43bsHtCEOXX3415tCDjvrXDZWpGPip15BWoEHDjcl/IbCQGVvv9XEf8WJ5DdFB35T6
         aqZwRvzzQ6E6o3y4TH92TAqvzLRqkqS+GKThW48fAqbLl8e5b2Ha2EZDbVS/hFp+R4IU
         w1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092026; x=1779696826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HR4Kjt+Vrl/yVgY170pfdcB9p9LiTbCCTUEcbYkBEOU=;
        b=X8MYgzZa6L3g2E8agc2nyzzgD5BwDMwLhasC4wkKROoJ1kKmx2M5A60Yrxj0draoQ5
         nm5UlNuJ2YkL8f4W5biGakF1l/yOpATSR21UkJBDcO/SIKoYS9IBxwNU8i3yUfOAJoLA
         PiYqiKgTQWlDe1RFO6NTMBNbFfUj+Kj2sQNwTbXJYFP8Gtk90gZoP56T50G5gbYOBDq4
         dnc8hZMcV+VpztQJ/SH3LEobNRCzW6CuZMwT6izR/GMRPnEfK252+Wy6g+lzk92doCpR
         Bp0u88C3rjktHpjzDahMlFa9Uud76LUbyISdQaufi8o68Pl5Nco27EuKNsrMSoLpbE7q
         qOMQ==
X-Gm-Message-State: AOJu0Yz0xlYtWNNKIw4eRxnju+MS7eFGMbAAEYVoUKEfu1XWdFJO+xd/
	L5rAPxYBrI5haVcJiarQBwPkdra17YqBPSUm9/OFY2+g2sxNt9hSwP5X
X-Gm-Gg: Acq92OGrT9iuXqAg2yQ7MFi8suNsiDT7THBG+mHAvVe2xbxcIlBbJBG0oNwo8coXqs3
	7xtqz0BbrDrXxzKxIYQIOBxljslMyNQEJ4tQ/6n91h+vuDMfM4XzEIiJMdhGuJnSQdJQdJEqlne
	zXZRdFLoAoO9vTDhfffip4r/YKSWBGCcm0qvrokD+txoMSVoRaZfQ70bhhxXXtc5UbgRZes4jyE
	PX+2b1HA/qyXCZcA1TomOyNAaWiWOoNMyQ782a73F5iHzcN1/JYi8mhfTCUh8/cjZ0m/wL57PRU
	DXuBLY/P5ZU/wBdhc1n4U9aoBXI0dnLMTlNaX4TnnjRa6VJcipie8nAu9mxw6nB+4HnfGfvfBu4
	7XP3TU7305LfnuqzIgtabC9D3QJN/j9Zb2rz5v+xfFyfNMOwVDUU4fl3vQxIRx7i1KXf9ji4PHL
	9qn6PggmOwyfUH+/5J5FNMpTZgE8UpcSY9jNfC3kH90DR9Fe4ONnn93IGdzUeMyLB7kEqkHLEXS
	Na6qUY8P7PgCw==
X-Received: by 2002:a05:6a20:7d9d:b0:3a3:2b7e:a4ab with SMTP id adf61e73a8af0-3b22ec60b53mr15472490637.44.1779092026391;
        Mon, 18 May 2026 01:13:46 -0700 (PDT)
Received: from open.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb100706sm12749462a12.17.2026.05.18.01.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 01:13:45 -0700 (PDT)
From: Neil Cheng <neilcheng0417@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Neil Cheng <neilcheng0417@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: Add Meta Rainiera6 board
Date: Mon, 18 May 2026 16:13:24 +0800
Message-Id: <4f7aee0a2dfc44770347ccc82e54820e7b35317c.1779088499.git.neilcheng0417@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1779088499.git.neilcheng0417@gmail.com>
References: <cover.1779088499.git.neilcheng0417@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new compatibles used on Meta Rainiera6.

Signed-off-by: Neil Cheng <neilcheng0417@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 8ec7a3e74a21..1a2252eb08f1 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -95,6 +95,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,rainiera6-bmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
-- 
2.25.1

