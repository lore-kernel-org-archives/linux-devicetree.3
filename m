Received: from mail-oa2-f32.google.com (mail-oa2-f32.google.com [74.125.231.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5676E49F110
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 15:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262480; cv=none; b=hjLdufPuwJRdY6wo403InNPlmGwCIqExIE5UB/j66boG+omgwm2Sv2Gycg5AFrTt84lLh34pSwpnzAZYY8tcGDKFCTwMz7W2SMQxXJc+aK1gSjcm8z4aYisccOhmRrQSTx49FAjk3AGBN0TKnloDp+y90cvrGMttQHGxotDyrk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262480; c=relaxed/simple;
	bh=QDjh/o/EJT+5EmtaVLbTs0ss1hLQGrJ710TUSyqfmVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d54H8BkuduUDIubW5s0Rfbrb3oBjwQAsYA1IBe/HEFjkYdMZ3tyZTm2FD/Vp+DR9j78c7EGbS5jLfA0qeiN1dN+DU/oSBO/rhLmzsQ/qcLIegaF1itjuDS+kPinaLSKS5i9Iw5MqUXLbW8HZF2XwdJR+V7wO6cLBbtJ51APemMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Hm18PPaC; arc=none smtp.client-ip=74.125.231.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Hm18PPaC"
Received: by mail-oa2-f32.google.com with SMTP id 586e51a60fabf-46a63c34533so1968673fac.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 08:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790262477; x=1790867277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tf53B7+IQ/UMJpYYTrZ14GDqT88z18YWAe/D6JaHkeo=;
        b=Hm18PPaC4+QdbLnmTHiierPP5UOKmQHVG5C75vZ6soL6ZRhV18Jg5l3U/M6qF46pbE
         PEydjSvME7I5Z7KJs0XjEmBdTtef1SMutb8tQG5oKVDPBYZdPGQ0zl+mFw0Rr13rYES1
         k9f2IchF/wEqmHhE0v+c6jU+XvUqId2borXDfgra+ZUiGhHYM0nKEbDuBdeer6Hd219a
         aIyDLkKUwX6DdOnJZN8tXFnHuXnHtlvJZ5AT3eCxd0f6wsRHAYfA02eKEswbuWUYzeNN
         dIMEtUZzVHeMTLR9KbdpydyYDfWScdQsKJoo1H1ZuabvWeCjkqLzb+2oGGb1ZL7u+DJL
         44rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262477; x=1790867277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tf53B7+IQ/UMJpYYTrZ14GDqT88z18YWAe/D6JaHkeo=;
        b=ELIZMbzCmDzigttQOk6jHrT2hCBVbVLDk6MiTn6zf7ImffW69JYV6G9CBGGBHoiC/W
         +RG1QjSwCzewPANkG22SlVVvZf8tkkysc224zGqN/woukZIMIsqMej0GtMDR1CDCDrD2
         TP1HBGtvEp0kPoXE5rdR4j4Tz8NY/MXO740ObYwdAqu3UElY7N/NWulz01jWB71FtFIl
         FjzUCvqvcG2T50ntFR9rewF93A33SeGwuoQU47ld8EPlxrMaboCtBp//0e+U7LV6AYUA
         AQ1TQIg4knOMI956pQO2Kg0GdH27OZQYXKC1jD6bVsBp31HQr2/KH6O9D0op8ui1sYVj
         LvRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzN0caHV5rsU+zDdolmz+gWOhA1Zo6nmx/jeoEHoI57sHUGAwFz5Y+iXK/NJhM/sukFuR5iZ3J18UF2@vger.kernel.org
X-Gm-Message-State: AFuF++krL2hcdCe6HvJazas2yQjOOWGv7X0QiiYegnqvC2lPzmBLZgmG
	DvrG31xlPrkE0DppwFsjmsbjHhiUHIziJg1kqBORKLPY8Vg/x+kUc0FcPjPq87/QadWuHFt/mB8
	pbX+WAhU=
X-Gm-Gg: AYBFou2apGljgkxQ3n93c4fPkYWjtBi3wOiBftF1w7jxwP+N9Toh8LHhO7d1ubNBtr7
	lCGbrgppkJewtO2o15vAgWXjkY4drQO/FId8PH4mMylf5PC7gjFvlHB9urZH9cNev3iFUY6GxQk
	XPCnyDSBpZ9xdJQRtPQejBRmRvB9sx1mG29fRf+/4ukWXMecEKL3PWd2ST6yg1x1xxm+VzYFMmB
	UtjaklHZ9zChtXMdLxJh4cKVkiH0oJqXrcr03nh+1wYaEupdQFT7//6fG3wtpAjMDpAQnXShb1F
	IpuoCiZuFiUJCLMYIZsYmiu8O7YjG8YKRmTrYa963dH5ZpYZj05dBpPHBV3fmPHz8HZ/WY/fhE1
	GjIOvAdh2JuPF7+Aewj76loT8V52HrRTqqxzsdcMyREILfQJTE+eV+oxfZPrJL9sm/RgWID312d
	VSv9P8vZ9QTeiQZ6wYIhejPAxEm42qFgsgEJlLDUj5QUk8erPnlGWW07k9q6clX5DugemG5jZF5
	aMm
X-Received: by 2002:a05:6102:4b14:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7af1cba3036mr1226812137.11.1790262150404;
        Thu, 24 Sep 2026 08:02:30 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e24e458sm18438236d6.21.2026.09.24.08.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:02:29 -0700 (PDT)
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
Subject: [PATCH v6 3/4] PCI: of: don't zero flags in of_pci_get_addr_flags()
Date: Thu, 24 Sep 2026 10:02:20 -0500
Message-ID: <20260924150222.1179235-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924150222.1179235-1-elder@riscstar.com>
References: <20260924150222.1179235-1-elder@riscstar.com>
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
index 1caabbd4c18b5..1e5d7dde467b8 100644
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

