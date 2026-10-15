Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560F93C7E19
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076299; cv=none; b=EeCuQJgRKDZDiES0yXV8agownF7PZjggKUF/wDrostuC+ucnvhTF2+S/l8rnbkQ6ka5qChjdPXBgnRGPMBmGYNXCeTpX67PvGEohl900L/+RfsSIAaBNGLGWeECTM2MiEQ1ruSIYovGF+JWF5oEaQQMQxE2TrxUzuK+cGOuMJ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076299; c=relaxed/simple;
	bh=NExAlvPnpeNrybroIvK1yu+2PtogQY+t8w4M/9D2m/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rcuZuzB8/4cMpzwSd7kYHd+QtOAB0b0uOb5qomIL/XXMOoCt8WSRCOfIdWbZzq01mMfPueHYK4H74Yvp2+Yfxz+/32ReaEhRF3DTJkYZ8vt+Zz7uPBg1G5HYHB6Rmp1r5i+x9sVl/mIu86OSI3nql0eG4DxLLLiObt5O7xBUWv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=oSCqI2t0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="oSCqI2t0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49ff680331aso24808535e9.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792076294; x=1792681094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/smsvKS7Sh5LROb29McUR3fTdP4O2notmfq7QIJ+X4U=;
        b=oSCqI2t0SYfvuDNEbO9vAjRU04poI1UjsKBxTNgUpRCQsQ7jPB0Dkw0brRQQMgt7cv
         4B0UAfqwNgewPOUgH+NHXC/0FWqiI49bxKKpMtCKrJu3S+VToKNEHi8IWE1VfHp8MIGP
         b/RjBYYoEEMN6cQAKa6fIJ5A4i+nrwp9oBCjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076294; x=1792681094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/smsvKS7Sh5LROb29McUR3fTdP4O2notmfq7QIJ+X4U=;
        b=LxoHkVYnS3IZIBlw5kljVH4imHzntPn19cw4YBL7ykjTOqXH8AwJ6V9ohH8PnM0Zov
         CQZyGlehWgYVwd9zb0c+s5eepO7TaZEDJg+/mIgTMF7m2pCZRVoMIVlTmauryV5B9wRA
         Jbi5WjIK4blapbRkL6Vtft049AwDXIF8KX17o0WsoknbmG/P6JDEwf3qBvBcmNlLd4pp
         pIkgzwsztEJ7D+5AcHPvPsE3iv/Y8rT/u2gnIyU/f7QBN1pMS0XkkbbmZjcGDQGnV8cE
         iXraPDMKht9wWdy1lfdMyAA8FWO5hjCeYTzIe3QKcrtXqveEGfHipMZyEEf+emnn23b5
         Hk2g==
X-Gm-Message-State: AFq9FYIJncw1pbb6txFe2ewrbWnpcxn2PL/RWZjJElPnNUMELmzfN6xJ
	yf3xJtzOH57QKl9UtkwBsZLEzF47m3XTxsuv9e3P9SBejA2xQW6ce0nnqH+pDsbL/g8=
X-Gm-Gg: AYBFou2k10fCvDvq4vQJl9rfuPDh44OJlpCHO1Qgt1LCxa6FMSp2y5p6hZFhMFwj7KB
	AugG1ryzFo4/VcKSdyCl0xSajZCAkac3r1Rgv2GWaQFbMzvxdX3pAm/McYvZo5aOIAdST332YEj
	N9EqUSdds0EIxmsBQh+O3ofImlLy2RBb80p0nDE5GDO0wsvprlBr0GXc5QbaDjJTb0RfwUIetzq
	8Fea9j5oHstBdMtbF1znB/K/CvYHv1z3dJYIzUgo7o8nuJ/KohBDNKN6az55a5pflaapceQz19G
	VdYBrGBvbTihI0nTviz4/W+ikOkQFq0TlMVZOPuZDpPL2H2WF8ncQdTxOh6A+O5uM/c4S39XtMd
	9MmH0mhuTatQb6hYF86O53LNrUPQkLiHPs+BzpIH3TDJCeL4LOgzqtEWH6W7UNsQI+RBwr3SzC/
	v2vVv6zWFk47y51w2VsRqK3P9T7JYMSDwMkC/TOohc5lrnIAE3vAm+dQ55LJc9wvDfnqgnBGVwT
	boRylByS1LHOS3s
X-Received: by 2002:a05:600d:82c1:b0:4a1:6a10:4dc8 with SMTP id 5b1f17b1804b1-4a1bd175fa1mr90873675e9.28.1792076294116;
        Thu, 15 Oct 2026 07:58:14 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd97ed33sm88053985e9.5.2026.10.15.07.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:58:13 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v11 2/3] dt-bindings: arm: altera: add Draeger M48 dual-cpu board
Date: Thu, 15 Oct 2026 17:58:02 +0300
Message-ID: <20261015145804.3632839-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261015145804.3632839-1-petko.manolov@konsulko.com>
References: <20261015145804.3632839-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..b67dc10b0a11 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,socfpga-m48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3

