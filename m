Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A783D30B53A
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 07:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817353; cv=none; b=N5X7WMh3BVrw5z1LhxYFnf0XFY4T/cJYccxiih4dwpm42wLH+/ORx8oWZDsf/W9EOHqBwNtSQfi6lW1weTc8eyLwvJ9eRdmExhLknBna8dHovV2C9aBxq8UkzwvPZsUSX5D11lE7K/4HxZd2dBaONbs4RE9IHHTwTUbYeu17Obg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817353; c=relaxed/simple;
	bh=t4/SR8SWQmaZ5WztW+CHvg/QC5M34jhKztRXj5DMFzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jNBmuErkWpeHKqcpL/UXcYE0siZRRRaEbDTS+Q1K5KqlQj4SYaumD0utDlU83l8nOdSDecCvn8pIWzjLh61pxn+72AGs0BniFdKZOdfOKyKsIQ8tugpgYM5RCuy9jApoQOepgl0oGy4t1XteTf1KRTphmp+mV301bVrjv+QA/Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b=tQggt716; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b="tQggt716"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cedda2ce6fso2676835ad.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 00:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1787817350; x=1788422150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vj8h83cNWEkfF8w29lRmAWs8Ge/MzQCuHu+NZTz6F+o=;
        b=tQggt716SVGx8C7jywRVtAm9cJxP04Xwt4qonOqre1trhG2kGNyRaxGUv5S/yNeB7Z
         hKn3gLJa/7l+HB2PCjpLYjTMl76WF6HuGae4QzT4jNUX+DdEcr97x+pP8LyVNPn4ir+n
         RhF6xs0tv3g3mA5t2UoEvxeyvZkYrKFjTyWSqf+7iYxMT0/8b4JReDe2Y84s4Q1dUtzo
         /gG5OB0RBKn+8sYqQvWnoO3ls+/fpAdrhG3eO1oEL6sBbE2UhIfDavp5N+rzi7dHMGnv
         DL4UbWIcxoNg0DL3gB0kF5FPx6ILTTOYeIhOuBFhaqaZT8K1cY9iN1KYZb5BkrLuyBSu
         PJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817350; x=1788422150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vj8h83cNWEkfF8w29lRmAWs8Ge/MzQCuHu+NZTz6F+o=;
        b=aYD8VE58KatBeG/qjJx3/otg9lWDhUPzWdhWb+6YbLbZUYCTyRI/aCSqoBKvw+ZAuv
         1YhUROX9C4iyIFqt2+sXv1rvN7FraM3F5ZKWx433dXPgbuXoBixIezcj/Dh5HMmgXlYl
         Q4qHliLMD/09Aq+6FQQD+GkqE2XklfwkGVDvcTGMbmGcF8+ePGt/VuQtMAg4ooXDiS3m
         +G8lnDs0ymkP27Uv1lciS/BSmwl81zu/Q8xRTo9N8kUmTNk2WiKGmiAMgpdxGPS2QIOe
         9unEgULApLNWnHwm/M6+MtpL+dPGdK4Lx+Gi8ToObDp/dak24tBFSH6H3OCevacg19Jj
         w+4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpY+aDXM2weNCXIA0brz0So1khAyA7eHkhz1KoWBYaJLSQQEvd9DG5gAiO+NTQIbVFSERho6fE/EAfm@vger.kernel.org
X-Gm-Message-State: AFuF++ld9ijxa13aFcuT8a5BUPv88cNx5m/Eee/li4eM5PUKw9XXL4Sf
	6C7/TZR+HbqHGJHfnEgvpSW8II78y+kO+k6E04I3C59RJ5EXty9X9J/ZVOJY/3iCaQ==
X-Gm-Gg: AR+sD10DcTzrTTfsGjG5k+LVTxskTqN0hnSiVSRBfOndjNaUgiyBo4DbHyh5hfEaoi1
	sI3Fr1ivpbloI/KAiguCsCu26OIwczi5o4nKwMh8pDyyCHLHy24DVZoRD69YotfIvlYIcfA/777
	HlMuuB/kIkafnSCHXyc6g9E1EkAIVvFlciGUxo8G7AnQ9ek9wqtytfOnX+0i3YThv6iaLYfj0wA
	Zovr7W04bVx/CTHwZiCyHP+KtE/9TH8wLPkUr9gXdn5UHukn0ROFGyB5WCUUaOzg/RROSuKv1v9
	+Nw1nAfoevIota8fFLs43hBLxwaJIsgDBSiKs8fakjp81oGf+I6GR6ju5mZjL+S5rqsmMdRNVr1
	Kt749hBhB0DOr19k84OMx0yrz0S4QCK5tiHtUd/cS/MUkzTmA2atJm5+mxEevkdUk2pD4hipsDm
	PJpKN/83ePmUmROe/xnNJu9kFUA6EalMY+5w+b3F1TBJjEw+Djc4ahOBKJDHNh6rZ9jbSEpr8=
