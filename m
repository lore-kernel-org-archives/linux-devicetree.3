Received: from gy.d.sender-sib.com (gy.d.sender-sib.com [77.32.148.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678751DED42
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 06:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784184953; cv=none; b=HV4zYPXg9w4/iFgfIrNjlbrzRWFjtsWFN9WSVZuHj2xJDjPM0KqkaaQzqAgX3Y2XDxI50/Yp2XjKCL6o9BeRmFnVPCIE6pUDK3eS679NuXH2xYbP0GT2TI9y7oIVnMzuVZCYjP/x6kgk85hLyKd8jwRbDEOrJYYa/sD8q4ER2gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784184953; c=relaxed/simple;
	bh=1LMjw8mVlXizKoZi4xTAuqivkgnzv+CExwq9dc0kMwI=;
	h=To:Date:Message-Id:From:Subject:Cc:References:In-Reply-To:
	 Mime-Version; b=bM1znZWdRvX0bWuljwMhO3KugNpYu5MxpdKmpbySff1KQfCtfCFI7U+TihPDFrXs5e/oeWVnSVE7hlRXI9XV4bHg89mRONpPitEVkbx9slYtDb7TA7ifB0caccLhXCBG5vg5wekc9oGfz/0rtNzKoCM4wAC2r1X4o/3Pcaez8Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com; spf=pass smtp.mailfrom=gy.d.sender-sib.com; dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b=JR2KNA6j; arc=none smtp.client-ip=77.32.148.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gy.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b="JR2KNA6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
 q=dns/txt; s=brevo2; bh=7x6aERVipVHaG0xRD6KC0RgCFBCYOOqTbyO/Xpmab5Y=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=JR2KNA6jCWenKpm/5XOXS5LCXtM5X4YZ9jOI425Yf2q6B3i5Ytlkx9nZGT1VQDrbTMRkYX2yY9QX
        TglOsjGKHED6jdzTt1BG5e2Wmb3w2WmrNv+49TSZKDXqHufugE7vPVLpnkMxZ4X4BZpd8zrZvkDt
        hOQhIxjwf8vS9PeLh0+WCE11ud81FqPtDRF+qR+/1rwDTE/H5IspA7sHr6H6gmzcMSPXdLdQIKy6
        vPruukr3P8M3IQaHEMnZbTrZC6gaTd35kKEhAub9z1WbGrArPCpKQNNLmnndsx7YQgoALQd1YRq5
        krwb1MIJ2FjchISos22n391q4D4e0zvX3Zksmg==
X-Mailin-EID: NDg1NjE3NDAyfmRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnfjwyMDI2MDcxNjA2NTUzNy4yNDY2MTUxLTEtZ2FoaW5nQGdhaGluZ3dvby5jb20%2Bfmd5LmQuc2VuZGVyLXNpYi5jb20%3D
To: <sashiko-bot@kernel.org>
Date: Thu, 16 Jul 2026 18:55:37 +1200
Message-Id: <7453d80a-f448-4638-9a72-bb72e0aadbc9@smtp-relay.sendinblue.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: "Jiaxing Hu" <gahing@gahingwoo.com>
X-CSA-Complaints: csa-complaints@eco.de
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
X-sib-id: QoVJYuehfml-_dPYkq4jeyX8YrUyRj4yhwPc1LRDOF4frofEkLexzmtKZFIVCepNcCvw0BBxkhW_5F2wTbWZQRRE7HYFZn3vdrbye6F5zpmzPlE49iHCgILFFztCdvuga9llF9BofOH76q6ZJNfyAUKVfrEMB0VI5dmOFrI0DNw7g1dtD5ozUXw
Cc: <heiko@sntech.de>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,  <devicetree@vger.kernel.org>,  <linux-rockchip@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Origin-messageId: <20260716065537.2466151-1-gahing@gahingwoo.com>
Feedback-ID: 77.32.148.25:11677070_-1:11677070:Sendinblue
X-Mailer: git-send-email 2.43.0
References: <20260716012838.2353939-1-huhuvmb88@gmail.com> <20260716012838.2353939-3-huhuvmb88@gmail.com> <20260716014059.1966E1F000E9@smtp.kernel.org>
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260716014059.1966E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0


(Replying from my own domain; v1 went out as huhuvmb88@gmail.com. Same
person, I will use this address from v2 on.)

Thanks. Most of this is valid, v2 coming. I ran dtbs_check too; it agrees
and finds more.

> [High] Type-C DP Altmode configuration errors (SVID format, missing
> mode-switch, and misplaced SVID)

Correct, and worse. dtbs_check rejects the node: the altmodes child must be
named "displayport", not altmode@0 with a reg, and svid must be /bits/ 16.
The svid I put on &usbdp_phy is not in that binding at all (it has
additionalProperties: false), and mode-switch is missing.

> [High] Wireless (SYN43752 WiFi/BT) missing child nodes and unreferenced
> pinctrls
> [Low] The gmac0_rst pinctrl is defined but omitted from &gmac0

Correct. bt_reg_on, wifi_host_wake_irq and gmac0_rst are all unreferenced.
I will drop them rather than guess at wifi/bt child nodes, and drop the
WiFi/BT claim from the commit message.

> [Medium] ES8388 audio is advertised in the commit message but
> functionally missing

Correct. The node is disabled and its compatible is wrong too (the binding
wants everest,es8328). Dropping the node and the claim.

> [Medium] Missing vmmc-supply and vqmmc-supply for the eMMC

This one I do not think holds. Every rk3576 board upstream (sige5,
evb1/evb2, roc-pc, nanopi-r76s, dshanpi-a1) uses full-pwr-cycle-in-suspend
without supplies, and dtbs_check does not flag it.

Not in the report, but also fixed in v2: the fusb302 port node is not
allowed by its binding (the role-switch endpoint belongs in the
connector's ports), and the wifi-poweren-gpio pinctrl node name collides
with gpio-consumer.

Also the PHY reset. I had it as snps,reset-gpios, which is both misspelled
(the schema property is singular) and deprecated. v2 describes it on the
MDIO bus instead:

	&mdio0 {
		reset-gpios =3D <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
		reset-delay-us =3D <20000>;
		reset-post-delay-us =3D <100000>;
		rgmii_phy0: phy@1 { ... };
	};

That is the only spelling that works here. __mdiobus_register() releases a
bus level reset before mdiobus_scan_bus_c22(), whereas a per-PHY
reset-gpios is applied by phylib only after the PHY has been found, which
never happens for a PHY that boots held in reset. Checked all three on
hardware: per-PHY reset leaves the PHY dark, the bus level reset brings it
up and the link comes up at 1000 Mbit/s.

dtbs_check is clean on v2, with no deprecated properties left.

Jiaxing


