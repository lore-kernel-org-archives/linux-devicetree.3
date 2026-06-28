Received: from outbound.ci.icloud.com (ci-2001g-snip4-3.eps.apple.com [57.103.91.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4F5288C3D
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 09:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.91.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782639698; cv=none; b=NSAYgXFv659sQ4rxOeTywXEltmUG1j1IWc2/p467GA0ryLnSajwbqpFe6LGze1j4DDZjLevd1+yZOh7nkwtO7FuPXp8CES/RIZ6nEfXgieYWTeVG5+DAQgXmZbRwnH+ETXUr5NmM8/VzwRDGfyCbltXmXH0pjzSUYd2i9OJ61VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782639698; c=relaxed/simple;
	bh=Nv2Xbmn8R223NXCsTFqI7f59JxfMT0JXaaCOOYJ2TqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U66Jd1tjtIfX2WCgSfqhD9V+8dl3q4ycVoSH4ubZXGYxMqj+hRUizK/CSIs0hacxKveWC99/pjevYiRcS9g7grbtlcnzd9sbQJWvY3J7DjHmG8KMarGAijbMqq+jfMKl2jIHnY43O+3ND7lkIU4Csmkbr/hzNub4VyICDdhJoYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=FGZ2l5Bh; arc=none smtp.client-ip=57.103.91.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="FGZ2l5Bh"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-1 (Postfix) with ESMTPS id 93ADC1800165;
	Sun, 28 Jun 2026 09:41:33 +0000 (UTC)
X-ICL-RepId: 019f0d9b-0ed3-7790-a1e1-df22f644f90a
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgNQUR1fAgoERwRbF0YDU0VRGRcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBICUEHXQRaHEUNTAZfGl4fHVgRXy1SH1cYTQtWDBkGV04ZDEodUlZRBUoMXABoD10dWBFd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782639696; x=1785231696; bh=wVm4n6U2mxb1jAMB2xT+3KE4DHy9V5nCLK9Uksr+Kr0=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=FGZ2l5BhAdbkneJiGo25PeVELLeMHbDnrXimgFne04Wy5N7OFayv/rgV7mKG139rTRW58gZHMvJEqyYrN/PeMJ/J1lBmBx2Qjv73iMfv4MvR1kqVMIXQ+91k6xLbJHV+mXoSvpftuzLpV8f1LCAEm3vzGT1YMZJ+E/rlZOVKY1a31EVin3akN+svPwFTcYynSEq9M9yy0NoREbuGY68X29ZXq41C6If5iVy02sS+QP4okuwylLltiO+HOhwTcNElxg3Z0nqrmjcaeTv6sKkaE4dJ6gKjeMWM9aKxX634JIGG+w85tuvb+ywW1qr2xr6aJM+fKWyvY4DXWycgZUZN8w==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-1 (Postfix) with ESMTPSA id 51DD9180021E;
	Sun, 28 Jun 2026 09:41:32 +0000 (UTC)
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
Subject: [PATCH v4 4/4] firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14
Date: Sun, 28 Jun 2026 16:40:31 +0700
Message-ID: <20260628094031.54452-5-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628094031.54452-1-mail@etehtsea.me>
References: <20260628094031.54452-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kYJabWV7LYhWOFeixBfCgRnr1YnznrnV
X-Proofpoint-GUID: kYJabWV7LYhWOFeixBfCgRnr1YnznrnV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDA4NCBTYWx0ZWRfX3Bdu294W6LFH
 9Ee4cYhNB/VqivE0eyD6S3etPpcG4mQtEmnD0NLG6HxIP8oqr4il+CgcLdETZvpk88d7LUuon9o
 qr3BBETt/LVpUpynfBIIRpG4m+JY05lp28OyWsOJx1xog9S7bA2WERpLhfpJOKpBLM/Ff7x7hHA
 vQm7rByWAYvX6IGiKkX7j2EHchCnaW9Z0bEfUzvTzhqJjwP9E2NUVeYvjlhsgj8Y+bHkzqgVcEY
 7IpPxg6gcYmPfekzSfkFRGnHAKbVpJAuZ70u9Npqetzxu5ROFvBbWWYNSyPNvXoFBbBfQrjPRNf
 S3m12oEHZOzWRKvq23p

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

