Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5927A477E51
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 18:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275144; cv=none; b=ps2uiorXzXI4zMtiULYvtx/qRMHgMxQqf5MvYWbuQrnaviOc1+rlKSELU1pIv36NMpcFKjHD8x1917uMsFMfYzwD0c9xjnjO58yCXolg6MK+RrVC+iBhPih7lw48o+sqmoHzydmY+IgB/72Ucc9n/LscrZMakWPIo3O3gKmoYmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275144; c=relaxed/simple;
	bh=xl+6SGpN5r+JlU8uWnKJTgqgf7MWKOx0cJnxdrgT1hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aAZGXXlHP2cWVJapHhwNd1yvV/fd8Aus9kuDqjJVEo89ZM4xiziZ5eB/VAHF34xNFvfIbtaOM7YGQIKAdqkeK8QyQzDu7FOmMOm70Yg4rzE1qdMWerOEcafmlzqdcZNlwJHJ7c4XVUczBIp6mIS5Rc+tU0Gi6jDOUUV8rbn6LU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=eLazKvW4; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="eLazKvW4"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so101545f8f.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 11:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790275140; x=1790879940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1qvv+WBQk97TqMLFAiiMPDCR04SnZ5MGolPSxFRq8k=;
        b=eLazKvW4X4AGJ0zRmqcZpHg3kHDH8OTcoR8RxqjipORjmL10SyurP8R3hm5irtrrtZ
         T9+85d03A+x16SntkTlcZVdYZ+2hU9yPlIAhFZDbLyR7J8FxIXyzo3jUCB4B4geuzfJB
         ypC6lU6U8Wm7sogHFsNjTgm/ompz3YdjL9f8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790275140; x=1790879940;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T1qvv+WBQk97TqMLFAiiMPDCR04SnZ5MGolPSxFRq8k=;
        b=uKjzbY87FuOOrp5x5W3hBW1MLCJFBSxyqKC2lpqHrReL2aMp+/bZbRJnZH7k2AeHw2
         MWsz4DMEJtyx8mZQhTyLDm3+BOJ3HSkpV5Z7YP+lEK1mPkB0OkCy1bq0E0cRivFMfs8q
         jBxxxuqlHiAKE2ccavE6i4qaYnBiNyAVoUHzV6CspuKIYSPvo17J68eNrV22iR2hiM34
         pWK/IBUdCum7BKcLHd/0xAe88jAt4Yu8qxZFtAW3Q0HXRrrvkfQA5D8sZFaeXDavYgsc
         X9qZ7P6tuWY2ZIrIV2gNf48pZVv7OjswnKV6qHzzN40PvuOypkWxI7vGdaVgi3INdB5v
         g5ig==
X-Gm-Message-State: AFuF++kNMMozHNtNJf8hDn9JpCgqroj7zud0nSIjogOfXeEOE7XGl+ax
	3BLCP60/JiN+dviRBP7TmZ28XgdjBPWZg+qM01E/5ZrBG6pxmcF4Qejq/ofMFuz+QHc=
X-Gm-Gg: AYBFou1ruwwjoKthzLXBqsKZo+/CU3rj8SwSwLch7y8ImMkCiz3RcfXzFJu2Lyhx2WG
	cqoQdY2zPklyGSJHWfS0TLEIFpsG88ZgS9gdCDaw3rwnByGLyu7mKYG+u4Fw4j2cy9I24aUKk1t
	Jg1qDaP47f6bX+fMcyVL+bzMZSvSfFzkDiKZAtT7fXd/f+A/ozdHc/Ai4qgPjC+fvBjzV36S6ID
	YcdmMx75l8u2yeGrC0iLgoTDln4BcFhShg9QDspIAXeoXgT5WAzzkCSbkSp2+g/hGLdkUYRxhYE
	A133TP9elcDZrguIFNbDfRjAYwKi688CxU64WOZedPSiEyBM0wcG3a2TDqQOGikaBBE7zkPRUfP
	dZik+zVDVEyWTaTkZVnLFcNiuWxzCrW8V2pL30zGFajIsFy75VlABtLKxZOXv897i3+dCzY9Tye
	ulS//ya7qIr9WE9lW0pYEkXDXPOoEOBbqlNre6F0TqJHkg/R9DhRmqiJ7LsHXbF1rSBPoidCTay
	xKWMDGu1uwJJc8=
X-Received: by 2002:a05:6000:1861:b0:487:1f81:e4b8 with SMTP id ffacd0b85a97d-48871725513mr6281791f8f.20.1790275140361;
        Thu, 24 Sep 2026 11:39:00 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84205esm852642f8f.37.2026.09.24.11.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 11:38:59 -0700 (PDT)
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
Subject: [PATCH v2 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Thu, 24 Sep 2026 21:38:52 +0300
Message-ID: <20260924183855.1393302-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

new in v2:

  - add the tag from Conor Dooley <conor.dooley@microchip.com>;

  - it should be clarified that "draeger" vendor prefix is added in
    my previous Draeger M48 patch series;

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  23 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  23 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 369 ++++++++++++++++++
 .../boot/dts/nxp/imx/imx6qp-draeger-m48.dts   |  78 ++++
 6 files changed, 497 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts

-- 
2.47.3

