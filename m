Received: from va-2-39.ptr.blmpb.com (va-2-39.ptr.blmpb.com [209.127.231.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01D938F925
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 06:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776060407; cv=none; b=TWPr0seem1KpBHvR7/awFmb0k58Ajl38x5CLg2IjKSEnRUSvjKaHIzDmJtlpQBV2RnaCRaCOksTlECP/jjJoCGThqaEbvZ1//3bcunn0z2B78azwRjOBsjHIXpirwMmRXXxSpkeHoH2FTcbLH8wWXsjcg55QcFjSw0vApCuoLLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776060407; c=relaxed/simple;
	bh=6SzyzgbDevNt76KCfRS1wR3MQ/oN93AyxLJkvLi31eI=;
	h=Cc:Mime-Version:Message-Id:References:From:Date:In-Reply-To:
	 Content-Type:To:Subject; b=X2sA8uzO2QUTq9sYGZpn3dAOSMTCjP8S49eN6OeCoIf+no0TlkSujg2xpWpde7j/YlZtbnns91BKXzBZrSSwoEOerMSid7FpkNrQExZkBsNNxRgGJq2pRwY3L6TowaCPnuBIu/T5OHMlLQMQjP6i8ohysnY1vjaxqFKtZM4yB/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=r9u7ZQmu; arc=none smtp.client-ip=209.127.231.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="r9u7ZQmu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1776060395;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=tSL4bEWkpMYj5yOXHwmGIAfJEzPdNlEws+iI0QHUxto=;
 b=r9u7ZQmubnD1UdHxPMVTMopVGb/muQyTsYY7rUE6RU5HpkwFxDHiN6a7W+1/g2UyJd1O44
 RHEm4SOBleNpiI3Y/f1Kq4WR/oB+Jl+KQo+9EBAB+OQfVAL0xrn+2AtROsKkTjwUG7Fxf7
 RD+Ga5sEI3OcfycQxqlJy8XCDayBoCvG4PMgE7iu/D0xHULGEXKRlouvxwN6ggd8Rv7MPZ
 WqZcgUBzenDFjNchouHLbntgvRN5VYk1Us8SSrpv9x/4G5nvVSJ6cRYkv8CkvHdJRD9rAA
 YeQRKF+9eNsd1uPaoV6DZnhdcR4V0y3AWD87VHWb3wSCiXxwESkY3E3uI9txLw==
Cc: "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, 
	"Conor Dooley" <conor.dooley@microchip.com>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([61.141.250.238]) by smtp.feishu.cn with ESMTPS; Mon, 13 Apr 2026 14:06:31 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260413060616.1235999-1-sandie.cao@deepcomputing.io>
References: <20260413060524.1235982-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+269dc87e9+2511cc+vger.kernel.org+sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Mon, 13 Apr 2026 14:06:16 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413060524.1235982-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v4 1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05

Document the compatible string for the Deepcomputing fml13v05.
It's based on the SpacemiT K3 RISC-V SoC and is designed for the Framework
Laptop 13 Chassis, which has (Framework) SKU FRANHQ0001.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index b958b94a924d..af8030242bdc 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -29,6 +29,7 @@ properties:
           - const: spacemit,k1
       - items:
           - enum:
+              - deepcomputing,fml13v05
               - spacemit,k3-pico-itx
           - const: spacemit,k3
 
-- 
2.43.0
