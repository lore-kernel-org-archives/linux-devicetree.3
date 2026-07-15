Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB2F47ECD6;
	Wed, 15 Jul 2026 14:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125847; cv=none; b=VALkoMfu3io0+fj2uKFr+4N0nU3I2fUyCPoL3EbOuC29KY57qDPCPprEsH5U75A7FfJniHK/ZEDy+hXloh2R+4Ghfjh4M3NcAU1QbtHXJTqzsj951ILzXyncEwrUMqAffzcz+C591AybiLNZrfWAu26+f4wiPq/gOxmVR02qJII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125847; c=relaxed/simple;
	bh=U4a0eEwRgxFtUxzDorP3YDS/+sPMrC9tNbuL6WM9UkY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rl5iXDoOxJWI576u5USaZV5plE6gqVcsivAtv1ryp7AFuHLMBCkPuloZ5AtmBThHm0itmQHnRHZnYmG3eQlYOq0fSafdepLzQjJ5MJO8ySgC4rmAA9O4oRXBoj73klJOv1XAw56yrYwIhQZuTNeNLVta1aE+AwcZaMFM0Z7drW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fOIOV+nK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOIOV+nK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5E2EC2BCF4;
	Wed, 15 Jul 2026 14:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784125846;
	bh=U4a0eEwRgxFtUxzDorP3YDS/+sPMrC9tNbuL6WM9UkY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fOIOV+nKlnlMTRRNvFdkO9exkl0d/p+6osJvqWdjw5yz7gZf0BoKR8RxuGaKlpbaN
	 v4WP73Rmbh5Nj2v52PJM+ABLBz48cNuVtYelQchKJsXkRykQOjUo62pvcgOC1MW3Sp
	 nYnkpptXQSGHca6Pz2/RHpHIZ+lsYtxdChuJFIciPJahTRBxq58lAi3EIH4n2LBGS2
	 9tg6THt4QK1nzqkxeaEmg0MHejzCxtp7GzOHAiY8p3r1ROAfna6sQzv+vxFHJ20jWB
	 FBy6qIOqZkCAAkv7aOSKBtiJ+zHexJ+6OSmrEVTvsTNhsII9yqP1UkBZX9UJ6ztvCH
	 Ks6naoRux9UBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FF4C4450E;
	Wed, 15 Jul 2026 14:30:46 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH 0/3] nvmem: mtk-efuse: mt6572 support
Date: Wed, 15 Jul 2026 17:27:45 +0300
Message-Id: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDVpK1VcRSyowUiUtIhEenfF8
 i3+v8GjI/RQJTc4PMnTaiNEmoCZWjsioz4aJJc514KzXGnJ7LngwrArC6NbnWVKQAw2hwNd36x
 ufvujm9Hs7wFCeABHU1ErbgAAAA==
X-Change-ID: 20260710-6572-nvmem-eb98c7a73351
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125843; l=1429;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=U4a0eEwRgxFtUxzDorP3YDS/+sPMrC9tNbuL6WM9UkY=;
 b=03XDj4hi0Z8BteGiFo8GSSj6uxAV07iQFY/V23QkS9yDXv+FW+Thcakqgd+bCnEGxdxAJuD3r
 sK2kJDP2RMdDslq6bbx10lP1zKvhvvEldIpD1RMySyPzY9jfcvnPmZX
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

This patch series adds MediaTek mt6572 efuse support. Unlike newer SoCs,
its efuse controller doesn't work properly with 8-bit reads, leading to
invalid data with current mtk-efuse driver implementation.

This behavior can be observed with devmem (0x10009174 and 0x10009178 are
thermal calibration cells):
~ # devmem 0x10009174 32
0x00CDD4CD
~ # devmem 0x10009178 32
0x0F76865D
~ # devmem 0x10009174 8
0xCD
~ # devmem 0x10009175 8
0x00
~ # devmem 0x10009176 8
0x00
~ # devmem 0x10009177 8
0x00
~ # devmem 0x10009178 8
0x5D
~ # devmem 0x10009179 8
0x00
~ # devmem 0x1000917a 8
0x00
~ # devmem 0x1000917b 8
0x00

Patch 1 adds dt-bindings compatible for the mt6572,
Patch 2 adds platform data option to use aligned 32-bit reads instead
of plain readb().
Patch 3 adds platform data for mt6572 SoC.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Roman Vivchar (3):
      dt-bindings: nvmem: mediatek: efuse: add mt6572
      nvmem: mtk-efuse: add support for 32-bit aligned reads
      nvmem: mtk-efuse: add mt6572 support

 .../devicetree/bindings/nvmem/mediatek,efuse.yaml  |  1 +
 drivers/nvmem/mtk-efuse.c                          | 37 ++++++++++++++++++++--
 2 files changed, 35 insertions(+), 3 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260710-6572-nvmem-eb98c7a73351

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>


