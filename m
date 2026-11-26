Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725338;
	b=xscuuozdzlZoipW2LarxoVz5VJ9sKv5cN0nobEGiHyC0dpSsNyEuKyvRfpRnq6iXnkW9
	 Qj+/589UpDKG92FbIAjdxzx2hm8ua/MrJp96PpAfxEdZ/mQ1uv12dV71xs6Kq+60Uuukt
	 Qe1wqdmxvuH27QWWb0vAZxEpOXCF0C6bPmfZGybfZZs7W+vXxB37uRi+HxqhzQUFGeHoN
	 sobkA0qp8m/L/xsmkvHp2unQqNjjKP8CI8qZdxwThIc7YIq5P6TqMj9//aQdA3YdR6Zlr
	 OD2e+9EzMWXmvLy3gbOKHMvcgOzNMiyMXeQp5QXdQIr+yBezbyPdiH88WSSIY7UDZZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nf5EzAPgVqjc3FGNLI8n0bbqrh6ZvaXv4uTgjtEloco=;
	b=V0qwJbXP11NA5gUxFujl8sDOwCYoEE5AjpwZVFSJrG3MMCPOW9MvLqDUhq31nwRke/M2
	 KLHZ7+De3LKKt5cK7XHbV6a4YVJqsrk0Y3q8hSTziCV4aVzAEIyz6bok+XbR0FIbExeW9
	 ICqS+oSnJeVwt/6VM8huohbF5nXB0XxDtdFOWx6dxZMRHg/ZruDGtOYhB0+sMZep2anX2
	 MnbIDMfnMgXkKKhCUJuztRxoCy1Ml7SR+R9eD3pw1Gx8lJ6oJ0Zdm14O8lUEkyecFOvZB
	 /fp0TWesBOHSHWiswe59GJy9WZsgCzzvLyqiy9OibH+3pjMZuuq6/qX7WymJ9zOjKgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J+fw1+Z/";
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CB6606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89CB6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+fw1+Z/
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-717080a2d50so6795609eaf.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725336; x=1796330136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nf5EzAPgVqjc3FGNLI8n0bbqrh6ZvaXv4uTgjtEloco=;
        b=J+fw1+Z/DA0t2A3jmBVenxuj9UtF8YhUdjqwTZH7aTDMAIqoMEuQNLQYz2lEcy5oQ+
         yeqTp2a0odF5zxgD/EjvEaFQag6AcSj2ayW6f3BpId0Cr5ezz/z4CCYpU5dPFSqfN0bU
         YmcctUunnbHgHs0JN3GPHaE9ZcADXlEBLhtT3ID+kP//X4AHdJV9pEoNmoZj8VXApEER
         LbJ/H/ddRuNZDEIYeeGGR37hQyBlaCyhgAjKGTAOYOKaGeW4uXfA15PPvezDLJthU1OW
         d9v5m/Ncj/o1TenLwzobHz+39ne86nymg+13OUQYwqvh99DLxyf3d4+1OCs9iTJBZqVX
         1j3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725336; x=1796330136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nf5EzAPgVqjc3FGNLI8n0bbqrh6ZvaXv4uTgjtEloco=;
        b=EfsLHCD8nKlnI3kAGTZh0IYU2r6UM6EuDgfDxFP6A/JiSA42T4hFNfh/KqqM92Lyjx
         w0pMXkC2SMil1RA+RIHHeWPjzHf/ry7CzTqJMk28Bo3jcx+u/ye4lQawwzNyEFIpATkJ
         AGeYucLxez+IZ2SYfwK7DHIG9twp4B5Jdmj+91usKQIWZCNltC4SzkEK6v0aoVeTjNW6
         IHuPpOrmJLzzhXT1eay9DIjA7ng7t+AfbYS7iVNec8KTT2pJs7ce+oTEz28IWoYARvkS
         VYaYBwvoJP0XJ6gOeTf+P1ERisndJVgEFtk21IA9VMeKGpJBdhReFlTQJq2bENiWMJUN
         J5QQ==
