Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0152477995
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843310; cv=none; b=irwqz2L9l1P4lVBXMhinvJoBnmBi+H/p39l1Fuq6exwdA/FqS9iLycnnSj7sP7I/OKG3FW47TJQjU+1yyxwoaqd3W+TvAU8CUl7Yk68pNFoPCgQzyxlFF78jiVNL9vyNIu+CJrCTu0WTvkrQeslvTjBeia/d9QuQmCJq8cB2+JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843310; c=relaxed/simple;
	bh=gAKJTXCOZU+YKYQWwwMx7YWAfaH/SysH0hVcYfn9dVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KsahVcC9tPUDe5jDbvGoR4Dh7hKa1Z/p1nt4ed3qF7Ujliz9OSaw++/rbaIqm17YXA4xOkXWMoxRgB7+SSJ+NxG4cykLR48tkuqDnIqz13kZL034fSDG3b1q7r+d5GTLVasHQ4mCkcJ3wGARo8wknCoqKP7F45i2eVnw2kSpwRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/V//6gY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/V//6gY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so1390484f8f.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787843306; x=1788448106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fag10csC5nrC5HLW7gpXLgEuW1jB3xGm4i/F+3ymn7w=;
        b=m/V//6gYlcZsMYqjbfxYsCYZPIOy0vkltouZ0pbQu+jtRgCTOKCC2W4imslZ47gqq+
         fuVusIi85099F3yV6rJ6BDO9OPy3t+8l4tDsCA4TzNV0Y+qM8LMxTepaETK30g+U4Hy+
         hOEUB7shenQ10cD1OQBgzXPyiS4K1hZKMqyjbLtoU9wSnOznp4/QA3H8kL5d5Wt8ZNZK
         v1QxXVvz3i1us6+0DT8IVjjUEp5IlHhjim5tVM+zQttouR3GtT+jWPfAx3G/KaykS+LQ
         R6eZxJi122RymgAASd7z2RjM2QRA1x8spzJkI2b6I8J2F0gFXZFmVFoBsU4m5PlW1RSD
         0cRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843306; x=1788448106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fag10csC5nrC5HLW7gpXLgEuW1jB3xGm4i/F+3ymn7w=;
        b=LDfiC/Diev89o8kpbq/sHKw1aSTv+ILCOLctTg+y1FkfnOiIPkH7Vbkh/sCdUF0Qil
         CMU6Dfk3g/XPFoLN+rZchSVp6ikbScEiOw4INXtbv/b7xcf7kt1n30hq6VNrJvVLYfMb
         QxXYNqvXQfczaz/ImSsUN7NJc7ySC0OTwiF5lCI8rcg/QnIuIu2Gg3C5K+btktrI4MSB
         RV3kqNLkeS87GzbX8/papWsn8y124izCO/MFKZKtTlMoxIhyuLh5FVtdfSK+M3UDorut
         JcrFvmfg/5iOqMFd1CLK3mOIidlmJnWZG8HZjLk0/csZoaj66i59S8CruJUMT4DUxfrW
         CMxw==
X-Forwarded-Encrypted: i=1; AHgh+RrFYqyUq0vnxMwKl9d3ROe1dwZd7La0GJx+fnbQCUXxjdaqWzbe+m6AmWGuDhK5A0qyOdV7/5t6Ppg4@vger.kernel.org
X-Gm-Message-State: AFuF++k2QE0EJfjERAmC6BmsI6SVRPrrsZGszl+BAEY4O7PypFubxmfi
	51eOiRzNgg6bqVoDnRYJAx86xZw5awysUPXxbTRDbNUwk4CetUm+XQfL
X-Gm-Gg: AR+sD11jIKHoMfGfcnR0yYlqTuWg0gzScU5DFO6s7G/LaV2f5AB6wHdkbL1QtxoFJf7
	Xt9kdOqezhA31vPZWBrHlRo31vts9pJTFoWuwzEgWDT8xNqwnIGTDzH4moSIPlsU5EjVN+dWNiu
	ZVj111F/Gjn/Hd6HoF+QEBSqfrW4uB4BFJylljkwY+wUuDvyOar/0XWitbhlaBNedj49kByZRmV
	/QHi5CO9CQrag+6Ty8lme2Z721bcNlu5gz4K8IR6cJM2On6DTIrUzKICUmjZHTwzG+HuVscVf/m
	GZZVWx3ipwDlVDu3gjPg0W4aQIB+3J/fIl+cSQbeqBU8r75fA9MT+f0mIRmczDLlZ5bm7MYWtYZ
	4H/fIi0rxj9cgS837mj7jV9Mbf0gCtsv3h3HzJTNmCNK0HqDbBVHwFA49rt6rDpiM+jiHKSHPBp
	TM0epAvKQ5O6mTWymgqQgCNJ3jzKSjh4BaAotn5rNuUexaxOHZLnEXvv54EFdJasGX+V+TtWiss
	LkkkNjv3ZGkyRY=
X-Received: by 2002:a05:6000:26c4:b0:47f:7759:89df with SMTP id ffacd0b85a97d-482e26bf25amr18874741f8f.3.1787843306015;
        Thu, 27 Aug 2026 08:08:26 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([165.85.187.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb11sm10247151f8f.8.2026.08.27.08.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:08:25 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] Introduce basic support for MR-NAVQ95
Date: Thu, 27 Aug 2026 08:06:55 -0700
Message-ID: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hi folks,

So, as the title says, this series attempts to introduce basic support for
NXP's MR-NAVQ95 board. The "basic support" refers to introducing a new DTS
and enabling a couple of peripherals so that the board'll be able to boot
from eMMC/SD/NFS.

So, compared to MX95-19x19-EVK, this board has a smaller form factor
(comparable to the MX95-based FRDM boards) and is designed for
robotics-related applications (e.g. drones, rovers, humanoids, etc...).
The board is currently at revision B and is only available internally.
The board should be officially announced around October/November 2026.

Given that the board and its support are fairly new and still under
development, I would expect some (hopefully) small changes to the DTS.
Hopefully, this'll be acceptable.

The schematics, a brief overview and some pictures of the board are
publicly available at [1].

[1]: https://github.com/NXP-Robotics/MR-NAVQ95

---

Changes in v2:

* remove the "pinctrl_usdhc2_100mhz", "pinctrl_usdhc2_200mhz", and
"pinctrl_usdhc1_100mhz" DT nodes as they have the same configuration
as "pinctrl_usdhc2" and "pinctrl_usdhc1", respectively.

* add "bootph-pre-ram" property to all nodes that were included in Elena's
u-boot patches. See [2]. Note that "imx95-u-boot.dtsi" is still required
for the binman node and for the rest of the nodes tagged with
"bootph-pre-ram".

* link to v1: https://lore.kernel.org/imx/20260825120812.2152-1-laurentiumihalcea111@gmail.com/

[2]: https://lists.u-boot-project.org/pipermail/u-boot/2026-August/629002.html

---

Laurentiu Mihalcea (2):
  dt-bindings: arm: fsl: add MR-NAVQ95 board
  arm64: dts: freescale: add MR-NAVQ95 basic board support

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx95-navq.dts  | 237 ++++++++++++++++++
 3 files changed, 239 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

-- 
2.53.0

