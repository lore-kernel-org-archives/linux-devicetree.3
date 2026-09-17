Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCE443636B
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633631; cv=none; b=j44OQXSIYqnah2GXZr7IqzXY7QWjJb+zQgwRYGppTa+RpHLqGDze0kOgUUcoNsVTx+Fr2ESYxpX5PaI5m4ofJh5UAYFHW0N9yBBkcl8E2N7shRc/tooDkEfeINQPkWx8WRBI93YyLmVsjH0UcUvk1JrfDz+8cnzwF+Uv3LIg6CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633631; c=relaxed/simple;
	bh=flrnI3AHL56kLUxXmCImxFJBTRAPYz1oWnHgpCIY0oU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=py3VUfvQT9PO7dRuZLoliAA/JKvQVR5qLkl+K18sjqlPd8XLYCdjstImvMMOxF3hWcTENbeC1ZXgsh5z3doN5H7IUId1L6S9BrHhGkJvB1qE/G/+xR4qdsmX55ZrZXSpfmvpZGZin3yKnnm2pD+SxewzXbUcNWsL1dixRAQ22ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=e5bWZ5UP; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="e5bWZ5UP"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so286211f8f.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 01:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789633611; x=1790238411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hM97g3YwfaEMx+8bFnA6c/zdlSKLtcHR34v1IQ2hIFE=;
        b=e5bWZ5UP9qXLe+sgecmpzzoGgTDFUmDSvF9C74n5xlZyIYtgOl/CyNGnAvEBHqKevD
         tPPzWl9bbPCtyrv5DpHLYhfgDmV+XSNtdYf0RX5TsHrzA1wG0WQY1XeG7InZemmF3xua
         eGBMEd8q8Sg89wo2ZUAkM01CX75IJrULi3dT02QNQzq0zyA5VM1vI475g7sqXvnhlnA2
         IaZNlAter+WnZOZqFS1yThBj2wzOmWJ6ptDc5thmG6MM8Ma3sazNK6y/odmg9fJcloos
         031MdCzLP8/C5JG6Y6A8cgauWdFVb42HKNgEu6TS/dyBi5MC4trtCbnRLrunBvSEb0X2
         e+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633611; x=1790238411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hM97g3YwfaEMx+8bFnA6c/zdlSKLtcHR34v1IQ2hIFE=;
        b=izHe4pqe70/5rvoSNViSQkqfvKz6Oe9peiiwgfPQsZEfI5JmgSWYxjWsxwF+1lNCBe
         Kj8wBW47rXeR6hR46bVxj2eYgAa6q0jhrNqF9Bo7OOoV35wOhEJsatf4EzrY32Qkp4At
         HFmSJgvENXB3BRQ/pYOfjvrz4cah+iKOCB6uA5G6MNgUQM5Y/dC5nY8KuIl9w4SxRSgN
         xc34xHlIkRvGNkwfp3tbWgZkL+5vRaRR8hSBDNagvYbL8x+wKWR9GvdVULVYEoEvvcLg
         oWD/tFefLQV7oqxeFpgqerv0MvthSh0U8gsTjoQEAANVh0MlaehwBCGm8B7HvxeCnA9I
         82dg==
X-Gm-Message-State: AFuF++kqLjAgxsGOO++52w7U0GWwm5kp3kzpLnRraTuEdJfADx/6lPab
	NqDGWEQw+zDZYqzTq6rJWsYE8RAI+sgy6CAHrou9y2/u7IsOaQIB47w2WGOfICofDmI=
X-Gm-Gg: AYBFou1Z1NJv9YPJ3KZtlc3BgnkhEsAoO2xBZD4tdeIRLStjxjocfiPamoavXsQYLE+
	COqerMSFHwIcEzVoLt8gO+hqoBawStqHl44hOjBkpfihxSI75jbdv+Hl3gr1p3ESsEvRkdEuO+w
	jZ/snNfS09JPc1qPdK2Bks3xWP4B4wdmQBSrfk/TXkDMpwDGiFN54kcE7W1FpaaDFKNek1RjPMu
	qAEFljSozUSSaMHW08pm3Yw5ifh7o4fHoS+EYpymByHT+LxPPSoKwCT/Aquhyosg2VSb7GUiYRh
	nHZ7lMigOZqRM/YwAGk0PZ1moWFVrdFBPp8tJG8SAsNYHdTNR2f9ewOWIGgHe2KS0JjXhT6mKRy
	pIRFPOQH27ONJPQqkd9tpt23ey50XLXMGX6iJ/ItnjMfqrPb29CSIrqjMrhNO2fUSYcB2P6kkj6
	xBEomzjw76n4tB+3o9YKFgUOZNjFiywdFutEVvQDD2DcTgp+vCa2ASE9wIR7c410xHHICyH4N52
	OutNR5/nfjpZ1kgwPx6OddeSIxnbL+6byK5
X-Received: by 2002:a05:6000:2312:b0:487:355:4619 with SMTP id ffacd0b85a97d-4870cf273d4mr7343829f8f.4.1789633610892;
        Thu, 17 Sep 2026 01:26:50 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm13420395f8f.24.2026.09.17.01.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:26:50 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Tibbo
Date: Thu, 17 Sep 2026 10:26:29 +0200
Message-ID: <20260917082632.626614-2-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917082632.626614-1-ag@ffroot.co.za>
References: <20260917082632.626614-1-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vendor prefix for Tibbo Technology Inc., manufacturer of the LTPP3G2 board.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4a5cf436eb14..caf07095144c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1724,6 +1724,8 @@ patternProperties:
     description: Thundercomm Technology Co., Ltd.
   "^thwc,.*":
     description: Shenzhen Tong Heng Wei Chuang Technology Co., Ltd.
+  "^tibbo,.*":
+    description: Tibbo Technology Inc.
   "^ti,.*":
     description: Texas Instruments
   "^tianma,.*":
-- 
2.53.0

