Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F40239A4B8;
	Mon,  6 Jul 2026 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349090; cv=none; b=MwR8kk6QjTjBNWXZpJcv414amylEeHLrmwwCWKCYf94R1qZ6IOTRb+15cuEId4oidb2lpNDAQkFBfbgEpHHjEHXfYkvMBhQezPCjkkZ6yt026DWmgfUV2jNOn5YD6Q13L9OJmGJt4dmYdG/1BcY8dCQ2LUQ3viKTm2w5xkijOr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349090; c=relaxed/simple;
	bh=BQrPLArvukHrTNc6K2WMCKooW5UPCtf/2sRpWXuOGNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YJmfITwB3MiPD757Ps1UAX4MPu/Dftk2xHFsRxTLkJMnJmjRoGJJuJVbNx9KusQ+zGvAYq6quJEquWTYK8/JRJsw4qtmjgcc+GPV5/bxRioQxxwWzfF+xQTfCZXuLRV2NXq9DGy4wX/LshJaD1hpukOyOjbHzWrfi5vTdlDA0eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qMKxiTzD; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qMKxiTzD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=j1ASJD5fqsAwFFcUNYkquGQJiBfSwiDNs8HIU4aL3mY=; b=qMKxiTzDxT45/y2B52wZlFx2pB
	Ny1/wun9aae6xoqGdZy0DDB6cmfye4eAQu0zDMlYYJjuBTL+bSKWq00Bi7FlDmuuDlP3FehcG2O4J
	64dupi/y9rRVQDFIo4lfiT583f46AWVv1eq3tPjRPOPRRLSCvj0i1x9d7mNG9JBQOIcr/j6qziypE
	I6ZhXdyixzjUbu6QZAFR3tMY4jEZcSlVkuIaALUGdCOGJfzsWktaGcPDVHPIUm/CAiVu64nAHjI1R
	E46n2GEeCYN0AA9VlcA3wSOPzAq9BodL1KBGTgo6qQxcMEHq5ZwoEbTRW+3UHhBbTaS8nrT9Lyz0O
	uPHtVO0w==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wgkYu-000K6q-2c;
	Mon, 06 Jul 2026 16:44:44 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wgkYu-0006Gb-1W;
	Mon, 06 Jul 2026 16:44:44 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 2/2] arm64: dts: ti: k3-am642-tqma64xxl-mbax4xxl: add icssg1 ti,pa-stats
Date: Mon,  6 Jul 2026 16:43:59 +0200
Message-ID: <a03189aa138f74955a03b9fe6018a17bf7e2ce8c.1783348781.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <aaec2ddf7cecb58ca0af37d4f03afec571804757.1783348781.git.nora.schiffer@ew.tq-group.com>
References: <aaec2ddf7cecb58ca0af37d4f03afec571804757.1783348781.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28052/Mon Jul  6 08:24:35 2026)

From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>

Add missing ti,pa-stats syscon phandle. In addition to providing
additional ethtool stats, this avoids a "icssg-prueth icssg1-eth:
couldn't get ti,pa-stats syscon regmap" error message.

Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
[Nora Schiffer: edited commit description]
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---

v2: update commit message to correctly describe the error message this
avoids.

 arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
index 46be6824dd163..b9e52d8bc8524 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
@@ -110,6 +110,7 @@ icssg1_eth: icssg1-eth {
 		ti,mii-g-rt = <&icssg1_mii_g_rt>;
 		ti,mii-rt = <&icssg1_mii_rt>;
 		ti,iep = <&icssg1_iep0>,  <&icssg1_iep1>;
+		ti,pa-stats = <&icssg1_pa_stats>;
 
 		ethernet-ports {
 			#address-cells = <1>;
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

