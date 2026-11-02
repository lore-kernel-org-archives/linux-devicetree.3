Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649329;
	b=ro9Emb+ZCzII4x5TFbZmdJUcQdq2cpg6iEMFLLh/q+JNFJ1DW8nFejXGIo7oAMXLVTln
	 SXNQ97i9/ZpkYPkuBdivK8igquofRwf9+h07cIOd3B0AiuNkQEvFBc3EKL2DU6ReDUZ8Q
	 ZIsvoyNM0IamEiVbEZSDiry3VlcpLRUyN8VbLQ6pQ1Ey5qiQnC/rz4NKlLhBIShk40WZL
	 C16O8zjPe8sarb4sNSZEAzLY8jhPyG2ADhu1Bx+193m2sGxS9TsPaCAJIL6DfqLMeKUg7
	 unRYB4wTyUNj9XU6nZrIIiv5xSyz/+JaM4QZSkpd/kupvBjpxhklUF9egmq8hA4S0Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
	b=NXSh3JsU4kUsbZ0TnTDjFhkqFTv56/Uadj/e/SkKQwYPlEFKhStCE6ypuC3bNLE1snnX
	 dcLdF19gyp3o/OO3Q+O0JIEVAj2ss8sFsUWUUWelPXf9VE4PxiNTeIw9+vO0kc22ctscI
	 iX62ngOpJ2gU/8WQ3ZZF5Jk/UIqyBkAFNySm9JXKFV0BEarVjodm3z0Hp4WlV4PibLK7k
	 b7U1g4DLllBsevPqgw5JOKOU4EKBAEKtvhxBtJQnmXWXAaThEMlA5ju2Qv2kwLmEVg4L3
	 Q3epQtT5xEawMXJtEujIF+fB6eHPF0keXtGhGlxoSnGoyRz5SXreY8e8xTIMQDxtoCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SckObWPI;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B96606D830
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89B96606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SckObWPI
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-48ed188ee81so1739857fac.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649328; x=1794254128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=SckObWPIPZ5U5QUaJScnIkW49LvzDzWqTzYMi/4o5v+UApWJzMyYGwD+zpGJpOKHEm
         IuzOmAPd36qMIawkt4/9gE47BRcusSGpcfV2qs18o0knGxVzJTV/I/vEq2VUwJbYIAAj
         LBDM9JRH+zTipoD2BpozV5cLIoMVR0J0a1QEyHS01Y4KxeqndfSPDKNYyLVALMX+0VK6
         BkPO5sQxZFQwk/4Pb2009G0bWdTg9Bwivf8rJ4ky5ZxOgJNEcZ39XUi8cgkpmqPmiEeI
         ijMaxjlFWyYOQ6YZHQVUS+hMbQaPEM+wwd3pk/RByx7BNS6hCRCEEMNVFFYzga7+tUHE
         pklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649328; x=1794254128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=rcQHSQcY5wAToaMWwUUiYbn8G9jhRC8QQXirroGBfAOZxSiOIDTSXtAsymm/3Gr+zO
         /ibQ/zt8GN8GRBK3cj2pTnoUS1xB3H1AHALNEBtcYBDrO+dHecXdE8l+rMn5feF74X2I
         abIxGRAcZ3/3ras7ubNS2nTLMKFjkqIuGDH3oNHtT1UQwHgOaIzE6ZIJqFZSrrO4UFOv
         Kgi6QPE2oD1QVghiLeVtd/awxZKmNaIYqttQeWZidm7seCkH+NlVvU9GpGtAZJhDWga1
         g35BT4ugZYW/lj77ZbKAFtsfyEftnuGdLYYRiORRXGOwOButp4uAgNPIS6k7SUMqjNnN
         VGDQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9BGpk44SnZp7ePKeCffDRSCTKsVgnRYBXZz4WNiI332Jzjlpxy6kQy1whIASHy4RCATLwiUrg80MI@vger.kernel.org
X-Gm-Message-State: APuU4Z/D2BgCijb4q6mlNh0TwtWO0uBfQ/mf/CvQvMwHm07kjitMxbeL
	RsyVSQ/9jSdsw6u3bucFEpsNSP3DyfRMtAC1ebJr9AoXk3PK+d2eV+4B
X-Gm-Gg: AYBFou2ApqLfgjxkaJ30kJEgs+e3tsa2v5iLUjYvUHQGSpWU6iRo4aV2ZUPNnRUybEq
	V1I/eRb7HD53jcN7bLlRaWoFFjs/CBqJ90hXw6hXNErBQ8fgb7hm9EqhJGLPPyT+rN+l0FYrMHr
	ECpdXaX2+UeokT0yH0twvAe+rAaMCjrFp60VadaoS1G3Xald5OYyJ2LSD0btqda4cN5W4eiEZ/q
	nr+u/bKbnpa+GUpogZy9p8Bjd1xAB/Kgc9UN+kYqimLGXgrLRTLeQDVTwlbVd1M+HteF/8LTUE4
	DIwK8PSqX78P8cdYu7DNizi4b74Ofp6/QsQtlnHv1KVas5Qj2E0ypBMJunlFXaqtdJJO9QrpKeK
	aZIwJbWtg2nWYc6K1bzSm3XTGJeescCDs1K6wbi2E1R2HyGM84NTOvV4vsA4GA2zP5Va+p1QvzR
	R2UbItewjg4PhN2vmH7eriwsa0lAiKOjPjbK+/TZBjN8SdYO6cdn40Vz01/04h2dhgFP+8k40Yk
	4//M6HAEGaSCJpbtQB19OmJJLgXdo2845ePqAA+KiMgd0H0bvcprvHjqUdC9xTZMjM4tLlglJ9R
	HPoBnLvkYk+vxjxAAeS909wdZiPT6VMOwzZKokHb5AEAPmqIHpYCTAAC0Qztf3VMnXU+fmKA+ob
	d4QpL4qNHg8851URl54D/KtDAAfNUXJDrVQXqZhysekkyR3c2pyIX0edaUQ6QPSf4W3hB/4cJkA
	g9vEp1vtPj1PtE5n+zFWIddfjA3XncNA9nN9TxWLIDbyG9ePptVnE=
X-Received: by 2002:a05:6871:580e:b0:475:e2e9:4f4a with SMTP id 586e51a60fabf-4a9076b7508mr7711963fac.24.1793649328190;
        Mon, 02 Nov 2026 11:55:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:18 -0700
Subject: [PATCH v6 3/8] dt-bindings: serial: snps-dw-apb-uart: add
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
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-3-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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

