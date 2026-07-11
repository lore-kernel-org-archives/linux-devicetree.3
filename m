Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FC92DCBF4
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 01:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783733948; cv=none; b=pIZXPMvNofHyh5jjaX1rlhDMlOW165qukdvCIr1avU+Jlr7sMWKxzQxBWQNmGUYoX2oMfxb/ILVhhn92yzu//qMQFBwf4ZsdJ9JDQ3nE9lf/Rv7jUU2ugmn2H0k8c3O/Abs/zLjLmw1eTUrtc0XsDhKpvM8F1ZqWV4sVimovOPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783733948; c=relaxed/simple;
	bh=XpzDsD4EXMx2JkQDtGh7s6GqPeOccP/wJkLH4H3nCIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EhK/9dOQfH8oUJOYIjWQBJHqOTaafu67U4TVigVEwOdOtw6jnUmL3OMP75sCKvglcwsVghcQc2lXgo4po4E/+wV3/cW3akev683b1daWrn1wWENG340N4TpiUbzFnnJ9ot7nWfZR7HhbgYTEk6aRlWsChiBDKHF3pDGYIgoqLIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQZHo8xh; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQZHo8xh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc8e87f29bso10932015ad.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 18:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783733947; x=1784338747; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EPEx0OGzOEwToO7NlEWG4WETIyrNl/GbYjEC6n6Sa/M=;
        b=XQZHo8xhag4+ykbE3t2UOMlHcDC1bNhfvkXcC55mfdQr30+xkISTbGGma7a0/F7T/1
         BOBM+p/Zuq9ihBryijTAn2KZeOTsMA+CSmNwV7mNDwBjnqgmIqJEpzpNxwENbNUVrimE
         EUe9B7iENUD7x7l1ILfsH1vuPbj2EdmUZ3sr6JTF9hfvd9/+NWEcIZbLJmCp+fz9POQf
         IdLzla4NBRUgz726y5vsL92nheqxo3hhuVvnjrmNDBsk+XuSZf5Ep9pM8rOQRd+/wUO3
         z24xRe1wJmOVhxjA1UjEPT6LfXNbEBGFVXgZg0Ttht7Q+zVVznmwy9i7MT0JspFrAU/1
         EAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783733947; x=1784338747;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EPEx0OGzOEwToO7NlEWG4WETIyrNl/GbYjEC6n6Sa/M=;
        b=T/NaRTZxguX2CqsG+Qjcc3gY0WBvSokyr6VDl9jXoIInvSyOezcScPYMs5yluRiKWB
         b7ZyxxTH7IZHu9osWrHteLMPd8pujmz/+J4WUgfVcIAx371uP5LhoK2tc9wUahDotxsg
         krMtbC00z7TladqOO7CGPuZiqOH7caEc5aZBxn645Bh6qtjV0sRcIAcYK3z4F5rvBR71
         UhrCN33V4X2DJNnMJ8/sdEZPGtyNASMlIGG24E0iSfHdVLrKeO5A597kkwe7JO+qbrm4
         vkSx5CNBrSFmcqY0ZLnr4Clbjmr+uFZhlbC+OHWnn0z/Xrn4O2F00xq3F2FHoAvpy3LL
         VglA==
X-Gm-Message-State: AOJu0Yy/bUuIpbHW0AY7mbaHvEyFEZRvC2qlzmAdaNpRj8/qfWlKma10
	ZEQ//NFtURJfIMF4Hnm6KV5avnjjMpeySNYch9tARcSLt5p4oI+0NxBn
X-Gm-Gg: AfdE7cl4aLD3Jvh+fGFATr5r8uXV0X9v8D1HkLanUbSzZGTBZJ16r+nJkR5hyH1LYzR
	dS/VKwCzMZ+EmcE9FgzF/JxW2hO8HODLnGjYR33Kykur/y/bZDmwFmNUKc5p1weRe0WKBdNX+TD
	A19wUVPf4hzIkgtiPt8H03Yn6cTyOhXvx4lyURJ3YRTmfwSuuskPLi2rYOFRzzeUfnEIj1TG46Z
	4NPmhE80j+r9RabUawyrXOZbfd+ULeTpCzmUf9saluXzQBo1sv5o88JOhWqF8mjAo8FMu8mlxHd
	iz33EF3lRs4BuvTMEH21pr+I9lS/vl5yD5UqjSf4KrXB21I81beiuwg6Ij5jnWR4m13yIxYFUeE
	k7QGEzMZV+VDNgyH0tTITW4kP7+YrVHPPvEyabwQoyG0MUnv2sXFtLTlQ6tvheHlVjQ9aDCXN41
	xEiAEJq6aN3RVTJnTJTp8=
X-Received: by 2002:a17:903:2a8d:b0:2ca:ecf6:910e with SMTP id d9443c01a7336-2ce9e1d907bmr13544725ad.0.1783733946772;
        Fri, 10 Jul 2026 18:39:06 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdf5sm67268535ad.73.2026.07.10.18.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:39:06 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Sat, 11 Jul 2026 09:38:52 +0800
Subject: [PATCH v3] riscv: dts: spacemit: k3: Add QSPI support for Pico-ITX
 board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-k3-pico-itx-qspi-v3-v3-1-d6b37fc86c39@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBswhayuEi1qGmsIyjQkiO6et
 HyL/x+IHIQjdMUDgZNEOfYMUxZA67gvjDJng1a6Vla1uBn0QgfKdeMZvWAyaF1TTZqUNkSQSx/
 Yyf1f++F9P8ikJQ1lAAAA
