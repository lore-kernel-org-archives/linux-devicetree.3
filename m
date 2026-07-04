Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7032264CA;
	Sat,  4 Jul 2026 19:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783192906; cv=none; b=j6+hlWk6TE+XKUr0YCHFEzDAjnS5elQF16JR8HpXwTze9jmd9S1ir9UtIqU7BLXJ5mrMbdqYuwwH8TzE+06V/jbrlMUnnb4bSnjP4hGgJ4T88qOUjqqz1sV0d9UQyVF/1UV65bHFmjUGgSrdGBXBdoH1RA+jmzPArTAz1cQe0KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783192906; c=relaxed/simple;
	bh=DrmEnoWmyWcxAHLbfs449WCtfzaKrN+jtcI2xYUq4jM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VF38d9Oas+VVjFb4ihq8r17an2CZEAbKM2t8/G63zDYt9dubUnOLvxIQGDF01yxki0GBkBIOefAPOExUxTZZ+oxrrZW9+wIht0aC0z+MNxYmibu99Xxj5sR+B/vOIRSCQTfStg3g80TvFy3hG6r5Zwyzi5gTdcQCoxQ/kfvJuIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2h+J/PX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2h+J/PX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E73C1C19425;
	Sat,  4 Jul 2026 19:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783192906;
	bh=DrmEnoWmyWcxAHLbfs449WCtfzaKrN+jtcI2xYUq4jM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=s2h+J/PXSLPoVCq5HoZTcJWZRH1TyzEPI1fBa+lUbkvKpeQ/NWU+exS23rgQz7aMQ
	 WpOVKdlRcl+UqJnX1PVFgWzykvpOWO6KwqSyqRwmHEoJj52Rk0nYj9OJi42o3n+TeY
	 8WIOBZ9zYUxytb+hjtyGGqWYbNt7qHipnHuGcdvHaXFRFB0FF9RgVS6RMqKMdrC46i
	 Q04QiOw5CUK4EpGPFNoorpG/p7iBzCGQfnF+ANTiI5/HkyLkCzcFVc6/MKS5G77cy8
	 OoHmT7YmCGh9uF/ABrS9Duz5rKQruZQZHlLFvAeLx5xrArJAS0czltsB/3OdRIG/+G
	 JxRPrkaXntVDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05C3C43458;
	Sat,  4 Jul 2026 19:21:45 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH 0/2] ARM: dts: mediatek: mt6572 DT cleanup + cache info
Date: Sat, 04 Jul 2026 22:21:41 +0300
Message-Id: <20260704-6572-phase1-v1-0-61c2fe6be19c@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqAIBBA4avErBNUMqGrRIt+xpwWFk5FEN49q
 +W3eO8GxkjI0BQ3RDyJaQ0Zqixg9H2YUdCUDVrqWlpZidpYLTbfMyohVTUZowZnnYZcbBEdXd+
 t7X7zMSw47u8CUnoAi2ZjYW8AAAA=
X-Change-ID: 20260704-6572-phase1-014d551bf7f2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783192904; l=1091;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=DrmEnoWmyWcxAHLbfs449WCtfzaKrN+jtcI2xYUq4jM=;
 b=nNNWxh6dknyQMeqBS+KrQhlN0NrksqTdzm8NiuX/by9b77T9D8qEXOtuC8k79UQS8ERkyIADj
 qgfY6gpSNb8CKCHewkxtdNFWWAFO1ei7BN4q//uqqMkR2wju2Q+JzwK
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

This series replaces legacy clock naming like uart_clk, system_clk and
rtc_clk with clk-*FREQ* equivalents. It also adds L1 and L2 cache info
to properly describe hardware.

Note that patch 1 doesn't break DT ABI. The changed clock node names
and labels are consumed only by phandles, and there are no drivers
relying on the legacy names.

As a brief heads-up, this series is a small part of an ongoing effort
to upstream mt6572 support. In my kernel tree, I have brought up clocks,
pinctrl, eMMC/microSD, cpufreq, thermal, DRM, GPU and more. I plan to
send those series in the near future.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Roman Vivchar (2):
      ARM: dts: mediatek: mt6572: rename fixed clocks
      ARM: dts: mediatek: mt6572: add cache data

 arch/arm/boot/dts/mediatek/mt6572.dtsi | 35 ++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260704-6572-phase1-014d551bf7f2

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>


