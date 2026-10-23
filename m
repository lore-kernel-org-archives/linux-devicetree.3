Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740841;
	b=Zi23mEEApDKANK5CEZNI8zVg4s2191FrSv74mcBJv+mL37hBYfuefHOAJGsUk9hVk84d
	 joKRAxPf9+Jcox31mljaUnDfHGp2fpP1nUPZauI1sMlNC4aP3uYf9DpOBc9vdS8wFE3m0
	 vo5M9Uj+1q2v4g3qWSYamEDJo+U7RrDvdG34ATP9n+A17Qi5+tqBd+ADV70A+6VDGH2Ao
	 Nq35G0580Ll4BPtoCtAz2BqjdfP91wcHYczqsJSa3ef1l5UyicuxNfg9C0h1Td6I3CV5a
	 DJIn92sgFlENbk1WHdEVYyFxMciYTggRkRDLg4HbkDfXTQgnELvkrAhOLM89Ih+MNVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
	b=TP4acniA9gEoKLHH3ikXlP+K5hKN3BJPNI9BcxDIO0nuG8pe5lfHVlGzSujQZkcBkG5H
	 ydMRLjfT++NayZaoqzVcte+JyTGkWIYUHNRz4hSHJ7F0Z0/sw3loCt7OYkuQiBF47fnTP
	 8pfYes0vb8qwS9NByWCX4CHUZCru+bRTzqwIFxqM2gpGXR09rrnycH2fCMPj1xniyqpIl
	 nCblhcbxH9A42ZKfHoWapXMKjLk/8pPVzWd1M9PCRhuAE5vTCdKAmyhYBVjrfDKPxJ/VY
	 lQRGDCzBUx2d9vqA+Eo1AJ2MWkMsjryedK1bIKbm9ii58LiYHSPdQNblpbw7VCe6GkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EnhbhvY2;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C13A606A320
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C13A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EnhbhvY2
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-81ba09a5d23so564779a34.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740839; x=1793345639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
        b=EnhbhvY2XbYfTl7qeP9r6CgcCUsceSgFL9mfHJXMPEig/UsejZrlWzzKmLih8QUoAJ
         NxcLvphld28+mFu9sTIfbP7CHWA2F9AXJmwxAMHc0RXKfwQ3SWuI+ApEN77IAsIS//v8
         r6OfeABoDDEzRsOTV2ksscTv6KTL14Ov/o7S//qIFTsQf1iyiOoBwWFiBlDJ30cgFeW4
         STFDE6e6HNiOlOFVuuQlnrz8oZPDR28v+N9VjF0oCR27xjOLSqMXBVw8HhDZf2lpfyAn
         njfXd+RnM3y3A3DxS4KcF9SE2jHztvKs3ZgdnBSSLAbnoaWzn5ic06yD/hnpB4CRqEGY
         Jpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740839; x=1793345639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=me6u6Bbs0ItISJiR06k4tVQKPfQkaZ0ZoYAv0UWBdnk=;
        b=MlPIuMFy7Aabz4hOzlwkNBlh/yj2c3ahynWsnKt6/j03je4Htm9Nlf0hVRhauxZdpp
         vE8GMpdg2RUSLZ26cQ8JxIGWizUu93gle4bQRxiujiVN5oL6xVhCQX1bcicS4xNAD/R3
         iGtv/Rt3RKSeFOQ1cKNUg0b5iVzamLSYoDQeQCY4gvhrFbkJt/WwHDuIH+zvM3cSFWv4
         QTmXkBH70PO9+3lTM9UsMHyDeX03kurnaiiqPKMia5AttWcFCgy0rK40wccH+x8hQv4S
         W7NVRWOxfWWm0pw9Rqrsv6sr93k0w7l8KQxv747Par4Z92rV8u0Gt/RN1xqb+nARKKzG
         DhZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXTh0D1huNTY2JZ9PX90zFvY+TQRWEOM/qDb9+rBCV9xzaWzoUSkt4O7OO4xoAcQw5zR0R9UOKlloq@vger.kernel.org
X-Gm-Message-State: AFq9FYI5FdWn8A1SXBIrqpQdy0R/QRVdzAq1iE9yoVAlpcNyqgF9JEeo
	myKqYOOycJqGBPXFj+4od97USyZLcj6AvRa85XuVt4Pr2jjPxT87TqkT
X-Gm-Gg: AYBFou0if96D87DMGQWTQOsQ9EDucJPYY/l3Zg3AJpNJ5zs4XvQvl9n1DHbJ+iVwwEw
	jmz5wmBU57rKFGp+vsSZcTs8W11QgBUkwOBTgD/jL2nKwqsNhP7Y6kBWoT+bzGxe9wPeNHuDrYz
	eo69NumH8RAFYtTRNpdZuGJ0ask63Vjh6riv2QWLNi5dqZB54l/y7A2R7ZoHyrTot6P1tqDrNw0
	xyOrWyTHARgdg7tHgd5HXw9YX8/OAHH1Ebjxz2Gbfg+GVYy5wDIe/TC/UloKyJPRGzlGKNDLLUL
	vFLL77daenTH+YDcCanZanikLIHJZfVIjyNR/w0Q6PVxf8WVc+oRNjdIpCTbAJWpj/InRFXY6VW
	CnKLhkuOSxTdlwpSd8p9mzWPLnkZs3qrukT0TA9fVcVKqBswYXqZIhi+Qyr6/Rsy4owj/NQcrL1
	od0d1owQS/SXfWMAh/rlh4rBDj9S9OKvMmBANfYG8wDOno3pO1/Jim5dUltnYuYAg6zfV34fyfH
	5eEXuAmmHQ3xTrcFekVocLxjcwYbDGOwZG8yxQTSvs+Oq3/QIJqT1Fay3Lcm5S5OFpuCUEImlLv
	/zMKpesBi21IFCkM1TPYd139yv5NNklFVuVBKRg9TXuPIa7lN3eGuYWfRRY9RR1klAfywCTh1pi
	dntvy8+1+4olObb3swNiU7/o54OWjnXTct8AMNH4Yxovsc+Zg2a8agIN+VBx/uL7wwiL/gCT1lC
	eVMH0=
X-Received: by 2002:a05:6808:16a8:b0:4d5:27da:a496 with SMTP id 5614622812f47-55be873584emr874475b6e.48.1792740839404;
        Fri, 23 Oct 2026 00:33:59 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be9880a99sm909562b6e.14.2026.10.23.00.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:33:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 01:33:49 -0600
Subject: [PATCH 1/3] dt-bindings: serial: snps-dw-apb-uart: add Allwinner
 H616
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
Message-Id: <20261023-submit-h616-uart-fifo-v1-v1-1-e4a3bae2eba8@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The Allwinner H616 UART has 256-byte FIFOs but does not implement the
DesignWare component parameter register used to discover their size.

Add a compatible to identify this integration and its fixed FIFO
configuration. Retain snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..fc1289073241 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -60,6 +60,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

