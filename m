Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795838112;
	b=I2b2sCMha7yFJB76fLRy6sSm5Vl3Y/elTfwTh3cwVq6SF2877wHQqQUn8uSOSJf9xn9c
	 yps54UOci51Ld5x2UtFZ+AzXRb6r1La+UB5W4snwVp6bT8TFv9fMmM3pFp4USTDS+oVaD
	 Yu3P5ALOAK/MZOpruabqqXilxHzSjGTxT4y/t0xz7Udqx9fLvg5Kp0AqYPMZkULazotyG
	 Lv5yfUlcwTBtdTzQFLRqqVv51X36eYfE5HdT3NL02bxoezXIbMXLVemANG0fV5KhBRC5L
	 xm3m/ft/PAPl3jA6xGkN+2S6/w+0D6UUVx1xRej0afoPQO9IM0sQ06l24A3yHvAiJMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795838112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Qr/RK+Rq5dWLkIxZAbRco5wc0OP6SbAvwmR36bqd9dM=;
	b=OQwxq/xuUxilH4d4rFGrTc2hST7nWKzwhrysFXLPeJxHn4AgAYqnUre+EyNa1zPNG9/t
	 qCVV3o0ypi7/Lth0zPbZHRPC/9y0cj5KJIkJAAYXEmyMTZrHGfBn6O1w0+7ahhtd/v2mD
	 Z8wuUVnmZxPBy265NnmI3aF5pU8lydQjQ+Me6jPhdowu3gkBreuqGAErCz7amZ8zB0yCa
	 s2q4JIpyyRp4SPP1UR/QEmhHRIl6tbeggEY79xrY1QZEKNAI/HdThFxFVLYguZajwqWlq
	 mHxXo+prTqX8rcfOW6hVW6NlFHQjR8m4JRj070qYnPwz5UdPMbh11HP11T9tDtd1RmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7j3vrxs;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E34606A31F
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 03:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64E34606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z7j3vrxs
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f03f3631b2so44367345ad.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 19:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795838112; x=1796442912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qr/RK+Rq5dWLkIxZAbRco5wc0OP6SbAvwmR36bqd9dM=;
        b=z7j3vrxsNuPQj48IJ4rQ8s7GhmpumDt/H6mPKRhZJCe2I0Ak+/1kQ7jTwjex+HRHiN
         omPje4CSLBu5YDqsW+LZ2r4z5OyAHcuJiGbwRIu5yrI++kVdBL9zCFL7O3+UdYsPfmIO
         LNufeNzboi9WdCytY57ZNu8oUAgb0+9DpOFES6l2pJRvtvOjC6Yf6jlXjxN7Y0FmJoAY
         afRG8gBCIBlcWbVYPYrTJzcqXg3ki6o8kHD+kdW6q4p/LI/mY85wyJ4YkjZP/xEjTA1d
         ks9sYVmHiB91s6uuY7txQBX0rx3fHznmIjRnn6bOO1WI8MVM8c2Xl3TrlBihM1PNJQtn
         KAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795838112; x=1796442912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qr/RK+Rq5dWLkIxZAbRco5wc0OP6SbAvwmR36bqd9dM=;
        b=0zSOPEgh7q+PrZ7jBqAPeKhCChxVC8iVgW7wnLx/OVAqtACW8rkXfpTTE7gm043BPu
         vfbmG3Q46PvwH2XE44JHrHcUUizjvOj93TpN0l3E7D6ymA0jRLg4mqir4MRQKQayPf6m
         RNFMf5PkX1SyJK/TZQ0qbVdfGzDrcRhwKyS9/xSN8UfiTt6DOXHr4LX7I+Sj73tm5m7s
         LN8JEYAqcsDXGoY3bSDVJDI8rDiNWA3HuUzo3pPZ/032u09FXQcmfi4L2EDQa/A+nvFm
         cym3QXmGInlfK3GinjU7QrdGhJK3Mzb4A2eLSBjFddXEj3wP6Qwtkjj7TrY2QWortzRD
         XCoQ==
X-Forwarded-Encrypted: i=1; AL+hErFZsmvJZ0QZCdIDQtiSZ/zzI1zZ1VZDuAEpOaI2+CWEZRFwIBqcudKfzyQGXi5CxL4Rbf4G0tm8C9P7@vger.kernel.org
X-Gm-Message-State: APuU4Z/t/epT2SW6VX1/penpaDnGRSkD6Cy6dTiq6J8cLsjF+HsnueTw
	wJU+K7cGRJJ7L5hoW7xrzKPNTKQZYCHDccijfTqkM9jZIb+vZsyDCh+y
X-Gm-Gg: AZFdTZeYn3j+No5ONzTT13eHWkxcN88WDavtopZQWAscEE/rBbY6+qADKySYx1qoIIN
	WBGzKQycbS5x/Kf0lhUpFRDtV8ePoCLQjiiMfAxvNqNMX2yPiCaHbX7oYmkk9NUu1ESHH/0woKP
	2x2tKztgURSRPgxgAsHCoTbh2ckwKZ87XogWdN3jbKLqMj7NqjV+JNXW8CdoS+FSfddGhnyMlRV
	qh79CpoWseKkC/yAFMnP4CdwbvbtYRcgLt2jEUwQGYs7mrFJH7YBmqaVhvPLNXOC6MsBLheSO5S
	pTDY6OvLUOSuyv3GMXAM6ZlnucUk8Kxd2eHQQQMoyPGe2V2LlWhIBHRxrx6pUbsgVDtCjwcdv5h
	qr6UdEskgKYLJPU6n58+VsedPmUw9oSpKfbBI8oVU7FwfIaPFcF31f4YfI7eBTIrT2A6QzTk8aK
	+lrzoiaGfPdUiCrsrZADLCcIAXn/569NUgSStk6V8bRkdDsgvpT+Il6GbmpurfhEQbjHs+/6kv2
	QEvDfazlwT0zBmHjttBIA+frdV1TD5s3BD86kJCYsLh9XgFatg4jcsY/F7Hpo8/IF0h1yjYtNP3
	RySwtipe3F1AY29uFiGLFGQLIpY=
X-Received: by 2002:a17:903:41cd:b0:2ed:5548:2989 with SMTP id d9443c01a7336-2f03f20115cmr222838275ad.30.1795838111725;
        Fri, 27 Nov 2026 19:55:11 -0800 (PST)
Received: from debian.. ([192.227.246.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm89190595ad.37.2026.11.27.19.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:55:10 -0800 (PST)
From: Harry Bit <idleassetsd@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Baozi <chenbaozi@phytium.com.cn>,
	Harry Bit <idleassetsd@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add phytium
Date: Sat, 28 Nov 2026 11:55:02 +0800
Message-ID: <20261128035504.760778-1-idleassetsd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Chen Baozi <chenbaozi@phytium.com.cn>

Add the vendor prefix for Phytium Technology Co., Ltd.

Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
Co-developed-by: Harry Bit <idleassetsd@gmail.com>
Signed-off-by: Harry Bit <idleassetsd@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93..374568acb2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1331,6 +1331,8 @@ patternProperties:
     description: Phontech
   "^phytec,.*":
     description: PHYTEC Messtechnik GmbH
+  "^phytium,.*":
+    description: Phytium Technology Co., Ltd.
   "^picochip,.*":
     description: Picochip Ltd
   "^pine64,.*":
-- 
2.47.3
