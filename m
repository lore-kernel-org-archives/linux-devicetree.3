Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992298;
	b=ZfRPrP/XQeNIh/UfXt0+uQrTtBxeD2YN5S+X2erbbsq7HG4oR7ZsSXKSvz+wq0cNgUBY
	 mJkv3jiYfxlBKrx6hUZ+C+T7wKN8AnwINcyjRWCPax8qKUQo+WgOQJ1Ifi3nd5k+100l8
	 3iDj8uMLtrSnwdJUMWs7wNZj1G8DqFsr9WbdjjHztKJfkirxYUNMgwMKVAhvUEYDVRBCx
	 6OnqlTIVoXLNAFu2n3y86am8QRPng0JzgAlnDiQhxZyMWomOXVVpYVLghCP9sKHDt9oUD
	 mzdK1qArUQEXm3+A/iUf2yBOOlXXXrgL4ux0LLJqhpo/wyXppbyq6ZdfqKvljOHZD9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992298;
	h=DMARC-Filter:DKIM-Signature:Subject:Date:Content-Transfer-Encoding:
	 To:In-Reply-To:X-Original-From:X-Mailer:From:Message-Id:Mime-Version:
	 Received:Content-Type:Cc:References:X-Lms-Return-Path;
	bh=D3l2PQch6BsluJL94AQiUY8vO2xjRk9xx637S8ppt6s=;
	b=pebj48aiFz/HMSltXGFzhXREuKdhsfsfMTusOl2H4zxuLVNOT7z7EuYBhGyoolqknZqs
	 QL1T90GtuiRgWPIjXbXq/83TRov7gln9tEv1BdHpkz7+VGyUoIHeeAuMYz0/LcXB2+6A/
	 AJ6DeEYMF5LXJU5ziTaZIdwy/KyUEJoPkIx0tP5Ur6l05vCo16n/5V+x1PFZpZQHXS4HK
	 7aIE2nGFGcsQu4LYxgkiw1aW0VShbx/TDQYL+PSOZsmvSBdngw86kJB1K7gEkhicugZ7B
	 m+UaT3r817XqFQNDc+fC3J6LQOZ79N1uluzeWfM8z9+4qXfzazRF4gpz8Pg+rixA19A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=sTyGVX8w;
	arc=none smtp.remote-ip=209.127.231.48
Received: from va-2-48.ptr.blmpb.com (va-2-48.ptr.blmpb.com [209.127.231.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBF1606A330
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BBF1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=sTyGVX8w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992293;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=D3l2PQch6BsluJL94AQiUY8vO2xjRk9xx637S8ppt6s=;
 b=sTyGVX8wF16lZWjgjpS/ah9Xty9Q6CPwVDeTxA33OM56iM0ZT94Y+hXCmFkI8CG+a7+D9l
 EJgKX4LioXEdMLqgk/eDNctYlFpcwyqRWHWRgBhSrfVQ8cQWTIll2++6QDWvt/OIGHl6zh
 OjREZER1Wec2ixEHjJNiJb2oH+pFWxE6LSgzt79N4dn3OKME2eiiDM+RJWLYsIK7zskxzv
 ZJyiGAgTcxjWTZBSFVQ4FlHA2kp4WR3yl9B3wLSqxR9wMk8PPTx765DCMjxwgcPF4Hqufo
 p3sSSPv9zwhihfgoqzXNIoDKy9j2vfE8m9GQcndnpSlZ2xVMtuHIFnlXcSf0bA==
Subject: [PATCH 6/9] riscv: dts: spacemit: Add K3 eSPI pin group
Date: Wed, 18 Nov 2026 16:57:39 +0800
Content-Transfer-Encoding: 7bit
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
From: "Wang Yang" <yang.wang@deepcomputing.io>
Message-Id: <20261118085742.1817536-7-yang.wang@deepcomputing.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:58:09 +0800
Content-Type: text/plain; charset=UTF-8
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
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
X-Lms-Return-Path: <lba+26afd68a2+4e444d+vger.kernel.org+yang.wang@deepcomputing.io>

Describe the eSPI0 pin function on pads 91 through 98, including the
separate clock pull configuration. The group is only applied when a
board references it.

Prepared with Codex assistance from the existing DC-linux EC support.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index cb4f4f4e3..5bae382fa 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -11,6 +11,30 @@
 #define K3_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	espi0_2_cfg: espi0-2-cfg {
+		espi0-0-pins {
+			pinmux = <K3_PADCONF(91, 4)>,	/* espi0 d0 */
+				 <K3_PADCONF(92, 4)>,	/* espi0 d1 */
+				 <K3_PADCONF(93, 4)>,	/* espi0 d2 */
+				 <K3_PADCONF(94, 4)>,	/* espi0 d3 */
+				 <K3_PADCONF(95, 4)>,	/* espi0 cs */
+				 <K3_PADCONF(97, 4)>,	/* espi0 reset */
+				 <K3_PADCONF(98, 4)>;	/* espi0 alert */
+
+			bias-pull-up;			/* normal pull-up */
+			drive-strength = <25>;		/* DS8 */
+			power-source = <1800>;
+		};
+
+		espi0-1-pins {
+			pinmux = <K3_PADCONF(96, 4)>;	/* espi0 clk */
+
+			bias-pull-down;			/* normal pull-down */
+			drive-strength = <25>;		/* DS8 */
+			power-source = <1800>;
+		};
+	};
+
 	gmac0_rgmii_0_cfg: gmac0-rgmii-0-cfg {
 		gmac0-rgmii-0-pins {
 			pinmux = <K3_PADCONF(0, 1)>,	/* gmac0_rxdv */
-- 
2.43.0
