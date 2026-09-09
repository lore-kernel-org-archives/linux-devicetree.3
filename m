Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5DF3DC878
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940713; cv=none; b=jRDaOvFdmFC+7fNNVWZNb/QUaVcoxRNdPU4p7mK5pKavRW1JpHwbEEe2DjS9wrP3zS12yPl9bIPxkkvR6/jiJ6cFS6h9iuzVjSIhloqzWZ024t6JUcR26LJNZpFyIhMavNgF6JNz3IO9RJyPOtpw4+OCUcBICrtyqJidtXJbn0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940713; c=relaxed/simple;
	bh=7xoSS1D21GOwPe+YVaf7pdGt7utqBqAPRU4fhK42dLU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lKbxWUjB8KrbYn9MsaxQslA2XwpJgmk/PuZF15ikdcQohZnkZR5+Z+i5nKqNS7RHfiWJRiiprPVCP1aXFr0I5ck5bLRpULt+FzpmFEoQI3CelUnIQTWVbh1nrDYZ5s5wdxhrVuNOaCUA8rbz+YsUFjK3JkzZaB0+1uk8UnmminY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXJ6dOGM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXJ6dOGM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1E11F00A3D;
	Wed,  9 Sep 2026 07:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788940712;
	bh=kcuciCbxsvoaW1Tc8OnazVUCEDRjFVgPMaoy2SYp77c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FXJ6dOGM62oixztvczPrOKqmB5qnNJQT6KNxl5HVpTeYgFqsBYdNGW50DaYClmNJq
	 h9pBWvZ3hN6H4a2HoOq+JZfRkv3cGIZaq50Z3xjJy9+QXSRiei5JRM3nRLkWlhqjim
	 10xBsL2SuBQ9+cgCJBohrp0gQCudbMaaOPKOqKyk3Z+vQ7dRBlQHy1f0BYUasu2OF8
	 JuMVqUW/Lwb5OFLhfV6wpSYFXCW7oN3MgmtkC4jCD67QKAtR3npyMjlQvBPXVUiira
	 /smstcoz4ZrOm/3zI/qxFVARGt+OQTiD9aQSUJvnp6FUe6ivOvVrPwox+t4gEkTbTy
	 y2mZMWdO0B8Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc8280xp: Mark FastRPC context
 banks as dma-coherent
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xilin Wu" <sophon@radxa.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909-sc8280xp-fastrpc-dma-coherent-v2-1-a112abfd41b4@radxa.com>
References: <20260909-sc8280xp-fastrpc-dma-coherent-v2-1-a112abfd41b4@radxa.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 07:58:31 +0000
Message-Id: <20260909075831.DB1E11F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch modifies the SDSP (Sensor DSP) context banks instead o=
f the ADSP (Audio DSP) context banks, contradicting the commit message and =
leaving the ADSP context banks without the intended fix.
--

commit 38a25d40245dd18744b644c71b8689bfd5e22715
Author: Xilin Wu <sophon@radxa.com>

arm64: dts: qcom: sc8280xp: Mark FastRPC context banks as dma-coherent

The FastRPC context banks are DMA-coherent on SC8280XP. Describe this in
the device tree so that the DMA API uses the appropriate coherency
attributes for their mappings.

Link: https://patch.msgid.link/20260507-sc8280xp-fastrpc-dma-coherent-v1-1-=
e92aed797865@radxa.com

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> index fbcfd3883bbb4..dfe7dbaebe62d 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -2910,18 +2910,21 @@ compute-cb@1 {
>  						compatible =3D "qcom,fastrpc-compute-cb";
>  						reg =3D <1>;
>  						iommus =3D <&apps_smmu 0x0521 0x0>;
> +						dma-coherent;
>  					};
> =20
>  					compute-cb@2 {
>  						compatible =3D "qcom,fastrpc-compute-cb";
>  						reg =3D <2>;
>  						iommus =3D <&apps_smmu 0x0522 0x0>;
> +						dma-coherent;
>  					};
> =20
>  					compute-cb@3 {
>  						compatible =3D "qcom,fastrpc-compute-cb";
>  						reg =3D <3>;
>  						iommus =3D <&apps_smmu 0x0523 0x0>;
> +						dma-coherent;
>  					};
>  				};
>  			};

[Severity: Medium]
Are these changes modifying the SDSP context banks instead of the ADSP bank=
s?

The commit message states:
"Mark the ADSP and CDSP FastRPC context banks as dma-coherent to fix these
failures and allow QAIRT applications to run on the CDSP."

However, this block of changes in arch/arm64/boot/dts/qcom/sc8280xp.dtsi is
under the slpi remoteproc node, which corresponds to the SDSP
(label =3D "sdsp").

The actual ADSP context banks under remoteproc_adsp appear to have been
missed by this patch:

arch/arm64/boot/dts/qcom/sc8280xp.dtsi:
remoteproc_adsp: remoteproc@3000000 {
	...
	fastrpc {
		label =3D "adsp";
		...
		compute-cb@3 {
			compatible =3D "qcom,fastrpc-compute-cb";
			reg =3D <3>;
			iommus =3D <&apps_smmu 0x0c03 0x0>;
		};

Could it be that the dma-coherent property was mistakenly added to the SDSP
banks instead of the ADSP banks? Or is it intended for the SDSP banks to al=
so
receive this property, while the ADSP banks were inadvertently left out?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-sc8280xp-f=
astrpc-dma-coherent-v2-1-a112abfd41b4@radxa.com?part=3D1
