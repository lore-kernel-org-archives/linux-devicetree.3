Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01C72DFA3A
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 21:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783287462; cv=none; b=rsGivbOfqVEIHufeI4oYUr1OnMjfAL3XdOsQ4afKTcSlaLTh8gaQ33JSiM9m3tEAgWZ/xsVenQA9Cb/+dZxsqa3K2aOHBbMK6BfGEbusGdFVVkd7X5MgO40GtK0PcDIjMNPgi7ZDyafm6VWTCH7BkQ/YSmzJB1YRUBYcL2eYab4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783287462; c=relaxed/simple;
	bh=igQyiJtGhKUi7hNnr0lNeoVcRSQz4YGkDdDqAW+Zo4M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L8neByVOkjRQS6Zckg++ZjD5ZaY7OTZK5uFGu6BeWGOJxNAg2ena7O3ov9UhoyWtTu2oRladVwwTFN41jyUZLYJvxXe+YxR3aLxcdxt1FF9WdQJDkyuetxwTvc8+qPTkjU9I+0j2d+V7VhSf57iA1SxcEwJFRzlLwJL4Z6GjNas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOzzwJ5I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOzzwJ5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334241F000E9;
	Sun,  5 Jul 2026 21:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783287461;
	bh=igQyiJtGhKUi7hNnr0lNeoVcRSQz4YGkDdDqAW+Zo4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JOzzwJ5IbEdKaH+NraZtMrJ+AkQaOQVJtpDHkYcrpZakwk/Fl/e3BnMXP9h9EVJax
	 T1+we7kqUHo8/9O8UM4pALfcCR0Xj7a55KTOKXHRzRmKfh3Cq5gQNHIa1so5gpiRMd
	 qdKCPyonWh1NfsTsnYgxSQQCGxCxaFF5K/wQGSpSAz1cLiQFzgCMihkHxBJ8rVTRk8
	 aSfnXlX8C8vEh/lL3Nf4tJ0sHrfZwTEBiYS/I+0PlFFGAvL+EFUcinP0O6gIVlHteh
	 8p5UWuL3ovxf7DaIrXi5i6fQRqFTjVq/A9Hb3b70v8XnUngOpMSICyuoNzeD8C8iIk
	 FflsDJVbCIkeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] [DNI] arm64: dts: renesas: salvator: Add overlay
 for Dell P1911 VGA display
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260705213542.28987-5-laurent.pinchart+renesas@ideasonboard.com>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260705213542.28987-5-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 21:37:40 +0000
Message-Id: <20260705213741.334241F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch is explicitly marked as test-only and should not be me=
rged.
--

commit ec00db7021fbc2f550a150a0512dfc7596a53df2
Author: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

arm64: dts: renesas: salvator: Add overlay for Dell P1911 VGA display

This patch adds an overlay to hardcode the EDID of a Dell P1911 VGA display
connector to the VGA port of the Salvator board.=20

> Add an overlay that hardcodes the EDID of the Dell P1911 VGA display
> connector to the VGA port of the Salvator board. This is meant to test
> EDID hardcoding and should not be merged upstream.

[Severity: Medium]
The commit message explicitly states this is meant to test EDID hardcoding=
=20
and should not be merged upstream.

Was this patch accidentally included in this series, or is it intended to be
dropped by the maintainer before final merging?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705213542.2898=
7-1-laurent.pinchart+renesas@ideasonboard.com?part=3D4
