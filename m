Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795561306;
	b=sIzGx5YYD0WSl+0uYWLGUgVuhkI9Gd8BQoGxAfJsq34DeCI5E7Di21BxQEj3lqTFG2Cy
	 w0DvxARh3zMs7DcUvaytoFqmdc1g044yhVC3wYA58U8t+ngKua3uCvBXitpJ7vnbKjmzk
	 xeKMUWeUy30KqWs5mJKVhsyttqSqmbA4j2VngNw9LJEwuIjvn5QR2I30Mb3AFrXECJvS9
	 O9Imqbe4ca2YN7C1Q/fWY/a4dap/3DUlzdLNHYuNba+hpptQAcySrPkmirLVHUwR6984S
	 yoyeqwAccN21n20JbRg0qVdLl2yYU5f5iHPzra+QcHm7v73GOnSHEiCC8WCjBlhlaQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561306;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=WwRGi9/gboonDby6o+AqgHp8QwWUxtuqcvbTxyROofo=;
	b=df+6Q4sM06gwcw8us0pjwD9Zh/DpSD4zpyFAAXrXu1/J31Sks6gBFvqjyYrqljZXb7na
	 SCnYhGqyw7QkbLIMzSaoHKnAoBtmnbC/Cm0/aRhPqWb6IuQtRumeguWRajKkcbfJHXH+7
	 pFk60xeBETxSSCWqCKKWJIOkDxCY3yESitH11+rKgB/LfnL3sAigNLGSISQSoPr+btKHk
	 SIXEZKPSnTZeoXgJHDxAagw2vASNQzXR6oDG0cyS7Z3kcqlLdK/+tOEz+lEHjjwzae3EV
	 4DquEPWIQa1SArbeN5XoPLFVXkwySbUrvexhWZq2C0VnavL34MHYz874OIF+72RpSGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YO2pQ4n/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6044E606A321;
	Tue, 24 Nov 2026 23:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YO2pQ4n/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795561305;
	b=P+LtR59+uSCrhgOVj0bqUNQ/kKauaJSnliIG7FyyPEebmFIySRg2+dWdd3QhPYQptKJb
	 PtdJL+Npxj6FQ0gRyBnBCUo2V299YcCn81D4CVjP9agLwehKzHSQuNwYbQYcLGfv49f2i
	 lqp57wpNx9/GbQ8OJdyaoSyRCyYW/+DqU0I+Yutk6mptTxo0GsYL5TippaWgVc60nLm6x
	 MaNoDi4+sUqi/x87HIF+XtX6R9vyFfYzNCpRcY5OnsxkAKcFaZiDb+PuehUH3BDpB5QRU
	 3DxqB7FA8SBUnnPu2QHCgewx1n7PNTJLgb6r9Ie2XEvu5gcTy5ggYnm/JjTiCSZ0wBQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795561305;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=WwRGi9/gboonDby6o+AqgHp8QwWUxtuqcvbTxyROofo=;
	b=KCDAvs4k2l2r+Q6cVDT09kMyYl70n8ADC36y94C5+MbmtpAevAvAO57X2TRKbyyvQBGp
	 f0QrpfpB0zfS9vbnMBmSk5mgObdUJpkPEB04g18lfga73f0SFwIfCnTfzej0utQh4ASlF
	 Aredbd/UCM+yJqQygHLbtZUcTsgULR/osWk1X+c2RrIGfHp1FsQdqwVN0JGw5KbVkpQtM
	 23JWvHs/bldnBGBiT1Rj1jNJlXygmDwi+E01X/B25J35PPcrnWwtdIzXTM326TLLxpiop
	 e5X7Gn0meY1T519nkg5kExI2DEe3Z+JIlpiVboBqssGR3dtRGw6i35fV/IxCf28G9Eg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1253B1F000E1;
	Tue, 24 Nov 2026 23:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795561305;
	bh=WwRGi9/gboonDby6o+AqgHp8QwWUxtuqcvbTxyROofo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=YO2pQ4n/zfmbIZS9Vx+2GwQDrlxpZw9l6p5wNlFNu4QhqRo2TLjcqg5nm3bd9k674
	 wmJzye1ajqpt+OBCRIEHD1QztMhty6+kAqhH5O3BGlDlalPp9lKHTNDW+wCfUXhdO6
	 9Ait6mp1YLMQY4OfY8NeTjqdjxdYq+mXFee7KdKXQLToLSVa3p+1QuBAk8OzhmfhBD
	 mDHwQF2WPKN2xqokDY4VnMUy5QV7SfpZ282A4b3NDnkj6LwhzcKE8Mtp0gFgsx7KUK
	 CBPZQQZi12mazgqYPOv8XW4AUIii8Nl5hJvsZHB9S2Aja+SSJfHdKm09Xh3/xBeoDv
	 INJX+6Oicy3SQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 691D14CC30;
	Tue, 24 Nov 2026 23:01:35 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Subject: [PATCH net-next 0/3] net: ipa: add Qualcomm SC8180X (IPA v4.1)
 support
