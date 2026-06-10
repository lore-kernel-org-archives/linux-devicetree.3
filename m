Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E64406809
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089915; cv=none; b=IA+7HJC7fMumCbp3QMse0VZB1zZxmkf+buJ3tHrH9eW5KphI9Q+jPIwHFftIBGu10++WCt2XsS9299oMdvJoed9oQIY8Pyql1m+DDFq2dPkXZuYprBC+/teO00vaMuHq7rfbHN8xTsggIn0yJwRAW0f9VySbAqzx3zBEsVVFozw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089915; c=relaxed/simple;
	bh=uO7dmp+7kXXq35mabsz2m2dY+q1mTPopJfhyX1CU2yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X/QurDloq/xKJ/A0IAp53+oqHZ3UC26bz5ZkyhvG7MQGRmRz9aKlOU4gt5dMKuvm3BSH0YzmcjaJX0W8oDYZ49+1dOsGelPgTuW5NL+jsM2CjJjag73eyV8yzAsiRdXpOQx2qZWYjH9IhHdYXMIwim6gK9Wx5grmIrsfqLvE9gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIPUOzPw; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIPUOzPw"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf18c30bb2so48325555ad.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089909; x=1781694709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxy+/rJ2nBiXps0IHi4kt0tmpzHJC70O0pAZEhcagdg=;
        b=XIPUOzPwgjXIPK7biyPPlRzceYZtN7R8dG3p1ulo+zB35BN2yXL8YeFGL2gc/yhuQj
         pXL6qs/MB2hi2ObsGmd/mf+/W6IybJgn/mR/FBymWLs5KAUOj5BmMNBMwCcPBgYDA73h
         6unGp/fsP1qf3GfsZXeiiMZWsmY/lWydnv7tDxXl/bXdTKDGoHB+fgzn4Pd9AseUIWsz
         R4ETxTraXIncb1kAgE9vb5oqL7uMbf5FPwJmwaTt0YxdxoRhlUvOLMJYcxOILk3HXemE
         P1kVnRkPReSoqeiXku9AMAotf1tESAlCQ1P/2KAYanulyMOYVHAGeIVkRXN6gcSxtXKQ
         X10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089909; x=1781694709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jxy+/rJ2nBiXps0IHi4kt0tmpzHJC70O0pAZEhcagdg=;
        b=NjIe73jE5PXYxWpPMXvVqd+bTvHaj4YtnlxyVGz3otLXoyoU3GO/cGYtQjRlSyw42x
         5kSYG0sNaqKmzS+ZNHtW383OB+vhBAYr4ic/Q3RCaKMx5nDdRXxGW65oizaG2ZbQRWNv
         C4ExGssNmdxsQWeylW5+j28rpcmN+iAfaA4G7NcwzHqy0Cq+jhWOpKuWUBNhv82KZYXE
         Chvj+lDsuPoydTkkzkeGh2nqLvw5UgjGdi4eRYnJ9WxpH5kzrERzJQd+kYBzYoOxf3Hi
         pOId5R1qJHfeR2HHYHV55QvN9Yu7hvtFd3emFTgp8U4miBEF5j1iJGzOa03Qz5fTvW2G
         q9Bg==
X-Forwarded-Encrypted: i=1; AFNElJ+qsAmPcp6ZqYGa4C0PaaXcMsMFQr3K0R5i9h8Vr0oQcJkfbnFhZyWNLxQLu48LjWctEJG1ewY0EO+F@vger.kernel.org
X-Gm-Message-State: AOJu0YzRX2NwgT2FKAYZdi+NmUECF1HzkCKZ3GZdljtKbi/K8pXuiW4h
	O+pmVo9gH0GIrEhfX6/KRsYv+s+p3IxafkSN+gUiherwyiJ/IuMeLdFe
X-Gm-Gg: Acq92OFsijzcdiokp7n/BjalQtOy56W2Fajd1cOJ4KdjR5JdGhA85mA/sXJRHzJgp42
	Vx4qUgHNWzK9LvD3ea1KXtIqTu/zSGANHz2Qb8cPQ2kV93XMtPzWkxh3ZqUOTsZQDSbYLbeQZk5
	3eAOBoNtWSyAeletDhQZkqFBIemiXBvWlzewpZo33OBW6Dpc5LGjrkKWKAxHBgRDQn5Sd991WF4
	PCh10Rm6QJSnR17NkXaHlv2DI25TX+piGnvFnT4xWALAC4cGEz9RkdwIuP584f9mHiXpNV8D/po
	NGrYeD5TWKwDpigDbGlCTIwKVY0BXkrcIWqEJl1qD+/TfjHPwztyeRSbPBWPElzyTAczfn5yJ8g
	F3ao9qR9uAj9s8/NJya8vCGM+afiT+erPcb80XRON0mHpqq1y9FsyNKBPyL2Bc9qerowPxH04ST
	GcnP+ZxYasJV4zVKZvRqiCIcp4xZ9bPs2igIA0j0CT69gcsgVw
