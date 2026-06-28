Received: from outbound.qs.icloud.com (qs-2004c-snip4-11.eps.apple.com [57.103.84.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81D72D73B9
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 17:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.84.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782668221; cv=none; b=eyU/n8ihbSy53b0yydxV3D4zO1hHebZSDVcFUtQ1Fg/7edwE3hmEFUl7+Ggc+cDwBojUHK5lSNstdNbEAVokGrahbGJeAKrsVrMc3MHSOt/89lSIv43Gt5VR+tM76Q4/+aX4ENFcokEbgYNlbOa88iL9Lqo/iJmwXjs7AVxn1Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782668221; c=relaxed/simple;
	bh=Nv2Xbmn8R223NXCsTFqI7f59JxfMT0JXaaCOOYJ2TqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BaSPQ0R610TsHh/0CRQd0Nj/4YKSgTymj3MILyPpjhQmKeE6VIk32XkCmCldEq0gT7gkLBKcJvY0v7q3xA4CoGik0iwakZSdgDvIOmB0Ex49nO+972JgQNJ1R2BBs5uFhTjTkq1+Lan4ZmIbhiGqoEBpKl9pLWioiXPGC1kaU7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=ED/Qelnm; arc=none smtp.client-ip=57.103.84.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="ED/Qelnm"
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-0 (Postfix) with ESMTPS id 6EA6D1800096;
	Sun, 28 Jun 2026 17:36:56 +0000 (UTC)
X-ICL-RepId: 019f0f4e-4828-730e-8b4a-1a28c5517ca8
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgNQUR1fAgoERwRbF0YDU0VDAxcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBICE8BWwNbHEIKSQVaGl4fHVgRXy1SH1cYTQtWDBkGV04ZDEodUlZRBUoMXABoD10dWBFd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782668219; x=1785260219; bh=wVm4n6U2mxb1jAMB2xT+3KE4DHy9V5nCLK9Uksr+Kr0=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=ED/QelnmO1uknZR/5phPGa6fTf1v/AvR0JgIfBbHzBi6qpuWC6T58ASrKLdMwlPqIyU51a8wnCETYT822FHsMcvmowDO8C096y9dQv366M7Q5zp1DIvRhwavlTKANpRZOWa9WpEmjAqPV2GJb4Mlcjiw8minL70IoiJNUG810NmrUBbIhsJMUg57B9pECUvqv1dGNQhtHbKAwJYmR9oLWE8TYRAtMQySxzCkRccC+4jalBxpTts+dQsUmBf3DJSZ/VQl5+XaH8BYtHgZsHN8BCwft9fH4KDx3QkO6tsmOJgS2iRFtk3Ina7i/bwHAj7Rv7D7xdgKB1cwVvDWXaXX1w==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-0 (Postfix) with ESMTPSA id 2B2FC1874946;
	Sun, 28 Jun 2026 17:36:54 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	valentin.manea@mrs.ro,
	Konstantin Shabanov <mail@etehtsea.me>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 4/4] firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14
Date: Mon, 29 Jun 2026 00:26:40 +0700
Message-ID: <20260628172640.23167-5-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628172640.23167-1-mail@etehtsea.me>
References: <20260628172640.23167-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE1OCBTYWx0ZWRfXyprtNsJ0XA6K
 6OEiHS9QafYeE51hwjo8Q9qtGWtVRAxWDpfkJq4gNO42qSccQNtVqqUzpCNN59ZkRNhEXfMUTJe
 mumMtvVSaf1dEp0UYES5h3zevh0YRBdkIXI91OdOyrXNDHlA94oNi5P+P1VvoqQW0EFSbOSDj0c
 X/BthoVQiyuWXZsQjcxzq8jkm+b8mBPLCO2cbFfm8YuSH78cx2jI+wKxKjMsHW7J8Q3DhokmDSH
 L7jdgsPeWLBKr6xaGENnrlmWU2f3ps+4gJQyDsfI/fExuCt/gcKOkY5+U+fINXJKmrWwTEMw9/t
 uwUOXRBcgLc11RkHZqB
X-Proofpoint-GUID: iDxFxfNYfu74ewQfhKSij8tVjgBx-1qy
X-Proofpoint-ORIG-GUID: iDxFxfNYfu74ewQfhKSij8tVjgBx-1qy

Allow particular machine accessing eg. efivars.

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b89db..b6f7c567d4a8 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2295,6 +2295,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "dell,latitude-7455" },
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "ecs,liva-qc710" },
+	{ .compatible = "honor,magicbook-art-14-snapdragon" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
-- 
2.54.0

