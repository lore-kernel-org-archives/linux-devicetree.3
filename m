Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484264;
	b=dUASYSBwnjUnplJKIh3/T2Tftw4sfsn37onIfJR2K/QeuojlIISMmxMqL6Nqn/tPL/VP
	 GjkIBUrS5JRO/9dVrTRbOTSAr1rQEQVtELCk6MIwaDv223VYWXZK3XRxUorEg+I5h3GRb
	 n/Dn1zw/HU647RPWrY6Ylb8Z+oK87BVFRUlJbmK33/nh7A8V1Ff56a2iDwP3jzbz4lYmf
	 fgzjysY2EQf/h0jGY1bCAxLIdgwdqyWLwnJYakJkHtE5UHHu6tRHm94rvct8tR5vxvcq3
	 oGxCG75kWoeDdTb1wk36R75uU7yXytEByHbAw29J0GTWmy91HvVNRyXbyPnVSAyfX2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484264;
	h=DMARC-Filter:DKIM-Signature:Message-Id:Received:Content-Type:From:
	 X-Original-From:Mime-Version:Cc:To:Date:X-Lms-Return-Path:X-Mailer:
	 Content-Transfer-Encoding:Subject;
	bh=cDtDx7PTZzs4o4nilnbUUjmgVNV0A2BPpv//8jccmfM=;
	b=DPMSGKg29U2I5S8ulO2HnN8M9U0FJDXlcIVvQoXbtzpE0J+WUrX2Lfjtc7A6LiGvzENQ
	 jJ4KkjSxuYBGhFD4xZIPQa2Wxg48jGDrsltDiwNC+0AKsxdp1srGAIZ1wvucBUYECLlzn
	 pvObNxNeKIQ58rog0to7azmkz2osjegLjxNmXCmqMDhy4X9re9OmoDEs16Cbx/FDiWMLL
	 cMXu6APyUYVbdK+Y2NoO6E+W1AmvT7N6i6WEeQs5Y7tMLGuPjnCBg5rVe2DjSyLtZIFg8
	 hPKMe8JmQahz9WlmWZXPP7G5M4Ibw8eBBuDJZW8O1mFRqlXLg/oRWIvzQeG6VgYvmRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=Tr96SZMd;
	arc=none smtp.remote-ip=209.127.231.30
Received: from va-2-30.ptr.blmpb.com (va-2-30.ptr.blmpb.com [209.127.231.30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3B2606A31F
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC3B2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=Tr96SZMd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1792484251;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=cDtDx7PTZzs4o4nilnbUUjmgVNV0A2BPpv//8jccmfM=;
 b=Tr96SZMdubwgbWVeTK8NnptZz/qukjGIm+DwyfIjF+WgLk8C3QZqa8bu44BAV0cUkUKQLm
 SHp4l1R08/SsyKZj9L32L1fss3X7wT6J6OwbPjN6fPp5o0kSqAsLlSdCs44E92DUVOmKUh
 Cp5vThtJUZ+QMRoU12q2p9gTcfGb+o1CrPyC0hJshbKZoneV/0NCq2c4OMx4WI6CUsel1Z
 4E6Y0hjVsU7DfRcKi9jwvlUIHei1PfALr2KZYyhcU7ZGDxalSHeMts7Lc5gKhCgsvgaeV5
 Yeq1aPfzZGErZMYMGSj/3HGrCPEJVPSvKgJY5hMySCfPXe+nS0rwY3SivBehMg==
Message-Id: <20261020081633.3673704-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([14.155.180.235]) by smtp.feishu.cn with ESMTPS; Tue, 20 Oct 2026 16:17:28 +0800
Content-Type: text/plain; charset=UTF-8
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Date: Tue, 20 Oct 2026 16:16:33 +0800
X-Lms-Return-Path: <lba+26ad72399+0b18e2+vger.kernel.org+sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 7bit
Subject: [PATCH v2 0/3] Enable USB and SD for Deepcomputing FML13V05 board

This series updates Deepcomputing FML13V05 Device Tree: Add P1 PMIC 
regulator tree, add USB controller and USB phy, Enable SD card.

This series is based on next-20261016.

---
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

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 223 ++++++++++++++++++
 1 file changed, 223 insertions(+)


base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.43.0
