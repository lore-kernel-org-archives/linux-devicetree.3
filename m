Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911952;
	b=aFsmXUuYt63NK5/dehF8rSXcXbu7sT/O6bsuguobO4USplUaEb4zN8SRnim0G7KnfCy9
	 SgUX/ThsMjp/STjH6aRvJdiOavObsQkm96hQSlMBjuCyS/6Sk1PyoTyBkE3eXAEJCXryt
	 R7l05/2HuEbmwMU9DzDwDAOJ+fWItLed/Fdl+Kp2Mg2KUCz3CcccSVTDGQ2olQAQF2RyB
	 KBhkVq9pTsqKV+ZUgO2GyffuevpUl/aRdPlTHXF6ysShKX7GuU7QS+5RknfDeDd8jnJ1E
	 7w2XcVUJHnFYXRxs2CL0UagiO0QorerFIUVwPdpmMINT+S/Ohz5gTKqRuBHOW+e4grA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
	b=KAqIY8oYbgx9QVCE9utoGaQRgnyyNGyqwl19hPXCSIK2JTQJxYZH/CGudtaZqbkqFPIZ
	 bVEhESlymPP92M0KQ93aMoQYRMguUS41W78chhYtqPe0QB1plv2DgdAd0Nb4Z95W2xaX2
	 LPwo/+85NcWp7+BFS1Y+iyYE32iPSWsEM6yxB72gChNuFtXWJZvig7TzHPK8lB8lLvoR4
	 dfgxLdLgahy24zYoRc9qYGy4ZUY7MBvUj3CCaX/zhjcFW2LYEklF4+cYbY8BCx/4cohnd
	 cnMENgM69ewAp1tu+0rtdnwryIlWtLC2frK8sbqQ3IdpYOtTidOMUPUVcwC3FEeTQjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiI0U3KS;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD982606D839
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 20:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD982606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiI0U3KS
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-843cf077f10so9729a34.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911951; x=1794516751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=oiI0U3KSmCl5sRBZUwtFDePkiUrIoQmVmZ13H5QCiPiAm1OjSVuBtrsUOoyUH1NiDP
         2PDIPcsXMAbo3IUxDfzkeBPWvvtvxg2WWdUwYaUZcYHnL+sdVPpU0eeQCAM91SGw5vZa
         OXuT254k3dNSl6rVoJk0PuH4kTpkYA4TZ89sCV0cZVCCSMU3k/9vLxOAGaZtqKo0x2Rt
         c3DUorYK3VtrLLGzRDn9WADGXMDtWPCuqqhHvAZ3eYcyQdSSabbmag5XSDKaLWbvr9ja
         Waa+dfKp8Rfnexs6b9yjhsQLRgzLuKpCJIbY14v7HGPlZajDYdkGqKjXrEMjIC/2kvkP
         gnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911951; x=1794516751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=pSi/MEfkhTWzU3GXzWY3pgNgyTpgj6LOdgrbQXaH7Kp0GFXkDT4noYj9fUub4TAaBF
         UeObVrD29NDAFxSD8tWEpHxIXA+8TEyR38rLcQXmgBmELWApxufo106TT6/d4DioPqBD
         D2tleIadabFfL0rXaDH/S0SfNvcM7NgrPefawo9zFICJLgsQ1VwVuCOukqu4wEF2WEZB
         8aYBq1dNcpnHwv8ja4JngJ6TIgOOlzYDQuURLYqGa2kSekCf0DmLfVo2u54QGQUuxjz/
         deAXTFan9O0Dnmq4OrjCsEHVzIws5NFkWx3HuF5REoIgfdIEnzye6iX59cCKLR9u4h0B
         K3xg==
X-Forwarded-Encrypted: i=1; AKwUvBxGyxYD1LCodCFG3NI8nNodJ6BnAuVObcqJkqYTGdseo3ITqj/f0nQEX9zawpslLXRpoJW2L7iPcdjG@vger.kernel.org
X-Gm-Message-State: APuU4Z9t8M/vZe/jXmXxpfZg3uZOOs30dPkQwQ5h3YVKTX2MZEh0IMKE
	uQb+BRAnIvsdeeuCiagebOWA9hPKcOGZrHOpsiEetksmf6ccnnVYwvDA
X-Gm-Gg: AYBFou1AZiABHk+b/od8BzJLLcMqt3hwCZKreJahPKJbG2YC4JNwAJ+3XJ6dGN+GZe5
	9aPK4r56jyHXM+H5T7XErc2YjivrAyb53yth+UAo2O+EWa+vjZxjnUxBFf2YUko6bG9Yf5WILoJ
	Dq+NcmyLs/DZuwAKHnZp85Cu+I/HL6Z/cO0/YohaIlhuWN5xdTi170FmqvaO6WG6FyqwjE/PIGa
	Z8J+ZrLBuBcKvVD9RyIJO0V9P8vZswRqyRMelTOAgKa8VQeWLXsW2IOQ0ZbWp628baMboeM+3Hj
	t8NpWbC6QRGQLaqborEw+Uwm+bqyf0L4+j3bkiBbD+0eby820MyqMHes0Xy1lQeGCdVw22kDx5c
	fYjcBzlSI7wCYVOFLRWHLus869EPLNdGuIIH+cz+YbeHz59NWPEsshgqMldngo6n/2dbFJ9JnUk
	5b8A1yT4cseF0YkpqPYY1pGxkSf5itQoQOUNPCF2zm24PFqyFI4klkWJ6p+0Hdm9TAIYPJaNdLY
	CgDYme56KVVfgjt75tw22V4cQcIjJAcC3vlkf03KmewVdlg7JX8T/XOYjSmyk/8CQnq5hku5l2b
	29a7gQpXIZGS7dAnJVFq1oNAZU4cJZOllM2h7LiWhuk/0TgKwoHgZSbgMh6/MUFJjjPADhA/BIR
	B52cx8MbDGQNM+padhAAEHNf8zfy4DgMB6HTHPwDJAY88wk+AKxEDoLqDXAf2CoUfzBivIv4ayQ
	EnHR8aFqfbcE+KlBrxEym617dpVMOo6rSKEOdOdb46aIT+rxNvyqw=
X-Received: by 2002:a05:6830:4c03:b0:81d:54f9:d6a3 with SMTP id 46e09a7af769-85f1ce073bfmr525242a34.4.1793911950589;
        Thu, 05 Nov 2026 12:52:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:10 -0700
Subject: [PATCH v8 09/11] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-9-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
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

The A523 UART integration has different FIFO depths across its controllers
and reports each controller's depth in the FIFO Clock Control register.
The receive thresholds follow the standard DesignWare FIFO-relative
mapping, while the optional-register layout differs from the generic
DesignWare integration.

Add a compatible for this integration, also used by A527 and T527, with
snps,dw-apb-uart as a fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index fc1289073241..ea6ce99178e3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -61,6 +61,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun50i-h616-uart
+              - allwinner,sun55i-a523-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

