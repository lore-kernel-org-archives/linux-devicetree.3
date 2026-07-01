Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743DE481FBC
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912356; cv=none; b=es4nFa/mXC1voP/o/YCD4FVeTs84tEhOucO3mcB0KkW9Nf3aTjAVtdDAg6q12piSKKEmr1eKKmIcMmq/D9wbmA1PmYCccPABhbkvaGSWiLwWr3FVM5sM2USRfQBwGc5KYZhby/7cTLcCNphNR/HDUbQdVY1oBvy54m0IIZb21Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912356; c=relaxed/simple;
	bh=If9Ci2Z4+VVhHu4ohujPOv6EhM9Xxc6Q0kFET/yLWWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G8beLZxjKZsOv02gzQ/1IjUAe1fuvxcqrN7zVSkx2KhpvLP4CumjVv5mZdBrRTRT6ZVdBl3xEpK1i/QefbhrCZDnAT8UT6hvlzKL2sAi85qJxem/dxwbIW8q8m+vrqUg1REqGaM6mE2UWPbXtY0FwbT4Cs8glMByZno+VeOXSF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQoEZJgf; arc=none smtp.client-ip=74.125.231.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQoEZJgf"
Received: by mail-oo2-f5.google.com with SMTP id 006d021491bc7-6a308908f2bso54848eaf.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 06:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782912353; x=1783517153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9ly6ZTzLYLZx8yS4TUkxxmSHINnr8BKtUdkBSO+x1w=;
        b=kQoEZJgftd+JaudroZ9ODk6Y4r/VPd/NsYWxCOYfrDBiLIv27+gBIL8lzye/QGtkOg
         k5VwcuWXedIJdnADT/Mc2LSjkjZblreQ13rxc/omPuG9EtEWFbj6eVxMjpMjCLDDwtri
         QVG4onoteEjMmCW4MtNW5EHrAE6cpDo2th0GWOUMSU2jeyFTHMpK6qOqaXZ5KWb2vW0j
         SBv1zNEyY0E6bT1/Fz9ALOdMXh0j2N6tZrvh8hfsqt+a7d2xo2lZI1Wd6ybmMTbcq8fs
         CRVmIbX2YHlxgCFbK48fROnuNqKZa/aAkUGEXlpeXZ1wWdWu8ylf0v80B/166xo3bEs2
         9qFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912353; x=1783517153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P9ly6ZTzLYLZx8yS4TUkxxmSHINnr8BKtUdkBSO+x1w=;
        b=BOnZKVZmD32PMCqWdNAUdL2igu97sorLaJJs1ejsVDLaX0VM14Qis6P0xWrUJyRksP
         clVgBzf1XA8KUqKvCaIv9CCInLcHVr/Iv/xXY6Apz2JJM7GaRGTNpXJLgM2i3KQerK2g
         nE2c0ZMa2UKYgWTrLjeoO49tF8AfrIPHPrpfalocUnabndwMO9pXfC0Ylcfq0s6A8m74
         tIhdr09kU1e6KlrxG/ezlZgDb9u3gpfrYu7GiVnOsKtZFLRnC6W7HtgNexLzy9eUAF/a
         ziEUftNHFT+rcqDSD9vHwsZmzuQmRXyGw+tZbVfU9yb546Mhrzo5pEIBVpf7+B6oEdVz
         BlDA==
X-Forwarded-Encrypted: i=1; AFNElJ/I14R2fHXYeSSH7YarxUDgNDXWo69AYYxsfO0dzE4+ta6u82SFga3Go23hgIZTDwYx3jaZhwhn4ssR@vger.kernel.org
X-Gm-Message-State: AOJu0YyRUTHOZHJlOqpAD2553oTWetqP4w5u6dWkwLjIZn/8GLGrV/FJ
	E2Wfwpzt460rRWiWN35InwEFD1Y80Wp61EE+9xDo0hsILCYHG6lq/3KT
X-Gm-Gg: AfdE7clSc2ytVnnqpjZjcnZ4qv7e2jGiCnUOsxCxCwZK8AXcl2ycXMRRl2JpeNPPbMO
	uVar+zg1QGkChj7OCilP3nioiyDdYYstWiUnVevPiPqRpBgiKEwmLPc+2DPGgpPJNrGKmVF8Isn
	zS7y9xvSQahAAp6jPXEBNJ2vyNCpoKcEIV3W6TivX+W0Vqka6Qsw1cc6vEGh/0AMTb7qlc04DgL
	nCHpbaE+K5DtV+8tMgyyZnpu5PU0MljAKjXhbQofDWzr6pnwbqp6Iq4sVbznVmxLVI3LzBbY4qR
	WM4QfDdt4HN6ICt21JyIhTGEHcN4uKq8j8TxjwU8AbcMEbrEZk51EzIORee9CEDirwAbXjvOkk1
	xykztyM2U5acNnOSGlzBMVZAJeoPgGymv8HSadPtW94SwK6dQWCdTIJtCRS6gf/kclatFo15V8J
	Gata++EYRk/IgQ9GsJ4mZW4C2eiULCGgO2KFXp8asTMT5LPHBbM+kKzOIkFuLF7OoBDw==
X-Received: by 2002:a05:6820:4b09:b0:6a1:5756:10d3 with SMTP id 006d021491bc7-6a30d79e230mr365118eaf.22.1782912352999;
        Wed, 01 Jul 2026 06:25:52 -0700 (PDT)
Received: from ubuntu24.. (dsl092-249-254.sfo4.dsl.speakeasy.net. [66.92.249.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec34f898sm4938144a34.27.2026.07.01.06.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 06:25:52 -0700 (PDT)
From: Xing Loong <xing.xl.loong@gmail.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xing Loong <xing.xl.loong@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: add mbedtee
Date: Wed,  1 Jul 2026 21:25:12 +0800
Message-ID: <20260701132514.186953-2-xing.xl.loong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701132514.186953-1-xing.xl.loong@gmail.com>
References: <20260701132514.186953-1-xing.xl.loong@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register the "mbedtee" vendor prefix for the MbedTEE Trusted
Execution Environment project (https://github.com/mbedtee).

Signed-off-by: Xing Loong <xing.xl.loong@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d6..fd032a3 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1011,6 +1011,8 @@ patternProperties:
     description: Maxtor Corporation
   "^mayqueen,.*":
     description: Mayqueen Technologies Ltd.
+  "^mbedtee,.*":
+    description: MbedTEE Trusted Execution Environment project
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":
-- 
2.43.0

