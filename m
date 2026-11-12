Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468597;
	b=j22NmqCdqET4JHudK88IRsT5PemgFUL4qp/YjDV/JGIxUChUfmX/I30SqTntEaumccO7
	 JoQ5+na5aSla1V2fSEYMHGMTHo8OUPIYTX7KwyUZxnADSTmdbbaF9W3d0KMxYsrqynIxo
	 19q05GDKxiYsVqRHvvMqMMgAd39m5HAd/yjDCu+n+nHIOQulxrDljRzvXVUT+mKIv1Ap3
	 2JpmzkLhcZtJw/wRtInMv53CvTq4fRxOSCNiYytFjwksYyWnk74XA3rWby6DGicmLc82Q
	 0DlqVBJDccoBl+ux6KJu46StbbQdGOCtzQPZHfKGEGzddOUfXXozi9YorlOgIBjl0cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BY8ogzTFjE1WMQglvfjtMG9sRYsnsNS31vRIHu7zQgc=;
	b=gvE5gpUbOLp7UUwYHyRfupDPkGWi1z71ywEbRXVM8pNcUPZJY0ZPuABjXRPBklUT8c34
	 2fYzV7MsmKIDYxXSorCLGE/SuxmvDLZ3aKV6vAzbyg0wvxpnf76CrVuBI7bXJ4Xlw4kL0
	 fc4WzqN+tCAwP39sxeygmeZYaJEEEjygEL5PEvIxFmudOZDHJHEYWg23St7eSXY87uTmx
	 9py0duLL4OgeUwtbzc5/W4jpy0n/XGqSH9lAe3lz0PrxWsdGvrBOQQXPK6shIJyqHTS2u
	 AC3fb8q38a/W8YWbIxEjUXzWnb96MYwlzEj387tEbt+zpokBnGnCZikjEsWZsGYF0FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=heOlUVDT;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BFD606A883
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20BFD606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=heOlUVDT
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214af2076so29436265e9.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 23:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794468595; x=1795073395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BY8ogzTFjE1WMQglvfjtMG9sRYsnsNS31vRIHu7zQgc=;
        b=heOlUVDTWOMZbiOj8L9eNeQJVLq5a1Wx2OCVR+d1Llk0fVyNvDJ759+uw7CrMYNCNV
         NfFTC2cqxZ61O5qstKefBLQ8iQ/Am10MHBSeYO3mLSGpvXSbHkJ+dYwZ2Kdnl8ks3tvJ
         xHN2HrS/7QVOac0rPROeJcxsgpJlRcn6CRNjQbzEBjrPBWONiT+NZmUfs/fq3T6dsA+H
         MY3f5hH7en8FDiMOjAVVO8gNF3ODv0vTu+IihRUpkBsTrGvrb/4Odup5ELNnM0F5rcOO
         uoglq41y9dpaorHKSh1LlxCHw0zdcxmkl64D3vSSwTPCkTRNRlZMFPweODgRjZMkUCzx
         VxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468595; x=1795073395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BY8ogzTFjE1WMQglvfjtMG9sRYsnsNS31vRIHu7zQgc=;
        b=bIFMMQOEQEspcSfnvKn375hHT1Wf1tzDWh9JG7eyRBHeTZzoyUbkU123v+hvpJuEM6
         JKa5CDO8VvCnj6j9LzgmhDHVm4q3frobEEcfzipiUrwDq9y0vh5lePgqynO6l0l8ss6G
         nxi/+OFzt3f0uPeU7fv/IAnKO/PjczBU5cGjszM1HSYIR9ixV9uVWi9ux2PEQ1po51z+
         JaZ4x3dx9WZzM895jqXbFlXVIH4hT+aAbsR+mXA6i6El2tRmrOrK2Fsbt9PK8G0IxJTY
         BxnracxsiQeLW1MneS7okkQ+o8ZCJqHCUDyHjfDp2OgWQdEvfgmxAdhbA4IAtql6bRTx
         uJbg==
X-Forwarded-Encrypted: i=1; AL+hErGz9oiyHADSeOqOPz5pdawMEAcv738bs0wxXWitq2EI5jzn+Zy+4ltpXto+KK47Lfk5iaPGCmk8W/U7@vger.kernel.org
X-Gm-Message-State: APuU4Z+QxxRRx5ok06d31dwmFbyVdMouTlmIY1DChsQ1wkEuw2H8EkE2
	61TNMxrUM78TFe5IOFAcLy+FyJ7FvwmAh2WcG4cAwrItm49HGQ9cPAAT
