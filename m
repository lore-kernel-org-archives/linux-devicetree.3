Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4EA3254B3;
	Fri, 10 Jul 2026 18:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783707647; cv=none; b=FnjDJ2tUzt6Fd9YMAj6rgmOeQkQcc/ffXrgQXc8UIPL4LcTBp4t8yz3wf3KnxGttWyw9qOamiQFGOg4R7hsU4QoqOPb0e2zhChnKcBDgoMaYGqP/Zi3DcqSrS+Ac9JFeC0ET8UCyyNb7S9temfh4qsnSv2VgjTuArGb8jViq1jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783707647; c=relaxed/simple;
	bh=NozzP4WIU6ME+FJLjKVkAfBhlev+BMMNfGoR638Y1cM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U3h3kGddRWQT/Imy5A1vTY6OjLOG3oxIIkSfT7iDomWY6Wem1ToDsk56SNa2L6D4rjKcQrMF+AnxQu2EDrur9vXxMpWsENIggRtX7eEQKy/2cymvizi6MXzYO1kEEnvGRhtYWFets3dBoEDElrbbCyBIQ2cr8EfJKsUAywVGDU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vdwF9NwG; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vdwF9NwG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 505E44E40D4A;
	Fri, 10 Jul 2026 18:20:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D9B560342;
	Fri, 10 Jul 2026 18:20:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0DDC111BD2C1A;
	Fri, 10 Jul 2026 20:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783707642; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hOZVc+0GwZ0qgc1rGj8TAPqIGL8UuZAY2qhVTxtTUTY=;
	b=vdwF9NwGG4UuqwdQrfkX5ygqUb7Wk+h2pfSv9JAdH864Ddep7rOuSQeSHc816l5Z4jR0ZC
	fAL0mJBi72dhZoZWv6e5UoTStWrq+BpSmt9NoZEcdRYJFv0G8RmoG/ZlaB1rvvZU64K2uA
	XQRJ8Vi4BftZfTYQdgzAXj3FMd/4B2g2Y6VJNuZFkj+NNWu3LuGx5ttTS219LR5yZ9+CwW
	vssoyUobX+N0I/mK39LO9dGljoOCh/ih2qh6AGDNrQItJuFcJvYhIm7hKi9xRbJzkL/uLs
	JXWOV/tx8YxbbLcgVAtVHVDKgm+fMQ3rgbpO0FiYLkdN/EPQKWA3tUZNdo/ulA==
From: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Date: Fri, 10 Jul 2026 20:20:32 +0200
Subject: [PATCH v2 1/2] dt-bindings: rng: Rename the title of the EIP-76
 file
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-schneider-v7-2-rc1-eip76-upstream-v2-1-4eab557b0e70@bootlin.com>
References: <20260710-schneider-v7-2-rc1-eip76-upstream-v2-0-4eab557b0e70@bootlin.com>
In-Reply-To: <20260710-schneider-v7-2-rc1-eip76-upstream-v2-0-4eab557b0e70@bootlin.com>
To: Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Pascal EBERHARD <pascal.eberhard@se.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Be a little more precise in the title by giving the family name and the
own name of the hardware block. Despite the original compatibles, this
file describes a SafeXcel EIP-76 hardware random number generator.

Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/rng/inside-secure,safexcel-eip76.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rng/inside-secure,safexcel-eip76.yaml b/Documentation/devicetree/bindings/rng/inside-secure,safexcel-eip76.yaml
index f501fc7691c6..92d906998211 100644
--- a/Documentation/devicetree/bindings/rng/inside-secure,safexcel-eip76.yaml
+++ b/Documentation/devicetree/bindings/rng/inside-secure,safexcel-eip76.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/rng/inside-secure,safexcel-eip76.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Inside-Secure HWRNG Module
+title: Inside-Secure SafeXcel EIP-76 HWRNG Module
 
 maintainers:
   - Jayesh Choudhary <j-choudhary@ti.com>

-- 
2.54.0

