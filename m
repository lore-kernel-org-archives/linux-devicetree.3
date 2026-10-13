Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231C2531AF6
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914589; cv=none; b=SnZAByP2muJJuMmUL7VzSQWjwfAbVtw0o81Z6LcoG18Q85D/6nvmecxmGjDSIeQLVHCdYOru2ZUbnQun3b0q8a68PO9hd/dPfUO0c2twdst9FqA45OOUH7sss5WZ1iCSz5Y6jdq2tIdg2Pt2Br5aMQD/o5BnoM2JVNTfJvDUp9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914589; c=relaxed/simple;
	bh=8QoQiaUknFw6yvkIK8dR+3u9Ax3UfCtpP/SNCi3d48w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DsCVKki45l+r+ptYKy/8JmYq8JHKPh+NyNgVIFgCYUBg2OkqebMoD+ewJcLa5qeFurlQBdknw6kHwqJWBtUatJBHePLKAZowFUQt/mut53pFg48/OhEDy7nI5izeN3ReHcQ7XmjZpV/0NRL77gPXDRx+SigCSAHzG6mogHt+Z9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxPshHhs; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxPshHhs"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so1615725e9.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914585; x=1792519385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Krc+gHcRwAHdAXwe+VUoLF2d3nEBam+7GbmQa8wq/d0=;
        b=KxPshHhsdHdn/4VG4H6U58ZU3cu8VHkD23+aRv/6XARIO34mvb3geUJlxngolSI98/
         IYLfiV5Cb+uOuphje3UObDJ+Qvy2ehHMYCPzoHztFiYZkZ1Zv4lfUmQQRCfa70udPmlq
         jqyu8GFCM7aRaj7fa/uwAyPpAk4+nroQt+e8p7sjj+h2Dvno4I7guSwm9A+bUvIh2hO0
         yz5EAXhZKNVFt5U+DiQFp6Uv5e68DIDnOf/Lpwe4A7fmLQH2/8G06VDCEwR1Moyrjm0R
         5mhUj943fcpgAiKwFkBQAsN+4mR944UXw19zEI0Vur2hMd26u+Kt6c/CjoOSLIMsO6nO
         +myA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914585; x=1792519385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Krc+gHcRwAHdAXwe+VUoLF2d3nEBam+7GbmQa8wq/d0=;
        b=aNd+N9hEJXXo8aR8GQTIHn2DQH28mQMTuXiFF/xYrmiiT9MxNon65Q6Eprw36GINYr
         txraj/qg+sQVftWZGhXbcTF36IuuFWYjrvm3tiLo62/blr890I/N4s7AsBH1vvdRjDWN
         y+regnUg125sGQDwq7DKOBMDjdlheWgbPfSdHYD7S7Ewe3Jczxc/BJIyK3brX19g2noe
         DshA2q1N6kNWMS4JtB1yWkW10LM5iEYEhamHW99nZfVWIDyMZlU/O9vW+Mr01of7AMg4
         bVJ+b6DUXDGmvCkt0Bw8Z3NWcrjN1720bfz0uN1M8D2qn38UEeWWj8WhiTMYeKQ4olTv
         svMg==
X-Forwarded-Encrypted: i=1; AKwUvBxrlfg2iUOolYZegFrvoL61nVdqvzcGQuL8jd0gy8FsHIQqARFXkB8kh34c5vJA9L0/SeX5BAFnn1xA@vger.kernel.org
X-Gm-Message-State: AFq9FYLoHwicrjJdVD6+7ddrgZPyJK1Y1EiCF3gvzlZGRUmAyAAFcOVY
	5lO8hLKF5RNj+SEGVt/rokk8DOELaVfQXfgtstx74qXU86ozNO5BErsg
X-Gm-Gg: AYBFou2eiZGGPiaNjbcVece1SSqUOAXKBwHrJdYx4AhDPAMdVbAuafSGpgEuQSc49ya
	YCTqS2Rq9SzYnIPoImVubhIUgN7cngiifs5SxrM/KbhoosU6gQgin95HGmLGu5t/pwW1sbqnaBb
	KMll4yjlgCldfDoDC5TQEg5POf+P30bT056ZB3HuP9biRVZN3390SrEHktdH+zZpEioVwut6Sg4
	+RX65yquyhB2T+P/tsNbbcD73+y1h8Xn0LjBue685wfWkbHS6JLIsP4MBigGCNvpHUDfQY3jy3H
	mqS4gyYyVX7SvN72q3hQY22mrWb2L0mll+v4+ZKb5KiDIkdMi2A+wGlS+sqZF7KsGkligbnSx9d
	o25PLbct6ZF71yDYaxX1CL8bAFW1NGhBa1CmRX/FKN2QVDLQKEhs6gHQp3du1M//7LQR7mf0/+k
	USko8u1wCQzZw4IGI3iIsbgbuwb0imcn3T0pyVgLYR0Ng8KcuXeRkryApWIa7QlZl+aTyGKwwS7
	ArPHvj0aBHbe6zTlag=
X-Received: by 2002:a05:600c:19cf:b0:4a0:168f:d962 with SMTP id 5b1f17b1804b1-4a18e44363dmr260068075e9.3.1791914585194;
        Tue, 13 Oct 2026 11:03:05 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm6381987f8f.48.2026.10.13.11.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:03:04 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sheetal <sheetal@nvidia.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ASoC: nvidia,tegra-audio-common: Document nvidia,aux-devs property
Date: Tue, 13 Oct 2026 21:02:52 +0300
Message-ID: <20261013180253.477605-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013180253.477605-1-clamor95@gmail.com>
References: <20261013180253.477605-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add nvidia,aux-devs which can contain a list of phandles pointing to
auxiliary devices, such as amplifiers, sound-muxes or dsp, to be added to
the sound card.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/nvidia,tegra-audio-common.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
index 2588589ad62d3..316806fc7346e 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
@@ -48,6 +48,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of audio codec
 
+  nvidia,aux-devs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: List of phandles pointing to auxiliary devices,
+      such as amplifiers or dsp, to be added to the sound card.
+
   nvidia,spkr-en-gpios:
     maxItems: 1
     description: The GPIO that enables the speakers
-- 
2.53.0

