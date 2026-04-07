Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9CF3CAE7D;
	Tue,  7 Apr 2026 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576204; cv=none; b=DBFMOonf8BzT6AQkegrk56Z0SjIqfgEylJFtKx+XXOEi7YbPK+7PBFo3BmxmiLOQkuaMb7iK468Sik/w8DltgLdZB9ZTfpizBb4wxawm7oPNp0ffa8RpaF0yjms1Zetc3uiS2MojZN9nAGHCbtj2b4Ytv4W9sftzbd+aEi2xKSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576204; c=relaxed/simple;
	bh=DH37cfEXF2cJHJVn2jWwCC2NApJXQp6lbIYOXvuL/Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=knVl8ox+LMi+ifu7KZc87WUBB/zlc45dtW6VFiEtAziXSElCcvjqzpmI1wC3OkNbTr2M9hte5MIRkFCMLSSHYMoBUs95lM/Nfwo9CHSRUSnB5ASQ6KrFDKIaIptIlp7YyVXunnr5lNKv/6t0symojTHSoKaOrod4K3h02LIbTfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gY5FTdAj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gY5FTdAj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690CCC2BCAF;
	Tue,  7 Apr 2026 15:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775576201;
	bh=DH37cfEXF2cJHJVn2jWwCC2NApJXQp6lbIYOXvuL/Nc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gY5FTdAjHMsB3u3f/z9odoG3ogONMZbnYaqZnbtpEpv2AGhJO9bqK5fZYl/gKY9Vu
	 VyMj1li0ySl0+gx/xDniAP4MModjatPU4yVZ4UFh3baCW5x+rrnb8WSEh45nhZX9w6
	 1TGBzzE/6IlXHLzLrzIDKjbTO9bSQmgFtyCFNfSHkea87aTMLoWEbM+NIre3bEfr6q
	 FK+bq34WTQrprDjgnqtMDHNfSjPAham/29IfPsxrQpEfU2B56dnXeF64SIIzwtmIgA
	 k5Kmd2d93nT4JoG1oTGhwzGznvavqsVugrZoW2rO70lVDyl0CHYf67GmjZdUrV8S0p
	 CiH92x8KWWszQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] riscv: dts: microchip: sort pic64gx i2c nodes alphanumerically
Date: Tue,  7 Apr 2026 16:36:25 +0100
Message-ID: <20260407-cable-manhood-afcbc9cc6765@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407-rely-speculate-dae3a81ea1fc@spud>
References: <20260407-rely-speculate-dae3a81ea1fc@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=VE15P75fuXqIekeKfGvIuqlcVQNDL/22CSYpQvm0hdU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlXVSrsPxxUs6pMjlqz6vIk9ndLT1o8mql/Tu67zdnl5 1yWKCRXdpSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiV38x/A8/teL+Hc7lk+xE cp2evNE+/luroN9upofcgcCMQ1yaj9QZ/ucIaOtsrexTv2DTx76l3MSx+uTK1OVF3yaWL7OImBu rzg0A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The i2c nodes are out of place, sort them where they should be.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../boot/dts/microchip/pic64gx-curiosity-kit.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
index ed3ff03f3b11b..ef5bff3093fc3 100644
--- a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
+++ b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
@@ -89,6 +89,14 @@ &gpio2 {
 		"DIP4", "USR_IO11", "", "", "SWITCH1", "", "", "";
 };
 
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
 &irqmux {
 	interrupt-map = <0 &plic 13>, <1 &plic 14>, <2 &plic 15>,
 			<3 &plic 16>, <4 &plic 17>, <5 &plic 18>,
@@ -134,14 +142,6 @@ &mbox {
 	status = "okay";
 };
 
-&i2c0 {
-	status = "okay";
-};
-
-&i2c1 {
-	status = "okay";
-};
-
 &mmc {
 	bus-width = <4>;
 	disable-wp;
-- 
2.53.0

