Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F2A34404B
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045538; cv=none; b=gBaBuQG7atKCjQZxdpO1W+k1QmydG9pGAjxsiGr3xDpgZawXucSieGzjMz8ABB/xNmInBesDXi0I9brQEsQ8OOx8bpHdK9r/ferR0k9VnZnOSTLxjbwFcBzCLY0mMYGJaM0cx6+p1YBL8ArnTR7x1Uxp0I/H31rrW8LzKd8kYdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045538; c=relaxed/simple;
	bh=VxOAHrZpJpurQtSM2Pjmpid8aHBuNuE6GONcMEEhS7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ek4WeiosNwIeVFvnE2V3idbkPkBJDCjpgZ1/PW6zf7YjldeCAM+6ZL3zQr8CeophetfX+MC4VYL8VZLcftoj5uv6LTXfx+6NtzVrXfnE724qp9oq3pASWAYDU3nSuTVTmb3M6pr0bS+kATWUyKAoNvE41s//xGqq5A76dpKprow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLrGu0nS; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLrGu0nS"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84e27035206so1628760b3a.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 22:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785045537; x=1785650337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FkWxhPec2UIUBbIiwFcw7jNj3vgcWuDHoDJujK6mWUA=;
        b=HLrGu0nSuFlPFynYKY9XEE82LT2EpbgL2Xal7K+dpxi9PdTZwG1O9SJ2vhzH4Ym0PU
         FQV5Of5Af6/WK5GlfzjabfSPaQiWe8psN8yR5uCGm/W07yUVYRJ93WQV3G8X+DIfPyml
         ToDGLUPYwe1UoO1s/HCnWckNlSPMAVgRF9GTRBm2X8z0nfMXKBR/d1vwyPh8ccI3Ywes
         WGBMUiuhCFDpTyehES7VVJbxBTn9MKv4akLhTPSfSgG57yEbWq+UUAmX51Aw3Q60zkOq
         Kt4mCA+iZeWQZB8OVSW9m8BqfyOw8nY2JZMI/le3Yd/4cYKYkkK3ooHXol2rnqK+WgYK
         02FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045537; x=1785650337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FkWxhPec2UIUBbIiwFcw7jNj3vgcWuDHoDJujK6mWUA=;
        b=c1nNFuN6aRFpLcMwSbt6a3UK8PDVpdBH0M2DtdzLk45ILolRO05vlQRdw40tAaVlr6
         Ntuu7u/zsfnWDBWxHt9XXkPBeLuT4UC+t7wJ9V+wTk+2fT/Jce/DOkvADamJLUj7/Z/n
         KXwvB6osD50t6e6PqaKvjGMPWFtA6xLCZnQxIwU4zi0JylYKbmoL0iKWjptWo/x9BHFc
         FwmmuE78E8ihgLUFgI0x5IHnzL/BskMjCjXOVltlAMN5+Fz1sVBUoIxcKZhG04EbD7xL
         AphHqf7JfgqB1x67ahMe59qEneRhHP96anFLa5vKxhCC3wSihrGEYUZNlJpRFWnMD+5f
         0XPA==
X-Forwarded-Encrypted: i=1; AHgh+RqFb9gOqMjV1HtZ1wcKBiZ/VIfKdakvurMoze67Yo4BrKG9n8QNAf0edt3yQ0/tVmsiQBjkD7KtwKgC@vger.kernel.org
X-Gm-Message-State: AOJu0YxB4saHf9DpzLXUaKiSGWluVERcYeiXj2SCRdqQ80tK8RTa6NxI
	FUwPGuMyCH+8NUchPPVBo7K4qJguHFzqfJLZoIQVjalRntaT0vrpIerv
X-Gm-Gg: AR+sD106dXwkUyc3nOJBs/AzqX1pX+7rPAtX7L4ZtA5fJoZLB+D23ny2a6PXAzvvREP
	pgKwgYM4mU6mj5gzXH55nbZF74a4IOvpeTeAE2rBP3DojvKL1a8qVIL0dMUfUjugTpME+ZW+NNK
	lDq7JX1YKZbTAfCSoDR1fTk4hq3r3aeRlD2GPQYcWSCK2dfoN35CM0hNXLoP6a6BW3cQQzISRCJ
	SCjJ5ZR/Nn1xUx81dvPtPsdvKGOU1dgQGT1plOikPh6Q6psegn2xnbfQldp8Bynwc2C/89NYHGD
	OM1x9w3zBS6A96pJpA2QfHFSem/DkiQJObRkKxqK/SpArnWD0W+hfAvjCY85LaW52jbaKNPJV7P
	57lyz7IbguqQM2OJZq2nG7/sVPXp01UX4o4iTK+QBIV/DIf/MCA+ii/bJbHrrAVH3XIVT3Bs5SR
	3ymrgpXG9GQW1Wab30lnP4irvj2er4c4I89sbidfz04w==
X-Received: by 2002:a05:6a00:2e1e:b0:848:2f84:732 with SMTP id d2e1a72fcca58-84e5959438amr3266918b3a.69.1785045536715;
        Sat, 25 Jul 2026 22:58:56 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344dd4esm1603772b3a.54.2026.07.25.22.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:58:56 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jaswinder.singh@linaro.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: maxim,max3420-udc: fix 'provices' spelling
Date: Sun, 26 Jul 2026 11:28:46 +0530
Message-ID: <20260726055846.18444-1-shaikhkamal2012@gmail.com>
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
 Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml b/Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml
index 6edb1fc5044e..25bce48f01b1 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max3420-udc.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Jassi Brar <jaswinder.singh@linaro.org>
 
 description: |
-  The controller provices USB2.0 compliant FullSpeed peripheral
+  The controller provides USB2.0 compliant FullSpeed peripheral
   implementation over the SPI interface.
 
   Specifications about the part can be found at:
-- 
2.43.0

