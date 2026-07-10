Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB3A404BF7
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783680882; cv=none; b=hmBnC+1LKLFiBTnyWYgcHn/UECfe0L2oo+N6YOfAydYTPNt4jCc6B2WQeAD1Z5lprtkVRHuqsyBKwDgGb+LKc8uuvmEPqe06RnmzXTx1I5QK2pFyfCI/Ii139Bkppk8whmn+PLgGMPi20LCjr3opAm+9rONwI+LuZ86YAb8ufOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783680882; c=relaxed/simple;
	bh=vN8Gplg3HKboYHhrh53h0TgVjNq08Q48tb7ZFBm/Nag=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nzIgDZpz1HsDVS42gyG3GQVHcwXRHLSYiyYHOn42f6JPsySuColRbLBeHY1raRKOi+Fj7WkoBiilhuoweZvrDFNgjJZFkK9lSXeKNocqA2qrKah00W9tVaSz6T2ZXmfx6mtz+ewPLm9/ZcWYEhHbCVNuh/ib6/hHlma+FD8hi8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ohSWk+9m; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohSWk+9m"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37df72c9984so1304986a91.3
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 03:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783680880; x=1784285680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j4ZVGeRqKMU3nyf6nzNvRFsoeF/EGxON3z9J6rKtVAk=;
        b=ohSWk+9moSZZ5EDWEhLYvlLf358g21eZnPOK3Q0HD0zKwl3ESSU0ue7XwFVJzAG2Gr
         w6sMaEzKUvtdcUy/+3LU3lzS02uwQyA7oHvqHfmbM74Er5ODrM67qV55s9tGVpxWl+6L
         8AQ6Q8o+vDJ3YP88wuUdCNs/QBBkCms7sZDk9ybAYoqXgVed/F5L84NJYYLHdLu1mL3F
         fwN5pOEWAm1NBoNHtvVyQeQZjppg3siATA12ejYeDlnzkhBGjKGjnh1aCV26QLYi3pUa
         uFSmbgBkpKxXhFVHPslVrLseeIu/IfGRRbe+758FnGwJnjuOnOUOUtvTxk86dgWOY0Fo
         yRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680880; x=1784285680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4ZVGeRqKMU3nyf6nzNvRFsoeF/EGxON3z9J6rKtVAk=;
        b=o9tvd65zZ/zpypo2daTqNZ0/1d5uGsBjObySpW15EF2M9qUXH2OUrxFtDoKvM0QEPz
         zcjWRYqv6DSYCHofXCC91HpLBlC0rk2hf3X4YW1LpX38p+5o8QOh31UH1dZLRPDcVr/1
         Wxq5fbB3xckjPmtrjXO9IAySSu4UomXap6Js+EqDMuf/1Q6FlwveUlJ2KFJ41Ngtlmqy
         CpOHBIRoaFOMi8BKhB0w8b/TXHGLj/9gTKYE0z4CbNs/6bctdycfDOr1jI9sUwKwghzC
         ayrecWhPwsmDqE0Y58lfRnz/NnyA59et+2KhLMUpE+cLz6CfTFxh6DYn5LmyMiM4pqZz
         6RgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2Jg3p6Ato1gt5nPSUcO8lsLvvnxH3j01jEiZ0qf6EPKuszvgno+wmHWJmUGo6w1/Gx4NL7FSRzMIs@vger.kernel.org
X-Gm-Message-State: AOJu0YzcYllPz3hsmA90Xij7G84sY6eJbxqbrK1IUQ5UVtWryI3Gogfn
	D3kLr7vFiuVbsbyN8MnYsTavbpzY6XFqiZBgy/rQJHljo2C4GDhz8uGv
X-Gm-Gg: AfdE7clP439Dsfd00KTOTk6nu0Cu18o22kPWDjyWwZu4Hij5goGPIZysGwXlrQl3kby
	Qulrm5FqSenHIQw1Wb4v7aXqko+M+t3jdj/96pBCZPLeQKKXaWLvwLqZplim8mZMg1AR9apcTfZ
	c1KgmkTQj8Ljxa2mWooFhtagUHQ+01Mvwfa20mCXnYn7ffaubGQ1tQavc8Oarot/6SbekeJ/c0y
	AMaKRn91+wnPqn1iBMi7jzAcpY40E1HxaTOB5/iek6n+t6mxqdBJ7V+Z9NXmKCjbQ7oChzjL33y
	MiCSvFTWOBVJ1sHb1045p1LufjLb4tsPXn5KVkxaO+1ooq9D9VltHdm2EM7IWtV7nEQfppCJjF9
	GW+SZZUcgq8GFErE/BARsSLVB9rO7Cux6Ixkq0jEG/8B4F7XF1riGkPkX/OCpDq2Sq07q70/xZH
	gr9y4bkBdf69x+6ZIPdHbl
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1a:8936 with SMTP id adf61e73a8af0-3c0bcc4068emr13266820637.62.1783680880360;
        Fri, 10 Jul 2026 03:54:40 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8572sm40752937c88.9.2026.07.10.03.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:54:40 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH net-next 0/2] net: dsa: mt7530: add EcoNet EN7528 built-in switch support
Date: Fri, 10 Jul 2026 14:54:22 +0400
Message-Id: <cover.1783680864.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EcoNet EN7528 is a MIPS SoC whose platform support is already
upstream. It integrates an MT7530 switch, memory-mapped like the built-in
switches of the MediaTek MT7988 and Airoha EN7581/AN7583 SoCs, but with a
true MT7530 core, four Gigabit PHYs on ports 1-4 and a CPU port at a fixed
1000 Mbps full duplex link.

Patch 1 documents the compatible, patch 2 adds the driver support.

Ahmed Naseef (2):
  dt-bindings: net: dsa: mediatek,mt7530: add econet,en7528-switch
  net: dsa: mt7530: add EN7528 support

 .../bindings/net/dsa/mediatek,mt7530.yaml     |  5 ++
 drivers/net/dsa/mt7530-mmio.c                 |  1 +
 drivers/net/dsa/mt7530.c                      | 56 ++++++++++++++++++-
 drivers/net/dsa/mt7530.h                      |  1 +
 4 files changed, 62 insertions(+), 1 deletion(-)


base-commit: fe3e786ef4eb6e47d2901f568a27bd920477bbe9
-- 
2.34.1

