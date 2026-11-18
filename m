Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795028835;
	b=yz7Qr7qc+8w8ppdg7cqafY1OZDu8GEPdZLXs+ZvQBYwJUV19i4Ywzpvq00aG/ELHYq5U
	 hRMR8uT5B8ArSEHUAA5C4/ve5xIxbucnGxTkt1L7TF22ymVH8i62vdulgjjhbrhXgJEj1
	 D5ZTnpXluNwz1XJH5jKK3ykurH4A5h56tRFFKYq9KcW0J+nRSqtS3wcNdXz36gxZ62+ZM
	 Ds6GvSKioAOYEuxlBO6+tKR4Z+CyjLaJCVBd2ZGqBJwzj4Mih6kveKIP5ex6BvgH1CBR6
	 CFhsYXnNWYO+PFbeFmfQXeN18yvAoHYU6YUkoHTJzW6JBpNx877yg4pKv3MFVHRABSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028835;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=mvVGMoO1OBBnhazmdnyJzTqIAd8y3Ag3iZ+bUOROOVI=;
	b=TsAZgbYFncIxG9AgVjIhEgvMgl9XB2jflMrd+/y9VkoIQuS5TVK0ZibyQmYHLV1H5klH
	 Qyh43fdAClD5/PY3vdsIkrrRnEDk18R/ZnDL4lYCM/ttXKCHOyCKnBRDqX7tmEiaQQcXk
	 Xs84mdyo71X9AVQu5AWNMI7jCdJZXEEKBFh1YgUAs6oiBoDQZLIQtVdj1xHxMN7m1utf7
	 qwIQYPvwEIJSmlov0kJNdwPnmFq4RRYYsNO7aEFm2nXAXsJ+ZUe8gtpRm7V324jyaWuGH
	 simFIpvGBnGMF5XPs8EpgcqpyO0DRRwzur4+q4lm5GevLHi5CZYQR5b+dg/6CcOcDWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9VD9n2O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C541A60A2602;
	Wed, 18 Nov 2026 19:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9VD9n2O
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795028835;
	b=idCOpSgm+pQh++7UtR4jot+s4qYGjpsHu/56T5YaxHA8X0DCsgzvYzilktOWSklXckH+
	 iMUK+C5D48n5mbu4g/gP9SAnegjhG9SWpEKk6Jr5EQ54EKyAgf2EhGe2q3eqKZQnfMo/R
	 PcFrqLxtDW/ooMsOs/CERPFegIP+CV5t5/xbHUH2ykq9pmz7zBJfDeKeF5kg9QBPHFSFp
	 rwDre8mQAGOrpAQOKl04wQ+WZNeL22B5BhcsMqXRYWYrePrUjjcstM7RKh9eZuckaUKAU
	 SRuIfQkxuU9N33xJnSKxwHqNQJjhbPJe70ExGN5RyHYN74FkfuuTzegpI9il800qyJA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795028835;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=mvVGMoO1OBBnhazmdnyJzTqIAd8y3Ag3iZ+bUOROOVI=;
	b=u1OP4L9e25/8nYZ0MmKgpSSAolslfk/d0XIujcKfmcVjYim1RXRjT/q6WqZFvM4nFtkn
	 90lBIMqOePtvtVP4GjusXc0cXyPAR4W/GvYzVyASQReMzN0JmekzDxTKqtcSNTsitz+Kp
	 G6s6UxasVTq/KEs0IfaQfywNZeEg+s3CoOETnqbRlrEjPWd45z5iea1wNOZ/TDQoByivT
	 U8j889AOvZ6AEO5NMORVn2o2qZGfn0BFZKc+gNanLctGLc8imSr0UjU1RyxxF1aX7Yswl
	 2S7ojD9PVr8Qq++zt1sfSQ6WFik0SsnsVffRXYwtHQi3sOm5qVsYqqjDp3AgHuhJxQw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 124601F000C5;
	Wed, 18 Nov 2026 19:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795028835;
	bh=mvVGMoO1OBBnhazmdnyJzTqIAd8y3Ag3iZ+bUOROOVI=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=F9VD9n2OODi5qbYJucACYNEy06YZsZaGe7LkBCIYSBvifVvrad4wB9YJRTAhqFzDg
	 cDX+y7kA77G0QNyfL6prHWXr47C7bnncGCgt4V/YkbE2CUpI53dhGMoCaAbyhcLiqJ
	 UijZgL8sUlOBjSiS8+kvXOuRep3Jd7+mxg4T7Rzq4pcE31VeIyRTuOdqzPkToUz6c0
	 JKY18pyXyiI7uJ7lJfLOck+prT2eRooBDrxMjXX2e7rZr4E+2ayz0aE3wqBDIQWdHd
	 r/5PPhoC0FcozLZBUQtnvsxcEDflXG0fxNF+qNACVhCu9wpGKPcDKdw61I3xE27TTt
	 ID1qpEEuh+rsA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 656DB4AF42;
	Wed, 18 Nov 2026 19:07:14 +0000 (UTC)
