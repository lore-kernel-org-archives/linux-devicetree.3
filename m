Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BDA41B361
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010075; cv=none; b=aLfqKggKZRmVwUwNImWBocNms56dNlB0Ij7l20cIoZIKsGUx5YcWJmmWJQDbOw1hGcNq2twvRco784duu3IyYmLEGzHWRN000btczN6wdR8HUaFJ7Aw1swjy5ArbXi+5iGbI1JTcOb77GDRM1C3FTgPM5Oy0Nu2NWK+I1okTfwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010075; c=relaxed/simple;
	bh=6v3uUeRMpD/OAllmC6RugAPlqWhvN9wSG0ylDSha60A=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qx/X0qy3zktLRZB8MTIuJ34dip916Qm9yMWi8t80iJHhfm8PY4ogePG4ocFKaI8kpXRaFVVKnQxOZ6KPU3X31gV02BNBu5Fpi5DkgCLURJ541VkXzsepyyC4/EGxDPBVSza51rAizeznPYZHS2grA7FbJk3QmnBBG34YAM4JctI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=IfLmneN0; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="IfLmneN0"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36b9033d230so2863982a91.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781010073; x=1781614873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBjioe1/b2Df8x5Ip9K6/oumGB4ZieiSVwwEXmL7mog=;
        b=IfLmneN0B8IUQI5ihL15OIV+QBsjJ0xGox9ivRwHVsHgVQySFckXevwyZ84El1GhEe
         X5pWaCoGJb1veh2jU2NcW0wrIaJedV6LOIfX4K0i8WFX0YGOgEAVAMXXtxTDXxdKQWpe
         NplydLph/uo7pYO1jzwZb+YS0rIkS3ZFvfcaEI0Cd4oPUK0NcctpNWLOYLemF4BW+swm
         Qgilfy2GViLemWeigkFjJ9aBA513i6cyu4qAqv36JDoeI3GSc/1J4P1JaDNiAgZy7ciY
         T/BoZBtOZcJn/Zsh+hP6i5zsOaYjvTxWJAnsG6dbQODLVHKcl6mhm+yaiEj/07Oy/oma
         YWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010073; x=1781614873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bBjioe1/b2Df8x5Ip9K6/oumGB4ZieiSVwwEXmL7mog=;
        b=CjkkmdTD4/cUZbG+x3soUSuZmtXSthubkpn0uJImNAKDybiaIuJ/MF8PAoQDGLVohM
         OcAJlFv1UDW69k6ahiU+IUKwL5bbSwqCp0aDqvTtSSdt2Rg5Z0LQwcH4EgBfvNqwvuvI
         s+794hk5pi0bQ8GSnq/mQH0qXljZ4VGXUYmpVWQzOoM6wweVMqfs5XTT8nXXWHim+J6b
         mpph4ZcGcr/fv2ZmFxJxc/jt235qW9dW9wL2DweKrokbMN945iP8S/p37RKuqZoGaQ55
         /d7spqScICoIP18qzPZPXQSbiD67BNk+CcjnNjffkwf/ed/nmKINZxrrfjuh4Bt0iJjO
         cWxQ==
X-Forwarded-Encrypted: i=1; AFNElJ95vi/mryJynHDryfSzS72/XBcsJHJH53tQx7tzTFDt5VB7WtNwjIdyvqiNQ87B6ZsHzpMTR1Yl3L/B@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8fxBMQsx20ttKgpw7oFOKA+WfPuqCFUNPmn9yl4inm5g7ZsFy
	XvuYrP6KHaXznr19xorYfgLde50y2+zI26m2NUPyrat0mcHtaOmnTg5Yd9jyY4U1FOI=
X-Gm-Gg: Acq92OEyC5F06JGN7eSqcMDK7PIotiZeg0VO5Q9miQDcyLZJ4qCY7ixJ0SyER2BOTFz
	V93uwBRPXE6g+wjPYD9Bmi7gx976DZCDExOkYvHIkCpajbP1Nrc1cSyh/oBT1HkJKpNtQe7aYdG
	OAj1i8Gh+t8kVOhZln4N/90WOqM0q/ZWVTQL0PPHi81OBCNFdONmWKZqv76R5xJqBKx7KSX/7mL
	ES4/BV9Biij/KiHc7fU2iTAH/mvoGeNFz4NOeBtfvgArFSpmgzO2gFcDc19nMqsSNDuDM7MuHfB
	otuc/uSXI3/PhCNmDTp8VFF2VZn4Vfoy2xaNWZdIiB1UsvbzNE0KXR2n7tjdd9lBpjZk6maw5q3
	W3nIsCJ2e0/q7/gge/40hbC2+5GDYcAIZaGcjCX+bLzIJbBGuBPLSf2rMcHO/CGxsb4qRDRVQwT
	6OPI/nv7MeQXPTk2WC3XoBg7LMjBpj/KS6Ne/y+yBujwY3IykaMvRkkFOgpxB5bHd5H28=
X-Received: by 2002:a17:90b:570f:b0:36b:877c:42e5 with SMTP id 98e67ed59e1d1-37133372f4emr14653761a91.17.1781010072907;
        Tue, 09 Jun 2026 06:01:12 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf8284dsm23267889a91.4.2026.06.09.06.01.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jun 2026 06:01:12 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	andrew+kernel@donnellan.id.au,
	aou@eecs.berkeley.edu,
	apatel@ventanamicro.com,
	apopple@nvidia.com,
	atishp@rivosinc.com,
	baolin.wang@linux.alibaba.com,
	cleger@rivosinc.com,
	conor+dt@kernel.org,
	cuiyunhui@bytedance.com,
	debug@rivosinc.com,
	devicetree@vger.kernel.org,
	guodong@riscstar.com,
	hui.wang@canonical.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn,
	namcao@linutronix.de,
	nick.hu@sifive.com,
	palmer@dabbelt.com,
	pincheng.plct@isrc.iscas.ac.cn,
	pjw@kernel.org,
	qingwei.hu@bytedance.com,
	ritesh.list@gmail.com,
	rmclure@linux.ibm.com,
	robh@kernel.org,
	wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn,
	zong.li@sifive.com
Subject: [PATCH v3 1/3] dt-bindings: riscv: clarify Svadu boot-time behavior
Date: Tue,  9 Jun 2026 21:00:18 +0800
Message-Id: <20260609130021.99899-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260609130021.99899-1-cuiyunhui@bytedance.com>
References: <20260609130021.99899-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clarify that systems which advertise only Svadu have hardware PTE A/D
updating enabled at boot, while systems advertising both Svade and Svadu
must enable Svadu explicitly with SBI FWFT.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb214..b09888e9988de 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -294,10 +294,10 @@ properties:
                of the PTE A/D bits or page faults when they need updated.
             2) Only Svade present in DT => Supervisor must assume Svade to be
                always enabled.
-            3) Only Svadu present in DT => Supervisor must assume Svadu to be
-               always enabled.
+            3) Only Svadu present in DT => Supervisor must assume Svadu is
+               enabled at boot.
             4) Both Svade and Svadu present in DT => Supervisor must assume
-               Svadu turned-off at boot time. To use Svadu, supervisor must
+               Svadu is disabled at boot time. To use Svadu, supervisor must
                explicitly enable it using the SBI FWFT extension.
 
         - const: svadu
-- 
2.39.5

