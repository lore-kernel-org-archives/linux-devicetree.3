Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B7814F70;
	Thu, 25 Jun 2026 02:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782354080; cv=none; b=AH35VKgq0zvWTZtYeIrZMCnlLhUw/OiZMLPz0+mniihmQwy5/UxdFPLM5x5qe3OAzazJGVIz4mGK+MDpz0Q22SfegkssT3rCSQE7KJxh+m946UaBRru8Urz0vrw/BQEV9L/EcHs9NurzkCMUJ2G5xd55SkWmNV4oexmw0yh0Vok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782354080; c=relaxed/simple;
	bh=n3FguokLKa5XF/sHoEw0fV37VwkwvZ7zE6bkX3xLzaA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GXxGpHglI23+8XZ1Oc+/8xzTquJ5Gg3LH5w3Ei57khlV+kOkBIGFY4CVEs1wnZOM1HRBnzrsdl1QeEkCCvg8fTFqxS1NGgis+53pcAJIJm4pM6VedD/Fa1jFivKjcD8V7frPmvHqfjG6y2O3XZ0/e5eLWZZ2pyB4Cnhtwx4BEEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=GK2jCSfh; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=JAB2YpIe; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="GK2jCSfh";
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="JAB2YpIe"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1782354075;
	bh=RnKiHfQO/8/K95dyssAfJMF+vU30tPTOGITImD896ZI=; l=1077;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GK2jCSfhTVi7xxjKWuNQJ/6czZ3UwIWZSg510rIBqBpnFVe5hP/QpZffxkVfa4LHh
	 0Dp9+YXgYu3WOuclV9E0c/Y14Vfy8T5/MK4xkQ3qAQp+fBo6duaCPDvbAo9tGRXh8A
	 qR39zjebfpCauBq5hrnDcRc0VcvL1sOK5nWrk/QM+DhG+19sPIM+uV4xaPnWJ8prrs
	 qAlBlwKkXlojQj0Xx9PS0Q1IplNA9bxI/hA7U8a6b0qrLt+n+S4REmgvOSNaXNp307
	 vo1LdXyBFJBDz1E7RtMQ8ZQ+tMTt/8kqImXgCf1HS1/5D0gflkFqXys3uw2jkdSYiI
	 tJabopmOTGuyA==
Received: from 192.168.8.21
	by mg.richtek.com with MailGates ESMTP Server V3.0(1128086:0:AUTH_RELAY)
	(envelope-from <prvs=163233BBEA=cy_huang@richtek.com>); Thu, 25 Jun 2026 10:21:15 +0800 (CST)
X-MailGates: (compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1782354074;
	bh=RnKiHfQO/8/K95dyssAfJMF+vU30tPTOGITImD896ZI=; l=1077;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=JAB2YpIeP895q8KmAx5qm2FZP5bmjOkbZ2ERNB4lp4CL2ZpF9aNyOWqMEO/xzBipJ
	 ruyTYgbB+BaUHw9sOWOqJDzsAQAldZfdWQfaZZJqUdfIH8jVfmqr8npRGJWw+k9E0W
	 s+h8JLjcJrsB91stOyN+DKb0QReDV3wb+zSKPK+0EJvmCW3Qob2qKRP7FKdpuSxZQX
	 mm48IDxU/EUy42ODA5w/zC87aXSoj7e0bu3dYqV6xVaXBVI+FQpPVwzUHHAT91jIQu
	 SiFaPYpwxozIeyNYSOW5sUi20qa1Mlr1wg47ptPY0T4BrXgCvwqm8Tt10C3TynKlWG
	 UuK+SoSgKNaUg==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1155896:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Thu, 25 Jun 2026 10:18:36 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Thu, 25 Jun
 2026 10:18:36 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Thu, 25 Jun 2026 10:18:36 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, ChiYuan Huang <cy_huang@richtek.com>, "Yoon
 Dong Min" <dm.youn@telechips.com>, <edward_kim@richtek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] regulator: dt-bindings: rtq2208: Label mtp-sel-high property as deprecated
Date: Thu, 25 Jun 2026 10:18:31 +0800
Message-ID: <d111d67d40cc182a2ab8c6292e4ffff9c7dad9ba.1782353659.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1782353659.git.cy_huang@richtek.com>
References: <cover.1782353659.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

Since it can be identified by hardware register, label the unnecessary
property 'richtek,mtp-sel-high' as deprecated.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../devicetree/bindings/regulator/richtek,rtq2208.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/richtek,rtq2208.yaml b/Documentation/devicetree/bindings/regulator/richtek,rtq2208.yaml
index 022c1f197364..08648916e1fb 100644
--- a/Documentation/devicetree/bindings/regulator/richtek,rtq2208.yaml
+++ b/Documentation/devicetree/bindings/regulator/richtek,rtq2208.yaml
@@ -42,11 +42,14 @@ properties:
 
   richtek,mtp-sel-high:
     type: boolean
+    deprecated: true
     description:
       vout register selection based on this boolean value.
       false - Using DVS0 register setting to adjust vout
       true - Using DVS1 register setting to adjust vout
 
+      The property is now deprecated. Will be identified by RG HW register.
+
   regulators:
     type: object
     additionalProperties: false
-- 
2.43.0

