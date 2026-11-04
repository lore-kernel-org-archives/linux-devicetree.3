Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775958;
	b=4SI3lnGSF8et1fC+Qj/5hJ0omqhSbVhZisk4xPfzQHPf4S0u43SddtYpvMCgtQokA4pG
	 yxLKpJnPAUWN3LsHefdQHqtWWMLmo7WLGVx6/sZxHpBRg+EZhyHEo7V7F5GWJs1KI/a26
	 ODk/nik1UUvKNjBSnDl6L7CnPShquBk/VahYMUHXDa3TPMZAgTI3z6evQC33exWWqdyfz
	 Y7DOqz1Yubznk7RU7hQ8oAWffsqyh/kZbj8FWmwQkyqQt74nr2mon3prLgOJ2/Xui42Ek
	 82Ca7qnijfbDAmxE4br6ewL5ZyeRY0zxzGerYsPjKZ7O0rKpJdkQnlJh1d7NiZBMoeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775958;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OO+30Yb50y7T4yD0ARhMkPyAC4J2soG34s1bvx9hl5E=;
	b=xeQh9EaUuIcAZestrFEVFnXXzeGF0pWLzoSW4BUqfmxZOlmTUOtj5uG35V9VW/e97zha
	 Z+KemkB6RRCt5dHq+ZoZbaqMYJDzQYMTrqwu7xJzZLlJ5KiNYKXKwnN8L7nxSs8QA73Yt
	 ikgZnfjYjiALdnyAb0pxlnK2VBfnB46PQ6wQ+qKSu0ZqRzSaLIq8G98a/13leu0werXjp
	 cXm6z4Z3juRYLk3saGLLGpIKmzoGAGA6hof5pQqDdONdweLLoQEXtnz5gQUuoVGpMHv6r
	 EP8a8O1Mp+uzSNEq8Sc3XD8VAIuKFXuzJ55c6nL0tgWogxNBBg+fgLrQI0L/zDEtroQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=TjwnSOzV;
	arc=none smtp.remote-ip=91.218.175.138
Received: from mta0.migadu.com (out-138.mta0.migadu.com [91.218.175.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B875606A332
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 07:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B875606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=TjwnSOzV
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wILIEGKN2ENtD6K54RLjFDYGlLPSYApDXSSZjkkU1wk=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793775955; v=1; x=1794380755;
 b=TjwnSOzVoG3owQasyuwOy+4P58IFGc0ny7rpOCZxKfSRR0gmEqVhrZ2ClThYETqdjmENmuy9
 sOIhwYDAPDth3YP63l3FZolc5pGsA7+DNrcvj7cZRLXGDOy3SO1/v6B24IJsQP5n3UGAzy2ULee
 RN2EOt0mjGmExhfG3zOdIb3bkI7g7/8BXqCZgGvhesBLDEaNUgM+YA4StK5mcnmfVLLraWUkdPC
 nGPphf3GFltyoreQVZVJoMOBtaQfw2uxtYjGAmgvsIfAcd84z1RFnZfV+DkATPsRSDxvMoJTz+y
 WoeEr8FT1be3485GG3hTXEGhhcy9G37T87t2+xVme1AgQ==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id efed8c1f91980a51;
	Wed, 04 Nov 2026 07:05:55 +0000
X-Mizu-Trace-ID: efed8c1f91980a51
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 3/5] firmware: qcom: scm: Allow QSEECOM on the Surface Pro X
Date: Wed,  4 Nov 2026 04:04:34 -0300
Message-ID: <20261104070441.74127-4-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104070441.74127-1-val@packett.cool>
References: <20261104070441.74127-1-val@packett.cool>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Surface Pro X tablet (all 3 variants) to the QSEECOM allowlist
for enabling access to efivars.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/firmware/qcom/qcom_scm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 60949b71a3c5..7c82596907e1 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2287,6 +2287,9 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,arcata", },
 	{ .compatible = "microsoft,surface-pro-12in", },
 	{ .compatible = "microsoft,blackrock" },
+	{ .compatible = "microsoft,cambria" },
+	{ .compatible = "microsoft,carina" },
+	{ .compatible = "microsoft,caspar" },
 	{ .compatible = "microsoft,denali", },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
-- 
2.56.0

