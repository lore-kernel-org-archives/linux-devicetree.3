Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0463F54B4;
	Fri, 26 Jun 2026 12:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477838; cv=none; b=ogyBkii0/l/FvCMQYweaIbG1VIYLQpFenBflOngmfBHO4ZYzsJIwsXl30SiXC8N1PRmQTxlMw5ctX0XjKaFzfEgTVLEsLh/6gNL9J7XwcZc4ZNmP05jAcBw+S5z9s3FuGaz6XtZShzTef89eDN8rSWMFIdt7Z6IjX0/cCv6Nwj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477838; c=relaxed/simple;
	bh=rSOo8mnMdehp5YbyAmqspv3OLoMm135DnGjaXJIK1Ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fhwG4jRx0LQlc5h4Z7lGg881Vcb2iMi53susGycC/YunhYOBdLAKzZJhF9v7BPay/PT/DUPhd7z4lGB5O/D71XHMfl94OFFVbN2OWUDWqCxVprCaqfc6tMF/Dt9nta23MIbbWPITDKTXNDOq/2tNHWwKoHadJa4MMerxF5N/O1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=DTYEV+X3; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="DTYEV+X3"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q9uKxL3594545;
	Fri, 26 Jun 2026 13:43:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=c
	VifmQeVBQ7jaUQB2tc7mKay8LG0Nz4zpkDoJHyb40k=; b=DTYEV+X3ksHYlxBfO
	rqSsR4T8aowJYm26MPXRPWfvhMLLCk8TMuteWXd3OIXo8UpPYPFlMG5Vv+JuVot7
	Q+arqQPzCtthylmZFlmJgfguSYbluNZK1X9a996BqZbX+B5s/O3qhQwLjtSYtWOn
	/Ifif7dB//xlOysSt1HdIgNQC28r0Ls5bCR8l0+1PEfOmwIgfBECC8SE0S/cd5Rl
	jefyYKm+Vya+efzLGTLMMcQ1ThrnqESxqkAyx/r4Q/+CRP6LZmSh5TlAtpM2XKRD
	StTZ7x80sCMRzauHB125nWjJEDc4iNr82v+yZgYkfNPhKFHVsos+qebh9Ir8SYhk
	LWY2Q==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4f1q7w83q0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 13:43:35 +0100 (BST)
Received: from [127.0.1.1] (172.25.2.144) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 26 Jun
 2026 13:43:34 +0100
From: Matt Coster <matt.coster@imgtec.com>
Date: Fri, 26 Jun 2026 13:43:10 +0100
Subject: [PATCH v2 1/3] MAINTAINERS: Update imagination details
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260626-maintainer-updates-v2-1-e1b3f246c44c@imgtec.com>
References: <20260626-maintainer-updates-v2-0-e1b3f246c44c@imgtec.com>
In-Reply-To: <20260626-maintainer-updates-v2-0-e1b3f246c44c@imgtec.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=rSOo8mnMdehp5YbyAmqspv3OLoMm135DnGjaXJIK1Ck=;
 b=owGbwMvMwCVWuUfy8817WRsYT6slMWTZFX/xf7/UPnFGblFb4TMt/zsBzxpPfTCX8VSy29Mqv
 z18+t4bHaUsDGJcDLJiiiw7VliuUPujpiVx41cxzBxWJpAhDFycAjAR5i+MDP2bBecv+eLXurfu
 4DW9HW9OtfFmfw1YzhpWP+G2Tznj3qWMDL/ur7vXfqrjkeLaR5Hqv54HZCzL+npK4hgDZxifaGz
 wUx4A
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Authority-Analysis: v=2.4 cv=D9h37PRj c=1 sm=1 tr=0 ts=6a3e73f7 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=dQmqtT5jEasA:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=e5mUnYsNAAAA:8 a=r_1tXGB3AAAA:8 a=YL6Xjd1eAAAA:8 a=Z0Oc3OuMG1G1JZ1n6sAA:9
 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=yLS1KB8ZbIgHeRWbGdJx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwMyBTYWx0ZWRfX5SSt0qqZiMjO
 D9dF577wgBsFhYlXwGbScas+/BU5d84i9BhR223KxKtabRFhpSVjizckDXqyuR+bmPAlzWsSfXZ
 VDYxNardxHLnzo6L83NOPHoH4Ecx/iTnyYM90xozQ/1uMJYjwAR9LRfN+3YWP3ziDUFWGC1vxs1
 qv7gZ5friIg4whmSIBWfTSaM8P3/4rF/t9qUrJOtvYRKEzQ3TzWIB+6G23GdSOSdxJd9sHw139/
 cT6I5BNysuhgF2xm0YtPVy1ug2e965kdRAriHgcVGQeM6/DegZMHqwQLI+v4awrXAPLvlSWEJx9
 vpXz1oVLmh2t3hak4bJoec1Zr9pNmgCd5lBOIaJx9UIoC8hZM1y4L9CJlfVkVMCycc4HoFymhWy
 Q/If0NIMHq284JIzfn8KWedNJEkdOtbL5V7+Sz5fO82+1Fn0TJz4xFUqPdoJt/9Q+eZLB/gmQ07
 /F+WwtEian/emQRcCzA==
X-Proofpoint-GUID: X8Gk2sKQ3hvcMcYBZO8wSxP-B1Jp0dvv
X-Proofpoint-ORIG-GUID: X8Gk2sKQ3hvcMcYBZO8wSxP-B1Jp0dvv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwMyBTYWx0ZWRfX8GbOaGOxPy+/
 0H8mZmtl4XBOGxWv1CAJaXCBOvF4q1hCACC9RPdYr/ChGcekKgyFhTUuLkdnAEMkiUjcgyj5gMh
 ekqzgAGqLPkeQTLsnuafB3scaczaExI=

There's a bunch of useful information missing from this entry, flesh it
out and simplify the dt-bindings pattern while we're at it.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
 MAINTAINERS | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 987635948cde..b45e60524762 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12569,10 +12569,13 @@ F:	drivers/media/rc/img-ir/
 IMGTEC POWERVR DRM DRIVER
 M:	Frank Binns <frank.binns@imgtec.com>
 M:	Matt Coster <matt.coster@imgtec.com>
+L:	imagination@lists.freedesktop.org
 S:	Supported
+Q:	https://patchwork.freedesktop.org/project/imagination/list/
+B:	https://gitlab.freedesktop.org/imagination/linux/-/issues
+C:	irc://irc.oftc.net/powervr
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-F:	Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
-F:	Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
+F:	Documentation/devicetree/bindings/gpu/img,powervr-*.yaml
 F:	Documentation/gpu/imagination/
 F:	drivers/gpu/drm/ci/xfails/powervr*
 F:	drivers/gpu/drm/imagination/

-- 
2.48.1

