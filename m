Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883F63BA230
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865311; cv=none; b=G/iU8wpI6n2XBVFF8yKahYQHSuZmQcEaJnPfcML0n2vOznNNrUMxN4hE9JToBH0BRLOizQcMPppM9vma/hiipzcubS9ypbJlwA0YIGJMeRhogT+JS8dvhI7maSnaABXSkl0NlZcDuRbeacpJh9Z6HZR5MdyY9FUD6/5AbXLduE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865311; c=relaxed/simple;
	bh=coJo+wyCyOLPSa3hc2DLdwkR9SxJShL2EvFjaYMgdY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1PDvZZ44SlUoOgEqIvYtrwjZhuPPf3z7yMRQwedUfOCy3DWlxpb6JhapZUoHZ8A+u810zbOMeaqYEKMMMbcOAWNQU4a004i4n41lgRIkQlbYwP1EzAgKbgLIuqmTSAEOwUAtl9yvi3GZL3nTqePuNGMhrmiP9WOeDvIMlnMvJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nhR13fjr; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nhR13fjr"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774865307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xtW/e3RHjvQzSYv2cM9W8340szot4eVnjMaNVa56snI=;
	b=nhR13fjrE6nXnmaQHeTRzsQi/sS/qC0jraHsorfzxQPEEbT+OM2qNgZI7WJ65HAIJP1QOf
	gq5dNYuQ8IDARBoWBZNcDq5/2VJejRHehwH8lvSpf2w0oE/fy5JTzhZxHjeUGqxEC8UM7s
	OrxfITMJu/rrc8sCFK3iubRRtP7cfWg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Frank Li <Frank.Li@nxp.com>,
	Wensheng Wang <wenswang@yeah.net>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Pawel Dembicki <paweldembicki@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: trivial-devices: add atmel,atecc608b
Date: Mon, 30 Mar 2026 12:08:01 +0200
Message-ID: <20260330100800.389042-4-thorsten.blum@linux.dev>
In-Reply-To: <20260330100800.389042-3-thorsten.blum@linux.dev>
References: <20260330100800.389042-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; i=thorsten.blum@linux.dev; h=from:subject; bh=coJo+wyCyOLPSa3hc2DLdwkR9SxJShL2EvFjaYMgdY4=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJmnvNuZ+jxdT+veueE8yfnklscia6smbeu6ZdChlrDAQ MXXchpPRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzkyXGGf6q/ZF0bef4HVvba r5u9l7H+1bEFpZuXfljJ61964N4/xokM/8sFvhrKrT9T2KPwvOzWrGcsEziFO51ndmovuesl6HH QjRMA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add entry for ATECC608B.  Update the ATECC508A comment for consistency.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..9da4c73b23cf 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -63,8 +63,10 @@ properties:
           - arduino,unoq-mcu
             # Temperature monitoring of Astera Labs PT5161L PCIe retimer
           - asteralabs,pt5161l
-            # i2c h/w elliptic curve crypto module
+            # ATECC508A - i2c h/w elliptic curve crypto module
           - atmel,atecc508a
+            # ATECC608B - i2c h/w elliptic curve crypto module
+          - atmel,atecc608b
             # ATSHA204 - i2c h/w symmetric crypto module
           - atmel,atsha204
             # ATSHA204A - i2c h/w symmetric crypto module
