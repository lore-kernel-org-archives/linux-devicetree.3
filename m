Received: from outbound.pv.icloud.com (pv-2001b-snip4-11.eps.apple.com [57.103.64.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BAF3D8911
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777651028; cv=none; b=MRRA9RrBviqIBgJkWYOu3yLYD9+/GI7zUwurzzSZIMzevBbuRzFgQ0VAWnJFvE0/JdeZeKO0Ri0jPWN1tFKAo9rhA+7XC+ZCVzvZkt4BkPxISlhHQ7wvd5VSE2ctUIVy6i6MoYF6MzpQP4egyFygNGEY8AoHUi8dAKMf1wq2VX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777651028; c=relaxed/simple;
	bh=Foqr1TEYydQPTVHX9hbe27AqiF2A/ZyrSuZ5WBkdl6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYgKA5Id/sW5ZAljiN9CoOGHjNg1kz41sZuUcUnqOeBWHeBbERtN9vOXP5kwjBgQs4U5DRfSbKLzHEY5Mr9H7rV0//jF/R+TcDL/4wnKOuv0S9GKaQhg1O223D7r79xyKeYx9mtVFyvDsy9tazIvuqlhJTUhXS4v1dFfzUUgWMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=MbZ8bBYI; arc=none smtp.client-ip=57.103.64.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="MbZ8bBYI"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-10-percent-2 (Postfix) with ESMTPS id 9511618000AB;
	Fri, 01 May 2026 15:57:03 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFoKWxx5HUcIXx9BFVhWXggXGVFNAFhbCFsEDx9MDFECQgVWXkkOHQRUB10FXVZQAlpLQgRLRWhcBVwcQBdIHV9qS1YUBB1HCF8fQRVYVl4IFwZbFAREAV0FXQJFCUkCWAJdA0IXTQdUB0YHXVQZWgF3DkYVUQxACFZFXxUHWEcURw4PE0wLRwJaNFYfVBlaAw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1777651026; x=1780243026; bh=Ykz/VTtZzmbcUJrh9j9DcbDYlLp1VHdB/J99ELSuML4=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=MbZ8bBYI5zNr1IPMxVfLwofERR1ikFiglZGZb9M8x9DTUxJgFu4P3XEmlcnK7i8WG+4WTE9jmeUk1g7qic0moe6eqHG9kCjpFby7uSW4vx2Zrv3OMfq0M5E+YpqqP7SbK6MJDjCw3Yv5Ptm4E2PBW2chnd8liEWDMxo/Wj5WFs6SN8kTqq2OODUxuT/tWjEmrky7Bs1pESOIBMzsj+8/rx6gcbMOe7+6Z2kUV0QIQDok1I+TiQia3Ro1ATeftSCuzEmkYIIVNj+LnfeZ6GONxOCchnrPQtvXubQWxumsul5jJtqfXFO3muy6Db+lgU+nZpe6l5nWMj06OR5eh+8hUQ==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-10-percent-2 (Postfix) with ESMTPSA id 20DD71800177;
	Fri, 01 May 2026 15:57:01 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konstantin Shabanov <mail@etehtsea.me>
Subject: [PATCH 4/4] firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14
Date: Fri,  1 May 2026 22:56:12 +0700
Message-ID: <20260501155612.5490-5-mail@etehtsea.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501155612.5490-1-mail@etehtsea.me>
References: <20260501155612.5490-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=PbzyRyhd c=1 sm=1 tr=0 ts=69f4cd50
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=qmbtgXoD8pYXKSWWfe0A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE1NiBTYWx0ZWRfX0n6qsBv2k8Lc
 n5QMuQwsdzPXnWYbYBdJLB9KhU+ccx+U5PUywIU0pXVEX0TrqBzZRE25xkPHg8+PcAIgk6uSqb5
 KfJYH4yrumPSdNSTgzvEPL1oreVrbh5L3Klr7FdC4CB/zEOD+9sirIvSUxrjsUcZG12QbzZULU9
 wl1HBzsmg9J19yIMG4YVfW1bbyH53uiTHsc1kzgl8aYDXCsHsAMaNesJqmN2ptor19gZS3GVIDd
 lpWbBqnLW56ivDxnTfgEe+AENTeOKmwIryp2AC3l+26qn+YZiEz9N0Bcl0Is0uoJ0kapTXKs6ji
 hA6nAaEhlAr9DTdQ2iV6qsfCoEgKxqw9QTCcnWTWdybUXN4kZM3VmSjE0vzcyY=
X-Proofpoint-GUID: cDw0i3LZxCABDQYvV6-EoojENUj2gk4J
X-Proofpoint-ORIG-GUID: cDw0i3LZxCABDQYvV6-EoojENUj2gk4J

Allow particular machine accessing eg. efivars.

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..2d6dc99c9567 100644
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
2.53.0

