Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1A5472774
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 07:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531222; cv=none; b=nSxTUp1cif3TsqpjAUhcNk8bWGEqprUX1/l85jAWg1FjPPOzqjMsKlSRnkuk5ROjrWcpD1UdSKzX2ztlQWpphcg+KhhfFkGQJUGpTBjxi2x1mlt14NToLIEfOzvw+r6jTnsq+CWIAnrsasUVoGk5o+v0nGVVooY+I3XzxUa5XMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531222; c=relaxed/simple;
	bh=DNeUKDQc6MOqH1ADnGtMgjyCzwqfg807JsDXZXD8PdE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=KSVR+ZgWB6xaRUgWUfjQt4AGAiiGnmG+12VBhOpP+B9r2q59/+a2H68S38uY+0FSg2yQR04suABuS7XmaMQJxYlOli5fescuyRK9lzcTsotgihc82skkz0jb3RMoE+aI2k+NXGrQOBI6CZoVpiRDPX+DXtPPrS0X5a6rlnG6sj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmEO44SE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmEO44SE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a061a13884so32577945e9.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 00:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791531217; x=1792136017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kxQ45OeQSc5IyxmrCu5z0MqBw+JjYn7NVXImWxo9iSQ=;
        b=WmEO44SEUdt2owfjB9YzQUatK8n2baFMrDOnhEHIU0pts+OSglFWH4l00AqJ7kiqqZ
         0mCb3GF19TXkzwtpEd/9hotq7VKKSeQ2YmMtxHUBPydWWrJM1l6ZeG4Dlx0YhAQRXkDj
         juhg7d9BN+Y9vacAkr9kIMSLJdDuETNB63YccKnAhA9wXX0y0S0z2l9gG285C7M+ETOH
         /YdTtvmZs2J6msVcHf3yOgEpfdHYB3JrnZiJyRfpfdAEjPafsZWtikiyVn6qPfXC/ejb
         OeJbkC/Rtnkg53MsLOfs0QeW438LZk1MrUNMPiBb1qJsJwZL1V2PMdFGU87PMKPWkZMk
         i/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531217; x=1792136017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kxQ45OeQSc5IyxmrCu5z0MqBw+JjYn7NVXImWxo9iSQ=;
        b=KVSS0wqcrk5GdoWX0s/gJKo4LJl4q8o6s3xRqeFgPwqZ79kXbJwhL8MFjaamCXRtIS
         o/2Wh7g99xFsSQ93f44r+uMa5HjgySE71IPo62Nz2coYn6IE2MDi+9xD1r4Lqoq+VZbg
         3xzjsWk2NffM0nrWx19el1+u8o0wMa/0/R0eOIZIhyDqVQ8MgzNBlClAiZL0OA6SR0F9
         4hsm5htDJ7C+sjzMCvsDN6/pjkv4YPqGAwD0mLVEgbDnlljq58giIbmgGE3o8Bqnzzal
         gd9t+/erQK4meZgu2xJyasrn3vAt5oiJKERVEHyJHDDsNrA8v1wREG6mxdRKVLGoZF97
         jkAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbAjdLTqSxVA+MSrmeeq2BTL0HzC2raI1cgxXAeUaehdFcuZl7HDMkGc0OHGiwo7gFJkk9myypHlfm@vger.kernel.org
X-Gm-Message-State: AFuF++krn14YzbSiVd25UnJUhOPsXeh2OUpJhvaLMbDjl+vHNfOyZArF
	uUhtH6kbRyOM6/5mxYt07shAgI81dEpAG74UQ9cdm2fc6AODUFqVBLUB
X-Gm-Gg: AYBFou0rU/FhTCmmeJW/dZ5Hy6+rX0tFi7dImTrXfGOR5sa3XsLO1kVrJQ1nx00De35
	1yQQtCasIAblX9jVsnsGqekoEHtPDSEPlREC7gw4zlkVdgkDYaVlU7THie6tlZOYp59u7xGGxfb
	4yGeN6LqpvQuT561XkactzA8340uvCou3YqbQQw8hRTWMnkkKbA6WrmPefuLF6hwkFX1diBU+h5
	YZX2DO2U5okC/hgwK3m04mW8hiDZnisN8lj1CLSmDoktqMb3vNi9XEXT1p9VSdzN2uGfBraMhbf
	It7g4CL6qcqc5yLFTaSsTtJ0wu94G80cyJjqVEGhGp4M0muWkQCnMHV48oYTKYDufX6kxNJEWAr
	3Q24QtP2154X2MfBzsbjpTnWso9DKI7HqjWvNb3597LyAHkkyq+IMZo5LgXdfeOTyMWAVAsnN+e
	RDx1zBm1o3Mog7F3thttLo4TI0jtvtdhH0Ck10ulbrojnZBgGHiGouy3fxiy8UFOy2yl1Pknk5q
	2kEmv/9K0pZCmuXPZDzYEzAInjCYRXuwavvUK0/cvbDnGp/smhqJDVKErjLUQMt8X0n66v4jPWM
	fknIY90jBmiwQkvjbw==
X-Received: by 2002:a05:600c:3b29:b0:49f:ce78:3561 with SMTP id 5b1f17b1804b1-4a18e49c420mr17004555e9.18.1791531217099;
        Fri, 09 Oct 2026 00:33:37 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18be96549sm55116365e9.6.2026.10.09.00.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:33:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] PM / devfreq: add Airoha SoC Subsystem scale support
Date: Fri,  9 Oct 2026 09:33:27 +0200
Message-ID: <20261009073330.18175-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha SoC contains multiple subsystem that are scaled to a
specific OPP taking the CPU clock as reference. Such sybsystem
can enter idle or performance state based on the system load
and power consumption conditions.

Example of such subsystem are GSW (Gigabit Switch), NPU (Custom
Risc Co-Processor for Network acceleration), SOE (Crypto Module) BUS...

Changes v2:
- Rename to a more symbolic name
- Address some sashiko bot warning
- Better describe the use of this devfreq driver

Christian Marangi (2):
  dt-bindings: devfreq: Document support for Airoha Subsystem Scale
  PM / devfreq: add Airoha SoC Subsystem devfreq driver

 .../devfreq/airoha,subsystem-scale.yaml       | 114 ++++++++++++++++++
 drivers/devfreq/Kconfig                       |  10 ++
 drivers/devfreq/Makefile                      |   1 +
 drivers/devfreq/airoha-subsystem-devfreq.c    | 100 +++++++++++++++
 4 files changed, 225 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/devfreq/airoha,subsystem-scale.yaml
 create mode 100644 drivers/devfreq/airoha-subsystem-devfreq.c

-- 
2.55.0

