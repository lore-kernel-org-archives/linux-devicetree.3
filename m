Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653442;
	b=xJOstJGH7zKz8a3G8THiV1pp0WRtorQksTokCtf7tuoGsgJNijSPqk0fscws1IfSg4sR
	 OLxaO2P91R6C/JcVlW3amoRdUtVJk7IVRiY4eVPpYwwOy/UWTssU9ORGugUIJInVi047l
	 EHp8n0nImzzw+Vy2IdZYGEaBFlRF8Lpw1EnNHZ/yxw+eRy/FtrG3m+LsS31bchsI1YteA
	 e08SL4DyMquEkcBX2luSPJ/5GJrIl7du7T82VAU4ePgd5aEQ931PtQ4FqYMrHbg44Eivz
	 MrwUf043qD95Eb5PlrVHHMxO3+4ojZCT+O11sxUlXaSBZRAmmzldCI0Pgp/BFXK5Xqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653442;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=klz0ua7T6gOS3jTSOaOt3eR/Zr0NsCWeM1Q/VVaJnPE=;
	b=Vlv2Y1aDUnFSdFJQ+Buhrznl3b8ggbJRayFMUwDl+CUaMOUPmVFyrd8Cp9Q3lTEJg7a7
	 zT8byrr0d+aeiJkquVrJL7JatDhJ6mXS97XNLV+KHxjVF6WpuZRHYkvfhC/Mhe3yiYFlp
	 56kzW4VHNw+brpNN6pMsBwVxQRFJ8WWlJu7a3Mym9NFOlWPUv+Nfv1/K6Du1fkrraubss
	 GhI/tirkzc1e+l+fjbDv57VUhs2EjKxYJKsqKi3ipUKivmyhG1Jjzb57FIMVJng01ILeW
	 3rmRG/zwIbxk7god0SHcEpc1F0zIHqIAdn1zISNgTSoZzXK9HWlqaxou81AMy3kTl/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XN9bvZhm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B463606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XN9bvZhm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A6C1F000C0;
	Thu, 26 Nov 2026 00:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653442;
	bh=klz0ua7T6gOS3jTSOaOt3eR/Zr0NsCWeM1Q/VVaJnPE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XN9bvZhmWXl5198o1h97bVCErQYf0RFDXJhCMiNjDniORlyEESZQH8zMmN1O0kFe4
	 ZdqanQxOsIUjh0NtaHD8kMXqoAO2AUOZZFf+gujDTPmbNtWuleeZ2MYT+aypaVGgOp
	 lTIy0F9vn1TlRrNkeoKUsHS9EkJyNa/+nSMwEiziaqWQl10f0e9RlUD7N5NMKMwx3X
	 onYzT1bhBBB+SiJEr2WYDSSypbzVmlYoJtW2ujxenSJ0xAHaCDiwvOJgyn7hnBzcFE
	 Z0xWUTVkmX0IwIKktemFb7Q3A/TW2iAHMsXpRWIKFQqucMqFRSdsr3UEcpkYUaUiD9
	 1RKRSEv6MGUdQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:10 +0100
Subject: [PATCH 06/20] ARM: dts: ux500: Correct STUIB magnetometer supply
 names
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
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-6-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The AK8974 driver and binding use avdd and dvdd for the analog and
digital supplies. Name the STUIB supplies accordingly so the driver
can request them. Found with CHECK_DTBS=1.

Fixes: df44ad87abcb ("ARM: ux500: add the sensors to the STUIB board")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-href-stuib.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-href-stuib.dtsi b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
index 729e7e1fbfa7..a7a7146980bd 100644
--- a/arch/arm/boot/dts/st/ste-href-stuib.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
@@ -91,8 +91,8 @@ ak8974@f {
 				/* Magnetometer */
 				compatible = "asahi-kasei,ak8974";
 				reg = <0x0f>;
-				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&buck_vio18>;
+				avdd-supply = <&ab8500_ldo_aux1_reg>;
+				dvdd-supply = <&buck_vio18>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&magneto_stuib_mode>;
 				interrupt-parent = <&gpio1>;

-- 
2.56.1

