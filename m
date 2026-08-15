Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5A834A76F;
	Sat, 15 Aug 2026 01:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786759084; cv=none; b=GnkLMQOShSyW97+ArFl2t7Gb0jwPNbsyCSF3jLFhjfrJq0Egpqu8P6NfzY6U1gqvbppVXmISKNSpE5h3YtJd9oqS0wZzgDueom9uGQ2oNHcbQRN4VvPMGQ3u46ARgCAmHBO27SaNESQae3hlRtdbJ0NcfhmJtY2wHEq5JZgTars=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786759084; c=relaxed/simple;
	bh=Lu1ciDr3UGN9nlNsYTXuFJTd6Yl9FiERRJ8UOk1Z1Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jfHRcpy75RLBOsV8pfdf5V8cDyojsiqqd33waBwPXc7RVVi/OG9BH8nippbVURRAS6dysqXFgJCyVJ7yktTZHB1rbT8f35vjnhNcWjQwnBvg4lG2r4/9eYOSs3zpyaxO16HZcSkGpyYGO4IK9nYz8gSZZsArfTsyZrcAUTJo1ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QT+X+iQG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QT+X+iQG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DD31F00A3A;
	Sat, 15 Aug 2026 01:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786759082;
	bh=5lmLAL2bcDbv13JwDq0IXXt8TpckG5QbWoFG1VJqhLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QT+X+iQGOjZLCxyyTvYYweZ3FPVC5OsQ/aVMDn6T/vYXRLaqhK9b9nWy888RmQrvE
	 ksu6/oLqGnd1bEPP7aWxfkfI1tFTR2YqvAOugdfmHj0d9uemJO46LRyf/NRRG0Dlel
	 1ukJAMVfSVmnMw5h2YGdp6NK9QwPYf5c0ckAGiGbmsdhC9GFlp0+3h9WWoqsZUKAPu
	 T8wv6pl7VaNzmAIEk2UvQ2x0QBIE6E5HO+yeunnIS63rMZ8DPHvz1mrVsna99MeKIW
	 3Epp2oaMTKwlLm+JNJ0F2di1/XME1zU2tOxfmo+o1OsoF87h+9OIxtjl2RLjX6clx5
	 teYTQMx/8Gk5A==
From: Guo Ren <guoren@kernel.org>
To: robh@kernel.org
Cc: devicetree@vger.kernel.org,
	guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh+dt@kernel.org,
	conor.dooley@microchip.com,
	krzk@kernel.org
Subject: [PATCH 1/2] dt-bindings: vendor-prefixes: Add Xuantie Semiconductor
Date: Sat, 15 Aug 2026 01:57:21 +0000
Message-ID: <20260815015722.1736831-2-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815015722.1736831-1-guoren@kernel.org>
References: <20260815015722.1736831-1-guoren@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "GUO Ren (XuanTie)" <guoren@kernel.org>

Add the xuantie vendor prefix for Shanghai Xuantie Semiconductor
Technology Co., Ltd., which provides the XuanTie processor IP.

The vendor information is available from the Xuantie declaration
pagei [1].

[1]: https://www.xrvm.com/declaration

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>
Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..89391cb467d5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1905,6 +1905,8 @@ patternProperties:
     description: Xilinx
   "^xnano,.*":
     description: Xnano
+  "^xuantie,.*":
+    description: Shanghai Xuantie Semiconductor Technology Co., Ltd.
   "^xunlong,.*":
     description: Shenzhen Xunlong Software CO.,Limited
   "^xylon,.*":
-- 
2.43.0

