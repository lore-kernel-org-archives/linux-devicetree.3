Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAFB3769F9
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 07:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472579; cv=none; b=ptskWq1Lg/M/dsDJXPzuYNhGa0N4VvXXU1gGmgwTbNKIA0vnxK/AwufKwn6/xLWtn+rVChZgydJVigPOFgXyJInMti34ERRADa/H2OAdXHPSMRUsMM/D6xcE8kfTeMptn62NlWSZBdRrRIzFtXVpK61L8REssHIc7YJrob1M4b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472579; c=relaxed/simple;
	bh=hqB+04VEKStjZSfYkWExPwQnhl7JHTVyVAQR6mFTTV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zh/+cLyZZHaurDJP46468452RqsiLZDRisMeufF+S/UI9nNdMfZOXt0IM0KjF+hQoMg5qNjfeNWMrTSRsZNwhZ4Ns43I7rB7dw0T322WBf3fkmFlwwcW6yhXapFzugea2Wm6GwD/rAKkzjG0ATjVkcqHr3X8eM9vgeeBllhlZ3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtQyIHTq; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtQyIHTq"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84275887a3fso180768b3a.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 00:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472578; x=1781077378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7yqFw0tWdchIDC7Bn/I4SbgaqSJ84oj4eVuugZh2/Y=;
        b=gtQyIHTq/0N50W3M6hNHeJoYr3bvuACS1IWBTIMo5H5ny40UCYSNhrzac8Z9k2ebg0
         N/f2tKkjGepp7hoyWuCneiWHc0GDMzrfQJo4XbDcV/GZvoAI/W85WNHE4rsH3pliN5A0
         9xMwSDBJHvlV4zkB4IayrbRjGuVq7/RO1rVGedk3rEVqa1FuA+/x/Ar3GHh09KAjLOjT
         hVbMDdn4MqXGMriECiEB1bvZRJy6MeGvsl/dahugGihfg05KQ9lt5ZXJMF07sGBlrk7r
         4OLbp/gwBdIY1qqnry+eRveVSgkWdGP4I1AGjAZymRLLss5SFyuppVCb8HKjQnmc9h4y
         ExfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472578; x=1781077378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l7yqFw0tWdchIDC7Bn/I4SbgaqSJ84oj4eVuugZh2/Y=;
        b=FLF7IEhO9tMwOa2gwaCssN5fKndIe4IS01MYziv+CJ/Rio+32u/0lm6b7/kUZwRqgH
         x1KHFrC+E4NWqDXcgVvdQBxwGWIOdn/jbOTatAedx+/ZcZ9Nn3pV8dTQ5WOawwi+V7he
         3ewXb4DR79AKg2Ybu7GKCVidIEhV8vUOqfRgwBQeyD34Qbkv2NZOTHy+NKHLiOtAJ6Ww
         N5aCNwXBeYwcZZ2VpilSU30V6ZcecEltBPxqSPLh9MYmHQkCKlipe6E78d3x7+jS7GiA
         a0FExRI8vH7D1K6gc+kidpllD9zUnHZMTIs8nD/a02tcBcw38YJGHADht5zwY/Pa0uv6
         R50Q==
X-Forwarded-Encrypted: i=1; AFNElJ/vtbyKZ0dajuVlnMBUxQ4q2YEGGbJHeBRROFwwtgW1RNhzBEr6iaqx8Wj0/E7MdchhPN8xw7rmrAPy@vger.kernel.org
X-Gm-Message-State: AOJu0YylH4rzjpGFLBHdKT9M82H3aEqUhiS5gcwXvC/qyrJ7kBLVcR3E
	DLNyLothhm+CEmIabQbCM/JuXd+JL8bu+K7spTTBSqS4iyfXlJw8m5An
X-Gm-Gg: Acq92OGEEjTJJDL9GffkaTIAyyq00x4aekmIz+6LCXbQ15GonvblEbLS0jKnbZjvqKB
	q06W96c509hPMscNUABAqF45YUM8wS3VExCg1P2dY2YR3RGBAwYQ9wFIvfVSV1U2xXlUta3t/LB
	EkSlprijdz2865xewQ/1juj4x0G728GVqRNyRAMxNGePWtARvajW5lCnh6U223mmnvyaoD1kRjx
	ml2aCBulO+9LX2h0w6OEZ/WTROfxboMJAZeEceWIIifHQ90XcvtTy8ZzmSCWHekMojqyKDVd2E4
	61XRN1RA4BsXyS8AhNgSxxXIl4eDAVu4ielAoWe3Tf39BAhc+Sw1cw9Tlq7mP+3+m8BUBGfnaEj
	Ojb6lB41qDRxK1iunMzK6yGEMeTVYLn8PF0hReaKIQ57l/aaJyV6JVnHiUeQSeryRCdDBBhRCyA
	qey0k8dG7VLiyc4PpALEw/a8daB9KXxuY7x5DZ2/x4uxOaPwl+zlr/ZRjUYj5hkNX9broFXPzT+
	6mVWzUtOq5g2eRIcyq72y8nz30rVErxt4JEgh3SA8djFgCXDLnKeYShkNdzPm+B
X-Received: by 2002:a05:6a00:90aa:b0:842:6344:f33a with SMTP id d2e1a72fcca58-8428596369amr1682866b3a.3.1780472577913;
        Wed, 03 Jun 2026 00:42:57 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm2161223b3a.42.2026.06.03.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:42:57 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: aplic: Add Tenstorrent Atlantis compatible
Date: Wed,  3 Jun 2026 17:12:13 +0930
Message-ID: <20260603074222.593243-2-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603074222.593243-1-joel@jms.id.au>
References: <20260603074222.593243-1-joel@jms.id.au>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible for APLIC in Tenstorrent Atlantis SoC.

Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/interrupt-controller/riscv,aplic.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 0718071444d2..d4e17861eda4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -29,6 +29,7 @@ properties:
       - enum:
           - qemu,aplic
           - spacemit,k3-aplic
+          - tenstorrent,atlantis-aplic
       - const: riscv,aplic
 
   reg:
-- 
2.47.3

