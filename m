Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142350;
	b=kJEXQ01nU6iITzfDf7jNFUN4Mbv325VPB2PvokWG2bb+RnhcXoX8KFgCk7U7FYNvZi9y
	 tRx+9LxU/Hf7g/2Wsf2WFHEPPxuuXmMsFHNjyuOOJRb7vLPxQ3vOCN8m3qmIpeI/2dQNr
	 fyRghViid0acw8U29/BsQmYp3bol9jqyLep4K3RqQKIQPRLKMxiwm/6fuM+36hWHOgWkD
	 T8HguSIsbwS5hqrB538jtqlkLUfD5dH0JRcA+Ql/nqEO0PEjYUjGUB0EIJJUqQ8eYd804
	 zyQoc3FMcR3j7hhlNdAq7WpUVPCamIEHtMqAOyKO3y0RQXO6CMOvolLKEQKjHAtlU2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=EG6vB+d3AGeFZ6pBVrncqfS7pzggD8yTk6rsfUsHybg=;
	b=W4TPe4t6INoVB7ns5eJ/NH5ugDb9duaqBGKPX6XB3HgcIJFofss6OAG+rfWAM0/x69Ts
	 sOMB4kFh2pYZEGmrsRetcVGCAo9vE+KTJmOfl0t4n1M1kMjLqj6uxGLWcSh7WO2JmdnUE
	 CnDGyvAA6P5YsW+G8BBJR5q1SbVDRu4fCRKAhB7jb+dqBMK8CdBvMHUwgtiiL9J8mb6Fa
	 0gQkzy5N58/vr9gxcI06CvFyv5YzEvwckl625WyNI+7YPdg0rS/VXtNc0g4FyW6w/OQ4V
	 NRWmXwRd+JjuEyRt/NnLOa6UZNbhkA7HbjJUlOJbgGBVcqtK15yV1bLzti6L4+MJB1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KT/MDSGr";
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28D2606A327
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 23:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F28D2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KT/MDSGr
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-84a248254f4so241658a34.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 16:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142349; x=1793747149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EG6vB+d3AGeFZ6pBVrncqfS7pzggD8yTk6rsfUsHybg=;
        b=KT/MDSGr0uiF36n1Qrx6rANybi1J/wRnns6SvuV0WRYq8HzMIRyyz4vdmpsUYZs+Yv
         9IGrgHrXaM/XarQ992vpIS8+mgYqJy2bht2+DF1Rvv+bjFeCLY0njrYrBseRwTnEfaow
         N++QR8p7TKYnPWFQC6IrtpLjL4lJxzeUmcWKgBiej1Eu8RMEZjtlEghRAFuw9++2i798
         t+AFefaWtQ4FBhJpBl3xmicKecKCGVsTq4xShRjQ2k6pdI4+N0glUEc3bwkveLIrivEH
         p8XL0deTfodNScRzHdgMmB+qY/D48qhU6t6jX1y5/F4No4hmKE8hNzIIxONybUrvKRhT
         rIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142349; x=1793747149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EG6vB+d3AGeFZ6pBVrncqfS7pzggD8yTk6rsfUsHybg=;
        b=wjksm8RzNH9KoaW6Pdtj3LCHp3v4D9Jh8Tu+4c6QcbJCbiDO+XaWrZwfzv3IMEkNab
         ApK56Pfe5WBRAapw6NvP1stcwty+MOJevwb0q+aewoWKcS9JfPqLAzXInR+3ftm6ld36
         2Uc8GErU722qJ85IJv4OPlohTM0dJt4k3rXWEw0cfinXtvahfSCE7sYxR/r2Shyvs1IW
         2xPSp1Cj9ay5sITZyPO/bxrVryXB4IfpY/hxEgh8tme8xBByI7WVXDgSCB7ew//PiaKF
         fomlt6ETrWcDVtzgLr5/ChdGjqK3vlW8S0B0FNDL5KGOJyoKuk/RaLk4XXxBaleBPEEa
         jpWQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3+/Uir58f7kIEKz9mhc/2DNh4BTlbA9q5dBjLgIdhyhfj5Z6zB4xT1fBLybnXBCYiIPc+6HuFa72M@vger.kernel.org
X-Gm-Message-State: AFq9FYJmbfQJb6GXkMcki8v5RB5LwNxhnRdx6DxuBywKf0gA2hCt6uzS
	7TlvpXsoYPhhbq43BhFauabhE/OqDEdvCVomEUyYdOODIQIdrQnEZIDT
X-Gm-Gg: AYBFou3arj5wt4i2gI57KKqoIenjp25UKgXT+Nb+l9LoCqY76EbssCJdENSAwckYtS1
	wGCphryF1ExzpiEGdM4SRgHUtrZEVAJm3bVstgMFk4k7fYniNHJfzyURaM986tcIKEZQB2ucHll
	dRWpPoPb+xBpSokvllQjcrHLR7rXfh8XxSfj2OTXbZxWD94VciiDyTzNoqFwvr4AN4SqpQLD1aS
	K3xMyaRABZOSQCdXA6RWWEwPJIgA+u88dbXHooBZrThCTqFAJXDs8AJrzLCxCdEpsNX1e7MA2xu
	NNxZ5qFvLpWD5X+t0yYRc038AEbrZ9YST/QJfqBK4t+qiZPFbhJl93Cf4sC2iEExl7x/S2gzVGx
	Tu8WkHPdzozzFzmHCDSP1cXcwEUZwMkXIt5osgUR8Ds9lP9XLbuTIx06/lSm/GZG/tICXtwDEMj
	AL+S5wKeQUTWrtv7sOIBUG97PYs6aKZLqH01KFaRmZUmBBU5d7KrB2IdLSaT43x7eJNS7jqdNCx
	j/ywWXuO7T86bb0Sriz+g4XCMm71tFhGEueMcMdjkJrrJW1GHbuCyhDDpbIJU/8IxSNcKm7JmpQ
	FmjG6YM9mD+OkAXUmM1LfQPWtDNCZ2dTPWLUbnQpmUdn378rQ9dHVIIZ2WPTCisY0omL5VguiZd
	HxNVNSwofZ1UyRhHhT5WgDakkrVie+Ji1NkZmqE96gn0rlBUZmMeabjbi4CtX2Rx47DpeDWZrAI
	e1iQ==
X-Received: by 2002:a05:6830:4aca:b0:824:df9:971 with SMTP id 46e09a7af769-85abc7246ddmr898761a34.10.1793142348950;
        Tue, 27 Oct 2026 16:05:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:05:31 -0600
Subject: [PATCH v4 3/5] dt-bindings: serial: snps-dw-apb-uart: add
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
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-3-d37e018fd0a6@gmail.com>
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
In-Reply-To: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
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

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible to identify this fixed configuration, retaining
snps,dw-apb-uart as a fallback.

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

