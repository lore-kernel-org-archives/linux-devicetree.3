Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB61366563
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171430; cv=none; b=lZV8PnrOU0qECjox5AOHqzRMBMyULVUL9pB/nj8eLeYB1mQtNpJNfJBasCcrJ4YzupzzHtae3ujCSKjhB83h5th20Nv/oFTOr06YmTnRDMhk9eRyf18mVuflV6p9glKF47YakTfItzRxV0aY624hYan2Szt+bbi3JoBBIHQEvWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171430; c=relaxed/simple;
	bh=0zC6ZGIXjHpNBB1sjVLcQWNAen7uiFJc2m3aj6/r9EA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mILxxpHHUU2X001OiEwp3Plqnw0CwXSTz4gwE7SfsXLZmPDt3hosFegw87pLot3+RI53SiT2MDz+MsEpFbK4qkjgoVtdJlHplK5E/h9dq76hWyjloPkbMKHEgaTJroy9HIOXl1AGNO42ajGoKKggSescQtUi77FCIZVgoKpt40A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsU5j3BB; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsU5j3BB"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-83945063f70so1965439b3a.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 23:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779171429; x=1779776229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RaFowDnArVikkzYWN4H3NcIqxYWPeQu705hcoouYIWU=;
        b=FsU5j3BB7NSyf4MRiAJDHLoPPbvZ3J/6bf1S1z/MmD/C3ylfu6Ib+l4loP5YYN7RPL
         oC2tZUbnMdfmjrYzRpwdJBqZPjGS7BkAVHCCmS5wOiP5F5nGwUGll8RDyPda98qN7OTQ
         HOJKWuNIjRCE8s/vCoQYlpZQWG9WV+PwxBEt73rwM7a5o3zjJMguE+Pb57wktk/dQ9P6
         tWGGSLep8cut8Cjciw3y1Qyc1oHWk3K+6rAjWCm5Mz5t43GQbEFA2UqYorsq0JLe8jH/
         8IviFdJPGQluWMuWVqF5SXZ7yAaVaFrY499yXDkwHovPYSOW9vrS46i2iHpaTRSBsM82
         w34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779171429; x=1779776229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RaFowDnArVikkzYWN4H3NcIqxYWPeQu705hcoouYIWU=;
        b=ZECJ9aySh5PGz6Zde3U2adtGjHUp6DvMxcIjupdyup58ueu3h2iDaoUKYYYFlE5S0K
         0f9eOe8oU4yS47OQCKgw+DqrJkc1CJIUsALCpNwaehxcb2oK0jK5MBrEOyT8ysdAg30O
         oAmwotPMYW6GhLg709wwhs6PZHrFrnOPkXo97WaEVlndgNZ7pUtTpE/DeLI6RA9/5/eG
         o0pzZuoFdRIPV3Miw21ypeNuknzMOp3o00LC4GFMrnAMdtSUjpIy4LWg3DOKPNDicjwE
         oL/IHW+ZmRPes/Xj/N2DtMTPjMG+Bj1W41sA9aNjmXjbnXG9fuOH1fInTvKdz5RfiKYG
         Bc1w==
X-Forwarded-Encrypted: i=1; AFNElJ+A9pPfzPUTBXUq62olKE66WGq3AWN6enkAupPiQPignn10g6Cjtftfaimw7JvjU6Uu1LRvrCveym9q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1sN/9/mjVjCcQl9ngB2TU9Xud3+ZI7wMJgbn8K+nW8Sml/Rpj
	q3znYPLVmTt3ALvlyPkloLXimPtMZQHmG2MPbk1Bs/iPsUlyQm+1QWZf
