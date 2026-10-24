Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792879638;
	b=hr/grDy0hD8GHZrKNORE0KpNjiwRLK3a2tsKCwvy/M1DViXOkDKYCgmmSmDTVi4ICzy7
	 gJu/LkTukLxFbojZnLWsgBMIniBrreVitRRWPEH/XbpGIrnV/+6mK2WZgfyDhVUgwAPOK
	 yni++ABBQSEdCMZ3T6b0EWsFRdplZ6k7qHDLW/xYrPUNx/lSr8TJoRqc9vTLEVVtshG+5
	 njXu/tVzmGi22mBu2mPjAHhMZsuaYJlljjf2WnuzSxU41xA3oKd8h6bCDPOyQIW0Du/Na
	 uQ0R+rG/t7ZuiY4kPG7nceMYskAWDJNEiNcBVi9Poc/ZscSncZx3sZPRs0DsTrBsD0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792879638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tQ3jUZJIzHj6BmefEU8b04rCHYVmSDvqexKo06XbRm0=;
	b=nmRCK13wRljZ36UNAzPJJtMUd5gKEVXmYSsSxJq5XfRfommLTPd0zsyIOG+SMNofX7iS
	 3V1dDcSpn1XH/fj44VQeYVD1my2ihuiuMWgUtx9UG7IhLHJuEgBffceuu2Sxfyys/li1G
	 Uvmegnjh3oXQafbBQDyNxVkzwsBhpj91n3fzI3n3qhF045JLRTAF4WKXiNWljl70qPqAZ
	 SNaO9OqMCJW8X+xz/CDlGf03WuKJI3X/GUv0gpj30Ws7z1kp8OWJomehfJ8mQbVW1oJZc
	 ilEsoo1c5m/W2aYxwP/Kxs55X0/7/GhC1d4eTcxLfhfwHz1fpvSK5z/s3PWtG52NsVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=J2pjKcHm;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D59606A323
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 22:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D59606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=J2pjKcHm
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so17972435e9.2
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 15:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792879636; x=1793484436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQ3jUZJIzHj6BmefEU8b04rCHYVmSDvqexKo06XbRm0=;
        b=J2pjKcHmpyNpyYak4hiq1SqLoHAF6XZ35w75hkj/BumakTFlBwBraSHF2PagBbWmip
         W3Dk43oauZBfj1Nh2zbRvGi5ZPCe1peDeMDB1S1xj1IBuT5Ij2JhjA3cCE/su9ELlFMK
         MiRaxrm1HSw5V8evkCV4PZLumnDDXTq8oTFpVesi9wv2CT41uB16F8mFkOWBui/lnjL+
         pWNT9PKZox+11oMfnZOO9gGsZQzPxIdAhBL3d95XUuGIW33n+n9Fu4NPXThXPSORGoBi
         O5E39mTTHrUQfoFbuhnXXKHz4DvtOBxe5/VsYbn4MBCFI3OHLKClt7luQKEnUaSCVleE
         32bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792879636; x=1793484436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQ3jUZJIzHj6BmefEU8b04rCHYVmSDvqexKo06XbRm0=;
        b=yYTYYjYEJClxG9QASlGxgbWToDBYLoT1K2DfJTvj1EnasyHRLnMpwn7+CfM+xtf41G
         n368wu7UuaZ0lZ81rcIeBzf8gV5oRpeZj9A3WXZFB1aXo5aBx4YGNdaG0dR74929N0dg
         gPrfkbzipf7etcd/6Vy/mqtGOm3OjIqmNV2VE578OXqiE13WzCFbMZShb/XGk89Z2GK6
         Ir1UKNsaN9rxu8BhcyTqWcz8NP+rQpLp2lzVxv81hUDNSX+Lq9N993yahGjVrPGtPJnO
         qhicNLlbEusbsMtkYePJ9u6lfGKXRYLDvATbukIDxANH0wxjnGIG6tjT9G9HEcnC3AGX
         0ZRA==
X-Forwarded-Encrypted: i=1; AKwUvByDyvbNw4LNK24K9+8u9RLepEvudAZFBQ3LeULPcSlDEvPftq58tg6uD67CNqNrjVhtongrIUCS0Gkg@vger.kernel.org
X-Gm-Message-State: AFq9FYKKjVC++V+DogbNicKYMwCYO0fjeViMRxzcit7hqAlJFkQ8CdCW
	PlhXFCbQeWQiffaEIJOSuIISyd/tflP6wOLRyyUu9xg8/Qzxrn20Z0zOtRv88Jn2KpY=
X-Gm-Gg: AYBFou0pGUmhtnAmUhxwrPTqbJCP/2JvrfLSOn1+uT9XRpEoa2boZ+rncTh7VdwetCq
	vEt4h5shYYGsG7Ow/+KKLwtyvrfC991rb3M52Tt7Xay2ncjhTr/76P8cnmT2NYCmhEmI7qM9UP3
	DoXjx0Ugj/qVnk2e9V6ddJSnxhVEmWb0HJOu1GkrlSOP03DxE3JfcH1tn8VWpwbHWiiojkYDznT
	a7AHCTBhlJx0ndrB2TAhSYpnLdiyDgmFJs64i6p6v/MfBcvtlqHyGpfQPeOLgOdsvzj+i5RsvL2
	gDL5tTHvTyVVU6LzqZEpRoIdpR10VTQqURJhaH19AC2QIvnHsjDoz3W8ZiJ3MAhArze9gYiJ7sZ
	JD8LL68oWmuWE3B32NwSahNydBK2dlc2Ro6K6HelbEtM+SXNf6DGSlQ2xKbTbzVJXLv4tkV24rw
	mwr/Txlt4PwHOE5jpfpuVQVr5bfcn9dhfviqgj6jTGXzGxBxvRAzftVOW9GPD6Im1Ux2Z+2LddI
	utsMk3nZgK1upnBX7TjJvx52BcHqhwECTdeatiMaAxmELemRYsh06iiaj/Zz2vcaS3iaoGvipLD
	VxjViagHx9fACw/oU8mdIN7zOsKkR6YnFTkoXPXlAul+lO9naRtqvpl9ThG5VEtJrck8QjJQ+Qt
	FJ6El7agjJixfEHM=
X-Received: by 2002:a05:600c:4e87:b0:4a2:cbe:beac with SMTP id 5b1f17b1804b1-4a35aca73dfmr47824675e9.23.1792879635309;
        Sat, 24 Oct 2026 15:07:15 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a06da5fsm53466635e9.3.2026.10.24.15.07.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 15:07:14 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/2] dt-bindings: serial: ingenic: Add the X1600
Date: Sun, 25 Oct 2026 00:07:11 +0200
Message-ID: <20261024220712.23250-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024220712.23250-1-olivier@mgcrea.io>
References: <20261024220712.23250-1-olivier@mgcrea.io>
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

The X1600's UARTs have the X1000's registers. Add ingenic,x1600-uart,
with the X1000's as fallback.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/serial/ingenic,uart.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
index d5f153bdeb0d..635342d43ddb 100644
--- a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
@@ -32,6 +32,9 @@ properties:
       - items:
           - const: ingenic,jz4725b-uart
           - const: ingenic,jz4740-uart
+      - items:
+          - const: ingenic,x1600-uart
+          - const: ingenic,x1000-uart
       - items:
           - const: ingenic,jz4755-uart
           - const: ingenic,jz4750-uart
-- 
2.39.5

