Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096491;
	b=WttqhjAVc72sz+u+LMuoY4dULxet1F4DOj7p3KDpjI5fvT1xldDv2HBKDnAG4LWNAsMR
	 4GH3esE3tFQHL0LExw8VdYSkKgP6pALx4MgmKk0exwvs88HlpB56r2Dn/GNFFUikUQAJ2
	 83URiBPUShaSdc48y85/e6zyvagyoG2YqNDweRJm1IC07kPDCjBy44IJ8QZp4LOc8xA6t
	 DuracfaVfBdWSxlMH5c1HHZUap2i+TJZRdR/PLBGbkCFOLvA0vsn76G95x8lKTOhYoNz4
	 OUvwbAs/JZyD0m/uNT9j5ETOXPWSfiawlzLtW5351/3evHlv3Fmg5YPaeim8cvHF6Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kcyC89VcgJaq9jLzeow2xIThvgwDvibG6R9ei49uqAE=;
	b=hvr5et2BfJmjEocAiYNvcly3nviLG7NdlwsDOc3wmWWWptErSlpHnoVFFK7qcI0h8myq
	 Ca4TMWUBemk43G3rrTvygIaaOVw49mcajIFA27vekpXZOwzNiy2ID3ldbi5FPn7q8Ll/F
	 DIw9xPEC4KXnAqfTKvH62Qu3PH/V8lYW4capcsoHAxV/wShO3CZORtHC2/WbBhAl7hej+
	 OMcEFoCqibXpGtN+Bo1QI3h6X3GZw5OrLGE3LxradrQp1IeaHkepucm6jV+a6UhkAbPCe
	 CqCZR0UcY8XucVdUQN2SELXG8sKho17c5Rl0bBRPpVMflxkWvaGbJYZrPNZH8Xyp76g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=CzkbAfVf;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DC3606A32C
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 13:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95DC3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=CzkbAfVf
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4682977f9aso300568766b.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795096489; x=1795701289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcyC89VcgJaq9jLzeow2xIThvgwDvibG6R9ei49uqAE=;
        b=CzkbAfVfuTMH9DbWALI6+24aNSL410vewuZjg8g/iiflXbhSEOsVBZYEhDMPItk+cF
         m3qogGz44+uj4Xy3jSTD6cw8uBwULZd4ff/DR0Qq8erSuGAbphuU22CTgfppDb7poxMa
         kcZWvHoUCZwSeBoisZR8IiLmlrnlnaj22Q8uaLQl39qcOJS/DnsiqPlSUwG7O+g3MHTG
         jp5rmeHGevcqBDtP6/0teWStMtqH65EV4WAG8de2HgbHJfKYIwiOR3cLu+bF9byANmrm
         PbiZvMMBm9Z5DSfKlMCvzmKlN6DUZIUS0aJ3zrqKbe7G4NpPfW9cAVvuTmDZUwaT6GiW
         hGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096489; x=1795701289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcyC89VcgJaq9jLzeow2xIThvgwDvibG6R9ei49uqAE=;
        b=xNSqfh/54g7oLHdJEn9WIpoVNehonJJe5sXYAU0rWTy1nj+6P30K4CVGorycfCTKjE
         4/UJrMpU3MnlR+wt117QZcs9LsO3C9n+gcL1ez+4Gv9dSq9S5xF8RilFSylEdhYU9tSW
         AnTeXY+J+B4AJY9e8F7XHImfEw03bmyYpBvKP2Zhn5A/CrxiRKZMWAQ2yu/ztyn4xAfx
         RuKoUsOCS08L5/nHnMfXwfdVC2qGVr3VPzsZApiSbn9phW00lTHUQ9TuIahdImIHD1Dv
         B+cwbL3mrrZV0TYvMkkDmVZYseh9bkD7PzveBW9fL5elodNqlWdkJ0BIM+YNBmwpg9dr
         UrZg==
