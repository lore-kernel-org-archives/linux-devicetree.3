Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992964;
	b=cR1CS9y+r+PuFzUL+UpZEj+iyCX93lUdguL2XCc/6slAU8LspVkDuTikEVsvWit+XVi3
	 DV56TG9elOrp8k87PY75pCdm79hMkSqNxn7BQ1XGsVHHK+qeVylXgBPp8gKju4JivM0m7
	 gmq7tS55Eg85O9y4coJgCSiYV/kevvgOul4A4JWAr2+VXxc9Zid47rzu5aOaYcSJ/WLgt
	 IHF98UAj8IcTYGko7cdcHe7eW83dKtciDo1p7vMkCQH9bVtBN00iCPDqqfX9bZGzCTIxh
	 i5swg81wxmSKCcKA2JZQSz56faN0JCM/UxUM4cvXwYnFTQoKL8t7mpTXomOVofh3Sog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
	b=E5VectIZb52fwM3fgtIgmkv5RUEDMpSw4Q5mppxJbas+ozvDO9IDNFc0WGVVUB4wdRQJ
	 7lpxD+RSVjM74Dgu98atsjXaurwxlrjA++0Ds3oYKgjVvNrWCa9SKpMfeM4yl+9Xuv/Pc
	 yhlRZHjpW5smaRmcICcgk25gf1GLnsrf6hKXdJ5CQI8hZrO4Bp6JcUF/KqeDhj5tTH3JT
	 CKv2nQ9yiDNxmzuxVkKgLQQtIOFEMnUTnQ71oLQRvLFCA7CdneTEWjnsaMZ4+E89YYe36
	 6F0ViKDToHGEyejowMuNeZGe0xVhc0rMcJDoILkYDGOTM/fWbFeT+dCNQ0g3BECvCUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b="k/5CBHUF";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF6E606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF6E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=k/5CBHUF
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so8367875e9.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 01:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794992962; x=1795597762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
        b=k/5CBHUFtEKe8geT1DXvy29NoiBNG1Mt8Hy95ZhiTXcEoe+VIZgYMi2ugn+SYCpiax
         Y9hbglI3IwiC+ioTHCqrsmqfhP7tcFCVNEK8Uc1vvdWvwgHEa5PvsW3HtK251xuO9+x8
         /Xl1QLFbeSKJc9gLfsvsPzoyPYbC6wJEX2rYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992962; x=1795597762;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cpTBG70GLztkppBlWDxA4zs5YJB3Ae5lFCFEvrLL98I=;
        b=rYOKBW5p55XrI3oqimuAREn/tPyrdZIN5QWiCyYp+OmYDxiLuipIvEGbnEwEH5fk6G
         5T8yAkAelNkPTyZuA/MzdmIqZDy5N2FpjdHcMF2OLekc9X/jpSs7rylQuEFX15w/VaF2
         qpkZl/3fUXIB18xYFj9MMhS6GBo7DLyRSFGE3igrsE+Gmm9+IaCi9EaakwQmt7wivcY7
         X6pwTiQF2BeX9ExlLy4H+jKvTovjMDnK4aWAJGX2Ycyby3kN5NFSoyECIwJQAud4K5Lq
         XwTJfgdGOeCE+Dv1UlJIS1hBxJpxVz4siD/invYk/Q4MUt2lFZTxkhle8CqZwMPpWz0I
         sz9Q==
X-Gm-Message-State: APuU4Z+h0jEIbAKHMBknHPvME5QK7UNKHTC2+DNTZChYABapgMUYX3xd
	2j27KoXposFewd5L8sdVY77ThpVuDz0A/RZ8sE60jv+9vMo26MkdCySq0VG4nS4eQTU=
X-Gm-Gg: AYBFou0izYJhCQ2Az7+WYzjZW/Le6oE+M4AuKOvqaUC9R6BQzzWWPQH+B1o5RT/6nqH
	uDyiiFsawrGLBY/PF2z7ooe+JKJGdwHILULOeLusUID/RG8yAKV5hFGtxqJEUWpoQEeONUTdg9N
	Zpr/Q3VNzJWhYi9iB0UBCFywPPX6Ffu+nSrxcdwH0cgTk1ZcN0qvph5YGwkbzZOVQ+vSSkd2Ta/
	10mqrgZOoiOlQB8aOoeZYVl6qkd9z3Gs13Xecf3OxTvBdYc0mfkSuNOs9BeKqc9VHa/VmMc/kZ+
	YUEXKtvDsiVVLNblXsvhAQyikySndmHUn7s4JBxkWeahYLnV8HCMDL7dX2n+zaNyHHDcuthrIoa
	/WujPNCs22CYYqYefsBBrBhbUNfCiNylaWZ/qc66cHl7+cvKsXf57gwktKL8RcQuMrQ/b38DWCO
	0HoeenVLkt+j1KqfmmRMf114ge0G0l5fAFZ4LXW4EFerR02wLFBJBUrXhwqkVVVGu79dPy42tKC
	9wtOSrT91Mb/Top1xdlqAxrkh4zXlCfHL/eGFBtrkcQFBJTiEb/KO07NGYLxyG+a4y67j5ubX+J
	lwzakJAD1EUPKEGGpv4595xRtj9+MxELJAaH76jCZMPPVQ==
X-Received: by 2002:a05:600c:8b34:b0:4bb:781f:6067 with SMTP id 5b1f17b1804b1-4bb7d6cd404mr33290135e9.1.1794992961833;
        Wed, 18 Nov 2026 01:09:21 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm185770195e9.8.2026.11.18.01.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:09:21 -0800 (PST)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v4 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Wed, 18 Nov 2026 11:09:10 +0200
Message-ID: <20261118090914.38082-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

new in v4:
  - added the missing GPIO_OPEN_DRAIN definitions on I2C recovery GPIOs;
  - fixed the halved LVDS pixel clock in split mode;

new in v3:
  - used LLM to cleanup most of the errors and warnings;
  - proper use of dt-schema this time around;

new in v2:
  - add the tag from Conor Dooley <conor.dooley@microchip.com>;
  - it should be clarified that "draeger" vendor prefix is added in
    my previous Draeger M48 patch series;

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  16 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  16 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 213 ++++++++++++++++++
 5 files changed, 249 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi

-- 
2.47.3

