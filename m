Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0851D45E8
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782711361; cv=none; b=t2bU9kkce3bCBtHs7H+rK9+Ux9820srZ89LVtFO2x63SLj+l1RQ0+Ml24DwYQueaf5lCYvGS68ZLVz7Sp22y2hPjhFTluCc7koV7qlJjPqCVv2hvC4QTllObO1DmWNdx0AigirPPkK9NPHe/SQGEZNVxDRgFEH1piKD/f3+PECM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782711361; c=relaxed/simple;
	bh=l9dWlbCeJC/7EwbHdFhSSobCP7BjKYpgnJ7rWN/KW50=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G+g7nZst7rP+O0nc0ULOxPEk1y7LmkcvYYKpOFCz9maA0XSRG3JIE4PqGOSpYNdXqOalulXBC6UHdJFaBfLZftKuPAxAJKiS6GJI94Pa+oi9vG1a+8zac0r3bJTeg0lzReViNstelPX9FVCgHBAV9Nuenoyn+NQrHdLRREcptCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mubOly6s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mubOly6s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336811F000E9;
	Mon, 29 Jun 2026 05:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782711360;
	bh=l9dWlbCeJC/7EwbHdFhSSobCP7BjKYpgnJ7rWN/KW50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mubOly6s2y1gpr9i3bJRWy9/+i7ntvC1Y5EsMqYHOBX9XBEDCAHqXNFNAT5QNBLOM
	 3qMcARyx2g8gZQ/1P2ccXS+1/pP3tix/sSjAt+6V6sZE8ewUuvpAi3UdtSSieAJtz5
	 ORZ8IJtX5qmi+j2BScOsIOWh24ilgX34T3hKahSmaUxQBi0hH+g2KjJhDG7s5dkBCG
	 kVk8FSVdT3QDoTOjBTDv8jTCwVK/OYlfRLSi8rE86xgZ9JvG0UNQxi9UfJHxQDNDCD
	 6+oLidHSmByJes9T2zEhBMkc6+V+AuCHYyK/yaKCeT2rm3aOBG0B6tRinLvd6IXbVZ
	 LLgcTGx58l7bQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: display: verisilicon,dc: make resets
 non-optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260629053017.4050868-1-zhengxingda@iscas.ac.cn>
References: <20260629053017.4050868-1-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 05:35:33 +0000
Message-Id: <20260629053600.336811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message incorrectly states that the controller requires =
'two reset lines', while the actual binding schema and examples define thre=
e reset lines ('core', 'axi', 'ahb').
--

commit 11712ddd9a2861c41656c6eb9cdbd525c93e3665
Author: Icenowy Zheng <zhengxingda@iscas.ac.cn>

dt-bindings: display: verisilicon, dc: make resets non-optional

This commit makes the resets and reset-names properties mandatory for the
DC8200 controller variant. The commit message notes that the in-tree
device tree already populates these lines and the driver handles them
gracefully if missing in other variants.

> The only variant supported by the binding now, the DC8200 controller on
> T-Head TH1520, requires two reset lines.

[Severity: Low]
Is the description of "two reset lines" accurate here?=20

Looking at the existing schema in verisilicon,dc.yaml under the resets
property, it defines three reset items (DC Core reset, DMA AXI bus reset,
and Configuration AHB bus reset). Should the commit message mention three
resets instead of two?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629053017.4050=
868-1-zhengxingda@iscas.ac.cn?part=3D1
