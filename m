Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C087E2DECC2
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 06:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045691; cv=none; b=IILpkvujGEeqqk8Mck3zoeT6QUZ5tRwlQG+m93mOCC/ARx5J/43z3WKT529YE8Ek7B3CUeftJARYKxPdmfKg8196Cw5J+c/pihAYKBTOdE46X91C7roT/9btVm3BAZLVxeSb7UgtvPddVYKND6XmIEXVYoq4NHLeeUb5gXOXwWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045691; c=relaxed/simple;
	bh=wpoHJNDsJrOy9u6MzafP3779iN2w4wLzlIqwywGmC5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KOhkm/2ulg93x3GId47+gI/m8yinCbvbxrWHNmQ55WLNEwqi4VQvDq6n+F8fW2tSnVAKBtmaBHVtQpChyY6ErHc557e9PCYdengu3KskOTcNlbdrbi3sB0rGPctLpy1IzOOyfo8aSpCSv4UNZf3eS/odvBC3EtIcsZ/qqsmEjzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPHNt/R0; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPHNt/R0"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso1830433a91.2
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 23:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785045689; x=1785650489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRQwbuO/f3HmDYUx7xPRQ1/PI6AspXYS3UhriY9vqQw=;
        b=iPHNt/R0sJ539DSE9jpYBzfMySjpS8eEY6TDHShnqbvcoy5oiH/sn5IcSMxGWeQFbu
         /3wtcuFmUI0noFrNn9wPF5a4utjtzpR8PuXb32ZKrWYbX9AOlkfi/vV+kuf3YhEYO2IP
         ejAC3oivG+Jupa27XsgUplLqBMKvpydvCIb3PB5/NanwLzGfLoUElpHlYKuiRrvkFRP7
         q6JeLDDNPjbHbVyLV4gYsfHoxuxRkA73AIZtw6TEnOENPkn1wOwQT/zeJBJ8eJBzBb9M
         5uNhy9qyHb6j2lGboSH18srdseLiR3T6hpC+UK7GNyvkgWMA76w2uXpu+7wfUKcMkPXO
         h8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045689; x=1785650489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRQwbuO/f3HmDYUx7xPRQ1/PI6AspXYS3UhriY9vqQw=;
        b=VqjpgLJ3HLbNLQSU3XV+e0c22eH4yf1NQxWxIE39BDr5FIsf/EzQKMD2YIfIuV/zuw
         Huv2+n9fhjo/3+dYC5nzolgO/IioE+I7RCjoQuptQ3nDZgGjpzKf07WWOcF4EREM3dWO
         bmdZNnI2MrzbRAV44mW4PxjPMVmZx/OYOtrmjL+3OAIeeieTmLybEa/pg3RWyCiBRrZC
         Ah2bUjXhmsSPaw7Cay3PHBL3ig2MS6YPY8/3oW6cFsC2rWqS3ayZNRhc0LGwhI8b3z65
         NLble769DGpXHn9mJwhzoYi6sf8+Fg8icG3OGzNsYgoDSoEjUs816cGsNuwo7Dv4+kPr
         avdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIh67Csy9o++zzIPo6DJgU6ioM0NhfvNdrTNgxWpuKkxw7FsWgFZA1s5nIBTAr1P3qAK/elp0N+OYc@vger.kernel.org
X-Gm-Message-State: AOJu0YwZo7TN02D9GQgSEsbqGVCT0lJr/WuNowgdSW9rYgr3vQO6NCbT
	fNfFe1ZwK7SSOikF2pZ4patUGj9bpDAXwL1tZuzRcefETTCtmVPaMQgF
X-Gm-Gg: AR+sD10Yp+Sudp5koez8j3rIn7WjG3W3AvlbAGghSqNco7K6fQfpFo3nnD4tkLmHOW4
	7ChulMCJIQZwc7Rhn8ZZIYHGUhIRVvKKJ9OykjwJYTy6Om4Ge+OY7nGLspcQiKDuv4fN7mZSwY4
	8GHf9UKDYkHK97oPBVp14Pozm7MAoPl4sFVwwbxZ8rXbvCGlB3701t/9LXu4/f7wvcfDkGWJtm/
	koU+5hagYqpBc0NN6ZllGEc86Gb0K7ocEk4+1AJ73TJMb3nVcLRI+lBU7bWJmhGMsQIylEwdXYI
	WJEWi06n1Rtx+kPXApFq06Lz4MiWjXeReUVRQZsfgZseNNkC9jRd79Lg+YeWIbDK+cdJTUr4fiM
	Y4sJVFIqrbJvfUk1DC+UjqzxmZdYCKoUj4nhUOasVeGhiNgF+mz111Mi+90jl4QfCD5sVt8hpSu
	ouEGzOpMUW6w+Z31TZ5hrqoZchIeh7KgQ=
X-Received: by 2002:a17:90b:2ccf:b0:387:df8f:1409 with SMTP id 98e67ed59e1d1-38f2988462emr3683443a91.42.1785045688954;
        Sat, 25 Jul 2026 23:01:28 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f05805fb2sm2305002a91.1.2026.07.25.23.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 23:01:28 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Corey Minyard <corey@minyard.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ninad Palsule <ninad@linux.ibm.com>
Cc: openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: ipmi: ipmb-dev: fix 'provices' spelling
Date: Sun, 26 Jul 2026 11:31:18 +0530
Message-ID: <20260726060118.18611-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling error reported by codespell: provices -> provides.
No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml b/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
index 8b0d71901195..bbef878a7429 100644
--- a/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
+++ b/Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
@@ -12,7 +12,7 @@ description: |
   requests to intelligent controllers like Satellite Management Controller(MC)
   devices via IPMB and the device sends responses back to the BMC.
   This device uses an I2C slave device to send and receive IPMB messages,
-  either on a BMC or other MC. A miscellaneous device provices a user space
+  either on a BMC or other MC. A miscellaneous device provides a user space
   program to communicate with the kernel and the backend device. Some IPMB
   devices only support the I2C protocol and not the SMB protocol.
 
-- 
2.43.0

