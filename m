Received: from sg-3-44.ptr.tlmpb.com (sg-3-44.ptr.tlmpb.com [101.45.255.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4764F9D9
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 04:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774929662; cv=none; b=rUztdMQuUO/A+8929GaZSZET8wgUbMAHjx+YUg3Dk1fAj90revbxyHeT38jDyJQ2ELuyJTzNad19Z1kPMWabgN4aMGn14ePeGG2/w2QHA2gTWr+Tn50cIbL3I7qX8jPyg39T58A0yvBbQLkiHuNPnaKgouu4e7B7LXNxUJ12xx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774929662; c=relaxed/simple;
	bh=MX6CzuviI+/EnFy0Q6mBW1NCykplXKMI8oP2t7QU72M=;
	h=Subject:Message-Id:References:Content-Type:Cc:From:Date:
	 Mime-Version:To:In-Reply-To; b=jVqFBgB1WI3T341Efi0vBO2huTYYVvC+oMRHg9N37r1aAeYBT9cJLXAKKv4LzpiJ9kHIdmMfLyTFYYMTMHUZpvcoScYQV84rrIDHG+otUSAXHIXiUZPQx6jerpertUttczLBDejYnYHU/ZCRo/zNK2I/7YEwHiPfJVSC79VNmlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=R5fjyXGG; arc=none smtp.client-ip=101.45.255.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="R5fjyXGG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774928756;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=8ZrGJtuUZUqfsJ/vLx0Y6+SpVnJ2IBWTOzQzaZB9Dm0=;
 b=R5fjyXGGdW5kOIffatPfw3VxatUWlKXgItoC58HBj7/fjaqPogxluulpDO80YOcRQ2i8yG
 17vWL8Uqxi4/cp6o/mQe/sfIUy3Wm0dxIBtr7/vLiSkZy0vMvDJIiyGMphbQ2+mVHaX+k6
 e/f11wjLA1eUHAkf+l0b+0ys1wpwC7QJP/6lY+4ZHSpWybrM4/Z/zvxG1Gqv8CQWC+sv+/
 NL4jFA9whJ10rPYQzSlAaDhiOnB9BkPKycvug6Rgwk9z1OntQVXbn3qNM/2aFb6/kgcJfl
 V2u87EJH49MJjyP+joJxUetxRTEEP2LfzFdfqyfM3VSxBAoUNbGsfkdq9e6VUw==
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Subject: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
Message-Id: <20260331034539.67167-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([121.34.226.213]) by smtp.feishu.cn with ESMTPS; Tue, 31 Mar 2026 11:45:53 +0800
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Cc: "Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Yixun Lan" <dlan@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"sandiecao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Tue, 31 Mar 2026 11:45:39 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+269cb4372+f1b698+vger.kernel.org+sandie.cao@deepcomputing.io>
To: "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331034423.67142-1-sandie.cao@deepcomputing.io>

From: sandiecao <sandie.cao@deepcomputing.io>

Document the compatible string for the Deepcomputing fml13v05.
It's based on the SpacemiT K3 RISC-V SoC and is designed for the Framework
Laptop 13 Chassis, which has (Framework) SKU FRANHQ0001.

Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
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
