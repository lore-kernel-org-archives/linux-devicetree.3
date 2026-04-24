Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C27B39A063;
	Fri, 24 Apr 2026 19:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777058499; cv=none; b=luCIgO/FOv65oJylPrNOK4nK0q5X26mSGsjvy2FU/Gk72xJr5yYcu9+kaXtlCMT9VIbGynhmOxbEZntKV+S/rsfSJm21YZYibOtAjMciP8LscC6EzWZ2RPms56pMoSx7V5ZJbiDnPoqgN4r94+mz6cv/XSVPZGnvWMlLvQ7S4Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777058499; c=relaxed/simple;
	bh=CDfuH2SmmN+K4WcmOTWBN1VqRl4QabbTNxYayYalR8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRQwPM6Id8NpCCWsyQpkW7yR0JKCvBM2JmWIODaHS9H/YaJrPMNOeDM/vcp3NfyG/Rci7riu6IN/33XpF8Uw7cc43u40sK+/u2M6HAY4mjLXYa9nJ9T3pkCAbT20awwYV9DSiaHtPh1XhgzMVFCRXRzQdg3NDF61DCGONVSMuZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PsSCmXlt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PsSCmXlt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777058498; x=1808594498;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CDfuH2SmmN+K4WcmOTWBN1VqRl4QabbTNxYayYalR8c=;
  b=PsSCmXltqccWUYMCjnTc2dKX5Czb/md8CP01gkAgQMHNEg9ixghNtncJ
   GY7OQSZOMjey/ZrFAO8W85Xyn6Y7JN8Zj7jA2q97vpuAjMZ+SxI+UrZ5f
   OGga1Vyvkk4uZ7NkIQVwOyDVDCluvWjTEHw4pznHV4qjKHdHys/5nEeCR
   N/RG0Lnz6AQCOn8uOwi5IRr6tpYlxKl8gDcDvq4XyA/lq8n2W5IiQt/B2
   ZwfPxhtIrEYJLSR6FIdBf4f46j+eLLlqSCxFTU1NBAiDAAbTVXA5H//NZ
   6rACQhgMAnoLfPl2ubLmZqkcXX9vp07bPeBcWllNTooubTY3dKCQYi6De
   w==;
X-CSE-ConnectionGUID: uYNhbIWLRp+KYOlTL9idQA==
X-CSE-MsgGUID: ud506sVPQAWV5hFFBzAbEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="77208284"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="77208284"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 12:21:38 -0700
X-CSE-ConnectionGUID: maz5UlhaQjSklYtwVIvBww==
X-CSE-MsgGUID: 8ypUnF/8QDiCDFus7CbLLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="232040496"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 12:21:35 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dawid.glazik@linux.intel.com,
	maciej.lawniczak@intel.com
Subject: [PATCH v4 2/3] dt-bindings: mfd: syscon: add aspeed,ast2600-i3c-global compatible
Date: Fri, 24 Apr 2026 22:21:00 +0200
Message-ID: <41d66492e1a1d42f6888459288311094c8b7bc51.1777058942.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1777058942.git.dawid.glazik@linux.intel.com>
References: <cover.1777058942.git.dawid.glazik@linux.intel.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

Add aspeed,ast2600-i3c-global to the syscon binding compatible
lists to document the AST2600 I3C global register syscon node.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e57add2bacd3..50c07038122f 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -49,6 +49,7 @@ select:
           - apm,xgene-mcb
           - apm,xgene-rb
           - apm,xgene-scu
+          - aspeed,ast2600-i3c-global
           - atmel,sama5d2-sfrbu
           - atmel,sama5d3-nfc-io
           - atmel,sama5d3-sfrbu
@@ -161,6 +162,7 @@ properties:
               - apm,xgene-mcb
               - apm,xgene-rb
               - apm,xgene-scu
+              - aspeed,ast2600-i3c-global
               - atmel,sama5d2-sfrbu
               - atmel,sama5d3-nfc-io
               - atmel,sama5d3-sfrbu
-- 
2.43.0

