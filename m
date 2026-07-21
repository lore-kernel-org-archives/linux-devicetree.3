Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662DE3B6BEB
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623417; cv=none; b=PSbdn2XoFS9zvJdS+ypLXOItHNuylNH9mBIs9x0+Nwa112kgF2rWCxvSetwnsb+nMF+hyorjOYb1/9tWxLlNzCq/bffB/eKVBAn7XW8k2yVg4otR5IxMrbAG1vIqxstUX9RHu3MpBxOl3428afHjoGtmFYfrLbF9VPPgVBnXajk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623417; c=relaxed/simple;
	bh=wLADHfD9DbJapxsEXOfoiiWWsWK9YR8DckQXdYRO0iM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TKOYUqoqBaemqDwSW5clswdwuRf0LEfXaX6Sqwnj39vUJ+Gy4iHtyp56YOMVZBZtIRTUFvf0WPAK+EEXeff266U+H3vfLfDF0LT6VT1hEVp0w2jFkk0z7cKqafzu5MLC+kpIrTHg8RL0e88h9wb4VgZ82ZPovoZA8XOosp1XUXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTXAu5/4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTXAu5/4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125971F00A3A;
	Tue, 21 Jul 2026 08:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784623416;
	bh=A2nRx+3FAdvcnStIR7pbdZjhj8iSgzF2v1VefPVxOdc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZTXAu5/42JU2tbPwqNHT0fcbTlG13g8/xU87F+Djj9acsR0kdQWp052tctJDL9EyB
	 AVyjLGZSFQbJPmRHe8vrltXDAX6lJH8F6podqr6PEGkyL3vHrUQGX6qkZruG2WYT7f
	 lM+cec0HXChUEmFKPyayWU/BV9SudU1dIlnRGJfH8Zad2YPDkCvoKnKYkehsPG/aWG
	 TGsaYoTzVgLUMc6ogHiwIeyThE+5ZsUgmurgyXhWLfRZjFuIg9PQZx1kNDQC61KsED
	 pp5SGU+yj01+ieWXmSopZwQlcrRUgsfmx6DIGxYMm/2P+67PG6ZW9w7/eOvr9f4fBr
	 RNE0sBq2Mc3ZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-dts-qcom-eliza-add-cdsp-v2-1-e1e52bfb3c12@oss.qualcomm.com>
References: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
 <20260721-dts-qcom-eliza-add-cdsp-v2-1-e1e52bfb3c12@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 08:43:35 +0000
Message-Id: <20260721084336.125971F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `remoteproc_cdsp` node lacks the `glink-edge` subnode requir=
ed for inter-processor communication.
--

--- Patch [1]: [PATCH v2 1/3] arm64: dts: qcom: eliza: Describe the CDSP re=
moteproc ---
commit 0d8a8296d1e008af4feca584273c5028b5ea34a2
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: eliza: Describe the CDSP remoteproc

This commit introduces the CDSP remoteproc and its related SMP2P node.
It provisions the device tree nodes, interrupts, clocks, and power
domains necessary for the DSP.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
[ ... ]
> @@ -3737,6 +3761,46 @@ nsp_noc: interconnect@320c0000 {
>  			qcom,bcm-voters =3D <&apps_bcm_voter>;
>  			#interconnect-cells =3D <2>;
>  		};
> +
> +		remoteproc_cdsp: remoteproc@32300000 {
> +			compatible =3D "qcom,eliza-cdsp-pas";
> +			reg =3D <0x0 0x32300000 0x0 0x10000>;

[Severity: Medium]
Does this node also need a glink-edge subnode?

Without the glink-edge subnode and a fastrpc child, it appears the
application processor might not be able to establish GLINK/IPCC message
channels with the CDSP. Will this prevent the DSP from receiving
workloads from the host when the node is eventually enabled?

> +
> +			interrupts-extended =3D <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-dts-qcom-e=
liza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com?part=3D1
