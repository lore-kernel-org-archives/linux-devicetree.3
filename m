Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2187931195B;
	Wed, 10 Jun 2026 14:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781101312; cv=none; b=iVOY4I+Fo7tc1YBp/5xYls1Zw4YC4dLmehPCc1sWPnwQCd0dp8A6mHJsPliork0N5N48v5AwQJzTvmfwCIWsjSot1bcht3VknE6nlGQmvKS4/quwIuIwJB63VtV1T9rID7l6p6Lrc2NDo2b0zEme5i482o30fi+DgZMA918GhQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781101312; c=relaxed/simple;
	bh=UFDsM7h/vS4lawePqt/EzSEfCqp3t9iFegVYXXU8glg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JoA1Voc1iB2ByHo7ZIFk4u0yicyItQhq8SmRmDtN8a10nqD2rKtNzhrS07xQPkwwk97mkp8ajuC4tPgDrwJo+TIYBU86dVajfN1+8mNyq1rP4Ua3F+/tDLqLpiR1VPAKvKQaf5RHszm2UvYV1YwXRKdKglGakWkfWwKzeae/ldE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=pass smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=Aj31QnRv; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="Aj31QnRv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lB03SMCSdZOh5MT4mOL5rZAS5N33lA23CFfAIg10g6E=; b=Aj31QnRvEC5qRKqGy01pEzTR1d
	6lJnoU1BBn/cUVLWqhMzl/irMfHxMqt0vECKM59tPVCKf83A8InpNgE4hhSa8INB5SXxc3tSXj036
	Kw3OFIjf3vRlHEyU5WkZ4qXHg2ZonHtxgChheS2ryuGUnEgRrvbVjdP9FOuDeto5x11J6c2m9CoS4
	B82DYK6ktRVd4YASgJ5hWsD1fMkErvStsgXNKyN90vAFx8dq1k8zPB/xL/qC0619navMtahJzRHEx
	gQNo37C0j59EQtxnBOAyXBcnAcnWLD7JRlmrGmdreVTjHqt2SmcoRetvoOnnanV3S/En7Fv2/+sz0
	sWQR/ZEw==;
Received: from [81.57.40.39] (port=46646 helo=vscode.iliadbox.lan)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <hello@superkali.me>)
	id 1wXJSN-0000000Clj9-1kvN;
	Wed, 10 Jun 2026 15:58:59 +0200
From: Daniele Briguglio <hello@superkali.me>
Subject: [PATCH 0/3] arm64: dts: rockchip: Add Youyeetoo YY3588
Date: Wed, 10 Jun 2026 15:58:57 +0200
Message-Id: <20260610-yy3588-board-v1-0-4bb7176b6826@superkali.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKFtKWoC/yXMQQ5AMBBA0avIrDWpChpXEYsag7EoaRHSuLti+
 Rb/B/DkmDzUSQBHB3tebESWJoCTsSMJ7qNBSVXKMpPiuvJCa9EtxvWCEJXUWqGhCmKyOhr4/HZ
 N+9vv3Uy4vQ+47wdllenEcAAAAA==
X-Change-ID: 20260610-yy3588-board-ecc20882cae7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Daniele Briguglio <hello@superkali.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781099938; l=1051;
 i=hello@superkali.me; h=from:subject:message-id;
 bh=UFDsM7h/vS4lawePqt/EzSEfCqp3t9iFegVYXXU8glg=;
 b=ntTMfCkyCLQPBv8aM0vqS7qCTZVWodTg0TRd/q8rhqaYRsTQIE4bA4XWkzUoetzrYy2ExGGQ3
 x5CZG/v22XbAOOcLb7kFuACMcS/oSP4RDXCu4KLI6cwBIp3jMWXi1dr
X-Developer-Key: i=hello@superkali.me; a=ed25519;
 pk=5tynRWQdL93CDcapJ73FkcCRY2PeBOJOIAoIhRig53U=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 

This series adds support for the Youyeetoo YY3588, a single board
computer built around the Rockchip RK3588.

Both Ethernet ports, eMMC, SD card, USB, Type-C, HDMI output, WiFi on
the Mini PCIe slot, audio, the recovery key and the fan have been
tested on the board.

Board documentation: https://wiki.youyeetoo.com/YY3588

Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
Daniele Briguglio (3):
      dt-bindings: vendor-prefixes: Add youyeetoo
      dt-bindings: arm: rockchip: Add Youyeetoo YY3588
      arm64: dts: rockchip: Add Youyeetoo YY3588

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts  | 1190 ++++++++++++++++++++
 4 files changed, 1198 insertions(+)
---
base-commit: 8545eda00fdf3d7e17933ce0f706d005b1bad42d
change-id: 20260610-yy3588-board-ecc20882cae7

Best regards,
--  
Daniele Briguglio <hello@superkali.me>

