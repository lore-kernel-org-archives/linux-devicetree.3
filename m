Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870364;
	b=Ix0xW27P2OeKfG+0+45xQpDE0/H7jeVfTxmjUx4vGFb08u1+vx9WrhshjSWqJB6xeTrl
	 94z6qGd4Co2L7z2c2SCrv5HSCRsjSVwkrOanbfe467m9swJzV5/fGgr4p3D8dg6cmM7rc
	 kHhoCHchuN3fuXw72P73kNxBxKM9CQbWErwq5OL7KTA5XjTi1MiKY/w7c4mMSJKf0BhBT
	 zfxoEwf9+rZQ6YMZhjB9n4HP+9ndZgz3Gzv1yBk04YgFQWkZPhZbLj5dD0y56bJchaUGs
	 nvB+b5NyOsjFtKi3ELObhdiOhAEYFGMYkZCMQb1/NqV3rBOJqCn+c5YbKDWzdI2McRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870364;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Rxr7OTQcA4EUHlDwXdExhumTReS9XtWftQ6u/ViBj68=;
	b=rHp7KvNI/BQEun8PXvUYnbQuPlvOHJqvLNJpz5HY84XPMy5+Wt/xWOyuH9q4y7vqTXL8
	 HA18qLJ22z07SHKR26kGrwoPs4mkipmco5lHRfze00MFgkyCk2G/zAXkQj41c81YhfoI3
	 2tPf0x59ly6bekJ/hLsNITqi8vlkCdUDUgteBrUjFOtYyQsa7RatwsgO7GXPRF+umtM1Z
	 z620eWEOJuOEduBY+oci17Ev1txWu+SOCplS20ddnu8PumxdT9BGIS1odswEv+x44xicm
	 s6pbL9EqSXtQlYIgyYi/v3Y/NMBQuOP8o0pZinMql7pDh+AQwdbmo/aFBASHtxmR3Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oMA2l/Rz";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE0B606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMA2l/Rz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2981F000C5;
	Mon, 16 Nov 2026 23:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794870363;
	bh=Rxr7OTQcA4EUHlDwXdExhumTReS9XtWftQ6u/ViBj68=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oMA2l/RzoL/RWzXvluOXxldYUJlYcVDrPJUIbmxU/AJD8AIilFuQyOgHtRUpxKPoA
	 B3yuz3b7TWeSHoadT9k4kT5WzjC2+BP9sALpgAL9MWCnNtyX4xRSq/FYLq47Y8aZuG
	 gsklc0RkQxMGqZr81YgJXEVWEDdBpY9czx02M3QT7e7gqup4CeW+X/HN91sATpRsG2
	 tqqkGHyeS3j1DU13rJGtq9kaxkt+FqMzi407m7F9452qM4qMq7fiEX4WS3UMTiirIn
	 y2VNnUJzlZHXfe3QTSqn1sH2Zrq2ZkGsvBy1+5Cy/HSaUqA0HitpiUURh377I9A40T
	 lCtY2wkzD1RyA==
Message-ID: <sashiko-outbox-217847@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/12] arm64: dts: qcom: sm6350-lena: Enable PM7250B
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-pdx213-upstream-3-v5-7-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-7-7318a19806eb@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 23:06:03 +0000
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
- [High] arm64: dts: qcom: Signed-off-by trailer uses handle instead of
  real name
--

commit bce0793330bff87c0fe7378b4881d3cb7b3eea46
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Enable PM7250B
>
> Enable PM7250B and some components on it for the Xperia 10 III.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
Documentation/process/submitting-patches.rst requires a real human name in
the Author header and Signed-off-by trailer rather than a handle or
pseudonym ("erebion").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pdx213-ups=
tream-3-v5-0-7318a19806eb@erebion.eu?part=3D7
