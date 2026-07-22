Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC48441CB54
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752283; cv=none; b=lnNuYBNS0KOd2NJcdPrzUGbhItYB78gNEbznh8/o4Nohv0J6xF6Bu2OVoTf5Dua7FQ4b4CXn9UI+vDe21VodWzjuIliHK/Obu1qEegEskdhaH6DXOH2MuTD4GE2SMZDwLOItHE1ngidMiB7m7ImHziTobQkxbYfAFhQ+hcK8inI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752283; c=relaxed/simple;
	bh=8lEKDzieuS8p6YYUTnoJFqUQqAiPzAliCMhOYKur1UI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=snTnTQ956EF4Svl7GOv5QeJUr7tU8YDS0buJ8z74qCdRpm/aPYSqywPap7lE8pzQJdZak0wNfxbRCZ/QigSfH0eKjJ0TcNXp+D4FkrBv+ddylCxDLlkEzJuz7/m2Z0IjXVtDJ8hfh2onhpBZw4z8/sSofBRvOlRtpUHtMReeR6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h2PNUPYw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KmXGktbm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h2PNUPYw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KmXGktbm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784752280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3vYZJYPhffpO90014/LKI7l3gphBP49CHSvrEJckH80=;
	b=h2PNUPYwejCa48J9W364fFSUWU0iHcMFhoqT3yiIBeWuRE+dxNINxdRBo3mj6ZleeztE6T
	XRylkHLOxlQC1z3DajI7x4CIs9QDeK3Q5CMF4b3oeJDyiSw782ID27KzQz3kyaRb81OqrC
	mS3pEbJCsdLvxYfsSqP7HvrBjbhoBoo=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-j7UEFnb3OP-Kif146hqQrg-1; Wed, 22 Jul 2026 16:31:19 -0400
X-MC-Unique: j7UEFnb3OP-Kif146hqQrg-1
X-Mimecast-MFC-AGG-ID: j7UEFnb3OP-Kif146hqQrg_1784752279
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6688d64bf2fso2748154d50.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784752278; x=1785357078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3vYZJYPhffpO90014/LKI7l3gphBP49CHSvrEJckH80=;
        b=KmXGktbm1UwxzFUiqvD1Ho3Z4fem0EPTBDxaZR7AXBGorIewGven5r4pUK1c1FSMAH
         ZR1yrbd/Cz2K9I2ZUSemzqKXZqnOkSX3FMBb3NTVPye+EtEIpK1punhwZrOVfUgrRGZ+
         UneF2GWLBXQ7q4gqPjZs9dL17+RTLoP47FmSyQTjV57BYvIMnFL3nVCXyODjG+uYcp0n
         5Y3QwQj8iphfaffVk55u88jGhziksjV3CxfI/qyxmDFmrofd3wu3KxOsgwtvSjfPDZ6I
         m0GpknnUQQPq5qifq6mTVNnB2t8X9uGK/Z+FEC4+6rLP7O4vY/t6HCm7Z95HUR+ExzzM
         VONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752278; x=1785357078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3vYZJYPhffpO90014/LKI7l3gphBP49CHSvrEJckH80=;
        b=P5XUfAC5AdExYRoV+uBZUHN+5VcCKAo8SNxHG8PIT89o3juRIkUhpT3kdvbohjYzR0
         250CqdQeXuTwEa2H3R2Gzx6KZX8XUE0vNCis+YZdcFROA+1GkJpE7CQcEKV9m7Yr2YYa
         ngbbUqwvvlLUEGCAzd3YxvodW9OcFE8hFCsEcD0rDuVDj8nIlW6DUXhspEF1oPvkMezP
         9ZY3cesEiEQwpvAwU+sj8WMGMYnVshphzPPyHLe8PF1MEzuFzYi4KhjGPlbK47v/y29k
         l93ZpxWobTw6ZBRFVXY4OB0hIykJLDSpC+OVDoBFZ08hz1vvKTKNGa5AO/TpSWvrl797
         JK1A==
X-Gm-Message-State: AOJu0Yx1aWVP0AUb1iSwzCSf+Yge8RrkXth+9THL1f2ZnBTzEuW3LWPb
	aETR33sC4bfB+FphCBn2fxbME+7VJZcTMW7V9dda9P/5DBQ8VOBkgIXYWmcfK3tjN+9nQ1jcI1t
	BCtZG202QnDS+RfPBNGCtqIdWNE7TB8TUkIyvdYrRnHkkOVpukbbhVNL7mvs3B8E=
X-Gm-Gg: AR+sD111TC6Fm7ICjQa2LIZLscaG4CcDnyLKFlAsWMPxZyTkmAmI8B2nY6Ji2+qkxN3
	i8QMrbKWE58fA8D9FPGumOOudLwoeYHkXLjVx+QOaL9ndegWwS9F6uEPjVaQp9suhzFOMEg5A/j
	eMvqJyHaFJzCkAXg+aePMrBmSnk6vtc70biUHpzQf6UGMnCyRe3kt9NoQv87bnoWd15fy7OlhVX
	w5HB84DiDhe2GwXJIZzrIv8Ge8BkSn1e07BDPYwC0YwKXTqP/KM995cGlHRnPdAHi3lkRPHUOGt
	mNesJ+J4NMHi5BBMLkx6liAZcZHzihv4DWHGjL1olK29kmUU6rp0qQ==
X-Received: by 2002:a53:b193:0:b0:668:8eda:3dc3 with SMTP id 956f58d0204a3-668a4bc45camr38852d50.21.1784752278637;
        Wed, 22 Jul 2026 13:31:18 -0700 (PDT)
X-Received: by 2002:a53:b193:0:b0:668:8eda:3dc3 with SMTP id 956f58d0204a3-668a4bc45camr38841d50.21.1784752278064;
        Wed, 22 Jul 2026 13:31:18 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668906d9344sm1923573d50.12.2026.07.22.13.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:31:17 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 0/2] riscv: dts: spacemit: add eeprom for K3 CoM260
Date: Wed, 22 Jul 2026 16:28:46 -0400
Message-ID: <20260722202848.1817988-1-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SpacemiT K3 CoM260 Dev Kit has two eeproms: one on the compute
module and one on the carrier board. Both use a Giantec
GT24C02B-2TFLI-TR.

Jennifer Berringer (2):
  riscv: dts: spacemit: k3-com260: add eeprom on i2c2
  riscv: dts: spacemit: k3-com260-ifx: add eeprom on i2c1

 .../riscv/boot/dts/spacemit/k3-com260-ifx.dts | 15 +++++++++
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi   | 32 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi  | 12 +++++++
 3 files changed, 59 insertions(+)


base-commit: 199380e4d8cd22e539a08d4949e9582b09390bd5
-- 
2.55.0

