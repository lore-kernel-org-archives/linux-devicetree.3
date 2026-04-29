Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E053214F70;
	Wed, 29 Apr 2026 03:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434524; cv=none; b=sBiDT0zB7W7tfysAqdxkI74fBfU54QTGWidxK5q0jN26LdiUNkhSD79Zn+h9Hr/ffl4Zr1H2oIl6Cp8WllK1ZgVZ/J4xutS/hb+RExn2Mblrkty5Lrt84EGhrPHfGCImV3o6LWGAe8+CBGNz6hUZbD0+NjpJrMNRFnpVjDhWfmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434524; c=relaxed/simple;
	bh=+oJ1ks8LhQIlBS8pkKlAN5bFmRUW9dNc0+MA/8Zy+jY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+bK2TnPP1jgYDw8iApegoMsVhsLpUDaH05NCkaubgENSVQEtWhsmqWPi37uND3o1PGMgIxHzDtGYt04pZfuvOhJCxes6P1pxqYA9g7+vIRvRZA9wcAXLshiEIzHYkPKYE/HaMK8vlmpPD326gKWziwHI5YZZf4G/NA25l3s+pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wHvui-000000006Vs-3Lci;
	Wed, 29 Apr 2026 03:48:40 +0000
Date: Wed, 29 Apr 2026 04:48:38 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: misc: fsl,qoriq-mc: drop trailing whitespace
Message-ID: <20fb6993052534958ca57b537204de6c5617215a.1777434096.git.daniel@makrotopia.org>
References: <cover.1777434096.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1777434096.git.daniel@makrotopia.org>

Drop trailing whitespace from example.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml
index df45ff56d444..801f305e0374 100644
--- a/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml
+++ b/Documentation/devicetree/bindings/misc/fsl,qoriq-mc.yaml
@@ -166,7 +166,7 @@ examples:
          */
         ranges = <0x0 0x0 0x8 0x0c000000 0x4000000
                  0x1 0x0 0x8 0x18000000 0x8000000>;
-        
+
         /* define map for ICIDs 23-64 */
         iommu-map = <23 &smmu 23 41>;
         /* define msi map for ICIDs 23-64 */
-- 
2.54.0