From: =?utf-8?q?Alexandra_=C3=98stermark_via_B4_Relay?= <devnull+alex.cramt.gmail.com@kernel.org>
Subject: [PATCH 0/3] arm64: dts: socfpga: agilex5: add support for Terasic
 DE25-Nano
Date: Wed, 18 Nov 2026 20:07:12 +0100
Message-Id: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDXp1E9wFbGoGoxFSYtIpHdXL
 L/k5d3gyTF5aJIbHJ3sebURmCZgZm0nEjxEg5KqRMRKDKQKYbVdhcxHXWd9URJKiP3maOTre7X
 db3/0C5n9HUAID2zM3z9tAAAA
X-Change-ID: 20261118-de25-nano-04fa93b56e10
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Mahesh Rao <mahesh.rao@altera.com>, 
 Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>, 
 =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795028833; l=1507;
 i=alex.cramt@gmail.com; s=20261118; h=from:subject:message-id;
 bh=I2QEA8KTDnJXjo3wsvoSR95BaaAm1rnHP6QBDVZCnCQ=;
 b=fY89QoAyxTxKeMwb4ZIxvRr60vqML9S4ya0Ah54MitvFZdihnz9DWTRrs3vZhjDf9MhnDE7b4
 6scpMSeb0uVCvcHjHqyoaTxxB+HwGysEoK6TNLyco/oYvz5wbbgMxOG
X-Developer-Key: i=alex.cramt@gmail.com; a=ed25519;
 pk=vQBaXUvFG7cCIaWDKclPMjo3b4XfPEVkuPjaWCkYddc=
X-Endpoint-Received: by B4 Relay for alex.cramt@gmail.com/20261118 with
 auth_id=1561
X-Original-From: =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
Reply-To: alex.cramt@gmail.com

The Terasic DE25-Nano is an Agilex 5 SoC FPGA board. This adds its
binding and device tree, plus the service layer interrupt that the
Agilex 5 dtsi is missing (Stratix 10 and Agilex 7 already have it).

Altera's vendor tree (altera-fpga/linux-socfpga) carries a DE25-Nano
device tree too; this one is written against upstream's dtsi, so it uses
the SD6HC sdmmc node, and it only enables what has been tested on the
board.

Tested on the board on v7.4-rc2 carrying the same device tree (its
decompiled DTB matches this series' build on next-20261117 apart from
nodes added to the dtsi since): boot from the microSD slot, gigabit
Ethernet, USB, the HPS LED, and FPGA configuration through the
stratix10-soc FPGA manager. dt_binding_check, dtbs_check and
dt-check-style --mode=strict are clean.

---
Alexandra Østermark (3):
      arm64: dts: socfpga: agilex5: add the service layer interrupt
      dt-bindings: arm: altera: add Terasic DE25-Nano
      arm64: dts: socfpga: agilex5: add support for Terasic DE25-Nano

 Documentation/devicetree/bindings/arm/altera.yaml  |  1 +
 arch/arm64/boot/dts/altera/Makefile                |  1 +
 arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi    |  2 +
 .../boot/dts/altera/socfpga_agilex5_de25_nano.dts  | 91 ++++++++++++++++++++++
 4 files changed, 95 insertions(+)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-de25-nano-04fa93b56e10

Best regards,
--  
Alexandra Østermark <alex.cramt@gmail.com>


