Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF463559F8
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 23:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782688253; cv=none; b=WtAkVpCY/KC92FbGy4uDzEpbWGO16w7B8Vq6IdIZqapMn2VH5TKL8Nit3YE8DcgPbBg06kZzl5pUN51+dQrytU+AiDGPeZDP9aUZow1+1tjZrWmvsFiIw96OEwqmsscpIgCjGc760kfFqDMbBViUFqa8yNaI6bhndUpJBfEBDtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782688253; c=relaxed/simple;
	bh=y9/4AxteBtQzJzdaF3W3RoLrtwd6cFsBj60iIV20PEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GDoiHBE+YIrRkWjSBXEnoed6NigIrO8nct4oXmuxdMH8nR1vaDvucy8HrmJnebU2ZrjufyAsWoleReZrY/vPfgxYj7/k2OgV6EVN9gr5pMuIj3+NSmuDMZ0ykTYbFezwQAgSkbkSY2jGiLG93ORUb47eyRlTXbM/C9tGZEw/Lvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIGbXV2o; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIGbXV2o"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c6bb8a5980so21080515ad.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 16:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782688251; x=1783293051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxRo8SI92NrIJkPLXL6SLhpmiCKCo8TNk+32dpKenYo=;
        b=bIGbXV2oJuQ59NHt6XqEEVJEsyJGCJodMltefhqsKflMiipHCwG0askKpVzZwMGBkz
         MVIyOeOkN+B0Wb6ThAylJ25qpxvGfUvoJ8p2x1womlpvYzCCDTIyH4x3nxxWfoqzOZKU
         i21vr1fLCI/6XdxEFgjDENGgDqLUGZD3MToVz5AXkAjmeqauJejiCSMmTIgZesnl7RnX
         sRVKjXFP6j8b9dGUu/RycESB0GtbSwr03yTEQt1oaSM2if0VoJtVyqDfr6fEfhiNtj+u
         ARVqgUFDd27f1z8YPOkxpCZlHiaIE4jjJ6F4j3gE3xkySkreMOKln0k7j9ndAfBXa7i7
         nofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782688251; x=1783293051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxRo8SI92NrIJkPLXL6SLhpmiCKCo8TNk+32dpKenYo=;
        b=j6qI+XWTsaEKIMNaip3fqO90EPDb0mOdMizXFLJcMqbZWvqX9j8BctP89s/v5bivIt
         8WsCiiFwbA8Q2T6U8Q9zDs0CW87msP3fO07ZI5zjc+AHqY9IkVV23GAw78nmNbjeW0F9
         pxyvenEcUwT/SfKa3gzUTxsPrh78LQ4CMx0ML6cezXmmcf1QHx3+SvLB4rWvYy+hrQId
         a71hXFbnsbw/cNSfoZQvODg6w9nPCItCwvp4HrGoAEgcaONPGcEewsz9WfyaQBuzjqqO
         +hXVFskkBkxN7k+pazSiZlsl5tN7XIS533fJ0fS0qiYIaWAjTWFjxUzzpSLGKGe9UAtp
         Weqw==
X-Gm-Message-State: AOJu0YwIVVF8eryTW2eVx77LgKotzNWLRB1g+JyxjXSg4n1GhlpIsOsi
	cRfYEkwNNtdERaDMG453Ccg3FN1r6+AhEFtXMwXd/PxxikCoM9e2FcfEtzLZXg==
X-Gm-Gg: AfdE7cnTIAcDl/Aqtg9Q53x0T4MkYbTo61GjRUaLRvXXVw0TW+Is5uL5bFdFtb15XoV
	b2kCbn/V/jtFPxNWRL9+thmDnKUvxPGV/JiKtCp1t6JW5SyDP6DjP8PqjxEqDYuReJi030qsqEl
	OMOK3L8QjNlmlvPK+NPtHWGOQfaGysjEcIUzST+rWKewMo4zgExIz2xacAHfpJU5U5Bfmgi4tij
	6mkMS4ZN8lgNoSoUbzHkdeQ+G9qCqzcnBxrlKY3s4UcX5qfh5B8Sp4TdqpD8/35/cM3/G5Dz2Wo
	6Bn9jszqOVR7v7KG+fMtSjY43aQsLZ+KhOZWkWAHMx9LjU2N+fu3vIFrFFaDN4O7CHVjomigxSX
	ZiAwNjILeDdEeTsE0MyzDZ6chmfeywdwdyfwqvMQkxtqFVJmBvaG2CI1VTRoIJtAJBnsaOF6vSF
	avO6kcHZMFj492WRMq1P8Rfu4YxW25E+IUpRtegWJR/yJBnE3+3tO5TSEMcyUKxFF+6K9vN4Omb
	sLxAAZuDJkwManqgp1X
X-Received: by 2002:a17:903:22c4:b0:2c9:c6f3:457a with SMTP id d9443c01a7336-2c9c6f3463dmr42101555ad.31.1782688251186;
        Sun, 28 Jun 2026 16:10:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9dbe5c5b6sm19461565ad.65.2026.06.28.16.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 16:10:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: EA9200: fix nvram size
Date: Sun, 28 Jun 2026 16:10:49 -0700
Message-ID: <20260628231049.1248899-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes:

[ 0.182121] WARNING: CPU: 0 PID: 1 at drivers/nvmem/brcm_nvram.c:85 brcm_nvram_probe+0x400/0x480
[ 0.182159] Unexpected (big) NVRAM size: 1056112 B

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index af411679a14a..37593e7582ba 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -26,7 +26,7 @@ memory@0 {
 
 	nvram@1c080000 {
 		compatible = "brcm,nvram";
-		reg = <0x1c080000 0x180000>;
+		reg = <0x1c080000 0x100000>;
 
 		et2macaddr: et2macaddr {
 			#nvmem-cell-cells = <1>;
-- 
2.54.0

