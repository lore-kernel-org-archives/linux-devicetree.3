Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641526;
	b=knaXSEThu6akA6N6lq1ssMFUsoPjO5w/N0/OCxHkQFdb/kaWfOn0YqoQX66Rne7u5JuV
	 ek9Ml4z4Ia2fVeWGUqYuOFJJZPInZvaU9+fxJAhlgm1+Y49UgtIKG2ekJddkGv8fH39TT
	 zqhbyNP+7Q30g05MQJ+E8glsIHYN1FrOT2ayHTmMqocWIn9l5qOqvVFTE0Fbfzkrecd2f
	 euyN//kJe1aQ+AgA20cfpoLbyLKdUNMHh9VnjVIYazAWlT8NDwVqBFFhQw6Brmt2NO6aE
	 ea6a+tG9sl8ib7tfsYZOqmhtI0eTdiP4Wa+bHnmDv5f/soj8z78lxqunEFmP9kSii7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TM7SxuLHSkIokTfxUi5Ea/8G/1rov27xpyXAoGZkTRk=;
	b=ZIIQFzEkAmU37KE4aBGV3kCaseUN3sJHG0vHjsWOHu7PC8iykNtOonFOpxHBHnng4ZUb
	 xUlgpNr435uwrr7K3VmjPPsE6bH9Hyy2UmbnTRS0G9KJg9MzH5Wd/nD4X3lWmCsyNrzLj
	 Ug+9i/ZK3EJvXN1RUTCgQRgDDk4xZDNzszD91eitJzL2BMMK5EG3ngbKpD2Tojx27vvOk
	 vV4YtcTS43Xlndzt/AOEQpr83hmZvXGXUpsvLd38jr347mbe/CFiFKFo3+vX/lOnFKhBv
	 RWo72a1wSSTRJ5utLRFnUzNoEoNtLtw+kXmKo6uzVJLhLIj07ffpoc6Og/2JsPlcEng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFq1Bl28;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF2E60A262E
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF2E60A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NFq1Bl28
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-19305bcb6d5so862198c88.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641524; x=1794246324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TM7SxuLHSkIokTfxUi5Ea/8G/1rov27xpyXAoGZkTRk=;
        b=NFq1Bl28iwPQFVPYTvj+Yagg2+m0npXOSHihDrwQXrtHemgtn+4yWsfJ6mbPHfrXwr
         WlfqGcaaHoN7gMrW/Z0zMa5nwFmRxjt9xbm7lKk58/Wphfej6Uv6TfangX+w9vht+ri2
         tc4tvdVur5ZLm+5RrdRp+iEMKJ1YcCmBNWtJfrAA5SHkkcjr/USOsFl8DRXm8M7nVjOf
         XkLlkjBpP0g1NgwgvEKny7O6Yl5Fejglm++xH6k6+EFCJ8kcaOSDDKCilExU425isJhS
         c+ugknChvH8XD5K4iyugKB8rgB51y44AMrx7QJVZhPguhjQdUqzXQ4WogsYPoqyhUlYV
         OHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641525; x=1794246325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TM7SxuLHSkIokTfxUi5Ea/8G/1rov27xpyXAoGZkTRk=;
        b=iv/0uEa+3QqcRxRz05TrLGfNlkC2PwSk5bZAVb5MMIAZTis4Rz6df7fqltW6wi6wpH
         VkB9ibVMu572cYfifIt4eSqzB0L6DPR9kIdxTyV29p5e8ZKn+j/iNJPC4ejcv309L3SS
         IK8ZdDTXrSsFDAzeI+VYOyReTnAWNciEMPMPcflRIxK2AVCgk/iBDhc1iPpdZoiBKnoC
         BFMqFI1sTWHhDmjt8lAf87B4JvplyAy9ipLK+6Y/6uhEjVp6g80EyOmn+hay2Ay/+Kjq
         l2JyGsBmfTCTIkY5y63nAqJMFixQ9nSrmbq+aBSQ82cBizK2/+xU9MChCDp6XgdkMKB8
         lXYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNUcdTlNl1pW4vMJ8fF2najeGOuFpHDjjG3S30qs5aVIvsTjPT+WwryqY943ITBl+KQPqbImEwIZbW@vger.kernel.org
