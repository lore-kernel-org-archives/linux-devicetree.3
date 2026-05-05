Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408BA2F616A
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 21:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017592; cv=none; b=umHkzGCiNl1Op/JaqyT4O/8doZZpe8Bik2Z+dRw3Ya8Oj2ioD2wAmeKtYVbgaWlT34tEQU8FfimAX9vQMSUjisvpvSdCki7jVMdXVbzyfPeFvwHYBeij/6aBr1BF1mZrEFxhdFFeNrNwafi6vobqzlH+cNEsDZnbj3+j12s64wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017592; c=relaxed/simple;
	bh=QIJvMM4cFbEOWtOC3yMMNP2v0CAU9eRyyBocgkghbcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N1GCUzpl6/QOWOXfRjT7zIdCER0Ez7xDlrculaH88MWo+7bW9LUht8O1V8yMR1s3gqUKFJXsDKUHwXFHw6oFG9EGgocaS2A2wDR6cU7WPfaER4mJ6gz8JdDmduBuTQ6Ik5939Ob5BnG4LHpJBKbcnFa49UetK5f8UC1KaT2TIvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmLXY0zA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmLXY0zA"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso46614985e9.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 14:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017590; x=1778622390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWFcBq0zhFRY7Cz5fcJUSQDRK4lDJnO8aVB09yQ4oes=;
        b=NmLXY0zAIlO8iu/CnL/PUSEGHgc9WiQFaANOKKqby5PQTOmC10GvAaDhdSzWrqBONK
         xCfVPnAFKSYkiu49bqGwl5fsIbftcd/OaS2+LWF+hLXgh2IcmFee40CTFXfQi9wRCGf+
         WIoGJFEuZDSdsp9nxEDK3sP5IeVhPidgb3IrpomaB9B7thGhca4dV/kvpKfwvA2rkjBD
         dhu24ZJjHuOeQL9X3G29dQX/7dPItxRy7sWWohPNELiwGFfK2Epotbwx81GeYg/NlBLn
         HXDf+n9GfsgWYP6HR6uV1bGpVljM56PMSSKpCnhzRbyHHb56tJJR1NwseKYdTZafcLyV
         YOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017590; x=1778622390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWFcBq0zhFRY7Cz5fcJUSQDRK4lDJnO8aVB09yQ4oes=;
        b=farXjEgfw4M1WbihlBwC8IWOOMPTNl+VJVSmpVfyEvqXjfhoMncJsxlt+neOrdwnMs
         F6MW7FAVh3a4g04wxEbnVo2X/SeSvEuobwghAQqanmYjjXzU5eymJZp8MjLe4EmyO5y+
         Bqkz3WjQDCYgGjE2HeMDI1H1du6v+lM531OZ+AsmoXQqXhDkKJhHh3ptHz9shnbzrC+1
         nTn96aHjxSIqgCDvZNoB23KkT4qGLekG0LVYIfB+MbiI7/heL+mLyenCcs/kw4lDI/kX
         VFGF/V69hNICQCtFFHAGzBNCZrukvKNihEG9TuUbAX/z2m2vPruJEaAOi2RPJZigwd8k
         Ik0g==
X-Forwarded-Encrypted: i=1; AFNElJ86lyk9QSMhxi+rVJF4fXfoW6V0YuMa5PKWJ5NyJCyjsXSxi2hLUa3VNNrFsRgTMpectJ9cLYYOuhOT@vger.kernel.org
X-Gm-Message-State: AOJu0YyasnXJRf5rAUkq4oq73oio0GIlFoIxcXzE3P7617iWwmlqXLHK
	EMU2l175RuEcNoam0BqwDlsrsMRbw3bboLig+kFtYyA0pOPBenneKoW7
X-Gm-Gg: AeBDieu0SwDwj0NZowWBkYogfN3k1uq2mxKUBUBYnyofwkMwpKfd7q8gN/ndZTN9adp
	5u2W/y0AknSjFGrVHmZCF+9L+HFxiTlutYNnz8iTfqkNzaGWfGmvmEXDfT+CHOmKf2qY6oz8HLT
	g0xlRyUu8ByReeQX1gm8Nt4UvJUDDHRGT7oqOumhmumHMYlca3KQ2cOiN0m7L0sUGyzaaxx4fUw
	7gpLiaUcuvUniRutzbZcCV3xOxs8LNTj75okgswC4SZFLpXJrg4VFl5tu4AjWGQk12QjIbMPyGT
	b/YT9e8tj5nWEQw/23rDz6qHDjkp99UQzJImstZPwsoy01/5U2GZ3P/pSvURv3c0QEDKPscgY+O
	KBBT47nslJDhktywFfwWOvJG8tbrYzDmpbMUaZlUlN2/xgZDDctVbrOP51M3c4sZLEdODFCUiyJ
	7gnkzPo9oGwn2Wuwi7HLLsu4e1lEn83LcZNgAygIq+
X-Received: by 2002:a05:600c:3f0b:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-48e51f37fb8mr17928735e9.20.1778017589343;
        Tue, 05 May 2026 14:46:29 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a824f9f0dsm411556165e9.15.2026.05.05.14.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:28 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/2] Add support for mt8167 display blocks
Date: Tue,  5 May 2026 22:44:58 +0100
Message-ID: <20260505214541.333657-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the display blocks on MediaTek mt8167.
Tested on Xiaomi Mi Smart Clock x04g.

The second patch in the series ideally wouldn't be required as the
DSI controller is compatible with mt2701, but the mediatek,dsi binding
lists an explicit compatible since 2020 and removing or changing it
would break the ABI, so we actually need to support it.

Changes in v4:
- Rebased patches
- Rewrote commit message to better explain why we need to add an
  explicit compatible.

Changes in v3 [3]:
- Added mt8167-dsi compatible to driver instead of changing the binding;
- Resolved patch formatting issues.

Changes in v2 [2]:
- Separate patch for mediatek,dsi-phy binding;
- Separate patch for mt8167-dsi binding;
- Simplified OF graph endpoints in mt8167.dtsi.

Link to v1: [1].

[1] https://lore.kernel.org/linux-mediatek/cover.1771144723.git.l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/cover.1771258407.git.l.scorcia@gmail.com/
[3] https://lore.kernel.org/linux-mediatek/cover.1771863641.git.l.scorcia@gmail.com/

Luca Leonardo Scorcia (2):
  arm64: dts: mediatek: mt8167: Add DRM nodes
  drm/mediatek: dsi: Add compatible for mt8167-dsi

 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 317 +++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c       |   1 +
 2 files changed, 318 insertions(+)

-- 
2.43.0

