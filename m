Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110890;
	b=TXulONhBpqmzE+IK7b07p8FeQqYZXteIDkQAJJe3MwOZg+FvpYL5XRHmUSXOWqQMfPQo
	 C11LZ00efpDqQcFk4jtRNhkFfPFwiGaoaYQl3UYRujfjyU460ljK+Ll2X2+J9/L8nHGpe
	 EGs19jhKLfLdGSAzaEi5ujYbRbiunwf8cdrhWHHwYEYALyvc+013UgcsPJcFUyioC8+rS
	 oGsbzrXDU4kGXqidmYQjQ3BJbenu7YLIiBSIxfk7xGSSFozGqmRneh9+KIVq+U1QBe/kD
	 THY6GeSUlKMRLLTvKlsSnMekyx4nAaShuNMV9pTiK9uN30/lKtKc9Cj3hvc2FkgNf+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vt2sq8M4zEW0Jl+PkiArkaZv9si52iHkUjUxiJyG5ok=;
	b=eOkbv86NZ2K0igid2H6aTIPNFlcobAwLYr5o8IjgsGhsUk3tQgQ8EwTse5JcGK1D6Oel
	 4axQmJWulPh5DCyEL/QVN8OpGxFTC/fVDWcYYj7npgXp7ZOYPwKbe/7nAYp6sKtmAr3cx
	 P5o6uOwS7GMEYvrPyKDo9zmU+V8UpQMmdSj4UDJ2Tj55nQkCso5/hHrgCmgWYnqSuBpno
	 W15RpQIbpGxHb55fBlFO6Ch02/IJXnCfpGSy2DJnxpTugwNJ82I4P7FCYl+oOLJIEhwKC
	 B6zJ+gx4RDopM0J/uzZH11bsPp3cuc3HbhNGPQnd88dsO8FatjvMym3FsHIYxuI/ZLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wu4GF3RV;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E4360A2629
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E4360A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wu4GF3RV
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so23154105e9.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110889; x=1795715689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vt2sq8M4zEW0Jl+PkiArkaZv9si52iHkUjUxiJyG5ok=;
        b=Wu4GF3RVtlMvwvQYTtY5Z/8299Nrj1/0V7XaDWzkLj+fWvG01N3GBBjvgOz478SCTO
         aHPMSWzpaZgFdENoTzcO3nBrd3L1Q08CKY9UtKbg2pMdygeEy4PMELy5KHzaqbzrWIgs
         rDFXnsp4Z4g7z8yVJghX+9GHg5r0Ww+PNSctCiTwC+LXxhb45HEUqgYOG1M3H4v8Pbp7
         jBbvvBVqPQGsL+Wxox68DxCE05yuU8oROj4+lJj3y6Wg5wLQAV9m339KH78hGRJaqMHO
         KPge38ObVwbq0lhXaAx0RaTQIyjmY+ZDtsjEqn/53C6HS6EXvI7MTOpCuwW0wPe7c2X3
         aYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110889; x=1795715689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vt2sq8M4zEW0Jl+PkiArkaZv9si52iHkUjUxiJyG5ok=;
        b=FMT0qYEruSMcyq9h2tUTN8bU+ngkoNw3mpP4MGlMEAUs7dNyyFSBrie997jwvn4dNJ
         ZpZ7zVJKcP0FaSPdhLfdMzIY9madSzlt3fn7fSqCbzH1Kc5hIrOnh3R2Hee6xnMFBbV+
         nljR4DJLb3gyZLW4hz1GPQHIM55HRaO6b3LrDwl7j8IwfMlma0gWIX9p3jwrRh1f4+yM
         LU3xfwES6tBq1/teCcfvK3UiR+D5belb6Vfs5fstzzCpZ8sCHA5e3rYRkQcdPATpceUa
         wTNLmYffg1TvRuAR+nhCD92ZvoNCA6y3+6ozcqNTOMXaofOIi0AjAItJA2arRClkadno
         PjIQ==
X-Forwarded-Encrypted: i=1; AL+hErEgmUb3SUx4NE3f9TuG07SzHfOT9775RQcqvMeXKeuPxs94KoPU+85d6k8j8eTyAmzY2NZXAr2usyeA@vger.kernel.org
X-Gm-Message-State: APuU4Z8/+lnucK983xjidQ02dg88WGYuZbNvx6SAbk7fd9mQjGOkOScL
	K7qeAhU9XxztY7sBY/5uKj+uJasNh7Bwkug5tdI/Tnjv/mT2/7z9bqbZ
