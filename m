Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016575;
	b=V9LY+xIbtRFR5rgtSyBoNU0fax/lAQ6K2yLJ3ac8YEF91nICOOY+JpFjjOP7sY0NPk7U
	 iZysGn6yebO4ToqE2T4Od7C7DShRB6cwwp6BwEuzVUs6/6B/bOwP4drhTSt6gVnzLEx/D
	 ga+0C0V8qR5/A60SEppURRDuZ4dWEDpvfQjGrql7tjPdhZlqQD9xVEBd4FYTwiRDoJAcN
	 MYhY7HGcgpb/ltr7w9qL9VQ2Mh1kkeupO8L+EUouSXXGUsuM6GbhpDs/JLU4i6+t6lQtV
	 GzvgX5StmAPS1U4lSsKJmtUjgahb8KM3xzPOrXrcCjBYc/r7Fd9RMqz+n/05njT/68A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VV14yapuLeyJsZV0KRxSW+/Y2gb4EQh5OYXL6BU/+0I=;
	b=4nxqYVfvN5SbJeCIpAxcRycpSReBZW8yiUE3G37gV7FE6kx8d2OJS4Gwm3HObbGSfTMR
	 Q2jy+OM/x5wIFJGOrRqv0U4neXqZHQSlVHAbaEILf86Gii2moVTuZIZP4nc6ilDDqAl+r
	 9eMz+r2PkXt6KxyiF2MaYhqj95W1tMjTtR8kRXU+cwDnWwklV/pQHB0ptW0rANsYaAjpc
	 k3DwEPD3wFQW+YYLYdDJyz45OQCo8U+fOrjk8yXlrRuJzcmPFOCpWExzk46qLkAfW8b9W
	 rY97SN/wlGv0IfdYFuyJ2QZyR09ipAlJzJHLwDVIb6YAX1NSJFS2pF9Z97pSHKkdArQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VZ6APpqb;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734DB606A325
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 12:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 734DB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VZ6APpqb
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so24256585e9.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016573; x=1793621373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VV14yapuLeyJsZV0KRxSW+/Y2gb4EQh5OYXL6BU/+0I=;
        b=VZ6APpqbtbmtTfKFu7n9KE6Svnl7o5+7gdDW2eofGKywyb9cCi+w3wraqOH6jKRHc6
         fGH0wnw93Dd59K1w2V6c191KMj/pv7vhjM3COFjZW85+BkhqCh4rofAspC4c9os7jCJL
         Oe9182Ht099MIMhZ7FGbKrQ4IQ5qFf8hzc1r0iKnv3LQadJGvqfgQ0KC494dAenmMw0P
         mUAVPfkkdIwJ4DoSmYCGnWybC635Vv7zO9hpalpnwJpEoovHBQdnFj74cOZkLAzsfsmh
         sLn1aDWp9uge8Drm78MOyaO7qwOkreYJcFuWPIUieceKUnCgD0SEZTLCe/Bb6uiVLjXY
         saRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016573; x=1793621373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VV14yapuLeyJsZV0KRxSW+/Y2gb4EQh5OYXL6BU/+0I=;
        b=LnRmXi12o9aTzSQPLtghtBkMwBQeaAekqEydgNSnpnv1GPLrwDtAaHRLHqoqlIwXe2
         quT/+dXvZ4WF4ZGiaDYpcbCDlyfoZxVq09EyTQVHSDOEbYt0Xt4GcqxP6nPtTbhHjQj6
         f4mrde7HD2gRpd4eO7QI+vV2tYUHvMFDpcJdz8zSc3wr2FewVKW11C+diGPgdgf+uMR4
         m/io9H/6alOdT9ZaPTjN/6BSfDCd8yuBj9Z0KR5CSuKl6lc0VT9YvgdzcXedu9Cj1eCi
         83loyhTbLfCaoTBk6DOxyl/iwa1LFMSO6zg07tLwgEVMitDJMYCXZq0boYMoxNNCIcyk
         gY3Q==
