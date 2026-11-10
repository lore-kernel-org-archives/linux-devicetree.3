Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280402;
	b=rfFGq0dGVyA+Ld+FQeBoU26Q9MF9X3mjq5wFhcqAIeSW9oai+i6iw/+4cgm9b6yHSrg5
	 wks2IuRUTQJ80Tef5FZULev/qqz0y03iSEBdz7udTTmjHfq3tl2c7kwdqpXXNFMMrJ5Nw
	 j+wOjxUxnZSNe3KGW63ZbPRw8+Pj0+y+lV1RiWtqCsiQQyAsJpc4Db8lzMPIMx/eq/us8
	 XwaHTh95FBynmmLuh/PmZHGjZ5a8ep/IQ3vTv13wMMx3WwX6FMQpNds8iyLUVKirhm/oJ
	 4x1EwCYBevAiV6hAf9ZtqoVSWCnqWjghfCjByOZLg1B43qfQekGVaKXnHx8yt+Po4Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
	b=SBm1ABZca6nEM3gv8qDn0i0Q0Wg+hwhSfxnCIGC56HmQrX/Dyiasluj3jtMkwKm1ST3U
	 zzBd1e8gddJsOB7vcnnOgCz+oY18EZmuwk0e8Hwcs5lTKBkL6cO5H9WHCWx0100DUnoLK
	 vLEa98xSFwU2SRz7nQLhuGUFf3+lsMu9PZUfR69RqFOMUWT6fiZIqQDUITvis7yKdJHIB
	 7YYQdt3ReDIRrdJ3oYV3nY6mGZQ+eugUjnM+b0zkvOecdo+YOXHDdTEAB5jZauglfAfGG
	 lA1n6D1ACQZ5GkjJArTcoK99ETCDEe7Wu4yMxZm4jmSriadRBoC6rjAVTjYGHDylPFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CIauULyg;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EAA60A382C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6EAA60A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CIauULyg
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4f14642adb4so872221b6e.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 19:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280401; x=1794885201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=CIauULygZfljXukESwE5jALaNge3AATaYppoyOgZVuOx3CANr1AehvPGSWNFAzkYrt
         Wu493qoTV9jf4V+6gj81+dibzaE8I8XQ6BHVtA8Hq/S1nERFXQ6QemRVjXsIt3Frd3u6
         uwxscZYSnnl8LtPa4lwC5Jw2YE/S1k3HVSARy3a0Y3xE+jVNuOoF7iKWn5LgwA1MPkY6
         bCUKyDA2x3M5fdEnf0Q7oeUxsl2VkdMAgVK3hmt9aj5znY2hBC0QuOLAHmpM8xeJUAqT
         9of93ki6j2XTZLuoFc57Mx/AvnelSAkPXzvF0HhOijWwJuPjIDuITv3H+IywDz1/OjeX
         ggBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280401; x=1794885201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=QnnN52ZmZI290aEOGJ5mawVq2OjJCSJ6hxB/eWUk8vQpPPxEmakWudOK8h1XowDm1Q
         NUIGOj5P/OdJAsU13oN3ClSOq/ruBnltgEUhlX0tIogXsSFNYmoWOZ85kgR955dqCiLv
         S0gMuwMcuyEPkvqZEvOHeAx3kDXYBJU1yafjOLmLCfIc4+5G61kLAafLqCuSHuETUmv2
         /Ua7I2a0vqtVKerUW1/td+Z1exaRdbJKc/IvdhgmpYMxve6thPV3ltyYJNt2rNXUMli2
         B4Q3CE2jTNKpI8+uzRflXKubkHsCVSCrymZVdsS0kkwuZ6yGsLfhZaZY44Rafn3CL/tf
         GcJg==
X-Forwarded-Encrypted: i=1; AL+hErFclC23eEfO8IWDvLp7t0EJX+aB+VC5jJqtS/0DeOTbBBQm6oDgs71lk4PLs+/Ia6V5/7WCrHifxFvC@vger.kernel.org
X-Gm-Message-State: APuU4Z8wOfqmM+nN9qUYCowcmnnurelJ6rtaQo7w/8lHpQaUnnDLTcp2
	vEBerIwlqgcfHsQjRDyR+CZJj0KrNuqur/ZrfeVQbAq8myqmDOAD30Qw
X-Gm-Gg: AYBFou2JwbtGOaXq7o+mi+WANd7m9rWE2EkeyMIn5XBRbch9xL5xnv7/lMV/OZcahN3
	yx/XvT3oeqWkQ1EM32XZUre5hy9hJ/xKjjpOo4rMZxrnY6nDFdVCr2xnMwwcwQURz+PLo4dIHn+
	SB4au9nlH07kuN66fuSftn+mn9Cc4Rrk8rbmwOfwCOmFOANzWD2+03zVd22AZc5/yGjDM6DiaEO
	/Esu7u835PmwgQzIV/MSHQ2093BM9eMTr+p/5pix/deBdDP1cGq0+9AUCSEYA3tflBq4OPao9H7
	8zXqBvNc3+O/l57I2ESk34jalm/T9sDRxZvM6rJ37z6aUOPvkx8mNYopmEC6tDAjH4NVlOay4AT
	OKZTvIXiWGA0NodB8tcsRlTIPY4eHOswQ0fLF0qtGjw9XWP2s19KACI7FnghceYi8J4/uHKYMak
	r+ixkNNXeWRGt4vH469j0rfAKAlfnwFW2OM/Bcx0E0l5grYoE15DYuZeGheTd/KOgeZdpNhpEsc
	Upr4pKv35XthVf+eDiQhlpi+LkAZNa2+1//hIwLDCwHBNs9gGIR1Q/CcteoDDegWXem1jk5G5Lz
	7enum6kLKR8fasGwIhjqBw5Yipg74J+exYuZ0j+F/o0iKDVJJcvastfxWllcP3u1M1jeO+hd9Q5
	SSW/rz92o3bfgerdadbblbh219kjrJN9wsEKIwM0+w2PJ0FPdZ4KtPGWSLSqfPA1qUAAk5hxly+
	QTceOorCHqJqL7ZbI3imzYW3zxynImXXzLULdpmXvDOYSmNGcHTWWs
X-Received: by 2002:a05:6808:1303:b0:55c:836:5955 with SMTP id 5614622812f47-5683ca2f716mr1299570b6e.44.1794280400815;
        Mon, 09 Nov 2026 19:13:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:56 -0700
Subject: [PATCH v9 07/11] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-7-3f03961dae8a@gmail.com>
References: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
In-Reply-To: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible to identify this fixed configuration, retaining
snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

