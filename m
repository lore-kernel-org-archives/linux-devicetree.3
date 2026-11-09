Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195134;
	b=O7u4wSmQOPl0isJUJK+wVtY2fBCr5PWFP2/yzGNOAp8Rcw6ZY00vLrHftn1vEfybspeg
	 HMfO97KiVSIPwHtoQ/jC/OAWFnh0qyaMGCM0JXekJ6oTym9Ob1ezQafp0gfzWTOLdtuQX
	 OZxuurf8Bkq0cjnZW4aw/KG0IG9300zA4W+aW/cJajabGMBj88LXpLb8w6ofYapQh5atg
	 NbTDIkAM36DL/CLFllvVFZWq1PHiGjeb5QV5TiVQSEgmMB7ISeXMdOkfMIdpAB1ugskYJ
	 sC4TBpA0PMMpLkuggD2ObYnfSL6Wh+hludhwaGeC3+oZbidNqzZZYBGBZz6aFjnKzAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195134;
	h=DMARC-Filter:DKIM-Signature:Cc:Date:Content-Transfer-Encoding:
	 X-Lms-Return-Path:X-Original-From:From:Subject:Mime-Version:X-Mailer:
	 Content-Type:To:Message-Id:Received;
	bh=YzDaYCBdSlrb9LFHCCjVU8KX83BPN0Qfxpy4gBXOK+o=;
	b=0j/jthUvMidoOzRED5Dz70jLJaJfBL2pfyAZ6wpwiQdEjTh8W3JDd7AXtEhiQNuWqXn0
	 FCyiz5FsNVIaCjfU7Mf2d39zV4WvrE87dODH2t5R8X7xzrRpsTrBBjiUIG5b2zaPiM754
	 7ILYOECdNf9PxA1bN+QVcWZX+xdp1lyXqgpmcnE1QVyT3R0TfN5wnUcHx+W4wrJxRQiCN
	 vvFWP+xlDQ1w3b7+2SqOR/JoeaLz8CruR3cv7KsfnZy4/d1Ol74xARrXa8abwzZyTP5G1
	 5gxzMJr8cvkAuXBbVoUhceVEGSXYd/Mb+moZhpsyPwlz8oXaudPKwN6MLtOrK0dK5kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=kYl9hPpF;
	arc=none smtp.remote-ip=209.127.231.35
Received: from va-2-35.ptr.blmpb.com (va-2-35.ptr.blmpb.com [209.127.231.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50212606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 03:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50212606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=kYl9hPpF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794195128;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=YzDaYCBdSlrb9LFHCCjVU8KX83BPN0Qfxpy4gBXOK+o=;
 b=kYl9hPpFwylgWPLTAxTOj6YhK2aKXyXrU4rge4r//V97i7sO0zeke1ovogRjFGeQIKwEHB
 QotUmIDFSPtddnf6qPnVs//owiLEhtJWMwVwerotXCdonMczIpfY9mprGgS44lbQwpyO8d
 kX9Jtm1OWaXr+tA5F4Rl2Ne/Q8ZsoHFfsCc8h2uQaffYRMCg9G7V5cfZ2eE0tRKDs3UJVk
 Io1VbgVBknz9PFl3H0agzIxz3iuUQ51B9NfnQYd6mCQJ3Y/RIMR7/VH6n9gGhYNqm/BfKl
 qym7oid8lClkhYwwkvrSUxPdvbBXpukTHtD17XDH79LZ6QD6DJmy4hXH+4loMg==
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Mon,  9 Nov 2026 11:31:54 +0800
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26af13eb7+a0e42b+vger.kernel.org+sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v4 0/3] Enable USB and SD for Deepcomputing FML13V05 board
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Message-Id: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 09 Nov 2026 11:32:06 +0800

This series updates Deepcomputing FML13V05 Device Tree: Add P1 PMIC 
regulator tree, add USB controller and USB phy, Enable SD card.

This series is rebased on next-20261105.

---
Changes in v4:
- [patch1]
  - Remove unused reg_aux_vcc3v3.
  - Rename p1@41 to pmic@41.
  - Add regulator-always-on for dldo4.
- [patch3]
  - Correct Onboard SD Card comment.
- Link to v3: https://lore.kernel.org/all/20261102060012.100623-1-
sandie.cao@deepcomputing.io/

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

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 220 ++++++++++++++++++
 1 file changed, 220 insertions(+)


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0
