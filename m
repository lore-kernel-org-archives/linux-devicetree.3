Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C88156F45
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 10:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296291; cv=none; b=tw0TRnQoXaQ0Sy9bs7RLJbzP5PBYyEYG28WuN8DD+1eftNCROWZ11lI3kJXk3hoNZuSJITrw5PkiZE97agabFCmVfl2bB9AiiVqr+oZ+w0RLvHXX9MyGpWIhiJMbtZYecGTG9eLvnOXwDuPiVmRwZgORf/wOZqsp3pbBe9PKaX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296291; c=relaxed/simple;
	bh=IWbCtGVDZuS6pPkrlxlzSjNW94v9BM6YmwNtUGFV2hs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=glD0NRrXYcKAPZTYXCE0wAduyTxf1O6rcx11ucx6Y31op5nbFVQ3aQcsEhtS7Okcs0VcidGHbtMbpuOO6CGQs060esCnlravLbDdFb9jY2doF8fEgBtxpPfEEpWFuQ+WH2cJ4RZhGvrVFesb6Jhtv1yZZWwk/eUrnbRDrxAuWF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9wqMxI9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9wqMxI9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0691F000E9;
	Wed, 24 Jun 2026 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782296290;
	bh=IWbCtGVDZuS6pPkrlxlzSjNW94v9BM6YmwNtUGFV2hs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E9wqMxI9T6vgPuvDd1T+WVEWN16asLbMiS7o8tuM69dzJH/5mk6+Pxqxn0YmT3Uqj
	 EGj77qF6xU7F7AY8boBeNbmbLW173w9/PjzJSd5/yISvwsrpGaBgC0nIa/Iy96bMjl
	 SBx4Ie0xrVZFwSj8dbOrpXbZKBx4pxqfp/r6aP7uNel3/6h37qSAikGtp4QLcnBbdq
	 QcyjLtGmJ7HuoDj5Q/0gnC3ZSdZf8OS4ipo8tbZfpWBFtY1w8zEy6tAMH+Jj4JKyTT
	 25I0bY7n+7MhJ8xE3BKA615OebJJiYxUaMs6twKjjfJu0ewE4CUXVYWTkBflwK8iMG
	 e49QG/6jzS8aQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add label properties to
 CoreSight devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260624-add-label-node-for-glymur-v1-1-87576107b999@oss.qualcomm.com>
References: <20260624-add-label-node-for-glymur-v1-1-87576107b999@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 10:18:09 +0000
Message-Id: <20260624101809.CA0691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message incorrectly references the 'hamoa' device tre=
e instead of 'glymur'.
--

commit 71aa487b99d4969110406291654e33f858011262
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: glymur: Add label properties to CoreSight devices

This commit adds label properties to TPDM and CTI nodes to provide
human-readable identifiers for each CoreSight device.

> Add label properties to TPDM and CTI nodes in the hamoa device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.

[Severity: Medium]
This isn't a bug, but the commit message explicitly states it is modifying
the "hamoa" device tree, while the patch subject and the actual modified
file (arch/arm64/boot/dts/qcom/glymur.dtsi) target "glymur". Could this
reference to "hamoa" be a copy-paste error from a similar patch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624-add-label-=
node-for-glymur-v1-1-87576107b999@oss.qualcomm.com?part=3D1
