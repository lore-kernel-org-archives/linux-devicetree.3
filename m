Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602450;
	b=P7HRO7I++dnEIw/S4jHo47MoC9LA1R2KYt0jhnSy4Xm/HvCB3XlM4CYKo2TLJ+CHCvKS
	 SNHYA+CXNzah0qqFjUEo2hbMH2v5uJDT0sg/0rKGhLn/BMyfvWPqvjBlmYtkzcpfPT0Xw
	 TXOeSc2DGSBnl8fn2lspGQ7dYY/qJvZIFzb+mV6nATK008qJxEIRbjctcBY4UBgcQ1C6O
	 XTTVG/SXRysT3jotpBEBFLQWtSsg++9gJKtKMuZBxcHc0rtts8be/ZY3W3/tUKUHtecoR
	 Hz6V00Hut6uEWEVIzDMraCw4w7FUNf99JHKAMidoim7ktdaFPcgdc9FPz16l1XABM9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602450;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=Y6uWceI6gpLxBxKPLgaAqLdMT3DH76IqAUvB8Og7sDw=;
	b=VcmvKSMLZx6VKStwS84YU8tyCiefeyEg4CxQFXcTSqqx6pmKUJe0FHaAZ76pHcBZ5dyT
	 H16SNMD3ByrfxjXYN6XNDc/RRvU+OnuQXp6tQW98uoZN1mcuncBulWkgcrGJwfaO876+l
	 LEvCMIZxlsm60wedOdJv9I4MKsYJhKyZ0aUUYGJEoTHR4Ob77jydRfPl+Hdzig1U0c9h2
	 b+ib0tsUI2NbwbqqGOuBnYUOMJ3dltaZ5629Zy/DuIbKB2vlxOSS6Ie+++uRM/sNp4ZBA
	 t5wFzqDhsZi6WWALuNIADYPjUS2MOwQhzGrT4PeOiYRwUz6ov9iLB7gwtfGI+LUCykg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alessandro.zini@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=c7S510qW;
	arc=none smtp.remote-ip=185.136.64.226
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FF1606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76FF1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alessandro.zini@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=c7S510qW
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202611251027266b36b3c63700020741
        for <devicetree@vger.kernel.org>;
        Wed, 25 Nov 2026 11:27:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Y6uWceI6gpLxBxKPLgaAqLdMT3DH76IqAUvB8Og7sDw=;
 b=c7S510qWBbLU667g4AFTz6LEs349ZUa7MynApLhpcb8FMW10u/PwCr9NRgVUfQQyUeDUNC
 ly4q9Dk5VAtEDbNzQILQZixgYaYIuByc+SqX8lbIBKlG/dnmRiFPxjDD3Jo5Xu34JM1EEfW2
 E4ZiItxL0aS6tHWbqbJ5/ObLS91UB8ZnyfJfukz4XnTKcIKGn5vccAgA/NDrq/e33lqDOlJ5
 2/6/mf+RtCEor3QGhyOTQP2460KXSrG3qrODRD945vVY82VZvAnnuNHUK0gXqwANLwgbnzV8
 YmZ46CKHo0LIuhS3KwhCvmjipE89oxhM8AnyMqlLpEE5okkf/cNz4kGg==;
From: Alessandro Zini <alessandro.zini@siemens.com>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	thierry.reding@gmail.com,
	sam@ravnborg.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Wang Yang <yang.wang-wy@siemens.com>,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Goworld
Date: Wed, 25 Nov 2026 11:26:58 +0100
Message-ID: <20261125102700.126248-2-alessandro.zini@siemens.com>
In-Reply-To: <20261125102700.126248-1-alessandro.zini@siemens.com>
References: <20261125102700.126248-1-alessandro.zini@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer

Add the vendor prefix for Shantou Goworld Display Technology Co., Ltd.,
the manufacturer of the ILI6150H6 LVDS panel.

Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a846ae023584e..c3515feddad22 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -708,6 +708,8 @@ patternProperties:
     description: Google, Inc.
   "^goramo,.*":
     description: Goramo Gorecki
+  "^goworld,.*":
+    description: Shantou Goworld Display Technology Co., Ltd.
   "^gplus,.*":
     description: GPLUS
   "^graperain,.*":
-- 
2.56.1

