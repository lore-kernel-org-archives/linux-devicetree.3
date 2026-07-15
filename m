Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1661444CACB;
	Wed, 15 Jul 2026 12:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118449; cv=none; b=NXFo6Jri5Htxx8tFamOH7DwnNaSr5PG8tKHLYvWaCo9q4XGtbUb5tqR/doDYcUYXcC/PhvqQTbc5zVLd4fnN/LjFGzjhdi8fd+wgZR6pFF6CnYq3kusy9OgkGHkGigi6IaQkqRTyZ4kMXfhoLEGoEh5IaAtJ5+JhPxkZuqJyoDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118449; c=relaxed/simple;
	bh=hB/I9eJaB/xboW/bbZMVV2HvjtWDaWcZod2NgtV30/0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iZWSuD/DKUOQQqere/o0ufPCJt1x3QdK57ZXc0ajFPL3qE3TgqP6D5RmXzTn49QenarBkeNeq7jSJ4IymZZcNRsEjVO8lqn9+7j+atGULT/QSiehnDsKjGoZBB8rKV6Ih/g9CSm6fmrpBdH/Jttu+9y5ejNfPjDtyLzpPsa7ag8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fcMJmw63; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fcMJmw63"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 978BFC2BCB7;
	Wed, 15 Jul 2026 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784118448;
	bh=hB/I9eJaB/xboW/bbZMVV2HvjtWDaWcZod2NgtV30/0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fcMJmw63jXUfHSiKDVjMIeyv9qEbba1pNZ/L6Ydo6oa/zFXan/fbJOJI4Nf6C6nsu
	 OBB90werzLziDvdYhain/ZTbLzOlUItFPwYRH1DVxUXRDp6k0Ut3ArH1uYFxxZ1zdT
	 JTXcUT8WFkfeknPQfejv87EI4spXvtQ2fsYekjN4P1yT9KXGQiDx8b2Q29iFdICZEd
	 RVdZviO8U7SQZ1yLb9wbR5hc7QdCBRwtlV1UClfylaXZQX6QwFmWClu60i2oLGa1xQ
	 Bg4CZTRYAQnMU4il4Fhw+iboz8mBJJgzvmSXxj/6qKPrPixzLYDh6IYyE1fKlH2t7z
	 lsV5PSwAv1gLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D32C44508;
	Wed, 15 Jul 2026 12:27:28 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v2 0/3] soc: mediatek: pwrap: mt6572 support + log level
 fixes
Date: Wed, 15 Jul 2026 15:26:37 +0300
Message-Id: <20260715-6572-pwrap-v2-0-bea1d801c81b@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Nyw6CMBBFf4XM2hra8hBX/odhUctUxkjbtFg1h
 H8XMCYuT3LuuRNEDIQRjtkEARNFcnYBsctA98pekVG3MIhcVHnNBavKWjD/DMqzQje8rKQ2nZC
 wDHxAQ68tdm6/HB+XG+pxLaxGT3F04b29Jb56v3DxH06c5aw7YKlko02N5uSDG50dFN332g3Qz
 vP8AVIFwRi7AAAA
X-Change-ID: 20260712-6572-pwrap-4c91563cfd23
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784118429; l=1304;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=hB/I9eJaB/xboW/bbZMVV2HvjtWDaWcZod2NgtV30/0=;
 b=lpeHefnwrjIMVXJgaICgAHb+yogf3oRzyhyhCQVJw1FXUjRJgttvmAovYuGdQDVlG5XyBGFUF
 AwcgFMsc1k9AVO9GNT8vzBemIV4fnWKWA7xmRlIGnqG1mu7UpidlbnD
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

This patch series adds support for the mt6572 pwrap.

All known mt6572 devices use mt6323 PMIC, which is already supported
by the upstream drivers. mt6572 also shares SoC-specific init with
mt2701.

Patch 1 adds dt-bindings compatible.
Patch 2 fixes improper log levels in the driver, improving UX when
debugging.
Patch 3 adds mt6572 support.

Tested on various mt6572 devices without any failures.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Changes in v2:
- Fix typo in patch 2 commit message ('Errors paths' -> 'Error paths')
- Drop unused registers in pwrap driver and use existing mt2701 array
- Also clarify mt6320 register usage
- Link to v1: https://patch.msgid.link/20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com

---
Roman Vivchar (3):
      dt-bindings: soc: mediatek: pwrap: add mt6572
      soc: mediatek: pwrap: use correct log level
      soc: mediatek: pwrap: add mt6572 support

 .../bindings/soc/mediatek/mediatek,pwrap.yaml      |  1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 71 +++++++++++++---------
 2 files changed, 44 insertions(+), 28 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260712-6572-pwrap-4c91563cfd23

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>


