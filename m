Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAF218C332
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779075290; cv=none; b=jfQonLW5abAwO9qaMAcIC4KfN6J5wFYBPfwKrDt3ZolAWVz+2hKNIGJX4EJihBa5sIuBISDFqXIxu3072fgoxzh7gU34jtqFnjBAnzegeSPU4pqOjhG/eM5AjpacdaCeJjX/m9/dCmS1HRg83TR/H3Sncb/2BfQX54Tspti0/BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779075290; c=relaxed/simple;
	bh=91fuNRLob879Bleyg0TOGl9eY+h+Xga0/8cpxy2fFXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gonDaBHORVTM4vj8XH8SPmLRSDrbZuJDb6R6vgaDuYYW4bFclou6PwijKoC/z9AsWAklXtLuHgMPDWchjpUjLU+Yy2oLZSzWAvDn1uPcMVBPyD7x1IAjpiWaYS/TnrZe2XJhBlydPa6S19MWLE73fLT19Y/5R050BZzC8BEsMxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cP4GUQ6H; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cP4GUQ6H"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c801d732058so604622a12.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 20:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779075289; x=1779680089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O4z4QeYZgLmQ+74XBWrLJRwdCJBglkAJbbIu6ajXqKY=;
        b=cP4GUQ6H9pM+WEbmJAP9JEFkwJbVEgFIXwCMvSSUfAGVIRkVT+2HY/vWZOsCs+dlOJ
         X7Y6rGiDqG07LKyX3meViHy22wDEFOdIp4m/bepBJwQl2jegZKhr8Fao2Q/EdfnfI4xM
         mNvdBYh40w6vIYNejR/JkcO5WKIU9nLbhPJrrSOlkK5zLyUPE5Rt6QK+tT5RVzScTTKz
         TB2EJrDa5W5gSXGaPbbDK0Qh61yBrtsntJJiAkLfvHDCqIk35q5e6isO5PTrMoIohpiz
         YG6ltM/QKjtYEYLSdXiPBwaLFelJNI6HggpGW7y264K6/dm92f2kmbhgICpQQyTfGmRi
         XtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779075289; x=1779680089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4z4QeYZgLmQ+74XBWrLJRwdCJBglkAJbbIu6ajXqKY=;
        b=BxrQaEAIThNn7RjKPVJPHrYXJdumVj+Bj9023ebnuoWS8sBBHg0oRx/+icPaG4Iqnx
         /R8wbiMuBB7X9gg64OV3SkRQ0mYxDiJXdBR1crnelZH1fUDOZsIEH4KVQxVTO/bxj0EH
         /ko9DlFSWH4zCy5lO5y4WVnZ91MCkg1mKf+nZPeXlbFTzE3FHEfnPaJBJN8+MVFahqjf
         73dHOqJMtTWfzwHRHCji0Ti3OOGuMIzavsOaasCs4oghMD+EQaY4y70+OpIP5F1mbzEu
         ZYkQ8c7zuJJLUXVQ88hHAhi1PCIBZ3C3UWaghFQpN+yNYUSlv/aAL4yiOdWGog33gGOD
         VA7w==
X-Forwarded-Encrypted: i=1; AFNElJ+nX+S5/D/BG5Wp1pulXNTPA0KqIxJlgv1yTUKnT41U0qtNDFAsZQ7ylQ1jp8FR1BLoFUQcBZD7AGGC@vger.kernel.org
X-Gm-Message-State: AOJu0YxMLwtXxsjE0d4mHLwSvJe7SLbEsnA8MiD6aZFcu9Q+tU8j19Cr
	9kYzupVweqdodyR/7w+Xm4eSqC1A34bdwRz/1hBkZXwQDr3EzHk7V3On
X-Gm-Gg: Acq92OFoBcF26S/m4tbFXfc9Wu3ESLwxb/8mE4YXuyEhDyR01vkS64gNf8QSzUyWWha
	2Lphu7Z7AsZDyR4RK6JCG3hDT/BXQmPZx4+/ALdG7/tf5ja11wC9pZZK80O8MpdwPXVeEWrrf9N
	30PlmLMwpISleAAii4i+T/LQjLGGMKWNko5SK2pajQiejS5JJBx46QOqinci802NywzuZ5BHOJF
	cCdP3CIOvMI4Tfe5OKMBh5XX+iyr18LXFRWbdKlNDSgbslM3R0dGiMMo1+5gNUP54XeuGIhgIAI
	kpZHQy0rJlxalJdaGzMbvxKfdlR5zCAFxU1mx89CSsMimg1gE1tzo1/NBbCmxhl8ZOP/DBuCpKI
	Z5mQVzlEF0PbMAeBkiX75fnFh4aQS81moWgG0lAR1aHxm+hi1i6ByTFfPVjwHnxy98wZlZ/y85c
	tOYYcxZsZHwCMfD1Dr59KOBtN4ZHYlk2djvVx0tuiG
X-Received: by 2002:a05:6a21:3987:b0:3b2:8674:9830 with SMTP id adf61e73a8af0-3b2867498e9mr3029580637.14.1779075288739;
        Sun, 17 May 2026 20:34:48 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.201])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82c4031662sm11183717a12.16.2026.05.17.20.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 20:34:48 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v3 0/2] Add ASRock Rack B650D4U BMC
Date: Mon, 18 May 2026 09:04:38 +0530
Message-ID: <20260518033440.17569-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial devicetree support for the ASRock Rack B650D4U BMC,
an ASPEED AST2600-based server management controller.

Changes in v3:
- Reorder board DTS nodes alphabetically by label.
- Clarify that the management LAN PHY is an on-board discrete PHY.
- Keep MAC0 phy-mode as "rgmii-rxid" based on the extracted vendor DTB.
- Keep flash layout unspecified until it can be validated on hardware.

Changes in v2:
- Add MAC0 dedicated management LAN description with MDIO PHY at address 0.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |  1 +
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 71 +++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

-- 
2.47.3

