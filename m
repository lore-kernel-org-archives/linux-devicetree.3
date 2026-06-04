Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B62E480968
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581186; cv=none; b=LBrCJ/1dsPwrtJ05fHF7CYHe0nhE9sAEnXpWq0ypDzc7TKyOWOHjychuIhfv7W2p2k1tbXwddUFkv/LgdIVK192LyWRvr9k86G9539soqvsNCyMoF/Z+yygTZn6kz4TuemtFEe0cXobqIpBwZVN0rPnQNd8JFWJLifKy6Ewlz7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581186; c=relaxed/simple;
	bh=H84PCi6rqd7ZXKUPzqtrIa81wxH9NJ5ajArN4ifw6yE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uCtzVayWugKjxppbwM2AS37H2secdTx89emBewHI/kDxVk2LIRd043UsLsp08SXzdDpPQcFbjOCs9RzgmTggudGi+3Howe8LfdU0W/V9zJaVlhvoFixXZAQJhYmy9awc8DzxlAjCzppPN8Uo8Dqz3O9+lit6R0XIGYjTOaOn67w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXAOuvPC; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXAOuvPC"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef372c58aso457967f8f.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780581182; x=1781185982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zTkYHigKQy3WkeWXyJsWd48o8A6LM0P0gm1ZhPIld0=;
        b=ZXAOuvPCIbX8uZe3isqZoLZgEILM/zlro2JvjNCpUaTjemOb7dmYNYlK4TfSZHLG5W
         HR7wbjqv6MR7ktuUSqH2nZdqGfo436QkoguxcoBahQyI14ooqaoHCa7aFVOKjuu8/Wyw
         YwzK1dgTZwsBHcQhLIWCNz8aexjNj84kq58WSe39qLgpzkly8EIQlo9JsJ7869Ni2EYe
         B2HzlOmn7HuzTNFfRgAirybhEme2bCX9AW8y5lDRK+Rgyurdf5ITBKr1/mBvMSlIr5t6
         xVIO5+4JVJGdgLHSFbRV4tLUFcbE7qpAiPwgpxhpqY8+FC6brhFdXC61W86vmmqz3uBa
         mJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581182; x=1781185982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7zTkYHigKQy3WkeWXyJsWd48o8A6LM0P0gm1ZhPIld0=;
        b=Y7X0G5FmcmaI9VWEddfc1auNHX7iKZjMPiIP+bdYKJPqOScQEA/ZpHZ+6bQ/Lqryqq
         reJ1k9UQj1cIOze0x7TFvYDBVDa4i2VeHf/ZAhFNdZw9eMlWHOwOdwePRk9ek5YKdCiM
         pMmZiGLNuJjTdyDVxKCFDpWyU6nC6jDsPzk1/gjcKKWlxRcS5I7NizY6C2R9+Q0wzIQV
         NGWeylzRZ7K9hofpw1Yzo1EmhGh+V5s/oMJVCTg1CCQnTpN8XfatwM4chIa+ynxa/pll
         ZCygje8aq+qPt5FwQlXubE/L71ivBtG82n8Xl5MtzU6aCI9ub5naD2F5AveSqQfl1EU9
         hRAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/86FpIuuwp2YQQIEk3KLzkZfd/Q+dE0aun7f+kiPWwV8Zc+ncICtCTnrDGjgC5i3wBWSj5XrWMGfdj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Yzz1ns1l+4v5IbGbm13WgPw5qdWdzlNkeYZCQ8cBacZ5uFvD
	m3VfEWrqFDyxktv+4l76K4JEgYDKjHM/A+aV8p1SOupsiXAe0xiZk1HJ
X-Gm-Gg: Acq92OEksyMBz/1gQmd7xkmWgbY6PKz0bf8lisdWldKzPS4JB8eVcw4D+kxsf+w+HRu
	WyBAWwn67zoHKOq5jHLar8fWIOHbmcYcfKvakamo9pJoD8ojx1vflwc45vni+Z/Vw02p0tocXbJ
	QaaUP6sJ1wWx9Jhzp8hWTS8mqrzzsB1r+fP/UIIqvfYoPlRnFk0lYkiwl1/X/MbJpZXe57lNRro
	0cP3N+E5CYBVSK9QSlPJXLAWxjH1qtB3Lp6ZCHV3bRhES8avW3tulzru8By4guqyoDLXxLsTaId
	cignP/1w6+UyW6uitHVezyW2okH94EZG9UD9PLOB4bWOtE2fmMw5VFfYQUEP4GAOpC7ZIsOUPnI
	yTj3H0bigxf+ypGDw0KAq9x5EiiSJNbArVCsIIt0h2+6O6SBICco1cLzQ+h/6aIo0nok18qfN0/
	7lifA4yQ9K0jo2nEuGGCDq4ZgSffhecBgO6Ryll1W9sebyG8onohlKa2VxDLenFv0=
X-Received: by 2002:adf:e00c:0:10b0:45e:f381:cd7f with SMTP id ffacd0b85a97d-460217831bamr9227520f8f.5.1780581182173;
        Thu, 04 Jun 2026 06:53:02 -0700 (PDT)
Received: from compiler-rock3b.tailb81abf.ts.net ([2a01:e0a:104a:4d80:be24:11ff:fe12:2776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16661068f8f.0.2026.06.04.06.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:53:01 -0700 (PDT)
From: Midgy BALON <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 6/9] iommu/rockchip: Clear AUTO_GATING bit 1 on the RK356x v1 IOMMU
Date: Thu,  4 Jun 2026 13:52:52 +0000
Message-Id: <20260604135255.62682-7-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260604135255.62682-1-midgy971@gmail.com>
References: <20260604135255.62682-1-midgy971@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the RK356x v1 IOMMU, RK_MMU_AUTO_GATING resets to 0x3. Bit 1 enables
auto clock-gating of the page-table walker, so the walker's AXI master
loses its clock between transactions; a TLB-miss page walk then never
completes and the IOMMU is left stuck (PAGING_ENABLED, never IDLE).

Clear bit 1 (keeping bit 0, the slave-port gate) once paging is enabled
so the walker keeps its clock. This is required for the RK3568 NPU MMU.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/iommu/rockchip-iommu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 4da80136933c4..e3d8b6e9ca12b 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -953,6 +953,18 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
 
 	ret = rk_iommu_enable_paging(iommu);
 
+	if (!ret) {
+		/*
+		 * RK356x v1 IOMMU: RK_MMU_AUTO_GATING bit 1 enables page-walker
+		 * auto clock-gating; the walker's AXI master then loses its clock
+		 * between transactions and a TLB-miss page walk never completes,
+		 * leaving the IOMMU stuck (PAGING_ENABLED, never IDLE).  Clear
+		 * bit 1 (keep bit 0, the slave-port gate) once paging is enabled.
+		 */
+		for (i = 0; i < iommu->num_mmu; i++)
+			rk_iommu_write(iommu->bases[i], RK_MMU_AUTO_GATING, 0x2);
+	}
+
 out_disable_stall:
 	rk_iommu_disable_stall(iommu);
 out_disable_clocks:
-- 
2.39.5

