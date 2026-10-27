Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102454;
	b=Xs7KH3npeahsthXvuGgA+ERG6U+Ox+l9qDKNpgFN1ASflC2gO0yGbuSxigDYRknfWoL2
	 230fSgAcVnwaEVsxX16QAAEj5jyGDW75+rhwplTgQ4TehH9eMDjJvkwHy/0s3ocN1Qe6p
	 qtJlXvCN0S3R9MWIMYmOpCi/YBejgm1dNXrWiuGBuXi4C6wuM1bvyEEYT3+WzMSbxLDD+
	 bOp96h0L4GMkGlqpt9MENLs/AQAFYaTw1RfWVsFbWymVapzzm2aRPJkPXba2QPobr+RCI
	 nIMWxpxBH7KTeFC0J2/zW2+WclvIoQZRqeJoPmMB16YX5E+TobRVvt1H/CpfdvfFDWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
	b=DbrA1WZVUr3L+hc9xgP1LsZHzV1fp+wM0MO9MJdklUgvm95wloo54uPIPlZWoIB29m5+
	 cfbjX50AfVFdnRngtpqGZJhPcvzxdYFCI++rh+k0Li8mZBiSJplq47xcrWEnkPT0E39b/
	 vlAvW2rhCyZDmOqZHuGvwGqsOCln25LT5x07W6YV6B3kRsvA48w7zS4a/gLrOX2SFsAQo
	 XWjgaIGiXjLPBCswDC6WJrhq7+5bFhq/kGXQYjn89HbS9o0bIxXciUOTyJYhqBXQmpi9z
	 wmGRJTjcbBxId2oAY0qbTWVjaorWiORC3WH7BqFXqho19HwdNULMtV6NobJa8GBSiVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gXsK3c89;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E760A260B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 12:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D6E760A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gXsK3c89
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so7064297a12.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 05:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102453; x=1793707253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
        b=gXsK3c89vpWz088eJ7ug3RXM6pCdHmPR51kIClm8GCuTOQnA0rnAqT0PKP3KJSiVEO
         UpnTeF0Vo9pMjQ0eTH0W6EnXIIWmKw32WkkjqFyx8HA3h9jgzpRst9qtgcY23VzK6bfW
         zOc8AymEchMnog9IaOt/l0ZRXFFBjoGgwoGVLAh5QXQf4Y+262AgDfjq/Fv5J2r3phsF
         7+7gOeFqRj6oSEvDwKYHKx9NzzMGMt8U2hr94fJWLGyI6S3rgKDsN+e1utgPGHSD5VKe
         rwk2B+pDqiM+EEsY2sGXt6hT3lH314BbS4tVdUZlnf8DGZlVu99bmtoVA/Opc/vg2Rih
         ZDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102453; x=1793707253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dLjfaG5VG77l5DZwxYt0AYp+nduCRIxCozU2SgGhuK4=;
        b=PqYC+iuj63QgHzAiPJT/dTwdNuo4ixG04CGWqCTr+K/V5maZ78ZabSj6obbiYgRsnI
         JqIGOkZteSPO/veKy21TYUTCyF2JM/PDHl735SMiH++h6PoDnKIahcjklJR4EVThtUXg
         w/VOt4MbsGpBNU80qaQ4TgZ0Haz8Pp00vVT4ofGYX7/BJ57erMY0/cmwsTPuLaBMf6GM
         3VdFvdiFZr84cEk7MHqfNr5UK17I6ROVC6pTI3tVuATCQjVqB8MdRKzRfqhLuj1KAsc2
         OMbxsJZIz85NN47uT779RejaleyaP495PYQQgj+Q851J959KnmdVxhe8giorC5C3Muon
         RPEg==
X-Forwarded-Encrypted: i=1; AKwUvBxIM6WG4jFmsnMwHo0ckioZP+87BqVPsSw1nbLrYG+lc+fYWHVLabMaitlxNz8tKcWKOz5dehBAE3/M@vger.kernel.org
X-Gm-Message-State: AFq9FYLevfxwzV2gWdLVaQ+aw+obUhtq+80dZZ1zSGZKIHOPgudOVRcv
	5UDujsw5liCh2gHnl4Vt9yU93nqu9yBwIeIWHWgAl9d8NsrH7GQ1wWDj
X-Gm-Gg: AYBFou1QteFp6LSSFnsA+w9qrz9e7J0zvdA0+Bk31G/K2Pw3zR+bSh2wqJQa77GQBfb
	Q4mLoggbuY1epmSFQ8g92CWUjgui5k2HWCUKRBBhgkCcz54Btfqxnyu44AWYMYky66pEL44sjoj
	Aa5tpYKc+WkRBUw7rMZ3Xsl1JJX/NM8rT04SnePagcRydA3P2thERSMJIo+YbbKY0l1YNN829o8
	ZxVmkXZhfYvgBmKWopsInrGCZcCZlA83zUOXOo2SYv4pQf+Bhfmz5EmNCgWA0+N9nlY6GnfUFxN
	eJqNAqqWHNyfssHiBzKYZmz9QwT5fpudecc5D6afaiT9eaKuPPUsFhg+dbLEp84uTZDxLnaJgBW
	c0a6NWXZUbYpZ/IXDiLWyLHAZDbh3yxigSvqzzPraYkoY0IyKtg+mooUqhmc+ARTtauxVRWPysa
	GsUNCpl2Ou1LiBbYUCXh9EtrslfUl6QBoYf415U35S9dvtOYL0kskhumkKU33j9hU00zPLM6uh6
	BXgXECqqP0Cuz7w5eUe/yrUP4Uq/AyJEzi+YQLzb3zFo82OpP5bJVr8bqy3d7UaSRempoOqM7bK
X-Received: by 2002:a05:6402:e03:b0:6aa:9284:9a99 with SMTP id 4fb4d7f45d1cf-6b442a806a7mr10453861a12.6.1793102452579;
        Tue, 27 Oct 2026 05:00:52 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:50 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/7] ASoC: dt-bindings: realtek,alc5632: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:14 +0200
Message-ID: <20261027120019.93611-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
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

The Realtek ALC5632 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/realtek,alc5632.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
index fb05988ff7ea0..939b1fbf2afe6 100644
--- a/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,alc5632.yaml
@@ -28,6 +28,9 @@ description: |
 maintainers:
   - Leon Romanovsky <leon@leon.nu>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: realtek,alc5632
@@ -40,13 +43,16 @@ properties:
 
   gpio-controller: true
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - '#gpio-cells'
   - gpio-controller
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

