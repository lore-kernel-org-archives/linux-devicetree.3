Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22AE400E1F;
	Wed, 22 Jul 2026 17:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784741931; cv=none; b=BkiOLx+2VPgYkPref37j+ZKjmvfUYuuwUjtbv14ssnKD9P21Dwc7U2ECIx94CloDjZSiXalQTHxAMd+VutIn7xEXwGFytUNNrQLsigA23XZ/KwsA0TAFIjI7at9VJtSy++NsVZdHOF2k85SUg2xZ0bKndPo0QE5bWYxa1DsZWo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784741931; c=relaxed/simple;
	bh=P27/uQ3avp3hFWZ7znlC2u1zV2ko2s4cJ8bj8ppGrxU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ARrzrrmqGEbbt+ZGl/Q0/8tLIPE7eOvhAg8Q/H4G7YjLFMNuV+WjUfXFtIJWePC6bc0Gz4kk6ehhgoMZbhTgSCOse0NqqNDb2mB6c2WaV8NJ9v158VS7jQ4LiCwGIiifmiVJeTXwwsgc+pQFghOGrbxSyeZbLKhvCfibRtLHCGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com; spf=none smtp.mailfrom=mail.savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=IseksTU8; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mail.savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="IseksTU8"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 806C03D818E9;
	Wed, 22 Jul 2026 13:38:42 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id sufNt5EoTpUo; Wed, 22 Jul 2026 13:38:41 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7CFE13D818B0;
	Wed, 22 Jul 2026 13:38:41 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 7CFE13D818B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1784741921; bh=82IfGRfwQUy+YqHE63QJPXVtxZkG/OLQjwzCxqTVm8k=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=IseksTU8+uA2D31Qi3jXcX2XFdJcDwciFC7l9KO7VttYefRPanpG4eE0juqMCLrea
	 gua8Y4ofr98eD6ewXR4gfScylj7iXbpK2sUBkkks91zBWL7134pT5beDNNog4QkAft
	 zgKE1vbYiARPdjtwVrk1lRfmyIZoFxy0r786WgroFAna76aQ2sGhjVeKxh0bpD3UQH
	 XueA8jDiAlMoS/mXWX81FOqGhuSruJT5RWVbhMryshmk9jopebiTnH74fiK1p9zTLs
	 LdWR0EkxjBiR7wcsWXzB1CP6r2mRAn5IhA5ahujrXgS4Io8fb6/fYTjB5uI5UbCY6q
	 yVTWt6beHxQJw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 5OyW7eFRWMVp; Wed, 22 Jul 2026 13:38:41 -0400 (EDT)
Received: from localhost (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 3728E3D8189E;
	Wed, 22 Jul 2026 13:38:41 -0400 (EDT)
From: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
To: Jagan Teki <jagan@edgeble.ai>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Felix Boucher <felix.boucher@savoirfairelinux.com>,
	Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
Subject: [PATCH v2 2/4] dt-bindings: vendor-prefixes: Add DCLTEK
Date: Wed, 22 Jul 2026 13:38:38 -0400
Message-Id: <20260722173840.3576444-3-marc-olivier.champagne@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722173840.3576444-1-marc-olivier.champagne@savoirfairelinux.com>
References: <20260722173840.3576444-1-marc-olivier.champagne@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add DCL Technologies Inc. (DCLTEK) to the devicetree vendor prefixes
registry.

Link: https://www.dcltek.com/

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfaire=
linux.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
index b1af9deac2e9..640ce42d5004 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -409,6 +409,8 @@ patternProperties:
     description: DataImage, Inc.
   "^davicom,.*":
     description: DAVICOM Semiconductor, Inc.
+  "^dcltek,.*":
+    description: DCL Technologies Inc.
   "^deepcomputing,.*":
     description: DeepComputing (HK) Limited
   "^dell,.*":
--=20
2.34.1

