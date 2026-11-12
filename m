Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494293;
	b=VDSOyELOU/kSy0efDKKbqvE/sV4YSJtRGsaR8IGWr2aZkpHwj1X+UVh6Wf0j6unSgkRI
	 /0MDTIOlsHpbhCzdOg8VBD3ZbwBxW7ZhekoicFBMxjkrkh57gfKab5I7zL7e0/dCjwXjB
	 5m/Ie1BF86/YzdqlgGIvNrLlLMBBPBBd0OQzxsiXOvh5BsH1l6oGcQXOyLst7XLnLNdJv
	 cf/PNLokTwvO4cnJhCSvPdKi+lTT9Vdl6avf6/GCydubRlJTBkARcOs/PSa/+e8vcCLx2
	 SrYhoYHAwe7KxcZ1WWUFuem7cK/WCU1U6lj3O32EfJP4rSKJpqieHSsahpVKiEjdYdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=wXDiU+g+Gn2HmoB14YGhZhK55PgFVMpz3YYljR0nTHk=;
	b=BfMGi65XCi9ctDjiSMMxc41nfHNLKhwZqQqWErx3GFeo9sZ+RkdjIAZQmq0jw4Ewkif6
	 73iRS9QF2ID6HY1pmNLEFx4PvJ5M8dgKHafuyL65pF9ppfmeVjYs+OFhpXzailVKZB7Rm
	 2CXHPh1IW4oRKDPVHKXWTKl1THQO9tzImaQW0oi1IsG0AXFkROY+djQUcXolFxydfpUKT
	 2Njat9QBMLBtx5Rr1FX7uR7T3+2e46OyQ6tqMvQiV/jBk6RA0HnOr3TJdpfLYc8AAoFoI
	 zcMNH2h2nPOLPdD74lHLE/yEWMgZjTuvKZy1uWuD+En0u/QJ8mCpZH3DIM6/TWbUIGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D0Eb6Ynp;
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B3D606A889
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 14:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B3D606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D0Eb6Ynp
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7cc53938a8fso2849707137.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 06:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494292; x=1795099092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXDiU+g+Gn2HmoB14YGhZhK55PgFVMpz3YYljR0nTHk=;
        b=D0Eb6Ynp9HKAeCp0G2praxIjM8tGXhe/OXR2jowV/goVWHrEcR9ibfzL4hOos94hq2
         pwf96NuqpOhVJ2OiMIIglAA7vWCc7s7PBowGKNaCNFZy1ZAxHq4KpBr0Nbsz1Ve5BJlQ
         dBCaNBTrMwVILpufvCf6+0wPbC1bZ5sabqocxWby67ZkS9pHH8n8vkh+ZLU6vqNwgeA/
         Ihx+flmKvs4Bs+3ETP0EwoJfeJ9RYZW8QkreSqep8VnklsShf46++JZqoQYAyOEALWKT
         qJOVvqR2kTv+YJIpTEnru1dqNiS5eAxQ3FvELKr0TsXD8kUZpAvNEbne3CqY8qoWtAaW
         Dt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494292; x=1795099092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXDiU+g+Gn2HmoB14YGhZhK55PgFVMpz3YYljR0nTHk=;
        b=BSpK8StCste9wievcVZ70D0VsqjBDWmHNs+HuoaYr/rZENORbBqr0mBv0JbSwoJw3K
         cTZxr8Sivz7ESOMXTq1qOCKjekTuBnKdxlwjT8Y24pS5xK+kMqVLlFLT4U+sBzdkiHHh
         vKhN8bLzHnr/Bg4nfsO46B1PskaAjDXRdfsspZaV3mcm0PRocnbPwbx+gqCY0IyMII3J
         YLkdP7nm6jJTDKXLTaWDLz8MzpuL0F3+tZXBxxJ8M+l+L4V8Y/ZWoN/o63Bh3V2U0ALQ
         g/upQdkZWurrhKilAA8BUAZLU0iUo2gM/wPwjF6RuHCuwwG7nNPtNgL/PRlal9xgd1s+
         e2Ug==
