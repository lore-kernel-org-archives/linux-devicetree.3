Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533402;
	b=wYIpHdfSDy0YD65fpVmhxcji1AZVhxMyyt9cRvSy5GfHaS8v9Kbrs4dWzLLq+hYsdybh
	 qXavVTvK/fJGifd+5sq44OI9m3CzzHac/F10AvWAYEPECcSW6Kb6mcjb32Rs245WdqkgF
	 bI/SzOa6nHOfIEpVqGTwH33BLpFjWTwYdFmLe1FtB2rE0lWwi5UyaXaGxdrB4cYQrwil6
	 zVLDSoJY/W5TF+0Hf9J6ShZ71xpMcmLOytpzqhzgUyBRl77ErPLRg/WknYITZiuJe6MUp
	 wRd6RxlKtZkkyySqfta3jLSYU5XQMhmRrXDqEVssjuOe8SW0U93IHFK+CcWtoJEN7eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533402;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZdTNKOlK94X99BHyLBr2YYN+gi8mOa/+sTQWlAzR57E=;
	b=h2vs8ZE52YILbGSRb9TRFFBEVsKdmsq8PP2n4Po9jJYMj31vSPfbP3T6d9r5b+fiC5Ff
	 s35z6QxG7QCsCG7m5wxFRHZi414oC3CsDje7Trd184l8E2k5xPIT7L40Lb9sEY2iQ/cnU
	 +glydyv6vXBtUyx3Q9AAsDknmwrQn7daCTdQWDz1GuaBRFD0MN3HMwmDr0Q9eoYLoNbKc
	 XKmRWg15jmivEEJfwGcz7+6ZDu5HrHfSLfzU9g+HbjgJN+A36LoSOobQ+S0o7leiDXWH4
	 O/f7l56wTsnLwUxDA2CSgv8u9DDZhBN2mZVM9PCqTzPty0JIAjkyLbhgpxOA6+lB4yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="T/Z9sSNl";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42316606A32D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T/Z9sSNl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44341F000C4;
	Fri, 13 Nov 2026 01:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794533402;
	bh=ZdTNKOlK94X99BHyLBr2YYN+gi8mOa/+sTQWlAzR57E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T/Z9sSNlmvEYWSDahaLENkexz2Umm9fTs4JEpoldw5n9UJ2B+o97L+P5iKDTklkkr
	 gB13gu+QsxsiHNDCSOn9fmxh3ojPwJsGO487fLgZj30s6urNxrPnYxmaozS8ObRGk9
	 ydkG+gzS+wDTWCXPyNnVujmWP9zbvkz/xN7oiLuqV9riVOJ4tDqCv2IMOM74myrNWO
	 IVfwEYI2JZBCLhD4KzLeKhK708ph/BlIpojdZZLBP/3+mJWFH5EDZRv1HuQbIkSo8l
	 4vkNwCdPZiVvY2oPi4y1FZ2Kkb4fRmZbg7R8zYDWIWlbhhHf8u1PgunZt6KN/F5TMq
	 ssE02x9+zaKKQ==
Message-ID: <sashiko-outbox-212057@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/12] arm64: dts: qcom: sm6350-lena: Add
 qcom,rmtfs-mem node
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-pdx213-upstream-3-v4-3-4b01c50a821c@erebion.eu>
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
 <20261113-pdx213-upstream-3-v4-3-4b01c50a821c@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 01:30:01 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: sm6350-lena: Signed-off-by uses handle
  instead of real name
--

commit a9ddce3144fad1d53145bd8e52ebb61fbdf78099
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Add qcom,rmtfs-mem node
>
> Adds the qcom,rmtfs-mem node required for the modem
>
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
The Author header and Signed-off-by trailer use the handle "erebion"
instead of a real name.  Under Documentation/process/submitting-patches.rst,
the Developer's Certificate of Origin requires a known real name rather
than a pseudonym or handle.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-pdx213-ups=
tream-3-v4-0-4b01c50a821c@erebion.eu?part=3D3
