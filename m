Received: from outbound.st.icloud.com (p-east2-cluster1-host6-snip4-7.eps.apple.com [57.103.76.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EE543637F
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748135; cv=none; b=NxoKuWuFmItr6mE5/ZdWQ1vzNhxvBLCzJZnBivGdI+5roje6XfQQdqjgNP5xpxUsK5WmHyxfxnrhYossWJBqgZmD/iFOFRzVlSBqQWIUsy2G4mKTFtUMFyO8hJSMnJ16h1TpxAk0spIWcB7Ul6ZGanr70tJE4y6qQE/lPkvmm2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748135; c=relaxed/simple;
	bh=Nv2Xbmn8R223NXCsTFqI7f59JxfMT0JXaaCOOYJ2TqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NiBBYXdwjA33llEJxuC895eCTxWiID8vDx8PRmt1X7pmYupMeUMIZL7KRtyGHimp6sK5/OnfQea9jRPFzgwqW3AlCkM+1PLw59KYc4qSFs+uV9KwjyFtQ1pImzDOVw99xzgNyKncaaBHgu1/QaFbepbgJhd/Ybr+O5sG/GN6xRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=ECzdoNyV; arc=none smtp.client-ip=57.103.76.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="ECzdoNyV"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-6 (Postfix) with ESMTPS id 203741802091;
	Mon, 29 Jun 2026 15:48:49 +0000 (UTC)
X-ICL-RepId: 019f1411-aac1-7c75-9523-705f8db351fd
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgNQUR1fAgoERwRbF0YDU0VBBBcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBJCE0HVQZZHEkJTgVAAkZfEVAUcwhDDloESh1SQ1oODFBNAUMICghHA00XXjJTBF8RUBY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782748133; x=1785340133; bh=wVm4n6U2mxb1jAMB2xT+3KE4DHy9V5nCLK9Uksr+Kr0=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=ECzdoNyV0W9I1Ui/SD0hD1vRrY0zO351vDF+5B4NdJS2qS+eVlVxZL6b6YTStAZngpL0LePM2vSA2tb4JJ0kutbM8qe+Z3okV+STnijohUeUBjRp1lRWz37raYF7srMMnug8fXQntNXrqp4lSwGKRNLWAF+RjNvCDVd8Umgq/926w+pEO6znTxNc6pvO2FpQxap4eq9nxyO6rOYq+qi8jNaHiCisbTJPa8IEAW0erOIEjpkmZgpxxLV3q/zqKsEkvWUd6yzvAmih9XgdEiS0Frv8LJn5BSl/togpCH0imJp4zEnSUNHHwEDiNf5sOr+DNjzH1x5+B1VeER0G+S7bbg==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-6 (Postfix) with ESMTPSA id 3DAE7180208F;
	Mon, 29 Jun 2026 15:48:46 +0000 (UTC)
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
Subject: [PATCH v6 4/4] firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14
Date: Mon, 29 Jun 2026 22:48:12 +0700
Message-ID: <20260629154812.9066-5-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629154812.9066-1-mail@etehtsea.me>
References: <20260629154812.9066-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: miJks0s18T5uiqsw0EX0qlS37YyaNgEM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEzMiBTYWx0ZWRfX+TLzV2REKoOw
 G858I/rw1+l4znWntk/bBb2YMFsOhYsleplEiPHB1RRhghq7EdfKER78oteuqfwIsovZzSEC57b
 7A/ee19z5vylwVKtqyCedkzzdIzdLyQPDFcvMD59jTWhtixIzTKChWK5K5Jjl23Az5eR28JB1lg
 SNrC6jeaHMHblQBMCNelyZx7kt1pEodS7kKXuh7LCfdBAh6of3sBAlRAJ0OpKx7f1qpCSXvCfMz
 qK2/aPADH5XOs27aLgoKYUxsMWGvYWdFAv7qP8swCCoPVWFKNM3076wO9j962VZW63Y6LZmKvg4
 rzWlSNn5aWSClERBFe3
X-Proofpoint-ORIG-GUID: miJks0s18T5uiqsw0EX0qlS37YyaNgEM

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

