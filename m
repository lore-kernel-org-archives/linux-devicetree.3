Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CAC36BCC3
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 12:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774787721; cv=none; b=O56dpuMMfWfoE3HQbZzGf1C20YvBkDoopwkuzUmeIE1ARP6a+4KsPJOXwDWZ2pB8InPtk2lmodORcPjh1eaWIPzKVf0rSc/YZKJY0//romedQgTGpk0dM3CQjBTZqfj47/EUZRLlMu9yH7JJqpmBPwXFVF7Vjz1xQ+av8REdZwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774787721; c=relaxed/simple;
	bh=hb3b5Xn6nqgDmPUXGa8SEWTqyas5qT4V0APOofxhyPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S4DBVrpYx66D4gi1F4El0mULX2rRBS3ZWAsZMKjoQvTniiwm4DZyrYYp0bAnaoYdVMmRJBvmzEq3NXIuzJ4exu4AqK8E9vEHTef40FX25lCcu9mQ8nkNFtINI+Yehm65BMkUuqj7KT/i3pGpyg/xbA96J6HjTwA6bbB5bCYcswQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvjEv4dg; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvjEv4dg"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c768b85d5daso1273734a12.0
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 05:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774787720; x=1775392520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wKSxAHN0Stzff0w5tTcgOX+ksB7Z1iTuqZjXxjUVhY=;
        b=GvjEv4dgw0TyGju87nChsRll8zSJE5Gs7b71k4rez4mNcMFHrHSvkRAj4qjPoMtP7S
         9x1rLXFS81NWf9y8FycZlkt9qqRJtZInqcWD14iLLw1UBDfJLPcDgtcQqfZxk2TSs6x6
         LdGavDrt+B+iY0ubkMY5VVp/1IyOFau4B6xQ3QVVC+k+7CJWADMYZpGePar90IRCWX41
         7k1qXqYJZyE0QT+xUp70bi1glgNRWScd7xv2gN76SHesyokkFmmAPWju3zjwfYXIiOr8
         Rn2KL++P1eMcbq4yz3IsMqMdiv+t2x8uqvmr70+P4bQZlq8MIpxLNcPAc13VgoRXxiYT
         VaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774787720; x=1775392520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5wKSxAHN0Stzff0w5tTcgOX+ksB7Z1iTuqZjXxjUVhY=;
        b=HO87TL/7jSIznzGypoiq4q/OIj+e4tvWt0RgdWt6xurTDciqPk/AAc0cD7TYP1AXCN
         iD9yrPR+bzsYOwi2Ru5sra05veIiCBGKKCV3WzFFL/xT/RA3Hqhd0QsRV1Nd3ZoYOSaW
         GBrVC7x6HiLpyU7s0cR013Cxlp4hQPhwnGlgMW4WxHvfEnGt0FJ8XlTbY0vb+mLflQ1h
         eByDuq1yxJQ5FbSXp9plN7KwTPc1RFxJtd2hRfdbe/1u7ZcstVzl7IdxN7jos8886AAd
         OA4hAt57qRUIFSXd4nnazp2gSgzkgh2x9nZ4reRSn6Pj7OqZQ5IXD4GiwoZCkQIWZ9lz
         Dp9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmQwkq2R6ozShXhk3fJ79bftNPwkJWDbuKrOn4h+eYGV0rDuuWRb8PGvXMRoELE/idYie5jlqy7E5U@vger.kernel.org
X-Gm-Message-State: AOJu0Yy69kZq8MyqHJdIiyOAKugyXe5VBAXU8oDkj/wkQNRIMuEyOV11
	AWdAiqvE4hzIYYhy8x4sgK3kfJjDSQNc0oFcSFl2oLMC6PjDxt9TWERf
X-Gm-Gg: ATEYQzzu+LN4voLAFyyGUXd9n9gPMyMnFViyYhwXFPGtrI9/ixgfq0ur3xzIYe7+MFf
	YYnHq929pVLw0DryFCWg8zcza8uHE96nhYhefM9DYXILBSbp3xyc1UPbysjQ1yrLQb6gs5kgO92
	xTVtQzBUQxo/QRbjrccI4yz+L4IiOe6fia9dOBPo00Ca+wo3fxpDa+mVdPFFzuK79SoohjRVaIb
	FzTAPG68O12dgJCSFNvLIzpkNUVxsVqXMMkdKOi2uC8LQwXm0L1nWvNYJQndu7FrSSz1I7gYCRy
	LpYyfsZqb7Mze/R+pU3ZjDj+IEtu2uq+3wNZEY6L8NkYF6SCu8Mu+TvTgUsVl1ue0ssxwELnSAd
	eA+tQTqswZGgOVCU1wpW1OOS/M4FjHXZj6G0VEssaWk+Gs3fP3eJPIZfI5/EKCDrPCWMgAMJ/5s
	YJhf3aGdz4Q8pCiNUgt6zH846C9RZyDlVP6wTkVgFaM/EDBJDZdQLEkPV0bvm758HOZSKWncfvW
	Is=
X-Received: by 2002:a17:903:1a67:b0:2b2:51e8:2c20 with SMTP id d9443c01a7336-2b251e831bemr6342265ad.21.1774787719650;
        Sun, 29 Mar 2026 05:35:19 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427afbe0sm58709665ad.72.2026.03.29.05.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 05:35:19 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH v3 2/2] ARM: dts: st: spear: remove undocumented thermal_flags property
Date: Sun, 29 Mar 2026 18:04:44 +0530
Message-ID: <20260329123449.309814-3-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260329123449.309814-1-krishnagopi487@gmail.com>
References: <20260329123449.309814-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

spear13xx.dtsi defines a thermal_flags property in spear thermal sensor
node which is both unused in kernel and undocumented in spear thermal
sensor's binding.

There were no dtbs_check warnings associated with this property as the
underlying spear thermal binding was not converted to DTSchema.

Most likely st,thermal-flags is a misspelling of thermal_flags in
spear13xx.dtsi. Since both st/spear1310.dtsi and st/spear1340.dtsi
define st,thermal-flags property in spear thermal sensor node, we can
safely remove this property from spear13xx.dtsi.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changes since v2:
- Reword the commit message and subject to correct explanation in patch 2
Changes since v1:
- Changed unevaluatedProperties to additionalProperties in the binding
- Reword the commit message and subject in the second patch

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 arch/arm/boot/dts/st/spear13xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 159e941708ca..0bb88f2d4ef5 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -332,7 +332,6 @@ wdt@ec800620 {
 			thermal@e07008c4 {
 				compatible = "st,thermal-spear1340";
 				reg = <0xe07008c4 0x4>;
-				thermal_flags = <0x7000>;
 			};
 		};
 	};
-- 
2.52.0

