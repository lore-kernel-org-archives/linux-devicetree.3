Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B5E48C8D6
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811596; cv=none; b=dfr5HGyIC+VIfApdAUCjYEjYER/YMVzZ5SSVE66G9vQp5iQX38JCdpB8xjsCW4KGw4LrDXK31AgzeLZ23DP6l1FjfhA/eJI5D2XW6U4JifTMyxQMchBTtOaUMaV9PuwanB9FeFCi+Vbi+z6oq/7EJupNuES/V57fdmK/37qaEDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811596; c=relaxed/simple;
	bh=THhlUlKVv2Msk6nQohwVP1ucAOAAxiVyiISPO8kyDlI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O8uEZLm5g5t8x91mfH50dnvsLxhCZVF7I8GeMwuvIABcTokno1BFzXYQHhG1bIUfoMeEPnLbPBtESeMT5Lq/lTPT99LO4pmf2z7F4gHLCBGoJkM81w5Ds/LeRHN77wYep9gPB9LTI+x/YWTVqpSCrtpNONv84dDXX/wsIprI1bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F87F1F000E9;
	Thu, 23 Jul 2026 12:59:53 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723-dts-qcom-eliza-add-cdsp-v3-1-b535200996ed@oss.qualcomm.com>
References: <20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com>
 <20260723-dts-qcom-eliza-add-cdsp-v3-1-b535200996ed@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 12:59:52 +0000
Message-Id: <20260723125953.8F87F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The devicetree node adds an undocumented and unmatched compatible s=
tring without a fallback.
--

--- Patch [1]: [PATCH v3 1/3] arm64: dts: qcom: eliza: Describe the CDSP re=
moteproc ---
commit 5421ef4d61bf1a4a8c2f57dab436568cc9538d95
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: eliza: Describe the CDSP remoteproc

This commit describes the CDSP remoteproc node along with the glink-edge
subnode and the related SMP2P.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> index 357e8066c1768..e38a1d94fbe23 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
[ ... ]
> @@ -3737,6 +3761,57 @@ nsp_noc: interconnect@320c0000 {
>  			qcom,bcm-voters =3D <&apps_bcm_voter>;
>  			#interconnect-cells =3D <2>;
>  		};
> +
> +		remoteproc_cdsp: remoteproc@32300000 {
> +			compatible =3D "qcom,eliza-cdsp-pas";

[Severity: Low]
Will this compatible string trigger a dtbs_check warning because it is
currently missing from the device tree bindings schema?

Since there is no generic fallback provided (such as "qcom,sm8550-cdsp-pas"
or similar), it appears the remoteproc driver will fail to probe because the
string is not yet matched in drivers/remoteproc/qcom_q6v5_pas.c.=20

Should a fallback compatible string be included, or bindings and driver
support added alongside this change?

> +			reg =3D <0x0 0x32300000 0x0 0x10000>;
> +
> +			interrupts-extended =3D <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-dts-qcom-e=
liza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com?part=3D1
