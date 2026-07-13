Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BA935CB66
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974990; cv=none; b=c+LePOploV8tXJXAIB/+WWAmY+RRrHSDLKPDgOXRsfh8AuJioriwH1YRjgcKffKMjUOjjnYNQJ7NYNpJB7weSkRGo5QcQrhdp+msw4FqxUGgyD02hHEyr9qM9ykR2qseJyrrVtl2eA6j095wPuszDnnTxidxqLEF4P/5zmkQoIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974990; c=relaxed/simple;
	bh=Looy1r6GKoW1DxV5pIFDRM9vTObHONLPTwxNJzbVGwU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UeY0VMnPNRi6ZysD4CFlCYI8vh25GqLMlGzkEFAkc+JAF2sWKPqadRtZXLexidbwNL+oyMaentRXYIlQoU9f9Rgy1Rlfb+GRVXIlbOs5F5grzL8dtd2grSCjU7fveP5Xx4J9gsoHw1YRdRowxqOzJCmmVhXyBQ4wgqkyeHk/ucI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlDdZOGe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlDdZOGe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517DC1F000E9;
	Mon, 13 Jul 2026 20:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783974989;
	bh=Looy1r6GKoW1DxV5pIFDRM9vTObHONLPTwxNJzbVGwU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UlDdZOGeP003Ge5A9NDUTEXxVyyQMoN/V8cQRYFcsmogMnJes7LB0tqDZZJ8QbPKq
	 iKzDJgJlIJLluMJHCrshR1h/IcjxWDcThaZ6IabSlcmlFQ62Ls5PFdx85otNHGuEOs
	 TqV3Its/qRiuMxJ6WYF+c0HwRwn4/xc3Tu5rRWHUkbLv+xmO53vhgMp2QXMM0qMJTf
	 xAhLVUhKmWD8iw5l5rET0wGWpj8dYQs2pUEUXItuLRIXlCiMcbVp8JzSHT4lUdvqmp
	 6ytInEw+58trj6wQ/VctSHP+RXy4QOo2nbhhHeS4EgNyqZe/1xeWch3yCHKZsi9duL
	 kYdzma5retHRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/12] arm64: dts: rockchip: rk3588s-nanopi-r6: add
 gmac1 add phy-supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joachim Eastwood" <joachim.eastwood@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713-nanopi-m6-v3-8-227567ffc5dc@gmail.com>
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
 <20260713-nanopi-m6-v3-8-227567ffc5dc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 20:36:28 +0000
Message-Id: <20260713203629.517DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Typo in the commit message: 'is power from' instead of 'is powered =
from'.
--

--- Patch [8]: [PATCH v3 08/12] arm64: dts: rockchip: rk3588s-nanopi-r6: ad=
d gmac1 add phy-supply ---
commit ab3003db2e086a8af07b8d7a91353a3b0f880f80
Author: Joachim Eastwood <joachim.eastwood@gmail.com>

arm64: dts: rockchip: rk3588s-nanopi-r6: add gmac1 add phy-supply

This commit adds the phy-supply property to the gmac1 node for the
rk3588s-nanopi-r6 device tree, linking it to the VCC_3V3_S3 power rail.

> The RTL8211F Ethernet phy is power from the VCC_3V3_S3 rail.

[Severity: Low]
This isn't a bug, but there is a typo here. It should say "is powered from"
instead of "is power from".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-nanopi-m6-=
v3-0-227567ffc5dc@gmail.com?part=3D8
