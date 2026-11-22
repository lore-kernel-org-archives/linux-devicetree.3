Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369141;
	b=QhRaXXjU5ILGRH2RWacC56WS7lEO69+27z+4WBOaVhUXu1Q7IaLtqPYEBuTh8slYLBFh
	 QJGD+7SX8STQot5u9jNCvAqj1RNkq7PORwQD2+a8Mwcx1cWgzg+Nv/ve73YovaY51IUl2
	 VSDFSieWMPYjMrDVHBBBxOa7LRHk5qVMOZGRsvq+tZODockz0HHH0XTkQ9d2TfamRYdP6
	 t3qigZ6Pfnt6rIzDzZmusinV1MLbnZaw5WdeJqsnkoxGs40mPoLNNG2T20ylH++RpuSjy
	 ezsDrqA0iiGCVT26PJtxp/DSbpBmbrdOKLMumV3t1h4y7Ykd0XgKm2TYnsCnsQC6AJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LlFmwfQRuK6UV6XJmGVYSVgXfF3MLqCw1TxtpepQm6U=;
	b=BSsgqbGLEbAkW7eQGpjjsbnlzKTtq/45V9yLVgxiGZMwbgRjQ7vAjG7OxHG0a4uznULF
	 p6JdJaJ+RPHnVxhNTAeDa0/fK+WgupfGD0l43l87GUQOLqm+tQharEk/5Bf9s8rJmORb9
	 4lTeVGmwA5NflNnVvVEphdBPtOSPCXsLPguVeYaEGm0WJN4vdPByQhrZPUfZdnQwVbNP3
	 ZWXac9evigpjzGt3ZgmaAnNo7QRyHa73M0hFpw1UO2mE5St7kPQes4XVZMUBm+IHKh5XR
	 B/v4QqiO4PMNWzP4PUbfZraFhEfuFA5+zJ1rkRtu7m/4d5bY4Gy6qs0a6JcNkPOTCzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tE+XF6mP;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257B4606A333
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 257B4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tE+XF6mP
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-385d8a00598so3392054eec.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369140; x=1795973940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlFmwfQRuK6UV6XJmGVYSVgXfF3MLqCw1TxtpepQm6U=;
        b=tE+XF6mPTdlzsEbRygWELR4oUHzEOkRvJxaATh0RgnDUFXddqYNSLBHoHUVz/sj7vk
         Nn+XYfktpwHIkAdvIWGKrMenBQCVOYDpESG2SzQchdxsZt+mnJ+9h26PAv/5wjfUG64/
         54Olclsom7+1lUnZL/Y544kmNla8Y1AgJyfbVj6ZtB3IR2gfxfVtce6i5zcWKqflX++k
         OnHiLek1D2ebgCEbx4N1RzL7gv6LL++lOVSxXvT+HvTq1Ihj20FA8dNgx1u0X4BEqD/K
         SVSmynCWpiDEDrJeAx76nQ+hcuWUQVD1A/YIs98IkWW9QvsxtIOROZuC7NXxQhOZzXAx
         dwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369140; x=1795973940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LlFmwfQRuK6UV6XJmGVYSVgXfF3MLqCw1TxtpepQm6U=;
        b=vqpQxgjX49/0WPbzhW9iCEBKpc9U5XISJLjFLp8P9diVjKEOqblaKJWLj3FsbAFhKd
         pR5jOLyik/CUMGPWnaIhp8/ZpFOp+oVW9M2ax4zZUC7wQNG29Rw3KCCQDyAt1qwBNNR/
         TpPjypKCwDR8y3OwVKgdVUGVxOTbEe9iApSNoUNtOT5oBceUQ/i4zfe3wfi0Nxc6CBLW
         HustkKif68HRhG9r6ligAPVVHeo1/yQfHWGzs/fpAsLbV1nObHiTuHIaSuNGE8/3F7uO
         0nXE4uT8l1HnBECMKHH4eKBgp8gOcL4BcvQwRq9PL7O9kenaShQvYxs1QsNwsAGR+uXU
         ELIg==
