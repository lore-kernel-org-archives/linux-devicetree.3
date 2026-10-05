Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B1F4AF9FA
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 15:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214695; cv=none; b=lrHrvV3EANNyP8MQqzC2tn6L2bi+7qx1YvMBOsIwYUrxaoIKurkflaVgD5mcNPCGclKnv2tS6bKVYS0LaI1Za0MUrbPhHM+BtL9H1NMAZZ9zavgcomxMRdqAgL+FKy5Q64ZVtrHNHJn9R2rTrxB1SL8ZMVSMmcyD+Ah2hBA0Nts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214695; c=relaxed/simple;
	bh=iUnKHf8E7STNjetq/MRAl48qVGSGNs02md8OvQrxIyU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uN2Ku8z6MpleNW6XVc+fNTTL1pEzdmsVpw6jdGkovn4rzaTGEMknfMHdalhBr9iOaUlfQcfrlqW4ch7x9SEmcRBJ712vI1tKYzOG0lsGyDKtNtqdJV69F+0rPIgLZcxIEdFXSUWWIVZgm4NCXsRR6EI9jvqNOyVw+tjs6jEsJ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RprkLiNn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RprkLiNn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EB51F000FF;
	Mon,  5 Oct 2026 15:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214693;
	bh=xyEdkdUO16AfChRvcw3A85+vjw6OK4gJRucxW1v437Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RprkLiNnA+5UxbZFLqX1jTUcfDLkCwBN6fgFKfD2IuLRQ6L0/hdONv2RXOmDjfcx8
	 zYeNE10PL2yAQU6thOJa38YpIbHvJGA3gg7gyyQ1v3j0rCrzTWM1KxkF57qeuZNhVD
	 o/zqZ8mOnKbKaWnpbzAFJM6+tU+2OWM6EeVpfrUzfwvOFByAhezq41iUG7AIYG48ij
	 S4l4BeF1Pb789loj7Pf96R+3MyWAgfDejgabr9uKtglABBhCu2oWnECbunqx18qEtu
	 YejJXfmgiMfPj2Ek7h5dxhfcWTuYmhxqCoUaEAKZgeFyctjNakSuj/LSfPOtS4KIJE
	 ixQRIq7cJCQPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-evk: Add suspend-only
 power collapse state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maulik Shah" <maulik.shah@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261005-s2idle_state-v1-3-3c402c66f388@oss.qualcomm.com>
References: <20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com>
 <20261005-s2idle_state-v1-3-3c402c66f388@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 15:38:13 +0000
Message-Id: <20261005153813.81EB51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: qcom: invalid AI hallucinated latencies in system_suspend
--

commit 31318bb17563026be6b93cecd9358caf654ab7fb
Author: Maulik Shah <maulik.shah@oss.qualcomm.com>

arm64: dts: qcom: monaco-evk: Add suspend-only power collapse state

This patch adds a deepest system power collapse state reserved for system-w=
ide
suspend (s2idle) on the Monaco EVK board, requiring coordinated power-down =
of
CPUSS and the Safety Island (SAIL) subsystem.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dt=
s/qcom/monaco-evk.dts
> index 539c9c80a808d..b2978be6823dc 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts

[ ... ]

> @@ -80,6 +80,19 @@ m2_e_uart_ep: endpoint@0 {
>  		};
>  	};
> =20
> +	cpus {
> +		domain-idle-states {
> +			system_suspend: domain-suspend {
> +				compatible =3D "domain-idle-state";
> +				arm,psci-suspend-param =3D <0x4200C344>;
> +				entry-latency-us =3D <706562>;
> +				exit-latency-us =3D <706562>;
> +				min-residency-us =3D <709987>;

[Severity: Medium]
Are these latency values physically accurate for the hardware?

The min-residency-us value of 709,987 us is strictly less than the combined
entry and exit latencies of 1,413,124 us (706,562 + 706,562). This appears
invalid, as a state cannot typically yield power benefits before the hardwa=
re
has finished transitioning into and out of it.=20

Additionally, 706 milliseconds seems unusually high for a transition time on
an EVK board. Since the commit message mentions this was AI-assisted, could=
=20
these numbers be hallucinated placeholders that need to be replaced with=20
actual measured hardware values?

> +				system-state;
> +			};
> +		};
> +	};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-s2idle_sta=
te-v1-0-3c402c66f388@oss.qualcomm.com?part=3D3
