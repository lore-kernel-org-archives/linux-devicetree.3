Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61D6446831
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429321; cv=none; b=ozcywzJin6uusNEiU5kzXWdGCyfMx0PMtqxNsXiLdjH755qsKGKrh+GFlDQU4f3TY+yH02fguWD1tVset2lYrk/KvPA4w9JNAh4q/6lSKmJvwOSzytlJihNUhRQzNT2MpHozcA1YF6bueFhjq5BLjxeYU+PZQTAmNfhdsVmXKak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429321; c=relaxed/simple;
	bh=0bTfb/Ooe2V2jUcLmx5Y97xxWl4QvgtDbTIBdNYbIuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jHbJwfH4//JYPgXG0nt0RpmrgJgFHx7aeVeL3+RxYfMhbVUx8KtsNM7oe6f5GTgEVQbGtfHnLJyoLUNaCFB1edML7nkaF+VgpS3QOjkQ2jMqiXM6P0olBhLzpr3L8EKtPU0HBTfWn9804k7nXGQKArw8+SYuuX36+6y85Agb4hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9dN2Ed7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9dN2Ed7"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4758bd3731bso984886f8f.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 09:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429318; x=1786034118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+U3DZ1HplugeFRpi+HpxktJDAxC1H6qsK7+9CLEzYsM=;
        b=b9dN2Ed74D/SmDad4qrFZyrjr6bTnwTR+pnIAK9QKqZxQTxAY3wONJ2hLBq6we3xvJ
         kaEWfxN1C7KRiR1/LeV4crFGXlKlv5tPh2tFfhZ6SjpSOVaaGWeh62f+SIDI6zSXxM0s
         Q5GVWSJYZLdkqM3vrZ18ZkWbgG/u6Qz+7SS32j6cVQNFJ/p0Q/iAFE9SW7L4a1cqciaY
         oLiosO0KCCe6Q5ke1skj2TQRjyujiKOwkLkac9FhavcWH3b36TfcM5JjpWQsHL1WCbuD
         9nvCBZzBtHUN1fufI29dww6F0CngT+CJIRz7AaPzMqIiZqSj4uuGddAjZ9dYDowNiPcb
         nXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429318; x=1786034118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+U3DZ1HplugeFRpi+HpxktJDAxC1H6qsK7+9CLEzYsM=;
        b=VmaAxkwoFnsvSTzWOSYLzMXgT/s31ORklumgjgq6T5WCvYyc+tqylSQhgFJQc0MO87
         oF/z6sl3fs7csZSV6X/dF+0fROvAspMkLBdcfZXXomml/CKtzv++Vu5noyiMmfLWyBM0
         kyrmkCRfmHbJ1w8jFBd79R38LZ6jr/oH39/KGgZ1A/hk+XeQCZbjtxRZD8H0ip8rrzfk
         KZe3z6WD0KzIavp/hP0egHh51sFkD/Jqo7EEts5lUt7cela4LMUGEfO73GTrcpc3kSnv
         5YwFwunoiXnLwKofu2QX7butaL2rSHaHwkmXQaTJ0bmGKF9xb/lygZYBusWY+7LrV5P8
         G6+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqlBA3utUxsBE+vKfcfKf5U0bWZCqF776CTw1nxYRFxL/wZ9/00bVNf8BCu4AVMuRAPwaiKY/ZfxyAl@vger.kernel.org
X-Gm-Message-State: AOJu0YzIRu+AeCcTxVFvzmgx4gVrjVqTyzeo41eWA9BPlj2OEYouB5hG
	dhK3ChBm4fA+qTpDBBFj8JL1oCLJ979Pb2B1VDRHO1Q/v1vgV15lp21b
X-Gm-Gg: AR+sD12MXM6S+o1teS0f41JUvxdemA4sJT/yRUvD8dSZp++0HDE4QZH4ckVegPXEnAf
	QW7AY/khDh/45bqxH6Gs443cK+4eYdvgZeJnKUwclIpwMz18wFXpg0MwMDz61iDRt4YMiTEsl4B
	SWwrnnJdPhx0jHCrl2bKgMy/5UII5KK/f9CBzlNdlPGCN5p9FonwdMaRMYyezYFxebjQpb26eK/
	QPGQKoxshqwgF8gdXeMBXItOtgghrKFRPofFl0T5XNK9YOes2txm1SsdL55bqAYjModTKkKuCB7
	u403FLm2VtEvLiUMzXbU49wGvbpj6t452V4DGaMC7ZNPujMvyB7xIC+mIjZWEmmlZVOX+iCNrMj
	dXP4CGwqbH0SDlHMy9xQOyCDdI1OtTzscS+o5qGA1Jzsg2gjQgKkyw/qSGsyTu0meWGDV3RVI4o
	Tzwo6bL7Rjom45QQI2vLwCgv9qUXGZZkkN3ZHfeGqS7jsnNApiHskYPYULXVu3e3lUPk4T5U0ZP
	A9a+GevQJWzNg==
X-Received: by 2002:a5d:5f48:0:b0:47f:9208:9e4 with SMTP id ffacd0b85a97d-47fcbdcbf32mr1850867f8f.31.1785429317752;
        Thu, 30 Jul 2026 09:35:17 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm7758445f8f.22.2026.07.30.09.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:17 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Add RPROC support for the MX95-15x15-FRDM board
Date: Thu, 30 Jul 2026 09:34:08 -0700
Message-ID: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hi folks,

As you can see from the title, this series attempts to introduce/enable
RPROC support for the MX95-15x15-FRDM board.

For a while now, the imx_rproc driver has been using the reserved memory
DT nodes as the carveout names, which would force DT writers to go against
the DT specification's recommendation and use non-generic names (e.g.
"vdev0vring0", "vdev0vring1", etc...). This series also tries to fix this
issue by introducing the "memory-region-names" property and using it in
the imx_rproc driver to figure out the carveout names. The driver will
still allow the old way of doing things (i.e. no "memory-region-names"
property) but a warning will now be printed since this should be
discouraged.

---

Changes in v3:

* kept the DT binding patch because it fixes the ABI problem pointed out
by Frank. Modified the commit message to reflect this.
* link to v2: https://lore.kernel.org/lkml/20260605113621.1479-1-laurentiumihalcea111@gmail.com/

Changes in v2:

* change commit message of binding patch to describe why it's needed
* drop restrictions on the string names passed via "memory-region-names"
* drop patch moving the CM7 node to the SoC DTSI. CM7 node is now added
in the RPMSG DT overlay
* rewrite commit message of patch removing some of the RMEM regions from
the bord DTS - previous version was a stale version from first iterations
of this series
* change "micfil" node status from "disabled" to "reserved"
* add check against rmem phandle count and string count mismatch
* include "of_reserved_mem.h" in "imx_rproc.h" to avoid having to rely on
the consumers including it

---

Laurentiu Mihalcea (4):
  dt-bindings: remoteproc: imx_rproc: document optional
    "memory-region-names"
  remoteproc: imx_rpoc: fix carveout name parsing
  arm64: dts: freescale: imx95-15x15-frdm: remove some rmem regions
  arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage

 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  4 ++
 arch/arm64/boot/dts/freescale/Makefile        |  3 +
 .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 67 +++++++++++++++++++
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 ------
 drivers/remoteproc/imx_rproc.c                | 13 +++-
 drivers/remoteproc/imx_rproc.h                | 21 ++++++
 6 files changed, 106 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso

-- 
2.53.0

