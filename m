Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792878282;
	b=hZWbaz2zSYxrOOYERGXoZtax67Xpp1vt8UHb2zYMJvE6lCz0pbanwjKHwhmK83/1sAKz
	 MGgHAsb0DBVZAdPJgRdpt7rjwnKLX38x8KWGdRUOo688JhiB32Bu3RbzHfXYgTfPigBlN
	 2g3Szfv58X4hN4wU6NLF2/46FGR+zG1dcmaMu6IyyHpYtwjjCzxI6afylPIq2yNqGqnKK
	 /dn479CsaBOahHgTVsJiIFr4aviiBJWtIoKC/b5ZiUlPJT8RRyF5SaiDnlSWFi8nG2iOO
	 /X2+KDYnlXJCOICa0rKMdtHdEb9TvLE0EdA9ipt9WrZ74aQidgMfl7Wg+SuCrb8CpEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792878282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lk9d/Gl2nz5jUnyw7wF4SHbFvcIOShutZg1r9yMeJ9I=;
	b=YebLUbbveH/F36GJA+YL6qLxnU5NaphGUiwYfb2mOf0gFfEH6FMXk/adByysyLtxs1+U
	 Lp7tOlDBJMxKEhvJGWOMeVj5reqC7vQAcWxqaIX04bxXm6g+1N/+/+Mn3IiPu45yp8Yge
	 HqXYuIEUc6upSWx3uNTEy6MdWN3dFwZHlq/7LqksUHJgo9Bcb+lGh755J2durwVs6udOL
	 mfbx6Qi/03ijZrj501jZB7JcBvlIYtF5oPRNyenCnNt6yw8WV1MUdvHEXXhQeq42QG7nE
	 GJoQ6vV4vNepf77Ei/w+JU5QSGI+z2ocCKm6AfSDCnlNd+2kv368/QI/VDFQnKMtXQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oRnWTIP3;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71824606A321
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 21:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71824606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=oRnWTIP3
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso17723065e9.1
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 14:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792878281; x=1793483081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lk9d/Gl2nz5jUnyw7wF4SHbFvcIOShutZg1r9yMeJ9I=;
        b=oRnWTIP3mjVegydXsW85+Os3bvWZNyu8xPVPw6LmUM1nvwSIfLCyiKpn4SWc+W0MNb
         hRVASTt35mwM0FVk7kS6c51IETKt4jBskIa4N1OcwXcG/DcXjQucVqpomv73Vab+RzJi
         rfCFeKcDHKNOKNFVM7S5QRgDvrx3Wz2ZzCLHhiIhRemDKXppwbIzdJsDfmbkEFJUHjuw
         EhSolui+3bLtanZozEkk4eu7afXguEuErlFnCZOWPUOTUjYy4vAlmQZ0omvTyquVqZEi
         6kiYKFBY4gHdwRK93LHIhHbOWMvCTIAULOLVKGcQDFDU7L6W4CJ53jW01fo3ge+xEn3r
         6BGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792878281; x=1793483081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lk9d/Gl2nz5jUnyw7wF4SHbFvcIOShutZg1r9yMeJ9I=;
        b=kE9f3V9ZoPl/Ryufi/HHvgUjXxuT6oukprnb63L8NWQim1yWUdaKpon1+WPhZVjpZ/
         plrP1M7ktkV5wJjan9QTfWD7WHXmnk7Whodyz/7o1iCuraXq2/Tlzh4P+Kv4gJadMB8J
         OL04Nx/gwaR8dvJjtIp7f84vbhm/AiwsY7VbCP2s/bZPIllAH9rf1igA45o7EveLv8MS
         U03APIsTxDF34vcUwOmFu8ELvUG2EbAnezLkbH29gEKXDXyrhS9oF+TDfP1b1+QjP1eT
         ACil4eISzEPJ0u/HOjNvRT/pEotduwdnxq9ho1GW06EpIs12tDJ5p/lixdariQAE/iOZ
         Qcww==
X-Forwarded-Encrypted: i=1; AKwUvBymoQ1B8vzgKjK15RcSMojrGgbluBqMS3EOLH4Yot2L6gzhPMb0Rmmh0EN1jBSq+H+U/pszNEn2V6ak@vger.kernel.org
X-Gm-Message-State: AFq9FYL8svrWKnaSrdaztP1bwYQMsmHqzkpWfYPpwSbq9thlDoFxhApe
	ch84bpaoCRVmCyuiDSRDLQLQlWDu+Aono6c1a5RxeFUYG94xi3gjHt6YhfsTRF1br/4=
X-Gm-Gg: AYBFou0q25pXUJEAFuFfA5efXys8z1WhC0jpRxvS1Lo6yS9ISXO+ELM/RPCcYNth73j
	vLk9fgcbKx2lTR2LwIy/TZ297fjsNIByIDzf7gIIk5bh7zDoZCiHx3StF47Rx0MujNHeOYcO11P
	zDqmGUFb2v0nInx+w6JGhHdI+tdYSaJeaa3Y/nio8/wYRBsiui7etDKSTE+VdHPBLcDecscgu5l
	jdDmQ3unkWHTKSq3p+7VTaaQMTnXzXDG/hVPzKpRxGfsbqvenzYhzlPpqfu24GZvwTSQu7Fzk7K
	LZitpnTbUs6RLTl7h7IunSQZ0QZxFlB3pDmK5efxJBuNHHPq8bMrn8VDAnXDP84iQvFbbPlINVq
	gWBDxp0SIsO/TS0mgWlt3Le7mwh7W78ZgHGgPHA4ptn95Cvphi9gCT/sj0bxfMJWQh3CNbYOL8x
	AHs16jNlrT3lzMgKZtNeZkr9JK4LYlD+1+sdvJG//CTj9v/1fVF69rjxvLqdYuQmHQ1swXVjsl2
	GwdQA3iNyPnsiMLWtvm45jFEtgK5gUcSZ7F1quMl8vvwnHTrkDiYR77Ilem3rpd1zdUih0RbDus
	KXdk/wEPGVGlBe4V7Rf8woRXh9lpSfs1R4tzu1T5IhnMT27Zm5Y897wUqG6o2h+Ld0zO8dA1Rg=
	=
X-Received: by 2002:a05:600c:4704:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4a35acbd575mr48866525e9.16.1792878280936;
        Sat, 24 Oct 2026 14:44:40 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm80447905e9.15.2026.10.24.14.44.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 14:44:40 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v3 1/2] ASoC: dt-bindings: ingenic,aic: Add the X1600
Date: Sat, 24 Oct 2026 23:44:37 +0200
Message-ID: <20261024214438.33342-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024214438.33342-1-olivier@mgcrea.io>
References: <20261024214438.33342-1-olivier@mgcrea.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X1600's AIC is the X1000's, but its bit clock divider and its mono
handling differ (see the next patch). Give it its own compatible, with
no fallback.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/sound/ingenic,aic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
index d15c000f14e1..9ca75fb80f45 100644
--- a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
+++ b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
@@ -24,6 +24,7 @@ properties:
           - ingenic,jz4770-i2s
           - ingenic,jz4780-i2s
           - ingenic,x1000-i2s
+          - ingenic,x1600-i2s
       - items:
           - const: ingenic,jz4725b-i2s
           - const: ingenic,jz4740-i2s
-- 
2.39.5

