Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502153A641F
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782556005; cv=none; b=t1+SnRAIQsZfz4XZoyH2QnxxXRMPZ7jGhGBviRf/STbzjXvY/eJ9lLbrY64w0xmdcKoea2zFHI+X70UdpLBn1hxj8tWiMI749HkFmRHvLRVoR6zjx3P62/NcMbcH80Tiz2kMxcpBj4OHXJEkX8/nEKkY8fiSG34yCGQ83YVvKCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782556005; c=relaxed/simple;
	bh=abdrO7/o2VFpfJvS4njDRhnOuXE1/3W1dGhsPAxm5v4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hF1LzgtJf2MKInEGJo1q19SueZOg6AmqWKcDG9PKICU2PNYRWzXZTpWmPj0NyOf2M5fRLFNYkE8VEFNg11b67FzN/u0zHcWQVHh1ibnVypDTA4t27kGfL74HGKHahbow7JGnEA5ycU9CNyqYxxeL2qgFLZnBRQgrVp9whncrgZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPxKHiLF; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPxKHiLF"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-13986d61b4eso4526919c88.0
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 03:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782556003; x=1783160803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5qbxHK7uecwWqgUe87GQwNpPlZehyz7YstoE6aMIzcA=;
        b=oPxKHiLFDpw9cwmNjCox2hI6Muht8DP+18D5wbhOM17/veZ6DaOB0XLeGY/0muA9W/
         mulCz4rDwuYFKTwppfnA46W35v/Xaw2XnVkiGIJfSKu29qwKwZSIF2Zpo07K2TIwqDVm
         t5x7EQ21+4g4nzKtT0REPzuqgGF/vlSElcT0GL1UUGwK72EtK7kaOdGN6u0AtudFyCuv
         tyqRLxf61r+Pad1ad8xEbbcce/Xdo+i5inG8CYLyUkWWJ4grWax06eZ+WJfK4wVL9mRg
         1thMdSOokvwJ/eGmGNXKqQ10I8zOmzzJxvZrntmVgmQUEuy8r3PTRW2Tp3DaZSl7fQK+
         vC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782556003; x=1783160803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qbxHK7uecwWqgUe87GQwNpPlZehyz7YstoE6aMIzcA=;
        b=R1Sbnp1AEUg10g7rGjvoz5dS4ZPxZXzScX1gtGTwJcJDRWYC8otWKsyZyyOkVxULNt
         zPE9Cmu9iftiUJ7gRyurkFGFl54KJ2R7q+35ASWEH2ceHGSnf/zE2WiRspUl1ZVIYXRn
         4eSPGPT+dU6S/mVjW5kF2y+4nxcTd2QiGaqSrWU/r4faWQZL3Oj5e+yKe+6pcqGm/Xik
         NA4zC0A0QS9iuwInFBnCYPmyYYHNUz30i6XFuEsJn8sYyEuTV99IGGrB9m9MdQxTk+SQ
         PJMjm8pfG5FZePHXjTFh5sPAMzJ5P7lSigdZa2fDjFdWKEQHzEL0LPJCXcAvYM/gx0Qe
         TddA==
X-Forwarded-Encrypted: i=1; AFNElJ9xI60/JUIXiJL9ARS8aFMSt/8AeyBy8kGiEWrpRMjxjHyzoq6dukkkd1tFeKd/7T49O55N1xwkVAAQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzjzl8ORa5scjCyd2TH7HUiEgUA/Upd8XyXOsvROhw8gzPMSZS
	uTDHld3r+CWim62VSSlH5cRNzBMF3wvORKBrlbd6ZbAsrc/VY2XrTiYk
X-Gm-Gg: AfdE7cnCKKi+2Jh4MFwCEa95vdb15k3okOeV3HTxNguF44jlhM3q+hTfShPK4bo+4Jq
	O0m/jrkuvM7MU0BVj0N8lXRu1VQsTnC4SoYj/1DFbLUB/RbZqrFGt7LGl1HgxCccBqtdNWQf+ru
	ptT8ajtcJddQA5H59+3dJ/q3ZLQF6zrNBB+f4oqT69qAam4COewO0PSpKfqEukt3lr979v795WL
	yngkh6SvuvJ5mEn/AEoH4iYn+HNQo2Cp6lvF3spVq9Mx5QRl77LvXgDwIk+IJNNQ5Wocu/8N8qy
	Tt5ygyNNXJQKBgh6DO71g4MaIg4/ZqTgXAZXoVxmj2HlQLQGblpJijKcEbyXCst0kDWm4/fKoQy
	FpEdNbfprogJdOEeGW9Tc4Qj+MIMwpvcsAxsoj1TdH2PPYyUu61/ThN/oL5HiRcFqukS0Xstwhu
	Y1c0Ukv925OIOjQW+bf5A=
X-Received: by 2002:a05:701b:2415:b0:137:9ee5:2087 with SMTP id a92af1059eb24-139eb3fc149mr2286022c88.31.1782556003366;
        Sat, 27 Jun 2026 03:26:43 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d912197bsm43776437c88.15.2026.06.27.03.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 03:26:42 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add Vicharak Vaaman2 board support
Date: Sat, 27 Jun 2026 15:56:31 +0530
Message-ID: <20260627102633.86222-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds device tree support for the Vicharak Vaaman2,
a single-board computer based on the Rockchip RK3588 SoC.

The Vaaman2 board features include:
- RK3588 SoC
- eMMC storage and microSD support
- RK806 PMIC and multiple RK8602/RK8603 regulators
- Real-time clock and status LED
- UART serial console and SARADC

Note: This series was generated on top of the pending Vicharak Axon
board support patches (v7) and includes the Axon entry in the context
of the YAML binding patch.

Changes in v2:
- Fixed rk806 PMIC pinctrl node names to comply with dtbs_check ('-pins' suffix).
- Removed I2S audio nodes which were unneeded for minimal boot.
- Cleaned up indentation throughout the DTS.

Patch 1 adds the binding documentation for the Vaaman2 board.
Patch 2 adds the actual device tree file and Makefile entry.

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Vaaman2
  arm64: dts: rockchip: Add Vicharak Vaaman2 board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-vicharak-vaaman2.dts  | 547 ++++++++++++++++++
 3 files changed, 553 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dts

-- 
2.47.3