X-Received: by 2002:a17:903:380b:b0:2d6:fec3:bd57 with SMTP id d9443c01a7336-2d707b6ca38mr268151405ad.14.1787817350050;
        Thu, 27 Aug 2026 00:55:50 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c2b4sm24641685eec.5.2026.08.27.00.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:55:49 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 27 Aug 2026 13:24:42 +0530
Subject: [PATCH v2 6/7] dt-bindings: beagle: Add BeagleConnect Freedom
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-gb-uart-transport-v2-6-a03bb1f5fbd1@beagleboard.org>
References: <20260827-gb-uart-transport-v2-0-a03bb1f5fbd1@beagleboard.org>
In-Reply-To: <20260827-gb-uart-transport-v2-0-a03bb1f5fbd1@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2301; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=t4/SR8SWQmaZ5WztW+CHvg/QC5M34jhKztRXj5DMFzw=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBqj+1DBpvxBrw6gBdnsE8wvudZhudc7tdhHKrtM
 d+ionZN1JmJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCao/tQwAKCRAFzvXHieVa
 dLcbEAC6bUVXSX32NXCQRkssEbDKvah2Wau0ZPIEkRI1pohKltxCcJ+J3gLeAEpqmfWoMh9XSUm
 2Pd/ZQt/fEy31azAHIzO/axqtKGNag2/NAMd1cl8N5tcbN406xM2E2KnOUKqt84uKCwyCfcHuM6
 wIU2QlsxGzVahCuy2WN7r6Rpgi7MU/Wfo/XIGUucg7Wo528MIJNh+Doz/ytrJ6lVv53ZCdHoAIt
 ezSnprvifKwMDsQoGLd0vsggeVkOcXIing6/4EgcDPqKv9CKnEf7Rz6g4N3xCWLXLooN8PEwkr2
 5G//BAWasSbfFE9t5Zvxf5WxllIEDJfYn6Mx6Zca8RwSXtjAXHVl2BGCms/s7wScrgyEN4ydIfB
 L3LcZYu6VvPPSL2swqF/dI4DEHapg0EHc/PihXoZyQqQGGEUoe6TGpTk+7CGYA43gKxoDJFgMtg
 q5Psoq50HSpAO06AlWcwqZ/6zSwGSc8jvyIhEEU8Hf5lIQ4RLn9EZ/vKx/4AUw4xS2MzbSr75tz
 82qbRWMJIbQ0YOM27IAGIEu3VczXQr5+LrELfzhSdCwv82Wu8F73v9LK62KosEbNEdmKSce3qGc
 SNjQlt6CArQ+m+Gc9WQaWl44SCxoM6y4lt6Cz3ar6TsksOb0fhj4AGoLnGYEW9JTkcoiLtgMWGF
 +reexnLazFuUAFw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Add devicetree bindings for the BeagleBoard.org BeagleConnect Freedom,
a wireless-enabled board based on the TI CC1352P7. The board exposes an
MCU that can be attached to a host over USB, UART, SPI or I2C, and is
described as a child node of the corresponding bus.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 .../beagle/beagle,beagleconnect-freedom.yaml       | 39 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++++
 2 files changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
new file mode 100644
index 000000000000..be051a39acdc
--- /dev/null
+++ b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/beagle/beagle,beagleconnect-freedom.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BeagleBoard.org BeagleConnect Freedom
+
+description:
+  The BeagleBoard.org BeagleConnect Freedom board connected over USB, UART, SPI or I2C.
+
+maintainers:
+  - Ayush Singh <ayush@beagleboard.org>
+
+properties:
+  compatible:
+    const: beagle,beagleconnect-freedom
+
+  reg:
+    maxItems: 1
+
+  vbat-supply: true
+
+required:
+  - compatible
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+      mcu {
+        compatible = "beagle,beagleconnect-freedom";
+        vbat-supply = <&vbat>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3ba56cdbf056..d047090be5f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11334,6 +11334,12 @@ L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/greybus/gb_softsvc.rs
 
+GREYBUS UART NODE DRIVERS
+M:	Ayush Singh <ayush@beagleboard.com>
+L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
+
 GREYBUS SUBSYSTEM
 M:	Johan Hovold <johan@kernel.org>
 M:	Alex Elder <elder@kernel.org>

-- 
2.55.0

