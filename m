Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA6943710D
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784751460; cv=none; b=bxs0fao5RCAXaBGl5H4NTxzhuBdbxcQFNuMm0jU/ao4PZO7Jil+TnIHAbl7GsVLyl/2i9C172GZlwZtqNm7vgLi6rm4FnoeyvKz2gEHsvIQinnOE/Ip02cpX0r7LQmNWDdPZnO1h02Gw9oPvS+tyEhektxYVssD+ohdH8B07jCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784751460; c=relaxed/simple;
	bh=lE0BRLbpoMsGl2jH5YXu2f1E0PNhNUYeuMEbd04x4zY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uAupyqPTJWpt6zgfNXg5MqWVFyEqRyw5rGzbhjKTrTpA43fLv8TXip5TBKfEmmksuHkI4515ILM0BPu8kXxlFeilzAdtqLqLh7lsHd3ywnlRqhX8WwasmM6J5ui3hbuFHyv90SH8V5mFR6hZIFrIt63LjNUhAiOuoPUZD1p4gEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4YugzB8; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4YugzB8"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6689402c7bfso915494d50.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784751456; x=1785356256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivYBWU5cN/JEQ/dOoSRXx/VTuv2YZc+EvRKHLDz+SQA=;
        b=F4YugzB8br7IFSBxOmrZ4HGpeb1k62sFTwD+kQoV5hCigFx1gfmkc8t5dRhp7gpP2i
         tf9456hg5sT9lDwrTfSA6w9t6D2SFAIOv/Kp3UDZ6aHGLnjHIPfJiM70pVPpzphH+Df/
         n0m6nbdBFk/eKQaUp/OoH7jFWAHbWGl7mgSQFZC8pU2x+Ath8EhCTxEXUmQF1d7fxU/9
         4wBM+Xa9X4e1FdHYHCnsdozblAM+FAIV6KTbD6LZ93eMUuXytc0UY67YiAdUTOpfTvaO
         uKmHCI/bGWHPrtRRgW5PZvo+2HKO7+DDMkV0+hdjXjWn2EGc9Lc2gHbVzWkrQ1Dx0Kab
         9hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751456; x=1785356256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ivYBWU5cN/JEQ/dOoSRXx/VTuv2YZc+EvRKHLDz+SQA=;
        b=EoV7ZoBuGr1G6SZrr64cMnCYWXUn8kiugNjzWCNvYrZ2DGAl6NbPEZsotqMc9iK9nw
         iM+ApIRlA6YDpqZJP+JhweDbNdXvz8FWUc4snEjQ3yMOZq8SDZadD7oOteUvyo9CcViz
         NmTdKDVV/A8p/bffwmTUS+0gi9sl4IjGDhUh/2N3wnavZzLGiRdOkJl96hsUVZdaXNLj
         Z4DGMbNXi3HXcxmrJk2ZGmeIIOoRjieeMPdmZfKFk1kqGAAzdKCC7t3Z3WVHVSsmxBNH
         IQ2Y7ef1WNLAgMfGXQVa48VuY6wLOGmc93B7LZLd9obhxYuLqwhbHcZeL1467zG6Ie47
         wdOA==
X-Forwarded-Encrypted: i=1; AHgh+RotfFTZai8gQYVK5Dgo0IHBUCXJx3D7dkpNV1FJObowtX/6A9yzB04959xj1tJ2aW81os+v8GLMEQmh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8SzzEBDu9faq4t3jCdHX6g4ejGRvkhZ5z8cAO/DV5hlOi3oT0
	WblUOqy//ewg+eLZnVf6hmjCjZDZEdmPMw4pNH2Sa+EN2pNVGI1z7ezN
X-Gm-Gg: AR+sD10q06OMKNnApGRMGTExuCmPyUGxGxaI409K7MQ6kCELN+IbYsec9qLZkhVGVDW
	k5iaI32a8Sf0zrK0PpkS0T9TPvw7V4kUS6EOC7NrBSB/dlwqUMvJKMiU6zccYXnsalY1FfgTOnN
	Hme0EXQePn/koZxdKUUNs90y4PfaRcj8DQzj46E9QzAN4PLrbOlXxReUs/m92QbqYuv65Etu+us
	UX8FP2Fs6ewInz8h8AstRN5mvAd9Qb0GyJzCWLYzBLJcbbr+HkI7RM46Jub78NWrrCPDb6YUK+q
	7x9GdiU+3t8+GYUnuFn7Pce6nDqp7XC8ovXUVyJFUSyCEAo6YRpK6I97t/J/ynrhINfz7zDlZUB
	Kd6J0iKrJ9Y4EABfabxKlwFVaha2TX7LZSZK3t53s+fFHMH2I9htNd+ZNYO/XT6xiLxuQ+jEAmN
	yRTDfZ5SglZGcxe8+wDiKYcW6xWD/rG8RJ5Pui
X-Received: by 2002:a53:b083:0:b0:668:9128:28dd with SMTP id 956f58d0204a3-668a4f87cbfmr21361d50.81.1784751456120;
        Wed, 22 Jul 2026 13:17:36 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm1958866d50.9.2026.07.22.13.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:17:35 -0700 (PDT)
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
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
Date: Wed, 22 Jul 2026 16:17:17 -0400
Message-ID: <20260722201717.2205609-4-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722201717.2205609-1-utilityemal77@gmail.com>
References: <20260722201717.2205609-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X96Q Pro+ TV box has an IR receiver window on the front panel,
wired to the SoC CIR input on PL11.

Enable the CIR receiver in the RTC power domain and mux its RX
signal to PL11.

Tested on an X96 Pro+ with ir-keytable and nec keybindings with
the remote that it came with in the box.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..1eaee20acaab 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -266,6 +266,12 @@ reg_dcdc3_323: dcdc3 {
 	};
 };
 
+&r_ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_ir_rx_pin>;
+	status = "okay";
+};
+
 &r_pio {
 /*
  * Specifying the supply would create a circular dependency.
-- 
2.54.0

