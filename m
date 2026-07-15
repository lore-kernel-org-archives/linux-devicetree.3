Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEB94418DC
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118468; cv=none; b=ep7wwgwzNmP/MUG5My55w7QBdynIw0JEt2Y1dgNa169p4vm1boUwJdIHbKox75GnNOSiwwDakgC9gVGtPer3mZ2E66ot+YcI+OcZ6p1buDVWDoAKIsd5ZL/j4x3N8rA9ju6bcKVUx0vqktfdCxGrWZNzTAYcZATqNuwUymV6e0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118468; c=relaxed/simple;
	bh=ptiLm+CNIzLah7x8+408IhZd1o2PQjYIBj4oQIDGZjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rGN90hYCu58u/3U81o/KRNhUT0CUu5oKdxrD736NcKdxbOvAb7x5CmgNHXQk5+S/JNfmhiADXNTishT4AK0kpGp7o5XyHkAsE3T9taFBBJGWsdBtwLVP9o7MM9WHn05w5YbyatwhYdu6VjXC10TAV1NA0HRAdRT7pk/5jzZU3Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=YkRNQIY9; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="YkRNQIY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1784118464; x=1784377664;
	bh=RIOQ5ssVhDJTh9QFgn+Z93atKpzQKchC8CMgcI3Y4aw=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YkRNQIY92kyjBcMCcut38dbE07qJmnxLK0U6+cMcQe7H97BddPATO0R8BngMOz9ux
	 HZsjoL6MZfrwyeijziw2FS+6W/aF1enrCspYWFmK7ssmW/6iJpbah+Lj19nON8/OAs
	 GSGV6zcpy57i7vhO6Yxf0IfAq5KzLS9bwQQ3HnWGihs7VliHKTjAynOSEjzZ8cKpj+
	 AFlIaJIE4vd3whLADq/W2eYCu6nyYopDv4SKGUw0fmfN4TsETDKS5vMehQaQyuNozK
	 xebtQsQgBKnaZqmPrlKk10xjPdzNFXd2ieIpiUTQnFbajUeIvPrSw36VYQ6Ln+48UW
	 js86WwzmZpCfQ==
X-Pm-Submission-Id: 4h0b6R2r5hz2ScN7
From: Esben Haabendal <esben@geanix.com>
Date: Wed, 15 Jul 2026 14:27:23 +0200
Subject: [PATCH v2 1/4] dt-bindings: iio: light: ltr501: Add missing ltr303
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-liteon-ltr329-v2-1-d18af55edab5@geanix.com>
References: <20260715-liteon-ltr329-v2-0-d18af55edab5@geanix.com>
In-Reply-To: <20260715-liteon-ltr329-v2-0-d18af55edab5@geanix.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikita@trvn.ru>, 
 Maslov Dmitry <maslovdmitry@seeed.cc>
Cc: Esben Haabendal <esben@geanix.com>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784118460; l=832;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=ptiLm+CNIzLah7x8+408IhZd1o2PQjYIBj4oQIDGZjk=;
 b=kgB8THF+7DbpOaHarimiW9EuYmwIJirucsg75le9fihKuA7JH+ltRXmozNqSwgDhiWJFbzzAU
 3FL9GNiz0PNCvDBT81DB4tQ/d9KtrzT6LQIVe5znwFwx9z+knzEe3l0
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

When support for ltr303 was back in 2021, the bindings documentation was
not updated accordingly.

Fixes: 7d71d289e1ba ("iio: light: ltr501: Added ltr303 driver support")
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
index c8074f180a79..ab9bb68dd736 100644
--- a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
+++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
@@ -18,6 +18,7 @@ properties:
       - liteon,ltr501
       - liteon,ltr559
       - liteon,ltr301
+      - liteon,ltr303
 
   reg:
     maxItems: 1

-- 
2.55.0

