Received: from outbound.ci.icloud.com (ci-2005c-snip4-11.eps.apple.com [57.103.89.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECB7351C30
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.89.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782639678; cv=none; b=PqkVRkiOYg2jpgD5wYJgc54zlb4Wd3C0DB4rLM9AW+OSrji+Q7xcVI2ray9Wla1t3hPhVoFZLMb3c2HiCYffUKh3FgLQvX5fogphqqKF+QYzK60p1R/ibAdj6Fphs5gBv2V7JlXMLKyfwbSsVEoDCXLf0heEckw6OUPsnhL0eUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782639678; c=relaxed/simple;
	bh=l9QTiFilDIn7JPYkYIDGEiNlq34X6Ld96R9qDh1I9No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YbuIfLqur3bkbap4ZOgEToGKCIWNrxcQ0kVAbo64ecPxOR2cg1XcGh5o02WXFBN0qRfRzGlM5Hd+iVPzAfToWYBBDeCofgpIeNpa3qX4YjJB/ISzGvz16BflmQdOostqRky+R5p9gJEN+7Sda4sUoLMu13UI68jmlpwFGZ2RqyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=IFYEf1o7; arc=none smtp.client-ip=57.103.89.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="IFYEf1o7"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPS id 7939B180015A;
	Sun, 28 Jun 2026 09:41:12 +0000 (UTC)
X-ICL-RepId: 019f0d9a-bc6f-7514-aea1-dcf2ef09c5e8
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgJQUR1fAgoERwRbF0YDU0VRGRcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBICUEHXQRaHEUNTAZfGlkfHVgRXy1SH1cYTQtWDBkGV04ZDEodUlZRBUoMXABoD10dWBFd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782639673; x=1785231673; bh=8qhWEmWa9c5bN8gZc9nJPSieeNw3dWEH3UMfOnNnQEU=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=IFYEf1o77uDAtNPaaxsTnNmGMnnq2KiiRLeZQYi0VfdH+R++bUM8byRWJDfmtOX8qLiSTupJdF9UM9yGsqb4UttIOT/cxEQbfmzwOWLpOIElCBgtWZPVThT6PUkpwF2+0Krjz4i4yDsBJ8wTZTM3dmroHQP4qedqNrBHr8qqni+b+aQDTtpJ721Ja28ms386w2YF+URP4b11xllxZkV7rGMKLI+bd2WGz5A9jNWTrhK1IW23d4g0Kv2j2X/bP0udmx+jWZlZLYX675+8lX362ltRWau/QDEZ3G2NvOMGwM6wo75D5YyWkwjow9IgE8nD5cLraFV7AiVsvcTAaU3I2Q==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPSA id 7D4E41800161;
	Sun, 28 Jun 2026 09:41:11 +0000 (UTC)
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
	Konstantin Shabanov <mail@etehtsea.me>
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add HONOR
Date: Sun, 28 Jun 2026 16:40:28 +0700
Message-ID: <20260628094031.54452-2-mail@etehtsea.me>
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
X-Proofpoint-GUID: INDOAom25ajsNpJTRY2fbBA8bG-BHvnV
X-Proofpoint-ORIG-GUID: INDOAom25ajsNpJTRY2fbBA8bG-BHvnV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDA4NCBTYWx0ZWRfX3x8iDoYlQzd1
 BGtkPenKRl0WK92olxfqTExMPtLAMlB/5Jd9d2F0+Opv0ueOjsXPlDZzeIfWuVQrj+ceuyoX4dE
 pjzVTHLrt0Y7UxPWMtA5APSEME1ds4ZcjzLi/iQBidyGOutOk5IQ+CDQiNbkHOhTvWwDodSc+Ma
 HUnh3jswTR4/ZZACPkUIeSBEBtlck1/NmXTl9xh1U35oK9fAUG6J5CVtGwTY+5LydifGpQIxRFM
 zZIZZCMjg1eTv8Ukr7kQOMloPEakCU1HMWkDjJAo0QDuFnpw6f0AxxmvYxKoOIicDZSiP6TkivF
 Ch2UOsMrcw9xdxCcRLk

Add vendor prefix for Honor Device Co., Ltd.
Link: https://www.honor.com/

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..9ca2508f531f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -735,6 +735,8 @@ patternProperties:
     description: Honestar Technologies Co., Ltd.
   "^honeywell,.*":
     description: Honeywell
+  "^honor,.*":
+    description: Honor Device Co., Ltd.
   "^hoperf,.*":
     description: Shenzhen Hope Microelectronics Co., Ltd.
   "^hoperun,.*":
-- 
2.54.0

