Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4855D8F0
	for <devicetree@vger.kernel.org>; Sat, 21 Mar 2026 01:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774056038; cv=none; b=J4IRMas/jKSXafbZuTC857mZBpJ5pyoY/69cbnkqpYH9k+g5ttPmDw1m1cYks64nwPfNHXRnes+O8e+LACoPi3n3RcdZ+d3TlOsj6C82qDbN9LHUEISoIwih37/HBSKuCv4Z3qhS4dBHaz+SMtNpQA541K/foY853ju30HZzwB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774056038; c=relaxed/simple;
	bh=7GrLjUidNUXQd+M+rjH7w+U5i+fbFzoPONRrEBEyly4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nInRdGt7e3CIpTGiwrpA7dJworIb/XPEp6rfy6oxCaLo/S3Bo+5A+15qwiTKooQdYunbrSSGRh2r2kl0jcd3tc0qvQI9nDsc31XzO9KCHygp7KrI5toFvgX0Gm91dwziwyV7j1EJ+g5cJpjN9QaTaKD/sQgY5MQzHVTxtZP4KhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DiFNXBSf; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DiFNXBSf"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b7c2788dso704485f8f.1
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 18:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774056035; x=1774660835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t13zBT/T6/lDXSt7yrtbcb88tX0zdjCe4g/9CVLLbBg=;
        b=DiFNXBSfdeJRuu1hxeB9Hpu4/1fZwjNN9CfvW5mVkd0BlQBKB3UsJNoe552ss9jKD/
         hM6pyq3LQD7NwT5SvCUNXxfoTcJ8xT827+xhPzEdMy1TcSiJySy+2+/jaB8WFxH+zT+U
         ISogz0pnPtiV7bCuQd4soQXdVEbBIug7UByhiO1krZGNMJqISVdLBgNCEAjwy5II9qvj
         YphV7brtTVDdJZnLP2u77O8z15NNVP4VtNFNohSjxopkanf6pmPUrbbkhw8LlPldGe0+
         dodXxgbd1955GinPTxZRLJZ8lZiRlPyNBV6RJ3+J2h6on92UBv4h5jc+21hnjS6xbOQl
         BLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774056035; x=1774660835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t13zBT/T6/lDXSt7yrtbcb88tX0zdjCe4g/9CVLLbBg=;
        b=mv5hXft4+k8qf2XD+MFquGUTs+jfivKPcLtYmEs9mwTYz6P57WhKVf9wOvU2bXhPBW
         eYPkIawd2G+5e10qX0A/fS0F/dcLX2GhsQRoPdyvNpxAANIAeVmTdSb+/gnxEbtOAAxt
         azCusPbvtOEdonJGl0PJbbNbU93vrDpx0o46ws013DHrwFLGic8UnZep7zJaXt6YmDfz
         bYT/zaetOTHUJrjtUiosNyUUybEaxRs4VVhfAePhW0KwT5bArff1Wr7amHSpEGLeCubd
         1rUkoxf79ztzJdV3aLE97qsIhzdEBliOWs0Bt299jV6EjUuhw8AP5Oukdn+UVSfpS2CP
         34jg==
X-Forwarded-Encrypted: i=1; AJvYcCUN+D195wTR5erVXtO9ocmT4X+b84cYVgJQhiXd10wQLewRWJgOb4mYCortgTbjsWNUAYxVZHALb2iB@vger.kernel.org
X-Gm-Message-State: AOJu0YxPhZe0lyMBfeAQV6NRhBCAT0ZsjxNWfJsZ5Q2iwFc/9LwB2T9V
	RC7RQFZbMwMGh8s/OFQ3q9Jjv9UtKWtCRL2u44/hV8TWys3UJz+XQiw=
X-Gm-Gg: ATEYQzyhms/ABfdGKpRJuMOEztW8g4YoTHQMpSh7EZOLNjCzrGZNysYj7NeWA0ynZRb
	9brruUQk/BB4oJn/7tZp0kTkL7YtcSQNPHnfzR36NtgBkErXpbn+lj1XVLSVudUdb7JD7au1BQY
	PrVjUH/NDMLsrrhNnEaVWfhmYW0onmqtX9bafdNWfRdz9RKvm3aR/awrD5bnTkkrPtjLXWMEII3
	UJqKem51DnSox6yzUmjTeR8nRslpp7llgzpn+MJ0Tie+uO2MyvpMEqi/whcUN/H+DngS6/eXLvI
	MIR85VhpgvxuYhnDOgXZMRE1beo/EAZIqmPoAZfZhBcdON7qxHQkp2mcyqmnDdLT7xl5T744soY
	QIQliKdZ7/OM+rgfIA4HzgTtdYcMC+Vz1lhf9WBAOJT92SgEd2z/iyV0nTJBbg98t0mxlUNuS9y
	lhHEQiS2uNrNy1i8/kwM5GX6lXc0u/YncAI9+PJANj
X-Received: by 2002:a05:6000:2dc2:b0:43b:6352:a262 with SMTP id ffacd0b85a97d-43b64286a5amr8476539f8f.41.1774056035153;
        Fri, 20 Mar 2026 18:20:35 -0700 (PDT)
Received: from localhost.localdomain ([37.166.81.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b647036e0sm11091605f8f.21.2026.03.20.18.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 18:20:32 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ASoC: dt-bindings: stm32: Fix incorrect compatible string in stm32h7-sai match
Date: Sat, 21 Mar 2026 02:20:11 +0100
Message-ID: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The conditional block that defines clock constraints for the stm32h7-sai
variant references "st,stm32mph7-sai", which does not match any compatible
string in the enum. As a result, clock validation for the h7 variant is
silently skipped. Correct the compatible string to "st,stm32h7-sai".

Fixes: 8509bb1f11a1f ("ASoC: dt-bindings: add stm32mp25 support for sai")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 Documentation/devicetree/bindings/sound/st,stm32-sai.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
index 4a7129d0b157..551edf39e766 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
@@ -164,7 +164,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: st,stm32mph7-sai
+            const: st,stm32h7-sai
     then:
       properties:
         clocks:
-- 
2.47.3

