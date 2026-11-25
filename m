Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634852;
	b=V+HR5d7ZTVMlpSNMZPtOGuazibEqW/KVpgBWCFLXRi2X3VXja9MeuSuBw2Ud3ctAliNT
	 8JrgMWpkvBFABknem8lAG/n9xIcVjqi+HcjPB48pwgNZTxghf1i6n1AuKQLOqXmK8kdOu
	 FDL1GqtxllHo12GXCEtEiGypjy2QzvqIYrnIAVLSLoyCejaeENZKFKVwxpZRj1+w8xFpj
	 ki7gDOqzjCSo9xMpsTpJxqE82xf4doV5Ube8j91rquH76juAWl8dkxokodczzNAQnXMmz
	 4+m5Kz35N8HGd/9YdXqRUCGpr1k5vu31KjEvrIvI78ZyEpI/B9UQPqR84pd1YVuhZcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634852;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=+c+7QLIr/6xnjzeRbgVMydkl5tX7ycl5LcLTqkY0J/0=;
	b=av57pgFpfUNB8yC0MBhWiLSCS5vzGCeQPjiSbaVpTlWiSYN/nRv9HmrfNuK0afFTIc/o
	 zM7p3T152N4N9dhOF4Hx94100S3+9niQNCkjliCFdOco5PZJLFXbZddtTtquJDr+jTVwx
	 1Se7cKb0fEw/TxK4iwQZ2+cjc1r4e/iOvnFPBETMxSBhKmkj56YqEjxZwkbRUIVW+/2bg
	 pynQzryr4RIqUsVo9KKJwZOmxBO8At356YtTsqvotd5oIOWUqbFUdBcq89eVbqdwiJ5w6
	 hGcfA33t/Jd6+ySLSJgwchEdUlert3bmYhr2vg0QxqqhRjdTDgqtUJzlLLUBxk7rMig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=V30do8Rl;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFD6606A33B
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 19:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CFD6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=V30do8Rl
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E3ACF4E41780;
	Wed, 25 Nov 2026 19:27:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B3F8E60480;
	Wed, 25 Nov 2026 19:27:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1693811E6B0E6;
	Wed, 25 Nov 2026 20:27:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795634849; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+c+7QLIr/6xnjzeRbgVMydkl5tX7ycl5LcLTqkY0J/0=;
	b=V30do8RlFhLHzO5vG+eh0gVd9UL8GeRmPK0qmpfxgRr5vjtnrbK7vwONbNFzV0eA/H2KSZ
	wrlQ2ETQcz8uo7N7DTY6zV3VVIO2cyKsj5pwHqWKCsWeE8Dmf1oHAeW0o5/zexuer8E12V
	MEIYGCPm18KgSO2h8HKhZ+Q1wTZPTTgE7O//fIfbwT4cH04hQUpFvDUW0OdwiAP9B5RpvG
	+3/GsUOzw33h9Wv3jYAPXeEG3It0ImDTfqR8uk/uKn0epBPWlgFVaFOH3bfOBWewicRLoV
	F8Ywi4ECZjguEv1BxotHjOpofLOdZ3kI5p0Bwno0utCJkKB8UxXMNQ+1qDbaJg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 25 Nov 2026 20:27:10 +0100
Subject: [PATCH v5 3/5] MIPS: eyeq: select the EyeQ5 MSI controller
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-eyeq5_msi-v5-3-72346cd10736@bootlin.com>
References: <20261125-eyeq5_msi-v5-0-72346cd10736@bootlin.com>
In-Reply-To: <20261125-eyeq5_msi-v5-0-72346cd10736@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

The MSI controller is part of the EyeQ SoC. This change selects it by
default.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ed17c9b1624ca..19dbf24684b23 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -632,6 +632,7 @@ config EYEQ
 	select CPU_MIPSR2_IRQ_VI
 	select CSRC_R4K
 	select DMA_NONCOHERENT
+	select EYEQ5_MSI
 	select HAVE_PCI
 	select IRQ_MIPS_CPU
 	select MIPS_AUTO_PFN_OFFSET

-- 
2.53.0

