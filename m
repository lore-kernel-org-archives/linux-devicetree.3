Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58292868B4;
	Sat, 15 Aug 2026 01:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786759081; cv=none; b=C8gbxiIhyvSjrGq322pV34gUPzM3Pp6fQc4cROUKolDRxm8/dDt+a02mY1q3E8vpomCT3Q/L+UmqUNAc0hLG4RIiMYub+EU8LvPvY15+gos8MxEMNcLnxbYmARo/FVRblt8pLJfAPuT+bMrozaw2Q92XRMj3XYl+23zTuuPr6W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786759081; c=relaxed/simple;
	bh=itN1arvTPlPh2nR8v/siBreFw80nWKZu6R5ZpIOSx3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tOmgRe4HrMhoJJUJB5BjOLRm3ZW6HMIKyCVbPRqsyQZ7NTO1sag78VAEykkZ8eXeH1maxiu5QK7xqMnRhhaPWBesCciAno3loeKaL9AMKQxiTX6+zbXWPvDocqQuk2qEie4CpI3ntXNT8gF78W9GFNdvFg7d9L/7GfvpwCodJLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1ZnTeLF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1ZnTeLF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FBA1F000E9;
	Sat, 15 Aug 2026 01:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786759080;
	bh=rx1u2vR9HpIVmw5IjJJbTK6HYVGFK1DvmadtnCk63NI=;
	h=From:To:Cc:Subject:Date;
	b=Y1ZnTeLFgA3QtO+GxscAANY2o3OpcXW4mZIY+kueO923p4v+VIT92LwsTUVijS5r8
	 YIomW2R3I1qRWGPiSQFnBz+Vqh6trsYhblcsKxLW5yfOC4Eu35JWik1E7ueQLObdDl
	 FnfpSn8qb+9EIBBF9JzQQwsl3hm1UuWluODrTuGDxKGr4O+8Aiz/JJncpU1JLsgR0W
	 mxuELNGB9QKFEe2/hlkxD1tHeycbFLivweTZmkiIoqGgDxbeI1P0meri81Z+aqTfeN
	 d61sJKa6Yg+CdQY2g7OXppekm5VXwYuvqulRKUyTa4mkcYddS4+moTdA/i54qc7T01
	 +nSl2USH8pjWA==
From: Guo Ren <guoren@kernel.org>
To: robh@kernel.org
Cc: devicetree@vger.kernel.org,
	guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh+dt@kernel.org,
	conor.dooley@microchip.com,
	krzk@kernel.org
Subject: [PATCH 0/2] dt-bindings: Add Xuantie Semiconductor Co., Ltd.
Date: Sat, 15 Aug 2026 01:57:20 +0000
Message-ID: <20260815015722.1736831-1-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "GUO Ren (XuanTie)" <guoren@kernel.org>

The RISC-V CPU bindings currently describe the XuanTie C906, C908,
C910 and C920 processors using the historical thead vendor prefix.

Add xuantie as the vendor prefix for Shanghai Xuantie Semiconductor
Technology Co., Ltd., and add corresponding xuantie,* compatible
strings for these processors.

The existing thead,* compatible strings are retained to preserve the
Device Tree ABI and compatibility with existing device trees.

The vendor information is available from the Xuantie declaration
page [1].

[1] https://www.xrvm.com/declaration

GUO Ren (XuanTie) (2):
  dt-bindings: vendor-prefixes: Add Xuantie Semiconductor
  dt-bindings: riscv: Add Xuantie C906/C908/C910/C920 compatibles

 Documentation/devicetree/bindings/riscv/cpus.yaml      | 4 ++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 6 insertions(+)

-- 
2.43.0