X-Gm-Gg: AYBFou19gvGkPK08OSfRPHXwS0ZTXpJQbD7Tpym4Lvox2ROzZmnKwVZ6uQBXzr1tsFr
	XkzsIoscFkaET+cFUvg+VtcaOHJgglL4yurAvY/bTNQatt8kjxWJiJ3KEMsIrgWYr8+46CYH7bC
	kKdawoj5w6po9bJBK6dUmztDuW6aXOKfIPjXffUAYIIoROkEUiGKk14h3FyfMB/QxaK60v4eyHo
	jro3CKLVxt41uZKszoDGQAqekQhAWvHT7OaxGzSsxx+l9OxKwnsRtfQ4MG5XEumMv4GensGAzHn
	BKogUgdrv0qzmNLSKjBaB6T67T/YTKhlh3byfrKt7tspylWBbfyiEP0vJ9FLnfl7VdXHRy6OYd+
	YtiUyz527CUGMQ860MhN5SJtidpBnIP9RqRx86kd8Lu+N9URLAr2F+xfOVMVbMafp5jv/ZECcEy
	6SGwXaR/Xl2ZAv3WEC9LvpBFcqCD/vRaVgXk58DlBsihaID0LZ0ncrcaQDuyzz4Ipn0JS5Ps6Mf
	NAO2wrV/xNyHZrmS7bSehoXPKNFPBhhWOx4TtPVeUkTQ9Imij+MK0SHuzgK7GhSxsAU/BTCdgtO
	4RyWsVoM+pDj9RDfVrtn9yOapKrJu29YTZM=
X-Received: by 2002:a05:600c:4f55:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4ba0938197dmr97544195e9.28.1794468595304;
        Wed, 11 Nov 2026 23:29:55 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951bf2asm81897575e9.4.2026.11.11.23.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:29:54 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Thu, 12 Nov 2026 08:29:51 +0100
Message-Id: <20261112072953.989664-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Russell,

l2x0_of_init() finds the L2 cache node by compatible and never looks at
its status property, so a device tree cannot keep the L2 cache off.
Patch 2 makes it leave a disabled node alone; patch 1 notes in the
binding that the firmware must then leave the cache disabled.

The user is the ZTE ZX279128S (dual Cortex-A9, L2C-310 r3p3), where a
PCIe read on one CPU deadlocks against an L2C-310 line operation by
physical address or a Cache Sync on the other CPU, and the board hangs
within seconds of WiFi traffic.  Running with the L2 cache off avoids
it, and that was suggested as the fallback for the platform when a
lock-based workaround was found too invasive for generic code:

  https://lore.kernel.org/r/20261110153522.1620088-1-isasmendi.agus@gmail.com

Whether the ZX279128S device tree disables the cache is a decision for
that thread; this series only makes the property work.

No in-tree L2 cache node is disabled, so existing device trees are not
affected.  Tested on the ZTE ZXHN H3600 (not in mainline yet, on top of
Navid Ghahremani's v2 platform series): with the node disabled the cache
stays off (control register 0) and the system runs normally; with it
enabled the cache comes up as before.  Builds without warnings with W=1
(board config and multi_v7_defconfig); checkpatch --strict and
dt_binding_check are clean.

Changes in v2 (after Arnd's review):
- drop the clean-invalidate-disable path for a cache the firmware left
  enabled, and with it the "factor out the number of ways" patch: the
  firmware is responsible for leaving the cache off, the kernel does not
  touch a disabled node;
- new patch 1 saying so in the binding.
v1: https://lore.kernel.org/r/20261111133930.3665251-1-isasmendi.agus@gmail.com

Agustin Santiago Isasmendi (2):
  dt-bindings: cache: l2c2x0: a disabled node is left to the firmware
  ARM: l2c: honour status = "disabled" on the L2 cache node

 Documentation/devicetree/bindings/cache/l2c2x0.yaml | 3 +++
 arch/arm/mm/cache-l2x0.c                            | 5 +++++
 2 files changed, 8 insertions(+)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.30.2

