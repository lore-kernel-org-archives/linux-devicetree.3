Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC11B38330E
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088475; cv=none; b=RjxGklNSv0ZOs992QHR2bWt7kWpnRSeIo6LLVqgsALaDJrF5I+dyT3tFCqijBbHgDiysMjISOBc42Rhg/EANthOr81v6cx5I9ClgtM6SeGZtjjuELOHPkA+sNbEdQ+YKlSHC3dsW3DxtAFaKTcdz3zJWNimW6HKZ41tPm6MHJmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088475; c=relaxed/simple;
	bh=xG15iNNB4iSjwj+E1PRwG/+wOUT70QeBoc+dFwOCJV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nEVpYomsKcbrt6f8tEZ0uGic1W+MPi0lfzzlPILmwYQ7cRqfNA0n/OgMtK8/mIAolP3C4uEnbhwY9/Nf8lqYqpmdbKJGzaJXMlSiV+FGtarx2UlhryK76iTz7v1WilvLEnJATNRfCG1Ldb/wgjqhg5M5teYczp4s6ha8OOGpx6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=Ax5p19kv; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="Ax5p19kv"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47de008b020so1077721f8f.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 00:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088470; x=1786693270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSYQ6Hen3CMyNgjH1etqMkMNKiGDMJrXBqBRp7LU9i4=;
        b=Ax5p19kvi2vXf458Vtr7VSmSKUeAsEiwbzW6W9ut2yhikh15RrT3e8z4Dbx48i7zA8
         IEFiM9g5xWk9rmdtR8C6+0xvnwZ8+a8tfBAMXCs7F3MmAr2yTbOOAjR788o0RphVcEN7
         c6hXIA+TyqdXrxCWuixW1dWKHIg6gqVkkHJ57kubCf1a7nIwuXoQ9SarYZtp7+FxM62Q
         1QOxIJ9wVjLum8x7IlZBDrtzREajw0c4VvQytMp6MtJdecDT1vgPtBg/7Td2wl+Qm5eF
         D70Hloa6KAEcruHDZUNo8tT+UjteVqggPIhub1V4NtjZyJrKx1vsuqlObSJHbn98+Up0
         +jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088470; x=1786693270;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSYQ6Hen3CMyNgjH1etqMkMNKiGDMJrXBqBRp7LU9i4=;
        b=gtC/O+gLwGL5VdbUB2SurWS6wgwZe+l2ITEfAvH2NAs2ZrZUJ0g2Kc5xnpQqPQcVTm
         GTgTrQhj4S1o0FzhNRxXI00TaMZpqvAmDyvW2h4fwwAcBxZi1l11NPgRlFbki/+WHDsR
         58xNI8O5/XSKoAU1s6a8gW960mKxc83kZOPbzsm5pyP+smaDRUP/VnoB2kEH2b15yWmW
         yTT3TH1sqJiluWJ3jZ6QiubMQN/JnZHXMavpqD2B0ylP3D6gNc90FZEtplSe2ZZnYPTA
         KzmZWzqEImXfP0+zq5EgRwG9m16cQU0FXkdgnJEUPOAyuCk/jIiQtWm4sWlfWzzOVQcJ
         GVvA==
X-Forwarded-Encrypted: i=1; AHgh+Rpaq3O/T2xBXnanrR0Bi6z2JMulvaSutO+pXTIj0H21IHv3G4e5x0pTD41prlaqbFT5l03E6ZXtCzmH@vger.kernel.org
X-Gm-Message-State: AOJu0YzsIPE4Qw86zHeT48sfLR0426vZ50s6LPlHHQNK0AewUfjoMZG7
	EGgyxE1K+gPnetYsg1jZZHxo0KaOsZLeSrqMuHUsrY9hD1Pf/1zaVH5qKsPeTYhFqtfI
X-Gm-Gg: AR+sD12AWkpWUAfdjhWByD6WnV9PGT7MK2e18nqM7zcO2+waNCE6zNqgontlZKX442r
	bqh6jruyILCSp2aoQEawjimaFBdYNHLN+bzTPQjGNNf6046l00G6HK+HIyJDEcwUPNXnmCYGnnz
	fTbRIQ0N5FRQtcet1+DxxOkB8qzcCUloHmLr9GmP5l1C9hRcSbZRLfyvzd/xtHww1rXledd+OC9
	DG23Ifav6cCn9M4+WKV/2zmtJq7aZv3T4f6OJ+cYOxE/KXmmgz19A6p3krYIYZfeSLOr1FzqeXH
	5QkcNIbhAei89v+aZUJa0UiV7UidHCG2QvhIMB503KrlvezDfdhu+K2QQP9pAy3zer5/dPJlO2j
	mKxtrUVEnG03wRfBRdo5eZgSrOVfxUUTetY1hDzZYT7QqsmdrKgVjYct/4uVOZVfDzI1zc1Kbmb
	4ykny+SRCsr1TcqfkW1yJ6lVGXHr1VXpk4MOnQ5ecpQqOiw3d1gZNS3fffkiP6s0Q=
X-Received: by 2002:a05:6000:388:b0:47f:8cd3:4bed with SMTP id ffacd0b85a97d-47ff8694ef6mr16251068f8f.5.1786088470034;
        Fri, 07 Aug 2026 00:41:10 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:41:09 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 6/6] MAINTAINERS: add Bao hypervisor entry
Date: Fri,  7 Aug 2026 08:39:33 +0100
Message-ID: <08c7768ee758e2b65ae50dc9b801355f378106b8.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry covering the Bao hypervisor drivers, the
architecture headers, the in-kernel and UAPI headers, and the
device-tree bindings.

Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v3:
- Concise commit message (Krzysztof Kozlowski).

 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..6a81a8da58f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4519,6 +4519,19 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <jpeixoto@osyx.tech>
+S:	Maintained
+F:	Documentation/devicetree/bindings/bao/
+F:	arch/arm/include/asm/bao.h
+F:	arch/arm64/include/asm/bao.h
+F:	arch/riscv/include/asm/bao.h
+F:	drivers/virt/bao
+F:	include/linux/bao.h
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.43.0

