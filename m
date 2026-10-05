Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59EA423A9A
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 23:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791241775; cv=none; b=sVl1baXJrA41ITRGZd6+jGs6uO8jaWfBrUYg4cujT8mJhvSMOMRIhfeZ3KCqG2fDllUxhkF9BzlVbrbcu6bRkBeCeyl0ZVoqvI+YFlhfrClwmT98CSjOraUiegOK4HxwIh0wxlqVTNpLcfUc176EW51U5pCCjLAFMZBm7BIimFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791241775; c=relaxed/simple;
	bh=b0bEVA86VyyHz5nQ+2UxZSzWxBoAP+zyISUZ3T8VRko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nP7iE/+6ylTL5K0SG0fYnDNOjoZC+s0oWlegINkcygMw8T3N3xeLu9rrNxBIGWVqnjq3ds0CblZiycAXTWfZX6fTiKH9mugIcpVOtyaKT2Sp8AWypeAA/e/KSJmOVfftkBVYx8jruw4Dgw9czFNEn8wrzk3kSQtaD3Myl7EoF3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=jhoHViT8; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="jhoHViT8"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb1so34166046d6.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 16:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791241771; x=1791846571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MQV3ii+qSfSea4Cw0bZn9/qaZsDG0gsTwXp5wwzAElo=;
        b=jhoHViT8B2A6av+l5LAX4BiDRkFbZgEUcVsOG2/zZ8Rfjs3RNTus0wwShhyCaf8pN9
         K9i1UbO/et/V/uCXrmhT3wIBxY563u1WJ9CUWx4uohNF5fmHBGjrVovOLm5w6AvvfM/q
         A0pDAavZ6Wl75qA24G9bB7z5fyz/BtSz+RTPgYGfEU4fDx/slaXoH1jN5UBmv1Wtrmzg
         L/GYuaLhCxkWykNSO+8NwRpqTBm/pP/p6KM/c+eyx5j/pXXwn1URHKKuZqlaM2U8yFIG
         3pWfLaJIOET+boIZFFWVaUtVbH1AEisNNPVu6lBa2zuPTm0LCNoq6p6Mw3aoEKFzfmrj
         KsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791241771; x=1791846571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQV3ii+qSfSea4Cw0bZn9/qaZsDG0gsTwXp5wwzAElo=;
        b=BVNfP39jPSAcFAPimMhOyJeeaNpEaD3ZkqE7iAD09sbfK5pr7Xev7m/6r4zdPTYn22
         Tsw2Zhd/pOSXkJyG/MWfI36T384rioky8pcIi8Bdqv5C3RPc8P8qvmK8ap3QO3J1qXoN
         sVlfeJ132IOBybbj8jzobwS2eqSF0m42R43GRBRUiPXFU6GG0jnvrCiFqKblRMlJTz6p
         zM427M4BM9/bf9Jsgxse5h2eOxcpE5ylsIKMR3SdpY6vDP6gNWJ4sfuE2D919F4A53fY
         d+2EnIuSkIEf2ALzOynsyhYodhHSZaiUIkHpZSOuKPzLQZRqs11LzKvCd62+Dz18svL4
         v1Lg==
X-Forwarded-Encrypted: i=1; AKwUvBylgmqlAR2Z22glY1Q+etU4UbomEiQm4Ybt8lfhs6mM0L0aLrg4Y6ONPSDytt3/yVywmxqWYONN55EP@vger.kernel.org
X-Gm-Message-State: AFq9FYJC+povq9HB7m5h2Qylrqayc8KdIDGPHODWYFD3MY0zbYCIf3vL
	5QR591W3IjLm1zU+bcgyjMypEVsw/95nKaLAfvjas6Qf4FRZg1Gsv8b6bDGPxq4oDfE=
