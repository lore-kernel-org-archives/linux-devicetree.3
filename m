Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC5F3CBE7A;
	Mon,  3 Aug 2026 23:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785801016; cv=none; b=kg7XB4CVS/njQkGE9SKyY+3ln0a8XeOUVj0+rmfT8o/sKlE7//0qb1O1UiaZ5UlxizjJ7gVrrJDCz49QD+Sakqj8Ih2hHfFCl6pELwuWjINxvQTk1a+uGfPkn2Yb2tY2xokUuqTB01j+TFyVT+8vGtTWZtqk3J9P3jdVNw6fJxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785801016; c=relaxed/simple;
	bh=QB4+0hrVE5CLViaBG7l1TtGnXdcyF+FMaF/t4P5YnK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B6ZIGEymQi8/28oJ+OzWXFZ665dAiEFD01CFgCgc/92mshCuyBhBUUhxWLP8lacTmbSyqBm4r1SBTZboJZBmtN6IrOzu0pueW350aHP0PZrw3Wik0O08kl+P69ZFiINGV+E5qHs+9JnE9I+J8QyVIVd5ShgtdJ1AmlXrTlXxPC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=C+/jDnhp; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="C+/jDnhp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=QB4+0hrVE5CLViaBG7l1TtGnXdcyF+FMaF/t4P5YnK4=;
	b=C+/jDnhpBlG3rJ6eHnHrXsiZYBRXkTnlCyXQR5tj1iQFAF2uLO/QbQijhaQQDg
	TmafTQ/DVm2pQ3yjBs1rWaa6bMoIp03Cs6whKsUlpKOi9HS3ThIwXXhOQHgZFHkq
	ypu6hRiKhuI3Kl1zZCSLN0KArjBr7MRDYwuBa6oAcBk0s=
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAnoEvyKHFqO7S+Ng--.58495S2;
	Tue, 04 Aug 2026 07:49:07 +0800 (CST)
From: Zhyi <zyheihei_123@163.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [RFC PATCH v2] arm64: dts: rockchip: H28K: release RTL8211F reset
 before MDIO probing
Date: Tue, 04 Aug 2026 07:49:06 +0800
Message-ID:
 <178580094649.8348.12264215435109995102.h28k-rfc-v2-withdraw@163.com>
In-Reply-To: <1e8da54f-ef87-4d31-9a0a-17c0ff66bee0@kwiboo.se>
References: <20260803104646.26836-1-zyheihei_123@163.com>
 <178577533421.26919.15449256732994709630.h28k-rfc-v2@163.com>
 <1e8da54f-ef87-4d31-9a0a-17c0ff66bee0@kwiboo.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:_____wAnoEvyKHFqO7S+Ng--.58495S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF45ZrW3uFy8KrWDuryrtFb_yoW3Arb_Ka
	s0kryDWayvyw4rC3WrtF17XrZFk398CryxtrW8Zan7W3sxXFZYqr9av3W0vw17JF4Ivry3
	GF90yrn3CwsxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRE5Ef7UUUUU==
X-CM-SenderInfo: 521kvx5khlsiist6il2tof0z/xtbC9xM912pxKPMxQgAA39

Hi Jonas,

Thanks for the analysis, and for the pointer to your earlier write-up
on the rock-3a issue [1].

You are right: GPIO4_C2 is the RTL8211F reset line, so describing it on
the PHY node is the accurate hardware description, and the MDIO bus
reset in my RFC was a software workaround rather than a correct device
tree. I withdraw the RFC v2 change; the kernel DTS stays as the
accepted upstream commit 145d4af4b204 ("arm64: dts: rockchip: Add
HINLINK H28K").

I will follow your suggestion and add the rk3528-hinlink-h28k board as
a target in mainline U-Boot using the board-specific device tree, so
the Ethernet PHY is reset before Linux starts.

Thanks,
Zhyi

[1] https://lore.kernel.org/linux-rockchip/47d55aca-bee6-810f-379f-9431649fef=
a6@kwiboo.se/

