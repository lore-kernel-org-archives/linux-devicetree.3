Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207823624B8
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389245; cv=pass; b=BhBxoFRNOtOL36ljoZNAVtZOk561Xo5gET1PsGIUujGIJF7LXtxE8YrpkLv6DPNmKFsc/M0CDqjdCx+LK+Fkn/sd9ktGIE6bFW42znY7elpox83hWXAbImhFkCmEjwXjDbq9rJwp5/HuFi8Pz84UPWJAIDCTAp4dtDZSmNFzbxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389245; c=relaxed/simple;
	bh=dSWSBuuTZExZMNmjR7NSxnu5W3N6WKshd5+QI2h6wRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=As3uGmGVirlbVgdp7OK2wc8c3Hq7PhLKNJc2VycOFlsN1+EGjyJ7svolsT6fNBoWJtJ5T1h/I52gicU9d8rkl39UIfh3qSFXI5EcpEHd0KrZ0uy8Oih2wRkAm9zGc0/ZkNhzZQlsGLcw/M5pxeCp0/VGGHRLIgv455Ig7sWhuyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpRNWCPe; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpRNWCPe"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1946241a91.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786389243; cv=none;
        d=google.com; s=arc-20260327;
        b=b7PQKU3Rw08WduRt33nrdhew8AWW7HYHSMMF6zHerKwORR0GGWEPQrGd0h21JKnF4f
         d4mfk3a+FGkFj66U8+6osyYRHmGTSCBKEDxNPtc4htrfWOaHvOIEuqdL1fp0ONMQ6t23
         AaiMkpvBOwH9MDrA9M9ESV2CVqiukqfKSK2aktqy6YeRMEKhgRE3GTh+grCBrgGrRJDj
         FITtjQ+GaYlsAJBDlEBXHqd2niUEdkSMUXf5PR8NQAYCRwEvJpHUQH6rdOJd5QMun2c4
         skBbDVPa4oRYcXvjCIbDs3tePyY6/Y/wxwWwyLg53bkerZ3ToD+vb1fP+F9d1N3cwpui
         eZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ztYcNdQlffuTx6km2o72/tflbKDf0gQ5fGiTpALKrhM=;
        fh=ohH5ja95lhV9ieNTf6IqQORjyhb+ivSiAmwyyFTs/i8=;
        b=AnOhFQUx+6zoapkGTmeRjXoN6Uqg3waZZOW96a+LqT7dHEhl7C4w2hCVqWiMjc/FEu
         T+PaviT4nMI6gzZLtCIwMWTOFxhR7h1CZKZ8mIvt6D3JK++nJywt0QtZ+UQlB+ptVIRr
         HV/P4x+BBB9f/mDEUeyFTHiT5tor5X/1QIqSNY2iX39dNFsjxLrJj7gmmctLN7GTKdGN
         LjfS6FyfSL6s+bKVT5zVntt4yoAZf7kUUJEP1ib1/KRZI5bgXJqtlpDVHcjrs4xrcPuT
         W+kV47eepYT0FwXW3+n9uDVSqDBZqWwCCVmFfkureQvHYn1i86vlKXVxd4HMuKiDqHVN
         VsIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786389243; x=1786994043; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztYcNdQlffuTx6km2o72/tflbKDf0gQ5fGiTpALKrhM=;
        b=NpRNWCPeFnx0jlly2KXCZyGuwut09FeWmLkJfrV2LSqDK9u24eyq8gOM4Jd/7s+oLS
         8DmcA4VCjRIvsASYeeh6N1uEdAS6Gmyug/N40gDCDPmXyG04xHp5KPjX5eWWXlR+nQOA
         qzM5Gif7o+67vnmV/d7Oh7DzNeLm/rVMlPzZxJrWBPqQ4DuCn0+mDFJ1CTvy+dyEfk/f
         G0X5Bq8FmwGHjXOTZMV4FSWg38q3ZvR+QLzhIGKAwwqlLQIrFEbE5f0gmvIbPKU3D6am
         iKRGvbcBd0lTZ5iqwE/imXcIpAqwpDM9hKnpOylDdKPXnC60G7LN3lnaTnR53Wl77ys6
         1fTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786389243; x=1786994043;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ztYcNdQlffuTx6km2o72/tflbKDf0gQ5fGiTpALKrhM=;
        b=nG9tQyDPrE5MjO9Dem4EH6KZ7FYzYBjbjNxnKseTExKXk+K+/KYIN67U79VqaJGMUF
         GqP5mbpPCUedzHrineK/uI/H4ud8EAo2TKTxhz/drGSrxx0Ptzw5eAUhSiw6/muBHf83
         7lA8qgZORDWATnNNymKBHIh3vxYP14EsDqiuMCJKkzQZTbNz0x/nOZWI7/BiyKIIf8q/
         QpgQGBp//qEux7BTulKNSZnVFSXoMkFVClRYoEtLpQrsvJSgPG8RZX1sjKv4+o5YKhhZ
         6OpAPJJJJI1PaPJ41XzfeRVLt0c+SBjX2PR5X+YOptlwbvtc9iPvIA6h2fKX6zniqUYy
         2u2A==
