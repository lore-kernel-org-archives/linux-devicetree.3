Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D3A3B4432
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 19:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786131669; cv=none; b=LL0t6A80nnMFMzcqzHugm3BmRYicPrSJVjWL7M/9Di5zyrxo+dAGp66djwEAVjSfNbu4ELksVILCnIGXAv696aTfVfiy17M50asRIdnJQ4Yu7ftDQpbFT9MTFWPVyYMF89SXag9C68bsocSiAjnNzgvZkB5RYFehhqzLielnRLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786131669; c=relaxed/simple;
	bh=BtmQtSAcOc1sMwXsSXHd/N0LJhsNzGr+XDlMMcgHhfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sTySTAjI95yGOHqXZ7zLIvHuGfBRqK0Jz+OXdKsj4fDePG7oLxoCxKnQyvzZMLuZswGGwOwo63y67cvqZrbXgIptgj/iVtkn/BpRPehbESEzHfvaORbS9zxUwN6T+wgCbeGVv+z0h7g+g+x7k4pDatjeIxRjqENC7ecY8PgjjEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ITG1RMGL; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ITG1RMGL"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92ed3993c1eso198958585a.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 12:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786131666; x=1786736466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/KJ6sckLCdEVJDbpdFqbeYqPNdthT6c5yyUBXrsMRU=;
        b=ITG1RMGLlJNcT4N6D+H2zBvMUKVBItYJwkylrVl3kCL5J/vmB0tct8n7JTnGCoU6sD
         6pZJ1W1Rjn27hSOxGg7C5i6QcLRzdNiCUAZQeN6FhDBjhX8EqksZ1Onbc20rJl2kObB3
         1blCGNJatFXKyjSvd2pOn2a6cPTI8+h+xqDZtFjrUzpqpKjAcYZAgXKJNrwwmcWlPVwn
         meU9FcJnReiMtNTfT2pv27Zrhh4PHPpGDgQNYlDagiIWgYVKHke/lGf/BVcw9Tt8WYnC
         zHzjBmfRv6/xPm+jYNRRrcwBuIzSj3TqWQN8H9C/worxVkrllDdj7j43kP8sgfiNtjS/
         wJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786131666; x=1786736466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H/KJ6sckLCdEVJDbpdFqbeYqPNdthT6c5yyUBXrsMRU=;
        b=N+MVs8IDWMgp4cpGEqxCT8eQ2GOL0C7HTNwpuhBS5vdlMIrRdS7rzVIC0jUo8ab7xC
         Q3NYYTC8skVXRqXIp2eisR/QAsnIaeK1HnaIYRG0E3O/dRt54PkIQ0PmQZvXI8dXpaZy
         g7Dx6Qh+0gFzHvw/NMMuUfQ+tzOQwKdtggphLvXFGI/vrKc0KE6zMRD1j8T10AabQDUD
         293rza8Ie2ru/bbGCydiit4w5zwHr2hGCFT6oOEzTT+Pxa1Pk+FNHi3m11HAOR/v7SzP
         jWz8i0E3eKtD8slxoqzlGtT99fHaieaVk3TMfF5p8vlCBeQzZ4DubDodxXH2M13x0pB9
         fOdA==
X-Forwarded-Encrypted: i=1; AHgh+Rpxu5d/Ta4hMfgmmBkksTY/JWqy0R3UZHIDzTeUlhXZ8EKgzijtCUQgp+QfXDW7A6bNfIjhD+pOimOr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2LJ5kODDf6jArM4rzRY/1gZqo3G9DlyqAj1d8yucXmx3vQ3BO
	cM3pbokp7jOujQEnkuWD162MdRi1pHDi0SeqK5RixntNBcwCDGfhKUvyZaQdGGcIzWY=
X-Gm-Gg: AR+sD13R1G+1pmivFiWDLuhcmbtuf8vuUOjkseGbLL86+oSsGiJ4/Wbg9sw46hWVCuH
	PXFYsRLCgfNzKXuMvt6WcYk+0hHTejV3xqd9BtJxSJrnTn3FXkhJRMH5a4T8XMJ2tx3HkBegTi0
	JOtP7gPkz//eIsouqkDBGG0qUEPDSaTKSxt0ofPvHVRUYB1Uwz71cWEt6lvSEhIP3ZCb+77xCnB
	gQvKa6B5g3JUf4UQXgmAMBB1ol8pgK0S3LNunzL8EgwJYNJpAGVJxul4A1EDJcs14MjDG0D2sUl
	ISLFiu4eXiZlTeF8GgqKLETLqCsLCWmC5N8oyNU6WQ0OAV7p2rVfJh2LhBPArPmLb2hYGjWNQBi
	YRxTpuUg2vwPvar4DjuoU4wCnWwhHedZ6Ck+tnyTE0POTsoMa20hoqsqHJUIVF3DUrSZpo6e1la
	FufpJe0D/YKJ2hAVikEpHfyeZn52qiNGA01fBRvsKBFbK9jKLkjZnznbYLxMxElESG
X-Received: by 2002:a05:620a:690a:b0:915:5cbd:1d96 with SMTP id af79cd13be357-93671f1a852mr727400785a.33.1786131665987;
        Fri, 07 Aug 2026 12:41:05 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e03aeadsm219786585a.3.2026.08.07.12.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 12:41:05 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH 2/4] PCI: of: don't zero flags in of_pci_get_addr_flags()
Date: Fri,  7 Aug 2026 14:40:56 -0500
Message-ID: <20260807194100.455599-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807194100.455599-1-elder@riscstar.com>
References: <20260807194100.455599-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The flags variable whose address is passed to of_pci_get_addr_flags()
is zeroed before assigning a value to it.  Skip the zeroing and just
assign it instead.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/pci/of_property.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 505226b876c56..22fea1905a080 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -82,12 +82,10 @@ static int of_pci_get_addr_flags(const struct resource *res, u32 *flags)
 	else
 		return -EINVAL;
 
-	*flags = 0;
+	*flags = FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
 	if (res->flags & IORESOURCE_PREFETCH)
 		*flags |= OF_PCI_ADDR_FIELD_PREFETCH;
 
-	*flags |= FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
-
 	return 0;
 }
 
-- 
2.53.0