X-Gm-Message-State: APuU4Z8CHAZ2GKABmIOhb4Q11CMY7n3FJEJjt+/YNNYcnT5I/gjbGuBv
	xpHl4p1qgnPH8qIG1MP+7CsHjGRdJR416fI3khZFvse42M5NmMDGzGud
X-Gm-Gg: AYBFou3uVv5tLmtJmE5LnnmHnz2yfGdQ8lZ7TPKuUUpk2E6KIEbQoBSzrsJhCYrKcOw
	uKHVB8+l0cY7qJGfo1Fsi7XH9NUokZ91EFtVZ2U+uMd1QnQAb+QHtiQU4HkfTSe4DcSsaW0jQ8n
	U9ur2dbiSZC1bCow2OUNTU3dtR3vScogZnXEoJ4hKtrVtdugysxSMjM5DfRGAYO/sFLC8rO8mka
	R3Z7Z4w2yim6rOG1xc8HqKWUg46IW7IA9PTEj6cV1dkN+NwDOvMEHI6wGJIcJrNREc83iW7/BmI
	s0VvtEp47x3J2b2rwbV2Sm5qdIz5VC5rgfpi8ql+DLFUc7tBt0mZbWamlLvxU+epUT3E+j3uPcg
	wY05HVBXDXZVqK53UrjdXw4zNPXDb9/ARdcwSBEB5eBdLDRAIJi7tJ1IS8/0LEhpSlw6/GqgJWf
	QBEdR2KeGbymebYIoPQ7bxFzE1BhdrrQgl4epsR/OFI+fhGXowDduXHL3YIO7eCoE9C5K8D3AYN
	7gjBIOuo0tXHqJh0+opvFDU4CO6DNtBQjhtsvLYdfpnl7AcXnZw6Swf16qzQPxCEl2D9iWkYH1E
	02+bjRexAiObq2XiiYJezn76AgDlgdBQrVR/+1GFWOka/2/XQ+mht3E=
X-Received: by 2002:a05:6102:50a0:b0:7d0:6cf3:d8f6 with SMTP id ada2fe7eead31-7d5060e8bdamr2572164137.28.1794494291617;
        Thu, 12 Nov 2026 06:38:11 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm5177230241.5.2026.11.12.06.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:38:11 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Thu, 12 Nov 2026 11:37:33 -0300
Subject: [PATCH 1/3] dt-bindings: arm: fsl: Add Aquila iMX95 with Lotus
 board
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
Message-Id: <20261112-b4-v1-aquila-lotus-dtbs-v1-1-ca150bb4b0f9@toradex.com>
References: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
In-Reply-To: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794494281; l=979;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=w8xV5uoMa8cD2NlGBmwvt8C0f0XkYqYIH4XfKMrB858=;
 b=fGueRKxvIo0asCUZ/33z0mlbmgMfn6W3MWKV8yD/ZkS8nSzPp6aaqZlzCeST6DLUIrWLorE9q
 OB3V6+2IU4QAr5am7I8Qmrf8KBbMoeyEU8gkWEXU6B/a5GtEeX6VV9z
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add the Lotus Carrier Board mated with the Toradex Aquila iMX95.

Link: https://www.toradex.com/products/carrier-board/lotus
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b6..392e019e7ffc8 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1607,6 +1607,7 @@ properties:
           - enum:
               - toradex,aquila-imx95-clover # Aquila iMX95 Module on Clover Board
               - toradex,aquila-imx95-dev    # Aquila iMX95 Module on Aquila Development Board
+              - toradex,aquila-imx95-lotus  # Aquila iMX95 Module on Lotus Board
           - const: toradex,aquila-imx95     # Aquila iMX95 Module
           - const: fsl,imx95
 

-- 
2.43.0

