Received: from mta0.migadu.com (out-22.mta0.migadu.com [91.218.175.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB5A3BB12A
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870022; cv=none; b=OMuF6HxAOBNBS4PUdyE11ps5EH76iZ7jw5OoOMzx1z4VfkYbwIKG35dgk4xPYNvx9lnku6BdZJa1/fUQ8NipToCk9Ww0vtjToMCIjmMeTW2F/KX+CBvMEF6Myfe9G6bssbzXrC8a2RsmT8PaD0nGQTJHGUXiBuvwKrKo/Al1B6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870022; c=relaxed/simple;
	bh=xdB/9KT+9W+e1jGR3r0MHV8vrXYNxD2NfzG/66HLEgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mnJ/485GmrY5PfSdjZBRZFlAmVU3YSKdJNA5dc4cLQnw9lqWxDeHqLdRSEyBkDA8Y0j+OncbpBQ07XeF4Yqq87meCUp/mLpOkrrmiXK9gncUvrvCoXuL3JhUGnRQV4dAyaNnI58QiENAFbVtHSr6G+Fp5hrr65i08hdtHRofelc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=IfVtt9FN; arc=none smtp.client-ip=91.218.175.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="IfVtt9FN"
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xdB/9KT+9W+e1jGR3r0MHV8vrXYNxD2NfzG/66HLEgY=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791870018; v=1; x=1792474818;
 b=IfVtt9FN8RM/eHJ06GsWzTHVccDzTJgCFvF2L0z/gcPSyxsvlC7B9sd3B10d/wOG3Jsat4lH
 ewlETooDnYH++0biyM6Gz6QjU1s4eg3Jky+HQeVJb1zZ9u2QQjyEDPjYH9els4Ht88JASUl3oJJ
 dRf+44QS53QaHjNHGQVHz9qu7pSs4+knq+/5xELmMV/JHoBVswc83wX4lCvPWKvQD4rAWx0WDwv
 PhxdD23Wz//w6aZX2EC1jgFkzIl1Ibnx6ji9cVrimKF4L9KPfYKq3YVgbze1/iqcEvGYYw1Du4M
 Y/wfthCT1HeNgR/ydh1/PXhNPWRTTALrNI8xmKrtSniHA==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c3876d7d6838b81e;
	Tue, 13 Oct 2026 05:40:14 +0000
X-Mizu-Trace-ID: c3876d7d6838b81e
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 12 Oct 2026 22:39:55 -0700
Subject: [PATCH v3 1/6] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-aw2013-aw20xx-rename-v3-1-cab1fdd050b6@postmarketos.org>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
In-Reply-To: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791869999; l=1243;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=xdB/9KT+9W+e1jGR3r0MHV8vrXYNxD2NfzG/66HLEgY=;
 b=xh7/q+cloxNase1lbGHIVTIOwBRPmaONQqWLxux6lHIRXbq8U62eTR4DKiPZ5cvPwm1ciJ1Cl
 qUVzA17d9nhDFtN9oOCWkUN/8h/1u1hcjnwQH1UrS5Hvr2qgMF6i/mR
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=

The aw2027 is largely the same as the aw2013, with the
exception of the way the max current is written to registers.
This exception makes it different enough to not work without
driver modifications, but similar enough to fall under the
umbrella of the same driver.

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
2.55.0