X-Gm-Message-State: APuU4Z9EXcd1M1dlFVJ5wciJ1k42QhtVMiYy9k7Rf3ABmvg36+Ncp2YA
	G9RaxWlFEp0Js8CeInRGZI4ybpiTeL0G8znsqjUwivtqSFQuLPDgkumU
X-Gm-Gg: AYBFou0IEC97TDRhYRifhXHVgfIuwWBJc1Fkz06MFeWe1opmK3+gKztSQ/WXflvpx/M
	9cqFQzOaCl2tiFZ40N7e3Xv589sJeJc1DW3p+pA4qk8dY9nddle67fHUjPu0jr9TTGDRy64kd/m
	O4nkSVF6g9+V779RJn9PzCsnC7MoKe0/4SlLmhHjS/gQvIauhkW+58HNa7q3ufF/dJiMezwPjlg
	Bm2B3iJqJeRyxlM2qFlWEC/qpB+GirEhW3N4TyPGNJchhRq5d+CFUc+0+uKuYI7rVyVvYU34zFJ
	HS5R+UQwAHJgYPPGvb8Td0APNg+b0X1HcXXCdSegWO6G3TwShUHns2EgunFKHR5OfbRT684j7ZU
	tPDVx848foaewGvnsSesVzRgQXTit9rW7hL6ZVu2P0lS0iei7uZNvBD3wcUt6z1cPjgmflB9Ie4
	UY9tt4tRf+nQB81Nz3N92UljWWJQTcnx6Z35rOG03WOdfrsl7PIGjxxkU1eMjJJcIsVuPzv6TlM
	sTDmO54cFHY/mg4zREORMpuBOCKwoY39+GrBkJzynvCHGiwdobUpSXw1YgGCGprKik/o6ddj+o7
	ElbTSU1wi7xTClG9WeBZWVleExA=
X-Received: by 2002:a05:7301:4b10:b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-36a424940d9mr16596225eec.38.1793641524327;
        Mon, 02 Nov 2026 09:45:24 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:23 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v3 6/6] arm64: dts: rockchip: fix modem power supply topology on Photonicat
Date: Tue,  3 Nov 2026 01:44:50 +0800
Message-ID: <20261102174450.3000397-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102174450.3000397-1-coiaprant@gmail.com>
References: <20261102174450.3000397-1-coiaprant@gmail.com>
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

The vcc3v4_rf regulator supplies the M.2 B-Key 5G modem. It was
incorrectly modeled as being supplied by vccin_5v (the external DC
input, before the main power switch).

Per the schematic, VCC3V4_RF is actually derived from VCC_SYSON (the
main system power rail after the power switch Q5013) via a ferrite
bead (B1).

Change the vin-supply of vcc3v4_rf to vcc_syson to accurately reflect
the hardware topology. While both vccin_5v and vcc_syson are
always-on fixed regulators without runtime GPIO control, this ensures
the DT power tree matches the schematic and traces the modem's power
path correctly. It also clarifies that the modem relies on the main
system rail rather than the external DC input directly.

Link: https://github.com/photonicat/photonicat-hardware/blob/main/Photonicat_rk3568_sch_20221116.pdf (Page 18)
Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 290e3ee97c709..6ba70e5d9037e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -177,7 +177,7 @@ vcc3v4_rf: regulator-vcc3v4-rf {
 		regulator-name = "vcc3v4_rf";
 		regulator-min-microvolt = <3400000>;
 		regulator-max-microvolt = <3400000>;
-		vin-supply = <&vccin_5v>;
+		vin-supply = <&vcc_syson>;
 	};
 
 	vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {
-- 
2.47.3

