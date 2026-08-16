Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C5A23EA97
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 13:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786887197; cv=none; b=YZeN3KAieNasE1MM2AuoBkK74gI5bwcizzkPZSub6pk5/d+Z0qVdwhCHbdDd9/59HtJyFmxXZglqbB/7KpVO46u0U3eJjqUFg9/2SJVH/MyjyRCdCQmMIfOBHng2AabRdePsYDMkSlET0nOKui7AFLwH7TheAHUnEwhi6bR3Mp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786887197; c=relaxed/simple;
	bh=S4gVIUWwuoALYuzwzRm82WuAYzYN5KLWtNbqZ/oM/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=juaGpQDRSkPRMGevvuFmimcd/NEgUG0AS/C06iBKBGcZszs/hhXdRvNJFeGUS7f0VAbC5pATSWQpVRMmdcqeYPltpzJ/X98rU1peqN90CxNUGe+WqqqFvwAVewGqMcpgYlO7M5SyuvMYOyEA9Y4DgWzqiNxuRZy/9pMdCI1Bp7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcaeb9n3; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcaeb9n3"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3900e39d935so2354834a91.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 06:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786887195; x=1787491995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=mcaeb9n3+xo2MEk+eCnuoBR1gdDiPi8BQdDPwhWLePJAdiAJ+LWgQf3FBhP5Denitw
         CSeU0xcuC9wreGQj8kkC0htSDNxW9pdJfpOgcVYSyiacuLSmzEOmGFIbg/PoizlXEUTF
         gUQj7K435ko+STLV+bGVBTKWGhADQERyAJh04R1hGgjsdhjDBa+fAhw2VPnxBS9dDT4G
         CuxL46xSXnINPCNMNpmzQvJ+BTqlmiU2Cm+kDSCv3cuZQongkdLgmcrXLX+baabBhe9W
         X7BnJHCGu/co789GG39Oi19Et9kzmEEBwLVWDz9nJdz+ilwomWxxNNKSqtls9gsIxQHl
         xdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786887195; x=1787491995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3FdfDbvToHSgtTrj8YFlW83QqqTfihaw6vnLz7PZc8=;
        b=dTGk0hHL6AQcNVCXXwsETPaTO32xICYcZQbaCHdnIAU6VZ9gCWrzQ0OcjrDauZemur
         9JJtfscpIVtXjpFU0C5Bp8DiQyCilPPrDbpn2fV/bpwUBpDmzw73mSzj6K1Iw0rbiEdX
         llg9/VtFkG49IWUhkHKTDHrwk15XM/ln8cg3kdNskLL/ewW5p0aNz8jPSH3HwoXohjfF
         R/Xxs+DXaXChnsotBxtFOrrUbItEZuhNA+Gdw8HpnoBeB2NUiayA1auR/pgojf+usX7q
         jjiUGLEXblOkPBcYhE4MAxcDgqAxLfSJBllBvyBkt/zG298PaWPMb8/mc9fGe8kB3JrE
         BTQQ==
X-Forwarded-Encrypted: i=1; AHgh+Roa9P+uQVSna4icxBX0rfr0NRJSwWy6rrGAUSOqKqsoANI7r/FrAWIZcndhCHQHMsKnRnfwa37X9kBD@vger.kernel.org
X-Gm-Message-State: AOJu0YzHx+2O2J2iyycAfC1JfhFGatWEx4zU8KHvWYcAj2pL7GxOxQQ5
	hU3v5DHVAioYniZsouIwQanPz6Z4VhM4dTzmmb5gxNzrII56LMsB+tYf
X-Gm-Gg: AR+sD11ZD39R1XOMkbufKWMS/wiHcC7hhHGjq6eXUizurWOKdqd8GpfGN7y3jSoL9uF
	UiJVQ9PGSDIhtYQmRLW3lDIMxMHYHg1tQIw1a+6yXpL+Vacb8zeqheSSPr/0v1knKM3njDenzwx
	Cs0ZGqPjEhG5arcj3jp45uWu+d5+nC2samykfcdCP6hp/fwDpesOrLQ+Hito+ON1capba9gNEjr
	fJmFVaGc84WaSUT1Gy6wUGGgVaFLlxKTvcvbvOgmfUkOj8z3OvvkBOQANthQU9fu3kWt8jp1JKv
	IxZnEMpyKkNntIv847tzDwv0YFVCPVgdTUSYDyMIoqGE06ItlldHHz+TdMIUlS1x2nCsqs//JT6
	+jxRY88i2T18D6BO9J36ny7Ctk886CWHqMMZvFrQyXUL39ybg+tL5Znf73hoF1nv4c7RbE5fpnq
	1e+QocWTRqKeyrQQvVC8AD9EhwlPjfZYyDI7/MjgLwFaiWJmZJ+RLeVVKEIIONWFIYAheO24Xkw
	BLdnQpoqH3u
X-Received: by 2002:a17:90b:53cf:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-3933bd204d0mr20550705a91.3.1786887194858;
        Sun, 16 Aug 2026 06:33:14 -0700 (PDT)
Received: from localhost.localdomain ([157.51.221.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm23599064eec.26.2026.08.16.06.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:33:14 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: lpieralisi@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 5/5] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Sun, 16 Aug 2026 13:32:31 +0000
Message-ID: <20260816133231.10875-6-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260816133231.10875-1-sreeshankar0910@gmail.com>
References: <20260816133231.10875-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

