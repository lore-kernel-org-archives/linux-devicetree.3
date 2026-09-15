Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CAA3C7DF5
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479495; cv=none; b=NKuAfZH32iYbTnM501ZzOT29gGhPRbBCaHXSZdwcoXPcN2B4xyAwT1inxeol80HoX3lBzUuqTp/9Ef/afnCLd6zFst8KP5O3MLcIDoOn0JF9k+jHgQG7XrVLYYm6r/W9cQ/JKRmY/Wqz45hjABv/dv3O3XPRWmutMc44p4T7YSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479495; c=relaxed/simple;
	bh=AtaDzf3UImxWy0A6KTITx5FzTXa7Y5TeCqtDnbYgS3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t05bWZc/wCYKKpCZ95bp3vDszH6TG4R+kqTCGwsUTA4/IKOenMG1qBpbJKb/vMZQEPxuDj48bllassTpqUoEAOyKHmcZ1fnYOE7rE9Rt3d0tzRBiu/6c8vLLe9Ab3KUURivgZ04tjm4hcRw8yYrDFHSEcM00sw8wnWZZBpeLj9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=LQsSMwsC; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="LQsSMwsC"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so13293875e9.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 06:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789479492; x=1790084292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Os5r6Ci6BDN5PRIg9YmrRBQTuU5253UEvxdJayQcudc=;
        b=LQsSMwsC13eMjlLlvYHMbBw0i5aoRktHLmnkjcHa9LIOWNZcQ916L+Qe0zTFpTum7t
         rKzuX7c8fpWSLD3tPvKo9opDVnoNfxWCwxI6KkCbI+EDfk6UR5P0fXzymYD6Xwx5yew+
         Od6Bjiet7Oc7ATgzY/bgYWPFE00bwJp/bXMwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789479492; x=1790084292;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Os5r6Ci6BDN5PRIg9YmrRBQTuU5253UEvxdJayQcudc=;
        b=iX+Jdxyid6cZPBqauVjYohlTRnd3DCi9v8p3Q0dJFXunZSOeu38eQp2gCwB8E8wQ19
         mUt8Z21v+mIHaYef9RlgUIW1LRLB/eYZMCykPJ7M9LGl1dYxQEotZtxwLiGWTOLi0K26
         ScDZ6Mj2J9bfcj0w3w22oZPc1s+FVOkGDAOHSt+RkhLPniAoBKYn0JbX6ICDnRcIDUjv
         xERblAaCTVvOxGaGHea6GgUOIr6bhvs35h8xd9DeNCcEOhMVJTHuXWomiZ55G1nO984q
         KXG9/SHFap3WvtvE2nFUlGe+AcBlVTMNKnd5c+gUa9t9F4y5XbwVRvJYoj0K77d1hkbR
         qWlA==
X-Gm-Message-State: AFuF++nR/ExZ8dU3enkhC0t/r82a1675O0ee6wVkPLbvUXCpF3B7pMLX
	hmPLAo1ag0D7oSBCC8pCxtFlWfw/j563/wzjjnGVJ9JUGESJItAN5SeFzVN+vvVBX2Q=
X-Gm-Gg: AYBFou24kB2RebI0ejZevp4a6dfGMhB/JgcRtn6sXUHVgNkAQ69Qel+eAz9cuFivEdj
	m5i3d8LEfbTeK03vBUv6EFRM5kj08kQ6RYrRBh/ZOTKaHBQbfROKF5e2AxM3bE2+m7XpqrKBRVZ
	esDciqFomdcsE9qm5XY/0dIgLDjMMi87CLDPgfSuoaMP8dlgffkRW1VpOF6ycFg6RuMQ59Y4XQ7
	CvXvJA2EXi6k5E28mseNlCosCq3ey85laCLX+k9pt3+qFRuEJAE3rKpVSjwDSnQHBMH6wKMWmHv
	fyjd6Rc2ljsNFpcDNj7bNpKOgfkhiR+oqOfE/2ZR02mRP1kWG/fWCEoINwipZTUjLZUFR8DZtA9
	BZdcx7l6pckRL0+SA0MrfEM1VwHtjjV73REeSn2Kt8p5m1MUJ0sV2C5iPF/c7VgRxnVgeBOBK4I
	lHSz94h1utuTpDyxj1r0ir41XbqYcf0P7vCabt/+AjxtLXK8UMtKu0ceOpsNYw4UnnBW9IuXIEQ
	YxHx9QWwBjagzcJ
X-Received: by 2002:a05:600d:3:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49e7a66b64bmr74231585e9.16.1789479491796;
        Tue, 15 Sep 2026 06:38:11 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm88186235e9.15.2026.09.15.06.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:38:11 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v5 0/3] arm: dts: altera: add Draeger M48 CPU Module
Date: Tue, 15 Sep 2026 16:38:01 +0300
Message-ID: <20260915133805.3249587-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the same
carrier and they are cross-monitoring each other.

This is the SoCFPGA devicetree part.

Petko Manolov (3):
  dt-bindings: vendor-prefixes: add Draeger AG
  dt-bindings: arm: altera: add Draeger M48 Module
  arm: dts: altera: add Draeger M48 CPU Module

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 123 ++++++++++++++++++
 4 files changed, 127 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

