Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06428389107
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 01:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788225234; cv=none; b=HLgG4F4bfA0OybGiZHrlYXZVBQec1y8sef3CRytgEQn2GQVFk9P3OFXx0FxK8F1O/fayp1Buo/iAtpYAFx6xhPq1vrvptD3DqgJdM7pbY5coUPlsuSNMArVh4zOZgsemZBEXUnCkdmsdH5u8jg9AzwUfvpTwPr/xrQCSOfet8PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788225234; c=relaxed/simple;
	bh=BtmQtSAcOc1sMwXsSXHd/N0LJhsNzGr+XDlMMcgHhfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LKRNT+JO9sYV3gDVDHWw1LHXQ1S3xiOUN6dxN7KtEpn0okAURdG8CHcncGpQ+izKhFqHN75o5vPJd/7tNxQmdOdGXTQi4JW2sNwA8D5TjQBfDtF5bY2pfM6E/w/gSjLKZpGuWk9AzSpYEkygr3vgF8K3Gq/ZwQ1Sse8gao5vNXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=lRlvCDHO; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="lRlvCDHO"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-939309d02d6so181798585a.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 18:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788225230; x=1788830030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/KJ6sckLCdEVJDbpdFqbeYqPNdthT6c5yyUBXrsMRU=;
        b=lRlvCDHOY0CnTGzYJj8BBM8XPLzfe6dgo61eiK5IkqQX09KIxpxXqBmK3jlrni05s2
         o/aHPlIRHJ7vkpXhqUKPLOrMDlrbvKYNp5H477sHmlmkHyKfK3+0NMWCAUriQMAqfZil
         N1PKEQrtpUsnqIKmau3Jck+gROOAWFaWdba9HS1Smd9Fodnalbtg2sIr96noNtKVtSP0
         1YrxT5BNmzRWQ0R/naL/dNQZVaLLocbxAXETkqoupQPV9Ra35Od45LRW94sOGoMDMwjU
         EXpbmPFDY/yh9wwSftYlJiLEYaGROHBwGNfjGYqluruqJQwYjwsXkd0+w8XbDYIeU1Li
         KSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788225230; x=1788830030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H/KJ6sckLCdEVJDbpdFqbeYqPNdthT6c5yyUBXrsMRU=;
        b=Z4NnXIeY0AlFxmIHZOPWUaudSoVYE6UogbzqgM0378k8W1E4lfiamEeSjLB7d/iKxS
         vFvkGfn++5w/a+XQu6WHMqZe0wRMSahIFGaoIYbBVzqxSiLwcXJqGfrZREcXmKX+C/zf
         i9eeNy5D/JTYOjRVzj7F4twXwIYuf55m8xyx9HsVGxHTFPlLpoh3UfjP2pHJDI3y34F/
         ubZZTat06abp69OYvqAWWQ6F88M5OmdSqNDxU1C+HRqfUmNZlWWn5RJaJ+rXzcSyQJL/
         vC6PZcHI3I0qwmxyh920wsfieSvPz8u4EOPexYg48dLLZ/feXebS+zgYkAPiR45LFpXl
         5Muw==
X-Forwarded-Encrypted: i=1; AHgh+RrSxsKxyi1ZJAk9PU3wzlayfeIgcjI0+O3vgXL+hV1YyPXp7Fk665eA7goOHCRcZAnE+d8HcLlQHKTk@vger.kernel.org
X-Gm-Message-State: AFuF++mFc2mwROUOGJkvmPgvvLWxwQBGjl5IWREgbDdj6XJy15zfOfIy
	kKUz+and0RHlKILUzUFd4zjFshd0QtO5C3j9tLe4x6m8A+92VbKMN1NeNhbZnZQxn2Y=
X-Gm-Gg: AR+sD11YpMaCUaSGxDeGEFtCVEPIRjQqw99dhVwhaAVXNMmbAlOjdLTilzNFSJ5hR3I
	uRR00+jS58URGtIrtd8y1GjjHWBx/qOmY7FWlll+/mzSgAfilLS4JA5uFXe4OfDwG09/WUQp1WD
	ljmZgW2tGxh51PbyhVDYSsQGImqp1asx7q+3yntnaiCBgV2YKd4UgX/ulcoqWQ+yb2KffsATds4
	AJW2rMLX5t5d3a83clxES9oMXoeZrn5FMXyy/4H14K0548oa2loBfnKwUQre/vR9oPyx3RysDHB
	yM2ZvdENSzyhsMxm2jIB2bKgSlgc1w+X+OwLcaCScAuejrz/2CxlupGBpDe3DKAAqhyz5j5+Axl
	e6TPew9F4Mljzk3drC2F5SqrrrW/J3Fcd6M4iGmW1cBbmq1USGBmfV56p0dyLdSMtRjGmGdXmCv
	bra7uev+H7+Zst1qxm1kGCLwqgIIlVTKAt9yj4p9uEkO2/t4Q1mEqTPXsk78UDYAwn
X-Received: by 2002:a05:620a:319d:b0:937:2e9f:70a8 with SMTP id af79cd13be357-9394819fd3emr665302685a.39.1788225225778;
        Mon, 31 Aug 2026 18:13:45 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391740a307sm581347285a.42.2026.08.31.18.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:13:45 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org,
	saravanak@kernel.org
Cc: herve.codina@bootlin.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] PCI: of: don't zero flags in of_pci_get_addr_flags()
Date: Mon, 31 Aug 2026 20:13:35 -0500
Message-ID: <20260901011338.1323243-3-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901011338.1323243-1-elder@riscstar.com>
References: <20260901011338.1323243-1-elder@riscstar.com>
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