X-Forwarded-Encrypted: i=1; AL+hErEbr7pbsg+jdRSFm7HJ/DywUyjWuGlDDEm9BHikKJT2KC2lv2zSzb9JDIh89gz/ZhMxHFxecivv4wSG@vger.kernel.org
X-Gm-Message-State: APuU4Z+11Gd1r89DlmCDpX9kxd4ZHPNFEfPVPmZXhOXNWe0VUJ3IF35E
	tYG5pTPXXjDu9irEPvXT6Qh6eKd1b6ftnSmKtR/j4LvpBdE2BXL4x11Z
X-Gm-Gg: AZFdTZcxn1+TPtYBZfOh6MCyPHRXfuGDm02/Jbm6l4lw+3z5EHZnrJd/lPw9lJvSeZv
	akyDHXmbGjF9tIXqAK2vfX1zL43ankHV40jaauPbgl64yDxNbDdRbm+E9vwth58f9vOnML2Qbm7
	826qDY/ZUc/ufWruk6x5a2MjunUpW3vePT3q9osaH0u0CWvy5CNgAjIdr+YztpmrgZNU+NI+nWr
	ebzvA6zB1eeoVC2Tyw3hN9R0waXTutWulhTfuNEs1nZoPWzNGWZw7CA+Ql8LVKlc4vACrxqkUKO
	dGnzizvzgj2zb2UhkZA+PmdUrpbOsTrv33hYQwQB6AuOgI3qHgzA6UHiHs2d9q9uWGwuN889hmR
	/Cc6H3/m3Ztlwm13T4+URFbxZKfvN4zBMdoDMtLtl/VJYv3MhXLBMOnM3T/eMBmoN9iCJUuqmxf
	r810DQcw3i4UaUopUY7Kn6eOKuXy9b8k8yf4BO/AObLRNSI4nuhdiFYWLgWSSH+3jSJYywT2pvu
	iTj7MxrWDIW6DpkuzSGQziMAFsRiz/+49MU94iGbvSTmWkWY6WbA4fJTTKBJuFfcPC8YR/lIZtN
	DmgrczvjZJ0/V9V9saQuyENqgcTRo5DjLPwDAMbpUNy+h1F3mg==
X-Received: by 2002:a05:693c:42d7:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3856f84fea7mr9545686eec.16.1795369140294;
        Sun, 22 Nov 2026 09:39:00 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29097985eec.12.2026.11.22.09.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:38:59 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v3 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature trim cells
Date: Mon, 23 Nov 2026 01:38:10 +0800
Message-ID: <20261122173810.2409146-4-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122173810.2409146-1-duge1256@gmail.com>
References: <20261122173810.2409146-1-duge1256@gmail.com>
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

Add the K3 eFuse controller and NVMEM cells for the temperature
calibration data in bank 0 and bank 7.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..af1a758788ff 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1439,6 +1439,29 @@ saplic: interrupt-controller@e0804000 {
 
 		/* sec_i2c3: 0xf0614000, not available from Linux */
 
+		efuse: efuse@f0702800 {
+			compatible = "spacemit,k3-efuse";
+			reg = <0x0 0xf0702800 0x0 0x400>;
+			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				soc_rtemp_trim1: temperature-trim@1c {
+					reg = <0x1c 0x1>;
+					bits = <0 8>;
+				};
+
+				soc_rtemp_trim: temperature-trim@ea {
+					reg = <0xea 0x2>;
+					bits = <4 8>;
+				};
+			};
+		};
+
 		mimsic: interrupt-controller@f1000000 {
 			compatible = "spacemit,k3-imsics", "riscv,imsics";
 			reg = <0x0 0xf1000000 0x0 0x10000>;
-- 
2.43.0