X-Forwarded-Encrypted: i=1; AHgh+RqAHkcw33jjQfbL+aCFy4Fc8ZUkHo9kVTKRrtdv9bnpOiakcA2TBoH4gSFoufwRL3Eu+P7liQVAKHHi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw70ghoqTFbjSf/qxsQsGQFEqImobpcg03dbNiH5kOcfRtHpYTu
	mvUJp+4iXgIHKtK8uiBuhP3W2IHhz8cStdWfeYYGm6u2fNomXn0pHWgua0Oc9NL3C2ffbYF8kO5
	spB4op0u1XiYi9CiiepItASoj6NjKR6s=
X-Gm-Gg: AR+sD13qsMcxWC+toTMzFKZJT9nXCbKORoLpVqIl3nIZb1LimjL+DKS3X2OWOkS+YCV
	dIX/ovKXwDwmD6TNaMktceJY9EeOZEKTJvxPZ7edvZBX6GtQOA/c0wQho17hX/px1QTvKlaHr5W
	O7GD+5UnJOjNi25lesCJX4Pw2jRbrNEeqWBLodKySN9ClbhXqe/OauFG7BHq2EuZV051TatDgFH
	ThHOXMuRyb4xTfa21dkVdH0O+fHU9RIqfR4Ezhg9gTxkV6P+nS8A7F9A3f8jxeCY4ig+dd0sKZX
	tseix8UN9TChvJLW8Lfle544kj2Z2oRMAATGR9M/YZPb9397RS1SEZoSTwtmf7ELGINIpMJkC54
	TM1PmRBK04tYjjqwbDn1W/xjYuCzLr/xjnxMlTd85P3cDv+IFPK7XWilrFIM0LO8b87XB
X-Received: by 2002:a17:90b:4d84:b0:38e:6bd7:fbbf with SMTP id
 98e67ed59e1d1-3903c697453mr40345740a91.20.1786389243366; Mon, 10 Aug 2026
 12:14:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
In-Reply-To: <20260728-nanopi-m6-v5-0-cbc1eb0d8d56@gmail.com>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Mon, 10 Aug 2026 21:13:51 +0200
X-Gm-Features: AUfX_mxzTrvRm81zDcfC1V6GLy0ckjTy6s3zsVjpnKMTBTT21-X5wzX34Jts7oc
Message-ID: <CAPSPb=s9ZxjrHPn3Xfe24kS=_29G0mX8xkxdWGj2Rkd83zwnpw@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] arm64: dts: rockchip: Add NanoPi M6 board
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	diederik@cknow-tech.com, jonas@kwiboo.se, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Heiko,

I guess this missed the merge window for 7.3.
Do you want me to send a new version once 7.3-rc1 is out or will you
pick up this version?

There is one very simple conflict in
arch/arm64/boot/dts/rockchip/Makefile with the LubanCat4 support
commit.


best regards,
Joachim Eastwood

