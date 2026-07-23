Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEE643900D;
	Thu, 23 Jul 2026 09:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799511; cv=none; b=LKXBfY+ntU8Hl17ssmX1lJmGxaZgGWSxfoMUAPKpm0JKCdwZDndD7deavzgiCdyXAZnsu3GsD12D3t5wwXQqCVhdnQrgdWl1Q2h/kKAuUWjjHKqYOQofyOKUrrXFxwRkdOWMVp03ZtrEGu9HkhmE0NGPnjFVVvh298OO97ovhts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799511; c=relaxed/simple;
	bh=GJTs5OlJ9SKxLMi3iaVn3trVVgQFAhsQU610J3LnjyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JbqVA/7XLeRESXR/QP/KhzBStswWqOrhA4+1cmmdFbyCfLMmIrcZ7Z6SD9t9EA59O7xe4SO3kxqMRZzIz09StafrxFoRZL58iWzCSB9i+lYBWSoUUfm5f6Jb6InYnTGvm+9fWVVPXyIKTKfYsg8xWTs8zH+HtvE9KD8opDPfKEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=KmZioJc9; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="KmZioJc9"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 583621FB1B;
	Thu, 23 Jul 2026 11:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784799502;
	bh=JJLBjhTwK9Uo53TmNSc/cJ9oL3cSqYdaSEVBlK9j7mw=; h=From:To:Subject;
	b=KmZioJc9sYaepD7gYtFjjcIDXj72DQt0fCOxDqITgrd6g54GW5QKCMnSvFzi84PDi
	 1R47KYfSgyI46cU3MvkLhIR+b3Inj9CYnkCPaJ9ep6d1YnoHHkILF8kYy0s435I2gT
	 ClzG4DWgzGY6gY1GAgcw6JSG0aWWZ0zi/fOjCnxbo5+9NmoPFQeRSZsTXHSMLv8kCI
	 +2B80fYvR2pfu+CnFN0/VaFjEPhynDnK7HLoE7HaGBsiRn96wpafF/OU/4zHZiq4Re
	 21TFqmkVaHDyDwqTBdz4v0+esdjq7GsbMVxk5UVLxQxO/D1qZCRkMcOE1Ce4LID/1V
	 u5yPp/5ZHaRug==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] drm: mxsfb: Support LCDIF interface bus width
Date: Thu, 23 Jul 2026 11:38:07 +0200
Message-ID: <20260723093813.180089-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The width of the physical LCDIF output bus can differ from the input bus
format advertised by the downstream panel or bridge.

Such a distinction is required when the LCDIF bus width does not match the
width of the downstream display interface. For example, an 18-bit or
16-bit LCDIF bus can drive a 24-bit display by wiring the available color
bits to the appropriate display inputs. Configuring LCDIF solely from the
display's 24-bit format in this case selects the wrong LCD_DATABUS_WIDTH
mode, changing the color-bit assignment on the LCD_DATA pins and resulting
in incorrect colors.

Use the common OF graph endpoint bus-width property to describe the width
of the physical LCDIF output bus. Make the mxsfb driver derive the
corresponding media bus format from this property and use it in preference
to the format reported by the downstream display. When the property is
absent, the existing behavior is preserved.

Set the endpoint bus width for the Colibri iMX6ULL and Colibri iMX7 boards,
which route an 18-bit LCD interface.

v2: use the common bus-width property instead of the legacy interface-pix-fmt
v1: https://lore.kernel.org/all/20260717121847.488148-1-francesco@dolcini.it/

Francesco Dolcini (4):
  dt-bindings: lcdif: Add endpoint bus-width property
  drm: mxsfb: Add optional DPI output bus-width configuration
  ARM: dts: imx6ull-colibri: Set LCDIF bus-width
  ARM: dts: imx7-colibri: Set LCDIF bus-width

 .../bindings/display/fsl,lcdif.yaml           |  9 +++++++
 .../arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi |  1 +
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi   |  1 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             | 24 +++++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h             |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             | 12 ++++++++++
 6 files changed, 49 insertions(+)

-- 
2.47.3

