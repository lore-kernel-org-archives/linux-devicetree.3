Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796A815665C
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291943; cv=none; b=Vl9/Y3z616/RZDxlxmKylxM7Gr49akWkC8T1yaY3/z8ejIb7zOICKuOrYHM6rHT5IYHry0sEmylVfB5uaK4X3yE6IgOsKzZwSfUrXHgcCrNbfrBalBoR/BSxVDGpUzh5ERDKvKCZrJXqvgefHUfHHwa5DjLWAemD4OjwtRir16k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291943; c=relaxed/simple;
	bh=hAQpaUeqyhjDCK1Iia1roJOSowifAjlE5E49UsNO+Co=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BlSfdyyiWUA+Jm6OvblCPDFF/KqwpqRCIjl7Ty9YnbrrcW/iP5Dw6BwWhXxosD5WT7Oo2NGm406C+xrgV10/UhRWem1AvyAM7CDwsFAjTjvC9DONyTdK5jS72HBM/0P9FAb7BK6MYJUGaufVerNILMMpX+M2+ullQd3Uj4dIxP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4F05Xhu; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4F05Xhu"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-366330b6751so4003088a91.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779291942; x=1779896742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TpopC6v8EomR9W5ZKOKbW/NCwE4S6cDDtON1l5Oqp0c=;
        b=J4F05Xhu+wkAHwRKSoetlW2h8nuFdA3JjSA8swplt79fLowafh30CDJH9H2N1CX7M5
         OCjNpFaAXjrEnougFssXB1WPqwXPYK4RYDc7+DUZJ+JgpwO2J5MP2cD6GEaNKUvwkMFd
         XS2dxPlHZ+NsFPtrjHomGZG0qPRxMYLM+ceTZATu6vNOIzaUZqwIBFkq1e2MV63pyk1H
         k7j+UUXzFGeIXHQh/4vrv2bM6ArNz8t3vAzb133bNAEzA55NovhwkSssekROgojt5dcN
         rXQOCTbxlR4suuhQVbEF/cNxwPf6rNLemZ4CV9b0H/RAZyUVrXStrf//d8zWiDJAIi04
         VHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779291942; x=1779896742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpopC6v8EomR9W5ZKOKbW/NCwE4S6cDDtON1l5Oqp0c=;
        b=IEp5HaD7mM9WH+C3WgPTe20tOtLou9c7iJAgoZvEQR3DY8bDNI2duOb1CbzmEIjm6/
         4Qdj7MriBzya7Kf3g0iVvhbLsYkYmOknVK6PCEkiLokoSKj8uH4zjfpg9nO6EgbfwN/b
         Igu38ZmsPdx1d4KPmthKfRmMQH9gbvLjOd7kVslsKkFaFOAIG36JuhwHcM68paz53aWu
         AiNX2lrzkufjqRCzk1qK4GgvmFQrVn17d91iKDDb8wxc+cwadLQOFYGTfWHwBJbAIQkU
         SSRqVUczsSKHAsMWqoYVCCTsXdJYCNcnsEYJrsHwwZ22TtgKDFOsLdLndqmmP0jXWove
         INyw==
X-Forwarded-Encrypted: i=1; AFNElJ/QvpZEJTthd06S9R46ys8HH3UDwJRVt8jG66fIK5ex2ujbbwxR4RYDugND0sZN+bLeOU2JRXTkRVpu@vger.kernel.org
X-Gm-Message-State: AOJu0YwArtSY4Y8xS2ShVb3Am2NBnBnRv40exzVioAr6pFUaQTYxulFH
	o9rBtP70T7hf0fHZD5fkH8Tb4KQVi6FpINekU5Dd8kh05B7el9i8N1bZ
X-Gm-Gg: Acq92OHTtqJItbR7NkZ8Z7qluN2sMBECZeq5BI9GAHPoFz7TjGsJqfkFLgPF/8SMzOv
	QvDyAUE4MuKSiUlSXO+SW16U0Hng4DASUQ8+ikeVSlFLwp6B/6krjE6Vip/FD7V/tq0rTdVbmks
	To3cQWmqtzWOH8ypLywhz4kMRODnWBNUygsP9qOiJT3XWRYqOS9B1WVvyFc56XfZ+SSpxMBd24T
	zZapgyTgBzxPSGP10I5j46e2XGK6ujlgj33n0JgN+jKxXy+U0ebxXnMbhuaHgp77tWDMyx9+MGU
	B4FIU83yNNQlFxQ2JA2ui64sspv2WG30J4BUxeRu14BqKcyOqpGEH3wWYpcgw5D+h4L7TlaAski
	blCQXqBpOum+ssQNbCMbq90x4OUTFf+m3navcuDDcYKyHLAf8qFXgYCazMExkeIUl1JJyG+ahcP
	/rfQpFY9lNJeFjFdSVHYMszTe9tcnGUYR2iVax3DiXjTeCbQxsggZzuxMViCPYCsa5/X64PGT5d
	fF523usbyjqnHDy
X-Received: by 2002:a17:902:b181:b0:2bc:6784:5260 with SMTP id d9443c01a7336-2bd7e966018mr183964975ad.37.1779291941864;
        Wed, 20 May 2026 08:45:41 -0700 (PDT)
Received: from rohaniyaa-Vivobook-ASUSLaptop.. ([2409:40c2:103b:4191:71f1:6e4:a162:9164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f9d0sm225400775ad.31.2026.05.20.08.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:45:41 -0700 (PDT)
From: Rohaniyaa <rohanmithari09@gmail.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	peng.hao2@zte.com.cn,
	Rohan Mithari <rohanmithari09@gmail.com>
Subject: [PATCH] dt-bindings: misc: pvpanic-mmio: fix grammar in binding description
Date: Wed, 20 May 2026 21:15:31 +0530
Message-Id: <20260520154531.601160-1-rohanmithari09@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rohan Mithari <rohanmithari09@gmail.com>

Signed-off-by: Rohan Mithari <rohanmithari09@gmail.com>
---
 Documentation/devicetree/bindings/misc/pvpanic-mmio.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/pvpanic-mmio.txt b/Documentation/devicetree/bindings/misc/pvpanic-mmio.txt
index 985e90736780..28187d3bf546 100644
--- a/Documentation/devicetree/bindings/misc/pvpanic-mmio.txt
+++ b/Documentation/devicetree/bindings/misc/pvpanic-mmio.txt
@@ -1,8 +1,7 @@
 * QEMU PVPANIC MMIO Configuration bindings
 
 QEMU's emulation / virtualization targets provide the following PVPANIC
-MMIO Configuration interface on the "virt" machine.
-type:
+MMIO configuration interface on the "virt" machine with:
 
 - a read-write, 16-bit wide data register.
 
-- 
2.34.1

