Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793523484;
	b=AuUzjufZ7eqv3TV5AiQ8WyYNZWtWLznDIYZ3CAfVkjWhMpXmoc/gZfkmoivH+zz+TbiT
	 84vrNE4kuOQw5Gr1GfS0iCbvSXLF7lQ7uqKqUGRvZfepGkUEfjyd913if0/N4NMQNAHOF
	 KOlNesRa8H9K2Srxn2tDqGAcBOVe/PR3yvOeTcPOkkWGK8daxC7IhbNWGLyG7P3/1ZeCa
	 +z10VAWSdsSpt6ys8mAL2w+5quiFptfUW0AJwvJxeWYSADE1NhoXsVpAy7TJefvjBy6UO
	 pPs27+wZdinkBcYQg9RUcSPLNjAwsHwSv17r+ZJ141b3GHFx4UGVk+yu2EoSEqTRgUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793523484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yeNJ++BKL42aV+GwG+jG/kvKRnbuE3DMU/E3mLJtGyU=;
	b=gVYTp/NPiL7Tz0GFF5FWWg1iw3UHF0dQiQHdDU/tgJETXsvGz/RmH2zBf9nsvE2AG2xd
	 /BJX/RIz7JyuIVDGpbQVM0BD5kjRpJHRBvxXaJRY0KiZm86TliH81tPK+4BsjcaYOWg7k
	 7RtIwjToYsV7RsNNWYsTnE55JLxTa5irdficcSGGCmnT4sQRPnbaDsTUFm/tjDkgzKKeH
	 ZN3RtVOFhUxVQ85l3a0ZZq6UP8FDlIbMMip3Qgyij29v6xNzpuDgSTVHzMNrpb28ZDygA
	 KfpRtgAaQv4kg0HFh/NV/w32ltEIrmy1Ru1LP2LIFRhg/Gcmy0tHmst96doMEjZbx6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eRo00caE;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A914606A325
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 08:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A914606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eRo00caE
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so897421b3a.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793523484; x=1794128284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yeNJ++BKL42aV+GwG+jG/kvKRnbuE3DMU/E3mLJtGyU=;
        b=eRo00caEAA8rj6+l5Bu5Jc2g4+TFLr+qVTLLsEacL+VvWPq3nQT5uidI//kEG1X6AN
         ALB6N/Dejw5zTQMs3pC5Ep4mnepw+HIn3/C5/Ii9dMowT3XEQEKy5YOhMco6YZTRvEaD
         fuq4gRntGElfuwD0hPpOYZslqzwBj+tBnrMJjBz9KmGX0OhMtQtcxoywWe5Ib6VEKHJm
         wz2jMdkWM730MAAJgSAAkWLneDbWa1/Fr1KsYgA6HQNXfNZw8dCB5FuFZq2rivZBYhny
         OZGr7IG7ZknbEm1YWfwaq4l5NqBxAZUviaOcpC0YcmZj2Q4GLJ+IOleYWybme0w/e6Dr
         JKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793523484; x=1794128284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yeNJ++BKL42aV+GwG+jG/kvKRnbuE3DMU/E3mLJtGyU=;
        b=ZVs4zKem4JzpvFxbk7FoBRhoRNDFghDZtEW6zV1ydxhPZtZRi0Zp5biFzRk76YNjFB
         /ABCdA0pdAOID4JKDYichRWMVMRdlkZr/bg71halkuIoBoqHU/mHdmZ/dw8N1JWosmef
         0GAqiGVWvtP0K+nAEzO+jX4ComUf7WXkK508OEVcoqboIJs+pW8X1qIMOCa+PTFDLQ/J
         MKyjeRXi7uck9l62GVDOb+RiCdx6H0uespgvSvQtJRee/6Qfe3ps2x6ojzV9Q0J7Zr0G
         /p8PgaiiEUqYcK4CZcfZulVmqqFWFu5gnsMR0m5RW8KkPP3xxTsCiOAhJgXgPV58QhjN
         P8rw==
X-Forwarded-Encrypted: i=1; AKwUvByFIQRTwPeLsBarOnCNVReTYn3dj2HkLS99PR2LCkc9Kp3JPzZCrXn04tFGVkhsBDAmC2qz5pyEtkYk@vger.kernel.org
X-Gm-Message-State: APuU4Z8oVDAsHgVBy1YDf6jkLCJbkfZLaiR2/BSAGuT6hYmmMq+NXMvr
	W/kCjrAcQ/csmNjuFaDs3rbeLt06roBKfswvCsR7nXTCbp1ALM+FreuFMorWXw==
X-Gm-Gg: AYBFou0YkvE/jrFt/c4TCSRGPmKO8g00xIIroTbA9Q7HuYjN7uCNMTpl5e4XJixGULD
	kEj7SR/1+B0OJVYzlK5rLX1IYLs1KUWHCbVENCOD8zhhJmQ+1dWNRVgtqXidmx5m5rwFfv62c3q
	ixRqLt3bA1SVT9jnFoQrai+adX1aJx+PUGEgmdX4lORYtiffH/Wa6KqPFlEm56YG0Rl4j6x61qM
	7ujdT/2adjp0GnJuTdnFPO+vpQeg6IjjYkdJRU/SLdZUNJDf1FSiF9Bncq7oaQFA4csPXiaPtJ0
	9cDtYdY6m1wLoArdExyN1YjKTcQk46Y8dekLx9oAKMfNwuGWwnI3A6t/f20d6nhrAjgIWp/GAoK
	uDK3rb1JysOt3GRLaoqTz22icgsUT/Z8bp141B6ACradztizFDeobNNKKT0BLlK8Rxy3vFy7l3c
	193jGlQPWyIPTaLrg4jx7+O8irrNe6BDtQvmK7WsPT0gH+ANwYG83fEG/lUeWdsfZ833DqVzv27
	Clz7zeaGsBlztY/1mxnp2hNaCq3rwi0+qS9Bjy9jmO1UxFqMyg2oWY/nXWns/F8Qj8eJJq7WL1X
	xH/chpb44KtiXqm6JmLzgQ013ooBpm9BkYXaqvnn4kq4wF5QrspjDeSk5SLYUYP+
X-Received: by 2002:a17:90b:3e89:b0:3a7:9045:fe29 with SMTP id 98e67ed59e1d1-3ae895362e9mr5921922a91.4.1793523483673;
        Sun, 01 Nov 2026 01:58:03 -0700 (PDT)
Received: from arch.localdomain (123202092027.ctinets.com. [123.202.92.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm14385693a91.0.2026.11.01.01.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:58:02 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: bq25703a: fix input current limit default
Date: Sun,  1 Nov 2026 16:57:52 +0800
Message-ID: <20261101085754.277830-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Section 8.6.6.1 "Input Current Registers" of the BQ25703A datasheet
states that "The default current limit is 3.3 A", while the binding
documents 3.25 A.

Use the documented value.  It also matches BQ25703_IINDPM_DEFAULT_UA,
which the driver falls back to when input-current-limit-microamp is
absent, so the binding and the driver now agree.

Fixes: 76bc2203a46e ("dt-bindings: mfd: ti,bq25703a: Add TI BQ25703A Charger")
Link: https://www.ti.com/lit/ds/symlink/bq25703a.pdf
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
index 3bc07f25d063..607873e270b4 100644
--- a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
@@ -88,7 +88,7 @@ allOf:
         input-current-limit-microamp:
           minimum: 50000
           maximum: 6400000
-          default: 3250000
+          default: 3300000
         regulators:
           properties:
             vbus:
-- 
2.56.0

