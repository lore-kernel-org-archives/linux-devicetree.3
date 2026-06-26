Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D17A3F54BE;
	Fri, 26 Jun 2026 12:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477839; cv=none; b=Acx6QyAHyKZcrySWOn/HermMlEBrF7YM6OXOOsRYZOQxZK7PbYHXIR/2+x7wxUMq24hTCjT/Ez/GoKLabsWBZzWzScBLj9FM1xXAqS4A9UqBWXOWAWgDN/3ATzMu/in+zE9DATRH0cxArHX7oY/0XM1bcdygQIawA+Yv9IqGKcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477839; c=relaxed/simple;
	bh=HcEAQMRaTEIJe/Q3+o16HY9hERAb68qLFLDopCDu/A4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=hXmqvrbcv31CpcRCP4MSvl51G8UqLS1zxb0OnpKqaIsqIU4lFHxAGLRkwD6dGbFpAVIqoPhp1EnEYqwnveUqOFv/uYZmcev2HDRlYwjZrUnDbEL5QBuAmf/xXtSO1kHmOg0ptIWOHIKxhA6OsVa2l7iowRCQfZsEFBJiZd10HDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=qbRP1vj9; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="qbRP1vj9"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q9uKxK3594545;
	Fri, 26 Jun 2026 13:43:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=zJJ2rHvcbTIH4RRLE6TMZDU
	3SWsOwxNt/j4V+e3xYuo=; b=qbRP1vj94FkW0Hr4SE8bHbD5/kux8cxoZcLdMWK
	msBaoLMk1+1p6oTXO1WLyjRjSeJJLnmX5wVQukqJak6OOuqucTKFaqTylXLxzfin
	SYuOLlKzVwbPbkMpcaa5JYtumFLj/V44vEipNAz2CbHFJFY1a9CjSlQGLxka1+Ls
	u1eNUuDsaB7u4Ll/aUIGTSNd3oWHlqfDgOSt2rUXAYVGoi0TuwVnAVcNfD8SmhY3
	dBYMsdE4uoTWjetvQV8oKEEsa8pZCz1gqg0w5FSwTSU47yw87OSGUfwfdmVyocZ7
	2ctqhDbzGbPZkqLn0xbk4fluzJL4OegIDJqIVDqN4UOwqdA==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4f1q7w83q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 13:43:35 +0100 (BST)
Received: from [127.0.1.1] (172.25.2.144) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 26 Jun
 2026 13:43:34 +0100
From: Matt Coster <matt.coster@imgtec.com>
Subject: [PATCH v2 0/3] drm/imagination: Maintainer updates
Date: Fri, 26 Jun 2026 13:43:09 +0100
Message-ID: <20260626-maintainer-updates-v2-0-e1b3f246c44c@imgtec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN1zPmoC/22NzQqDMBCEX0X23JRkNWJ78j2KB42rbsEfkhhax
 HdvtPTWwxw+mJlvA0eWycE92cBSYMfzFAEvCZihnnoS3EYGlJjLHDMx1jz5GLJiXdrakxNNZ1R
 xQ51prSEOF0sdv87TR/VltzZPMv54OhoDOz/b92kN6uj9BPqfICghRaqVwgY7mRZU8th7Mlczj
 1Dt+/4B1T9wZscAAAA=
X-Change-ID: 20260624-maintainer-updates-bfc189254555
To: <imagination@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Frank Binns
	<frank.binns@imgtec.com>,
        Brajesh Gupta <brajesh.gupta@imgtec.com>,
        "Alexandru Dadu" <alexandru.dadu@imgtec.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        Matt Coster
	<matt.coster@imgtec.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=HcEAQMRaTEIJe/Q3+o16HY9hERAb68qLFLDopCDu/A4=;
 b=owGbwMvMwCVWuUfy8817WRsYT6slMWTZFX9+utiDy/kaM+f6htda5h/3hEXqrNR8PcVf5yTnq
 g6HV29OdZSyMIhxMciKKbLsWGG5Qu2PmpbEjV/FMHNYmUCGMHBxCsBE3sxn+CunJimn5FImEGuh
 YrAlnbcgLsjT9ZBgr2gr09szXfpb+xgZ2uqXxankOa+axXXqud7m+3mzts17wHRI/rzF7+aUtG1
 HuAE=
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Authority-Analysis: v=2.4 cv=D9h37PRj c=1 sm=1 tr=0 ts=6a3e73f7 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=dQmqtT5jEasA:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=bC-a23v3AAAA:8 a=r_1tXGB3AAAA:8 a=9uHljgo6oZ-YQ7KpmFwA:9 a=QEXdDO2ut3YA:10
 a=FO4_E8m0qiDe52t0p3_H:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwMyBTYWx0ZWRfX1Ckpy6zORcXl
 npyJVvw/+vJJAjJvUjw1ME/XskGsdVEu3jKb3xecz+bNovDClHhUr57KayVUAz3PdJFHwE3w7xg
 wDq3RtMMNrvZWTiloi7tPXsE99Kf2Q2wjMNP9ab1Pz0UOiHle3x3ZGYmlGuUOpiz4DdBuYtKx4Y
 332R1O6/Vy+QTmFzsq+MCrf8SXbPlKlLvpYvRRwnDDKv03S3k0gL+OHh82PeApg4zkE+11q7PpI
 clph+cwb2ZtKucLMD2cRdwuPUi5xPXyvZ2NLO+2XNA0P6YimUjjgSrXfCYY47ASuMIFTHcFOLKM
 Kf/RJ0O6mU+BPFcOGF477o+8PDLNWpCNThK002UFIh6Jelb3QwCg6XUDGvOf9968oCierR56XnW
 RdFINB5IovOrEi6j0Oq/S6EDlgKlll2k6XCoQilE9ARm930xctIz+MhKgOydBZDm1ZmZf2+bYJ8
 ZtY/hMWIhvZzRh/R/WQ==
X-Proofpoint-GUID: 1amkCOWrBlpAVQLlDkkiXDBgFt0w9uhu
X-Proofpoint-ORIG-GUID: 1amkCOWrBlpAVQLlDkkiXDBgFt0w9uhu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwMyBTYWx0ZWRfX7pnJBbDKjjWC
 7Huw5rCBJOlUzoGFwT8OAMZKajiCu4qX43DfTFmYTmAcRpveeVV3v3UDNahAG3ygcipEr+ZAY5H
 T+Tgxp8GnbSu9fWh/KCaEanJNl87n8o=

We've got some new people stepping up to help out with maintainership of
the imagination driver, so let's take this opportunity to unify the
maintainer list where it appears across multiple files.

There are also some new resources (mailing list, patchwork, IRC) that
didn't previously exist and had not yet been added, so let's do that now
as well.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20260625-maintainer-updates-v1-0-35112b2f038e@imgtec.com

---
Matt Coster (3):
      MAINTAINERS: Update imagination details
      MAINTAINERS: Update imagination maintainers
      dt-bindings: gpu: img,powervr-*: Add maintainer entries

 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml |  4 +++-
 Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml   |  4 +++-
 MAINTAINERS                                                  | 10 +++++++---
 3 files changed, 13 insertions(+), 5 deletions(-)
---
base-commit: 60b5fa6edfef867322fce7c8306e5c4b46211be7
change-id: 20260624-maintainer-updates-bfc189254555

