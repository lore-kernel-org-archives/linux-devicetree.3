Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAE31F4C96;
	Wed, 24 Jun 2026 13:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782308222; cv=none; b=k31MsSTyK5lHB2Rwu+Hocg9w+inNjuHKh0T2A+uaGTPfKgHft7TcDtW/fB2wp3rEirnJTmeDYdW8LfH31uu6LEYG6FdFRZAl/MV7V1RWcp/b/9cNdE2UvJqvr2Zs4uLW5vIpM1GFAgmColIfV/xOWkcQ6gdOS71mpmPFjxps6ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782308222; c=relaxed/simple;
	bh=DmNmk89jHRGF0HMR2bqWhqfTKrWxCqSJV/gZMZdMyz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lzZbaIsFS6BQxXliVSiGim47IpPL3KyBSo2gPVsq199RpdoLmW1Pz+Hr6ioMHy3yqooclsYtRpl+5h3xPDoMvavQn21CsyQhZX8HPkskXopiLiFVSDYfDa2wqDOQ3oiVgw9lrhm/wfsws+4k62AB2mNZPhTvmjLYmayr5wSzq4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHQTxJel; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHQTxJel"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B5001F000E9;
	Wed, 24 Jun 2026 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782308221;
	bh=CV0B6fPgP7Nr8Stw6KChmVD4qZfsxnWZMz7t7ypTqzw=;
	h=From:To:Cc:Subject:Date;
	b=FHQTxJel3r2tHMLco7N4iZNJ/4aycGp7Tw9Y+30NtTW+N+gI5a1HQfoJpZgCSf6Sr
	 Uz4D+/1jjNO60BhOA2AcIdakPwUgR93/tCDLZJGODK1j3fg/JsMkXFBDXcDj9gWQHL
	 g2aqGoa6f2aycHM62FLMi6uW0T+dqUofkpQQEha92krZMvSiyUMkw0CRDhZFEXR9d3
	 doqZMx/gXPMXJWEBN3jw+iAj5bcKdeRiV9y7q/aQIMuIohL+itZYRmHKFJiniO3dfO
	 Q0pmPkzR7JykDhCljUeJSUth+d5xMmMYaM6cwt0/j47l1XQO6BwkIN+jHEcO6ni6hb
	 ygHRcTiojhZcA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: khadas,mcu: Drop type reference from "fan-supply"
Date: Wed, 24 Jun 2026 08:36:42 -0500
Message-ID: <20260624133643.4146351-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"fan-supply" already has a type and shouldn't have a type $ref. Drop the
$ref to fix the warning.

Fixes: 39dd85d9246e ("dt-bindings: mfd: khadas: Add new compatible for Khadas VIM4 MCU")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Applying this to my tree and sending to Linus for rc1.
---
 Documentation/devicetree/bindings/mfd/khadas,mcu.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
index 1f135618e3b6..c6f91e7bc8aa 100644
--- a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
+++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
@@ -28,7 +28,6 @@ properties:
 
   fan-supply:
     description: Phandle to the regulator that powers the fan.
-    $ref: /schemas/types.yaml#/definitions/phandle
 
 required:
   - compatible
-- 
2.53.0

