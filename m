Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4890397E6A
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066756; cv=none; b=osvtJaGwJGHBPLulouJDlyUpegFhx8xP86joH5rxH12Jg09k8PMA5VOuyrLhuFIYMqByK8PecSfpxZ35mPL+IbU1XXArwr/Jmu0UioMlys/nz+b5peXBKg4x2NcBOUI9qcKG33jV1H3C+y4iBsmjk03FSykymj5Dy0NRxb847ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066756; c=relaxed/simple;
	bh=4Gq+oNNP8x1wOCoL/TysQiyAFahXgDjzDVGrIdL6U2E=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lIIInLPjlJaHVOplQfgB5zLaB2PefPFtYmCHU3dK6Zvl97dVVhSDRrHuXufZ2I1GXDjYSaVHliOrP7UbO34hUh46tEkANe4rXau6uOsr0e1gsQ9h1ktLjIJjH/o/JDqcDv4MVuFcKREVxFYWdSxuvRR4IN74scictFxwzsAgtTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=nHUP825+; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="nHUP825+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776066752; x=1776325952;
	bh=x6mc2cLNsFMcIljt3Lxl537fzfyJVxV2IgcMOpdvKJY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nHUP825+gRtc2hEElXTC3tbPhz3J8t0q2Bb0zOtE4dnSnoyQs58h1HjAMsgctxOtl
	 OqtYBVPH99d5Zu/VzZMuzgag9rrcsQ7uVJZyzA3ua9lLSAwtTUqPm1VWYSvM+5ysb8
	 7jTgKsQugdj+JNVSda/frvcb3AB61T40k0tamCF1vHUY8usMoRinvC0Vdbf/K9R3Fs
	 CViBS7Tp5Ic9P+6fCUNXN0lqdMDkqHjfFHGadlQx9NLzGCsIT0Aaj/roySSp4sReOd
	 Sb8b6liM/qH89g9ityJqYvxvAZWlIfElgLTBSGDBP+61VNHt7R0VfiQ2PtJCFFYWv6
	 e83C7zpglTsjQ==
Date: Mon, 13 Apr 2026 07:52:27 +0000
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support
Message-ID: <adyfWzVHsg3qo9cH@prism>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 1ac19ac2b13a0670cd11ef74bfe343c9670d88d2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 01:37:24PM +0300, Abel Vesa wrote:
> The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> routed through an eUSB2 repeater provided by the PM7750BA PMIC.
>=20
> Describe the port and repeater, and enable the USB controller and PHYs.
>=20
> Also specify the ADSP firmware and enable the remoteproc.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 83 ++++++++++++++++++++++++++++=
++++++
>  1 file changed, 83 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts=
/qcom/eliza-mtp.dts
> index 90f629800cb0..c31f00e36eee 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> @@ -6,9 +6,12 @@
>  /dts-v1/;
...
> =20
> +&usb_hsphy {
> +=09vdd-supply =3D <&vreg_l2b>;

Shouldn't this be l7k? Looking at kera-usb.dtsi I see the vdd-supply for
eusb2_phy0 as l7k. I don't see this being overriden by anything else
downstream either.

Just bringing it up since I copied this part for another Eliza platform
(USB 2 only) and USB failed until I fixed this supply.

> +=09vdda12-supply =3D <&vreg_l4b>;
> +
> +=09phys =3D <&pm7550ba_eusb2_repeater>;
> +
> +=09status =3D "okay";
> +};
>=20
> --=20
> 2.48.1
>=20

