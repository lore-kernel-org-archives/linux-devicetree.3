Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945180;
	b=t3XQ8Twnb75h4g5RzE36CCl1UXgXZ5DAz4tqzRtlwkMUN2NzMlAPB2DsNLxJ13luvdW3
	 0+hzlBnjaCKDRSmO9RIVZ9UoSEuBnC/wwz5RkMrl/DKgkh3oX0lByTHCcVudI3CX2AiC/
	 yaa4BazbwzYE+ZV0JhZRHd0GQLvqZCJeJn3EimejpXDuoWzPKp0OITDekioD0/+lb8z9I
	 jfp+akOoWTDHL/zS16OQAb8oD7PQInV5EhQ/oo2QcQ/9qM5ykTXfss/h7yUtOjlsX//wC
	 iAOP9fzjbqKtE5Lf9ss9mfBHMY1GnQfR1KEj/sNIHF5Mox2S3zIfvT9xEoZ67Fyz9WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945180;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=I6ImuqJ1TBz34pmM904YumuDCbtIEcFDFISvSJC+gD8=;
	b=mjlrC5kuPRLrr0q8H5JDqqLO27h3IfA9XTyc3rGClaJuTQxFeylj63F3f/Ed9yHq/VEv
	 YYHqpDJr+d2artJI6hrTS98ANkE0frbuuNEp8Eogxc6uh/R4fWg5FAoE+RXb7cfimJ5WS
	 Lpch4+b2pjMKmq9nnXDX16wVpV9MRcSfrV3tvez+GGkcldHgnVps5AcdtCPSZv5Usgjsy
	 rtGoCT1wih/o18MhI/CQv+n3mMaEc1lqMdBbm/d+lnmegpXDTKaZK8kpjzhD8+i/sq4QJ
	 g2mKI+rKJRXgvT3c6BrBj5sUwC28mpLI/MU5Npm22TzuPDbffssR0xCEGTUvyW2UzIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FWZnLEpx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41232606A31C;
	Tue, 17 Nov 2026 19:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FWZnLEpx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA55E1F000C4;
	Tue, 17 Nov 2026 19:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945180;
	bh=I6ImuqJ1TBz34pmM904YumuDCbtIEcFDFISvSJC+gD8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FWZnLEpxdq5xWgp0cR0ZXCwbR8AboQwvrfKlf7eNOquJlPdww/RbV4AZsVaCYJoqD
	 XCOI+2PjsItypzRVY5Wg8GTyfN9vrVHv4EgJ3NUQAYx7gVLev0mvSd/eRQ0a8pw5NT
	 bge20me0fDcbpfNB4X9ekN/3dUThiAcZAyFRBoYZR8NCrvw2W55y1IQmosUqG71aBP
	 NwtMYCszF5PR2C1WDbc3+noA+6vDOw5/ALYah+ioRkc7LNBQrVOdzvBecicbqlttlU
	 6yOEzM3Bwm5yh8MG1Q+N7e+eAeA9a02t8/46OURB3PqfCl6niC0UDtBYfLKiV2Skk+
	 qVw4gd9VYs6Zw==
Subject: Re: [PATCH net-next v11 03/14] net: ethernet: oa_tc6: Move oa_tc6.c
 to its own directory
From: netdev-bot+sashiko@kernel.org
To: Selvamani.Rajagopal@onsemi.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 parthiban.veerasooran@microchip.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, richardcochran@gmail.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 edumazet@kernel.org, piergiorgio.beruto@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, jerry.ray@microchip.com, ciprian.regus@analog.com
Date: Tue, 17 Nov 2026 19:52:58 +0000
Message-ID: <179494517841.3136.8719060372434310357@kernel.org>
In-Reply-To: <20261113-s2500-mac-phy-support-v11-3-7a186141952c@onsemi.com>
References: <20261113-s2500-mac-phy-support-v11-3-7a186141952c@onsemi.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message for "net: ethernet: oa_tc6: Move oa_tc6.c to
  its own directory" ends with: "This patch series adds two files, one…

--

net: ethernet: oa_tc6: Move oa_tc6.c to its own directory

This commit moves drivers/net/ethernet/oa_tc6.c into a new
drivers/net/ethernet/oa_tc6/ directory and renames it to oa_tc6_main.c.
The module is still built as oa_tc6.ko. The OA_TC6 Kconfig entry moves
into its own Kconfig file, and the Makefile and MAINTAINERS entries are
updated to match.

> This patch series adds two files, one for hardware
> timestamp related functions and one for PTP related APIs.

[Severity: Low]
This isn't a bug, but should this paragraph be reworded?

This commit doesn't add either of those files. It only renames oa_tc6.c to
oa_tc6/oa_tc6_main.c and adds the new oa_tc6/Kconfig and oa_tc6/Makefile.

The hardware timestamp and PTP files (oa_tc6_tstamp.c and oa_tc6_ptp.c)
come in later patches of the series, such as "net: ethernet: oa_tc6:
Support for hardware timestamp".

Once this commit is in git history, "this patch series" no longer points
to anything. Could this text go in the cover letter instead? Another
option is a forward-looking line, for example "Subsequent patches will add
files for hardware timestamping and PTP support."

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-s2500-mac-phy-support-v11-0-7a186141952c%40onsemi.com