X-Received: by 2002:a17:903:1a10:b0:2bd:606d:b342 with SMTP id d9443c01a7336-2c1e881ff09mr286316365ad.26.1781089909338;
        Wed, 10 Jun 2026 04:11:49 -0700 (PDT)
Received: from [127.0.1.1] ([2409:40f4:4111:52c8:138e:8096:a8df:e68b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm317175205ad.9.2026.06.10.04.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:11:48 -0700 (PDT)
From: Ramshouriesh <rshouriesh@gmail.com>
Date: Wed, 10 Jun 2026 16:39:34 +0530
Subject: [PATCH 9/9] phy: qcom-mipi-csi2: accept PHY_QCOM_CSI2_MODE_DPHY
 phy-cell
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-a14-himax-hm1092-v1-9-0c9907da47ed@gmail.com>
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
In-Reply-To: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Aleksandrs Vinarskis <alex@vinarskis.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-phy@lists.infradead.org, Ramshouriesh <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=uO7dmp+7kXXq35mabsz2m2dY+q1mTPopJfhyX1CU2yw=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqKUYRSIMMjLHMhkZR5dO4CGE49UyTRGGP49w1C
 ttyD41c+g+JAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCailGEQAKCRAVlYpeERwF
 3pYHD/4uAmyfmypJaZPNO+fgd9CIEWOXJil30ot5bQFVpCScoYrN+SscUOUg/0WkUll4bJ3+x07
 4lUTL1vAUQBwAXx8sO3k6nnEfy/hQdIYedpATkAFsq1TeLYKhyCamempsswk31EIAiFcJUOC79n
 G117fd0WQzZq4hF5qG6DyZNmNWEreZZDdi7dNVXHQXgIkV0R+M28rvqsmNYiT2SztbFYux4Gusl
 9+bTO20QltCUmvr5DjhjtUpxrwJYZZ8vnVr3BSM6YaQsxq/I4tuT99q/1tWt+Mtb5H6I+9MCw0F
 dljQE7+DpI96IW1gHamorEK3exUeCkUc4MWz/ulGJmgcKZVlDDkl0lVoUUwEHhaQZ/M/6MybnAC
 4C56VRCpTM0y9lfjzrdvU+P8ZIOnbR7A26lMQhHeiGb9twCX9jHX76cpPgQBJetyUlJuxkQG1js
 neA6ecvVxK0t1kiV0kiP8K4LFIxXFRrQ9gqE9BrvROicKC6dq3YuzXzsMW3Y7vVcuoII/O+I3JD
 BcYF1fft05FfNsxqDNVRd+6CMwBGXFf+hBjCsELVOJIzG1zipThLmpLhzLuuiP/nk9zOdVSpSI0
 y8SAVNMGxwOW14k1IkqCE7g8TxwH4bj660ix4jD3y12u74goy2RB0wLdkqojUUM+1Tl06JsG10W
 /trux3pAPFc86QQ==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

qcom_csi2_phy_xlate() validates the phy-cell against the generic
PHY_TYPE_DPHY (10) instead of PHY_QCOM_CSI2_MODE_DPHY (0), so a correct
DPHY request from the camss DTSI is rejected with -EOPNOTSUPP and camss
probe fails with -95.

Include the CSI2 mode header and check the phy-cell against
PHY_QCOM_CSI2_MODE_DPHY.

Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index dfeff863a406..857c54cbaea6 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2025, Linaro Ltd.
  */
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/phy/phy-qcom-mipi-csi2.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -188,7 +189,7 @@ static struct phy *qcom_csi2_phy_xlate(struct device *dev,
 {
 	struct mipi_csi2phy_device *csi2phy = dev_get_drvdata(dev);
 
-	if (args->args[0] != PHY_TYPE_DPHY) {
+	if (args->args[0] != PHY_QCOM_CSI2_MODE_DPHY) {
 		dev_err(csi2phy->dev, "mode %d -EOPNOTSUPP\n", args->args[0]);
 		return ERR_PTR(-EOPNOTSUPP);
 	}

-- 
2.53.0

