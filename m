Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694D4430781
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784751450; cv=none; b=qaGvJuXxz0/qLNOAvB5vWdy6qQMlt3eJQPiHN30is7+ngkTGeQDOqdNBihcr4gJgqW5mkecLVQxC63a+Aer3cx0fcmPELk7SMnCdMad/MX27jlv3WP8fG2SQHq02WiBIxtl2lAxDxKWQMr/8lR35GvPm5msS0apQ11j1X0n/vno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784751450; c=relaxed/simple;
	bh=hWtIGjArErAjmGxAq8Qyi1JITa77ixSzYUKOMK4w6YI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JrU5hmrdqqzjNt3tRuhovMB0K8c9RyCbO3hdwLNBruoLSlpTp+L79dCok/MgzyqIiw/8eZ8f6JU5xQNEmiv1TfKzbgZG6sPsMlxtK1hZPujydEYWemfD3svpKWASFnLjIIWCkyU9lm8zKlK+td1DLnjy//zS/93KSfoYeJVYoFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZ7fOka6; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZ7fOka6"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-664ce3000e6so7950862d50.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784751448; x=1785356248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=62mD7eBH4bySVV9OXCWZ5h4brKSHdA8TNqCtitgdSko=;
        b=aZ7fOka6t+oL6EShyfe6McnqsjERs0CfuU+f+PdE3aRaGiQVrvHQ0oyYHwvX/EEX0X
         htx1PHageMIkOTo3qP8a8W8Qm13yffG1BkIZVp21wpZMD3k9DsRPOu//SkklRzUavfD0
         eUL8n+ekf1N8Xod3OKE6Dg0mBAdg5MOFt2m7Eg+xv/go7djbIgEy2ScLrlAHKyM0vfYO
         fRwQzQbEOOVW5C6TIfWDWrF9CMmsdpyCElURA5iB/jYKF1yWh/OS1R6ufw8/MSW2VnJ3
         aSeiYJsZTs2p1UT70L06gfEjDTsB7TchTgeV+k9NQamdesfwflSxMgTtHvUE9TMkwOag
         VCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751448; x=1785356248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=62mD7eBH4bySVV9OXCWZ5h4brKSHdA8TNqCtitgdSko=;
        b=THkQo64J2hlwezW/0uaDdp7LKcampRkukwsjJXAYwNHfCOI//7zPTDBvFKjGjnfcYl
         aMsAdhRXznWckTkL+MqHP1S9SHytyjBFOun0bnwHjVdV1EKP0xpZaBKW/Eenr1koI678
         GmLZamGC34rzH58DXBWStosFDl2chLdWjAu2PQUrJZmHcDKvQvPvK4fJcOBTuqCG32CE
         8q7mK6nReoWU54DOzYchEaVSgCY6wwIV5dRNEOOE49/Saln+PS6nUBlGqUr7RQMijIBp
         IGckUDxWm19NU0SPCaMWdYRRDAYO+2pSncmIdaFXRGpk7YvG2k/hKXZN6+hCRwRTat/w
         U38g==
X-Forwarded-Encrypted: i=1; AHgh+RqHq3hF+ED6eWiDQW2CvsqfPAeSLlgcZg6Kprw6l9iEg1y3bf/AI1j0ffT/ER5SfYXR7XHnn/wNqvQi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3IfayInlQvvzYwwQ78RaRFzrW3ajaLHKubLvCIuWFXI7w1KjT
	7r+GWHFQAeylV8AKH+lV0Jrsb96q8wmPS5aDvExTQwkr+Qyy9wBA7rCu
X-Gm-Gg: AR+sD13zxcde45gF2ksFQcZ144s/f+wXg57isu/jAE3/2HzekLzssVUXz69qqFDjYfx
	cpsRKlZPAkqguOaYgRWfvRmV3GWyZv6PywSc4uFdNxReM9oD54xyCz/viwO/W8f4aao7QMJrLHi
	dl5e3atE/W5hp0BB4wfJjJMZS07PQocuAYq2Ou3U57t08v0nTewNzN6NKZ75szncOC9tvaKMqtO
	CAZiW0uo7cu5uHKZU18+3Rk/xXad+HiFMwnPuKeSFAjHPnDIh31W0eJRbjv4u33kd+JfjDD7mYF
	Xcd9GLbuqpvIv7qsuOyigXoTkoUpTlPRZgEzIggXr2Mk66Q5n9YkQrh6YdubL0/7GXaISnPpKJE
	3rup+mcOStW7I5lWeqZlvvrZzj3fMSZKUS5H2Pu1inkrNZGVcQonSdECZOmaqzbVBFG4GAD6SBC
	g+0E9EMDy8gkfhTCVmoXzUVbPZw/QZzcnjp5QjwXEG2H93Rto=
X-Received: by 2002:a53:b1a4:0:b0:666:515c:522d with SMTP id 956f58d0204a3-668a4c49e16mr24887d50.29.1784751448323;
        Wed, 22 Jul 2026 13:17:28 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm1958866d50.9.2026.07.22.13.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:17:27 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH v2 0/3] media: rc: sunxi-cir: support the A523/H728/T527 IR receiver
Date: Wed, 22 Jul 2026 16:17:14 -0400
Message-ID: <20260722201717.2205609-1-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for the delay,

This is v2 of the series that adds support for the CIR
receiver found in the Allwinner A523/T527/H728 family (sun55i).

Unlike the previous version of the series, this version has no driver changes,
and just uses a fallback compatible and enables the receiver.

Tested again on my X96Q Pro+ (H728) TV box with the Google TV remote that
came in the box (using NEC keymap). Was able to press buttons and
get readings from lirc / ir-keytable again.

The series is (re)based on tag v7.2-rc4 on mainline.

Justin Suess (3):
  media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
  arm64: dts: allwinner: a523: add IR receiver nodes
  arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

 .../media/allwinner,sun4i-a10-ir.yaml         |  8 ++++--
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 28 +++++++++++++++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  6 ++++
 3 files changed, 39 insertions(+), 3 deletions(-)


base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.54.0

