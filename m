Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793597637;
	b=mGwsA3cYDNbELb/FD71HrpSprdl8lCGgKgjcvpj+Htolc/PjMMd9qxUyzZH9L24fCVbP
	 5wwMSQhnBo6a6LomMlAkXkv15IoysBm32JRIPQP63wsfb+nJ140aKFiB+CNBoOs4plPa0
	 n9/e+vskM3S+uUS7LdxC7D6epTWSlex4dTbHhCtW7hhkgLL8gZA8CWMsVlks/kP9Du5l+
	 JAHiD4qBtoNE/yxzwFw/Tr8+w41DgaAE/OW5Gy8TBNLz87kH8FoIImsaHLxus6WKDKKge
	 6E4N/XhSRGEtb6TrU6j7UX7662qtuP52xuDWeFPhxHGYSb72YqnJ34Siw1QR/+zYg6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793597637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fzpgC5Iq6UmNwAV/YxFMKMcnuTBJ158cMfcPvMXN/0k=;
	b=Uz+CIT+yhd3d6gt0ZT0QK8qsuZPYJ8UEUOd7lfBZ9sTFXV+HpGR+d1HWkisc/Su9dWAU
	 rorIpKpPdew+8tUbpBOsTo6SXpKNzk12Ma1XCVrinn7XVfeJ6A5XcgYRwHvCUVzPaMVRD
	 lGgNSJI11Rq7onqynbKj2jfszeGbV6XmOt3U20BJEiL+IVhkepDbIxIJbdlfb0n6TYWkk
	 wby+4vzRKPI/FedNCQlrqZ+dUf5au7sVAkKaj8K4MPoTQLUsIpSJztn19Y9hSUJnbfFdy
	 ff1jvea+3560hRByTaa2xjskTNCQjzaktFJxVMlyTmGjQLHzlc9ETagoxLo3Q0Eofjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sAuHaW0v;
	arc=none smtp.remote-ip=74.125.231.139
Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BCE606A32F
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 05:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4BCE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sAuHaW0v
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-853d57a81easo517415a34.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 21:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793597636; x=1794202436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzpgC5Iq6UmNwAV/YxFMKMcnuTBJ158cMfcPvMXN/0k=;
        b=sAuHaW0vR6UMGmh9a3LoCfGHR5y2OPt9lNXxAGnagx7UZvkrXmXTFynCOsmmiHLGYq
         GYb9meKDxStFKyJb74iFcxP/aWQQCOg8G3LExXifnWFM3E/7n9VPHXqAtKYCY0i4RTSo
         22nw5djiSJ1MSjDKZG41Dk+Id1piCjeh5PFA135IQ6F6qTtWyzC3gwiU6q1Xoz3lSt5D
         v8ajt5atmPCUw4A+AbfXmQKrMDoTBEdGnXHwCuDXrWT5DHYtckAIPRnRJwyCIks/8rFA
         GC/p9TNJD92kO5t7NKQeiHniFUwdDXG8NsBaLsAGXPTejpHsGwwSDNZ5htqRqyQTNear
         R54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793597636; x=1794202436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzpgC5Iq6UmNwAV/YxFMKMcnuTBJ158cMfcPvMXN/0k=;
        b=QYngvZeW4m2xNXiS3jJGlc3SM99YBaaSb99eKLRforJVdEh7cILUyjL7Gvz1fOGJCV
         YUBUH4GXlH7won5TPqFLFLskOWfBx4P1m0cj4okcV84dDC7V6PEFcRZqpvinFVjm73g+
         u0owM6pjaftv1Sc5NqA/pwr683Q1KM6p4Su22ygrs6y33XZ5qTu6JhTYOpnV91F0bxNk
         yx5LwAE8owbFKB53xlPETbuJbKNg6wHpae1Kx20KiQUOdjY6XCVN/GCur3FCbM1zFjEj
         ZmqL2ortEVhrqrPJKk3eGN0VgzqP2/Ff4vkj8bUSUPcSau4t2aG/Fq6EFgD/1GlYaCRe
         2vaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWmtPif/Y9SFD7Ey1lXtDY7cvGq78ylx7Qjg7iiaL9gDjVa0Pzo0ZKpXyOTr98VUFlTXXNm9YJ6+OO@vger.kernel.org
