Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85913B995F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076294; cv=none; b=QSJj3Ek/6J1dVhYT33J9rWtcDaqPONcZEGliN4BWzZmLqbBGycy7JJX+BhYMQKVW51nF7lc5u+Me5rU5qXQPW0jSqbbS6xNlz2IveKHyOnfqA31IQaz+x1s+My+6U9VX7z9saexLj9FHqECnipjp2+wRZkuYqqk+XX4HlSy8K/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076294; c=relaxed/simple;
	bh=EPq/03fdA7jHQZTI5Tv/jx3i5dZSK2Mbttbhsp2Ilcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RhrgkrLiGwiYX9qjNER3wEcW+kBwVmjdQE8pT/CuRsNggd0B/49tGhfqahNNLFe2oTrYTGURtl9Xhqb615ztbxoIxbkU5C8kTqBYtaHguk581lbYtn6DPrkRE/9pQz+jEmz4VUGCkb1/8ET9ENdEOZjcX4PDfJy20NlV9r7oaAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=CABNLYiG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="CABNLYiG"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so47858015e9.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792076291; x=1792681091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g79lxdI+JwJ9lYZtMApsuAitGX7WOKQsF0SW8/j4ox0=;
        b=CABNLYiGyurbiiCEnNXgBxHw9QeAZ6QsOCJwu9TzyAR9F2noH/QJ17g5SC/Fh0dS/S
         G8OYPItLZpFZ+DeCPaiIZ/AeJrErvtZkl8GspRuALlFgMhkkExzFSU+NRCsfyXQhVGTs
         vJKiruL6t5G0Jbd+Bkzp2SXYb9gusrlAY3LLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076291; x=1792681091;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g79lxdI+JwJ9lYZtMApsuAitGX7WOKQsF0SW8/j4ox0=;
        b=pHvfeBmqfMQRUp3bwwt1S/xeBUHyqomDwPkt5YLhw2XcFcvhwVE/hTrmENMry+c/w2
         umn2Ne6CE5WRXne0wLCDKXZkpGB/R2DstNApNUiKdBAjEa9w4orOPDT87woEM6V/bjhr
         AeSZS2QfH2cttUA91k1OOpkekk5MDx3QwAYYQVf4w7YO4hb2Cmj+4jSZv4QAv/wUEEbm
         GaTvq7B25GKvQIwRgbfgIJ8DbhjKUawuXqFsvBbDpOHmU/8O67kLPpyyO9mYkaTuSdHc
         OfAe3mH6BrKs3sCUHajN0NwuIon3VeEGRQc+argiKWfcqxSprMpylyOz31EhUnf4IFlb
         cl6g==
X-Gm-Message-State: AFq9FYIEnj+LAdvqEsDzQmuqDEP7/gsVHAJC3e2p7Z7TFxdq9v4j29RB
	699fFj7yEA3tTwvBaaM5GuwBYygaWccpIgbAU/TU+nPXXVlrBb7pj5XyXPm0qn79B3M=
X-Gm-Gg: AYBFou2TWIEKHUdKgy9JYmk/SqdufR0l6a1EM2aT/G6kg1Kmm8k6DKgdgyYz2zxWAwY
	iMCLE5JrM9EtUmcHnh8vomL8cp45RMK0ttbrkBtTYWWuqYT0aTovXaud4nPaO4r3xyk2WIvk0FW
	ka5HSF9rxpXcdfAYuQaHbVJRpk4lgzCa+U9grWHtm33sd4RZLievhtwEi/lwYU7ytNXmJDPEYg3
	fVF9vv2NY/gWrJF5nEFRmd2jHN89FkXCOCNW7SOhDIc2hJcF2qmiTKRK9fJxYIzo1zGXe3rbKRA
	oUIWjL0ue7XY+c1waGQF6vp1UE3mRCSWL1vDY7T6mqtvNH7Jj4XvpYmAT6GE8Dy0fNr77210+1T
	QjP1RQniK+k0DORoHkTn8UiIB7RO5VxgohV2IkfnDFgd2DDoBaORbwbowInKuc3k8laFTqhDE92
	SvzoyWyXT14g9YiWJ3LTeWRSb/21gEHycU0fTw4ZmZ6IEDTXoHaLClyg4m3uOaZtNni0W+hePMG
	QT+q3gq7rYIaRQ=
X-Received: by 2002:a05:600c:3e83:b0:4a1:6d35:779a with SMTP id 5b1f17b1804b1-4a18e446880mr356608145e9.3.1792076290783;
        Thu, 15 Oct 2026 07:58:10 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd97ed33sm88053985e9.5.2026.10.15.07.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:58:10 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v11 0/3] arm: dts: altera: add Draeger M48 CPU board
Date: Thu, 15 Oct 2026 17:58:00 +0300
Message-ID: <20261015145804.3632839-1-petko.manolov@konsulko.com>
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
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the SoCFPGA devicetree part.

in v11:

  - replace the ethphy compatible string;

and in v10:

  - add device_type back to the memory node;
  - move the compatible string under the phy node;

news for v9:

  - remove the name property from the memory node;
  - fix a typo in a comment;
  - attached phy-specific skew properties to dedicated mdio phy sub-node;
  - add Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

now in v8:

  - modified draeger,m48 to draeger,socfpga-48 because it is more consistent;
    with its other imx counterparts imx6q-m48 and imx6dl-m48;
  - dropped gpio3 and gpio4 bindings;

new in v7:

  - replaced module with board as this seems to be confusing to some;
  - add Acked-by: Conor Dooley <conor.dooley@microchip.com> tag;

Petko Manolov (3):
  dt-bindings: vendor-prefixes: add Draeger AG
  dt-bindings: arm: altera: add Draeger M48 dual-cpu board
  arm: dts: altera: add Draeger M48 CPU Module

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 101 ++++++++++++++++++
 4 files changed, 105 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

