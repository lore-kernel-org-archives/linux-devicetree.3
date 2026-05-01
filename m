Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C414383C8B
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777632685; cv=none; b=d9uFWDBGI/8LgsSf4dfXqeO96ytOhDEFIeZMkpEJIhkR0u8baT8odxSuX3W60BznOa47c5Wi/0hbJJGjWpS0RufP6HHpQ2pfwMAA0WSsMq1MpTNtCaGn98+yJOUZudJ1C6juITisZHnNE034VDW0ALD8UJVW08/OAEfMl2nFRCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777632685; c=relaxed/simple;
	bh=cwZgxxNMqmCCqnCT2BZZVFBDZYiRKnpQeNPDEJl8+q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HdU0Yy478uMpcoumMBPudGVRcPwGpZvkWU2zYuOobnnD0HKoawyFzr4kIzSPdpl7WnixwuFJpveBS370UiuTDipTIaFmMe9xgspnwPayqW7JPjaJzttGL0F/P8NcxytPcYcOj+cR77RrxZeNQbirjteeD4cS+xRN1E+K75vqTTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXlrBhlM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXlrBhlM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso13784585e9.1
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 03:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777632683; x=1778237483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XSE9mx8/5dxgsQtGfHZyOV8gnMykOm6sGZtsfo3T6Uo=;
        b=BXlrBhlMiuWH8tAV/miTQgFo8iefz9nyD3eR4vN8aR3YjpYRXOVmFch8+T7xT1vX6+
         cCD4+1zATNxipmef8nG1oYNynpyRZNvmg3NuA7PIgceHbSZcRqgBBnpZQgDG9K70EzjK
         wBFgguC05cb79I3GvIq+RXqQbnYu8TCLjpDBH9W7itRgRqipxWbAabsRRp4PEDk+jAP9
         A7Xw9v5qqGLv3PIROhfgCJID6PfDQwwCJF3G3o3ieq5D5z8DIRKI+NweIuRG0srGCoA/
         YQ67Ohz8at9gEe17K6awquitoWSG7FHUkwvXKLmdGqZZzXi/Jelz3LYwNKoKS2B59WQH
         T9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777632683; x=1778237483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSE9mx8/5dxgsQtGfHZyOV8gnMykOm6sGZtsfo3T6Uo=;
        b=eGnSLaKldEL8CWou0Q78OqPCz+JyaT6n8z9lLXLUzGw+X2L5JSFQcZV3m3+pmRM/na
         jbrBXhrngwdfjNg0mysOjE79zu6/WAK7Z0V4YkPqfplCu4VYfdgM/Mcn4wAqtNPLgg/i
         6e5FMVTFntur0ivrcBWajvpxRix18CK+rA7hcAb0eJ7Ip6EiFGlwW19WIWNoQ0Xy8VQ8
         1hFqJINgbaClVKtysjQHynjco8EEYOY2O3QXaMD4sy/1F0EB02glVGIQSK6w75EhETrh
         wD/F6mEdDY9H8mbBsQNAOo5TJPiXPUoJb8oMF4bujFEBTLE1+JFMdx+XaqUQRIIFEg3V
         0kDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9miJ6Lq6mCtm4p45wAiFs06wGefukVHFesOe7FagJwB4UJ7H5/ndAg9xcoCESOfXQdKyVvajzIyA+z@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfx4IKUlT5XKbAKp1dnBwU+GWXM6dDOVefGWWmTW4h+wDXeuLU
	L0GOqOogheq5oV592GuPjwsYF9j7lFHP3XEKawZM3GA4TadntXKzI7zX
X-Gm-Gg: AeBDiet/IZvgG8qlN6HwRKadTNg3HCSIPNzZFCkVYdeA+ObpD0YU/N2rqPpXMYSjJFq
	UZ9ODZRKjLFrjvG9g4IbH9fiC1JtoEZL2E5QO/8f6JnJXnfzRPhBGssGQJz2jmhjIJFwstBwIs3
	Dhs7y7JiPXraYtJ5F2csb2ql+1qkTrbN6pGPwgex5TSteN5CSsPAbDPKVWqkER1BKN3l1HAGq3W
	4kjfzy6eTaTUrJTG8jNLP5ijZWKjfRIBB3C8TlMASZFSs5K1LY27vw2ZET4+uWO66mCGY54rse3
	TnIBc/JpXNyuPuFmCo+CipWfoGMNS3A+Lec44BR3LC7R5zQ4hhWgZdWXWeE1+xbHJgvaC2BZcdH
	B4WZWC4Hy6X7ueUHuj0gxkSuzNMtqEOpGPsx/JBoZpMcQKg816i0iTs1xp/j0F4TMDUsbjAQLcM
	iHS0wcH+MjCHYS5UGJ4pIOsckH0sMOjN/nmVRtU1nUgRXvPaIBXQ7OZgISuyBVGSsWM8/33SY3g
	AsUeTuivlbEtT2ytWOsPEk2v/nOhplfhSYYlABaXfK2I14=
X-Received: by 2002:a05:600c:4f88:b0:48a:563c:c8d6 with SMTP id 5b1f17b1804b1-48a844eb8bcmr105123575e9.7.1777632682700;
        Fri, 01 May 2026 03:51:22 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1220:5ff:c603:f3ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81b99127sm122313805e9.0.2026.05.01.03.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 03:51:22 -0700 (PDT)
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
Subject: [PATCH 0/2] Add support for PCIe on Renesas RZ/V2N SoC
Date: Fri,  1 May 2026 11:51:14 +0100
Message-ID: <20260501105116.33452-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the PCIe controller available on the
Renesas RZ/V2N SoC. The first patch adds the necessary device tree nodes
to describe the PCIe controller, while the second patch enables the PCIe
slot on the RZ/V2N EVK board.

DT binding patch has been sent separately [0].

[0] https://lore.kernel.org/all/20260501102407.29462-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g056: Add PCIe node
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable PCIe

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 69 +++++++++++++++++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 23 +++++++
 2 files changed, 92 insertions(+)

-- 
2.54.0

