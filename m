Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769484508F8
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 15:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784130745; cv=none; b=ShbW3HBw5T9MwUJMoM87u95j6jNY4F+8zsm+ggMY6ezpNYc/65vQ+PXMPgzZlPKrK5EYVql2xbfJHifaOv235WcNsFNFMDxITrco1ei0eKFpqDe8mveMxvM6vzQ/K/eTUaQVaGSFaC4g/muUpTHdqHeVv/h/kjM57eQZMU4kiuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784130745; c=relaxed/simple;
	bh=jaR6IXtnVi6ioC4CoK/6ipo2XScK1rheIpMALj31QOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OS1zqnJEZZ9E8rIbql7ss4ZrnOr7PmkeaC5q+XuV7YF2S0DJJwpRbzIAuNhEqcjKXCIxFckxh2j2Qcj0LWAsThi2DTN5HP9YB6/EwIPbIBeySjEg1am2nuDTvcNExiiZZtOT8DvGtr38999F0OOho9o8UYNxYPI/lpxAUkopopE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=ccq1wnw2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="ccq1wnw2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso4959215e9.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784130741; x=1784735541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTbhMWOaOoZlXN64x1qtKKTfyIsJLh/gmS3Pg/heBTg=;
        b=ccq1wnw2S+CAT5Z5auFtNkLqubVXO+DKuc45vJp9LPCqtwP0UTzWIdBNEBfeYLDkeT
         OSM76iRgbpxf7SbBHaF8FRs9C2d7KU4cqknXDktqe9bdZ0FF/IyuVWocnBefXaujIqUP
         J/sh+HcsYdZLHRXjojQolYuBHkwCcsagzQRPM+IKrUsNH2Osnlsb16CCJavqIlm+cGKA
         WkErmEA4bGTEz4yfoatOWEmz8n15ZJT1bLK36XB7gCpM9x+WuH+0dFNd4bGa0Q83AE5n
         4Wl1fYMwEMibatHw7L9QrUNeVUaWZW0accI87wY0qSEHBDkd02d1pFAg28D3uxjSccFR
         43+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784130741; x=1784735541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTbhMWOaOoZlXN64x1qtKKTfyIsJLh/gmS3Pg/heBTg=;
        b=HykMU9wSwmLfDSc9NoqaTKvwU0yjk1Tb0FK50OSF8XE533WoPnHm8ZOKXvqt27npAj
         7555z0WBxmfUak23pY4EfkKp8Y7g3+p4L8OQWjz79oPPYx9mLISHT5hNqG5jR+OMpYj9
         B3e8JrjgQZxDbGkfO/CMu+wMiJm0KRHeJYAfU+CIxMQDPkwu1CBOoBOh7aUt6W2n6vCS
         1UjvySJPdORx94F1CRj9j+DHo8/xL/rfxtCNEiR7wYuVPxE1RX6TSuj5+1VB2ujX6suZ
         Ng+8vssJmMrcluBrWtqzXMvgfDTJSeHq2QbLB471Da9n44lUNYEu4fMjxJcRarPAVo0m
         cw1A==
X-Forwarded-Encrypted: i=1; AHgh+RqqqFLbT/Rc4tx/ndqN7ZeRb1UxTFQySoYgvkUw7JC30p46oAM89T8EWaWa735lvEuxqvwAGq9P3Aus@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/tXmJUBv1Co1LyAMwUDtKjpYkeDacEtNuUyUmtpQXNFN1AqsH
	vBwEdeWMvY7VidhYn4KW+6ZaVD7haY8JELxSz1PEeydq4Mj8BG3ZUrkHl8x2sjzSmUw=
X-Gm-Gg: AfdE7cmq+/4rdItrtAPjKYDoWZDmdbP0K8mg/zu3/9KAgz19BHUGsDXn4terjeipQ1t
	qhRiug5VtQKTnEkwYL6z6VjMY37+ygtiJ58DnTaYkJI3jQUFRc6dauFXeGoMcdbhGoZNr/u9bik
	V/5Xid0qhk2IS1I4R0AIHrXqV1CMqYPw3NYwpA43zJ2VTTL23KcY/TCm9KPxzf4Lchz8ep1MeeN
	tYkdMNvGYsjyp+wHp9mrkvWUjyqzpZh8DQetmJ00NfogUVB/cX1qLXK+ighaEvqYROgEr6doyCD
	hd9Az6kSNj/rTMkIyBB7/MIhrkzKbTyNE3GdZ/BEXw8pFR2adyRVKDy4IXkDA5WQpp7uXx0j/RB
	FS7Jix1lHKfmVieTqJexWnKAVJOEYjbFWDdJ+Quvezg1HsdSfF1Lg9G9sdYFV0O4nDgIiM4Ycgh
	dkiOKPyUM4En7B9T2knpiW4NX6xS6R4732XAiu
X-Received: by 2002:a05:600c:e54a:20b0:493:a573:179b with SMTP id 5b1f17b1804b1-493f8829b05mr124819885e9.30.1784130741651;
        Wed, 15 Jul 2026 08:52:21 -0700 (PDT)
Received: from vkrawiec.lan ([2001:861:2128:c8c0:8e98:aced:6862:3133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e5c3sm16621663f8f.1.2026.07.15.08.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:52:21 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH 1/4] regulator: dt-bindings: Add Silergy SYR82X allowed modes
Date: Wed, 15 Jul 2026 17:51:38 +0200
Message-ID: <20260715155141.128601-2-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715155141.128601-1-victor.krawiec@arturia.com>
References: <20260715155141.128601-1-victor.krawiec@arturia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the PWM mode configurable from devicetree. Some boards require forced
PWM mode to keep the supply ripple within acceptable limits under light
load conditions

Indexes are starting from 1 to keep backward compatibility with existing
device trees

Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
---
 .../dt-bindings/regulator/silergy,syr82x.h    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/regulator/silergy,syr82x.h

diff --git a/include/dt-bindings/regulator/silergy,syr82x.h b/include/dt-bindings/regulator/silergy,syr82x.h
new file mode 100644
index 000000000000..6d4aa86bb5c1
--- /dev/null
+++ b/include/dt-bindings/regulator/silergy,syr82x.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 Arturia - All rights reserved.
+ *
+ * Device Tree binding constants for the Sylergy SYR827 and SYR828 PMIC regulators
+ */
+
+#ifndef _DT_BINDINGS_REGULATOR_SYR82X_H
+#define _DT_BINDINGS_REGULATOR_SYR82X_H
+
+/*
+ * Constants to specify regulator modes in device tree for SYR82X regulators
+ * SYR82X_REGULATOR_MODE_FORCE_PWM:	Force fixed PWM mode
+ * SYR82X_REGULATOR_MODE_AUTO:		Allow auto-PFM mode during light load
+ */
+
+#define SYR82X_REGULATOR_MODE_FORCE_PWM	1
+#define SYR82X_REGULATOR_MODE_AUTO	2
+
+#endif
-- 
2.43.0

