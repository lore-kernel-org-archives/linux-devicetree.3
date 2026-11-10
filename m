Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284660;
	b=2vO2mqm0eVDwiiUXA7P5+j0+bErRyHoEWP7hE4XPtPfB8dYoW5kDG88A2xUTxFX+Xafs
	 WHDjsaWLsuhyALPlRGB8qQZIbPhjFHbxutHEVn2TvkS+LiInPBaVbZbUAlz/FvbluO8v3
	 IUIylt3/t9mDvGIOlNhUDRPMYpmEM/4TfGFe1Aw2Sfxl4i3/HtiCVRXMMqAYkEn51DZIR
	 hqShM9dG23o1sqRslKJQpgCsWgDuZNGj0tL708AXXff9ixmjgljDL+IeBN8N63RfnFIlS
	 9+BjbplcEF4sIPKX/Rb71FhCuHDrIuK6vjy2bV52eWCEkEH3of0nThUAZ1xVkPBKnDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NozN7LQPNlgO67WnfUnOBfVCkgTueMz1l5T7tv+iGy4=;
	b=5Utz+OF9W/SzrelC3fe0CTv8WSYGjZD/U7028cTFH9PrLTupHpOG6p2aXq2BRtJCcGMy
	 gc71JSTHdw+oRAQflarviP2PpK7Jk/IiKqSbOpX6cV9h6tqtPuZ+bjpf9z0mezXsbFhst
	 cnLGePtTqewApifzdtJ7NB8oq32ysCVVyRHN26+zVUioAD41FHgwP+j4LN/JjIh9RPGeW
	 14Ib4umJJLj6IFCdfJKtbRl6TkGxE68djKzeeC25ppBXHbCiQMeuAlZiv0/D3yn+ZFTjV
	 /Wn02kivjfC2934apDEJ6T95VB/8Z6IEXByBF6U+OGsKk5+Oo5iDzsNnLnzDfipF0xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="XwyaI6/X";
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72AA606BB20
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B72AA606BB20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XwyaI6/X
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15ea896ddc8so2714827c88.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 20:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794284659; x=1794889459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NozN7LQPNlgO67WnfUnOBfVCkgTueMz1l5T7tv+iGy4=;
        b=XwyaI6/XFrQ0gxZ3AcLBiIeumVvHSl6ZcTQBvQ+Le3dpOLxS3w18WPNfSHoSmpSIxI
         HLlkGJIw2LDqnhg+BV5kWw5dO0l3X/+D5//sxJoHUe3cRT3aZbOFcp8JawPqxrAiHBFO
         qwvXrkqkkmDCxOt8re+pWIzt3NYonY/hVFzOKsChEcQLXlrdJSQZeJPN3PEghcAr3aJV
         D5L/ghNBnSP2h5e81vwZhc0RuQniSJMzKXjBdT67NJYcY2Bz41DpNTj2CXLEGep5c1YQ
         396c0VROmq0JifqdHPilzDXiW1i2aKldr06eC33FE5uvQn0oOyAQYblhH727OPKTT6Zl
         8tFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284659; x=1794889459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NozN7LQPNlgO67WnfUnOBfVCkgTueMz1l5T7tv+iGy4=;
        b=hXs7NP++9ly4DKF2LFc2nPabI0oN5Xek1kvhKSnd1RTKb5BPrh8gIRRikUBle2SKyS
         Ibsiu6ARGA4yxLhyVEtX+ssG9IvsEZSSKJwHX0FY7vLtyu+Gi4Pl+YrrFR4dlqkb2v57
         0MNC5Qt+zCATWbj7bs5vHC8jJl1grQ7UNkgMCsaEHlFMjrlE/H9qwcsTDi6whU1pm3Ja
         Uk711xTLi1A36a+zoxva30+0OfnR4OPLgmfXnHqA1Ug5yFHqEPbUOHbr1PjxIa+W52PP
         WllukBe77nR/AB49UE8S7FMhEVfilZlR18Q+5ORXfe4Q1f1nPImW/hruFu/fmC+qI8nd
         Jgaw==
