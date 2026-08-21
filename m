Received: from spam.axera-tech.com (unknown [114.118.28.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FEB476CEE;
	Fri, 21 Aug 2026 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.118.28.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306040; cv=none; b=QgGCuzOWd0W4KjCOBpwSHeKCEEIHqKTpdpOTG0e0C41NWkBvQ264JzKv4fT8WL6Sz5mLaR/nxG5YXk87iDXvNrB1yvmglce5qU64Tn3t74OrEWPEkRqIkBR5Qe0jJaexAr5KhERDIWBg4+xRJU1wpMp0xtALD9/b6J/qRzZfsg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306040; c=relaxed/simple;
	bh=m8ENpJMO+5q9DqToqlZ/Fstmi44i85EZuBYwJy4/mX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RQFw4uHsjxrCSkhFRg+IG4PcjBc2YJiwwFSgmnTYnRVkT6R4RpmgREwCuNbSwfNVVH+wQ/6pZZ2JFIudHBmUFUgndYNp2WSlKnByUj5tLeFYwJdVwaa/qZwshvOmajX9wehL60e0FSxRVhnfVG3TbbnE/XrUHulxZocDWc4EOuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com; spf=pass smtp.mailfrom=axera-tech.com; arc=none smtp.client-ip=114.118.28.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axera-tech.com
Received: from spam.axera-tech.com (localhost [127.0.0.2] (may be forged))
	by spam.axera-tech.com with ESMTP id 67L9VwUp010032;
	Fri, 21 Aug 2026 17:31:58 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 67L9USlB009398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Aug 2026 17:30:29 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from [127.0.1.1] (10.126.103.103) by aixinexchange02.aixin-chip.com
 (10.122.86.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 21 Aug
 2026 17:30:28 +0800
From: Leng Honglin <lenghonglin@axera-tech.com>
Date: Fri, 21 Aug 2026 17:30:01 +0800
Subject: [PATCH 1/6] dt-bindings: vendor-prefixes: add Axera
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-ax650-v1-v1-1-e1b013938e6b@axera-tech.com>
References: <20260821-ax650-v1-v1-0-e1b013938e6b@axera-tech.com>
In-Reply-To: <20260821-ax650-v1-v1-0-e1b013938e6b@axera-tech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shi Zhicheng
	<shizhicheng@axera-tech.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus
 Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>,
        Leng Honglin
	<lenghonglin@axera-tech.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787304625; l=891;
 i=lenghonglin@axera-tech.com; s=20260818; h=from:subject:message-id;
 bh=m8ENpJMO+5q9DqToqlZ/Fstmi44i85EZuBYwJy4/mX4=;
 b=JA1HgzKYglG0ShTKDNs/yumkEjW6rXPv/B3oXEC+92EFooh/5gnwYfrGh9R3JV8SNW/U2X3FR
 MyClLG+pV5cB5RwiiBtF/dNflBRrcKjBcxO80cFn1mpwaasrB7gcdY9
X-Developer-Key: i=lenghonglin@axera-tech.com; a=ed25519;
 pk=fo0agzxyiwbJZc3VZRLVthobvWCvq0qAViAw4TxhF80=
X-ClientProxiedBy: aixinexchange02.aixin-chip.com (10.122.86.161) To
 aixinexchange02.aixin-chip.com (10.122.86.161)
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:spam.axera-tech.com 67L9VwUp010032

Add the Axera Semiconductor vendor prefix for devicetree bindings.

Reviewed-by: Shi Zhicheng <shizhicheng@axera-tech.com>
Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..1dbafe682724 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -219,6 +219,8 @@ patternProperties:
     description: Shanghai Awinic Technology Co., Ltd.
   "^axentia,.*":
     description: Axentia Technologies AB
+  "^axera,.*":
+    description: Axera Semiconductor Co., Ltd.
   "^axiado,.*":
     description: Axiado Corporation
   "^axis,.*":

-- 
2.34.1

