Received: from naesa05.arrow.com (naesa05.arrow.com [216.150.161.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700993E958C;
	Mon, 15 Jun 2026 12:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526093; cv=none; b=LXJXHl2euCuxH5Z4HUnL45MTO+YBhrKcqxbc991j/gQSI59DEF3JbnbVExuqgchzg15Nbbkj5mwOiKG1R6di1veqWBRB4ZAywAoFC6Y+JeBEbuK5DfswaTEnstJEA24YQnbrwcj1QBztLiMn+FUKNmQ6VLH6O+9sWfmoZe7gM/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526093; c=relaxed/simple;
	bh=xjT3O6Wbv1sZ5vYmmAeeACQt2ByeOdf6TjKazJsl75U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fWHnTvZ4EE2zirFj3bAA2Y61UvhyOk1Ok+QmypI3h7KnXkPEMJe67U7+L+d2jvpKBgFvZS3ZndJszCko5BS2bEMHyeM10gcUFz7ZzHOUdfwcqdwN6xyj8Zf7u0pZzhuzYqBq+uFUZbkY2vCZ1vcKx1xXmfU7cWfNFPFXFvew8+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=runROUNY; arc=none smtp.client-ip=216.150.161.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="runROUNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=973; q=dns/txt;
  s=NAESA-Selector1; t=1781526092; x=1813062092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=93XT2CFEttEQnwRkUkGt+mqMWaXh6HjcoOK57M858G0=;
  b=runROUNYwXq9UV5Nvfuqu3ef4gxVibwB9rxeSOL67wP53hox6dPpyPpp
   fzFEdWbcuMJCCXRRI0/fQmyBj7NFPezBq4N2Cg+K79Gjmx58kQNJoM2kS
   tQsKdf/pb6zQueoDEjquSV0iz1JaU9h6EUTKva2OM9Z8Mi76CwauOM8pV
   Dk3HAL2lfccMf1JGi37+vXQIwK4+HOx9DFrff+nmHp910G9HZdjn9CPsC
   yT7NvCaaWaYwMZnW/40GQDdUPAMyo8w0GVSc1xD5AJFdiR8b/ZMQYlihQ
   OBlbKB/c7DymfdcdjyXJCvvpRC1K7hOwKfIEtF72NZov7IAD5aLifWWN/
   w==;
X-CSE-ConnectionGUID: /1a50GmWThawflrZlgHpWw==
X-CSE-MsgGUID: WF/9G7yfRPmsvPZ/5C+hYQ==
X-IronPort-AV: E=Sophos;i="6.24,206,1774332000"; 
   d="scan'208";a="55984206"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 15 Jun 2026 06:20:23 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Mon, 15 Jun 2026 17:50:16 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH 4/7] dt-bindings: mfd: syscon: add ESWIN EIC7700 compatible
Date: Mon, 15 Jun 2026 17:50:13 +0530
Message-Id: <20260615122016.1110206-5-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Jun 2026 12:20:16.0973 (UTC) FILETIME=[533DF7D0:01DCFCC1]

Document ESWIN EIC7700 SoC compatible for syscon registers.

Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e22867088063..7d3365601249 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -62,6 +62,7 @@ select:
           - cirrus,ep7209-syscon3
           - cnxt,cx92755-uc
           - econet,en751221-chip-scu
+          - eswin,eic7700-syscfg
           - freecom,fsg-cs2-system-controller
           - fsl,imx93-aonmix-ns-syscfg
           - fsl,imx93-wakeupmix-syscfg
@@ -175,6 +176,7 @@ properties:
               - cirrus,ep7209-syscon3
               - cnxt,cx92755-uc
               - econet,en751221-chip-scu
+              - eswin,eic7700-syscfg
               - freecom,fsg-cs2-system-controller
               - fsl,imx93-aonmix-ns-syscfg
               - fsl,imx93-wakeupmix-syscfg
-- 
2.34.1

