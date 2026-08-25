Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA36401A06
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659869; cv=none; b=n2lK7xDY8RgwszceICRxOyxu61ekj9K6a+gN3B3lNci8ocHX6wAfymapNWvK6LFn3hB5qYUFLEY6vK8Kr0kM2xbe47G6qCVXK2qEXq1B8xSmoQgn4rWsGR5YzcVEvA6nxOGPiQB5IXEVYO2yfAmRpvfDyzOPYrrCbbpyys0g2WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659869; c=relaxed/simple;
	bh=OoIu+mil0XO92fIsjqWv9vfzF6b1evoidPJrDdWBQAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ulDlYcCfFCydhHzNgJYnc3VBEHvQ17a+zk30Yl2qRpeaLd3HoDdLJXm4Gl0bjvNwTZ4RAEkcCNtnaUgntD1/MT2uZF+WmF6I49fayO+5lCJ/G2GRJYGPM2UxnYgR7zRKTSs4KnBpoP6Hpq4Oc6HOcEd4rTcECKqzrztnrJplF1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxGKmwYf; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxGKmwYf"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so8220478a12.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787659865; x=1788264665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=atWjNAMAaNJWYGmN0Wv2M5ayz9/TPLLWEzvk52hmDpU=;
        b=QxGKmwYfVJgugll+8wpPOdMGWkEgbLIJhGi6mIBPsQAeOoMVyOK6m8sc5+6XzgUewH
         Ym/XXXRhWuQ4kAos/JZlASW15AMsmqQbCVfk3BOkdJt+p/8kZFIvk8ZepkheXa2tvW1X
         lTYTlm5p970eqrTjP94IYSYxGTQL82SooFosVWOHO1aFluXD6YkpkYUDDF/QBMzJdT5D
         fTmv14fwdOsfsooqo9rJrnNG8jAvtJmcDHZxRh9LKm+A02qg3P/uuzlUPhrhG+AiyVLd
         fwJsTWq0yegds9CnCJ4/9eZbRc14uI82R9oitim+XSQVYg1jo7a0PedTznJY/zMOVcZi
         +ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659865; x=1788264665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=atWjNAMAaNJWYGmN0Wv2M5ayz9/TPLLWEzvk52hmDpU=;
        b=E56fUPOX6DtzU0PbRN17PaBueMedqpvb0ow7GByDTByD3wK4D3+WX38wIv9C1jh4Ut
         B/t9EDVsEvrt37jsSi/5cCMHYnrTQBLGdcVe+K617lareYkbwlv4W/LS5hvVyXU5jSmZ
         Yui4dO1yPDm0hkWuAW15+t8Uun9+ol1YW/fg4vbal51wopDFZQD0BAWh088nr/mZfAUC
         4RJ1NPm3gLqm7LVPatmBJjsJ/fwy3epDAepCaiu7z6vmlsoMZtcAyseQKmr2fJtnRy9S
         aeTx3OK3DQlR0uZt3dWDrkgkf7mA/Oul7hGkD//QAnukL6hAEyvPqzs9HeZT/YXNvkLy
         6oSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwB5czwn6rAI4N163leeR3670xVpdf1FgbqM5LexgX+pxBGc8aZQOHnh7WRr8HdlFPS1xQuxLOdyoh@vger.kernel.org
X-Gm-Message-State: AFuF++nOcaUshf7O0yFOE6vp3WzZ6KV7XtgodbrqG1nERB8TIoHXb9Kh
	Uj/oMmL6vaVIFC9GM9q5PvXH4IntmTkiPLTYDYkmVCjnMeEZCwMSG4S6
X-Gm-Gg: AR+sD13zd2k2FkZkLTk7LI/YxVGBUGUjKbqBxRWOLkTUF0O3k6K6eMwWDGLmHC52yHi
	CM6P2FiXPq588paTYNYkO76dZympQqugQ784RKUAZMK1z/D9YJWiPCsgI2ZEboR/f6j0yMHzu8L
	8+1Ts2w0Mxk14UofMSa0x2KQOXM2FuE8D+In2HlmE5r99JOS2Drv0MLjVN6JCrAFlToMM4Maap9
	aqso0awGrlfunshIhKlvzYKH6kB0yi/uX8u3yr2ztO8QBzsmUKLye9a/srhczamCxKbLlVQPQtK
	DvzxjxeBttljokWZuoAjI8pvQnzPfQEhOC/ZJ5jO6GZJlmEie88ZKOg8OQQSoyK70lQ/AeS5dr/
	tA92TvC1oquJ0oaB2UEj2szbBBlJN76G/TXSp2wC+imVWaSoHDxQe7M9egeA/W/o5gwmPUeYj3r
	fcuJbU5A7VBhS5GWVVfJyh16gHh5u2KzaXy7aI3xqgxE0B4DrFz5ruGMdgKhL+l/o82s2CPD1Tq
	OUd1x8GI7PtBIw=
X-Received: by 2002:a05:6402:510d:b0:69f:d4b7:9476 with SMTP id 4fb4d7f45d1cf-6a5c40f286amr6392722a12.4.1787659864924;
        Tue, 25 Aug 2026 05:11:04 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199767sm13841351a12.15.2026.08.25.05.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:11:04 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Introduce basic support for MR-NAVQ95
Date: Tue, 25 Aug 2026 05:08:10 -0700
Message-ID: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
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

Laurentiu Mihalcea (2):
  dt-bindings: arm: fsl: add MR-NAVQ95 board
  arm64: dts: freescale: add MR-NAVQ95 basic board support

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx95-navq.dts  | 267 ++++++++++++++++++
 3 files changed, 269 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

-- 
2.53.0

