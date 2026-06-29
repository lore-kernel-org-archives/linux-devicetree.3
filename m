Received: from outbound.st.icloud.com (p-east2-cluster4-host4-snip4-5.eps.apple.com [57.103.78.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6644418FF
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 15:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.78.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748120; cv=none; b=A/UsafARRGmFQoOTJLSvZfnVZyBkjiEcrXyt4YZ0VyUzBJ4xktZeWL28dpCKTUk80Kymz3TEK1RoVjY6Q07DaDkVyEYDRhzOQBxXMeF9xlCWC3Y9Sy/8n29KNpK28aWf2df6easo3K4vFoeT3MOG2eacRC0G7O6B2qDEBkB7TKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748120; c=relaxed/simple;
	bh=Spdbueyfuz8uMNAHc3aXLkzTXslDIABc7BDDWY7Qdlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blVracg19eegsI3ElHDxJsS5NjHNIz65VAGGm0KNpdqpsjs4koEalThiVaRLRqOyc3qa1XUM2tITSQQOkWCOuvaeTr/XJohbqyGEEOqjaoz9eQC5NTQ/YjhQ/+T5OF8iQXCGNc0W91AcAVaB4kxeeXExs7PzT63ijNpHJowXwU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=AEIRBiCI; arc=none smtp.client-ip=57.103.78.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="AEIRBiCI"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-5 (Postfix) with ESMTPS id A4CCC18013CB;
	Mon, 29 Jun 2026 15:48:37 +0000 (UTC)
X-ICL-RepId: 019f1411-7a73-7825-b975-40d1db5a9aa0
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgJQUR1fAgoERwRbF0YDU0VBBBcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBJCE0HVQZZHEkJTgVABEZfEVAUcwhDDloESh1SQ1oODFBNAUMICghHA00XXjJTBF8RUBY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782748118; x=1785340118; bh=qXFGG5ROoxDwgg8Mh3+2KsIvg+hDI0p5sUvKNQ3jUYM=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=AEIRBiCIrOrxnjzxmvFDIhi3T868IXV0rbhK4MjN3eonSfD22xGtinOIt2rAhqxv13n1lM5gIODv9Ij87ulneOXXDmmTqxO8qDkb0JGh+p0Odtflwwy3n1km12orrfyxPxIPgBCXgdcGnyi5ioORtMBjZWjBwhU898KoQeQ2y170zTIdh6yXAYg2Rxtud6SKDjfVrd4jCq2ZUJ6yYY7deTTUproo591BovjEsJU6ZuQxI1JpGJZQys7Q7XxmipnyHvc7BTxiRIYHOzFapY8UU2vNszTea14Nd6Xg8wAdKEQYPQX4oOGSvG+eIZk4ISnrB7GFLeAowHjqwIHiZZqBmA==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-5 (Postfix) with ESMTPSA id 6FFB31800424;
	Mon, 29 Jun 2026 15:48:36 +0000 (UTC)
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
Subject: [PATCH v6 2/4] dt-bindings: arm: qcom: Add HONOR MagicBook Art 14
Date: Mon, 29 Jun 2026 22:48:10 +0700
Message-ID: <20260629154812.9066-3-mail@etehtsea.me>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEzMiBTYWx0ZWRfX1hT9esYQwOaY
 y5GNpvwZtaV9vE3c/kewmZcNXNI/Bh+YQlp78s1S296O4VhsNAAiEw9HlqAXpc3MW5+sZzqUw9i
 hK3YWb14CU0Of7Gu3lsG+zkMG65CYq1BwLBSS5FEUvZF7TGGwrltuudf3yIvGeSTuqlu1w6LNnQ
 iOOL//OhWUD1BwkestVJTVXv4kdgfddc1j8vorYs8ardwujDpAxkseRHzXtR9cF8QjHRdb03DAk
 n/3BobZouOJmvGyAJyf81pgRYLrRHzhqHdRIHqpcSR5BRzn/AR7EI0yO4m1j3eLs2vtR99M70PI
 B3EOaHBLTl1vm9b6dFk
X-Proofpoint-ORIG-GUID: O-UOkT6A-i2HqiZETaShYSOlCN0eW0Of
X-Proofpoint-GUID: O-UOkT6A-i2HqiZETaShYSOlCN0eW0Of

Document the X1E-80-100 variant of the HONOR MagicBook Art 14.

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..fd985f8adb0e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1160,6 +1160,7 @@ properties:
               - dell,inspiron-14-plus-7441
               - dell,latitude-7455
               - dell,xps13-9345
+              - honor,magicbook-art-14-snapdragon
               - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
               - lenovo,ideacentre-mini-01q8x10
-- 
2.54.0

