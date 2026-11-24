Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483725;
	b=NQAhVKVRvhALO9st+yeNSDQA/sDmpsbZdfF296ZUovYKYZCQWhGZprid83YhxRfpGs4K
	 Vw4UfrA9kjk5IODVjZ4qhL3KDwxi0QKY4qLqe+XYsqPP0FWJLhKJ9HzSCzkFNtvNIWKGQ
	 8hkCwV/Jq/OF1/EpbmanR5/Uv+ZZ85G3/Dlzcu7eZWdnz9vHxMSA46XlE7tSqgWdeaMyy
	 opPqEpFMu08BS3mD0dA30lERb+Rxlt/p+00NrJCb8dd6+y0rR+OmSgVKuVFFcVCl8N9Ta
	 fjhR/QG8o13iKboncawEJNwxPg312S4LdCrrWLVSZHiuKZvnveQQxHO1g+SVRcexALQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1w/HFhKVIFry3YZ4gWPmqGE+Lmzlg0zffNXSei6jGjE=;
	b=pVTDayFEryuu3PQvWM0QkC/27Om/D//1jE7WF0SUx+JFIri+YllSkmQvWQqRrxadjZjx
	 jNmTUl+lsLE/oETi9hEieh7kAuItfGY3S8geDHa51kke57Csv6+nFcl+VnKksd+OB8wSN
	 nWdI6L4pB3oraaz8b3WGjVYhagg928erK4GPkPpx7lg7oTZ8Ivj6hTTPOEwO8Rusdeg6s
	 PgkfEtVsWyLEoamiln5lrSUgMEFIhnHdWdv8cRMg41XfdTVZ+Ou4yQaTIFVEYb+GHZL55
	 rHiz7GJvoPD5aodH4Woqop1BjCCb3CvpT5h60g2PktQ83dz8YsUDytsqC6x03avTa8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrJvk7Rx;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5507606A33B
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5507606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrJvk7Rx
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b271e573adso1647673b3a.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483724; x=1796088524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1w/HFhKVIFry3YZ4gWPmqGE+Lmzlg0zffNXSei6jGjE=;
        b=rrJvk7RxSF+ASR6tC8nWJBnBvhZfEJMSOXXR+y5F1FvM5tXWP/ekOnFoVnIfwGXBkk
         CFqYLdA2FE/GvQ/4EF8JRIL5Dcop1MZobT+LNel+6lenlpD+b+me47oV/wGniWiv8qZo
         zB77q7Sopxzl/WMNtXNLCdvsceSHQyWbaYaNaSjc1/oUKbZMq88nbvSu3fUCrINEpqTI
         lAWqx2+b0qcHUMwtq38ppeXo99QuUcjYBVM23P+DMk2Ga/XnzjmdtxFQmPllZ03zrWrj
         ZA9yzE/gddItziRoPhv7NIwsSbaySsz4BF53NlSxizAdYmLgP1vZWD1SKIcanGSf3sg9
         nGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483724; x=1796088524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1w/HFhKVIFry3YZ4gWPmqGE+Lmzlg0zffNXSei6jGjE=;
        b=lydHMSVdIVJRH3qeO/v+2ynW6hsuKSq2czcVf6JJkkbFmUe+bOTGC15O39RR8fOQZr
         jpSTtzD9fj2pRUo8zJco+9+8D11wraOFg2uCfPvRFDCdp8jUGAZFcMVf/EdKtXhvaqOK
         y5p1f99mm8SYUHqRZ7vjbUr37X//woM6qzX4c+ZgaQ04q2YCElJM7DDccw32eBQDiklY
         oqlgbMa9gU2UR+7YRgv1ButGFxkB5/1/wEPCglgR87ThO1XgYkQYLZJPSlwkADd1+oLI
         64fwD5N9YqbRU/tzjnkapGCVVEKDIH+BATiFJxl/B60mtXkdE2oBapfxfCd/j0HB/rSs
         aYdQ==
X-Forwarded-Encrypted: i=1; AL+hErG3jk7sa30NhP9TYuzNu3FWip2ofjt7LjJ0NQjwcNu/MmejYcaNR6FVc91Q+1bClJ7QLLXrsT7glVlf@vger.kernel.org
X-Gm-Message-State: APuU4Z//12f/A5TtSmVHK6SL17A3oKceHJFcJkASTpGyDRPCVOSuYIUt
	15I7gM/llPvwf7RNVg2qmrXibqWCtt+EouWclys5AUB6fsM85hmrLPce
X-Gm-Gg: AZFdTZdwiXFpJsHaRLHZPzBTwPuRC2rBxfsXrXwp0zcJ1Vauek0M3fCX3vGgu4195Ui
	/cOFxyQpZqLU+eqW/pTQeKoqA42Qf5RimUmkx3BCPKj0iLVrFomx9G0c/7xplNs/vcoYrXKvJ8a
	CrbDR4wMwDWGA4sd1fv57GoD+XRIU5MfyJvUtCsO1NFCE3IiU5O7oZh6T2ZNokzyzGlv2Hiu46p
	2mw8f63dJtRh6VHTl/eyQG+bSgr9GGMB8lLYmfdmRr4jjdILziGNY6tiv/9D9aPfsUy7VIUDtgl
	ju5+488bhkHrtwSJGsVO+kOzzHKU69fwwvRBVVx7muQuBLkcZ4XxyZmBhsbJzX8LNHH28gP9Y1f
	qtLQ9T7vUiyHOv+sdFKhsfaJO8BzDpge/29/OBX6zo8riL9L5U/A6qnRkrOuPDu2oIuofxXgvzU
	rDJCHmw8K+Hy0wBNyj4KWAO9D2yVEQ1uY3+tM4ji5i0djxlXZOPPpGQihBHikzVMwA792yYBJBn
	EYY1rke7gIuMC2374di34l16LZOzFwyvHyEB5Z4IdVyvX8Bcln0gAoqBpv57g+20TV+sadWfPtG
	qFLV64Oj4PwX0Px/SrOJtVWzH7yQv+JykT0zhQ9l/fAcQrfjI86VWvQ=
X-Received: by 2002:a05:6a00:17a8:b0:8a0:76ea:36a2 with SMTP id d2e1a72fcca58-8c87d3223f6mr10929581b3a.54.1795483724096;
        Mon, 23 Nov 2026 17:28:44 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e457d1sm6115243b3a.30.2026.11.23.17.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:28:43 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] MAINTAINERS: Add HiSilicon STB drivers entry
Date: Tue, 24 Nov 2026 09:27:38 +0800
Message-ID: <20261124012755.328774-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124012755.328774-1-mmyangfl@gmail.com>
References: <20261124012755.328774-1-mmyangfl@gmail.com>
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

Add a MAINTAINERS entry for the HiSilicon STB platform drivers, covering
the histb-wdt watchdog driver and the existing histb-rng hardware RNG
driver.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2ac5128b756e..117823c25f2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12187,6 +12187,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
 F:	drivers/mfd/hi6421-spmi-pmic.c
 
+HISILICON STB DRIVERS
+M:	David Yang <mmyangfl@gmail.com>
+S:	Maintained
+W:	https://github.com/histb-mainline
+F:	Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
+F:	drivers/char/hw_random/histb-rng.c
+F:	drivers/watchdog/histb_wdt.c
+
 HISILICON TRUE RANDOM NUMBER GENERATOR V2 SUPPORT
 M:	Weili Qian <qianweili@huawei.com>
 S:	Maintained
-- 
2.53.0

