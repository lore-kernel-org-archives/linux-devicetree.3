Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545403B5319
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 07:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779780217; cv=none; b=LVuudDXzkYrVOrHs5z5BqQS0hWRiIltino+89zqUEitOkE+fmbF5ybKQN3xO6PCWxVjSiWP/zq0JCZI6SjFjJOHFTPzU21RXko0f8+dQOQxVNNHZi3QY3g9PKsolpJpHRRIf6gA7HBNHEXbMtTy5B2TdfDIW/4XEjke6Yjd8tpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779780217; c=relaxed/simple;
	bh=AcRMVTLXj/mukKWgGjOXcht9MzRyV0pMqnBZFRrSKFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MIBcH8D/803w16Xl3i+z0unryGuQf3biw5an7YaUXhTKGXifV1jsfxRZb4GbmAfzN4OcGZ7o4JjYewWs6iDMav3PhYStOdZXV+1Se/i/M/VBdtww+eWAFsAGQ0HrgypAZ1/KlJFnoyWEcRRcFm44QvNHeBMFpAaSTsHyA7UdHnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=khK44me7; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="khK44me7"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b9ea536877so67053345ad.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 00:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1779780216; x=1780385016; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kaTzZIrRiwO1RCeM2bN6zyMtDl6KOzXc9TYKEU25JF4=;
        b=khK44me7fF8tTHa2d2k45DBategxv4BVaRklv4DX8mRUc6cIHvG6S1nk9oOoGaizuI
         6PlYT7DiSCcFb9AR8Kah0P4ALYYRbtYk9CRX/hHaFolcSRCwNbz2GH9El4HE7bidy8A1
         KCtKWXXzu9ZKl8453tXPA4wqpRB3ernzih4q6ikaLUxu/S4VbYecylf65VMtARUqwc5J
         wq4eHKbF6xEhV/r2jWdhjckR32Dgs1OXWxBvOgN00pfyCPERuqD59V2GzovgcCsPrmBI
         pvFxrPlWgS2IRjbmlW6oKKWWV3QGE9DEusN3h6oAn1JUujPEGrNq767UoFZ51GtVSUB1
         r7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779780216; x=1780385016;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaTzZIrRiwO1RCeM2bN6zyMtDl6KOzXc9TYKEU25JF4=;
        b=EJT9aWbkMORx97nh6yaCwN3Aw7odcAFj03SQwYpqkaqmug2bLEwOS/agX9b4ThkYG6
         yG59bcvGEX4L5f3h4JuoNreGLs+4f8wcfz81Zto+6DpZQSoXBNuSKj0JfOTXRYU9Hr7h
         NAkKoC6qZ9TUzzg7ev367wXQYq6yPbKetDGl/12IqIKnaTQsAz5VpQXk9bldCXDItSFV
         x/GhJpDkzcF3P/Fdfofm+yZKl8TecT2dd4ogDqIDaG0Su5191PSBJI6c3193uRVPUsMq
         qLl2IIjk2ex3KMBVTLvjgMIvdBrg5nGK3xWslUoJofC1UkUydqi1PyQ6CczU6BTLgP8g
         GhXA==
X-Gm-Message-State: AOJu0YzXgTEqez8iInmDnrCgDRbgmOsxz/wQiOmSefKfiBldpbNLu0wz
	3EGYCO2NpZQ7nnD1HRxdgk94ZhiWhHTh6ktbEql1aRlShHSKJqP731FsH063uDG9urk=
X-Gm-Gg: Acq92OHNZPsc1+tt/4v5jwJizAVR6HW/40Sch75IdWAzNwh1kQzU8yn0GOaiJUc5oGi
	VuvjO5LlsP2q0o/4xteb+fFBprgHWaUzJ8yS54f5G5vJDbdnjePmle3Flc6iT/NLw+m7VB1eAdR
	TV/7lzRidni/+m/UXc71dsASaejpjYQs6CTvWMsXzEcXl0/IxU1TKiQrlGue16XY7L/zOah0Ifo
	NQMjZm6+4wEMLgWOjhYRn04ZU8S+cAIf7pEFV6FrGvnidLF+P2ZWBGjBJmEG6v7+4CIOwoedqdb
	OFzglTDZudJERAUcXmsQbd/Kiydc8FDQ0S/qpchuqkoyiVx1wV/nX3+4y/TSvLckREh3aZvpvr+
	8uXyLPQi6GhxTl5ROygTQWLtpVAo0pvS7r0bmL1WMRAp5oGg2k423PaNlC0d03jW8hlP3xJxR+A
	X/xg9EEF3CcCBBB0uxdWbPnwXTHENxcw5bYqmsttxgFK8=
X-Received: by 2002:a17:903:1a0d:b0:2b0:91e6:bc18 with SMTP id d9443c01a7336-2beb0878549mr150966255ad.14.1779780215657;
        Tue, 26 May 2026 00:23:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm148893365ad.83.2026.05.26.00.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:23:35 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 26 May 2026 15:22:58 -0400
Subject: [PATCH] riscv: dts: spacemit: k3: Add Ziccrse extension for X100
 cores
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-k3-ziccrse-v1-1-c759792ca3a3@riscstar.com>
X-B4-Tracking: v=1; b=H4sIABHzFWoC/yWMQQrCMBAAvxL27EK6KYr9ivSQJqsu0lQ3qRRL/
 25ojzMws0JmFc7QmRWUv5JlShWak4Hw9OnBKLEykKWzJXvBl8OfhKCZcXBMsY2t8xygBm/luyz
 77NYfrPyZ67McEgZfszCNo5TOJF4K7t+GrtBv2x/hkXa4jQAAAA==
X-Change-ID: 20260207-k3-ziccrse-b3e2d4d43aec
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Guodong Xu <docularxu@outlook.com>, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1

Add the Ziccrse ISA extension to all eight X100 cores. Ziccrse
provides a forward progress guarantee on LR/SC sequences in main
memory regions with cacheability and coherence PMAs.

The SpacemiT X100 core supports it per the SpacemiT K3 hardware
specification.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index d4be8de8fc6cc..ccb483b439c5f 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -36,7 +36,7 @@ cpu_0: cpu@0 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -77,7 +77,7 @@ cpu_1: cpu@1 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -118,7 +118,7 @@ cpu_2: cpu@2 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -159,7 +159,7 @@ cpu_3: cpu@3 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -200,7 +200,7 @@ cpu_4: cpu@4 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -241,7 +241,7 @@ cpu_5: cpu@5 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -282,7 +282,7 @@ cpu_6: cpu@6 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
@@ -323,7 +323,7 @@ cpu_7: cpu@7 {
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
 					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "zicntr",
+					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
 					       "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",

---
base-commit: 5d67b1f204472df70f7c7189c01fa405f3ccb503
change-id: 20260207-k3-ziccrse-b3e2d4d43aec

Best regards,
--  
Guodong Xu <guodong@riscstar.com>

