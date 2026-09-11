Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F20B36B901
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139289; cv=none; b=gD5lPBkQgLj6c5ASRFK+af/HWUE7LQeFji8/j0mC74KX9upt3hq/WPTAaoaDKnz3p4TwFEIiGRLlyaAX5NvVHWRXDJc4cmriXQQilQHnleKyRrRAgR5xVf0Jg5Dq6qJNnpy0XgnIMP9/G3R5HXg4Do8QPPKcIUYm2IImSQD5Ml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139289; c=relaxed/simple;
	bh=juxoCJMQ0e93UE40/KJy++lXxIyfrr6e1IzYuMzaAgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6kcZK1WKPcK3SQGdGagZoMk0aEpNKfF16eT9CzIRJLZlEWpGKbwwE+q2w/GER8GHOdqq1SSFYDeQ0MRSxFL9Z52sLBoZAGlAX6gUlDYxovl6ed/meBT5t091ZZEkNyyjyDuGGazf9zqxk22U6ty635BZI00/9gwtetAJU1EFzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=ipNv4p0s; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="ipNv4p0s"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso9443205e9.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789139286; x=1789744086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyfOjlYquJubXiCtjjVH2sltdfeny+eTcGS4jxiwlQs=;
        b=ipNv4p0sCq15xM6dAN3yFwBUcpoTY5eRzktfUW5xFeDq35rHrrqLGhLF6XmihytQyn
         HvxCxmfLxpcIq0DrMs+8/8ZLKXbI1vmY56Izk78iPXdvx773RtBdtHegNvs3BYoJDNeu
         BRrV718IcCBc67Gcbhj3SshnPC71qpqrW8zsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139286; x=1789744086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tyfOjlYquJubXiCtjjVH2sltdfeny+eTcGS4jxiwlQs=;
        b=LIY9O3N7bOLHI5irMsElnzuW7FuMFCVqGuovlMgx9j6URb2oJaQVjwPCxHxz09QXQy
         QX/BlFVY80tCEFug0tmJUO/urvMGqNMP5dXBT7VcuCC9eTbTVk9mM41Zmitv3d2vN8ua
         3AD/vorbx4shqKV3jbUwzT1OlQh6scvHmX7p+51DbEZVvLpv0djyjWutxnTdR6BaUVnm
         vJezqczOI2/diOoyBcV1A/DrW+g+eI7XHB+oPa8J75G6oOdSOHM8Lx9Ii2kMR8do/Wli
         npa3ivcpXz7ZdmnaDAtW8n4vWXPgCaGV3oeDF34RKpbJuE/r4Jd4Rc7zcIEXMXA1iqul
         F9/g==
X-Gm-Message-State: AFuF++n2QWEFpP+JrNJDdPqZilRBKfq6m4hF+xL4cmqCxmPjRLuWf69X
	wWQJhOBLU9PmLnawXr2IyNOeXbe1nQjVFukwBj6O3UrBBwRq6DVxAaEJF/MvWlb4R24=
X-Gm-Gg: AYBFou31xKiOe8FUOMEMFI2XBzfY20Yf1ATq555ZEfgDCREvcKe9Sf1JAQsSHDWQlK5
	vKiK8kieOxExU8thLM8GVFp5wd9+bCd8W20+LpsiML/WruwyLhLOPBZQjqiBPxniEwd01Tw40QC
	ti9kOKnWF3+NuNsJQkx4o9n9iVcyuRU4IrLPjZ8PnzvokOSHaf/bwvJgdE3s1WON7P8bmzS0JM3
	QgfUVW2i/t959AJ9F3fZET9RG3YU9Cb/uW11dHMEdVLONBchp7FLbtRA9UNbTXdiT13YM8V4jar
	lLCbfwD+kexg8XPFJQBCm29rUhe9byBweYPRbNlKIVRSdqQp52tcpPlMUlE0tcpOzsovP648DJN
	ukUq3g1tK0sITXRmWxmw/dfZUi0x8B0jVfBvoKl+QYoiYAlk1t9ABVxWfyKvSphQTb/FJmD6p0I
	XPWyvyoRjWoyjgOdwwy4YsG+DpElc2iW+ldLeHTOFwFjvs5ds4JZYUwZYnELqk5YUfuQ1gLf8AV
	r/wL37tZFo4s+a7
X-Received: by 2002:a05:600d:640e:20b0:49e:6777:da79 with SMTP id 5b1f17b1804b1-49e6777dc38mr18981725e9.26.1789139286298;
        Fri, 11 Sep 2026 08:08:06 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm108933095e9.4.2026.09.11.08.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:08:05 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Date: Fri, 11 Sep 2026 18:07:53 +0300
Message-ID: <20260911150755.2803736-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911150755.2803736-1-petko.manolov@konsulko.com>
References: <20260911150755.2803736-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT compatible string for Draeger's M48 CPU Module, an i.MX6
based board.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..8ed1ba733510 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -47,6 +47,7 @@ properties:
           - enum:
               - altr,socfpga-cyclone5-socdk
               - denx,mcvevk
+              - draeger,M48
               - ebv,socrates
               - macnica,sodia
               - novtech,chameleon96
-- 
2.47.3

