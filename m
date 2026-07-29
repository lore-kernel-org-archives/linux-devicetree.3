Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F153803CC
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 20:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785357817; cv=none; b=mg/1tF6T00i+G1e0GmbunYQEHMU+23bHreA/gPZ1FwXrb/bpRY56K1jh9J6Z7dGnMRhjcH4Eshe+2ztyYA0AEC2QwBGRT+48jIbefAf2TQwxLqPoIyEqO0kcu/Kn9XzWStW+HWR+CdI2fEQAY9QHuS/4/EeYRROSIFNMtBukXBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785357817; c=relaxed/simple;
	bh=4BOmkU2vSZ/U9gONkaoeVKNfjOlDFt3ExDRgHcQlNIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gpSF5EzrGT+qUM4Vz+PL7QkGIU0+2FcMDXg5oJZKuUKsJ18bLt4UvKz4IP/gyzTM5KKdRd8Q0eWStudpRU7HnK2pqBP71HCXEjx/6boq+MGDgbmqGSItheUm7kHXjZv9IqTBRPoaUkpE4/m8tK/sb3bX4tl3sbX6E+2Hr+s2kYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rh7R6eeh; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rh7R6eeh"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso14237845ad.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 13:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785357816; x=1785962616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++0iVCZUdHPXOWic5UVGxf1B/unfU6P/EZ5LYxleIMM=;
        b=rh7R6eehDGseB5tQoDc+dwBt4sLQ9ttj8gY1iar2uPPBD4CABKKxCACkwSzQz47zSj
         v59o+iCP4SkM5dtFmwFTmihDKk3SqciGC+fwEl92zThe1qMZHA6kh1O5CLNDyO6ZuWXB
         zVMMrcFtiMzAlU/MtdVAanMbav1TanR385j6kBfB0IpvTRRQ2q0c+6Cz5iOf4Es3lQCq
         HkwP1SlW/JpreUnb5Q4Dtj+89UCC4d9AjS7XfFgv2LxANF0bKzOXBOEp0KQP3aS3sIVj
         zTCvT0nIBIbFQeUSgxICYDH4WG5HiJeGS/4TxDWWvdSm+Bzm3t7xi+hCigzSpxkPgVg9
         Np8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785357816; x=1785962616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=++0iVCZUdHPXOWic5UVGxf1B/unfU6P/EZ5LYxleIMM=;
        b=RF3gBsZdnddfo7uU31xyae+cwvBtB450k72+V5xeLhL2t3KAp9fLhCjb0aJ4/hJ5SZ
         NvkA/z97uN/f6Ovx22cttBlBHVk0L64xbt68IvBHbxwbsV8LGKrEQYr3aCNiL6mvrkIM
         dSof5iVBJHlycpc6L/suFoMUNsx9xRtIUNsvA7G8SzTo9QbpQK1RnAsjcRlj5zEnz0jl
         kb6O3kswf1i9KzQx3WjfddgE0sfRXbg6m/sg8UMJuZZtsDuJf0UFJEzMeQq1D4h1ixyO
         EYmU2EkiGqklgagQ88qZsJHjgZNtTvCA14+78qijO0FFJGKLKalH+15+sCjFrIQbeB5t
         56zA==
X-Forwarded-Encrypted: i=1; AHgh+Rr5J0tvUjlBRkOpQA3vf5NhbbS8DIrqFohR48VbHSzOUHjG5R0gGFYRFhgIQwrBwpTv/D6CjWJmlFJ9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/DpoQc5eMA9rsHcVAQ/t7n1Lc8xCUH+/8544o+PGlCBJliyfH
	rPrxaXKDzpkk2mlKuuDKpVdX8dOVz2nQ8IR4/slgryAJ1xnKFSxwweyv
X-Gm-Gg: AR+sD10O2n3hPsHFSYkFnQH97DxgZxctRsYspeIAjyIJ+ju+urs/5jRfjUeyWU8pCWA
	6R1Oj8bw6JRdH70Pwgm7DM9QRoszoZDvZri6ipCnEJt7y5ePN/0u4mG8jdWnWRHcp/+Y5+mz5zI
	Dc/9OzI0Vfkh35P46iEkpap9dqnh/wyqnbDPOfbBCyZDho9uUuHvsssLgqbGl8bhqKxWV06Fimz
	PKaiWgFC5mRtDhlca0beMe6aztuG8jf3hzFazT2ZaQ2hUuVNaFu7FPuTXU6BDlC/cJtxDeByIc/
	0VqdEgPZwRmTm33xW2NOGwS74MhmyDgE/2igP0FNIMlWeQFpyKcwniMzrOX/WSzMtbyQ36vu7LP
	163oWHfL01sPSj9ze+sdU00oFwWPxBYTD9W6TOHsNmF0e7o0JyzkN5a2lDcs5m/fnt+v+sXBCkt
	h2o6lnaG74ryrYoTkpSwqeEq3CLi3cl60T6zxUe4IDAASzo2P+xxl40xAebo/n4M/HETrhVGHRQ
	SfRyxTorrZsnDnlTSo0KEtf2bO1hmep80Wo4gfAhA==
X-Received: by 2002:a17:902:eb8d:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2d0339f1126mr4140745ad.21.1785357815927;
        Wed, 29 Jul 2026 13:43:35 -0700 (PDT)
Received: from localhost.localdomain ([2409:40e3:209d:579a:9da:66e9:b9a4:b92b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b12cdasm14650753eec.1.2026.07.29.13.43.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Jul 2026 13:43:35 -0700 (PDT)
From: Rounak Das <rounakdas2025@gmail.com>
To: krzk@kernel.org
Cc: bp@alien8.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dinguyen@kernel.org,
	krzk+dt@kernel.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	niravkumar.l.rabara@altera.com,
	robh@kernel.org,
	rounakdas2025@gmail.com,
	tony.luck@intel.com
Subject: [PATCH 1/2] dt-bindings: altera-sdram: Add Agilex5 ECC manager compatible
Date: Thu, 30 Jul 2026 02:13:08 +0530
Message-ID: <20260729204308.21562-1-rounakdas2025@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260724-sensible-flamingo-of-experiment-5a389f@quoll>
References: <20260724-sensible-flamingo-of-experiment-5a389f@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the altr,socfpga-agilex5-ecc-manager compatible as an enum next to
the Stratix10 entry, since both share the Arria10 fallback.

Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
---
 .../devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
index 2ccb0f216318..34af88988b84 100644
--- a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
+++ b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
@@ -20,10 +20,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: altr,socfpga-s10-ecc-manager
-          - const: altr,socfpga-a10-ecc-manager
-      - items:
-          - const: altr,socfpga-agilex5-ecc-manager
+          - enum:
+              - altr,socfpga-s10-ecc-manager
+              - altr,socfpga-agilex5-ecc-manager
           - const: altr,socfpga-a10-ecc-manager
       - const: altr,socfpga-a10-ecc-manager
       - const: altr,socfpga-ecc-manager
-- 
2.50.1 (Apple Git-155)

