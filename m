Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309544;
	b=B9sqv/9ITU/xFjsxHu10S77Y238VdcTADjbTVcKsKPJgvn/BYIfdnDJLSXEnUpeYG2fM
	 8/sgBvdrb04+HBPqQUuuubX4bkyHGTKuMMdiGkHhBtM3Q9k2Fgu2mwM4Fv7GDp3WF1JkJ
	 K3XSLyNxmaUYthTtmIg8z6ETMciospEWCbJVIkmTjQAy9aaFbD6jFS7mMeJ4f8u/8cYa4
	 PDznMn4WDLGdkUwGLMl6IArIoXXuc4zFdCH+4Yu56/3zTuDw3+9v2GvqpbJkJjlIwHLz6
	 YSIjn2FwTZRuyYfYh6ZjVKjRYsbyfz3AqpGgyZLswTH1TvGPOUnZegLQJOFRo0CgwzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309544;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=px9tbpypANZPryk6tr7xmZkE0M/XEzzIsLPl8mxkXJE=;
	b=PLJX09TF4DNrUGa43QvpuqRAm6j8YKiMT97Lsm1owKZpEcjxiWiU2vZo6bfoK8gUoUAi
	 HCnTcIzxNfWDu4eDGkQ6oeoS+gDXmMaegrlWeY+39Ex0/DSt/IFdhFUUZ8MBm1yvy4D/8
	 QB0qeczUdsVzhAxsD42xx0zl+3MGLOF7/Blb4W5yuZe1LZyxmmNjbTuZ+7mGXHvGfFozj
	 g4Vblw+QiYJUHB5mfpSvW2RhGYW+OkwTz0LJAwgNI7j++xp4UQ/5TByUqABIbkyCx9tn0
	 13yAGvDPZTX1jigGgkkfaVjOOPbDjtF1q6cR7oTthfzq4WyTigCskPh8SAu/RPTx06g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W67ewno9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A4A606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 21:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W67ewno9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 306991F01816;
	Thu, 29 Oct 2026 21:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793309543;
	bh=px9tbpypANZPryk6tr7xmZkE0M/XEzzIsLPl8mxkXJE=;
	h=From:To:Cc:Subject:Date;
	b=W67ewno9Li7vAcYBwgWqfaiXElS0bUW+9va+OKDlzG8oNP9/r7gLms2pyRSrtDDA5
	 iioCY28svmcMZGGAMNwcsB4ULDd75rE2JHvQyit62K0ylzQ04AIhkT0+43EF8xwMo4
	 DvtKXE2h/XcTGVqBa+w/ELO3rDXIOGbEcHBzMYBi2iHtnIfEqHUuGWnVSaeD4fxCPj
	 o8ZzKQfpO2L1R0NPTtDdlTCzYMd7XYkwqWPZk4tCEpeBwlk2fDaqgv78LJHL6/pqg5
	 8T9rLSw/MXWQgqScS9FM5qILvoHtWvjsbCxxGT0YSBMlUz58CZ4taAIdAqjElfQFhW
	 HVSNmGdDe0eCA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: socfpga: agilex5: add the pinctrl node
Date: Thu, 29 Oct 2026 16:31:59 -0500
Message-ID: <20261029213201.718625-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
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

The Agilex5 also has a pinctrl module that does the pinmuxing for the
various pins on the platform.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
index 0c501a93a8127..161f3d4bbefe8 100644
--- a/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
@@ -446,6 +446,14 @@ spi1: spi@10da5000 {
 			status = "disabled";
 		};
 
+		pinctrl0: pinctrl@10d13000 {
+			compatible = "pinctrl-single";
+			#pinctrl-cells = <1>;
+			reg = <0x10d13000 0x120>;
+			pinctrl-single,register-width = <32>;
+			pinctrl-single,function-mask = <0x0000000f>;
+		};
+
 		sysmgr: sysmgr@10d12000 {
 			compatible = "altr,sys-mgr-s10","altr,sys-mgr";
 			reg = <0x10d12000 0x500>;
-- 
2.42.0.411.g813d9a9188