X-Gm-Message-State: AFq9FYLXQziqXiYT/2O71FDtqiWLIzqViGqAt8mX+zNPNCjWRuENmc1I
	pTgpI+9jT4xUkJY0PNJXeclUdd/Nv6FfrXREHsTh4nMZEg5qvwPssDXkuwCmk3NSnMU=
X-Gm-Gg: AYBFou13gQ3cm1jUMD1d7j6xdvrZ0MWxG4lbQ3AVeeL06P27q0MQpylriUXuWq0VbM+
	zVgC4X0o6UBcdZd6YqANrH7yP2mHnjElUdN7a+081CUZ0165rsdjwNUukk4aPISM+YGKalIjAEo
	SmPhzGyLhEOvhVzi+rZQ6n1uEYSl4rU7TR3cuDXly7eJrj805St1iWw8IznVt4VzZ6B9qWrudPw
	fzEiX8bgAYVUFSUpoZEkaB9fiT3c7PBAPZqyX+y3K9EX+grF5x2DBW/GuiGiciD5GF7SkrchGpK
	s1W4as+ovHm+77GY7a3fOS4RG51G/nCUQrDaRVx/EvmOjF7zVRC+2EHNVu51Ood8dpjV4GWOfYJ
	HstmFxMXItcesdP3iyKuKTLGrQpUTCZSbNSscUcBjELqFt4eziIFKGLyyUWZHEwtHxIUZH73XlY
	PLBqWxaE3J9jITLGpRirByeKnmUNgTfI/jn0UlZph2NlRxgk+r8K89NZU2vv7Yfo+CSEfkdhQUY
	8Vi8u4L8RDxnHp0BSZFff0bO1RFEs+79h9z3ikza+JrQWvgTKUVObsmeKBAXnQhLGAxEcllArYF
	Fn+hntCLEsmrmoJYpNwI4sqG
X-Received: by 2002:a05:6820:1343:b0:70e:3e8e:efdf with SMTP id 006d021491bc7-714f2ae369bmr4807837eaf.89.1793597635764;
        Sun, 01 Nov 2026 21:33:55 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a818b9sm8321164eaf.1.2026.11.01.21.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 21:33:54 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 01 Nov 2026 23:33:46 -0600
Subject: [PATCH 1/2] dt-bindings: mfd: mediatek: mt6397: describe the RTC's
 32 kHz output
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
Message-Id: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-1-9758f38d7053@gmail.com>
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
In-Reply-To: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793597629; l=1164;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=GgCulyiRe8JqnSbuYJBNp+S895kQy071XDUKSDOt2BQ=;
 b=UE2preFnWrcfBUGQB9fs2ZLD6a5Iic6l7jXV2HPJqVzl40mf4eCBFIpiaxRBYwOVNNpkVcGzQ
 NP955JBBzvAD5zz3cEjRiUa5q86u2PzDOoj38Yx6ZzP9oKolUFV8h/8
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MT6397 RTC drives its 32 kHz clock out of the PMIC, where boards
use it as the sleep clock of a Wi-Fi/Bluetooth combo chip. The output
is off unless something turns it on.

Let the RTC node provide it as a clock.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 055625362951..3bfe1ad60d2d 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -84,6 +84,11 @@ properties:
 
       start-year: true
 
+      "#clock-cells":
+        description:
+          The 32 kHz clock the RTC drives out to other chips.
+        const: 0
+
       nvmem-layout:
         $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
         description:
@@ -694,5 +699,6 @@ examples:
 
         rtc {
             compatible = "mediatek,mt6397-rtc";
+            #clock-cells = <0>;
         };
     };

-- 
2.55.0

