Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2654936E494
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 17:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783185281; cv=none; b=JFDiRWo6tBBw63Sd96jYpj+tiD3ebNaOCl6Q5PrlwrywGy3oQfhRAsLhq89YYovLRnimVMvUOZiLjeiJcyulDoi8ouU1xBQA4c6uasDQiD2IquA9r5RQSVLqD6kzYXyfA6Qwv8pt5Q+XayPiHP14fVYPyeDZ2NEv5MtsX2BGb4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783185281; c=relaxed/simple;
	bh=iiokSlZfLnf8dlWNcbww5/0TbRCZJN8q+3FsBY/mPN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HFUj4qS/zEhzF+qP8/rjvy6E8dJQmN1XkxzTb9iYLbGN8qHnv+/qechYuXKx9AnX3iJTk2hFw99/IH0AOXIQRzsY9DZM/p64ZYGVpxO6gd+kKW8mMlyEvaHpDRVE7C7D3l7bJ0jKGq5koj5paL+AsR1yndTagwMVwWZrwsLnGt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnEbUP2F; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnEbUP2F"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-847968ca62fso1595483b3a.2
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 10:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783185279; x=1783790079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W/CI0T+kn1yp9pQC8EXUf58GcP8gv1PF56nfEe5TT6E=;
        b=XnEbUP2FecbFHvbyEOtXE/BEquQ/2B7tLp1XHwNY+vDbaTyOobNx3uYqxSIPQ87Y+9
         RmfXGBx2cW6yHItoCEtl0T0ehO6UkMO6UZ+N5IkPxJtuyT0g4ZwiTCc1zYxCQPhcrbLm
         EMOO+G3aZX244Q3QgWZfPEYvGfQFvB3xmFsXewrqBuULafGB8g9mA/W7EoEu3O1wunK4
         yhiGm0pIDfupOAjASkgxSQ1m3AXLT7+HIOm/sRWDu5y76Xb3QreOHQsw3FUK5juA1jnf
         Xuck1L9/d6NXSQZsQxyuWPmfeEa3eJ6A74BD5NhmsH6sE4dPnqSISAf9bEoxhQ6r7mF2
         ryRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783185279; x=1783790079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/CI0T+kn1yp9pQC8EXUf58GcP8gv1PF56nfEe5TT6E=;
        b=BTo6TKvmR6H9hon2qfvhYjRdcCHUeqV3RA8lSHjnoxp7U5uBsYLwmvxOc/lh32/2ce
         DfB2Jje5k/uSjhz+78eQM2s7t35uI6W1WHSswfUDGBOzHXyKLFZexouH5oJ9zCv/fUGA
         BBCRHDPPJ3GILpifue7f07WF+yQ7TaZDpILnvOsfx+NzPqjjvOmJqpeVwh6fFsEM+eGx
         zPGo2hbwmUpCg2c1mHCzF2gJuteP0LeczEEpdR81MmCNSSe4PJba6JMHIMXfd9cs+5wI
         qFkxUllYlFmJ8vlWU1xo8sX0P2kTAKaOPQ2EBX5hPKcDt4JNksIDZdmm5AaxZMqPJse4
         Eyaw==
X-Forwarded-Encrypted: i=1; AHgh+RpkFuK7j21pt/pUYu1L7wYcBcfbyMP9vd9KyFj5UoxCKQhVWGXxrJXQw5qp3SKyKVST/CX+MdHSjrLZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzGf6vQIDxLupRbzwyNhq+c+D2+OBZPJQpb0udfcIiu6wlI3kn5
	9wBGyHOXmSNB7pecB1KqpjTUX9l4dyRK28zIRd7sd+aOux7GdtqmiPZ+
X-Gm-Gg: AfdE7clgN6nBNC+CmjvG61cJcwee0HGVKHiI4pUPZ4evkM7OV9CIKqLFR7jkQOovcbk
	2nUMMNjr3/JORjYn8iQJR4mXS5NRXSvgclPB6xh9zBIPqr6NWO4nPckgZRB2qgUn/jK0Mdpm+I4
	fzLCwiK7FaUwYx4V/alnRM1BYCbE3h/o9335RvWZpPsfrabvsbTVGuu9ZLpoOiTRPA4tkAzW7Qi
	bnXrJO0bAPGLUGE/yT+7hpo7MRgG0nUO70eaHOLYGwqvUPCuwXVIobhu+Z9N+Xt/2tQLVzg6Ajl
	EN4drYi8LjkQ/EI+MybW5GvkFMiFZjTaz0cSSuxGfsXTbEqqn0UXw+5WksJ9xmUTFWIcTi+E4MC
	t26UEONpLrXIzyLVujwLTtwyR0V1dRrURCr09SWTJkPdzlTdZKPqNoucKGJ0mdv86e8sYQ3hNmh
	LhVeYyenC0OfZUqvk=
