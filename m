Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E553CB543
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442513; cv=none; b=YIimDt5WLukdAI7gQFSHj9icQuo8v+D+NS4VLbktrrzxSbKV+Dyz4kjbbPML/IWaa4h40zKQD7YrwdxA34J1PVCvZK1npwHRFxE/1fvPH02kZGJCxMN+icqiikehwV6baqdBMzclv5/OWOtsAtyy/54hF7P3gKUT7u75aMGSuP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442513; c=relaxed/simple;
	bh=2GklmAllz2E7hor+pfFwH1V81WgYj7U4ccgb49XqGw0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qUGEPzZ0WLtsdbeOWf79GFUi4qfmAlftdFFqGt6mCMDGx76tEYnB8N8quhzQ1mONOCCzW89tIxdluM9O24GGpiNHxBn5F3G6BGBjil3fOP8kAWQnPzT6VM2KGb8sMQ86NUmJQY3gZlj3bfdE8Wtv3kXsZSNGjC4YO/odGJkQTpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUwBuWmv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUwBuWmv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8538B1F000FF;
	Thu,  8 Oct 2026 06:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791442511;
	bh=hUONKwsAv096Gvy2wCxZiRrEVezA6acTTaVPK93BDhs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iUwBuWmv3POVvzGGPdIjKfJvgJkMpcKGYA2ruy4oRAgedg8ltL+aHvm9ZRAgMEJmt
	 5Y50i4LVX0Frb09NXo060vdo3ejXg3zBnQdLtTRQBetBnxr3J1mR7dhcq8xWQRsuN6
	 pV/VnVYVCJAedXpRRKH9aFkuVzkqPU76BPBcR9mReDEpf38eoBqa9sWiEOGSc0Olf9
	 ads1oaItlRbK61dxQSUB7CftyyE+cF3wKJJaSFFviGflv/1av15Ui5xLE6i02hFfOs
	 5Du92CYOFrroN4Z+bLaWUiLUlY8d41imWk2i7dq7CLrePdWIYauKuoAvLOdbV428GY
	 /ss1uuPsAwCyA==
Message-ID: <sashiko-outbox-163719@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 06:55:11 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: merging example code explicitly marked as not intended for =
upstream
--

commit 9a283550c6d64193c89c11f63f98ea9257487934
Author: Yin Li <yin.li@oss.qualcomm.com>

arm64: dts: qcom: kaanapali: Add MPAM MSC nodes for the L2 caches

This commit adds disabled MPAM MSC device nodes under the L2 caches in the
Kaanapali device tree. These nodes are intended to allow direct MMIO access
to the MSCs in local test setups where production firmware restrictions are
bypassed.

> The nodes are disabled by default. Production firmware does not expose
> MSC register access to the OS, so these nodes can only be enabled on a
> local test setup where firmware permits direct MMIO access to the MSCs.
> This DTS is therefore only an example for other platform DT authors and
> is not intended to be merged.

[Severity: Medium]
Is this patch intended for mainline inclusion? The commit message explicitly
states that this is an example for local test setups and is not intended to
be merged.

> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 131fd2a16c545..b1dcb1e9c570c 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
[ ... ]
> @@ -531,6 +519,44 @@ soccp_smp2p_in: slave-kernel {
>  		};
>  	};
> =20
> +	l2_0: l2-cache-0 {
> +		compatible =3D "cache";
> +		cache-level =3D <2>;
> +		cache-unified;
> +		cache-size =3D <0xc00000>;
> +		ranges;
> +
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +
> +		msc@19870000 {
> +			compatible =3D "arm,mpam-msc";
> +			reg =3D <0x0 0x19870000 0x0 0x10000>;
> +			arm,not-ready-us =3D <1>;
> +			status =3D "disabled";
> +		};

[Severity: Medium]
Should these test-only nodes be dropped to avoid polluting the production
device tree? Since production firmware does not expose MSC register access =
to
the OS, describing this inaccessible hardware configuration seems strictly =
tied
to local debug environments rather than an upstream hardware description.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-mpam-resct=
rl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com?part=3D8