X-Forwarded-Encrypted: i=1; AKwUvBx9i3ydheraZwY4ImOiWaKdMwCSLSVC9bD9CTRW7bcBcc0XpOcBJvKi4cc6JL1gH+ap4cUIjXPenICf@vger.kernel.org
X-Gm-Message-State: AFq9FYIZMV3WFfCPC9d13MxASDiRHpN2gT6t6tdYkEbvfBY9GxygyJR3
	mTLlmco2Va698ZqJDcqGies8c/CSVTNoKPF/zup3lP/bYgvkAlFUMoxj
X-Gm-Gg: AYBFou1Ihw3wfMGXjsCW+OtMMXL1JDW7n/sgXfruzalGsx4+IoZdYNGNg5uwsX31QQN
	h3DpZeAYFrO6LyBDoCenvLUra009jodVnzo6mqRn6Ud97lwPM6kUeinFCCCUo2KJ2v2MgS2UuTK
	7hs6j3Q/iEcRUOvP7IbU2KlHcPTJhfmWe5b0nau8Yc9MCHHarPtB9/97Z/nvf2ctg86c8qoNmUz
	TcS5tg8+DbBli7f+oYAEkxPRTalFr7J6Gpxkp+uW/BBM3PNo2sTlFg2E+S1m5++dWCefytlhOuE
	23Y9I1qXjh8c4+t3B8Cc+6/nUpxNwYdJ671nzBaTi2x7sGplk8Qum4X+GIgHODxpXjkOQezBqWS
	DUXXl77gOgbmU+isQx//d4Q4UziyOKwJQCO3pi5kylRqOEOTK9H3Kcq8LGtMfI3fyu4ffZdGNEG
	7ZOojLQG794ByyjEjWU5nrNIYKd/wpyHppvmFQYlYnpSdZhA7ziscRD9ovMaquUfm4vAtYs/R0g
	thWZJK264oDpWXNym4taQ7EGMnFalM7ClCEg5t+Qga5qjSSr2jn7m21YkNOjrXQHEytCjBdVo1T
	6j9tvcb01CUupxbJoH7nITtxxmWze+H0WcU+Uwfyg/gkgGazVt3V3joY5//1BtPQiFlA/FspzN/
	wrp2Q
X-Received: by 2002:a05:600c:a06:b0:4a2:40:7f35 with SMTP id 5b1f17b1804b1-4a35acaaacfmr122280585e9.31.1793016572849;
        Mon, 26 Oct 2026 05:09:32 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-14-234.xnet.hr. [88.207.14.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a00e1b0sm152200695e9.3.2026.10.26.05.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:09:32 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2 2/4] dt-bindings: clocks: qcom,gcc-ipq8074: Allow CMN PLL bias clocks
Date: Mon, 26 Oct 2026 13:08:13 +0100
Message-ID: <20261026120920.1667982-2-robimarko@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com>
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

CMN PLL in IPQ8074 provides 2 fixed clocks to the GCC clock controller.
In order to describe this in DTS, allow passing them as the inputs to GCC.

This has a benefit that it avoids doing a global matching by name.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v2:
- Keep the existing four-clock form valid with minItems: 4.
- Drop the _clk suffix from the new GCC input names.
- Correct the NSS NoC bias clock description to 461.5 MHz.

 .../devicetree/bindings/clock/qcom,gcc-ipq8074.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
index 00d7df75b3d6..1c9854a5c572 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
@@ -24,18 +24,24 @@ properties:
     const: qcom,gcc-ipq8074
 
   clocks:
+    minItems: 4
     items:
       - description: board XO clock
       - description: sleep clock
       - description: Gen3 QMP PCIe PHY PIPE clock
       - description: Gen2 QMP PCIe PHY PIPE clock
+      - description: 300 MHz bias clock from CMN PLL
+      - description: 461.5 MHz NSS NoC bias clock from CMN PLL
 
   clock-names:
+    minItems: 4
     items:
       - const: xo
       - const: sleep_clk
       - const: pcie0_pipe
       - const: pcie1_pipe
+      - const: bias_pll_cc
+      - const: bias_pll_nss_noc
 
 required:
   - compatible
-- 
2.56.0

