Received: from mail.nic.cz (mail.nic.cz [217.31.204.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7D8331ED4
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.31.204.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459096; cv=none; b=sLaaNeLppPsi8inzrzoOtptGLi6BBUebf6fbZe3v2V/JNZF/8uEmKF2aYOtekwhd/zBB+eZcmz7kUeNXZdbMNuwCKRktBEF3r6cpKUlW5I1niTcIdjrXeyhw5kUNuAmr1DqSXsTzs+UnJsfcDsSOEWYuMjV1ROsKXspbnoOeuZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459096; c=relaxed/simple;
	bh=yxrolRGXwJlUdx6oC/k5Rv6p45cyOZtvvdNQ1o234bY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TL5uIfEBlXqchJPLm12Rrdh0wVRdRqUU/f7oBuQoyQHzSPwve7ZbzlN6fathoFC9sea+5xk+nuFt/2LX7VPfvbuuLK/2j2LcRtqm7NSPP+eCuY7UUT5oiZfYVvHVuuwQH/3RfMQhQYslJIoopjOrEYFGLQTqnUWOXv2loqXEt2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz; spf=pass smtp.mailfrom=nic.cz; dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b=eUqwuUDy; arc=none smtp.client-ip=217.31.204.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nic.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="eUqwuUDy"
Received: from sil.horo (n1-65-243.nat.suchdol.net [89.22.65.243])
	by mail.nic.cz (Postfix) with ESMTPSA id 85DD41C061A;
	Tue,  7 Jul 2026 23:08:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nic.cz; s=default;
	t=1783458512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+9xNDgwRjoYynAhldZbYuclfEP/ZyuKBV2opsp2eP7s=;
	b=eUqwuUDyhoIdF5E54+lKVoeiRidwSl/ZSwD/nrlWr5gToBFyqD08PVFAzp3sXVyGHvVDvs
	hGvzLjrBfO6cCe+ixkmkWIVj0tfysgZaw7aqyIuzoPqBsWhzAfWQZW0VtGKCUHHrWMF3RB
	gsuwcsF4Bhzr9L9ZShiyG0QA0ke1OLk=
Authentication-Results: mail.nic.cz;
	auth=pass smtp.auth=tomas.macholda@nic.cz smtp.mailfrom=tomas.macholda@nic.cz
From: =?UTF-8?q?Tom=C3=A1=C5=A1=20Macholda?= <tomas.macholda@nic.cz>
To: Gregory Clement <gregory.clement@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Tom=C3=A1=C5=A1=20Macholda?= <tomas.macholda@nic.cz>
Subject: [PATCH mvebu-dt64] arm64: dts: turris-mox: fix usb3 phys
Date: Tue,  7 Jul 2026 23:08:29 +0200
Message-ID: <20260707210830.3708-1-tomas.macholda@nic.cz>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.17 / 16.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.77)[subject];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[bootlin.com,lunn.ch,gmail.com];
	RCVD_COUNT_ZERO(0.00)[0];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:57069, ipnet:89.22.64.0/19, country:CZ];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	LOCAL_OUTBOUND(0.00)[];
	DKIM_SIGNED(0.00)[nic.cz:s=default];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: mail
X-Rspamd-Queue-Id: 85DD41C061A
X-Spamd-Bar: +++

After commit 00e6d608fe80b0f6 ("arm64: dts: marvell: armada-37xx: swap
PHYs' order in USB3 controller node") swapped USB3 PHY order, USB
initialization breaks on Turris MOX.

This regression was exposed by commit 91ddf6f722084383 ("phy: marvell:
mvebu-a3700-utmi: fix incorrect USB2_PHY_CTRL register access") which
made USB2 devices not work at all.

Fix the issue by explicitly adding all USB3 PHYs and PHY names to
Turris MOX device-tree.

Fixes: 7109d817db2e ("arm64: dts: marvell: add DTS for Turris Mox")
Signed-off-by: Tomáš Macholda <tomas.macholda@nic.cz>
---
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
index f4d73c8b1a6d..bd00e7df87c6 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
@@ -290,7 +290,8 @@ connector {
 
 &usb3 {
 	status = "okay";
-	phys = <&comphy2 0>;
+	phys = <&usb2_utmi_otg_phy>, <&comphy2 0>;
+	phy-names = "usb2-phy", "usb3-phy";
 };
 
 &mdio {
-- 
2.54.0

