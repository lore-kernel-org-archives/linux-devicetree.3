Received: from outbound.ci.icloud.com (ci-2001j-snip4-5.eps.apple.com [57.103.91.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F093DCDAD
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 17:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.91.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778866206; cv=none; b=l4B1PTQCPRIucxx6q8JTRUon3cRM2Pg4ySUiHoEN7F9PMH3N5gaSf5ciaXyXPP/eWUlEzg2R3Y1pi1/m2hSkDKl5WdSE2e5IG8dfGgvnsKg3vglsCIoHSylz0oV3dx5UwUWwWrTk7a4DrV/Y7CmYvAp/DhMMZh0KZlk/3w0NAnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778866206; c=relaxed/simple;
	bh=Foqr1TEYydQPTVHX9hbe27AqiF2A/ZyrSuZ5WBkdl6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D08hsYr4y4HD7KJPy6BVxy+zE2JrUdNw6W3aVrgoamC3hSXva0Bl1u2djXh13RToXONOTtIAWyMJKVtRMcnsPrzTXfFvHwfMYd6sXFB1qR5+zApsWT32B/SPh8uvo4X6ZTaFpRnG4Kw1zb1UDP+hizFEiSc4EL09X0BOH2GUPh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=GzQq+JyD; arc=none smtp.client-ip=57.103.91.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="GzQq+JyD"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-5 (Postfix) with ESMTPS id ACF24180009E;
	Fri, 15 May 2026 17:30:01 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFoKWxx5HUcIXx9BFVhWXggXGVFNAFhbCFsEDx9MDFECQgVWXloRHQRUB10FXVZQAlpLQgRLRWhcBVwcQBdIHV9qS1YUBB1HCF8fQRVYVl4IFwZbFAREAV0FXQJFCE0CWgVSAEYXSQVYDlwfRRQVUgRbK1cEXBBHHlIKHB1cRhMZThtXTVoNQBlYBm0UVhVSBFk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1778866203; x=1781458203; bh=Ykz/VTtZzmbcUJrh9j9DcbDYlLp1VHdB/J99ELSuML4=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=GzQq+JyDC5Sk2PSOWGyygIWtJy8E758RZyR9/CXb0J3qf88dc4EYoW89L4plZ3NCVf3d41AVusNwHcXalUf6OWsTjLHzeztj1KH2RqrdDGy4yMhG1UNPZRESod0FwSDAgDGHDIVYFPxodB9sCLsX5n+iFQOF1WYycCvKJ0JRRBo2zAGFbu0+1NXWnRD30zt+hNIG3NEZAlYOnSgm+KIXaTAe8Hk4QQ9XDGFoJ8YJRlGSJSHJFAJIATsf0bMJZuZpP4iwLCCleMQkEPcEghxeAA6L40x21CzlLoVq42BLD33lO4/gSRBJqA7YJHg7ML1fGXL5aK55pOnrvQgStyotpg==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-5 (Postfix) with ESMTPSA id D1FF618001ED;
	Fri, 15 May 2026 17:29:59 +0000 (UTC)
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
Subject: [PATCH v2 4/4] firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14
Date: Sat, 16 May 2026 00:29:26 +0700
Message-ID: <20260515172926.16597-5-mail@etehtsea.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515172926.16597-1-mail@etehtsea.me>
References: <20260515172926.16597-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=IvMTsb/g c=1 sm=1 tr=0 ts=6a07581a
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=qmbtgXoD8pYXKSWWfe0A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
X-Proofpoint-GUID: 2TYYURjjOZkjzl-yYHNgqdUJu24HQUpL
X-Proofpoint-ORIG-GUID: 2TYYURjjOZkjzl-yYHNgqdUJu24HQUpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3OSBTYWx0ZWRfXw82stq/7dSK2
 iRQP2o/5esAV5l+Nuuo/XJGfYwe7os5mm/Dd/GDkKEcVkJ8F98ZUM9hJyn6bOnpuiX8zlDFfhT6
 qEea9MVUDTx6DWVRVDnJQP1LqMBXk/mampp+rGBlDVxoV6YyFUEezuTe1MQ2zIo4IrCfykKPb+N
 DaCD1A3WSpObjR0XPI3Es6R87thljjs8s+RAmSx0lRvPgBdMcZPPJOuikZLLtlV1jHdYI1Hdpur
 +7B9oyZXgKsZ2ZF3QextD+5RHS/MJ+qFUQRlC7Krl0ECPDmlQ2DYnXqRNXzFIboxAMhi9aYaHzM
 oIYw6qa33a+POScGWdMxD2FfLIcqT8kugFHlHttJILB73xAQ6m4byw2UzrNPMY=

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

