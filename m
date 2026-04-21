Received: from va-2-30.ptr.blmpb.com (va-2-30.ptr.blmpb.com [209.127.231.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF23638758F
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 06:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776753785; cv=none; b=MvtIpgZ348D6+EDpuIJ1aB9n5Lwh47eLCpZIr7K37PgsmpZwMpfMDqQgU7P0QpPQYi1eSvXVzieqtFqhI1L54WWsPw422jzRzg8AzFH9EAP1FxUSnX+qPBYpfbO2wXOMEMkeGOwevfgajwW/EEo7dcpdgMaxWwr5QOUqsihQ5FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776753785; c=relaxed/simple;
	bh=6SzyzgbDevNt76KCfRS1wR3MQ/oN93AyxLJkvLi31eI=;
	h=In-Reply-To:Mime-Version:Subject:Date:From:Cc:Message-Id:
	 References:Content-Type:To; b=Vp6y8PzLILCRuslejjl4hYrbPcvFfQIchLVBy+QSgqyT8Uunc0M2FMeUqhYHFcZDfk5kUskBCBfC631NOcQ+1KKP1R84ZRjSs7XpMZU764F+ArF2KTTZs97P28qXJ0aoONVW1dJiUTZLE6hUEAIutAY4iRNDsYi1D3iZP9P8wX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=kfN1Wm1y; arc=none smtp.client-ip=209.127.231.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="kfN1Wm1y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1776753773;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=tSL4bEWkpMYj5yOXHwmGIAfJEzPdNlEws+iI0QHUxto=;
 b=kfN1Wm1ysap3YxLdEQ8sLMek9mDHBIK2C6YSpYq8lBjewQLSjlkjst+N8p89KJp3xYc2Kn
 XXHVvWZGxpRc37nMR91xNll3yQbFum/DsEfxi6sHVIYPYUJAaUJ1ivBoUNAuWHua3GWxPL
 fXPiU0vtFG1OrGpxS3oO9Cpp3J36lKDgOJ1Ox0csvqeCAhUpJgUqz38ecx5CowmArPKhS5
 eZGTXl4lXhsc1BdfltWUPXMs0eIfKMaChBXnDjENWrMVQSO9MxvFLXYGc9oKdb8Q+IyXQ2
 Nq9QuwB0f5N4hyKpZZOC+k3Dxqie0LhxXI3hzgmfqBbBPhI7tSkxwRDB5Tw4CQ==
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
In-Reply-To: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: [PATCH v5 1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
Date: Tue, 21 Apr 2026 14:42:00 +0800
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([113.110.140.180]) by smtp.feishu.cn with ESMTPS; Tue, 21 Apr 2026 14:42:50 +0800
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, "Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, 
	"Conor Dooley" <conor.dooley@microchip.com>
Message-Id: <20260421064200.1582367-1-sandie.cao@deepcomputing.io>
References: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
X-Lms-Return-Path: <lba+269e71c6b+20a6bf+vger.kernel.org+sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>

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
