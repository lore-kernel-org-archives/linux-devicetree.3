Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB153112A5
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 11:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780832239; cv=none; b=kHKVtE8UGj6Fu8wnfoehRQxp7q+sjMGkUmwyXJreUsz+KJvDjLVe+ovv/tpHAxIS1sGT1D74cTkumif56vmQcE1xGPc04lZKaWUqX0OdUbJG6+lww+0DfHu/oBCW29Uy+SHV99XQ89NADNuFKswucxBWWE4ZgdInm4MBJsuKBvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780832239; c=relaxed/simple;
	bh=XUJDd4xUHVWu57IdXVomBU+JbtBGQJowIYaHzRYn3x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFNmGfsyPswUHPKWEp8+sjiPJk08YWvWm9NUXgMkFvvUu9loCTBxAxPNygnsTazHIvmRKh+NubeSPbzqtCd8BaNp++ZUeyWRe/ju8mz6RK0q6v5Ip6FTEWoyd0TvPRPQSgHS+PNJTpOipQu0m5uqt4XFsY/NlNk+Fl23NldC0/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WC2aK3OM; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WC2aK3OM"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c2d792c8so22317965ad.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 04:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780832238; x=1781437038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jwCfEHJNxVKEsC2iyhku54hBK/Iu9IeFsnGfdfRF2M=;
        b=WC2aK3OMvwIbfAX5jtk5QHX/YGiI+WOJmbfxf9GlEgeF+6Yv8zG4N8/MNKW+aYqCHw
         EJpEco8fWOxJFCqbNg4Sg/0yMv9JK9afFpeg1ufaMhQtIKBk7AuxjSVcnOpDvxnfN17R
         vyIVpWAs0QfNAN2FLYS+h9Qsd3NqvfjcoiSvPan8wFXYR4G7GFgfAS2Oq+okSH3A56P9
         L974t9KwmGHdx/wcqy2RyYy63Sv+QEj08DsUlU9AVsecrdiJsvcusoSoiTitYAZi6uuW
         8Xak92yk8hvgf/GnTjngDcugV0WvMH8vHaiKV0kN7zvX9dagDr2vCneupb/9ajJcykSd
         c5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780832238; x=1781437038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4jwCfEHJNxVKEsC2iyhku54hBK/Iu9IeFsnGfdfRF2M=;
        b=mX+deiwcWmzgKr8XLFyxQjbefb22x+m3j47p1uBWVMqCklmzua5oT/KLK523mwPZLn
         h6JbfggW9/F4mVAq7xrRqKrH6/K0bpF2a4DGB77RTpwF3eCm3wWLXoQefGloVIdWWhbN
         srBS0c42Zf7d/95E2tNyozDDVO3SQheVMw6n/Jh8lEKIYtm0XfcnrPK2Oi04Kc/JkTRk
         MCeMAW7UWzPQ9pt5em5UHLjNumf5YFQfvbYYs4y66bbwQIkOYo9TXXQcPMWPfVHipWiQ
         WPql0CTaqHY8lfLjhxMsdyKRicgWPrUl151W31TQxsxjugYA8KpeuV9ra1i39R4G6yV0
         FfTA==
X-Forwarded-Encrypted: i=1; AFNElJ8XaJVRJH/NCC9ifB2H/PI2faOmRJ1w3Zk1GIiixae+BxVV9so2IY9KBFFoLvc/B3iSQGD8xXrYthAs@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt/tYAmBoIeJuRdcqw0iZnc9W9VtbxiUXkreOlCUulBjvV4Vxv
	ZgRwzMJhf/pBmqxFMeqArFCErm//iWVMjK+aZGGi0jf2ytJh8zmThmc1
X-Gm-Gg: Acq92OFftYGJVz5UXOJ8FqYR77kPsuTwByz1/C3Towsh9rFUd52VaAT8Zkd52VuVb3b
	lKG6MAU0neZFVxT/lNnXfADssi0s8wjtGRZQY3slLO54bK0Pcj3lbhK6BYn2MvaB1uj2hjHSnCa
	WRiTPr+PCqmB9l0PPsdOt2Ty1dwCrQJmQTHMEfqGs8VehWcZ+r3aqGQwJrw2lFWYgwefBkikDDT
	+Pr0kD6l5QB1xzGs5ZdS9U1XfLgmAGSepjXByE6S+f043+Xpau50FzW5TnoCELARks6eyqA6UMB
	xes09ekwJzHra3mn8HxzJ6cK6au91lnoPTcvc8l7QPFcRzWHy+iWl1hVkfByKiaYeZp5r/mTYcO
	qLD8FXXzDxkGWuF1evjOxFXkh7f0DeGJw+uvA/E2K4IYecMtj4Gg0m0J3zimtSt2VopAmBQygKs
	YIkixePz0TFpx6dw+XnrnurvuIwti8fBr84V4Wl+f+T0rD7coWhJtKaXJQGi1Ma7ajLW/Ygqbm4
	IUWnPYduw==
X-Received: by 2002:a17:902:ce81:b0:2bf:2114:ecc2 with SMTP id d9443c01a7336-2c1e8214273mr128358685ad.35.1780832237704;
        Sun, 07 Jun 2026 04:37:17 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:88b6:5847:b159:e15f:b4ca:e80d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm144144165ad.73.2026.06.07.04.37.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 07 Jun 2026 04:37:17 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add prefix for Vicharak
Date: Sun,  7 Jun 2026 17:06:56 +0530
Message-ID: <20260607113658.25117-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260607113658.25117-1-blfizzyy@gmail.com>
References: <20260607113658.25117-1-blfizzyy@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vicharak develops computing platforms and manufactures single-board
computers, including FPGA-integrated SBCs. Add a vendor prefix for
them.

Link: https://vicharak.in/

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..1948356337b9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1767,6 +1767,8 @@ patternProperties:
     description: VIA Technologies, Inc.
   "^vialab,.*":
     description: VIA Labs, Inc.
+  "^vicharak,.*":
+    description: Vicharak Computers Pvt. Ltd.
   "^vicor,.*":
     description: Vicor Corporation
   "^videostrong,.*":
-- 
2.50.1 (Apple Git-155)

