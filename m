Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C714C320CD3
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 17:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784915843; cv=none; b=SvqMZvDl+0ZwpfnimazvnuuDplY5oJMM5O8fGDZo8WNFiZW4anhuzGuGddo1P3vO35bweO4sao9GTpGI/p6wdb9m+VOorfnG85A58vsDcIG79wh8XnAMTrCu/V9Bjic2s4IswIUFJvftEV38DvLG11Hu6D/6DfqUFUibJsQ7Ep0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784915843; c=relaxed/simple;
	bh=uDT8c16DbSxqZZxjBdoIWbaQXcOOTJ3hZmkYntw8ZgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=glFAXmyJi2slWgJMPIsvDZZTrXHwFfRDX/he2ImqMO8T36yw/eEdTnBZqjodW1V9MrSQjn3NuaM4IP89ucD0/3iaXlk97f25hPv3QoCzyEFa+YkRE7MHGz/fSITUQbiIcAgY+IT5taNceHmk1Q5eW/K0OgqgeJdbKEs2O14Ozls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNBlQ+Bb; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNBlQ+Bb"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bdff8c02b2so275465e0c.3
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784915840; x=1785520640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+Fn7OJixxGTLDuh6Ch6+xz5tIbqmhVuP/LIxpPEqJQ=;
        b=CNBlQ+BbohiuSPUdU3e+vEWXtkMpV0uV2AEh55KtmZAUQihsjTAM2PLUrDDUv14rve
         1u756zmg+lqPqmEfhSbwnvQuZQ63vnF9jx5wcSCXZtf6E8aogGmC9LUiZYdZeZukvCt/
         TuYMGIN3vyV5wVyfQ1LAsOVZqrCHlhDtg5ENiTxfMaewclEdXUKjPv4Nip1ZVwfCYRjC
         13hYFmzfpd91L+Yt8ui+tGPf1cdB14IqGMoktEUTTOW1W/+f5LNgNjttJSaH6+IY5t8V
         NO1W1C+vi0eziU2pw4aPPenR895y+uSxL9lBrzAGh3sOkcHUICPGag3Dc/mrL/PRr2kc
         kqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784915840; x=1785520640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+Fn7OJixxGTLDuh6Ch6+xz5tIbqmhVuP/LIxpPEqJQ=;
        b=k3MGSVmqAmHPLw76Q1XTni4v7KETHvJ7kuXc4YLA9cVipFyIHUeRxrPKPxEjGDey10
         XuxF6V23raOvKQNSaIkx0V6UpSlgZYaBXFfhrm5qFiWrLTj9beAJz9tqDtzdqbauI6Yn
         M71+n39j4jlgZno28uhq8tIe8ry33y8adwFH/LWWeIwBfnxhus++TlMH89bGgMvzw/oM
         vhur46WScY+qCI3H+U3UFO/TxZtmFHEmiAhRolxf/sFUIiAZkmEgJnWsvfct60ALvCfy
         lxF/k2dXkUeubu2xlxYujLC3JfJ0L0We1wrfM2PIuWl1F9DnQ16rC3p1XVxR3p6rZHQj
         9nLA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1zOIfNlHLriy0FAFhZ35lMH+TMl6U3ZGlZh6OFJZ9UeQgs98bhMAi6daPB5t2sq/iNWhDzqcT/Qok@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd87zaH6wrq3vXZu/PEe3TkBO04q6/rqKWYGGp73zdmfUdVIp/
	j05GkmV4JIkt3lO66kzyZb8VbkVTeRHz4z/dRMNFVGEXLXpsmGfyQosKP5C593wgHYg=
X-Gm-Gg: AR+sD11tVLkTIgSeL3xR5AMCDJ1M72BZ7Q6TABTPMM6l6iTqdnJbYoh1Q4ACcVE4D/3
	YbR5A9YOyTPOuicDzO1myMuqCVeM7w2MfA27zhf8g0fmTdXPlfjIz63qwtVuDkvJWVh1WOQ7PDQ
	ftIulDdhTADt9ld0nYXRjXg+p9n6R/TrKuE668FK81l6F964E0MdrzD9YBgg6RX7WSjRz6V78v2
	DUpDZ++ZgwtwpM2yeRt1BSTiXTYwWGuR0Cmboe/jHFQk9SnkqnSORv3cAyVPRmL1BaKvu1pVZkL
	StnSn3sADX6RBxd5DpCiOM6ZU8R1+TAlK+A5qmqKFIkGk4ZZ20cgrklVlBdDDnI2xS7UXsQwLVi
	HafKVG4cAjiXx6s9HB7U0wMZcjiLkfpw4G9KR6iReApW/6PsE0CdZTYtQKk2ebFk98UPgoTAmcm
	b5HY5ONkDI9w==
X-Received: by 2002:a05:6102:6a85:b0:738:20f:10de with SMTP id ada2fe7eead31-74d5fdcd898mr3880056137.17.1784915839620;
        Fri, 24 Jul 2026 10:57:19 -0700 (PDT)
Received: from leonardoc-nb ([2804:1b3:a700:4ed8:4d0f:883e:31be:d914])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97774c901f5sm368376241.6.2026.07.24.10.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:57:19 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	leonardo.costa@toradex.com
Subject: [PATCH 0/1] Add Toradex DSI to LVDS adapter with the 10.1" V2 display
Date: Fri, 24 Jul 2026 14:56:33 -0300
Message-ID: <20260724175657.15398-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

This patch adds the device tree overlay for the Toradex Capacitive Touch Display
10.1" LVDS V2 through the DSI to LVDS bridge on the Verdin iMX8M Mini.

This change depends on two other patch series, and should be applied after them:

- https://lore.kernel.org/linux-arm-kernel/20260623195741.495734-1-leoreis.costa@gmail.com/T/#t
    
    Adds the Toradex Capacitive Touch Display 10.1" LVDS V2 overlays for the
    Verdin AM62. This series is required because it adds the panel bindings for
    the display. It is currently in linux-next.

- https://lore.kernel.org/all/20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com/T/#t

    Adds the other device tree overlays for the Verdin iMX8M Mini.

Leonardo Costa (1):
  arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adapter
    with the 10.1" V2 display

 arch/arm64/boot/dts/freescale/Makefile        |   4 +
 ...dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 133 ++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso

