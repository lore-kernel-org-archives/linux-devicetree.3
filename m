Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABA040DB43
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146859; cv=none; b=J2IQ4FFCWiO3vxtJdd7q+k7BUP727e4dlLpCPQf7ql9WXvdFeo70fO0kCvtGnNTpqNFObmuPuY/FUMcPPCFZnAQSbxeIfYcf69IWde41wBAbZT5z9uwaGL/7Fgo7G1Aw1wHE1PhxtUiGo3olNArSrcj2DbrCg/hJ1ZGsGeGCtPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146859; c=relaxed/simple;
	bh=sprRzO+Who/LqrpWB7LZgsBNOyJQMqU8u8RnDFPAWYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+y6WtaJhBJVunwS4RhtJwRkpXSNOgc84p3DjF3T2ssnpWg6SVxxqtQ+WVP/vOCj4H0BdQZVq7uzg/37pbtQ4N1QVtx1tHEOp3axEU5ALPPXUcJpNoxB7POjILKJrjFB/RmuqtH+n6euvpeSvRj/9gp1G9rw88axej/m4ARIaoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rA0Tl6oS; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rA0Tl6oS"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1312019f8f.0
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792146856; x=1792751656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOtyDYq/+clIKHUqG6DwQpgOOBIrRWoQi8mCvLhnFfY=;
        b=rA0Tl6oSGecAJETgX7GLekjibXARYUzCePEvPSqTWzZUMA7DYySdBwzNAzQKdBzrtm
         cdhALKWm8nZYW7yINguWpT1ErxywuX3/xVBfEX9LGtCfJALtBmzWkl7s5kxr0tPbUqtm
         blk68x9LjSfmifaK95mjI1q574A1aI3L0Qcpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146856; x=1792751656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOtyDYq/+clIKHUqG6DwQpgOOBIrRWoQi8mCvLhnFfY=;
        b=AxXO6+lT728ywgyUW6fFkqEzKSoDjuO6bxqYbQZriV0eDZ+GUWYzR8ul8GjPSMTo5v
         jrXKDRmthy9PAnVeUryPTPRbn4163JmKgnDPc3Og3y2Cb6PH6PVhkNeCmxreN0OCbJaP
         nMBcyjiaTpsUSLFSdgLYIolsPVTPRvITdCA4NqJywp2QPtemj5ZRpjyher5c4Wr+XPJF
         yxwWNfm+opHQA6T5SemjG5w8Kg+TFmxdwC1ZqpORj3ZqCAYfRytuo9Z6vYfdB+lD5EK8
         lyJ9zuLy2RZPGDz6wCjArEnsZ7od02u0/xg9MHkrYbMOxBInZU55kzgCAOhz0aFe3uOA
         1HIg==
X-Forwarded-Encrypted: i=1; AKwUvBxsFaYOvkL6f2QlcB3QufZ9rKomNwXyTrGgtghrtxxeLCWHdLh4QrfMdQ8WLX86YTbvTFYcZ4WeBkKi@vger.kernel.org
X-Gm-Message-State: AFq9FYKAgepZouGHl97urJPfJT4gMX7ez8xu1zGmlZp5LJ8zeZVf64q8
	fRHNVbErFJDDkkAmHFWSg43K5jkpQoI7HXQ34VRbMaG44QuuTAtB/N5xfQEvzs7q97k=
X-Gm-Gg: AYBFou0K+/cYs3mvBenbFopirMsanuSPYibg/7/M07mBauDFB2zY0stSroEc3yNtDTB
	e7XjzKzCFc8e/Qo2TUhh/npFmIzJcKwhszluJ6vcxE31QF6+sA0CanWB7REwKObh+fTKZ7+MJzm
	kxiq05Ab0SjW1MFwtIBooqVGBiOXHuRBjowwyaRMbEkXvpkg97c5RdV6n2NtQ87Rb9tHybe8lKs
	tt/4QXA49J4B+HlYsZ1PCkwqPis/dBPyKhWTbvE3o0YRIN2rSbX+FdzJEVru8d+eFMwzJkganiP
	cdLLhfrEp2Bqso3FGXiivsIjWUjb4M66XFQfXFNkx4/jxOj9G24/kU0pDEIKcwu40kyV70Dxs5O
	PnSUBE8oKQFZuXOuzGh08brhl4PyhwJKfwoYADTA7QGKw9NwU9AxKsiCvk+0MBGpTOz9jA2MKfs
	JBNkiFys1rooiXVcKLKhYDPEsvsNTxYtCyuNFFPlm+bx4lY7XdKmMhbFMYfcBO0u4ZdKNx8Lc3Y
	iWwcuPjg16HbKcUVSGL+bkakF0bFzTCfO5sAgXxbYcQiljR/XMDr5E=
X-Received: by 2002:a05:6000:25fd:b0:487:f37:7ec4 with SMTP id ffacd0b85a97d-48dbaae5ba3mr44319272f8f.24.1792146855274;
        Fri, 16 Oct 2026 03:34:15 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8382-0206-0000-0000-0000-0bc0.ipv6.o2.cz. [2a00:1028:8382:206::bc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5035bbsm4219327f8f.44.2026.10.16.03.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:34:14 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 16 Oct 2026 12:33:54 +0200
Subject: [PATCH v2 1/5] ASoC: dt-bindings: Add ti,pcm1795 and ti,pcm1796
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261016-work-v2-1-9340b9555fbb@amarulasolutions.com>
References: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
In-Reply-To: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
To: Peter Rosin <peda@lysator.liu.se>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
X-Mailer: b4 0.16.0

From: Michael Trimarchi <michael@amarulasolutions.com>

The PCM1795 and PCM1796 are cost/power-reduced variants of PCM1792A.
Both are register compatible with the PCM1792A, so they belong in the
trivial codec schema.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Roman Smrž <roman@amarulasolutions.com>

---
Changes in v2:
- Updated description.
---
 Documentation/devicetree/bindings/sound/trivial-codec.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/trivial-codec.yaml b/Documentation/devicetree/bindings/sound/trivial-codec.yaml
index 9a35dfb17349..a24a21c855e1 100644
--- a/Documentation/devicetree/bindings/sound/trivial-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/trivial-codec.yaml
@@ -36,6 +36,8 @@ properties:
       - sdw3019f836300
       - ti,pcm1789
       - ti,pcm1792a
+      - ti,pcm1795
+      - ti,pcm1796
       - ti,pcm5102a
       - wlf,wm8510
       - wlf,wm8523

-- 
2.55.0