X-Received: by 2002:a05:6a00:439a:b0:847:904c:8452 with SMTP id d2e1a72fcca58-847f6ef68b4mr3914684b3a.38.1783185279250;
        Sat, 04 Jul 2026 10:14:39 -0700 (PDT)
Received: from archlinux ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498adsm1379101b3a.32.2026.07.04.10.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 10:14:38 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] Allwinner: A523: add support for A523 THS0/1 controllers
Date: Sun,  5 Jul 2026 01:14:06 +0800
Message-ID: <20260704171411.1413349-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds temperature sensor support for the Allwinner A523
family of processors (same die with H728/A527/T527)

Based on 7.2-rc1.

Changes v5~v4:
1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - added empty line between what and context
 - clarified description
 - added missing period

2) thermal/drivers/sun8i: replace devm_reset_control_get to...
 - updated Reviewed-by tag

3) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - removed dead IS_ERR(caldata) check
 - replaced NULL/IS_ERR check with IS_ERR_OR_NULL()

4) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - clarified description
 - added Reviewed-by tag

5) arm64: dts: allwinner: sun55i: add thermal sensors
 - fixed patch subject prefix
 - clarified description
 - sorted thermal-sensor nodes by base address
 - added empty lines between trip nodes (DT coding style)

v4 https://lore.kernel.org/linux-sunxi/20260504050245.646078-1-iuncuim@gmail.com/
Changes v4~v3:
1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - gpadc replaced to mod clock

x) thermal/drivers/sun8i: add gpadc clock
 - removed

2) thermal/drivers/sun8i: replace devm_reset_control_get to
 - no functional changes

3) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - no functional changes

4) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - gpadc replaced to mod clock

5) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - gpadc replaced to mod clock

v3 https://lore.kernel.org/linux-sunxi/20251025043129.160454-1-iuncuim@gmail.com
Changes v3~v2:
x) dt-bindings: nvmem: SID: Add binding for A523 SID controller
 - previously accepted, therefore removed from this version

1) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - added changes as requested by Rob

2) thermal/drivers/sun8i: add gpadc clock
 - removed undescribed changes spaces to tabs

3) thermal/drivers/sun8i: replace devm_reset_control_get to
 - changed the commit description to the version suggested by wens
 - added reviewed-by tag

4) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - added spaces in the description block before "*"

5) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - added alignment of functions in compliance with open parenthesis

x) arm64: dts: allwinner: A523: Add SID controller node
 - previously accepted, therefore removed from this version

6) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - no functional changes

Changes v2~v1:
1) dt-bindings: nvmem: SID: Add binding for A523 SID controller
 - added new patch

2) dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
 - changed clock order
 - added additional nvmem cell with calibration data
 - added requirements for new controllers
 - added description

3) thermal/drivers/sun8i: add gpadc clock
 - removed unnecessary call to clk_prepare_enable() since
 devm_clk_get_enabled()includes this

4) thermal/drivers/sun8i: replace devm_reset_control_get to
 - original function replaced with devm_reset_control_get_shared_deasserted()
 - removed some of the repetitive code executed by 
 devm_reset_control_get_shared_deasserted()

5) thermal/drivers/sun8i: get calibration data from two nvmem cells
 - added possibility to get calibration data from two independent cells

6) thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
 - removed magic digits
 - changed description of calibration data procedure for A523
 - changed numbers of array elements with calibration data

7) arm64: dts: allwinner: A523: Add SID controller node
 - fix typo (sun50i->sun55i)

8) arm64: dts: allwinner: A523: Add thermal sensors and zones
 - cell with calibration data divided into two
 - added passive trips for gpu
 - added information that information obtained from BSP

v1: https://lore.kernel.org/linux-sunxi/20250411003827.782544-1-iuncuim@gmail.com

Mikhail Kalashnikov (5):
  dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
  thermal/drivers/sun8i: replace devm_reset_control_get to
    devm_reset_control_get_shared_deasserted
  thermal/drivers/sun8i: get calibration data from two nvmem cells
  thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
  arm64: dts: allwinner: sun55i: add thermal sensors

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |  54 ++++-
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 160 ++++++++++++
 drivers/thermal/sun8i_thermal.c               | 227 ++++++++++++++----
 3 files changed, 395 insertions(+), 46 deletions(-)

-- 
2.55.0

