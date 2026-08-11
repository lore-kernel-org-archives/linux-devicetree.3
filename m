Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4913347520
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786435806; cv=none; b=S+Ja+DYHQrBFU095NNiMI9gDKLz11Iu3YfHTHIAkU1ChwNhghJF/JnuJl3/H/Kyyuxdj0kpJVaEYiLhu/y9gTwlbUb8c2IV1ZSRiHHomyQJdvEzhG5o7Uf255eWCFafFd8aJ9zEgt8uyO7NgHu9FMBb36n2YOdvYqaS+cHT5UMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786435806; c=relaxed/simple;
	bh=NXs1HeO/pBJziwD3M7Zetj+JP08cqnGqJzklwV5SGqg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F7MOseeiEWq+ppcfgFm/Ylac8AMCDcFtLdH972L5l7qf9OoA31i1WvWm/GJX3l5+DfpLd8L/RDncpqQkMwEEZzpT+p4mu8rMRlRMECCy4Sch67CcXAaVN65IZt2CbyY8Q+LzT2dlP4H8qvA5mLDcqikLXNLvSCcQ3uzpngDt0Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwH6HUgB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwH6HUgB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b966dd74so16909755e9.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 01:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786435803; x=1787040603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=udZAkm1oxDo7yBPqbOtYYpIHCvzKK/t/xyTiusa5l20=;
        b=DwH6HUgBy66s4CooSeEcDIVIa+/FDZoXJB8jvGNacFHJEYpYJ/m//Equx8zp5hD9Xl
         Ud5veVDS5PBpYRuw2YExK00r+m7EZ5GhlKsdw6aKF06DhJ9tmze8PFFJ0J0QFsO+eo49
         xv37fnx5e5iRLw/trNnPRSQcjF1X2IAKMgHZjfdTD42mit0rQYmeH2SUiqh5k5b33VQa
         z7xqgQ0n/kkV33EFkXcCQE8jFqWPq+7RivcVHBbFfCAzF6VIi/uLUPpCCXRVyweT2ZjG
         qBArK45j6oJGx0cYHbqIYr5nW2guiZzZZxziCjRIGWijJhCHijjMgFAbHsDPyXEOwXW4
         CUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786435803; x=1787040603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=udZAkm1oxDo7yBPqbOtYYpIHCvzKK/t/xyTiusa5l20=;
        b=dfOGJlv6rsZYitFMSeamQMVTb9Kza2f40yil5a0E/w9FKJEAxdat3g1Mpt2cIh6I85
         yy9YYGNya8yNucP/DT3B9fGX3HobgyR7FXoFGS+UzIcpyZuLLQxXzfL/bjztubok3VCy
         TjY75D7cW50Fdxju6aCRvPssXlez69cVsGPru/eT4RO5+ibVSV5m47MOvhtC7zPCs1Ct
         tsoiofmaR79itjhTfpE25D9h9DyeXxWPPfw6TJaPnzAFiwmM+KA/X46w8LbsWag2BH2f
         9uUCHcawjzB0i4h1q7jMMhDLL1AxvF4v0RHYuf7tAJ3rEVLTTgdAOfY669dlnjCpOt56
         MTJg==
X-Forwarded-Encrypted: i=1; AHgh+RqNf3yNZQNbeE5TejIChzBL4f8GJOFX0lIWE3HtwozpmOhAbegapHBNHty3hXhMK2/mpeIe5kcpaytj@vger.kernel.org
X-Gm-Message-State: AOJu0YxcXM0i8KT7RydiqviOjbPm1EwHd7i/9s5VQxxXAAMiB2FiJlBx
	RGzhSmKj9PbOJhGTAhdkJ9O0njZUDW4FLVMlq6SHUdGj+w4LDiDioevb
X-Gm-Gg: AR+sD11s7EQbFqPwsLp8xjP/hij48vSkjHU/gTTMjRNiOe3Xf3pYfyHH0cxp8/moUDR
	dnr/cLrMiU8FaL2WutELrrnJqGLGixsS9RRexxbl5/YDgtKMJKTvslE95U1E3oLg3JQQcZHauPb
	hQyHD+lrxVvWLYKB18I+g2LPANmqlhpHXLQwnemE+HzqXuYKxiFiOkqrJO6x8EgQgxHTL6teMwf
	YdGE2+BcpG2lp5oLgG9eVbTFMz1uwyfjPralLMpb4cXojERTu6DAgLzBK5phy+NVFn75T+6MriK
	jNxqUdH2ViyPcEjTXJq+K1xSnV0tLYNsQUf3RWQMR6hkaAFmk7fyH1C01iWN4OPUEkokubtNkaY
	rpnitGvGuk7FquBbKJn2MNPui3NQmL+Mvry0jtm5sq1Rxg/zjfaCzW39x67D6Omf48dm4KLAxVM
	R/Qf7jdtZ4ulizJCHzchxCaNbZNHVt3q6ehq29P8e+u3wSBm86uQ2KsWC4GuJgc26KfzCX7EDBS
	4ZYkaw/a1yVK7U1Xv5w+ctsfvKiSieGcUulm6QExYLvrSzsz4904t43TAw=
X-Received: by 2002:a05:600c:1c07:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-4997845f6c7mr19665115e9.9.1786435802820;
        Tue, 11 Aug 2026 01:10:02 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49977df9489sm45336675e9.1.2026.08.11.01.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:10:01 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	Manuel Lauss <manuel.lauss@gmail.com>,
	Haowei Zheng <zhenghaowei@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Rong Zhang <rongrong@oss.cipunited.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Gerhard Engleder <eg@keba.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: serial: 8250: Reorganize compatible to single enum
Date: Tue, 11 Aug 2026 10:09:46 +0200
Message-ID: <20260811080950.664379-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811080950.664379-1-ansuelsmth@gmail.com>
References: <20260811080950.664379-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of declaring each single compatible string with a const, move them
to a single enum and reorder the Nuvoton compatible as it wasn't sorted.

Put the generic ns first and then follow alphabetical order.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 27 ++++++++++---------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index bb7b9c87a807..039bd392f876 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -99,19 +99,20 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: ns8250
-      - const: ns16450
-      - const: ns16550
-      - const: ns16550a
-      - const: ns16850
-      - const: aspeed,ast2400-vuart
-      - const: aspeed,ast2500-vuart
-      - const: intel,xscale-uart
-      - const: mrvl,pxa-uart
-      - const: nuvoton,wpcm450-uart
-      - const: nuvoton,npcm750-uart
-      - const: nvidia,tegra20-uart
-      - const: nxp,lpc3220-uart
+      - enum:
+          - ns8250
+          - ns16450
+          - ns16550
+          - ns16550a
+          - ns16850
+          - aspeed,ast2400-vuart
+          - aspeed,ast2500-vuart
+          - intel,xscale-uart
+          - mrvl,pxa-uart
+          - nuvoton,npcm750-uart
+          - nuvoton,wpcm450-uart
+          - nvidia,tegra20-uart
+          - nxp,lpc3220-uart
       - items:
           - enum:
               - exar,xr16l2552
-- 
2.53.0

