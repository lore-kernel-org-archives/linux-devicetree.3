Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334891;
	b=L3jGCK2Z2Iu5ClW10ve52qNTe9RDdFCrmDxjz/9Fbqc6JquGI/YUHlBRrmvLIbn8rbTE
	 V5XWNm0RQm8JvLGOcQEjk5jDoHbgib0lD80/faiD98gz6A/dY2aeaU8tlDh7++wMGaGrR
	 Pz6YlaITmJ3mWnAKiXH1W2q6LMZv9cHdBQ5TOmD28/IAwfLWW16RD02lUggUEqSr/WIBi
	 Tev3QMsm0PuWFvf/vojtqfOA7rKw19Kwxt4uZhi1x2P6g89iYvn87COqRpibPzjLoANKG
	 wXcRhLaa2cYn2k6PjCOvGjqNfsKjb2ITq86P7rlAWdRsSMUFy0GV+eJY3y11ZKv0fjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qcZjh2syZqgipSDwmt5ZYXK+2Hdl+jN7I45dUlpArpI=;
	b=3Lp6jVGfNPqJOHSnBEHk9tVBvdJRqvF/BuGjxCMHF7KcyvmslAx44iUeDlJrmtrXq/x0
	 kCX54f2yk8ygmlY6gL8dux19YBAGMQ90qF55sujyTYaZwv/AdU/MsljyDZ57MQOIFFb4J
	 3HpQefCzb04dU6Eumx/5nkV6TQ7Nl81eibhe2f1gt2oa0cxnPNOmtlQJ7GAro1nzCfAOS
	 QFYCAgPoqkP737/QwAb29tEsqpMl7KvS1CKSblG9wRukWfDNU4AZ/ss3qCEloeePyJQ7V
	 Y4f6w7ANcGk0eEjNJ/fsNTxIX/jIcvnbxTFcbQXRT1hJ2NE6J7Gx1VTC+mySRqRW9sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oRiS9lhu;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245C7606A335
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 18:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 245C7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oRiS9lhu
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so20641245e9.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794334889; x=1794939689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcZjh2syZqgipSDwmt5ZYXK+2Hdl+jN7I45dUlpArpI=;
        b=oRiS9lhuoBGxiRDUQnQc+LIe8uZVl5QlGJDQGB4C26lXH+Ij2AtyMMHMpdQRvQ4CaL
         QCOSCIn5sjZC863cLQ5Am6sl0IobZWlm9xqYlT+6DIF9bjf0HBr5aIceAcWWmy2wSeOv
         pWKx/RBFUD/uDiTV9LmEZQd4UwjBqz3fUMUrkEdDNnqYI0BmsCAaK4GNC4JmtN6v+pYX
         2bfVR1bT0UUskjCpUgxG+F4w4R4KsKBrsF/zc+efXCJq9QbmbG/NgZof0U6GLqZmaCTP
         yidxY6BWsm7SBSLp3y3X5k18iD93muo1g29pVlP8RB58rA6pcXoDhi6nezGIgMCscBZh
         OOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334889; x=1794939689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qcZjh2syZqgipSDwmt5ZYXK+2Hdl+jN7I45dUlpArpI=;
        b=0/7/oA4nHC3t1D6tTeuwxi/4KdDJ3K+UkVcA8TF4Bf3XDOoM7Riy7DqXSC/LD9cd3f
         4JR1R7bVNr+VQRKyrER4PpSorxMJ5zOXVElyNMa7upLMfDSFH9zqCloYTyzxN2jeUzzi
         DYA8/Ci5ZO9jnPsODZhu5zlGChpH/2+qTaY1yOa77ImaNckYmwmHj2P3acJ9gvrdbLVj
         +DMrlMmF6uk56+FM9rZ/v/KojRWH+iV51WolybOG/ZWlb2zY8d09DfLDCIjokD6Nm/Ei
         z3pBwQit6Kd/MyWsngbBGHiUck/pz+QyG/FP1b+fSoBm5gKruBt7qzdGhZKeJdG+R/Tw
         BYuQ==
X-Forwarded-Encrypted: i=1; AL+hErG5E2ZeOuo2VauFu1n57M8/1NiIqwKgnd6mDljJfcQxI9NRCcwQIj6J3toAN8m3/yDoO8zJkdLgpRSv@vger.kernel.org
X-Gm-Message-State: APuU4Z+YZ41L76D+4Pf0kPyKsCLJYkuOCEDKnjwbZfSJ3cRC49uiUXaQ
	ohnKZp/B73xi2qhK8LbF27HnE8eYN4caE8HwD5Vfq2wQGKu67AB/i5Dm
X-Gm-Gg: AYBFou1gvdwYO6wZ66BoOo19ejKwWaaarL5DJWMDH8YZxvdJvpL21Vt1KsHfpsVKOqU
	qOmpQUnlxSe0vJ57LKIXfXHezkYJpSjh893iTDyXeAZgSSrLxLhpHaGGQgJP5fvlt55hg2C5pcR
	tRLkVBJ0X0XjMy2PiZoqWKZw/LYd48mt/Vk5f+PEZCzDBfJce/w4Y8RIHV8SLfQffLm8AAWUHYn
	0AnIq6qpIwGoXOxd8cZQlDcyJk8VNYMFzvi19fLzDZNnXZMlf7kb+NMVTlA2zFDPYMyfsPzWhLC
	xYAfIC7ePEmo5eWQUfYJCw+760iQHFFnjjHr8Ts6hjqwvQg1tg/AiEmuPpe9AC1gtZh4lhDz9Ig
	zVeyq00gkJAgKUpUmDgB/ZX8ZtDehkEYSSqkx0hs6u3ZuUAIQMlFebE7SPw35BwVo+96qwlwn44
	PuJ3oZrSJbnjsq3UFLFDCdQU0lfJhDiRp3Xbq6YKIRV6LM8yyvlsxGkgg8Kn+6VQSwDupMsnWoX
	5YSV/Rf8mpKH86/HWeUMLxzj0Vy/XN/CrWZkBa98Kkfpneqr2J+7wmQI1CdAyj8bdpb9v3TC4aB
	FlqD4uztGJyWF1ECMYGZGaSTgRgXS639yTfjjogwVlgD1qnGTV8hs/DNM8d1YNBcUrIWdOue7Sk
	X+RvPk+0nbIRjX00b/hoUbb016UGT+JwfQ37g6FoD8djiAY88Zz/Te6w=
X-Received: by 2002:a05:600c:4505:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4ba0234e282mr61882635e9.25.1794334889412;
        Tue, 10 Nov 2026 10:21:29 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d9df5csm95507825e9.0.2026.11.10.10.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:21:28 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
Date: Tue, 10 Nov 2026 19:18:11 +0100
Message-ID: <b8f4c61c0171ed19c8fb60b702e4fd2e2c9d7b95.1794334398.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794334398.git.stefano.r@variscite.com>
References: <cover.1794334398.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add compatible strings for the Variscite VAR-SMARC-MX8M Plus module
and its Echo development board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d0126f54b387..397e1cae92d2 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1354,6 +1354,12 @@ properties:
           - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
           - const: fsl,imx8mp
 
+      - description: Variscite VAR-SMARC-MX8M Plus based boards
+        items:
+          - const: variscite,var-smarc-mx8mp-echo
+          - const: variscite,var-smarc-mx8mp
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3

