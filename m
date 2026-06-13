Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00913B67E
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 05:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781328031; cv=none; b=gDHqIFIo9g9aF3XVqtdG6cgsGxyQVp1XDtb4eogpqqGxAViOOnL4TaWKqhC+D/klmzjEs+FRUXvobExR9gdWEDVuvcPIm1Wu8j0M6oyid1RGUcUf/utm/fpg3VxRqst89kZuUYU5E/xNmT2k1PckhypBYK7BP9PayVTrSsdQAHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781328031; c=relaxed/simple;
	bh=9C+9acoU6g7lVamTfAReYE056+Mo4L19daujFjjLyxE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u7JID2OPQpDZyE57sumNqQkb+fPFt9txQdC6aKptzsxhSf/JkWagCxUErWYTI5L9o8SVgeEAgvgqbevbZiKDKteFKl2lSH2p0Lqjz737DH2RQtPYcNJe2ONb7KBC2+HsnEeQmPL5oAUDPNx9DX2ajb+KtoCwaR7vTtvBpdBcClg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqkEf2af; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqkEf2af"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5a7c7e13b84so961818e0c.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 22:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781328028; x=1781932828; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U/CLZ+5qQK6nv7unT8PtYK68qrCmHhJFocTHGDo1YqU=;
        b=YqkEf2afuLBjIUD5wNsFTd28l/lznIL2zn4hL5yR7Bwv7KutC7JbiX1AeUjpQtS4Cp
         85G1fE34/Fw9oaoslAIV5u/AtlUVGmsKj2tDuOztf5DP3EAPcBQsAjOwgcd7kAc9MK76
         GQqS+dixjNWGw8TB6R7yuZS50SacBNxwpcFJjT68Hv4DXzwgh/RDjbIipPdR3vVoi6K7
         dqRylJDdUDCEVf6QAIEmjQzrz+8LxHdtsorCofLx53BO9ZOAzv25WZRFrP3gvGayfBkC
         amwcb4NOSBvpFYyzuD/qSewI3KBWg6DThFD6lXPuCMJgaabd6Z8IRqO73I51jwRxZuFz
         /GEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781328028; x=1781932828;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/CLZ+5qQK6nv7unT8PtYK68qrCmHhJFocTHGDo1YqU=;
        b=VumE6lmx/wlRmWJU4wNM+6Bg37jghWTrrXeKJauIpEHv5iLx9robcTbQkgLApKcUgi
         moGDkbkOizNK36tt0O7kFtERgk5N5r59IrFr/RMFCX13N0DcWzonPwjQsR0lqvtQIkW0
         QLyNb2WIDHovHCRDn5sfPYmR2sBh4LdU0cyAdmRORDsPWlJsY6z+jdOxcpHAwIhrJalN
         EQ5yw5NPNQa4yn9z90kZNs5srQWlNcQzts5qG8EocR4Am/xPiNWKc3nBZvkXJ21kASgB
         d3WhWhzpGeG5b1ijM25nUUVC1WHertfUOzrEyXzhUZnyQCBXvOlNm20RNTDFqQOq3eeD
         xGfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/axKC5l2uw7tbgcB87bDCg9r9DtzokP1Y/uQgqNxc3pdIXK+1a5X+zt3XJIs1VEo0KzbLu5DYsj/e1@vger.kernel.org
X-Gm-Message-State: AOJu0YzKbk1hQpP3j8nCrlFbXy5OF7STFjJnSxSMOjalQpf3+Tuq5Oyz
	3Gzypl9WeBSlX3wh+TutNUjeXsA4jy/txyvc/BfnkZarLKp4NRoUfVGj
X-Gm-Gg: Acq92OF1I1sH07qqATFXjAlgSyyLL/BReyDDC9T7079U5QNYJFoMXBLjiI+74kDSnRI
	V659vNJkmxVjSXroTZgnVpxPInhnRznWAB4oTqLU6c8qt15Mbd/CKa2nOyeIr5yaWEUiFyiEcbO
	YENIZKKrvytvks0ZbwSNr+1gx5plp3r4L7jIIm+WkvO686J2OVjauUKUI45QlTz0KcCJAIciFVk
	4oUMrFPq5Z69P2yMuRkGCs6dATdvHifTv6XBCrGWSop5LJH/iQuyI+tFQGhZNhF9B9I4bySuph5
	x+6p+BHI2PpauqCa0lI0ucGCQde9VGD3P0AUaUkHX0dKh0cLvs8LRKOZqrlObyXq1frLJMae99C
	GPgusRfUfFpchpAZ8olmUPZGtpJf7JvlUfD3OGJDNGX5ujjx2gGxmGWsH4R4PUIuPu4fJJoF4hf
	FesLUCqPO6b5wyb9c9qrq/fouZYny7
X-Received: by 2002:a05:6122:4204:b0:56c:3a57:aee2 with SMTP id 71dfb90a1353d-5bb6c001fddmr3552398e0c.6.1781328027844;
        Fri, 12 Jun 2026 22:20:27 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.136])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb69014308sm4848692e0c.7.2026.06.12.22.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 22:20:27 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 0/2] clk: samsung: exynos990: Fix PERIS gate clock
 parents and add TMU_SUB
Date: Sat, 13 Jun 2026 00:19:50 -0500
Message-Id: <20260613-exynos990-peris-fix-v2-v2-0-3dff7ade75b3@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHboLGoC/yWMywqDMBAAf0X23IU8IBB/pfSg6dquhxiyKhbx3
 13tcRhmdhCqTAJts0OllYWnrOAeDaRvlz+E/FYGZ1wwwXqk7ZcnidFg0VJw4A1Xh8HG5Dtveh8
 SaFwqqbnHz9efZelHSvN1g+M4AQ8UKgN6AAAA
X-Change-ID: 20260613-exynos990-peris-fix-v2-619c3a30b36c
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781328021; l=954;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=9C+9acoU6g7lVamTfAReYE056+Mo4L19daujFjjLyxE=;
 b=fqNIjsE723ylk8j0/JzkxKuIjpTKFRODde0FklYKkmT158zHx150PVaaryeNmpJCGmx+6lS99
 9PAJFBwCkZ4Bwe267t1dckNnAYv4pOVr4zr1DpoTDCKAEQiCY6X2cEC
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Fix PERIS CMU gate clock parent mismatches and add the missing
TMU_SUB_PCLK clock.

Split into dt-bindings (clock ID) and driver (parent fixes) as
required by checkpatch.

Changes in v2:
  - Split dt-bindings header change into separate patch (1/2)
  - Driver fix now only touches clk-exynos990.c (2/2)
  - Add proper cover letter

v1: TODO-add-lore-link

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (2):
      dt-bindings: clock: exynos990: Add CLK_GOUT_PERIS_TMU_SUB_PCLK
      clk: samsung: exynos990: Fix PERIS gate clock parents

 drivers/clk/samsung/clk-exynos990.c           | 24 ++++++++++++++----------
 include/dt-bindings/clock/samsung,exynos990.h |  1 +
 2 files changed, 15 insertions(+), 10 deletions(-)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260613-exynos990-peris-fix-v2-619c3a30b36c

Best regards,
--  
Denzeel Oliva <wachiturroxd150@gmail.com>

