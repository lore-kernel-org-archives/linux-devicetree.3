Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894237;
	b=Diog/+m/UpNPVm+XS/IuMDwf8rkEhuCbO2IZ9cbysiYRzYOWXxidiF65/qdtqNFpO/oO
	 W2WjjhL7vX9r8dhdcJYjMLmnBVnoXeIX+f4TsentsAG7mVInhooVI37mmqThWgz3ZAB5v
	 pZ/CfRg/OtR23lUyZJ6g+avCqDCGCkUeiBh+ZFJYcVTJgHVxrQ50A7q60WjaU4CkeS0cP
	 Iu0kg9Zv+Ia6dTl0MA5wamQRl6aXk2TxG2ZHZB3NNWFGkaxFBfKAQaX8F194P13bw61/t
	 ibkQH9q2D9bPtoRh2I9UwUDQ66kSlN0IGDpPCp5utoIo5oTGMAJYikWeEbBIZMsjt6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894237;
	h=DMARC-Filter:DKIM-Signature:Received:X-Lms-Return-Path:Mime-Version:
	 From:Date:Content-Transfer-Encoding:X-Mailer:To:X-Original-From:Cc:
	 Message-Id:Content-Type:Subject;
	bh=DsGLFo3Ah3ZqBE0pL0mtcci+TztznhZ6bWOpznuGZd8=;
	b=oyfg+gcb/EnJsOSArDkYsTQ9QltX8Y/uiH4iUZQSkrgY/s2jq9HepyYp5Tk1AEu7FS4R
	 Pqt7yJaCnVymvGe1ZMGZuuIbUKkfYDC629jkggtLDEO0tqL+euXrrDekWsSRmGS9ZploM
	 hYITU429neuJvOC0kM+ihdKZJBdXSZoZ7WHcfpyJbrH90Wd4D6OY0DuQZzp71mGNmRMuu
	 eEWg86dHNafabVcEaUoKFSkArCtdmB795eaQa2fE75pZgWarsB9iWijTWEQpBZc7pdVMp
	 xJOqokc0SlYekclTOyyIosoLmcVMrgo27dSkQjOWbDkuAnEtznCPbLbsSfB2L+is+GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=JDC579OF;
	arc=none smtp.remote-ip=209.127.231.28
Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58136606A333
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58136606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=JDC579OF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794894226;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=DsGLFo3Ah3ZqBE0pL0mtcci+TztznhZ6bWOpznuGZd8=;
 b=JDC579OFQHDMJLEY8/2cDuh+6kxCeH6CAuDCtZG/kNMcXsZG92uOASeqvqHvaNE0lR2ewi
 qSGfFaqDIGqA4vAioanyMjnCwyapoUDQzuJIOQU7RAtOfUrnAz2xbmCkd6/u5g6B+vfcIn
 dH9iLKb4DVF3iQmCjoBPnPSKBrgjlfSqT6NuHb2cNHmTeQEWVAvd4/zIIrT+GUun09Fte3
 dang5QLOaX8hNW+DDNYvJVhEgP8s4yF7C99+0Rm3p7sH6lDciMNg5BAtz8FM5DaY/rkw/a
 N0uNmxTGm4Qy9SU1E/M3O1tu9IoB704+dRQow/zwXLDwz7P+/qfmUGJ2nXpqAQ==
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Tue, 17 Nov 2026 13:43:43 +0800
X-Lms-Return-Path: <lba+26afbe990+6b1eeb+vger.kernel.org+sandie.cao@deepcomputing.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Tue, 17 Nov 2026 13:43:24 +0800
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.43.0
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH v5 0/3] Enable USB and SD for Deepcomputing FML13V05 board

This series updates Deepcomputing FML13V05 Device Tree: Add P1 PMIC 
regulator tree, add USB controller and USB phy, Enable SD card.

This series is rebased on next-20261116.

---
Changes in v5:
- [patch2]
  - Correct commit message.
- [patch3]
  - Remove Onboard SD Card comment.
  - Change non-removable to broken-cd.
- Link to v4: https://lore.kernel.org/all/20261109033154.361399-1-
sandie.cao@deepcomputing.io/

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

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 215 ++++++++++++++++++
 1 file changed, 215 insertions(+)


base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
-- 
2.43.0
