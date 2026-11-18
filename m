Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992307;
	b=ht7NQDHzGWdJAee239RTeBeOgfPwttK98eX15DlH9qA7lG8616NgcbLnlRf+/IDa88X2
	 E9RRcqlR0UDE/xEIOT8QsbwjuADBSNsOJ384kzSbwIP89zyJ28a88av7Nb5vFCFRMwqqC
	 p8qe4DVSIOtAOeWj2yRFTTyOFiRI1/4A3kfzNOmYfV5n9a1m3JCsjxSjJ9DiQX41soTWN
	 tQOn7j2Dm8ez0HjlaOcZJYqJFRBfseREv8M4oG9oX/ljksm2CjwM+/9Kt1DS4A9C17EOG
	 hl/DFdTG1Wuxkd8tVGo4fZVUcLV7VtqloHFmg3RG8fR+jMePKgv7B+83szLBPqd9BdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992307;
	h=DMARC-Filter:DKIM-Signature:Cc:X-Lms-Return-Path:X-Original-From:
	 Date:Message-Id:Content-Transfer-Encoding:Received:Content-Type:To:
	 From:Subject:Mime-Version:In-Reply-To:References:X-Mailer;
	bh=kEr9Wg+aGMoays9Uh761p22Cq/vcC6/mglbKhWQGwFU=;
	b=lzMm9R/2r0vxBR2IfyD0kzfRICyOXCUKepdBqUJgqmr3tNy/8O17zyykHyxahdMDHcU9
	 tsDOVnx4fZBdc1AhprFFhk834nQy9zpOoQszjPl8j6KhS++PD6Ffml8mrmrnEh7ARlbTa
	 h633lPX1BA9VTzTAMkf2eoomKz9FcPi3OAa1avnhDNu32cW8kr2JaFqICzYG3L/oGVdCF
	 +TY9gLh5i0Chqr1E/sY5pvYJiJbF5Ny94hC7bU+5lYGUOY2F2KOuN7XPgfrSAyr9wiam4
	 nVFLu2pGj9ls15Z3xDDDdh/1YpI3RuzhzR65vvHVgE9ff9yiD9zgRFyEjNqsjz5Dcxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=NT7Fwi35;
	arc=none smtp.remote-ip=209.127.231.58
Received: from va-2-58.ptr.blmpb.com (va-2-58.ptr.blmpb.com [209.127.231.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4933D606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4933D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=NT7Fwi35
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992302;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=kEr9Wg+aGMoays9Uh761p22Cq/vcC6/mglbKhWQGwFU=;
 b=NT7Fwi35WYG8eyjqbJshaEWz596512Btcq5FAovqfyWG4z9R3fBynpDhhAUJVSYkJSFWYq
 tQfxvAG1xUe0H1C5pq1f7J1TlzavnFd19gXQZZrdzx9CHyH1WjAG2CmlFfyUmlb+xiAIyP
 hPBj+7fSEoa0scvO1ZWCj/lnTqI4CJGEilYo9zxiL/EvWmhb/Z54+Ae67io5GkQpBCzY9f
 l+1WV5zGH6Cc0TxxPeqcY2y2xNpDUMxkuQVZWc0wJH0ztU+ruWrPb+MEqN3iLQSZEDGt4a
 8eEjgu80RzNAwWigtK+Kh4CeJDIZv7Gt5q1m4dPgX0UEERrhV9Smu9qQaWfzhA==
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Lms-Return-Path: <lba+26afd68ac+f19979+vger.kernel.org+yang.wang@deepcomputing.io>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
Date: Wed, 18 Nov 2026 16:57:42 +0800
Message-Id: <20261118085742.1817536-10-yang.wang@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:58:19 +0800
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
From: "Wang Yang" <yang.wang@deepcomputing.io>
Subject: [PATCH 9/9] riscv: defconfig: Enable the FML13V05 EC keyboard modules
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
X-Mailer: git-send-email 2.43.0

Enable the eSPI controller and Chrome platform configuration menu. Build
the EC core, memory transport and keyboard driver as modules so OF
modaliases can load them on boards that describe this hardware.

Keep all configuration choices in this final standalone patch.

Prepared with Codex assistance from the existing DC-linux EC support.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 arch/riscv/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 383fdd07a..1ddb8cd5f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -145,7 +145,9 @@ CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_MOTORCOMM_PHY=y
 CONFIG_INPUT_MOUSEDEV=y
+CONFIG_SPACEMIT_ESPI_BUS=y
 CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_CROS_EC=m
 CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_SERIAL_8250=y
@@ -277,6 +279,9 @@ CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
 CONFIG_PHY_STARFIVE_JH7110_USB=m
+CONFIG_CHROME_PLATFORMS=y
+CONFIG_CROS_EC=m
+CONFIG_CROS_EC_SPACEMIT_K3=m
 CONFIG_LIBNVDIMM=y
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_EXT4_FS=y
-- 
2.43.0