X-Gm-Gg: AYBFou24sP2JE01EP2Ugimf0J4I/uyNcSCstqdBEcIuV3ArU+MxRIFJiXX27JxAqex2
	ufqFvC4COirLtGmqLKIv+ZD1ZsjIz5mpecAn4IVFPIbARj9ZAQp28uQ69L+/F0nH0p1XE9YHnMI
	FLs3Ch5/vvIcxtAfdHUqes3jTluPjhb/eptA0EXZFWAv/7fdNEk4bImlfqxPIbRXa9EI5us/Qn7
	GFA7tKmUaBAOsufWN7l4PnVF3LISg9eyAMoHgOxqTH9DP17sfXGPuiA2HZ+3XLCiLAnNMhQHm/f
	9TCkYtAjHwIG+hk9jpkRlbNS0pNCJ18GQZxAMETBq7JYmSbzzSOAOzrplS5PEo+q++nYxfzg/G9
	rofGwakZLaRkgX7WZCbCaCv14iAh2fzJhYPMm46wu7rKkGHZo/2nUynEBPFhX9AFz8F/I7XTB0f
	yyt1Piy3SF/u9RCA3gRyPuh0EGC34ebNvXP/QjvmkKVyDwyEOYknDD89wQAKZFRwZ5vAqPw4tPy
	oaWsxoiciUxvamXRR5TadN0M4e4BB+ArWEyX64/ATBAIEoNFYwX5SUy6uqgli44E+SsWTlEiJne
	hOmOZhMefLKGuN72BV0VdK0FP6WN+n4Ags7UTdAwLkJ/00hyQTV36LrQHLqN9swv8EaZX5ZQSyN
	rq58ecgRg9c1fQipEDI1XKBpvo1sGLP6+DkSGtpGh04rklAlSvYKZk/m6T0LVthidaq2MsAXZwx
	6bCgwlUvA+EuYu9r7j8JEdoz2ZNp67xWvRtEBNmPOUMiF8y1s2si8eBWxODEVs4uFyVsBHbURRi
	g6ortzUl9C2X+9+oWZdMCyQqawrH234fO5GfQVmSXwCG9UX9jYxOZNx
X-Received: by 2002:a05:600c:a11:b0:4bb:69f2:87f7 with SMTP id 5b1f17b1804b1-4bb88812c92mr5507015e9.18.1795110888897;
        Thu, 19 Nov 2026 09:54:48 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:48 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] dt-bindings: display: allwinner: Split H616 DE33 layer reg space
Date: Thu, 19 Nov 2026 18:54:36 +0100
Message-ID: <20261119175437.2520400-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
References: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As it turns out, current H616 DE33 binding was written based on
incomplete understanding of DE33 design. Namely, planes are shared
resource and not tied to specific mixer, which was the case for previous
generations of Display Engine (DE3 and earlier).

This means that current DE33 binding doesn't properly reflect HW and
using it would mean that second mixer (used for second display output)
can't be supported.

Remove layer register space, which will be represented with additional
node, and replace it with phandle, which will point to that new, shared
node. That way, all mixers can share same layers.

This change is intentionally not backward compatible and the old binding
will not be supported by the driver, for the following reasons:

- It can't describe the hardware. Plane register space is shared
  between all mixers, but the old binding puts it in the mixer node, so
  only one mixer can ever claim it. The second mixer can't be supported
  with the old binding at all. It also has no way to reference plane to
  mixer mapping registers, which live in display clocks register space.

- Supporting it would mean keeping a second, mixer-local plane
  management path in the driver, with hardcoded plane mapping, which
  doesn't match the hardware and which can't be tested, since nothing
  uses it.

- It was never used. Upstream H616 DT has no Display Engine nodes and
  the rest of H616 display pipeline (TCON, HDMI, PHY) is not supported
  upstream yet, so the old binding never produced a working display.
  Vendor BSP kernels use a completely different DT structure and no
  other known DT consumer (U-Boot, *BSD, Zephyr, TF-A, ...) implements
  H616 display support. Only out of tree WIP patches used it and those
  are updated together with the kernel.

The driver will print an error, asking to update the device tree, when
the old binding is detected.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index cbd18fd83e52..064e4ca7e419 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -46,6 +46,10 @@ properties:
   resets:
     maxItems: 1
 
+  allwinner,planes:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of Display Engine 3.3 planes node
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -74,22 +78,22 @@ allOf:
       properties:
         reg:
           description: |
-            Registers for controlling individual layers of the display
-            engine (layers), global control (top), and display blending
-            control (display). Names are from Allwinner BSP kernel.
-          maxItems: 3
+            Registers for display blending control (display) and global
+            control (top). Names are from Allwinner BSP kernel.
+          maxItems: 2
         reg-names:
           items:
-            - const: layers
-            - const: top
             - const: display
+            - const: top
       required:
         - reg-names
+        - allwinner,planes
 
     else:
       properties:
         reg:
           maxItems: 1
+        allwinner,planes: false
 
 required:
   - compatible
-- 
2.43.0

