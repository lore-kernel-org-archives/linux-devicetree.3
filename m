Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956818;
	b=3TI+tjUCGf7IABF55LzLOwbtO98kvZkGRNvdD25jQcKcb34ml8so5XflvtvIUdcQMDuL
	 um08nkT9oJtEojGfjrU7uONsvfOI9OLNNploSsXqpgg4dY2E2CeQbzGJyfsmrgdStPEam
	 iKCxh84bUhx1ePM+BxQVm0VOJBQW2YkxSVbXhk8acpJ8GX0KnJfA+9a23XHFpopktghJT
	 FSG2bD6WBdz07rDqF+H5fBvZ4FPNrxg5sesnx0k7/ZI4vh7ycZot41KUABVupmyXlIsw7
	 lEXyH48M41vqTnP71vthaS77QGDokSlbA6H0Tci9C0yJrl76ETJbrRnKhJC4p+qgeoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xu7FC3Q8JkhKAZXkmoQyecqo7Y03cSTT/z26JLOH2q8=;
	b=P4qtoEUfQDwbaEpiizciiapmtpL0aRZrZ6Of+vN7Eu0+86qa/iNKBUMy5vXRRDZUUcmE
	 5D71RrrlP+ig8XT4JoodJXj2rmqX6Ulj5Fcg3yS7MP27Hj6ieqjqFEwpHq+AvE7NCCIga
	 i4H9HTVzfaCirbHo+1Mw2IX1hgN4BiXc4gzGGP09c0VDr1akkzqsyoouzcEKtJ5oA2a8Z
	 XjFQS8DSaSayiZQMAOcqX+3rNBiOOQ670i/3LeK0XbTwnssX7e3x1J4OvfNh3M/TPfqlF
	 ykFWQ0hhVpBpFyz3OI28fxtg3ilkQ0CwGyBzGuNbTdsuG7FZGZku1hnTNQWg+NE/Xhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oN93Xil6;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F796082BC8
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0F796082BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oN93Xil6
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso4431425e9.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956816; x=1794561616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xu7FC3Q8JkhKAZXkmoQyecqo7Y03cSTT/z26JLOH2q8=;
        b=oN93Xil6UfBn7yVRhg6frgSrSIimFgqT44JhM7qqaPimBhIWP5FBUZFJkH+KfzHsgZ
         2SLQnmaAStlJcdtt00AdNoLKpHgC6fl5p7Ml7m7Q+2AkatDQYyPZJ8iwaRsZL9twxKR3
         81tb4SRPMpBNziBbDUcidG0uKjjXEiGk+zoGZCh/gX0+Vx1abnP74JwqEAaXqdc5g1gS
         zdFkhDe7CPMRRpxsKmzwYUXTTST3k/RzVaQL/Tj8+PQrvXCCrhIcyO0wiW9/BX8QbwkP
         QQ0LD54NiFGhmcOnDdJlDKQXXao/roCWrl5WZrg0KzT8ydxhHdvmu88vvR+EMCE15xed
         4maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956816; x=1794561616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xu7FC3Q8JkhKAZXkmoQyecqo7Y03cSTT/z26JLOH2q8=;
        b=qWcAp4QW7UX58ucWNXx3s2BlT99x0jMXSZFyYxbWxCC9xoMhWRdJsHJbvwEqGuAPQN
         Vgce/zz8S7Ip3/PX9qodgDto5TOyDObTtBr3J2kKRfpH00kGoHLgt+JZYFAhonx0EqbF
         0oAuREuBldj6fIBSVev9fhnIK8Jw8cndkgtJMKw2wCi4QMe8e1czeOYw231lgK7JvfVS
         VIGG/i4KY4EWV75nS88s4vkquBo46bmge/MOcOX2ep4IOH0c/tayJDTbvZInOnCoU3ef
         FZO7IvsS0RzxaYeJeuAr3WydL4LwJSKvtPmUScMRjEqsgTCAjHEslP9OyXbgsQXVyF8Y
         Nb8A==
X-Forwarded-Encrypted: i=1; AKwUvBxM2VmdwiBicn5+pnpb0/eHNbiDexCDYr/Q6urt+HaeG6x4/XV1Ei4F01rErC6NI4CgM0h2Zoen5g5G@vger.kernel.org
X-Gm-Message-State: APuU4Z8teUzfSpG4H0x/Ugr3naBHwa9pOUNWf7PKWY8FNhkURNY685HF
	zMpdk1DgmUgXUGPM/4dhSMXnRD1voTw4eRoGsOLa8aknQiP90u+/qi2L
X-Gm-Gg: AYBFou0Rqa7AZ9NA8NvzRSdxkZwFRkr57nvJgFk1chFP0Y2ttiRGHjgm7J1wQPT8l3L
	unckJ698ggKYvak/8ElMXIddsExIK+y5v62qA6fVhmb/pelxnVlrlTzcLcKeVJDp8kxwhoh2oxP
	s5Er+SGUDkfNY82BJ/Dnlm9yFmz86LIcl7SdImy36r+x1tB7HwLcFFuXTxsetU1vettfQqiPnRg
	U50QsWWvEulN4rZedgdNM1rtOd9xL7vr3sL3nSHfzPGXwSX9gJEJ4EhfH3Y0P4AprNaErr0QIJI
	qrykLGnvSI3F/M4NlN7vODy1M4PLpV5FrdFAlBWaKozzGmEONeNUy0hkk0NUT1p9HFiIROX2Nt1
	TxmeY7JGzBCKPJTGS0omm25GNIfOWGbZsgWDNpihPpeW73SeiGzD8qGH1QZnkYSaF3g0E+rVNyL
	HMOUjC89w8cHmz86ddIcTeSZQ+6VEMB2MFx529x8C73eLZ2wRJeZETC+cfqxJFUbVy/m6fgDljs
	5exZVc7pG1OeGVQ7oHo3e58eEsFu6RR3fse6lugF6gip0x0VjCONbA1NnzasmiT/un8chUHlPB0
	HF+LN7vOUkcxJrt5m+BLf63lYhr97Y6boMMF9/KgAc1J3uDFDyMKHNzqAbrBUb/99mpH6fxlvr7
	f5lsMllDX1A==
X-Received: by 2002:a05:600c:1d0c:b0:4b2:612d:908c with SMTP id 5b1f17b1804b1-4b6df9beb91mr29536225e9.34.1793956816082;
        Fri, 06 Nov 2026 01:20:16 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57203a98fsm108358935e9.4.2026.11.06.01.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:20:15 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
Date: Fri,  6 Nov 2026 11:19:42 +0200
Message-ID: <20261106091943.35783-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106091943.35783-1-clamor95@gmail.com>
References: <20261106091943.35783-1-clamor95@gmail.com>
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

The LTR-659PS-01 is a proximity sensor similar to the LTR-559ALS-01, but
without ambient light sensing support.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
index 20abd7da080d6..85ac3b540c206 100644
--- a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
+++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
@@ -17,6 +17,7 @@ properties:
       - liteon,ltr329
       - liteon,ltr501
       - liteon,ltr559
+      - liteon,ltr659
 
   reg:
     maxItems: 1
-- 
2.53.0

