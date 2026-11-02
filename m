Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599240;
	b=XA9dKf7E6Ikq22S1AhxzWYMq7QR9WBi1J8rdjRDSnTZEmqy2AUWuzSDVCm6FetnPTd+h
	 20Go+5lI11gJwyP72uaZTzzdpvT+Np/7IglHqPVmr+qa/4nZ4ZfCq5LUyeyBKeMLd4nvw
	 aHxOWr+rYbrK3+86PIAQ9kZq9VRd949JoZcXDOecrjTGrnMO5BRp4RGLyyvq4OicBwfCO
	 BgmPSLa65OUk3wqrhyyHciCmFeT1l+3TT9t3hJOp95S/qYpqoXmfWynUL7sjUV8xOU5hk
	 J7VvlR/BQeTXtMEBWcutlg5iG/R3B//vhk7ZI9+TYIT0dN6J7JGqb/iPVXuN24Nhg6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599240;
	h=DMARC-Filter:DKIM-Signature:To:Message-Id:Content-Transfer-Encoding:
	 From:Subject:Received:X-Mailer:X-Original-From:Content-Type:Cc:Date:
	 Mime-Version:X-Lms-Return-Path;
	bh=A/tLJoR6OHH3WDx1lVKoWYGKHOjQjb/b8PFhHuwJhxc=;
	b=m5nu9U4DJYTZTCc2/8DROAHHxrFR0ZpKAe5e7/BvUfFJyMc/J5VwgRBHJFhUF/SwyY9b
	 pdFPBUIvSwzO+h9ht3wVmLD/k6FGolZ1gburkaCK1kU4YQzbk0Mky6vjdR9zsJKVLcJ4G
	 ZWnQ0GWaYz0s2yNXvbp7vqoj3YmCcbrIYAGFPfqh283xwZ1jGrsEEjqPhfCqQF/ZmLrM7
	 Howg4uwFb8l60KfckTAOl8tNuBjNQvhjFgn3dyXZfp1Qg8Rct8JcfelnfLCb7OaggFmAv
	 Rut1V5CJZtT5DdUtCt8IAGM6pj2FW0hEAXlFuCeSrsmmSwOIFXslmD3OtOXMurKbabA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=bR1Q+2wi;
	arc=none smtp.remote-ip=209.127.231.38
Received: from va-2-38.ptr.blmpb.com (va-2-38.ptr.blmpb.com [209.127.231.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2719606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 06:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2719606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=bR1Q+2wi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1793599236;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=A/tLJoR6OHH3WDx1lVKoWYGKHOjQjb/b8PFhHuwJhxc=;
 b=bR1Q+2wip3R4vV+cftG6Aefo2ZxmNsw3LBK/1710zW1ch56BLdlHjjj0BNXUk2KR+SO8u8
 e9gOMIBVF+vtYNMrDNLOOBdTqYj7niLPQ9DjEYr06dZ4HTUoZdZrRA1ACdr2GlKPVlerrQ
 rENIItCeF2yC/Cs2sHAsbTBQ0A3tsjXzQ6Dn1PsYCyQ95RVrK20xkUICMzSjsc84Q+5bBC
 nfIxpmddiKfQrQWa7CYCAchmX/AUPeUdwE8FuabEfNWnW2Nn8fvix9+8JUgsKkWxur0fdp
 e6j180ki2Hd1ujmIU1nN1f88bdWN1jXNDgshbcVrfeJdafAQBs12tUljtO+xtg==
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Message-Id: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v3 0/3] Enable USB and SD for Deepcomputing FML13V05 board
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([113.80.9.210]) by smtp.feishu.cn with ESMTPS; Mon, 02 Nov 2026 14:00:26 +0800
X-Mailer: git-send-email 2.43.0
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Mon,  2 Nov 2026 14:00:12 +0800
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ae826fb+3693e8+vger.kernel.org+sandie.cao@deepcomputing.io>

This series updates Deepcomputing FML13V05 Device Tree: Add P1 PMIC 
regulator tree, add USB controller and USB phy, Enable SD card.

This series is rebased on next-20261030.

---
Changes in v3:
- Remove useless gpio header.
- Add Onboard SD Card comment.
- Link to v2: https://lore.kernel.org/all/20261020081633.3673704-1-
sandie.cao@deepcomputing.io/

Changes in v2:
- Remove usb3b, usb3c node define in k3.dtsi, it's already uploaded by 
other patch.
- Add phys and phys-name define for usb3b, usb3c, usb3d in 
k3-deepcomputing-fml13v05.
- Remove cd-gpios, use non-removable for sdhci0. 
- Remove vmmc-supply for sdhci0.
- Link to v1: https://lore.kernel.org/all/20260922110231.3426011-1-
sandie.cao@deepcomputing.io/

---

Sandie Cao (3):
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add P1 PMIC regulator
    tree
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller
    and USB phy support
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card
    support

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 227 ++++++++++++++++++
 1 file changed, 227 insertions(+)


base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.43.0