X-Forwarded-Encrypted: i=1; AL+hErFd9AJ6tDd1B3w6rWJ/7IWAkf4JrzSvzt2fuGC4aS5o+4I5oHwU/LukByzHER7ccypP8D842akGCcn0@vger.kernel.org
X-Gm-Message-State: APuU4Z/nQGJdpBpYO4/6LrnmQyj/Jv3uPE3jek/2Q6hXqeCcJbzs96K4
	rEVAuCA5n+qMuq/WF/25SJbL0Un8H4V5rbnCOcAqU3d6lqxT2rdY8d+ROZBGIbwaWA==
X-Gm-Gg: AYBFou2V/QbW0EOmL9TXf2MyFyqEk7FM2eV6usy0oeRpC+4Av58ywZPAhBqFa59XFD1
	GIEj3AtAjEReIg8qEQIK+zaMd/d2UjDGcM52GBC41awgUB/DElVKM01uBj/U1KAKK0XLGaBJ7FM
	zd3VM9SaxsLlHxT98YBKDQyUbMKfWgN09rHhzwn9LRa8w8GvKNQRx/9L6QjyO9ZF2p2gmaV5HBh
	0X1nxucKe8P3qgE7Ry7ETItYv/z7ziGTJEpNK5idg63oh+kqgnNahJtiTJ8MbBboUoPuoL+V3sp
	38zUphVmoduNYTGsq5oeCc6qK+VBRTCTmCgjNwCGJYQ6sehpGTqUjblu/aqNduBQE8h0xgnvGX1
	7XWjnr/3I78FvjzMsW1LinIfRF2tY/y8+jeDvHUPp5hcnUabyjMbt9qydUXmZXXpwfMlWe4pUXu
	Q7+6y0yBjX9WirsqG297bGTdk5TnB+le79KVFrtUTu5r0wZMRFJiFbpITcahu6aIVb1QMosoKg5
	BJYOB8pekO5R1qxYBFRRSqrm1/RsS+hWvTZFPor7zn22wTdRG9hrkQ9fzLLaceE3LcaajymBP4i
	89Z3ZvrkUyxPe2sOgFns7aQN9d+rnx+epPhHS12xwMxy0uJmYMlXPEfcjJP+FvLi6wJvP23KQMI
	/GR4ooJjE62reKBjc
X-Received: by 2002:a05:7022:1505:b0:1b3:ac53:da84 with SMTP id a92af1059eb24-1b3b603ea3cmr2230611c88.32.1794284658677;
        Mon, 09 Nov 2026 20:24:18 -0800 (PST)
Received: from cantal.lan ([58.136.75.91])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm3116950eec.8.2026.11.09.20.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:24:18 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chintan Vankar <c-vankar@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 1/3] dt-bindings: mfd: syscon: add ti,am654-gtc
Date: Tue, 10 Nov 2026 11:24:01 +0700
Message-ID: <42bbc4a03679958f2ed4e195acea99fb57c68fd6.1794284248.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794284248.git.jjc@jclark.com>
References: <cover.1794284248.git.jjc@jclark.com>
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

Add a compatible for the CFG0 register frame of the Global Timebase
Counter (GTC) on TI K3 SoCs. The GTC is the system counter that the Arm
cores read as the architected counter. CFG0 holds GTC_CFG0_PUSHEVT,
which selects the counter bit that the GTC exports as its push event
output; the CPTS driver writes to that register to provide hardware
cross-timestamps.

Signed-off-by: James Clark <jjc@jclark.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 80ff0e1caca2..b1030f11b2db 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -131,6 +131,7 @@ properties:
               - ti,am625-dss-oldi-io-ctrl
               - ti,am62p-cpsw-mac-efuse
               - ti,am654-dss-oldi-io-ctrl
+              - ti,am654-gtc
               - ti,j784s4-acspcie-proxy-ctrl
               - ti,j784s4-pcie-ctrl
               - ti,keystone-pllctrl
-- 
2.56.0

