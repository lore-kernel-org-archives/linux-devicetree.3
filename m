Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285921;
	b=3oIqUqYUuX4esKlXJwRkStMUo4gjpZftheLpKTEoXyKxafXdJJh9tzW8wz+nCjsLeoRz
	 /wASwE0YvTKS7sboyAh25vlMDtgpnn84VQJ9LIv4p0yWeoMgzjRwrshLPaTueyHajceIp
	 TWAvqdevXqSIAfM4NMeGgLY1FOq1PjT+vVFAiFJgM4zVQsuoNbLbT7RCEw0UmOkRqAete
	 waDnW8WUs8Bxs5aLn2lh9+fhuYfe122kT1V0yxkuOBhAGKY7IaGJ3b2hCE1dTsZPhS/s4
	 CbLNsoeIVXbyHMon0q6YtNyMvZ5iROfPpP5q6h4hWFNximy0wx4y/+Pi9jn4QvNCc0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mfk4qwSgFR7KwVnesFbvf+7aq34n17lW7fPSZsmBCBg=;
	b=j0u3fGFvw7mFDG/n9TmUCsj3sbT9Our3lo4Lw3c+8sSCLUmMlfrfzSFA4iWwlafSGLyB
	 q9l334RxnKNGrcQLKvWmZBLgK2oVW6waSd2usj0VF3E1Pp7R7SCAUjRCqEXTxz3Gvt4TT
	 8wkm1jWz9U0cxzHkzmtep7B2E4stUZmjpwwzRwIHnm0VVJYGAjVaRR9lKwRzS15rrjfva
	 TZoai2fwTgm3nWkID4oVqByP5UE6G+YfitChdiKetO7KZigdfAqON/0OX0WUnDV+IJT8n
	 UYwZdzuVuQWcNxuCzDk1Zo2SMPRhZAY08UROT2VZyz6sKBfU40KhD2s5MMlbdeBiAVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YpvQAnGe;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8409060A2603
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 04:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8409060A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YpvQAnGe
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-716c0217635so1380639eaf.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 20:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285920; x=1794890720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mfk4qwSgFR7KwVnesFbvf+7aq34n17lW7fPSZsmBCBg=;
        b=YpvQAnGeaiLzPbJ4euSR0B4PirTCrPQ+YecWNXQoSZtXgTLwCbb19td5tZ0v2jWaOm
         0VGeln38dQIdLZPScbh8mF8u0utVIojO3flwe3aCwj6coX0l6s+l6jaKFvpiU98Q2oBM
         KFgOf6denC2CqqIipfUYYx4KsSR3IxLpli+XTxX6Gq5cPVcCtCLvDuFHFrXUEHpT/xCC
         lDoRYHzMHbiZ0kPzs4Fgk04eLuuQV+g9WLkL82IA2+M57pAcdoHI1+fMTj4AApbE0zAQ
         yDZHtGO4hBx27Wo4XLOdbXMK63Q2LVWNc7BMwTMqtFMJJUZBCOkNBDXH7mo/Ai1wSYb9
         yuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285920; x=1794890720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mfk4qwSgFR7KwVnesFbvf+7aq34n17lW7fPSZsmBCBg=;
        b=i0L2u5OkqTd6qidUvSICMb7zOrRB09W8bLccUCxUQuLeZ2P/DVO9LM8NWvg8KIBnLX
         9YMX9rdxMbSC/OdhJevkFywae0IbQBvVA5e3mU0l56vYBjLByq546Dc2uX9W7ruFaR4g
         otaG5hj8PmyXyRsbujDFVFClT/6GgiPywVjFLOnyD7RXT3U+rKstjgEt0XxgOoUcFDNn
         F8ChCnsaYt3yXyuwpg9yBXee7mfVQcd4DwT5mH5ZZcLcme2yCJjb3+ju6dJG8UTRRY24
         whx3LuwVcqfKOyiswPLoB4EtRTls6G82bEHq319xg7UV+PcGlIYowp9krCZEq0WNZ+e0
         sDzg==
X-Forwarded-Encrypted: i=1; AL+hErEzuNK3w+7ZsIUe7xn2HfQkgzC5qfpD/EQ6CaYhUz3yF+UrC14cur4WYoW8MrxeHHt3gDNFoQTciA/x@vger.kernel.org
X-Gm-Message-State: APuU4Z+rbQaGqHXIEJPpaxdKnuPBjYwSaGaCbL9FDj2VN6eTYSHonVAk
	8+oiaE7ymrdFgM6hW4J9lCVMUpOKy7Oz6yDAHoiLzcJdw1daXXw5+3lu
X-Gm-Gg: AYBFou3+BOtC0tIuyraEibKf89Ta4acfCwYGP6Yk8LLh+75cYINarsZvT2zpNEI1mO2
	OjNH8nonZH6RdNZ0T2HX71vNicq+4wy0EI2L/iuq4SpjkEMQD6dEkLs4d5HVXKH0beSCu6A72WX
	Kep1urUhhKf3KwYzE4eI1sX2yRBJucJTz4iPD+1F+YVAUt43cPTNXGFRPbcGvTj3ewA6qlDoOCc
	OVhkHkZ+C16hlxE2sghNJvqyQsOqCKABr1RtmqIRn3jQJnsnxSyMGGtbVyssNk9Rcg9bF98xPWP
	kik58e8jVQ9fIA9NnvHOhC90lnxP4hkNyqn9PrKVtKZPkbivjiKE1qaPx1gTDJPNGO09JA/0Y27
	LgKZ+i99XaW5Nkow6WvmTAarxfD+yF6rP8vjLG/GpLfmiBlq5UQTQhRNhJena+veP0q8HC56mdw
	uS7SZRktl+n8Tmx1lQV/kxE07p3HwFyKgtcbAVvo+IiMAixyEdpZRbxllYZ3byZXt6a52oDgbb0
	5EeX8ozgcwuz4wGEX5Y07kjCClVOw1YYqwmHwX+H2I9RiWMuprLriLgM+v4RaFhJ1U/vY7UZo5k
	YiF3r/We2Fs6gB4b7CoHMNmM2WpVEdy8Ox5It27TBuBO9dLZaU0RhrveTtzBs2rtirwb6tOBaDp
	fcbWZNw==
X-Received: by 2002:a05:6820:c2c7:20b0:716:e2da:28c1 with SMTP id 006d021491bc7-718a77f2696mr394873eaf.39.1794285920417;
        Mon, 09 Nov 2026 20:45:20 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a40b8a9fsm954836eaf.0.2026.11.09.20.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:45:19 -0800 (PST)
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
Subject: [PATCH v3 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Mon,  9 Nov 2026 23:45:18 -0500
Message-ID: <f1da763aca9c4978dd7cd9a363548b5e53314656.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 28437c47ac01..37a7d713ac71 100644
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
