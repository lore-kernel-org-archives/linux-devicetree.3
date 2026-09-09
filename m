Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0F652ED33
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 23:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997709; cv=none; b=lCq2fH5DLOMX/jil8qv+y3K8+KzGRkF3yBcdFsGcO3URpGk/uDSA7pJcat50hzojaCOma5DhQErLGCkPMTcvjgk1apQvzJx7Crg4bYWju7HcWEoikV5tubnmacPtQLx1qSvSVRg++Kp6/OPGchPvS9FozgKq1JaIcIG8E+AtJxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997709; c=relaxed/simple;
	bh=G+K6yZL86J94n5ErSMRjznPkkKACsHzlBBj5w8KooVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=erQXTOP+gG2kTMcO5kSYSouFD4d/2TgU5+I2fd/zkhD2kOdE15792BzA5MnumyxRf/eUxRXCxcJB85X8Mhtkjmp+9n0WYUShGVYQG3HhbQ1BNFzOVoFLON3d3R1dr7ViPkM2LYVy51V0W2+slTdnwgRCkr2+oR3vrNlg9FCYPX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tBWGWRYY; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBWGWRYY"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b81a2d33f7so348506e87.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 16:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788997705; x=1789602505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8Y4b3ddmCAFwqmVgH5ZGdYAfFuI96RtEoGFK9BOGP0=;
        b=tBWGWRYYjJrE6BZxUBY1ZqCaDY8qPibbPSdnmZO8I695Qw+OxAbU4ITco3cGxJcgbM
         w5TgdA3xXk470bY1UDsinzI2yV9PB7UboB9p5e+Yv6qpH7Dfbwii8M64M3fKe+eJl2gH
         FO/7SMdpuZWEIodXA92XrEuE9P5QPMhQzS/GXm7B/79TnPfOG2hufsprcHEmhq2QnmNs
         CwmppdIeP44grH5v5gpKMu4I8pNDRKqJfmRqru+SVYFdRWtxjEzwDoKKBsPj0MLuvnOw
         qkQH2mTgMofQ+IYZLsd2IRtXwkeUIoUeDuVBzUhXqTlLKtXZVuK9AMeCDCoumPtYmNTs
         caCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788997705; x=1789602505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8Y4b3ddmCAFwqmVgH5ZGdYAfFuI96RtEoGFK9BOGP0=;
        b=BF8rr9ER9C+Qj+Wh+4EmnDcb3z5n/3XYtlW0dCBPwQIRJPM5BcbfobOTnUm2qGnZvD
         LDtd1AvslWVp98qix+wxwXe9xf2MqcOXkZXBibudpMOxXvZ8w0s845NeqLU8RbdZhg2o
         aanYxv4uPP8bDBgSwYtxJbX22N+MewLRgzhz6zT4mq6sG1dXLx9JRAaBgiqp8kJsTecy
         h4YURheCGXf0DwhUsH1bpFSynvCK4LQD4RRwPNYS0t1a8LXdaN2sF7nXp5fyIXbGSzUH
         T/Maem87iSTs9YMP1lzMDXtGXucLrYasWnodkSdCvn6L2SnijgEAAY1eKLO2wgeh8BNd
         /ezA==
X-Forwarded-Encrypted: i=1; AKwUvBywyg6dKIY59rO1feu1IkeI4aq+xbyKQSTRtq7Lpkbsw7CXZJERg18wrBbsPyB5HplfP6oVuJVh1w9W@vger.kernel.org
X-Gm-Message-State: AFuF++mqawLLZ9KdI0AlkbFyokTc4OTEl7sjkzTMXY0904dLagbdPsKz
	ZBakNBrbjx0dkt3DeYn6Nqig9QrfHiRBH+rUKWSAY2EFnhaErx1Q00hWs1kNyEE0
X-Gm-Gg: AYBFou2F6ldpxH/u27HTpdeqkbFqMV0CrUrZTwEKRueY0iXNNBfcwz04ea+NV0o2Asv
	qNDlagCdn5Nit1WuJcNuc0FTxJmZ1QU5E9av4HZCzIUbNdY8muqdJM91IKAnR5NkLXC3A+9AWEA
	1RLQNCeDtakEbjj2KO8eMzkUcoqJ6/GCOYlZQ6gLGRbQWPrLKOBMznf2kazbVvvzf7Zg7EU9nzl
	0W5FVGt6bxA/Y1vfe7TIu6TwnjOB1sp+EJLf5f1wfzYYvqeA7Pmdsn+yT0bRPH68J+x+mRaNZAm
	6WU6KSqu94rlk75zUMAI2ts1O35JelRXWbSTKp8+ZBeJvxDoZPz7uPjMhPMOaHWfKtYsXNQzVVP
	Xl3Qm1X9UQ6O0XczKxmPtIuJ14Uog6ZYVXwAZ4F7zu+JtuBG6ouogOvpBc71Qd8uNL2W8RaV4+1
	I4g3OLGy7vGAu//WZLUOhMtAoAP7jKA7vYjicQcqz+11qV50L2BBR2BzHDEYzW7fRxd8Q2Tr2Ct
	+ZOjKUzywRANCn35kAqnBDJrcQyMnqD6ED0WSLw
X-Received: by 2002:a05:6512:3b85:b0:5b6:1a7c:59cd with SMTP id 2adb3069b0e04-5b61a7c5a4fmr6010294e87.39.1788997704650;
        Wed, 09 Sep 2026 16:48:24 -0700 (PDT)
Received: from notebook ([93.189.200.242])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed4cesm4153300e87.26.2026.09.09.16.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:48:23 -0700 (PDT)
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: David Heidelberg <david@ixit.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"Andrew F . Davis" <afd@ti.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: power: supply: bq27xxx: add generic compatible
Date: Thu, 10 Sep 2026 02:47:42 +0300
Message-ID: <20260909234744.1177153-2-rinat.muhamedgaliev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909234744.1177153-1-rinat.muhamedgaliev@gmail.com>
References: <20260829205258.26955-1-rinat.muhamedgaliev@gmail.com>
 <20260909234744.1177153-1-rinat.muhamedgaliev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a generic compatible for I2C fuel gauges whose device type is
determined at probe time.

Signed-off-by: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
---
 Documentation/devicetree/bindings/power/supply/bq27xxx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
index bc05400..f2e0170 100644
--- a/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
+++ b/Documentation/devicetree/bindings/power/supply/bq27xxx.yaml
@@ -21,6 +21,7 @@ properties:
     enum:
       - ti,bq27200
       - ti,bq27210
+      - ti,bq27xxx
       - ti,bq27500 # deprecated, use revision specific property below
       - ti,bq27510 # deprecated, use revision specific property below
       - ti,bq27520 # deprecated, use revision specific property below
-- 
2.55.0

