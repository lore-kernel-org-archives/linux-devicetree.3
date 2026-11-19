Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111761;
	b=mhU3Jfr7DUxHAyJM1IuNDNaETRj7Y91djjFZ2DJUWuERr8gCU6jtIcCtnNFvFAtZePF6
	 CBEOaDkyi/Lz/+RFOteHZK14aXZv3mMcf/ZqnkmJDf/6Ci1nwRNePEh2vg0ygvnoZJY6i
	 NvcTkbIKm/WruiHDIpjySKSFVLzPWyruihr4fBv15McS1bax65YBQD0aV6RHV0urJ9KO6
	 7pZXnpmYw3pSohcC8p+6XtlS2pllt7cebSVKYzL+SuyfxwNF8gy2R5CxSGg1KvKdIL2XQ
	 y57Me7m4QTw7NNbG1ZV51Kpj9vTtoHGkVHjv7HYf8norBYc67LEdRZPI153gu8yHJuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fOVBVa60ho+IN7XJrgnUZTlBuh8nHgelO4SekyzIQAk=;
	b=SYpz0sOesda3+3nLU1JLyIdlRrW+SmezY5Fg+gU89wRjG5P+n2B/y0PmpB9D6sInl/qf
	 ISM9cV99xHFvlvlNr3jUQLMAsoth8l2iZKCR7VReJSXT7zTcaic3PPFWZ1uFfkcEIzbQr
	 SjotyFwUcOvxLIB6IwgA5U6ZAu3XMvu2OvCI2xvgTHLag3feGcFeT/4BFnehpTRyRI4NW
	 SiZfKbRUKpEL8dNUu/iQRiEzhwbbrmup2tvYVJCPl8h57ExEz0uJpZkRw7si3gZtP5Y04
	 PuEAZjsCISZtkPTFIXZ2/rd76m5bBYM5zkiyrdN7+/on7QP/M3EbxfwiCeJuZS9t2Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N9+2QlkX;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54268606A33A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54268606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N9+2QlkX
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4ad5b52f0a7so93630fac.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111759; x=1795716559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOVBVa60ho+IN7XJrgnUZTlBuh8nHgelO4SekyzIQAk=;
        b=N9+2QlkXz0Y4+Nju3sEtPlaVMNleZ2KL9EpxcO8V7D3r+8Mxv0c11Sogp+2RiMdSo+
         kQaf1KsqGL5JWEi1p5KnruWlSCmTM7Yhc3KLJfwLQpFsODXNEEZpdZw73EtfHhrXPjAk
         qYgNgXHEfrMYlEl4Zx2jslzFdn0ulxkqCwliMpTwBEbeJXUIlBX4sU7YDOx8e/HYlorZ
         7Ul7IGPRIsrB+v/w35xSaPvQKIWmlpHxdBfLfHLj5tHfICGnOrQr8EMZlds23rVLbvTQ
         1xXsCyKHFk7+E5dtQXAOwNe3teq3M72hUMODpU86y8wlIZ0i/w2Qwu7md3jQcHPKRWBG
         lcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111759; x=1795716559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOVBVa60ho+IN7XJrgnUZTlBuh8nHgelO4SekyzIQAk=;
        b=jzeTWNSa7bMWDF7vf/Ac3Osfrwj65hV1pQkHRp+1RyKs+sd0PTskqtJ68fy97bQgUs
         oTrGl962WISHGhIPat5R4tHmKE3sqoTvShDI8mCAwmj1RQ5Pw8VlMpeg0EaFyczWw8sU
         pdSOTFlmwt1HYUpxHv5psHv+bjXztKuajJqqnkOzlSlbI+rwQfsowXeGZu94rD/IS/Cm
         oMdueZ1MIyicycd5MGYYD6vFNwUvgpHHGiDrEkFdxuVriCDnjlOCu6x/3+aqgF4nXmg3
         RHef4dBmnP040xcUso1kwxdLOtyU00oboDUvDh7vSk8aWfI2odSX0i9nv/Hjyu5YfdlL
         4jQQ==
X-Forwarded-Encrypted: i=1; AL+hErHtGlktYNGGlOx1WIr9l9h4F5ubRapAlVE6j7vr+Jwa2MuSfgsA59J9PReVaQomb8aqzUDuYvUdsJOX@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ruhzu71+HBLW70HFiolgsuRjzEi+vai5WFCITKfpPVK128wQR
	CJtYhAmbxvDRCz68+tCoU6klXWQZs/vIERrCM6mifLUDai355Do23T72
X-Gm-Gg: AYBFou1FLWFPgl6DSmAXv/s607NMWdAKDfTX4TKQlM2Bza5YhLlMf0H127f4nO5Fgob
	Sjq3zgujw5hCt99+JpbkyOv16lIMV8JmgdfZWVi4j8LKhaa5k4AeF+vDTwXhPFDcZ7iv9yl2Ejb
	MDuRIQb0XZpt5NcV+SF79ZH8ntmlK58XkomKttqXSY1HXL5GhCpt+1bvyGNBi4cimj7XWzQmBjD
	gRDEhvZ9kw5D4PW2BrUkQBuYTulLYTYwqdh7Vh7X4vcPUVi2WQEljaYS9O56sn9SAklPgUuAFF0
	SunVRZdH3uno+aV34JA8C0jgTqqaGf3Rbz04C49R2ncA8XNAsNRAikOqFLJefbf9t7Qq6LxFm1V
	oQZ3nRFMkzuswK/qXDWPl43MuW8EGbUTtBwel2mEuBfAiSY+Wk9fIps9+z+Z87qDLXIpdaxDUWI
	ljAmYKOiQGVIiVpelfjIDMWIpntOhh5kwIZBwH6CznJsthOfQb6L5wNqxSV8KOhh4QlglrlXX+v
	USRihO1Lp1Ige8sWrZmMVnitNDr7KX1l17tknEZFKEvAGBDIeJVbpl9MR+4KXwGQXd3P0LpBtDI
	3W6+qAv3YGB/82f13qF3dJYS+ztI7ki2RuIUfKjfP1rURR50S53BAa+Fmk7avD7ETWBwjEh1wDd
	k
X-Received: by 2002:a05:6808:3193:b0:4dd:18c7:544d with SMTP id 5614622812f47-57a0ae276b6mr796447b6e.31.1795111759288;
        Thu, 19 Nov 2026 10:09:19 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a350548ffsm92701b6e.11.2026.11.19.10.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:09:18 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Thu, 19 Nov 2026 13:09:17 -0500
Message-ID: <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795034153.git.enzo.adriano.code@gmail.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com>
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

Document the Radxa Cubie A7S board and Allwinner A733 SoC compatibles
for the accompanying initial board device tree, so it can be identified
and validated.

Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7da84e2de748..d32689b7113d 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,11 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc
