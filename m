Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1663DB31B
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781083111; cv=none; b=hKe51VBGmhVFRCeQWm068wELmoUDIpcSJvh0ov83gr0qRstP8J7yl/GiM1CllCfsAxDpR66Za9pxqVSroEKQ+5i7/bWVnQSr2oAmtb0JLKVkn3+zC6Yf7S5/JLiX4o5iAAAg7AzOGVSB136DTYx+ZwclHFDQIcK/SnXN3OR0+xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781083111; c=relaxed/simple;
	bh=fj5/imBeGlxCMfzWuU3hJd17ZZDy39YfrvaEnktXuOU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=e8HizzBk4c+QHqSJo4STbN3LoTrT+gp9XGu18gyywVGp++XsGw9ZZKdwc6BZc3cNBqKwyzaiAzRaHQBhpXZXd4r+0mJWs8x+ZalHu3ij28+bSRJiaZGq1DB1tiX/U3MCW4Wa3Fh6hrUiLaAqSvpQjrn3z/QYKp05vrOxF0HtT9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=cG5a62YZ; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="cG5a62YZ"
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1781083105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ug7T5MCyWOrBz7+vEzcRwNA8uq82DdVzduyuYbrljug=;
	b=cG5a62YZ/AkUIwamW+e2RmoL/AJIB9UDW5YcxkiElVFBeBc8yyX0u15UgZgPl6GYb1gq/B
	duoL1i1F3AphaV2L68ndc90K4z1ovFJZDbr5WEBf4MYGtuNcwehEDzQHXlSBEp6vLqHhSm
	FssBXKsCLQle0f3fb5n6QW54TmVxaPeUkuaKDOpG3h11kZocmpl5yeP6dR8smVn+zmrnlh
	XWeodjwwjcJDtBaxE4AznxNsYkxpz9h3X3yRXwWgoAjKwBjmnMSlvaJssOPzYKDQXTH0Cx
	ShZWHzhmRjCemulQUUZaAaZd/lK9YORE9Dydo2Tl+rzgfXGPWy02YWfAlV6vXg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 11:18:22 +0200
Message-Id: <DJ599LMGW2UX.12U9YA1MOW7O0@cknow-tech.com>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Marcin Juszkiewicz"
 <marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH 0/2] Cleanup and fix for NanoPC-T6 Plus
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Diederik de Haas" <diederik@cknow-tech.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20260610081400.758687-1-diederik@cknow-tech.com>
In-Reply-To: <20260610081400.758687-1-diederik@cknow-tech.com>
X-Migadu-Flow: FLOW_OUT

On Wed Jun 10, 2026 at 10:14 AM CEST, Diederik de Haas wrote:
> Several nodes were enabled/configured when support for the NanoPC-T6 Plus=
 was

s/Plus/LTS/ in Subject and here ...=20

Still working on a submission for the NanoPC-T6 Plus ;-)

Cheers,
  Diederik

> added, but later those same nodes got enabled/configured in the dtsi file=
,
> making those in the dts file superfluous, so remove them.
>
> The MTT USB 2.0 Hub is connected to USB20 HOST1, so the phy-supply belong=
s to
> u2phy3_host, not u2phy2_host as that is for USB20 HOST0.
>
> Diederik de Haas (2):
>   arm64: dts: rockchip: Drop duplicate USB nodes on NanoPC-T6 LTS
>   arm64: dts: rockchip: Fix USB hub phy-supply config for NanoPC-T6 LTS
>
>  .../dts/rockchip/rk3588-nanopc-t6-lts.dts     | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)

