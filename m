Received: from outbound.pv.icloud.com (pv-2004h-snip4-11.eps.apple.com [57.103.65.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E33D75BF
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 15:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777651014; cv=none; b=KVpWkHmaxSP5WKUk0aQhY1saA8zWSZE70jJKzWyKys37yovzSv5EkG3yTNteDA6325xGNx6wqMVN73yXyI6ZFp7KWzaw334S5HL1hOu2qD42TRjlHjf7lBwLxWHy4hswiE+HO4JT2nsXg6KNYk5+hJ6+Tm6W2Epq94tat5hjSG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777651014; c=relaxed/simple;
	bh=pA9M264KJvikrbQ0B5GjiPnbjelLVui2Dv54HXOm0mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gV/2R6E/bbN07tXDlim9nw99YJlsYmVVZFmObo/MELxL3eYvH8ZI9mFJJjow7TR0CowAldC14kZjPSr5PLjK3M0eZ5G5XVhjxeMCnYQb4Ec/OOperF4ifAx4EqKxsQB2h1s8A37SCqRbhzuOVXX1NBqpDLFxZhTgcYeNoqVvGQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=RE9h976h; arc=none smtp.client-ip=57.103.65.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="RE9h976h"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-1 (Postfix) with ESMTPS id E06CD180058E;
	Fri, 01 May 2026 15:56:50 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFoKWxx5HUcIXx9BFVhWXggXGVFNAFhbCFsEDx9MDFECQgVWXkkOHQRUB10FXVZQAlpLQgRLRWhcBVwcQBdIHV9qS1YUBB1HCF8fQRVYVl4IFwZbFAREAV0FXQJFCUkCWAJdA0IXTQdUB0YAXVQZWgF3DkYVUQxACFZFXxUHWEcURw4PE0wLRwJaNFYfVBlaAw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1777651013; x=1780243013; bh=r9GhNNjKrh3kE8tXZsShquWSmGSQDibNkvQ9kPBCX1U=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=RE9h976hOKtZ/6DRQbmY10lu6+wPWrKLHK0UGfdhP6rXsr02a8xgXFHUjuoheH/WXTzthpgCySYrSINymXcVjSjCDTGc8H0EtMCRcWhtZTRZOZx7oVlxXGPZkcyGied29hif/904FHQSiIfMhp/DyJjs8EW9YnGT2XakNG8siu/gWOomh5FmAIvw8Y1fce4GBN22YZnVO1Vo3bpYLxzxzMuwdAhkFOM0xqw+F2UE3swve1porUStpdswfpYUEv5CPVsK5tPBIu4V4LPmpRJBIvvhA+djfWHjb8ZwSIBTe3b95N7g30gFrJLdIBs9cRFZ1BxCfQ1Sy59cYAuQbk/0VQ==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-1 (Postfix) with ESMTPSA id D96331800189;
	Fri, 01 May 2026 15:56:49 +0000 (UTC)
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
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add HONOR
Date: Fri,  1 May 2026 22:56:09 +0700
Message-ID: <20260501155612.5490-2-mail@etehtsea.me>
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
X-Proofpoint-ORIG-GUID: _3U34nBfFCCRBphocQzuTygXm_a2SIeY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE1NiBTYWx0ZWRfXyKtMQRo2n+8c
 m15AIhXvlS9HgbmsTyntzCdRhQp743HZdXmN3Q8NIIurzWBBTZS9eejDOFYszJH7Ytit+PHLGjv
 /DNjrFdh6p+pgqNymIZRez8kKRHqmHx3qGfCA982e8PqjcHen3X5u/JxaQPFw1dGziGdyxNYdsM
 aLl0g5RJjrGDNwqJ9l3KSmX8QA4FqDzsL7ycQJ8HQj1HvktoI8Oqm69c54RDCAOCPiFF7oQkmz2
 Fqy07YfKsU27n6RTp4beblElVRkOuz/VFdQ9OtNl+1+77SGvWi44R6ho+RUJO2/XoXGDHE7z/Ap
 vrDgnCnFvaYKG4T/8biinIJBmww2sHZDEnGjsYOHp7SJiIfWXcW18IDZTu+UHE=
X-Authority-Info-Out: v=2.4 cv=TuTrRTXh c=1 sm=1 tr=0 ts=69f4cd43
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=CvlTB2HrAAAA:8
 a=L4MHaItcyTsGJ2lxC4sA:9 a=67QrwF-mucXG56UA-v15:22
X-Proofpoint-GUID: _3U34nBfFCCRBphocQzuTygXm_a2SIeY

Add vendor prefix for Honor Device Co., Ltd.
Link: https://www.honor.com/

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..b27b8f7b1c5d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -729,6 +729,8 @@ patternProperties:
     description: Honestar Technologies Co., Ltd.
   "^honeywell,.*":
     description: Honeywell
+  "^honor,.*":
+    description: Honor Device Co., Ltd.
   "^hoperf,.*":
     description: Shenzhen Hope Microelectronics Co., Ltd.
   "^hoperun,.*":
-- 
2.53.0

