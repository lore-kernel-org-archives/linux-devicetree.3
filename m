Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A844192FE
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 12:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009690; cv=none; b=Jv4OQKYIcB+5JFbvzQWPMqpMmQXGzycMeQIsGWaKUbAhx2vWBVenONGMjyLISQ6snC7jiNugIhnzwaOpCt0oHCsm3UR59358IhYZWvx7QF11G4o3/JiyeJgHAprUbJtaQVFlD5t5JtkmgxvvdqakYsd/bUvIcfMyQqAFGgD4b+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009690; c=relaxed/simple;
	bh=VgFNiEF0ef+trC7uormB4Jp8xRciGveapgTE3rlnBCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DvZC/AaTO7U6HvlielzNuvOMv/OWir4iZt0SSPwaUMSFCYHmSuC8WEy081JIqM9YpZ0hw9xfOUCq+fSm6gp3KIhe+u5HKyeDwM/tr2xJtL1+z3mwXaesdkFZWQviQSxdBb97eiDu6k45rnWIRso6j12WIUBQ7BF20H352u5NU6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IR1ePokG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IR1ePokG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b613a17bso54039155e9.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009687; x=1781614487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pa1NEGZZ2FfbTBnmrVGSbV2tYmK5duax/CfIG2yuC6M=;
        b=IR1ePokGnwGz+UlAYXMlWL3OSMUAn0YPh9g9XJTtkoDdv6IQ8So1HRiPRVWyYRrw8C
         IKMphZg8moZc2XjWunmHZhItypFWMsWTUzT6mDGPRJ5lLhR82tJyecTIU6mWg2MfyChI
         j73+L7Yi5jXD3ggQZ0OAHBUWIPefhWN+HbIUImK4ZcZnuXUUvH9Cl+TctMDrds0r8Ewi
         vw3XVvZPUZy/DsDeKAsikaheb6I8DmmVCdetV7C8mVtxSds7uI+4KiirKN/zO/ZpUxsE
         /902KAszHUPiorIDh2Mm8Rt7ERwaw1vMVDukDLVfKnReYYhZX1PnQznJOQpwqhw8LkP6
         l4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009687; x=1781614487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pa1NEGZZ2FfbTBnmrVGSbV2tYmK5duax/CfIG2yuC6M=;
        b=ZNH9jtb2VYoRYZx9fh6W6wVVQy7N2hhE7HVr+WtsNQrNaQ5ouzY0NWIYfkgykOBXsZ
         epprUxiRECISz/6Ve5ozl46QdovZXVXRtjZA3XZx1XEbIBjrMWxtygFlnTyzkG2oep7N
         FXh7Ov0LzQyOjF6tRD5/+oEq0ncfqdVQr+fGdLyxZwpAXA7enL9/1DLQNQXoLXTSAs0Q
         Z4u81XffjCF4mPI7V0sgIf5c5MgFqrAQV2++uENxPUwZQvQyaXbjN3TYnhNPQ6Yyx7+O
         ewtN+DN2wLIUihCdR/GuyYwzv/6/ebGBCAEBsW3/HQGgQWumMrFVvuHJH2ijGSZ3LNhl
         Y8vA==
X-Forwarded-Encrypted: i=1; AFNElJ/DEGg9D68Hc/8Rzi7hnhi2d5LBnf4hknABwfndf09NgXuXGrBOWa/EQyp3N/Era1OQ7blcjA7TA001@vger.kernel.org
X-Gm-Message-State: AOJu0YzMMF7ZuoJPN5Qx/Jr/rbLXip6G4MGa5n2qvHry8ps5aEmuo6Ne
	u3WjCB9Re4aTxGQZgT4iqCD7P11NYwKxkQMO5oxUoTl4YCADCIkhUC4y
X-Gm-Gg: Acq92OHLfa9J+iF99KRsCj/pgAeYQZ2mchisppAwEYlcelx5F45oTqqaUvxmrI0pwuS
	ljF139tbxEgiOIBmHLsQUVNwaC9RUkizF21OvUgCySJTO04NwUkp2jIPDVUpKiy0m/kS8foyHTM
	8mbNEtn09uC7rOhE3hpkjDq/XlYbclsU3vZZNSZua+3wWo3TU3jTMY4JZjws32gUzTiTDNSDPUZ
	afIPUSC3pgyweJGE9jkFw+omppY3rE9oZsPX36dMy7BHXglJweePN1TfBrG3iszjxZf9z2X1mLT
	cquDPqNNG3v1UItlkcUD/vFWp+9Wb522zFOPW/hD+7EOpMkgQo1WF1oQcMQujlOkqZW3NASQciV
	hxavwjoChrVRYn98+cNs6CDGfhHEhtU+jPAC0RDpytwJKn7Yc9mCPD9/xboKPW4tODAA9hAzm3+
	g7KLjmhSj3cdAqZ9beFnB8E+tyUHEMVmmc3orf0SSEGKMQgbg5VIMbJ/YjL71VvJ6viJJ8VJ9pA
	ZCACEGi8GTeJ83HnV3Uv24SviHWC6jLrdB9DE8vK4JapIDdOFyWDE+So/tZVZUCMm6A
X-Received: by 2002:a05:600c:4e4e:b0:490:c2a2:e91e with SMTP id 5b1f17b1804b1-490d7244543mr37984345e9.34.1781009686933;
        Tue, 09 Jun 2026 05:54:46 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b06sm435968425e9.3.2026.06.09.05.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:54:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/5] arm64: dts: renesas: r9a09g087: Add DU node
Date: Tue,  9 Jun 2026 13:53:52 +0100
Message-ID: <20260609125353.401124-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Display Unit (DU) node to SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 174f683fa68d..308d3ccc21d1 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1380,6 +1380,30 @@ sdhi1_vqmmc: vqmmc-regulator {
 			};
 		};
 
+		du: display@920c0000 {
+			compatible = "renesas,r9a09g087-du", "renesas,r9a09g077-du";
+			reg = <0 0x920c0000 0 0x10000>;
+			interrupts = <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G087_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			renesas,vsps = <&vspd 0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_rgb: endpoint {
+					};
+				};
+			};
+		};
+
 		fcpvd: fcp@920d0000 {
 			compatible = "renesas,r9a09g087-fcpvd", "renesas,fcpv";
 			reg = <0 0x920d0000 0 0x10000>;
-- 
2.54.0

