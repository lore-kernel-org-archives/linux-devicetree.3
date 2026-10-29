Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299660;
	b=XAdIdwPUfkC54gHXcawkGXYwzYXzdQ6RYJT34X8XeJ6uGPQq9TS5P/BC7WOUwYawqVcD
	 DlBEdVpAPg1t90x3pYiVScjkqmffdYil/uuvCIgwZ5TWpVx9+EZvGOulIDPfRw4NImqs8
	 7arxqXxq/gGs5ujvpxdw6xOy1p9GpHAqIpn66nOch5SJoF3ej9dZpzugprvl0HpISmmO8
	 UoV3YYnp4Y2XMJTi45nYlIxtMvmfM11iGqMn9mJJ+N+1kUZyqtQWGZ58/IXoH9FRlXu3q
	 cySfJv7+D1i1CbM351LtvQU8R+q3DH6osO+4lDfAKtidtuJIN2s54ykLUtcWtT9RRXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZiExINcBxtPR/Qkmd5Xw5xLQgpBI2Y90lv+3jQt1oog=;
	b=4ZHkY74WaI5HRc3ehn69DZVA+YTdMzJ0b0Yun3lQO5ZJ6wTh0aTzIxWSlKckLo2XmpwU
	 gfx8hkgOVFQefPcxkkK1EbEhwVu1rs+6NODA/0MD86uYKHpqzp6I3A/nBwrPALKhCwxHo
	 wOP8KfaX/UK1kIQjCWJh0/eMhm19CEFTOMTjUPjCeNqNkZYN+IefLj+QvaHmlF+eFDevB
	 jgsDvovshOJdCs2EO1+TIbroV3fz+ysnpUcNHUk4k+6+aUCyC5pW8SwQxA6pD6nnlLvz1
	 Y1h8sVy8ZMGhODaFZZWZDPrWhtf3BwrHL+PV3KzooZ1Y4xRWhoz7WkitrhYbkVWdRBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3l0uMc8;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C3460A3806
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89C3460A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3l0uMc8
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8490a7d6696so1535196a34.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299659; x=1793904459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiExINcBxtPR/Qkmd5Xw5xLQgpBI2Y90lv+3jQt1oog=;
        b=H3l0uMc81HJcpPRBsywanbMbUnGdCuNIr2O7sufq6Z8PqEpFB5X0btCbPE/TdARDBh
         9kSGajs9GDRZXaveRdkg/z63lGQOMQNGajXTe39Orx2zN3WUYlrc6EcS38zyMhEnzFeX
         WTDpQ4quOeVVTFbep6szXGXMMlLIjs2mGrFz7yTe4i61t7yLR3iUWF6HnExXc5OiPEv2
         yT6PXCxybLvwe8InLzlvztmydU+pJlQtQcqsUhz4vbALr6kC9FsqlEuEc9rUOUuKspjZ
         8DcLmRVSKZszIIGaBLRToY1a4gQhkQRPhU/Taw6JiPqyeZrc+WnVuRAB+VB9EbqjvmMd
         i78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299659; x=1793904459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZiExINcBxtPR/Qkmd5Xw5xLQgpBI2Y90lv+3jQt1oog=;
        b=lHY+HVXFhja2upofR0DrR3ImXp95E58swSxk+jHXviVwPayoAtRxzhzzqufN5LfPZE
         H/yvP3StkKwbLzr2bzL+m+NBiK6S9PsPgpvnaRhe1brK/3wtL52rhC1xGxjST5FrshRs
         aGmDmDA89NZ/ANAiPq4egGXZjc+LS+aX8tixX8yhuZPx5V5XDZnsDMuwX/TZLaipd+A0
         dY9lkgYSVSPC6/Slr0vLrOqUbb89hjJ/Dwf50O+xFm1yMWVfJRhZs0yiIfyAL6ByJE/x
         6n73hZnpK3Ac/ZHe9/IKXwrYj4e4SEbM67iLAifQosKVt18DAoYcgPjFf7zxTj0gHOvr
         h0Ww==
X-Forwarded-Encrypted: i=1; AKwUvByyiIXrzuu+izUMdGQ7hWhYsQwUDkvCC3yU6myUxntWfR1TPk1Q0OBmLDHOICWXy3fm0TNZsJK6ai/d@vger.kernel.org
X-Gm-Message-State: AFq9FYKS/Z3BDNfRv0m+dbWbPwHka6yAGf/jYcNk1Efy6LRo2LydymII
	xyUJrwobiHyre/wmAVZ+/OHzNumkmP4lcOluJJDkvQgFewoGvvV0fBfe
X-Gm-Gg: AYBFou26ncEBgWwvbw0+9PkDF3GkSheAtNzO3Ea60Qy6b+RrXou00F6AKxuYw7OkmP9
	uxFIJ/wqGY+i4PMnM1y5yTmf+WYZj7SwBE8K44icWrEezS0dm4+pPuy3oFo0TbjgnwDusly/eEG
	NiOEtKktDVfrAi2C/2jAYRK8r/DzuHX1D2qZM2vyMOzRpSYVyjpx2qhm59eqJEw1fSqTvwFDrlp
	AbOkl1PHvpYXD0B4f7jfLc6XiqNu05MVfOWk7hNd6GXNsFay1CsxyzYySG2UFiOb9Ivb+1T6ATO
	TwMW6TDSTNp4s38gxrnH+ab+RczRjb/Eer+QvQUAdVoJMkB8ZYL7vDLOJTtyhnCfYxubq6MSzrb
	z3kKwhcwwFm8yhHWVqjq5ajIC1K4W5qX/tJpYF1A7o1Dgrb/nZKUMDKXkF/Ism+E9Iw1Fg33GwQ
	vOPdqvKb7I92QgKurdbISpEkHY9GIiU03T0ISR8K3oiQ7QaYg6IxcetWSMDV6S5Y2UDk4eb8UNA
	W6hsXPFvx3gKHOLs/gfkj3BtZz0DWBKj/SzJuAFdVCgNZIrf+K+A2PHBN+94M0CeZbDNmwzrbFW
	/O2iRIpsPRt8Wu/DGm4bt2FIZQ0/VwlZSzkZMhakcjS3r5ZeDT/3wc0ynpnQ6+FbMltOCRR0pGy
	nEfkjWRAez5VqEHDHE9H6/JXHGpfifZgc2nvzGnzur5bZ5df6fuvIER+7D4Sd0N1pt9IRFHxeRM
	xexrgYb6EGU23Lw85WIp2/Llyzpk+Qlob8Jw+a5ElBXfIFeavPk2s=
X-Received: by 2002:a05:6830:3153:b0:830:43b8:72db with SMTP id 46e09a7af769-85d365ca9a6mr29214a34.24.1793299659371;
        Thu, 29 Oct 2026 11:47:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:27 -0600
Subject: [PATCH v5 6/8] dt-bindings: serial: snps-dw-apb-uart: add
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-6-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
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
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The A523 UART integration has different FIFO depths across its controllers
and reports each controller's depth in the FIFO Clock Control register.
Its receive thresholds are fractions of that depth, and its optional
register layout differs from the generic DesignWare integration.

Add a compatible for this integration, also used by A527 and T527, with
snps,dw-apb-uart as a fallback.

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