X-Change-ID: 20260709-k3-pico-itx-qspi-v3-7f81b2c023cc
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, wefu@redhat.com, 
 Aurelien Jarno <aurelien@aurel32.net>, Cody Kang <cody.kang.hk@outlook.com>, 
 Zhengyu He <hezhy472013@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4490; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=XpzDsD4EXMx2JkQDtGh7s6GqPeOccP/wJkLH4H3nCIk=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqUZ60HQKomjcD5WHgnMkKuhF0OaZzaLilmVWI+
 7OxoFqRj3WJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCalGetAAKCRDN9pw2gLgN
 2JLmD/9suwc0BL1mkz5u6f0XUVMQ7pgvXVmwhRzxTXJr5ZH8S20ubHZSf0dnhwNpBtvRaoEQpRR
 BXl8WX/ZXWi7JhAE77huOI+4A0jS+J5+Mc4+8Sf+l/IHMCO9M0PlmcpZqwFN9mpEERpLq7Jz9SB
 2fPl457P1u3kdjcKuSiVTADSzduYYFAZnOBMlLALyRG0XiRlrG2Tu/PcUe7tWn8LKeJWDdiyVF/
 ThnaXv2sV9FVUpknnK70F6mnp+ST9hLj7SvNTTkDDlcxoDBCsylFluHjpNUHVpamFkZNqJcm01q
 ct8sJ8vZzhVIMPOSmdlE5cPj8UNsjcPqsjkSgDP723i9UoR8BASKt28WtOr2cJkgIojkbbu+91X
 3Kc4s2S7TBNbsBRgom2n4b0okKSt9Dts6RdbZDZv7PLWs7ffcvTKjVGdneZ2pE8nFnBI0Cn9NX0
 CSauirlxmX/HFh5Tk0ef1qcYM1v7rRjjjViWOP42MlN0h9LHMWpMA0gPNmqy/LwQDVRgg3RUETR
 aunmN3zRO/1E8mkjQgko1TXuVLbupT4XqVzLuiwaKh67KGzEhLk/2YALOWI0jsDhcHoZSpEhvdg
 rxZ9yEilv56hT2HEQLmCI4S+1fSGH7++zGK/CPidNe4lPKaxPYlbdwLMaLAQl8k3FsmTN1I7rq1
 FB12tR/E9glhkZg==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959

Enable QSPI with proper pinmux on the Pico-ITX board, and describe the
NOR flash wired to it.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
Changes in v3:
- Drop the already applied binding patch.
- Update the subject and simplify the commit message.
- Use the existing qspi_cfg label for the Pico-ITX pinctrl override.
- Rebase onto v7.2-rc2.

Changes in v2:
- Add "spacemit,k1-qspi" fallback to the K3 QSPI compatible.
- Reordered Signed-off-by trailers.

Base: v7.2-rc2

Here is version 2:
  https://lore.kernel.org/all/20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com/

Here is version 1:
  https://lore.kernel.org/r/20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 56 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 21 +++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 17 +++++++++
 3 files changed, 94 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..fd2b154f275a 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -200,6 +200,62 @@ phy0: phy@1 {
 	};
 };
 
+&qspi_cfg {
+	qspi-pins {
+		power-source = <1800>;
+	};
+
+	qspi-cs0-pins {
+		power-source = <1800>;
+	};
+};
+
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <26500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		vcc-supply = <&aldo2>; /* PMIC_VCC1V8_QSPI */
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x20000>;
+			};
+
+			fsbl@20000 {
+				reg = <0x20000 0x80000>;
+			};
+
+			env@a0000 {
+				reg = <0xa0000 0x10000>;
+			};
+
+			esos@b0000 {
+				reg = <0xb0000 0x100000>;
+			};
+
+			opensbi@1b0000 {
+				reg = <0x1b0000 0x60000>;
+			};
+
+			uboot@210000 {
+				reg = <0x210000 0x5f0000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 3ee1471f3798..846d5e8cc783 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -679,6 +679,27 @@ pwm19-2-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	qspi_cfg: qspi-cfg {
+		qspi-pins {
+			pinmux = <K3_PADCONF(138, 0)>,	/* qspi dat0 */
+				 <K3_PADCONF(139, 0)>,	/* qspi dat1 */
+				 <K3_PADCONF(140, 0)>,	/* qspi dat2 */
+				 <K3_PADCONF(141, 0)>,	/* qspi dat3 */
+				 <K3_PADCONF(144, 0)>;	/* qspi clk */
+
+			bias-disable;
+			drive-strength = <25>;
+		};
+
+		qspi-cs0-pins {
+			pinmux = <K3_PADCONF(142, 0)>;	/* qspi cs0 */
+
+			bias-disable;
+			drive-strength = <25>;
+		};
+	};
+
 	/omit-if-no-ref/
 	uart0_0_cfg: uart0-0-cfg {
 		uart0-0-pins {
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..9a49dd8032bf 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1099,6 +1099,23 @@ pll: clock-controller@d4090000 {
 			#clock-cells = <1>;
 		};
 
+		qspi: spi@d420c000 {
+			compatible = "spacemit,k3-qspi",
+				     "spacemit,k1-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0xd420c000 0x0 0x1000>,
+			      <0x0 0xb8000000 0x0 0xc00000>;
+			reg-names = "QuadSPI", "QuadSPI-memory";
+			clocks = <&syscon_apmu CLK_APMU_QSPI_BUS>,
+				 <&syscon_apmu CLK_APMU_QSPI>;
+			clock-names = "qspi_en", "qspi";
+			resets = <&syscon_apmu RESET_APMU_QSPI>,
+				 <&syscon_apmu RESET_APMU_QSPI_BUS>;
+			interrupts = <117 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k3-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;

---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260709-k3-pico-itx-qspi-v3-7f81b2c023cc

Best regards,
-- 
Zhengyu He <hezhy472013@gmail.com>

