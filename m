Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837554;
	b=SLmssRApmZZ/xKG6NJHz5q273RBbB3NasSOnQF6jE+f/5koXYkPV5JkSQ0JG+7/QXQur
	 a3gE5UEH6+fBhtS2F+HUwZBaFkkJCBWTOh962i0xv/WmzQnY3DPvPpfb45zNvRWZhNibe
	 O4snwQM695Hov3D7Ccv4zZd0/K0MV/MxCyf75epbd/IglLv4v4hg+wX2RNQbr97kwYJ+2
	 12cE63vssrkF7xXfMQPTckLMXH01haQ5/0Vf6CAImC3kItM8UAZVdfBj3OLsw4tUyxthP
	 nDKTl/y7g7Tl6TMSIaJjtiRqt/zmsqqG1J6/cJZzq404rSX/L9F7BJlKTcekh4NoBBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837554;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=+c+7QLIr/6xnjzeRbgVMydkl5tX7ycl5LcLTqkY0J/0=;
	b=vKeK5qeZzko5tMrQqxxH8ozRVdjtRdaEzQA6zKwNgbHGEg80fBJnQk8QmHdTqYbrc0Yt
	 xXlLB+Q3n2QHVPUsczBYx1LjaDkmYzq9FHP2wQRvxNrOUP+oNefXolaAFmOXeofwfJVW4
	 0j8ic3ukMVDXuM++ePwxWLQ1EYjae6Noi8+ommnyhmlRO87OCu57tst6C5Q848EVoHZOG
	 62krQtdPf4bt+iQaMcfa5utK4GeMzMoZZzrzQHVkG5mIO0AsXTTA+TK1emfjdZHS/40bv
	 QNBe0j+G/x9luiochNfvIZ5ZJsrhQEvzVVF8ctRgAm1x1/CEUs89CWCMiW/ZyROE0dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Oqr06SAB;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DA6606A893
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99DA6606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Oqr06SAB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5BB194E41600;
	Mon, 16 Nov 2026 13:59:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B5396023F;
	Mon, 16 Nov 2026 13:59:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9B5111BC0477;
	Mon, 16 Nov 2026 14:59:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837551; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+c+7QLIr/6xnjzeRbgVMydkl5tX7ycl5LcLTqkY0J/0=;
	b=Oqr06SABkTCcLuKn9GstcTXG0gpKEzHE3UWJFl40TGAJCKpvRpKUucQ9506Eflw9CC0w5a
	1tI7a04edAe9z/3N9aQA4IsohieZ3OtIoowX5JQMeFxJesE2i2Amnnft8SURcYSJfOp5Us
	uq56fkN5grKmyXIUDCMghLb20Mp7cJ3/ubN11vEKI3paExn+3pIAWF/CJrTvpMfvYqp9h6
	he7rQTHhyJB/Kv5AHiYC0miEyV8p3a0/7i4bWfO4oprKoiz1FUti5A3zubqhKhG4EpxOBT
	YrSaZlbd3LUorpkFrQml0gpbBg7HxXMVScuLYwEjb8H3gPrcVGQ8zkrK51odRg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 16 Nov 2026 14:58:39 +0100
Subject: [PATCH v4 3/5] MIPS: eyeq: select the EyeQ5 MSI controller
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
Message-Id: <20261116-eyeq5_msi-v4-3-2e1233b014b0@bootlin.com>
References: <20261116-eyeq5_msi-v4-0-2e1233b014b0@bootlin.com>
In-Reply-To: <20261116-eyeq5_msi-v4-0-2e1233b014b0@bootlin.com>
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

