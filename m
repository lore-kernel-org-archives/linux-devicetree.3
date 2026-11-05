Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911947;
	b=GIH7Toy37psYgr/1BNoaHvml3Eo5Y2exOSIzx9glC94JKLBbkA/uvKQqgvctS6JFopa8
	 pxAoF5dghGxzWmgNrYPqlDtB/sfMUrup4d15Pk93Vv3kTYi8l1/fRCdWIepa2z8LNn8rT
	 oPHIq0cULN6TJjzdHx3VRu1KFSOLOFFNWSTaTKN+uFSf/Kw6/SDTITsJun3/4AOJW+viX
	 1xWxpLRJRZLfHt4HqM4Wc14s0oy4A5NWhMZE7FI9Norc8ZxNC5q1mMj5Shg+buf9FNKDV
	 OnaylgDOtSkL6b0i13Biko4TulRwDObVwIkFvbq4fiQD+AyJAGxOXTjC/2+zyImugKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
	b=iqU10LGVoHDyJ3Aah4kSRCbuboPpcSff3K+d3JTkHmRasAVm1CBsVEbU6RtjJVS78+8y
	 0PEFzO6V0DYkWykUMR66Z961ToPn+oIqkkRi8/x3gzQXsAa1HkCgV4aFJyWwvvB+DGeGs
	 dFLmS+MYRnnTGZO0sxvHbmrrBZ2SEwcI75MNPsFnhdHJFY4lJoCGj8kzCEE03Dqv9OqPI
	 sew9u1ChlKwN3X4TYA74jse9TyR4bff+NpMR/4xv0QzUznfkkgR5c4BUt8kZMT8R1e+Zd
	 g4N1XcsmwVn0YtvrUkn/eWNS052KCp7B6mvIRhvGAWiAACuM4FUipkB8CXwMIqka/Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LbaBlWLS;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FDE606A329
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 20:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81FDE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LbaBlWLS
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-846566246e8so1143806a34.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911946; x=1794516746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=LbaBlWLS0+aIP6CHgi2/Vmx40Up/uDbYZsZuAE0S44vPJg+AA1gfDWBpnRrBsXiZ4O
         7TPKaCzdVjiw9lgUjwnFYStS2s8avEYvnkFpOaOJF3OTg1Gn36Ay/8sBLUubkOBK9Olc
         omLf+hRaxeK1gDcLFaEfEaL3+FystFirrlUDs/iXE9Hri4DyAudzSGbN3TaMhc9ECCyM
         7R+lagwDVFhwjbbFyuMLIkW3MN5UnavHOnLi4WDp68VWTgCVStVSKeJxKQEDIRizrOyN
         BWcLIZUmcM0PbDFN+6ipsjqCksdLQ55mB2ayk2z7QpXEicyOJ52Lp6Ke6TLtYy+kkiHw
         KnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911946; x=1794516746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=byPKT+hpTNAt9XeQFiHAoglCqAyM7qc9SlX4kUpqMuBBiUIw/354e9IOmme5ImAtnH
         E7C8/LapXb1RPTmL93ijspfB7njMqtjcAvIXUpXQ1ZeryHV9RE3cy/BAa2O0qC9pgDeV
         Xm5rAXnDXPXTkNPUsW8aNbFEbJJ97gf7ZFb0JIMUR2sa1Q5N1xWnulsmt2WkLgJQ0hiy
         pPIUPu1Z9IvRyOGS82uZYrLIX6XK8De3XhaHlgdEUzoE6iVBZAspwfkYX+CnbA9oeRIW
         JcjJRFhS8x/6kov3CWV/ssoEgrs4pPe1R3pHBxqK1f3t8UZ6IwhLeBk5qXE3g7BllpQJ
         PgIQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4kfTC8erKf0X0g8wYxZz8MSnXCsM+IQcvKXfbd+tq4LCTSlnYM9wGaZE4uKtH2Jp+Ul0FGNIXfKK1@vger.kernel.org
X-Gm-Message-State: APuU4Z+qcerMbQ1RUyeuiiKjtE+OgPYEXx9FlgkI4Bh+bcMcKeAvbfDF
	pjJ7Fu40E0s8w7otOv4iG1j+w847Fv6TWJLrg0l+BK5VZ5yxMLJKVTN7
X-Gm-Gg: AYBFou32chpV5jxWTAtVUUycgnIOmIIzPXu7XbLK0vTHTCnqiLjhw6A+WD9CGiZOSWm
	K1yXLAL9inLRCAWC+/hy7veKulj3vLAQIwSNnWTr45OZvZC9yzshiCgKHEDl1MhgdXBYpuVb1bf
	3q8XhUixoM7Qn+5L9yJ5g5sYyJYR+IxVxquWoN7VVVvek83fJM7zYFlD56J7uYGUSr6cIqSflUF
	g3DF1vhLP9XUUk8DVg4C3BQKZt84Qg9tRyrWFZTdetwV9tAEHo3rZay8pGelZwABgdNdnD4P7Ty
	R2emKx3tTx8om/9nm/UcA4XVFl7o5emPAvB1BnfwvISAD/WZo+xM+fbwKEBykvGbhfUXYHdiEuJ
	8a/Ydf5rAHVRSMGTGbqhTYwhkEB/wxTer+RMVG7MKRuQ0ivYXAm4Wd0G59O0QHFLf4KG6RAY1+J
	W/Erwuiblj6mdCOosF81lR/wH3nueIAWH0uORrwWeHVUv3QQJvJlNi71rT3jDCghdCD1+Uz2pD6
	miGRHp0kcR2bDtgfL7+55YvXZRtdAgu/8Wpefv/wdCgquBqd3zJ6y/ZLNqHDbpFj6A1VDeD9b3T
	QKp5joZWx42zB8nUixJx3Lvn+81p0h3T7TR8SKVjApVOyi3UqWZnH+XNOXwM9mmQLkiJWpJojQ0
	qkurU5d79pmjU3F3z+aT6ewJuLillDJklU8c3M0UOpOWNbLcWMTMhtK8MjURQtj+smaUZjrm08W
	taiq1lXPojd1O6SFV8Xrqy3FAk2wyMOj0UKQT5/5T4qjrvuKCNtv60pMXgxzyVEfuET2lVmMOE
X-Received: by 2002:a05:6830:2b0e:b0:81b:9104:5ad0 with SMTP id 46e09a7af769-85f052a28b0mr2500096a34.0.1793911946474;
        Thu, 05 Nov 2026 12:52:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:08 -0700
Subject: [PATCH v8 07/11] dt-bindings: serial: snps-dw-apb-uart: add
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-7-14024d2b184b@gmail.com>
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

