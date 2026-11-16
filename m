Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819594;
	b=FPvwmZy5FP2DDngy/OrB4m+s1pQJ9j1NY13DdJJ4bHV1yUx1m+ouRNfTuT+lmrCGyh8G
	 aDP0QNr9CeqUVqAAHEmE8lADhFs1if8YcvLf2kJzelk5+HK9MU625a0LdSFeM6lAq18qc
	 rN+kr+9x0QkyaYp45PMqTTMSBvh3Se4gFZ6T+uDZEtU5dMWGDvFMpdoQhmHNhiNozDYxm
	 DaQfK3cOWCZ+QZI5PpLRAO9BUFnX0dng/Ew87eS9saDQUiKJNjjfeyC4O055VXjHbB1bY
	 GH8vlojhOrAfuDEMPpZTiQHmgtQMno5oSxG/bLImC2hQiYY8BDJwEoDdM5tZ0E2PAZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819594;
	h=DMARC-Filter:DKIM-Signature:In-Reply-To:Received:X-Original-From:
	 References:To:Cc:From:Subject:Date:Message-Id:X-Lms-Return-Path:
	 Mime-Version:Content-Type:X-Mailer:Content-Transfer-Encoding;
	bh=wDWEXwe8AW1hlFGCAnSTPGrmDVIAcZLcqbjkcavMCf8=;
	b=p88T0GY98FbHCn5d+Cra75EYokLWURCDpoKbiT2BK8vvpk8Fv1aklOWZ4JY+tLD0BGHC
	 bG2b2wtu88LUnHWplttjBxyubH7eklHaHqwkMr5dAUwGA4AuS5s/GqVxakMW7E/ngbZ9E
	 qKXN4LRd76EBFYPMmHg4DhR7dnAdnDwbLU9fKT1NObSupAHMeUAuLzhLRlDZXf5iATgzm
	 CLEYXFS1xQTdhNcdkAOJDqAPS5nnQS1+X4aoIE2y4CW1l3HXcXWAL/0TetIRWoTfIH3IQ
	 vuPwd0rMN0DQaSmHfjg5QGImQJFpOlQTOlXg+C9wUIeLSUpD5DQLpghNlMYeYG1hbEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=O6m01bgm;
	arc=none smtp.remote-ip=209.127.231.35
Received: from va-2-35.ptr.blmpb.com (va-2-35.ptr.blmpb.com [209.127.231.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07A5606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 08:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D07A5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=O6m01bgm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819583;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=wDWEXwe8AW1hlFGCAnSTPGrmDVIAcZLcqbjkcavMCf8=;
 b=O6m01bgmfEZFU5KAgkb5KjY8EU37KMR5hWcqe7Dm1ZxsCXTaqhk9y86XBrglVoxjfEBivd
 T0Aq+jbVf26vj/7P5Ilpc5oop4qyFWgNNYI6R9qLfhqsrzAFGBIsb9HAdpWB6/XiswIZeL
 Lg7WO/FgbNTDiKzepEQT07tuZNTdl6gWx680f/ODnq4mg966M1vRPjQvzjWYQH5vUDuSu6
 pd7TKv4b/LAvW1+LXp6TUGE7xLscSfN1xkBJgwuZo6KRNVdpRotj/ZWsz9G5Lp+8UfSQVx
 Ban8wwVUNqMSKbF57QZS5CYl9V3/P9Tx/g7AuvEFHmoi35nxiwfehifjML2xEg==
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:59:39 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH 3/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add rfkill node for Bluetooth
Date: Mon, 16 Nov 2026 16:59:30 +0800
Message-Id: <20261116085930.951304-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26afac5fc+7c7f4c+vger.kernel.org+sandie.cao@deepcomputing.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 7bit

Expose the Bluetooth enable signal of the FML13V05 as an rfkill-gpio
device so the Bluetooth driver or userspace can toggle it, following
the K3 Pico-ITX board.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index f84225cda1e9..8c12fd01227b 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -37,6 +37,13 @@ rfkill-pcie-wlan {
 		radio-type = "wlan";
 		shutdown-gpios = <&gpio K3_GPIO(35) GPIO_ACTIVE_HIGH>;
 	};
+
+	rfkill-usb-bt {
+		compatible = "rfkill-gpio";
+		label = "rfkill-usb-bt";
+		radio-type = "bluetooth";
+		shutdown-gpios = <&gpio K3_GPIO(30) GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &i2c8 {
-- 
2.43.0
