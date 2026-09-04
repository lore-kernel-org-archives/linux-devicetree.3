Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71DC4A2A6F
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788529578; cv=none; b=SJ59F6n6e/jIR/UkRw6yIUYDhfyt5gTnksaGKdiEyE/6M32+8rRh4CiUEpKaEtqTyam8udpiXJ5YWiM9IA1A4+xSUxSiFXJ8jCXfqYEaJ3TwM35c8L6Mj6nwMvloQ+5A6t5TZuXMA/tUHFOd2X2ETaWVBTj2KrSIOdZmblZwJwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788529578; c=relaxed/simple;
	bh=qyD4bGNfcFSzPNaLFl2vhb3CFKp/crvP/9Jaao9JAyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBZGJLR1yB3u2xxPKMYLpShjOFIEBaS/H175LR8U3cFtFc/1kie1gxIVBfU8PxT6FlfwmgIwUXekntofen4g85nXxnhaJ2sOSpk8GycKex+wUpxcMqCatXof0Mgrjy7rCup12o7TgUeTgAPPRTowAKbTv0gqabm06F/LzyQrdRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=DK0H3ENh; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="DK0H3ENh"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5276d598b96so10620481cf.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788529575; x=1789134375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAwqufnwuKEV24w71YGykBZDHshBllwrVOx0ky+yHTQ=;
        b=DK0H3ENh98CWzmnIXzijn6sJ2jQjxAY+E1n+HO+SSMMbr0kgljjb0FRr5UTKghzdCR
         um6tA0pcevfnV054cMjT9n9B7GsixdFl5gdHHZpUJXEG46XwXj4y40MgwZngrYfSm+6Q
         eVDT4fxr/ot4bRDwd+ucMXK9Na/zujsUkl4hYIlYiSYF/pW1UfILn9MI4O4cXJMDQJmk
         W95aptIIPyk2aLfiSf37peeQzF1cm79FwydlcrELrBYpV+locayjGI+MeJuRj/ASVZBu
         XLt+yY/3Yhxk4e+2DOPvkcos/a2VZXp1G6FYbPglSI5ZZx+P0UF0WmmJ8+VQ5bm9867W
         u+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529575; x=1789134375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iAwqufnwuKEV24w71YGykBZDHshBllwrVOx0ky+yHTQ=;
        b=SY27evK7Y8W2W+qJuemNoaY9+uUzGPyf0ncmccTqmzbg9QJdZgerJ5jaLaKhj21A4s
         2IuF/0NNEm1QTVndL0anVHqPDQoPq1QKKP255uXQfs+RDDqDsmTvxj4ZBvfq3v3iEaI6
         aJRq0vW17zxlp0yXmkAxW/zQAuofs+oTv+8UP+jMHQu5c2zYV4Bt+HqvxvcIafkkuuoL
         Blm7u77bWkqtqO9sYl2+gBiI5t9qoyRVWo37037NHIc2V23TZWAx3dgqE4cBQgEn6F4j
         79Gex2RVCgzWI0q6sDm6NaO+TNRfiLoLkOVOaxSyPL32u9EdlauGSNnv2Z/FceyBLIrz
         6m4A==
X-Forwarded-Encrypted: i=1; AKwUvBzokaLTl9H2W9MF7QDFWkMa+FipKGeqVg3DzSi8sPCipC5n64q/35DwUawBgpanBXuYWtwttAkmezxo@vger.kernel.org
X-Gm-Message-State: AFuF++m0gwH53+bRFB6QCU54k6B8I8YHNKuJLPnHFmG58UeGc+p9F6mf
	IwOIr0addBkb1erFbERSVqQjpmB95+CCrQMGJZHPnivSmKSqbhrhTjSL1rzxyBQpHIg=
X-Gm-Gg: AYBFou1CZ9EFWZyUGaMyp87GoLgoCk6Xa7SeDuLi1z42aHt1eb5jgafx6rUrCtJv/Cd
	8Ia6kdOjC/F1ZUpeeGjAW93HU8pXuafxFueHzo635M9W86INfDKk2ntlqCX7mm78lCS9dX6LH5a
	2bQ9MOSuJI9CJJwMenXQjcDvpbcl2QnqbRz9Y2E1yM5d4aTP/K6Tj1tkmMbivH7mEQ1hLtOD1uA
	Zy393rI1QjwzlJ1c/aefx9P8+JqvvQRkEMm5BS7xu00sKa8qYQFG5Ch2qHYwS4FSVVkdvvQ166J
	m7d8Wrq7XRz3NjSmTa7hzIuodBxZHVCQcY8j/ENM3lm1nHRKGtpEIgRqnp1i+ZEe+TQPezxs13s
	VnV1pY0L0crGWIH1BA6YgGvLFy8LONsdswudSIldwMBifnYgVC9OFRt9kO8elAA3Fyu7SUV+jLL
	Sa99kwKKrVxMgaxwH30tUSoAWrXsik6hb5Xv1KxE1AJy1Oa+h/+sjJssbtyy5f+ihB
X-Received: by 2002:a05:620a:a518:b0:92e:7d53:8e8d with SMTP id af79cd13be357-93980434f3fmr510380985a.27.1788529574458;
        Fri, 04 Sep 2026 06:46:14 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fafc3a7sm211613885a.14.2026.09.04.06.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:46:14 -0700 (PDT)
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
Subject: [PATCH v4 3/4] PCI: of: don't zero flags in of_pci_get_addr_flags()
Date: Fri,  4 Sep 2026 08:46:05 -0500
Message-ID: <20260904134607.1856121-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904134607.1856121-1-elder@riscstar.com>
References: <20260904134607.1856121-1-elder@riscstar.com>
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
index 8131aa1b0b3c4..fca522f70187a 100644
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

