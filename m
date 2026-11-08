Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174580;
	b=X3Cua7VI1XoWAcvXaTberVblO2TAKcC5L6CEJ541AGXiSPOxtR0TinI/GZi9IXZ0M1JS
	 uKrzemY77x6S8I9yNg58yjXtTUaI1iTgYTrzCvKNqug+Zw42++4i9uUbU6K/fNNuFTdNl
	 7LQBqOZOK0QmCTXj3j/tVEYIV4QzwhaUBeb+WoU4kJNyB3NK0aDSjrOrU5p1aJzppmKfA
	 huCeUuqa+c1CiaqDx3y90RTpc88wF0Ss4DpSC4O7l3lL9Gdu+WVnMYestyr5DKfIfT/Ne
	 LT4DXpigjHmqKGVfT/AQsNxeXP0ToySA8XWwydWgd+jHp0h2SAyjddyeQVkMjvmNDgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174580;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=3gRAP1YxlQCWGPap37hqUthvPeiuImlF2tdnQbsDgtg=;
	b=GqQ0C/lmvk7gxDOl8nseplSp+blFmVnO3O4CC0LPbORLVTP9m+hIAUdbbV6OX7OBMZdr
	 /st5Mbedfg6yiLisYhmPBst9w715VhzzusIz9nuq61Vn41alwd3LzabSEVjeHYEbaKjX0
	 R8j7K7Szp9wjNvLyZ4/cGWKUJRMikTGkGOIdcEJzvy+91nTHHJ84ayYZMveRyvTtTpz1L
	 BYU+eFvX//Xr3/eiFDkcg1dE0wXDk/ySCpBsIqtvtpSpm4+uYCXck+AiXoO8AhINcsKly
	 hqcS+ti02aQ4+Ezzgqj/zReRZdzoS/aO+fponRQ3amHlk+Y9gh7yo6lxrNghZoCvTYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=DPmEstMt;
	arc=none smtp.remote-ip=95.215.58.151
Received: from mta1.migadu.com (out-151.mta1.migadu.com [95.215.58.151])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63785606A333
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63785606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=DPmEstMt
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=w/6qEc2cwOI6T/xUHNJh3OifoyGO3FRpW1FATx28UoM=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794174577; v=1; x=1794779377;
 b=DPmEstMtjRJP75XGK0jU3H99b/kwySRpXknVFtHp0iwYU1/ABZ8uFcX514b/8cPt3sbvcmjr
 9KXWN7+ImblWVjXeAocUzJDgXApCjvsQVna4S3QT+VgyEk4J9pHMOeK4bBjEAmx5Xb4Sz25HWzu
 TszyeNrVFw2tf3w9MIgnpzaIK2y69AvywMhXQ1u04p1hZYfTxFrKywoehlggBMWLBR6llbwbyM2
 PuvSofRBvazxzZObKx1Eio1AH+kYw0tVt9grKv2Dma1FhYyIGE1OJujNOnGAVV7tRiTqGgmW9Xc
 okbkwOWz2YIIvwn76oNOB3inT2J+ZJiRMBh/CINjaOz3Q==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7783f211d67b9856;
	Sun, 08 Nov 2026 21:49:37 +0000
X-Mizu-Trace-ID: 7783f211d67b9856
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 08 Nov 2026 14:49:12 -0700
Subject: [PATCH v4 1/4] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-aw2013-aw20xx-rename-v4-1-826529beeb52@postmarketos.org>
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794174570; l=1313;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=w/6qEc2cwOI6T/xUHNJh3OifoyGO3FRpW1FATx28UoM=;
 b=vzfsl081FbFIiyzZnvCW2wCOy36hSI8+MO79cCOflVhL6CE5/pRgzXh4IO3i1Y+5/fQzRJZNi
 QJ7aOlLaHCJCDAcNdRM+kj/0an2Ikp5AFWwAbhSEQqb7PcSt/S+wyTS
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

The aw2027 is largely the same as the aw2013, with the
exception of the way the max current is written to registers.
This exception makes it different enough to not work without
driver modifications, but similar enough to fall under the
umbrella of the same driver.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 Documentation/devicetree/bindings/leds/leds-aw2013.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
index 26238446f2bd..1ad165cfe34a 100644
--- a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/leds/leds-aw2013.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: AWINIC AW2013 3-channel LED Driver
+title: AWINIC AW2013/AW2027 3-channel LED Driver
 
 maintainers:
   - Nikita Travkin <nikitos.tr@gmail.com>
@@ -15,7 +15,9 @@ description: |
 
 properties:
   compatible:
-    const: awinic,aw2013
+    enum:
+      - awinic,aw2013
+      - awinic,aw2027
 
   reg:
     maxItems: 1

-- 
2.56.0