Date: Wed, 25 Nov 2026 00:01:32 +0100
Message-Id: <20261125-qcom-ipa-sc8180x-v1-0-48a889acbe6b@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QrCMAwAf2Xk2cAaik5/RXzoskwj2M2mSmHs3
 +3c43HcLWCSVAwuzQJJvmo6xQru0AA/QrwL6lAZqKWjc+TxzdMLdQ5o3LmuLcjn0dMpCPmhh5r
 NSUYt/+UVomSMUjLcdmOf/imctyOs6w+7508EfgAAAA==
X-Change-ID: 20261124-qcom-ipa-sc8180x-c9f427ae24db
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795561294; l=1671;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=B0CIwbvN+2fYF0mDco/OQwdk/RBQil8KeHGz3LsDY8I=;
 b=d/sW/21nAhnGYf05i9driPQgnzDMyy2gs1OBsU6vDu3+5t812nTY/rv9PzsBMmM8kd1E17kDT
 0Ob3TPx0sGMCyoYZlJfzu8znlC4uDwzoSZp9ZC9dAdhZ+wI5jGbQuLh
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com

Add Devicetree binding documentation, IPA v4.1 register definitions, and
SC8180X configuration data for the Qualcomm IP Accelerator v4.1 present
on the SC8180X SoC.

Register layouts, resource group limits, and shared/IMEM regions were
cross-referenced against the downstream Qualcomm msm-4.14 poipu/sm8150
IPA v4.1 driver and SC8180X devicetree definitions. The corresponding
sc8180x.dtsi node will be submitted separately via the Qualcomm SoC
tree.

Tested end-to-end on Microsoft Surface Pro X SQ2 (SC8180X) with the
integrated Snapdragon X24 LTE modem over rmnet_ipa0 (QMAP / MAPv4).

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
Robert Ijtsma (3):
      dt-bindings: net: qcom,ipa: add qcom,sc8180x-ipa compatible
      net: ipa: add IPA v4.1 register definitions
      net: ipa: add SC8180X (IPA v4.1) configuration data

 .../devicetree/bindings/net/qcom,ipa.yaml          |   1 +
 drivers/net/ipa/Makefile                           |   4 +-
 drivers/net/ipa/data/ipa_data-v4.1.c               | 319 ++++++++++++++
 drivers/net/ipa/gsi_reg.c                          |   1 +
 drivers/net/ipa/ipa_data.h                         |   1 +
 drivers/net/ipa/ipa_main.c                         |   4 +
 drivers/net/ipa/ipa_reg.c                          |   2 +
 drivers/net/ipa/ipa_reg.h                          |   1 +
 drivers/net/ipa/reg/ipa_reg-v4.1.c                 | 475 +++++++++++++++++++++
 9 files changed, 806 insertions(+), 2 deletions(-)
---
base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
change-id: 20261124-qcom-ipa-sc8180x-c9f427ae24db

Best regards,
--  
Robert Ijtsma <robertijtsma@gmail.com>


