Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110902E737D
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 23:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783726591; cv=none; b=BM2a7bAVBeJks+AqZvjnpDNdqvz5p/Lca/Y0kgSmN8eS9N3u6Xza/X3us/qMgczSbxnimuT5XYJ/v0ERcQboEEf7brRAoAEAW93Xe6YJabhG395XMRD2rkdpY6fLJ2AMgEr4pmcZ6L5IfLM3roQztF+S/Xa9UeZRuy1KeQi8h0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783726591; c=relaxed/simple;
	bh=gEiRJ8B3+zfeolELCgH5xqR/7k/42egK9NyF9gPOUvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYZkxRQcJP25RMRuFnhBtd9GitdKev3aqHP4a8cpC1SADhxtWS9ut88e91bCNme6vbdBGSQetyhmJ0k5SFfIWT3kHgsnM/pm65awipPLtLNnUfO902Lc/ED0c5d8U6fslVmiCgwWB2cNJBz2jKBkNmCdfF4tBNg4N5/KWhnn/aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=OunZyqMa; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="OunZyqMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783726581;
 bh=qy6HHWYfsX3ILpTu5/JKatJn9FSxJBA142HGAJToDwE=;
 b=OunZyqMa+OVFcmsPci4sTyOENnYp7GzHwofED7FXSS7TxD51lDpjiFhxCwtXGD+IPIFJ2/HAH
 HfQRB0vPB3e5eID9v53y8OocfOl+GFaWlTXMToamoMl3htlWqS0dORqp7YFPBNzBdJKQn3m7V3u
 j4X9lJDYTg+ZSDGOkWcE5SOILJf4LEOCO8hASnR6ztH6rcO4j0UyjpgoB/ho6dO4Tza3E927qBJ
 cH8rkpxw9UvEMfFmOpl4GTA4Eib2Y3k2CZhR/pjrb+sulQ1dgAbWhENU0sUDvesoUzv1xaw8Axr
 Ejkygyi0mHHX3fRTknL1NQS2pKPTSUzcYeftN8x2rU+w==
X-Forward-Email-ID: 6a5181f476cf32b2f5f845e8
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <ce54c773-22cf-43d2-b831-1ea5355359ca@kwiboo.se>
Date: Sat, 11 Jul 2026 01:36:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] arm64: dts: rockchip: Add NanoPi M6 board
To: joachim.eastwood@gmail.com, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 diederik@cknow-tech.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Joachim,

On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
> This patch series add support for the NanoPi M6. This board is very
> similar to the NanoPi R6C and R6S boards which are already supported.
> 
> Main differences:
> * M.2 M-key slot with PCIe (Also present on R6C)
> * M.2 E-key slot with PCIe and USB (from hub)
> * 1 additional USB 2.0 port from an on-board USB hub
> * RT5616 audio CODEC
> 
> Patch 2 and 3 moves a bit code around. Please let me know if those two
> should be squashed together.
> Next few patches adds some missing bits the common nanopi dtsi file.
> While the final patch adds support for NanoPi M6. Support for M6 has
> been split into two files one dtsi and one dts file. This is to make
> it easier to add support to the new M6V2 board at a later stage.

In my personal opinion I think it would make more sense to sort
patches in following order:
- adding/fixing missing bits to the common nanopi-r6 dtsi
- extract M6/R6 common parts from nanopi-r6 dtsi to nanopi dtsi,
  nanopi-r6 dtsi includes the nanopi dtsi and no changes to dts files
- final parts that adds the M6 board

Should probably make it a little bit easier to cherry-pick and bisect.

Regards,
Jonas

> 
> All changes have been verified using the schematics for M6, R6C and R6S.
> Only M6 have been boot and runtime tested. Tester for R6x are welcome.
> 
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
> Changes in v2:
> - Organize DT such that adding support to NanoPi M6V2 later is easier
> - Use correct clk id for I2C mclk out as suggested by Diederik.
> - Add a couple of acks from Krzysztof Kozlowski.
> - Link to v1: https://patch.msgid.link/20260703-nanopi-m6-v1-0-8344a1559519@gmail.com
> 
> ---
> Joachim Eastwood (12):
>       dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6
>       arm64: dts: rockchip: refactor rk3588s-nanopi* to support M6
>       arm64: dts: rockchip: move NanoPi R6 code into common dtsi
>       arm64: dts: rockchip: rk3588s-nanopi: add missing sdmmc cd pinctrl
>       arm64: dts: rockchip: rk3588s-nanopi: remove pull up on rtc int pin
>       arm64: dts: rockchip: rk3588s-nanopi: add missing pcie rst pinctrl
>       arm64: dts: rockchip: rk3588s-nanopi: pcie2x1l2: add clkreq
>       arm64: dts: rockchip: rk3588s-nanopi: remove always-on from vdd_npu_s0 reg
>       arm64: dts: rockchip: rk3588s-nanopi: remove useless vcc_3v3_pcie20
>       arm64: dts: rockchip: rk3588s-nanopi: add gmac1 add phy-supply
>       arm64: dts: rockchip: rk3588s-nanopi: remove bogus vcc5v0_usb regulator
>       arm64: dts: rockchip: add support for NanoPi M6 board
> 
>  .../devicetree/bindings/arm/rockchip.yaml          |   3 +-
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  .../arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 142 ++++
>  .../boot/dts/rockchip/rk3588s-nanopi-m6v1.dts      |  67 ++
>  .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 792 --------------------
>  .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts |   1 +
>  .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dts |   1 +
>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   | 800 +++++++++++++++++++++
>  8 files changed, 1014 insertions(+), 793 deletions(-)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260701-nanopi-m6-ffeef7252fd7
> 
> Best regards,
> --  
> Joachim Eastwood <joachim.eastwood@gmail.com>
> 
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

