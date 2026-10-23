Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749846;
	b=0XolP0c+El41OJz/p9YYa7xKE77VLjHHbMToPBI9WMhq9+yYJSDs5bvJj83jemyLSzmb
	 NoLveFAdjGrfDCHMHuRy6dN2zn8rZCWbfGD5QoetZ5WISY6CmDvrYHLXLrY4TR37rFuhs
	 sFcRbQp1OMow3srYBGs9M3uDdXKaDUdZpgk8rge20VUrIx9u+2rvrPJGqFbUukWsQnJ/O
	 o3KK8sixkcKW8u+Lo7sjHHJ8cq9aFoomj3rWriCcVXd+qdMp46b98kXL2j7DuCQwEno3+
	 nyQovsXm+s/mnWmdpywbxwjhR6fEo9btWrHicYsA54vr9rds7jmpobjfyn0v7ZfM0bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1gV3tNHqy00KFgHBb5wg/giz1xNp3VUL7qP5ig2FUmU=;
	b=fr9Fv0RcC4EqR9T99Cje5bJkaK6svWZuKhvk6jJ6kl20UmZeV+HNXTj7tUl6fJnrvRb6
	 Jv2NkHfpqbVis5/3JWBPSQxTCtm/0QKevYUfuAHqo6eQ0WytmfeLJu3dwOt+Jl/4OmYZT
	 YjlSXBzW6c0B510Q0Sv8y/srX/+sFm5u6pl4ZlD9XpdDOuK1X7w6v35wwf3uXt9M3j5hR
	 QLakg/IAIlwENuUNuNSIENVo9ty5eUBXW3RRaqQo1TjvEI5C0lv3+uPPnh+NmqL9f+8ZX
	 2WZjiXlsD/wrNFAPLEmjkpUQEMSZLg8VacpjbhmXRqavaKxvElluxdPhZF9HmZ6KnHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=If3WQX1R;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A6E606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18A6E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=If3WQX1R
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so8670885e9.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792749844; x=1793354644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gV3tNHqy00KFgHBb5wg/giz1xNp3VUL7qP5ig2FUmU=;
        b=If3WQX1RFdmxcGAE145zioCKVYUnK4nIgvS83pnKypmMCY1Zkzj52fIz1sBV+DR2Hw
         IUhNnuDlbhIOmx37Vm3+qmUEGirlrzztR83z8P7T5zAFg/XuPHnUSg15+0X6FMTGv6Nw
         aFEWuwk4VY2VaWk4tI/j2KPerviakS98jf1h4gFPEwkUfdcsh3IbEIDyx8Vzs5R/3XPv
         Br3VOqzI9wNv2QjmG9x9odRAGAg96CJNhEO1Lu/wseRqYdfo5cbBdduOLmPt+01ljv+A
         JyfETSEuYYj2MwKMDOIleGytqsMm+raXMXdxFHzupJOBxvGUJubC9XlXNpEkvis8Wf9f
         Z9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749844; x=1793354644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gV3tNHqy00KFgHBb5wg/giz1xNp3VUL7qP5ig2FUmU=;
        b=tRREfNPJhADz73lxCB+Y1qEKTQrscvn5711DJzxzTVPIiq5n9SmT+LUL+U0P7+gm9F
         SrTs+2cjAlrslgnCQ43tByPUZSRUW0+unM5WNG8SJQm4xpQijEhszZSj99PpfZZzdBS6
         nOH/A65uCUQxvqhulUXUs3fjrI+6Zuz62nEdhiBJ2jkaENdr16yo/xh+IltW02z81NEA
         hehIn4WzKz9q2bPVTZBhq513fF7hXoj4xUAXeSLZH+Q3OHS/QW37vhOAYKyWSXwnlbWN
         KQ2xMc4a7Tj03QP5RyoUToWeAbeMHRIZ2iIuqeENvMKzcbZPYh3QLT2YhGkiI+Hydkhc
         DpOg==
X-Forwarded-Encrypted: i=1; AKwUvBwqqZGMM9k5UabTnErHbJHLY4zGFnBzcTzZ3r7wI93sbC5cz8c5t12dXRVGaEPiDxGPlRDFfNkVuRyV@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6k74zz7CkXddmqMSsMGpGLJIa3ErIPfbqjum+3h6MbsCmqAMj
	tHGAlE57a9jPdHZIgPA1sO6nXO5OKGkCYB++1PXK5oDLfTgZA/zzPcJptqBoqyhNZAc=
X-Gm-Gg: AYBFou3601n/g7QLnFyN+XWjoQ1wa1o8qEe7iuFF82iysPhz+ydZjlJsTWwtXtT1PIt
	/nEeSAxg0L4TpgyyYxa+IuF+r0YasQfZ54eMMYmayBYAfRhqfzZ2SVj+6cBr6oajoTPhpMJV0Fm
	m7951vk+/51RdOnMzo3vXwKgIDL95aVyT4Fz2XWeyRETn+lb+wpUO2FyubgU1PoUvarTAaGpbl3
	E9I+Zs7guhrd22ns16bpi6sgwvyTQSxZOGtyKdvUrtU5e+tiMj8ygpIH/95CAfBGXZS+bxa6eTK
	BIs48HVKoEMxbgZ8cE1Zyrenwbkxk4qpTNOlL+FIQ49n1RcHEMgzTJGirLUd+czRV3cB95XS095
	TbJvkf0D+/6Vx937yU+re95HTZDYvDXWZM/XpkVDbywYb3Ph5hFurOo7qQzZCO9WDD7wPxy5QCQ
	eAIYEetYll952qxdB1p449iR7yvBiIyL/VEkvBt7OG4/066IM8N0duCrkAC1v09ti3xe6BT6k9d
	7FF9HIHooiLD6kPofvkiWZxk37S82Yxo/Cw5Fq5ANrnhTrbGVoduVU5l6RyMeKwysBkDPu5qM+N
	s229j/gLjyCA
X-Received: by 2002:a05:600d:8051:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4a218c46284mr6468035e9.6.1792749844041;
        Fri, 23 Oct 2026 03:04:04 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm75761435e9.8.2026.10.23.03.04.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 03:04:03 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: mfd: x-powers,axp152: Add the AXP2101
Date: Fri, 23 Oct 2026 12:03:55 +0200
Message-ID: <20261023100401.67592-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023100401.67592-1-olivier@mgcrea.io>
References: <20261023100401.67592-1-olivier@mgcrea.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AXP2101's interrupt line is optional, as for the AXP313A and the
AXP15060: the driver then registers only the regulators. It has no DCDC
frequency setting.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index 45f015d63df1..f5e2c8232581 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -68,6 +68,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - x-powers,axp2101
                 - x-powers,axp15060
                 - x-powers,axp305
                 - x-powers,axp313a
@@ -84,6 +85,7 @@ allOf:
             enum:
               - x-powers,axp313a
               - x-powers,axp323
+              - x-powers,axp2101
               - x-powers,axp15060
               - x-powers,axp717
 
@@ -108,6 +110,7 @@ properties:
           - x-powers,axp806
           - x-powers,axp809
           - x-powers,axp813
+          - x-powers,axp2101
           - x-powers,axp15060
       - items:
           - const: x-powers,axp228
-- 
2.39.5

