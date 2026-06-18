Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC77736AB61
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 06:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781765092; cv=none; b=MOQJLFJErjRXo9d4+Kg/1d0vmTw4P2COdZu27siR97YsPHXe+K78JpNb8mTsLgbMZw5qFp9ySqDI01rCdYAm1wbt2U/oajaEXUtKnJ4AwE2yD89aimcNlX85ev0R4iexiwXUSMApr1cRhj9S+EIQHK8qLyLxWKWFUTZj4yxZjds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781765092; c=relaxed/simple;
	bh=qmSkyeqJ+tafCgF4ytkrYmel/eJ7nlJbFMcdqKHb0P4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SsdkQ1/WmMJdnkV/BqU8iJTdEQni/fhmYsaFLvVz64LiUm5Uk4nYPcxPfxn3QcxG/zD6ryPm6gRcW5CkSOtkPrDpgQshRX2pfbOtdaOt5cnZURo6HRhH/QGQaRLyXDGUmFi5/c53tQXzX2OxSDiWFkooP/ohM21aSRNEej2bBvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WQzFzEZK; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WQzFzEZK"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36b900f350fso639890a91.0
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 23:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781765090; x=1782369890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j85tblnlrIZ3cGvaLyDqF0OyTQiloZz9TV7u7C5kMjk=;
        b=WQzFzEZKhG4T9W3geuC9OvZywKI9P6OdWO67ZDp36Dwnyg/IXexjIJwHhN8prx4sd/
         enOlSXMNPNPMWkoBcXJrSprMZWD/Tj0SguX13QT2ejy5r59J4ur406jGjyb9shXnJK4X
         +Q7k3wu++Hn4r0dR3aspCwnPtyF+dGonewF2KgjA2BFJcJljuXPj5Mj9m8vwwnH5GgMM
         mAHU42CgpeX7uqk/bshgwYkcIhOZCQqRYY1d0QCaK8Wjf71RYp1ethdehD/QfLOaSKMu
         aKcX9tZCJHUCSqa4kt902qpOsLaphIWAilsPCheWzAZ7BPoTK1ZJlHz+WJJXwFjdB9qU
         A4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781765090; x=1782369890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j85tblnlrIZ3cGvaLyDqF0OyTQiloZz9TV7u7C5kMjk=;
        b=h5K4+kcTWsc9ocbQJXWBhlVxp2aA9hy0U6esKvbzpXzpT1mP3G5VcPoSS3kymvAXt3
         GUOqNxK/2xgKh/hCDHNRmrMYIRPDYUoK5Oyu7LhppKWrB2o0lDeyZ8AMmfDB6esrtfa5
         yX+yj5sjm3mXRXNhUbRtuUCfkjQgbdG5jfVQXK8IwMYMQGoEsz0gbPOCSdf/uFKZdpkC
         52HJhhziG55VeVvn4B/POT2fTBLdnwx24lLJ4iTC6dJ5YpkEhUN4X0dtLYOOLhJCCtqh
         rT2P/exShmgwPzlljhxdHF27/m1HxtomWz3Z+NSMMlk8z1DB/NpzjAI55cAOxBQaKdVi
         rl5g==
X-Forwarded-Encrypted: i=1; AFNElJ/nDn5EGker1uIkNpoKFchSqWlqlNjweGu6/nvx07bKhBtC74SUiFvTQkSIUfR4PIz59R7vaSARNZZM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0t7+Tn0SD0fu3K2XGggE6Yj3uacW7DzpLtmtCzH4sMMH5PFiL
	uF/QcpsgsEvdpq5TJ4VAKfX3L4mBckLuAb/msU8YQl6VvfR8mcTrNM8zlZ0ox+HzTa8=
X-Gm-Gg: AfdE7ckf6UAUwooK4pmR6zuvR6ZYa3gCNIu6IE1SaOnhdsQm2YIPHGz9DlyM0m2azFS
	figHqyLZz3y6gCdiFWiKP6nbWeaLKC3q+gYizxHcZUD5XR1YBLHCrEIbEIwQMfRrx72XJyGdt7s
	wSZOPG6xBb7UHORYtj7pBXNobS3DCPHhJIyGYKlGzQvfIvNgBoPrKE75F0itVwtr3xsIEWNpaND
	QT9ea+Y1jOyOtdGRkkkeqLXnnoRCQxESXASo5TuWRLdT3Tq3GhPHtV1VZo36T9WeCvzFcmrcAGC
	o+qG8AEj8wc3Ct2jsPKkjbrmBupBfUhtKgs9gEKaDDozlyt/VZIZyP8hI8+sdWLBRDWI1Ngk+2V
	fx4WVyIwrchJ+U4gE13Xc304mHbDZsyf6fW5qS0v1PuP7t9+TKZZTvyaGezBjdSzSDDOGE4tFax
	eHo14G/0xhxi/WqJGoU7ntKYZolSDpsNKoR/gN4xYB4GcpwA==
X-Received: by 2002:a17:90b:270e:b0:35f:b987:4dac with SMTP id 98e67ed59e1d1-37ce4545041mr2302253a91.12.1781765090044;
        Wed, 17 Jun 2026 23:44:50 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a4c1fsm185275985ad.53.2026.06.17.23.44.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 23:44:49 -0700 (PDT)
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
Subject: [PATCH v4 1/3] dt-bindings: riscv: describe Svadu as disabled at boot
Date: Thu, 18 Jun 2026 14:44:04 +0800
Message-Id: <20260618064406.14508-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260618064406.14508-1-cuiyunhui@bytedance.com>
References: <20260618064406.14508-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When both Svade and Svadu are advertised, Svadu is not active at boot and
must be enabled through SBI FWFT before supervisor software can rely on
hardware PTE A/D updates.

Use "disabled" instead of "turned-off" to describe that boot-time state.
This matches the FWFT terminology more closely and avoids the informal
"turned-off" wording without changing the binding semantics.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb214..f1e6b0d79486b 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -297,7 +297,7 @@ properties:
             3) Only Svadu present in DT => Supervisor must assume Svadu to be
                always enabled.
             4) Both Svade and Svadu present in DT => Supervisor must assume
-               Svadu turned-off at boot time. To use Svadu, supervisor must
+               Svadu is disabled at boot time. To use Svadu, supervisor must
                explicitly enable it using the SBI FWFT extension.
 
         - const: svadu
-- 
2.39.5

