Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425A6377AAF
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785752264; cv=none; b=uPay1iRZo5WJ02InrojDETLrYasOA0FzAl1umRULsfBYmXofYO1fQeq9YRxQzXTxMnpvrzTtCBDljYLudJNhWBMtLWUIweZSpaRMBxeYv9TEIWXT/4YlzyW48TIyFr7x7Ts2vx9X7oogMnKiehCoiV0PViEtZyu46NTLCfdy/BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785752264; c=relaxed/simple;
	bh=mdK76CmT+sB/dQ5ZJu5idZ9uOc3wWirMdV42A93LRnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/XPywotxKbzNNlWIPAFzrj5T1ywEyo1QwlTOWJk2qhkWNstC5xH4gxuAE5EyTl842v27DZeL49YMIKQTzMkyt6SRMNCj4xWFyFDJiQhsBMwxo2rTnfknSKmyeJKOwPl2gEnZphh5tqY78qAbdQVTJ0Tz/wDtFKylEwMjYfp/Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO1GDl31; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO1GDl31"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso4576166a12.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785752260; x=1786357060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugGg4EQGeqEihDKrAN4SwKwxBN4TCJS1gjxrloyykU4=;
        b=iO1GDl31oHaQv7+DoivVv9UodxIwA2+wjHJ8oDKHHd3Dx0c9hVVreQhNLsZX1MOEkQ
         JsuRu/nB7VKIe3ikgW/bHi20lh5trydiEKgwvK7iHIGAMzTW4SgBt/z4TCyTOBmC4W4K
         /p7fAJO1RfEDtfvRVS3orWa2wwOwCSkV9Ggg9uJjkqAumwz30eDX9nnN/CAa2xWZdKCY
         MAaMuYg245EAtAOoi0cNlkA84nTH60eSmoul7XTcj6lTQpACrgqSMDHSD9lXZM3lDmuK
         kPUC08T9CTwyW3xikhDFoHUTMYhWnRDYoG8qDB7MR0RTTCJLDj/0wfEEj3VtitUBhuPX
         0C4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785752260; x=1786357060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ugGg4EQGeqEihDKrAN4SwKwxBN4TCJS1gjxrloyykU4=;
        b=Ms5WUIJYxRWwUx1lLuQcmH7n5B9XJJXAjyHzmWIEQt6MYxrjbwLg3IDrMSsDg2zsfA
         gOTJGG6au2PDGPgAgJ1L7ftDpjia/CxNr3mbnrCcWaUqYUoYGeWTwhnzxYXEwVqdVhA6
         5ugIzHTLqyM71s4rPb7HHaDkptZC6/wFIimK3dor89cBwiAMVYzCbhs5MnmG6xxO35tb
         Mx9zAJba+y45tgC8qW6mCatMUYOlZOIm2vMs5/ovOQqhQnhNVEYBpxXNjvCG44xLWzHd
         YjkhHy+0aYpuhX9jp7SKJ8N6aZ52jPCNnEfmd5ncAkyKmkr9w40zfQ+hu8vNQiuzHaYA
         Hiyg==
X-Forwarded-Encrypted: i=1; AHgh+Roy1GrQRP2/EicQ5w8WVFbFDlJCkgxAkR6YvFotsrOxJPuxX/dikj9TU5lsCKPPWFwE4omuu0GU+4GQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyIcr54KO3NVST8wW2vF6taB58Rm7ea67xHk1tmAfZxFGTw7mCI
	r0q1xsJ0qsr5CJ/iqeDjhEcIaGLZF+Bg0zVbSdsrxNSXmFEIJBQAeEcW
X-Gm-Gg: AR+sD135cVCsM0nd8QUT5smOc63mKB7v2/RdLNyF8IyaTVCxgyEQqGjF4uOPRitRn5X
	1U1QBXdR1LrtD7FRVy6sw+lGKzHTQEX6ZuFUNHhNcnQj5u9lRyGUefEZ1/G6hFm2vxXKY+01Ms4
	4qH/hKQiU6tnAYW8v3jI5/n4AmADEStf967oX3Dapb4ZaauJB9ikZ2FRCK/M04IwSuBbmBXtj1d
	l3XHXLeb8V1DhDkV492y3kpagV9XhmrVwv/stibFm7YuXicLdklX53vkmyu0SKxuvGIcwOXJkTW
	1fkePxf7rZ6QUlQlF3sQq2W9zOOZIqjgDdH48UIHOBS8wX9w0u/s9EJs+L7lGrxZRWWBrIeIDqI
	48/FLwWh/nqWV6pe58wf7J9Ym90Z4qRRWP0wm8vsJbhGbt9OtBFPrsUxUxGuaXgy3X5z+vsqVgs
	HS+58ynLRM+oUqshGtV/rZqoqYuZGpCMc5EeIo7SESVsxJBeFzXX+ot6SymhLAVg==
X-Received: by 2002:a05:6402:44d8:b0:6a0:567c:c2fe with SMTP id 4fb4d7f45d1cf-6a0a7ce217amr5861015a12.20.1785752260122;
        Mon, 03 Aug 2026 03:17:40 -0700 (PDT)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c6566b3sm5355731a12.23.2026.08.03.03.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:17:39 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH net-next v5 1/3] dt-bindings: vendor-prefixes: add Guangdong Dapu Telecom Co., Ltd.
Date: Mon,  3 Aug 2026 13:17:32 +0300
Message-ID: <20260803101734.270821-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803101734.270821-1-a.shimko.dev@gmail.com>
References: <20260803101734.270821-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for Guangdong Dapu Telecom Co., Ltd. [1], a manufacturer
of Ethernet PHYs, networking and other equipment.  The prefix will be
used in the DAP8211R(I) Gigabit Ethernet PHY binding.

[1] https://www.dptel.com/

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..c3db857b9837 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -403,6 +403,8 @@ patternProperties:
     description: CZ.NIC, z.s.p.o.
   "^dallas,.*":
     description: Maxim Integrated Products (formerly Dallas Semiconductor)
+  "^dapu,.*":
+    description: Guangdong Dapu Telecom Co., Ltd.
   "^dataimage,.*":
     description: DataImage, Inc.
   "^davicom,.*":
-- 
2.43.0

