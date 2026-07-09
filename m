Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3A331715B;
	Thu,  9 Jul 2026 14:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607437; cv=none; b=dPkxnFhz3OXW1acaH7palhwE0gaAG+bz7tPwVYxt7YPNJA/izrOPu2KJvO/y3b/p7i0bF8f7e/UUP5WgSAnVtgN4RMwuZ+UJ2V9QvVXVHewEVdhDF9KY0S02jTQYUz+W4+jklU17S09bDfwlnd7ER8Lb+uifUBtEEioqqcuxgKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607437; c=relaxed/simple;
	bh=3EkOIMI6jj6hJQY/9ED/95LEd8x3WAPGI9Ft97GDTk4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YQBvzGwnhkrqFW9vjVtYu9/2KTtQ9FQ4kZfIOgpkTEdYeqEQbd+uPD+11jnqOSvPJZxT9e51jMqmXYAs4CzNNkIJoLWLarciShCwqZlK5X2h3TtaABDZNobM2nQPwjmQJTP2EJiiGKFQgOTEwh2MV+2lx6geBI6vzxvFOtsd104=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnNJh7xR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnNJh7xR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43021C2BCC6;
	Thu,  9 Jul 2026 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783607437;
	bh=3EkOIMI6jj6hJQY/9ED/95LEd8x3WAPGI9Ft97GDTk4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FnNJh7xReNJ6Zq6veB+fn3sok95DpBOx3gen6reiqZ860qL0fAUVxwLoJ8X/mPnqv
	 zTzkJRl+Fn83F4C9kP/eQOpUWyR8PW5kYAzNYOW07ZRicFSMkmSBz0bmAlcFLsbF8V
	 Mz7evhKOenGUCmAVGYK7W34OMyN8S6AMH4lNOC1XZ1ZSrYqRutqK37cCSmLkeCScQN
	 X6L4jOeYXDTZrSe7U7f54VwZASfxog4EldluHJsaYdAhEY6ZUUIrHQ7WrcB+0TnIGL
	 bjikFh91bHNI789Js6i68QxLpeK0P9ID4I+kCwB0Zlrnv8diZ7z5BJPm4bwMmcznBk
	 QhGg6v2rZh8Tg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21117C44501;
	Thu,  9 Jul 2026 14:30:37 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH v2 0/2] ARM: dts: mediatek: mt6572 DT cleanup + cache info
Date: Thu, 09 Jul 2026 17:30:26 +0300
Message-Id: <20260709-6572-phase1-v2-0-1fd4a69542ab@protonmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6DIBAFf8XsuTRAFNOe+h/Gg+BSt6lCgJI2x
 n8v2muPk8ybt0LEQBjhWq0QMFMktxSQpwrMNCx3ZDQWBsml4i2vmWpayfw0RBSMi3psGqFtayW
 UhQ9o6X3Uuv7H8aUfaNKe2I2JYnLhc9xlsXv/y7nEmRJGWlQaxcXcfHDJLfNAz7NxM/Tbtn0Bg
 HKFEr0AAAA=
X-Change-ID: 20260704-6572-phase1-014d551bf7f2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783607435; l=1253;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=3EkOIMI6jj6hJQY/9ED/95LEd8x3WAPGI9Ft97GDTk4=;
 b=LKMabow2Jen0vPcytxu5qSnJxh2GRgF0zsahhxMcquYC1MlSe7Z3JzA7ZLx1jLTcgtg1ESyS8
 3SXZe/GGgQvAPHY2x3S+OY3kqTskhpZl8XTDi67mtn0Lg9wh7OZv4qD
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
Changes in v2:
- Fix I-cache line size and sets (oops...).
- Link to v1: https://patch.msgid.link/20260704-6572-phase1-v1-0-61c2fe6be19c@protonmail.com

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


