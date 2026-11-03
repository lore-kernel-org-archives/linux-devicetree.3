Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742012;
	b=FIJhyTBEggQY4sTJe+93iGYuVTfWAQIfLEZE4/7gMlr/wEeckfocJqXRWhGCTyy/M9mH
	 ceQVzTeb86Xo0ob9itYP/7mUNXweFqsg0MG3BRRv+FtgTgweM5I/x1Q3HrmgPgxGfV4Na
	 PGjfz0bowNKNZAOXLHJiaOtWQLQh915A/tlxCLon1aie4A6IeMiwtj59h5RTkK+cbuOh+
	 HHzbw1yO/TM2IydH+NJ3lUI0jBmYIPGg/PqmireUGlmX6ygaCwGhEyR9kWT/sQVTtZVM/
	 ukhjvbHNVt2dtb8WCpsXE9eQnmNRJ1KCln6BVWluKdU658jhj8Igu/itMk2xi5k4cFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
	b=TgB6dddsWcuiuWMJ5Ml8R8ipl3Ua5iQpm1xGjMJPE7sjc8i71QY2AmZKqIPZiLv/FgAK
	 NWNkfrcWisUWT76Xx/Ac5bOxT1z/oRIV9/gmV61Edwd1wKZnspeqRuZS9Nd/hskeG/Obt
	 31qmqXZvDTgty7ssshC4gqjk+nKZAhBTmR1oEW/ZvJMtrEfjJhiSaOdfCBtsNC1gTaapm
	 eXJa3D/h8vL8dKsFifggetm8EApv2/uRenj61OUSmmfZzIq8isc7nZGPEubz8HyMbUlrF
	 3FQitrLf/gxKRetOln85x0g4D1qd4RvmChNuEhNg0FJ1oFhsdk0ee3yZ6zN1Qtho/mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7mZ+KIh;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AF8606D820
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 21:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68AF8606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n7mZ+KIh
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-475920b9ca2so49508fac.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 13:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742011; x=1794346811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=n7mZ+KIhd+iy36BqqT4I/trh5SfXup7BgaSb8QuJIUIPwWf7lxWDj4Z+WbNHY78DQc
         irK3EeE7y6ZgGlOtHE3LcU4gj/hKxxZAOU9jgYSgCDlZGqVhIDDHrj285wEHJX2uiyOW
         RSZR7A02MEvSdHpGz33tXN8I0BxQ3EpcMfvy1FgS3Yi8LL9mtaA7RWE41s/s869lxHNA
         ZE3B1fmfQ+8a5UnNBfSbIrO4KBFCIBpYdll+fObbs5nval6qmwji91gAt7ZLQTqLQjit
         5CoXmefAcBkTHFz9iXjjSHfAiRvvqLzZpC1nCDvkpfneg3HweCDM3Z+JQSdZIcJg3gpw
         pRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742011; x=1794346811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=nKWT73AyncUJS5NdTxBjuIYDXKWTgM144NPddWtPqIDuIPBhm44lislqwi+/rOinAE
         htJqWUVgLMfroN1S4ikg7JtcUhF6pHlWXvFUpvNZ0MtU/UE3J7NRBHG5I9KMI8VFTET6
         3YZadXvdtO7J1hfOomOXtqG0NLw3paGrpMpPjZMBtKZe04Lx+WRypc013j4CMD6Y6b1t
         Bjc1CDsJ4AguFlZWDU52K3CieGHL816nl83pkobil9Zwjh4xzrAuRXP3wAKSyj7cVZio
         Af9B/g/aDu3iOkINzIM4jaeEwPN1UMC58+2Dbp5AOAWMa1iOtbMfk/QdHd9KZBUCgU2x
         DwXA==
X-Forwarded-Encrypted: i=1; AKwUvBx7AEsY5lAvvR9W4KpLX+OTBAK9aRMnls2LrplPPcwjT4f8oHUn+yu0ffrGoovGHMgKUcgU5Zm0VFYl@vger.kernel.org
X-Gm-Message-State: APuU4Z+u9iRpV7OCOC3JeLAHUS/mV9R6+aQLG+YtcfrvImb1WdejSIC5
	2AI6GH6fJQCknViXoyeNEvUpv/bumea1cXSNZKHgPmJb/rcqWbr9q3Km
X-Gm-Gg: AYBFou3yHxRMdfko6XsbaZqAninQssVO3BV9PR1Sj5/24/f9PAz1aWVZyQ1MkStPjEk
	OjxYeLRqHHFIWbc3QZsB0ooAX+/S5hbAVCAcqrOfWxREDYeh0TSr31JproovoFcZlrPMG8Ke0W8
	vahZdMwTobcuBM/Nab9xjwKIMQ5ABbmp+vQGovvifZfx9Z/D3LNKHiaOHv7CCQgP/7FdDYfUmm5
	zxUZ4oE5A52IOI7Gc+c/2FTC0ni6Wwd8EgSfFPuPwxuALSWcqhgM0M0Y4y81Q2lavSTNNtHhyx6
	k7kBN+Y0jk4XtE96u9Dr+6xLTjsIJaqBUSECHhnh+WfMQ9GOah37kxLGx1gH6h84Xa0VQPmuFYW
	g8EFG1wKwnUAUTmwNmSA2jAVVAXABy1zT+C/tjIGJifAPnmD2dvCeyt699adXekMN7MIDenfZ7W
	kt2M0ivW2HV5uA6l5f+xs9JL+dbz4muCYBXxNdbl9L+k2B2MI7AegdJj9LjV1UDiiAVTVoV7J1X
	Eqx+IsTO8iDd4oUVGxZBChc2T1Az7LlOHNQz/LFcIpUO7DUGJyAAHGyve7b72P4gqkEu0ZffFO9
	HTMRzdKIQXNiX+4WNKFZAiwOuKzJqVrphQTxkFf9rF9ApGO0HTskSKdgtpIxVHneFALzPOnrP69
	D4LMP1fTugZNDLpZAo0DIrWo2277nt5vveM64ieabi+j2SitgySusXHU+XOGv0LINCoZyL4RPwr
	PVq0n4R0RckRpWXIWCnWAMGkZRZVNkQUe9ErqXORCn726hxWl7qLYH
X-Received: by 2002:a05:6808:2507:b0:4d6:90d4:6bb with SMTP id 5614622812f47-5640dd9d63emr10403938b6e.45.1793742011356;
        Tue, 03 Nov 2026 13:40:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:59 -0700
Subject: [PATCH v7 06/12] dt-bindings: serial: snps-dw-apb-uart: add
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-6-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
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