X-Gm-Gg: Acq92OGRFj9oK+hugm4fzltIMuSj+LnKwevLG3p2czvZeSwUE8oIkDUEJzRkyRzCpqN
	mTURR+l7hM8H2R1EtJeEyZxIjHJGanb8DkkrY1MIj+Gk0b/6yw+ySfMfxmFcG3RHFPMLFmKI7D4
	c4epB4IEJkXRnUhJtLgD/a9/SCIfGeO3hIwjgxWAWWCUnOsR9W/P0VyJLfxd3XqJyWivFbrspGS
	eED4e2nBTxnKns3gbj9ghAT8tQxgjPS+OF608jvQTuvZwCdI5se23IJmfL2F9yEPNAgKXz9TJ5D
	kHUxea/te7Ga9aXqt9uWCnqncv+jk9YFhVgcyMneDvUW14ENxq/GOeGXomzYKCO54zVQf8fL4Pa
	fp6/gwg/XPDfRFjTPUKYoOXpVzUu9pp4gFYjQXkUuOgRIV1piWWkvlOm+z9K5xtiBZzt3zBY1N9
	pZcNJQVmN8vQO6Wmjpu7+iShEikU6tPkS6WfzjPrbW
X-Received: by 2002:a05:6a00:6991:b0:82f:53f1:1937 with SMTP id d2e1a72fcca58-83f18ec2936mr13806616b3a.27.1779171428741;
        Mon, 18 May 2026 23:17:08 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm16112266b3a.43.2026.05.18.23.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:17:08 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Tue, 19 May 2026 14:15:55 +0800
Subject: [PATCH 1/3] spi: dt-bindings: fsl-qspi: support SpacemiT K3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-k3-pico-itx-qspi-v1-v1-1-c32afeeaf741@gmail.com>
References: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
In-Reply-To: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
To: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Zhengyu He <hezhy472013@gmail.com>, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1262; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=0zC6ZGIXjHpNBB1sjVLcQWNAen7uiFJc2m3aj6/r9EA=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqDABUc2W1VixzhH7hLpeaG6o8XOTrKg9U9NOHm
 OXvYAI/y7iJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCagwAVAAKCRDN9pw2gLgN
 2KphEACkcxli9ExmjJegRfI1bpvaXx+M8VAeND8lil9wDppDx6p+6FMOJZ9viYEPB0O0AkvkSyX
 Jig2zs5o8ncO/ccDhStDnS58EhQv+XRj3Tq/Zw08yH6BliD0E7JHdq8gXdDYR5N4wLYttZASKps
 OjqlJujIacLz3vS8ifWe0PZ3MBJ6R++kW7Kmz2D0GsxNGLaDFCCARbTIMK3it2fLrSAN2VlRBGP
 +aKHtkaQGVojtTEhYbidPNCg6TPmxLwe7l0G4u2aDBHvDg6TFKrMTKqeVZDNhVlh4oZT2qe096J
 qRVdbTuHvIoyHKvI5MxvDjz/Fppzyz5a7QwW+CUc71fZG/AWSafSiVbTpDzgacMuyGB8m7gw307
 Bb6I6eWd6aUW4GY+qIveZXZdKjTeOB1NbXVtoOTI89caH+fqU0P/3mgaIxPVJ85tW1fHU/AoU81
 k2yHqhTLzmPnriSXaRgzsO+vpXB+2/QuozX49/1tPQFXnFOADETQq4S5Quq0Cb61ukIW1KTsEKc
 SgRAWcM3YoKlfxFR1MpgarWEVJ4shSulpU0iD9bpyUVDivRvhONeJqXFamqTs0nnIY1l8lhLSnz
 bIbHQxlv3Po94qYM8c7E5M9JQwiuCOSiD1VdMtDm/i4PD2ODh16w+RfCpyENNiS4aJgBX+MbkEc
 J73oCNQLhERTs5w==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959

Add the SpacemiT K3 QSPI compatible to the fsl-qspi binding.

K3 has its own SoC integration, so board DTs should describe it
with a K3-specific compatible instead of reusing the K1 string.

Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
---
 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 1d10cfbad86c..025f10ed242c 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -20,6 +20,7 @@ properties:
           - fsl,ls1021a-qspi
           - fsl,ls2080a-qspi
           - spacemit,k1-qspi
+          - spacemit,k3-qspi
       - items:
           - enum:
               - fsl,ls1043a-qspi
@@ -72,7 +73,9 @@ allOf:
         compatible:
           not:
             contains:
-              const: spacemit,k1-qspi
+              enum:
+                - spacemit,k1-qspi
+                - spacemit,k3-qspi
     then:
       properties:
         resets: false

-- 
2.53.0

