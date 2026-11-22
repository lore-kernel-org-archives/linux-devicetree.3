Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340045;
	b=V+2PF7KQwfq2a0nSaFzMKDOzq2pJMHCMe3X/w7nISznWcGoNMpJQp8RGQ9htxs4ci4Op
	 NBSWtuTiKUaPrmx6qYVyg/h5rodFMRVk9/cQKbVTBH7l1zgbjtOo5e3TlHd5+3CkiW/Xf
	 Xw22bmmSOZ5MQnFQDvPulM47q7vty1bflSp7V7ojVLyWj+5i/aWbCaDBIzbdeo4Ex47NS
	 im3CxOcO6o9+k3c6fcGE0f4qhAmhCTRsQoX8Oe4xNFTNoAklpC/5jMsXzTbnlEIVD/SA+
	 fZY1eRIvIL+KjLOwklHx5zhCa1z+sBHk+UGBsaQ9LqiSYDsV/r4+hddF1NFOmpgbTbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZgFjP6gbVoWf0N5HJMqz+f82IMBu0iSQOg21x6h2nUQ=;
	b=5Rdg+V0E6c2vgxAsrGQuXy/LR+BXFVAuiTh31tS1vcqNX6swBTKY3RVHEGf62tncIx4j
	 RRvL6//jkwMX5B9TC3ZKb8y2ZeJpj3FF03ZBRORkz/pRXNj6yeeYlTYiOeOyprKCeR++f
	 frE3x9zHVtqGDgEF/vMeTmoLDejy4manpBGpYKNShn7W6YxASRadyqxpJvNSwNPYh1pUe
	 4C9E6/buVUWIsQlQcDL+0jD+8zMbG0j7Px4N+Yi/TnZUwGz7ciXzSMxQJj3xeUGkNFd8v
	 f8eo2diCuN59BVfNZ/zQNeaPDe2XevSQwflD+R0LViMnGQKEpYcqBy3Jr9hGpOJoRbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MIfG8UvC;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B723A606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B723A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=MIfG8UvC
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso17339805e9.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795340043; x=1795944843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgFjP6gbVoWf0N5HJMqz+f82IMBu0iSQOg21x6h2nUQ=;
        b=MIfG8UvCcPxdYRirFtzogcdj1fHf7xp1wSbV6bWIvEDU7IPlMbM3zTZFjyypuQMSKs
         PD9kbGK+w3w5Tq/y+7ZZix20lL8wHJoaAYnlD030QoavljJYEZh9ciQBbt6LPXd3gaeN
         nHzO1t5imZ5wPwuU7eE49GSxGsrNnlfT9zai0jfX9iH43pF2V6OUcdSwaVfiLsNyuocr
         4p2jKNvln9yUwOLsaRRm04xC+6V3AfewnIWHJJzFueJymAMcFkuqEgDmdynrUqsx/emu
         ZvNL0YS7VwrFomoFJheWvWuEo9aa+JUBuC7/tG9pdMEtE5dFrZcwychWojkm4IMuC1Lq
         w+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795340043; x=1795944843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZgFjP6gbVoWf0N5HJMqz+f82IMBu0iSQOg21x6h2nUQ=;
        b=C5ZH7XJfq53/WNEYNEGl55pTxMH0dryN4VRJS7QZhqfp0Cq1Pc/wZH5bWUMdTyH7lI
         YqLumTtTMMH/q2lKn+HWNFqxzPxN15QTtT0fs8se4srea8YV/Cj+rOK2AfXwuKCZv6Cm
         P0Ys4dLepB5/VNuJR5Ruij3iZCE92B76qkvxYdOwWSsjyx4zI1SK5jepzAwk7B8y9FKE
         3m5xTjHbLQcqLnwAwstI1bBmN6kvfK/LDXxy3bSmXDbfbEZgtg+2lyZ6/ittke/zpJZz
         GwkgoFNiiG1gVbTvzddTBo31aXKOXL9D1Q7He7P/5Qfu8dfToTs4HakBOAtzAxq3TkXU
         tHgQ==
X-Gm-Message-State: APuU4Z9MscLWKULfC19pbtwSJjceA2agqKDLmtG0ZajWD/iaInf8vJM3
	OK+Eb5q+5rSHlZyOwCfy7Ni9cVeGov6IZO0Az1mCQsdqbG6yAvODFnmSs0M/2QT0E+E=
X-Gm-Gg: AZFdTZcSn3TwNaKIFlcKIEG8HZRWqADZJUS0FV5IjylVoGDm2ESSkSZwOCG5CeNXINb
	EMsOKynN5FL4KHeZkm6nx/n3ZESPz6c3f0sI/LxoRSGUGKf3oGFVg2lcEuhUnd/zWDGk9n3C+vW
	FK4NpkXVf35BkezwON0f1b6d74Rpd9HJVRfZauett4XpuPEq+OvoqVw9gNjpBc/HQLKfXozTYb6
	BCnl3fpiGdb5KEMZN5NAWPXLbpw0J9EDW6SO/3ND5HI/H4WtNNGcsKVkZd+dodrYAPyDoi4Pzer
	bDVgbLN3w7Kf1aLwjoq1dlKKTPa3Muhk65p52puvFO2R2HEpcGtOfnlCfBP8G5NL1ecD1Q9Lnpw
	34cdTwlsxvQYzr2iy4pNL/PGE1BVvsa+4anGef1GgSL37Go+bXT4oWeAn6bKSOOj+0IhN6y124v
	hIZdvzd5GshPrIyTr7iiTyVWNzDkLfr9ZYtMuTQwt7Avvoyz9ao5KBepFvv0ifh9eeYIR17y76d
	rvvFqQagt+CqhUJOdiyaj2E4byyMxFIZGB+Kf9/vTC5ucVJXDvkNkV1DArdXPaM4VEqce7JNefs
	tYR198lznkFnXtWAwO+BMm0/CxXkkDVMhfaLT85uMIZ0L7yCKCPSVjta2cVwjfj5+Uum0olNAap
	hzKFp6BzKsjE=
X-Received: by 2002:a05:600c:a08e:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb887c3afamr196029325e9.3.1795340042827;
        Sun, 22 Nov 2026 01:34:02 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm16972915f8f.11.2026.11.22.01.34.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 01:34:02 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: arm: cpus: Add Arm China STAR-MC1
Date: Sun, 22 Nov 2026 10:33:59 +0100
Message-ID: <20261122093359.69352-3-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261122093359.69352-1-gerard@teslabs.com>
References: <20261122093359.69352-1-gerard@teslabs.com>
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

Document the compatible of the Arm China STAR-MC1 core, an Armv8-M
Mainline core compatible with the Cortex-M33.

These schemas are now used by PebbleOS, which runs on the SiFli SF32LB52
and SF32LB57 SoCs, built around STAR-MC1 cores.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---

Notes:
    Checked with dtschema 2026.9: the steps of dt_binding_check run by hand (host make too old), yamllint and dt-check-style --mode=strict.

 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index da12be7f5119..75e79aa49ab7 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -190,6 +190,7 @@ properties:
           - arm,neoverse-v3
           - arm,neoverse-v3ae
           - arm,rainier
+          - armchina,star-mc1
           - brcm,brahma-b15
           - brcm,brahma-b53
           - brcm,vulcan
-- 
2.45.2

