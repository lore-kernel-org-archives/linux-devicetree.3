Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008667;
	b=PR5UrzweAPKvXheM0kpWko+Bdc5/TuhvcPFIldaqO+UhqmvvUNnc0GdctKEYH3V89gYL
	 vSEt7yamm+D0G8JB4Akz5g9m39vidts6cN2f1Tcbn5r969L48q1zUwUM5147LWKjICHCN
	 OZL3tXypgXgUZVgAVpKwb3VXpgBncTfOUlR7Egj2Icsb8S/1VZkJKstG74bHX6qPd4i/P
	 i8DlA72A6K8FjYXJd1UeGj5rf4bYJXw2Mz95WweJIUZScloGQ7tiYZsHFgOeDm0SMJac4
	 03vOD+ouAsdkj/6J+MaBYGYz29Ei/mN4asJEnnZz9W7Klc50SHmNU64deS3eGh+qhxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tOz2JFjjkTi3TUHkJpJV4spG7QQFNKVaT1zkl6n7spk=;
	b=YO9wnI7oVbJNFjC2Syp1c9LXWXTXSwaimjKuEvUEekRFhx3rKLY3X0cX0GfxKvUU2q7g
	 +0cvDROQdTmtzh8YZc8oB2IeIbgmgpLJIT0DfnvIuWYnlUoN3uHaTNJm7KFts9aPTfxjE
	 0olduUzbLFEUlVCFM3D7BYz8mWpq6Cp1NqmnvOZIqIvhj3mQjYwjW4xnuYWAXvJvIww7L
	 5ySrrZ/8iUpCwQ3LmO1iNXUn7DcMS00Ew+PmZE9pR0vHsYNzLCuKqPpNVab9CXziJP5J5
	 57RT+KdUN/wOjYP3Yo01bTR4BejKz3kTItjoX/puR8Y+j8mS/JLgCueFa8Iuym5Vqpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PaoQTefR;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A5C606A9C6
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 09:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A5C606A9C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PaoQTefR
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso21899735e9.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 02:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008665; x=1793613465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tOz2JFjjkTi3TUHkJpJV4spG7QQFNKVaT1zkl6n7spk=;
        b=PaoQTefRLtUqRWS8ESfbugPB3bhdgKfFyfJ0GDubySmYm84cECrY0snXnCHiefXyJC
         3YYlzreD7EQ0RdWXB9mntsLq5Z5v7mrAgt2eEeuSRJuNKpktqhtFjFVtmp7jp3CAu38l
         OTU2HF5Rue+QZFlmrYNM79QAmrNc9ygKTAqnMW3/iX4c7Dnn2tmDACPVLYZg2DDUMJay
         sw/5/vcIbvSY8zW8oQkYcsLQxyyh0yDTkrpJsrXTSslwI5e6hsCdeovmNuBORfBKzO0L
         BHlDj1Zn8l8/+cKbaihcPyRk+J9T3KoJ1uL0VGKZOi65Gab4oF1XG0V7rcIjk488qHLK
         EEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008665; x=1793613465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tOz2JFjjkTi3TUHkJpJV4spG7QQFNKVaT1zkl6n7spk=;
        b=adv21dT3pTFybsnRVqpPFBJ9iH+jQd6evHDWTB7x9nQZUzKqZ9EVoov+/xEJA5cBl2
         3F78lj3ae+y/GzhkmZh8aJZXTNN7GbYUqaMngjxWXelz0q+0Tge+1b4ennHCs5Lg7g4x
         JNhrnAOor+Y9rCbN3liPrQN+q2aC6tn/3aQRPZYynfqZ4jzkPMNuqHCjHv49TlrEpu/e
         4mtt3sL3BTNRDvzzQPv4s0pNv3V1VRyktqbKZzrl8I526L/TYi3w4Ho0xm0YiXVD10WV
         mfo8Qk1Os0Hm3mFFzvxO87ZL+ikyY1FOmljzgheJ0yfoU7I0uyfjSfvTfZOPGm5/RL+C
         x4zw==
X-Forwarded-Encrypted: i=1; AKwUvByCO9P0IXQYMzcEn90G9MgerYzxj32iFrVFtgYRz7IQ9T40pbII2aLi0MdmyLmSNm2VocZw4aEgBf4b@vger.kernel.org
X-Gm-Message-State: AFq9FYIsJNeCwL0j1hzgn9D6GkSdMDA7RYTwVHw6+aI82QOm1af/PzsA
	GxTMB7mDDq8wm4ZgPVssnuQPdg0OKgvz0uhP/vtnjGIyI3f2SJlQ/UEn
X-Gm-Gg: AYBFou17RXhoSxhNRO6qCAWu6YOnyKQxv1BaMD+tok6Gme6st2XfTgybMU/j8I9Tq/y
	3OFkXkxQT9kBP2rg6qgsWLiVwEMYV25xdND9KwA1x8QUU0jm6cr5juA+PQeGCJGsrgpRpu2tQWL
	hjSnx3YEBt0Qr7r0G5W4avf196DsR98etZ4p73b+NsCeiHpM3ZBkoRDpc+x+Opt7H41ya/PQ+UU
	tIhexPnCdhGk5FqvFZJ+fWydX3+1l8uNPdnI6u6kP2PgYyjcbfkApJS9ywQyJDjwvZwtpZlUm1Q
	zJkk5bluyo6XYHbMD8WCr2tXgV+Q9WPkz00V4c5lKij77iWkGFIoYnZ6meSKOxxtaLqtJsI80Iv
	+717W3t0nlgfPCRpfOlM9e9XMRmXjitP9MwUqIlW+MFJDtp5sOfZYnI15KuKU5/PVp2HkWavyhJ
	clFjhSTBsMmIbDe2Y7Sq/9U55iYnO/3ObvlwpWgJSXaZlbIGmshpOOXMCPDQfFSfaOUZq0A1dCn
	Q4vSpv9G+gLrNZVgilQMkouDFr4DhpznnBDlslTPUy3u7T4zc9w8ebTK+EEm5mP1YqWvjv6hOWm
	GgWa35Yk57KFhjaLrMs7vnBSzC533pxXvnsy65zAzV6L5mZkiRVu5q6UEox3
X-Received: by 2002:a05:600c:8114:b0:4a1:dec1:4e1 with SMTP id 5b1f17b1804b1-4a35aca4ab5mr96619105e9.22.1793008665078;
        Mon, 26 Oct 2026 02:57:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:44 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] arm64: dts: airoha: en7581: add crypto node
Date: Mon, 26 Oct 2026 10:57:14 +0100
Message-ID: <20261026095727.31708-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
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

Add crypto node to support the integrated Inside Secure SafeXcel EIP93.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ee1633f01068..f214fa3a3e2b 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -470,6 +470,13 @@ fixed-link {
 			};
 		};
 
+		crypto@1fb70000 {
+			compatible = "airoha,en7581-eip93", "inside-secure,safexcel-eip93ies";
+			reg = <0x0 0x1fb70000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		serial@1fbe1000 {
 			compatible = "airoha,an7581-hsuart";
 			reg = <0x0 0x1fbe1000 0x0 0x40>;
-- 
2.55.0

