Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47CA42467E
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530355; cv=none; b=If4FN9HV1HT5VoOdgltq7zBkiGVyVi+1F7t4XKAUTF8KanH5zAiBy4CuZ++6b09Qo5qCm363h2aGWaFuLMx3XwexnbaWLLyguFui8RIfCmhT5kQU5VhRaJxMSq4xcY8ozzmHSpzVxZ2HNLgv729HCnauuisNYWul6imJ5kSgCA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530355; c=relaxed/simple;
	bh=WYYQdde+DDDMeu3W1z/PgPdtMI0brRVl4Jt9KfKgzn8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c1w8/nWsaPfB5ZM2btrBsNL2HJpPqJniiEAtxGPx/o/GjLqJdEFL1N+JX8Xfb3THeE5ibKgwNCuP+ppLuInbnADuq62z/F0Z+x2Rdq4gUXEdJUyw0WVxYilkEmJ7TP+sp2rT2bwZ5t9r+hp6EVCzTfVdLX5c13X1A5KsDNfQZgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U++Iw2JK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U++Iw2JK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183EC1F00A3A;
	Wed, 12 Aug 2026 10:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786530353;
	bh=UW89FuY/3sy6Xdixcu1KYyPocU5aKP1xguy1boeomUc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U++Iw2JKVA0NwfTwQxDr25Q1ZGyU2T6eTbzD/oSTJW9xTk5ExsTkwM7QUkUFmIzSB
	 Dnnn4YxQXJg7jmiMAjCT80VzpOhrYU+5m2420YD4ETrqXoX8r9qbr4+awKrEhwVx6o
	 YV5jX53qSkICe5WVsOgpqBV7DUG5BE3WuzY5g0ZSpiAML01gREd/eztLSbIXC6f2Rq
	 RD6Cp6SAVzsPMFTpwiuvYGjfgVxgUyFsWKQXCROytqCh+0XmliiG0cP77LgfAZbKgV
	 j5mw5tZydeaPiAI1i33UZU5cH0AxInFBeStk+kQBC4Pm061c0JjOEbWkLq+VnqYIYV
	 9cNIO7lWsorFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/14] arm64: dts: qcom: ipq5332: Flatten usb
 controller node
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: linux-phy@lists.infradead.org, olteanv@gmail.com, devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260812-ipq5018-usb3-v2-4-8f355d7ff0ef@outlook.com>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-4-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 10:25:52 +0000
Message-Id: <20260812102553.183EC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The flattened USB controller node specifies a 'reg' region that is=
 too small, entirely excluding the QCOM wrapper register space that the dri=
ver relies on, which leads to probe failures.
--

--- Patch [4]: [PATCH v2 04/14] arm64: dts: qcom: ipq5332: Flatten usb cont=
roller node ---
commit 4c4cf3e503a7cae17e6181ac3e5f119bbfadc49e
Author: George Moussalem <george.moussalem@outlook.com>

arm64: dts: qcom: ipq5332: Flatten usb controller node

This commit flattens the usb controller node for ipq5332. It updates the
node to use the latest bindings and the flattened driver approach.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5332.dtsi
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -456,16 +456,9 @@ qpic_nand: spi@79b0000 {
>  			status =3D "disabled";
>  		};
> =20
> -		usb: usb@8af8800 {
> -			compatible =3D "qcom,ipq5332-dwc3", "qcom,dwc3";
> -			reg =3D <0x08af8800 0x400>;
> -
> -			interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names =3D "pwr_event",
> -					  "dp_hs_phy_irq",
> -					  "dm_hs_phy_irq";
> +		usb: usb@8a00000 {
> +			compatible =3D "qcom,ipq5332-dwc3", "qcom,snps-dwc3";
> +			reg =3D <0x08a00000 0xe000>;

[Severity: High]
Does this reg size need to be larger to cover the QCOM wrapper registers?

When transitioning to the flattened qcom,snps-dwc3 binding, the reg size is
set to 0xe000, which only covers the DWC3 core registers.

The dwc3-qcom.c wrapper driver relies on the qscratch wrapper registers whi=
ch
reside at an offset of 0xf8800. The driver modifies the requested resource =
end
address to include this offset, which means devm_ioremap_resource() will
request a region that exceeds the 0xe000 byte resource specified here.

Could this overlap mismatch cause a resource conflict during
__request_region() and fail the probe with -EBUSY, rendering USB unusable
on the SoC? Should the region be expanded to cover the wrapper registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-ipq5018-us=
b3-v2-0-8f355d7ff0ef@outlook.com?part=3D4