X-Forwarded-Encrypted: i=1; AL+hErFhXhNR8kpOgS4s0DTcqdMiXDSDAUmRhw06plDjuGRpnfh3UsHHQGfLlrVt4sf21h5oEDN/dm4vib4N@vger.kernel.org
X-Gm-Message-State: APuU4Z8DpJa5Bg/aSoxxfszzxmSXgNQvGnuaymupoOnnq8OxrguJue74
	xxsWBvgAPo0PYIa8vL1mSzVxE3bye3mDYEzxqLP18/f0giCWjmC+bEWn
X-Gm-Gg: AZFdTZecufcDB1EL9FAN6IoGhYMc4rGghZGT9eoAimLK69Z982ujTqokyyP23JUASi7
	uS5c78aCf987CbPENbwL7AUGbwbHYtQw0jfCLstzAGCKrRe7utC7BuXCF8OHbHSquHvz2RVKLXG
	jSCje75/2d22+65sTP2Tj1bqDIQS/0iwgV++lqHSdcWVt+Ia/I3tgVqPuy1cvuQL/KjvCLk/e58
	F2mpRG8DzE9O2Asus/ateRi9fY9m2VEh9IDzwhj02rB8pX7Yg5a6c7QnkXIsIon/kI9OnuUuOTS
	znG1jBlM/o08FFR6tILCxVBqpbdGg3eUSdRCljXpSR6+CyrTxml40+dbh4+6gbY1WcHm2BttEJn
	5P0DTmQz6ja86pEG5l3kKYxgkAPA2WwPfbIiuqZrc92cP+sdvqREarorlZ3UToXDNaqI13YNnR1
	AiSViDm5RXUmbuNJoVVLP0URjKl8b5LbnF9ijpscxHSdGSAxG9hW6ENDaTSOklIIRGApwyzqrAd
	z23UAqtOLy4KLj2D8rni8Y/USNX+GTxXqVUfdxxweoNJeQYAPkvUEeKXqFpAyMlI6kwwieIZ+G8
	JcZbVpuOicXLMckaJknjpFyGKlrEcpsLZSAx2wKNTYYr0UvA/ftfoR8P25F2lt8LUw04pXH26H3
	DQ+jMAaI=
X-Received: by 2002:a05:6820:61e:b0:71b:7883:8d89 with SMTP id 006d021491bc7-71b7883ae62mr6639742eaf.66.1795725336439;
        Thu, 26 Nov 2026 12:35:36 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e5472sm15740888eaf.14.2026.11.26.12.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:35:35 -0800 (PST)
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
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: [PATCH v6 1/5] dt-bindings: arm: sunxi: document Radxa Cubie A7A, A7S and A7Z
Date: Thu, 26 Nov 2026 15:35:33 -0500
Message-ID: <20261126-a733-cubie-a7s-dt-v6-1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
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

Document the Radxa Cubie A7A, A7S and A7Z with their Allwinner A733
SoC compatible. The initial device trees for all three boards are
ready to use these entries. Radxa's Linux 5.15 A7A DTS already uses
the same compatible pair.

Link: https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9
Link: https://lore.kernel.org/r/20261111134919.90264-2-vinicius.eduardo.pedrosa@gmail.com
Co-developed-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes since v5:
- Fold in the A7Z compatible from Vinicius's binding patch.
- Drop Alexander's Reviewed-by, which covered the A7S entry alone.
  Krzysztof acked the A7S and A7Z entries separately. Leave the Acked-by
  off the combined patch since it also includes the A7A entry.

 Documentation/devicetree/bindings/arm/sunxi.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7da84e2de748..7a7f96f21f57 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,21 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7A
+        items:
+          - const: radxa,cubie-a7a
+          - const: allwinner,sun60i-a733
+
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
+      - description: Radxa Cubie A7Z
+        items:
+          - const: radxa,cubie-a7z
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc

