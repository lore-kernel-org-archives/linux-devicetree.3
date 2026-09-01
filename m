Received: from spam.axera-tech.com (unknown [114.118.28.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AB047887F
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.118.28.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254417; cv=none; b=Oy6K/okuf9QOiF542hi34DMhYFAb34BGKmGXzxgVHa0crBrQ7h6u298Gh3kx4TmSKTxmfpQJfNRnYPVEH9C0JbM1iNqK09zLCZv0SWTSRSf8l32VtKlk9O8ZdnxqRlFwksM/6ZrDF2sdlP21wkN5FDBcfgSj8gqiAjPU0QYJcDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254417; c=relaxed/simple;
	bh=1NLmWOqVSQzUCy3evMNz4+9P2H6CYdGvfxVtcmMxefw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jAniOc5Ur4E55zEKhxbCDBqu436vKw9uP+CyUoSQXW6R/TpnpF+Hp5bGQTX5Xz3RKx4F4FMLlF5KWBgADaTA92Di0CEUBaSj5qfNz15DJSqG6jD4C/19UZhHPP5rrnwJxz9UZH92EVDuK7B4mXvKvztQXgBzI1D51E6Q4mPB5Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com; spf=pass smtp.mailfrom=axera-tech.com; arc=none smtp.client-ip=114.118.28.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axera-tech.com
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 6819Jedx047683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Sep 2026 17:19:40 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from [127.0.1.1] (10.126.103.103) by aixinexchange02.aixin-chip.com
 (10.122.86.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 1 Sep 2026
 17:19:39 +0800
From: Leng Honglin <lenghonglin@axera-tech.com>
Date: Tue, 1 Sep 2026 17:19:33 +0800
Subject: [PATCH v2 6/6] MAINTAINERS: add Axera ARM SoC support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260901-ax650-v1-v2-6-993bea305476@axera-tech.com>
References: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
In-Reply-To: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
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
	<lenghonglin@axera-tech.com>, <hlleng233@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788254374; l=877;
 i=lenghonglin@axera-tech.com; s=20260818; h=from:subject:message-id;
 bh=1NLmWOqVSQzUCy3evMNz4+9P2H6CYdGvfxVtcmMxefw=;
 b=WCq5pTi0TS2lhJrmEwNS0rD2CNDuzROSe6Nuk76Ggp/OIuQGiqZ0vaf8t1eEZNaPT45y8t1rX
 MG8n1UzYLavD6GDMN1rZB7vAFIiPlrFgZyOKUwpzFkWlCsBGnVBia9T
X-Developer-Key: i=lenghonglin@axera-tech.com; a=ed25519;
 pk=fo0agzxyiwbJZc3VZRLVthobvWCvq0qAViAw4TxhF80=
X-ClientProxiedBy: aixinexchange02.aixin-chip.com (10.122.86.161) To
 aixinexchange02.aixin-chip.com (10.122.86.161)
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:spam.axera-tech.com 6819Jedx047683

Add maintainers and file patterns for Axera AX650 ARM64 support.

Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b7094a616afd..b3ac89227856 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4398,6 +4398,14 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/sound/axentia,*
 F:	sound/soc/atmel/tse850-pcm5142.c
 
+AXERA ARM64 SOC SUPPORT
+M:	Shi Zhicheng <shizhicheng@axera-tech.com>
+M:	Leng Honglin <lenghonglin@axera-tech.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/axera.yaml
+F:	arch/arm64/boot/dts/axera/
+
 AXIS ARTPEC ARM64 SoC SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
 M:	Lars Persson <lars.persson@axis.com>

-- 
2.34.1

