Received: from outbound.st.icloud.com (p-east2-cluster3-host1-snip4-10.eps.apple.com [57.103.77.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F82348C6C
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 17:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.77.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781978014; cv=none; b=Ss2RHCBhqIzjMfX2HG9608JrJ9mTW/Ibls0yzEXUfSSgRvnnprXPUoRkniITU0QEBrKxZwLtMEUQMFmcv/f5+pTR2ZQV0jKUqpJjjbeipcNw5ElAsDjIJ77T4VvkQvZ8juZ3oEPr3becrU84nAbV7ASBC7WWfpAV78iZyJ0YL1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781978014; c=relaxed/simple;
	bh=Nv2Xbmn8R223NXCsTFqI7f59JxfMT0JXaaCOOYJ2TqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6uu9TU15w4qrvxAVoQDgpIWeH7arJOsoou0yZ0qq9t2n51IoP4WUur+FvbwQssmvVchjuiZbIgGs2f7otY2Vfj/SooHUmsxvg2dR80n8d6L3Vn3pa89V2pWcns4LIIAG1Rr0T8GxU+P1gMfbKqLoCpwERp0Ut3ay6g1PmpGkJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=MbKf07YJ; arc=none smtp.client-ip=57.103.77.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="MbKf07YJ"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-2 (Postfix) with ESMTPS id 3386B1800187;
	Sat, 20 Jun 2026 17:53:31 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFIfVxhNC1YMGQZXUEsbDlwHS1oVVRcOAkIfUB9MFldDRB8cGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKDkYVUQxACFZFXxUZFVoJClcAQAtOA1sFWwNHDEoCXRlaC0UPSx5YGgZTGVU4VhlSA0YDXBkdAFJVEgRACFZQVB5BBFYVbAlYBlMZVw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1781978012; x=1784570012; bh=wVm4n6U2mxb1jAMB2xT+3KE4DHy9V5nCLK9Uksr+Kr0=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=MbKf07YJFsEvpO7SqNWbe1+NDs4M1JSGQyA2utG0w7tDgIzKrIfS+mgsq5na3mPVc4RAaXHgveu4DMkeRGxgq/x4frLADu/3ZtTw1eKmXhDXvdgCkN7Tos4soTieEgq0rcV05u33JGTgrEGCPt8ZG6Y3lSlj7k7j9tFEt9IckFBub59o5kl6Q99yxieykrHJZiefBUrjC+b9F1j1TzSWhIkRkrJSec34TL936wMxBiYUqiba7FiK4fJYKKJt30BKld4aDNNMbckKn/VlNG/3jSpG8qLoLls7oSiutRHnDky+IBBzIr3fjdAmjWAgVZ/3j1IlGiWmVJgn/2Xk6PPhOw==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-2 (Postfix) with ESMTPSA id 19C6D18000AB;
	Sat, 20 Jun 2026 17:53:29 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Konstantin Shabanov <mail@etehtsea.me>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14
Date: Sun, 21 Jun 2026 00:51:58 +0700
Message-ID: <20260620175210.19563-5-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620175210.19563-1-mail@etehtsea.me>
References: <20260620175210.19563-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9yf_Ot8DeOtodI9lrnaSfS2pDGWHylh0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDE4MiBTYWx0ZWRfX64PNz3/PGjSS
 FhL4kWv/5rP+b6CYfb/09X5LtGcYxeDK2ii1OdyZK0MRpUiy8m74PvTBOVzwj4sGHxy0OrGaRpN
 k5hxD7XFeLyESztnP560YVNYGm3WwDiUd4iTAA0qCGXkaL3plNo+uVMGgklyKB/tmdpDr5eQcWJ
 pFZgsJ9o4cacgMSMBNCScpr3lEPw26O2WPAacH+ZgbXpXjPIqArc1fj+gUOAlKst1E92xy+Q4gt
 Xv5cpXMMz2mIVXynD8qQ1EofPLV1I/Imy9Gxraa9AUa/ucffN+L9rDrFr05aO01pUwaXzRFbOVi
 wTwFZHCNwCGO5JX7yC4
X-Proofpoint-ORIG-GUID: 9yf_Ot8DeOtodI9lrnaSfS2pDGWHylh0

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