On Tue, 28 Jul 2026 at 14:02, Joachim Eastwood via B4 Relay
<devnull+joachim.eastwood.gmail.com@kernel.org> wrote:
>
> This patch series add support for the NanoPi M6. This board is very
> similar to the NanoPi R6C and R6S boards which are already supported.
>
> Main differences:
> * M.2 M-key slot with PCIe (Also present on R6C)
> * M.2 E-key slot with PCIe and USB (from hub)
> * 1 additional USB 2.0 port from an on-board USB hub
> * RT5616 audio CODEC
>
> Patch 1 documents the NanoPi M6 board compatibility string
> Patch 2 to 10 are fixes and additions to the nanopi-r6 base DT
> Patch 11 extracts the common NanoPi 6 series bits from nanopi-r6 into
> nanopi.dtsi
> The final patch adds support for NanoPi M6. Support for M6 has been
> split into two files; one dtsi and one dts file. This makes it easier
> to add support to the new M6V2 board at a later stage.
>
> All changes have been verified using the schematics for M6, R6C and R6S.
> Only M6 have been boot and runtime tested. Testers for R6x are welcome.
>
> Note that Sashiko may complain that u2phy0_otg is a dangling phandle in
> patch 11. This will never happen in practice so it's safe to ignore.
>
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
> Changes in v5:
> - Switch from simple-audio-card to audio-graph-card as Sashiko
>   complains, rightfully, that the bindings are a mismash of both.
> - Add pull-up on sd cd pin. Noticed by Diederik.
> - Link to v4: https://patch.msgid.link/20260717-nanopi-m6-v4-0-b31391a72e41@gmail.com
>
> Changes in v4:
> - Remove boot-on reintroduction on vdd_npu_s0 in nanopi.dtsi during
>   refactor screw-up. Thanks to Sashiko for catching that.
> - Fix minor typo in "add gmac1 add phy-supply" commit message
> - Use schematic net names on PCIe reset lines. As suggested by Diederik.
> - Link to v3: https://patch.msgid.link/20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com
>
> Changes in v3:
> - Reorder patches so the DT fixes/additions are applied to
>   nanopi-r6.dtsi as suggested by Jonas Karlman
> - Add comment to gmac to rgmii-rxid phy-mode to explain usage
> - Addition of pinctrl to sd and pcie are now marked as fixes
> - Remove both always-on and boot-on from NPU regulator
> - Link to v2: https://patch.msgid.link/20260711-nanopi-m6-v2-0-422675a65402@gmail.com
>
> Changes in v2:
> - Organize DT such that adding support to NanoPi M6V2 later is easier
> - Use correct clk id for I2C mclk out as suggested by Diederik.
> - Add a couple of acks from Krzysztof Kozlowski.
> - Link to v1: https://patch.msgid.link/20260703-nanopi-m6-v1-0-8344a1559519@gmail.com
>
> ---
> Joachim Eastwood (12):
>       dt-bindings: arm: rockchip: add FriendlyElec NanoPi M6
>       arm64: dts: rockchip: rk3588s-nanopi-r6: fix missing sdmmc cd pinctrl
>       arm64: dts: rockchip: rk3588s-nanopi-r6: fix missing pcie rst pinctrl
>       arm64: dts: rockchip: rk3588s-nanopi-r6: remove pull up on rtc int pin
>       arm64: dts: rockchip: rk3588s-nanopi-r6: pcie2x1l2: add clkreq
>       arm64: dts: rockchip: rk3588s-nanopi-r6: remove always-on and boot-on from vdd_npu_s0 reg
>       arm64: dts: rockchip: rk3588s-nanopi-r6: remove useless vcc_3v3_pcie20
>       arm64: dts: rockchip: rk3588s-nanopi-r6: add gmac1 phy-supply
>       arm64: dts: rockchip: rk3588s-nanopi-r6: remove bogus vcc5v0_usb regulator
>       arm64: dts: rockchip: rk3588s-nanopi-r6: add comment about gmac phy-mode
>       arm64: dts: rockchip: rk3588s-nanopi-r6: refactor to support M6 boards
>       arm64: dts: rockchip: add support for NanoPi M6 board
>
>  .../devicetree/bindings/arm/rockchip.yaml          |   3 +-
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  .../arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 142 ++++
>  .../boot/dts/rockchip/rk3588s-nanopi-m6v1.dts      |  57 ++
>  .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 792 +-------------------
>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   | 797 +++++++++++++++++++++
>  6 files changed, 1000 insertions(+), 792 deletions(-)
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260701-nanopi-m6-ffeef7252fd7
>
> Best regards,
> --
> Joachim Eastwood <joachim.eastwood@gmail.com>
>
>
