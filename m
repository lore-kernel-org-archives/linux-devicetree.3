Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D9E33AD88
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 19:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786561895; cv=none; b=dNHiMmPdHFEIpb8g2+Bm6COUG7pTRQ8Y1uAZgNUOCxO03mi9PbL58/1M9McJ2t+fgo30/sBNf5h+mgcDd76l4eRVX2FgFY6+Xef4AwjPiJqv419vew2cBomWV2FahcidpLnciqU8sjF+EBVYdzWCbOFtR7+5sVsEXaRycaG38Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786561895; c=relaxed/simple;
	bh=AQ9hXB8X/+C0kIfH42Eh0wrN/MNep89eqSlCKfNMfsU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZwK4GI00rzMoeqSTwWbM4PLvo3RogwlXnjK/NKxK/EbmCP4krHKI2mVW35UnY2Bkt9cuiBk3XtI4hNJoexmdg9Gat1Oa6CSxd7PTEGRhfeaZUYU7mA41XTqj8oxFts4XmZA4GgyPaXqPrQnmJmZZU7GHaPlQw9EbbGrLXnfmzIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5mrYzyP; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5mrYzyP"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf420670bbso2997425ad.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786561893; x=1787166693; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f2CtspQYSmGu3Vpx+7SNmPrbrZUO95a9YkaE9h3OBWY=;
        b=F5mrYzyPTOvOzIN6ZoP3fzdOdFDZjj2/uhWTdNG0KtF5TRoJhwSjFva0aCbYJnJ079
         AyQMdAGfBFsHGDBNps9VK1QrMdb7yHxNxAnviTeoXN5/6nHTfSAGVYzpqni8eNqPGWyC
         dBShRYiDLyExk0ECs7A5SC4+DsFSwqtFozjvjPnTZ8G99k/QQsAwyzR2W2/q+CjDuYDG
         KlLc5sUhCRgf16xKyWaKVRZ+tZcJ1JljnRgqUIKj0boqvxGq2mfnbm/1FsZ81Y9+ZRWL
         zqY965IoAGFyBektEss6ZAyf3Gi1zYHc3aVVRc3T3EvT9Z7bCC/VW9Um+lDRUBCCrH2q
         Uy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786561893; x=1787166693;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f2CtspQYSmGu3Vpx+7SNmPrbrZUO95a9YkaE9h3OBWY=;
        b=hGS7KchIW08XkgUHKYfVojTGQOSy61MgUS5N3CMt8yYZWpLBhdAK1C4359FqTMe8Jl
         IvSo74D0R9Jqz4XwiF+F6zISjzIVG98f4JSwQZUKhoKrPSPpbPOV4MfQpyBx+pWGEBPk
         B8QqqkQvDblA3EGNPCl4WLSekJ4ue8K9HiBdQtU/7l9YVJf8UfpeD72zaQ4L8BiIJdKV
         Uva8uu3GlBEFXDjLOeoRKlrRV1z65YzKRjyBFxtdcmCmTboZiKntEMBCha6rTcgFnm4j
         Dfnj5G2JQMppnsRKov5UzKpukua7wnrJQTeweic1QhE31yQjGYIXzD6isufpCScbQfMb
         L56g==
X-Forwarded-Encrypted: i=1; AHgh+Roo5996i4wyHUprbw9g7NL9WX+9wNLSFw8ib242Y60FC+ve7C3nqX+06IarUw5YqYFLJ9fZbIxUOE1m@vger.kernel.org
X-Gm-Message-State: AOJu0YzXF3HfsvcqRAOHA75FPVPyKKq8D6kc4ax/78RPoEX3ABmPYYVx
	32TFBlHewqhx+raK38M2Xyi6OGc0wFkNUgBo4n+A3YmH75x+VVmqvwsMelfPxg==
X-Gm-Gg: AR+sD12EZZNdWyGxKRMNcdNtv4PQAs1VIk4v79ZRyZm4kwq7V/saM7LhlNVw2CHu0Sp
	JGSd5yPYhGPfsTtjtZvwsi2zt4n7jOIteJ2x2TYc5B9WzkHmEoZEAUVGr1/x93dtY+DxlEERzVq
	J0WISMZc2z/S3muYTkyKxItLlFlRy/Xvyn//gvmDvYuSo1byXNLouXqfQAgXTrKDAcjhDcymUrP
	G2w6iSxSNOMkDAkp6QOPFukqLJwtegcU9Ef8Tu5rgX6F8+FRLRKrAqbPmvDW5mAqCX5Xi1mmxy7
	f01Ax+y5fFxN9WMT+AqdmzgvPeqDkBrDkU1EfPMw/LQqkYs4GauAvn9DgOjzoRbwggz35bFOVV+
	BOTSqiwmfw9DtlsDqhg0XBSkALDoXuVd+Ic/WVWb/dNXnxSptSICNeSqU5SX27/BmDwLE2PMYC6
	af/hQLPStEKoVDkou/UABMM9bKvEXy4Z4ZvH3wLkllaeV3AjWS+R8J6wY0IgMhqDFSet1NuDizB
	WI6He2rCg==
X-Received: by 2002:a17:903:1b2c:b0:2c9:8287:fd0d with SMTP id d9443c01a7336-2d37e9a3d6amr1507885ad.3.1786561893151;
        Wed, 12 Aug 2026 12:11:33 -0700 (PDT)
Received: from [10.170.23.252] ([2409:40c2:5017:a6a2:eb70:cb11:a19e:bd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31da7bf64b5sm9496947eec.10.2026.08.12.12.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 12:11:32 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH 0/2] dt-bindings: clock: ti,dra7-atl: convert to dt-schema
Date: Thu, 13 Aug 2026 00:41:16 +0530
Message-Id: <20260813-ti-dra7-atl-v1-0-27b691f4cdcf@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Mj3ZJM3ZSiRHPdxJIcXZPUZCNzE4M0SwNzAyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgA93koMbwAAAA==
X-Change-ID: 20260812-ti-dra7-atl-4ec2740f9070
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786561882; l=1049;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=AQ9hXB8X/+C0kIfH42Eh0wrN/MNep89eqSlCKfNMfsU=;
 b=tJ7m642YL5hHG7Lu5Qp/kPHDG6Yud8/e5IRKiw8BdyLu+4LSAkikpfpnmy5rQsYjZtWtwqyAp
 g+ZM27HWzvAArdD+r0IU9s2tcynC02F/jFl7RD/WLXAzn/S2+H4ZPz1
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the DRA7 ATL (Audio Tracking Logic) text binding to dt-schema.
The original dra7-atl.txt contains two bindings mixed in one file:
- ti,dra7-atl-clock: clock output nodes for the common clock framework
- ti,dra7-atl: IP controller with register configuration

This series splits them into two separate YAML schemas.
Patch 1 converts the clock output binding.
Patch 2 converts the IP controller binding.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Bhargav Joshi (2):
      dt-bindings: clock: ti,dra7-atl-clock: convert to DT schema
      dt-bindings: clock: ti,dra7-atl: convert to dt-schema

 .../devicetree/bindings/clock/ti/dra7-atl.txt      | 94 ---------------------
 .../bindings/clock/ti/ti,dra7-atl-clock.yaml       | 38 +++++++++
 .../devicetree/bindings/clock/ti/ti,dra7-atl.yaml  | 98 ++++++++++++++++++++++
 3 files changed, 136 insertions(+), 94 deletions(-)
---
base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
change-id: 20260812-ti-dra7-atl-4ec2740f9070

Best regards,
-- 
Bhargav