X-Forwarded-Encrypted: i=1; AL+hErHiXBlQtDmfN69DsSrE2H5Iu62K4xVdHOKJkLptlo51x9kGapkiBAywnFnblASJVKAJZnkQR51/RQV4@vger.kernel.org
X-Gm-Message-State: APuU4Z/YdI3jTPtc+TmSTcUI23ahOK+BKFUIKkoFFRQ1bAudICV85Rzn
	cn8LrUYPcSXW8YYQ6oHlgHK7uT+ZuhNUDP0bI/FIwsENPPlug3C3pmiiXJs1y/G1KH0=
X-Gm-Gg: AYBFou1iElrxC5Tstw4VkSLGAZymHfBESF8LlfICO7G0IiQbKUbwKh2PXPaMtSSJXvq
	Gijz+RZe6XX+O5YcWDXEUSRuQSI9Kab3JjoyJkWRwqH+PMwFRAQ2XysK9+s37BnYzj0YaPGBj1L
	x405OgPi+g8ZAGsxMF4Xkil3iysQYXUfr4lx+PYiWv6+U6U9PIZdMZkRu2NRoSvI+58Drb+ILxH
	pDm8CXHbmUQgE1djY91LoxOSJoBUZ9jmh84b6BvuYZE62I6ZPiKzuOwOgr99/L6VVY0ew9kK+qG
	89ZfO6Vkhcf1d5ORr5bKuolgMuv7ocbIW0hOjOiP0rQ4bvtzRPULuHpUG+Ztc6kEuBc4Am47+7I
	qDL3qPMbQbawexHngzlInHV0u7fEJANu8ewRa15DPZnwcZ9dEiUn1Fo75dPLQMyvfRsnCCGjKf5
	Y8QzDZqoDjTzTTRMHXVkvqSaAA8mB3sRRU/BOGXqXUFq1J2Sp1+BhqxGZW9BUHzDfrDVXTVhOrW
	epwi0wB0cuzwOA6Nr+yh81Dqx6sYp3EAdPmfjG0RiHLOChitWKopkJcrXB5eaH3uK90/ITgcjgy
	mPZaG7l1szBy/ywLC1jGkBNo5VYhuai/Ayrroyfk0SvzQijZOVH02voojEdWh6rImVXacWhjCRX
	OI1fa9wTJWXo=
X-Received: by 2002:a17:907:7ba8:b0:c51:638:7838 with SMTP id a640c23a62f3a-c510e4c7dd1mr563619266b.33.1795096489051;
        Thu, 19 Nov 2026 05:54:49 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4d02sm106820266b.21.2026.11.19.05.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:54:48 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 14:54:45 +0100
Subject: [PATCH v4 1/4] dt-bindings: input: Add compatibility for Awinic
 AW8695
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
Message-Id: <20261119-aw8695_haptic_fp4_driver-v4-1-9d107334bdb2@fairphone.com>
References: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
In-Reply-To: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795096488; l=1122;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=GrcvT5TdUs1hjWk2qQFIg31PeZXjjwY6F+gMZ6FifVI=;
 b=9iEGoh/iygzIfheMi0lAKt+cW6CY3GzwX02Jl0W5iSz4VROo5+c+FVG8va0LjQyfCO9k2Un/w
 1U9q7pnUdn2Ba8uA+xMr5SfcxXZ/wZoV0chaBuxb1PqjQEMKMTECuml
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the AW8695 haptic driver to the binding documentation for the
AW86927 and AW86938, as this binding needs the same properties.

They are not compatible though, because the chip identification works
differently compared to the 86927/86938

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/input/awinic,aw86927.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
index bd74b81488f61d72b675b5701b321b30b3430be0..58908ac4ca7964f63e392050aff5e15e836983f5 100644
--- a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -12,7 +12,9 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - const: awinic,aw86927
+      - enum:
+          - awinic,aw8695
+          - awinic,aw86927
       - items:
           - enum:
               - awinic,aw86938

-- 
2.43.0