X-Gm-Gg: AYBFou3SXf4b7OSfPHn8gPIgfEZDq95MbudZrabzIiD3upP2ylna6Xhg0cGgjDd4ov1
	tm5Oo26t7BHqtT+HVnPxN48zhlzg5pL/j0V31uHirUlZIaTwotprW1pdzIV9zL/AKAQdWGUkwLY
	yvC6NxQESmNa40yRyyDGWgTHIjA+vVw36Whpt04dzF3rtTX8KPq3ryhzR7pvY96LzQhv9F1hBoQ
	kMOjmMghEyJgA4R45dWVXPfL2JPjVF0Xr3GvqTFfwXsg4hgkClTvvORlP+Ti+7BHXEMTz2p1VAO
	NPAqHAEy9jd3CGVIyYQCKuzGSuXO9n7Md8Jzp7u7kSGtOKXjLHnwSVLSw/e2gpKRn4W+UpBQO5m
	BL648Jr2ClE0mD6SPiw5NA7tXUN1Go0oVbNApRU/091Yq4OYtxeCCxh6lnfg7QDm0DaK2WK41SC
	nJlPOBEi2QWZouYDVsQJrp3DDkdkce9bKPsgLnYU2uQXVLI9zCmb3FbASfZQvq/pfTjM7odx4eq
	ekvl3MDBP8Y8A==
X-Received: by 2002:a05:6214:598b:b0:917:9f83:6540 with SMTP id 6a1803df08f44-917bff42ff8mr244696676d6.5.1791241771486;
        Mon, 05 Oct 2026 16:09:31 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-919442ce1c4sm89892116d6.3.2026.10.05.16.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 16:09:31 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] clk: introduce TC9564 clock support
Date: Mon,  5 Oct 2026 18:09:23 -0500
Message-ID: <20261005230927.2000398-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the clock controller present within
the Toshiba TC9564 SoC.

This SoC attaches to a host system via PCIe.  It includes a PCIe
switch with three downstream ports.  To one of these ports an
embedded PCIe endpoint is attached, and it implements two PCI
functions.  BAR 4 for both PCI functions provides access to the
registers that enable or disable a set of clocks.

Both TC9564 PCI functions provide PCI endpoint buses via devicetree.
Each PCI endpoint bus provides access to one of the function's BARs.
Subordinate devices (like the clock controller) can then be defined
as nodes accessible on the endpoint bus.

Only one of the two PCI functions is permitted to define the clock
device node.

					-Alex

NOTE:
    This series is built upon linux-next, with this patch applied:
      https://lore.kernel.org/lkml/20261002181849.790275-1-elder@riscstar.com/
    It is available in this git branch:
      https://github.com/alexelder/linux/tree/outgoing/clock-v2

Between version 1 and version 2:
  - Previously, this driver also included reset functionality.  That
    is now in a separate reset (only) driver, which will be sent for
    review separately
  - Dropped the "config syscon" devicetree binding
  - Reworded the clock binding description to focus on hardware only
  - Clock IDs are now consecutive (no more commented-out values)
  - Get the definition of of_device_id from <linux/device_id/of.h>
    rather than <linux/platform_device.h>
  - Dropped a comma that followed a ternminating empty array entry
  - Config option COMMON_CLK_TC9564 now selects MFD_SYSCON
  - Clarified in config help text that the reset and stmmac drivers
    are the "others" that use the config syscon
  - Moved the clock devicetree node to be a peer (rather than a child) of
    the syscon node.

Version 1 is available here:
  https://lore.kernel.org/lkml/20260918165234.687224-1-elder@riscstar.com/

Alex Elder (3):
  dt-bindings: clock: introduce toshiba,tc9564-clock.yaml
  clk: toshiba: introduce a TC9564 SoC clock driver
  arm64: dts: qcom: qcs6490-rb3gen2: add the clock controller

 .../bindings/clock/toshiba,tc9564-clock.yaml  |  54 ++++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  16 +-
 drivers/clk/Kconfig                           |  12 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tc9564.c                      | 262 ++++++++++++++++++
 include/dt-bindings/clock/toshiba,tc9564.h    |  34 +++
 7 files changed, 386 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 drivers/clk/clk-tc9564.c
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h


base-commit: e8e67c48ac5cd9b0e7ba4ba2cef9decfa7327833
-- 
2.53.0

