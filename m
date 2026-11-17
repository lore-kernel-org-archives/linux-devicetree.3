Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945182;
	b=gn0jwIbSz7nFHyy64LMneY78h8LEIED9wTjaty0TPBt+oSs+8YkmFNrP8HGj8JVjrG/4
	 uIELFSUYYxnbnDusIFbvrWCi6LYXT5EXb7jvLoujUgiSyFQuXql7rtRanxC1wR6t1E2AK
	 jksL3APxv56FClIOyVwpxykNIK1K7mVLZ11kp+V4zRanF74TKbDV4L/F65uhZN3Od9yIZ
	 mECS6TgQLkvTnVD/YXgIkbpUtFymPOl8egZiifyrNCt3uw27M9feY3HxOKDsG+IATM255
	 /I5Pxf/9fjy+/mq10sODKkuHCYV4cV0smO4Bhn9vv35LlaVOpY8Z0NPvIOM3nNzUapw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945182;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=D2bnixEpfTEsibBAUfFMWemVQ+XXhcjNPKR3fGbEq7s=;
	b=ersJVEv1UozEQLxfvCazqD3l4VSdLc6VF8vAAOS3jEIdpdIYdLYKW6isgst4o8G4U9ne
	 DsCv6vgTAlKwu8MIC8accOqsM3L2I7ufN0N/1VBHpWqqWOprbvW0ZEaD8JdEG4Q1NkVGi
	 NxcVu37GfhXga8AHN2oSpyUx3UymclhAfZLvKjxFyMAvLb/Z+OKHRUirzRsA9+cqZv7q7
	 vFO8/XrJvy7onzSYp1SCBZOiyIQPqNgWVeVYtgVKUrZ/ExjIyjKBRe4V8LQ2vMvCc9OWh
	 eUopB1HOOAAVyverIsS4UIV64AII2g7J7JTUK6LDl7sqLA3DUV3lvbQNhrsiPHey+iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ec0nRP7Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D3B606A32C;
	Tue, 17 Nov 2026 19:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ec0nRP7Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6CC1F000C7;
	Tue, 17 Nov 2026 19:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945181;
	bh=D2bnixEpfTEsibBAUfFMWemVQ+XXhcjNPKR3fGbEq7s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ec0nRP7Y17xsAqSB+j7af1Co0iQtxNQh8yESb2RMLElFyADqtj82aKIptZDiUsiWz
	 EYtWld4sU6DWwj2uRtugSJv0oKNZtX8BBcIgZRMKHylNWMXHMhcJBpzQZWT0wtg48V
	 axPoqhwhNM6jNSijIKRxw2GeXQR8xjRIibqNBt04m6EeMuESxAKefNPJeeEr4Jb67Q
	 CuQBO+Hiu+bNEM4qi82gVZC/JvD/llvyZQ+ft5KNzEARj8fH+yBbAVwuz04CetinmP
	 mP3g95gvfehqNsWHG6JF0XJOAHgNWG4uO5PNvHA693PZTggPtfR08tCHbf7I5OiytN
	 izrvHjItHOhig==
Subject: Re: [PATCH net-next v11 05/14] net: ethernet: microchip: lan865x:
 Depends on PTP_1588_CLOCK_OPTIONAL
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
Date: Tue, 17 Nov 2026 19:53:00 +0000
Message-ID: <179494518028.3136.14363053489966297162@kernel.org>
In-Reply-To: <20261113-s2500-mac-phy-support-v11-5-7a186141952c@onsemi.com>
References: <20261113-s2500-mac-phy-support-v11-5-7a186141952c@onsemi.com>
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

- [Low] Rejected as a false positive.

--

net: ethernet: microchip: lan865x: Depends on PTP_1588_CLOCK_OPTIONAL

This patch adds a PTP_1588_CLOCK_OPTIONAL dependency to the LAN865X
Kconfig entry. It prepares for a later patch in the series that makes
OA_TC6 depend on PTP_1588_CLOCK_OPTIONAL. A select of OA_TC6 does not
pick up that dependency, so without this change LAN865X=y with
PTP_1588_CLOCK=m could fail to link on ptp_clock_register().

> diff --git a/drivers/net/ethernet/microchip/lan865x/Kconfig b/drivers/net/ethernet/microchip/lan865x/Kconfig
> index 7f2a4e7e1915f..342172cb8837d 100644
> --- a/drivers/net/ethernet/microchip/lan865x/Kconfig
> +++ b/drivers/net/ethernet/microchip/lan865x/Kconfig
> @@ -8,6 +8,7 @@ if NET_VENDOR_MICROCHIP
>  config LAN865X
>  	tristate "LAN865x support"
>  	depends on SPI
> +	depends on PTP_1588_CLOCK_OPTIONAL
>  	select OA_TC6
>  	help

I didn't find any regressions in this patch.

The next patch in the series adds the same dependency to ADIN1140, which
also selects OA_TC6. That happens before "net: ethernet: oa_tc6: Support
for hardware timestamp" adds the dependency to OA_TC6 itself, so no
commit in the series should hit the link failure.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-s2500-mac-phy-support-v11-0-7a186141952c%40onsemi.com
