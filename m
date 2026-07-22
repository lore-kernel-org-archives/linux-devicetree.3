Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26019279DAF
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709200; cv=none; b=Spxjihu/oFsJR1X7goKJ4LesKbnSckKX23Gh+gq+Y2MiHgIOs9rsEzsOrXTbR/tq3WLN++4nFGnbvNBt4J43rUDcyRGlg8s/AfUBzhi/j5AWK23s4tGShr2+f7KQ8XQe9x/fzzDOXxzxNQGQAemNsPs0CswNR3b7AINTXAAeRsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709200; c=relaxed/simple;
	bh=cd8wh7Z78D3f186gpLDPx5gwYXprAqthe9EUA8fx6tc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tCRLZL0G6ABbvXUWBIysAoBCYX4+429pF/T9YL3/YFK/POSY3pjE0mQmF94ADT334+IkAzDbpjbsQF2d42JB3ujrLEFquI5nNVR1YoVmxtoYSL5NW34aXO3A/lWQc48R2kw44BjUEXCXs4Sn373n81rcxGLRN50WvFjSgcbL58g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MoehGj5E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MoehGj5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3EF1F000E9;
	Wed, 22 Jul 2026 08:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784709199;
	bh=+l3YY5EAQFWejxTNuf9JQYrqoQkN8p0t3uDETzC+xUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MoehGj5ElF5fVHOx8e1KlVb6XbXFFnz599amyZr7zFr7BTQz/0iq6vrcjMp4wAOeS
	 YvnYNcj+pBYwx9lhMM8hcFgCAW2df6xpnWVbnfzvXJItsDpXi7fGnRa09w4dleY869
	 e257YKHWcp31L50BlR34/iNUenU+Tc+6XAwWKVgTxjAcNOu1JuWhY+COTCNLzVxyZC
	 GXE31HfO3dI7WoPZeKU5DiMBrd1PecArfzc9LnfFfJIJsQXXyZ1BDQJTLLMF6/qj9X
	 JbjeRXrpw1HH/4cIrZDmMQdt1KHfUf151zRFsIge9cFhx978uY4Z0VBv7k3VU7Df7R
	 GA2BcGmGfxMYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] arm64: dts: qcom: qcom6490-idp: Add IPA node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavan Kumar" <pavan.m@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260722082314.1502072-1-pavan.m@oss.qualcomm.com>
References: <20260722082314.1502072-1-pavan.m@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 08:33:18 +0000
Message-Id: <20260722083318.CF3EF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The IPA device will fail to probe unconditionally due to a missing=
 `memory-region` property, contradicting the commit message claims.
--

--- Patch [1]: [PATCH v5] arm64: dts: qcom: qcom6490-idp: Add IPA node ---
commit 1670b1c514088d32ff0dcb8120b44156a4500dd0
Author: Pavan Kumar <pavan.m@oss.qualcomm.com>

arm64: dts: qcom: qcom6490-idp: Add IPA node

Enable the IPA block and provide the firmware name required for firmware
loading on qcm6490-idp.

> Changes in v3:
> - Rebased on top of IPA property consolidation series.
> - Dropped qcom,gsi-loader and memory-region properties as they are now
>   provided by kodiak.dtsi.

[Severity: High]
Is this description accurate regarding kodiak.dtsi providing these properti=
es?

During system boot, the IPA driver in drivers/net/ipa/ipa_main.c probes the
ipa node. Without a qcom,gsi-loader property, ipa_firmware_loader() defaults
to IPA_LOADER_SELF. This triggers a call to ipa_firmware_load(), which
attempts to fetch the memory-region property via
of_reserved_mem_region_to_resource().

If memory-region is missing in both qcm6490-idp.dts and the included
kodiak.dtsi, the fetch will fail and abort the probe.

> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/d=
ts/qcom/qcm6490-idp.dts
> index bdc02260f902b..7242695aed978 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts

[ ... ]

> @@ -619,6 +619,12 @@ &gpu_zap_shader {
>  	firmware-name =3D "qcom/qcm6490/a660_zap.mbn";
>  };
> =20
> +&ipa {
> +	firmware-name =3D "qcom/qcm6490/ipa_fws.mbn";
> +
> +	status =3D "okay";
> +};
> +

[Severity: High]
Will this node fail to probe unconditionally on the qcm6490-idp board due
to the missing memory-region property?

Additionally, looking earlier in arch/arm64/boot/dts/qcom/qcm6490-idp.dts,
there is an explicit deletion of the firmware memory region:

/delete-node/ &ipa_fw_mem;

If kodiak.dtsi did provide the memory-region property pointing to this
node, wouldn't deleting its target cause a Device Tree Compiler error?
Does the memory-region property need to be explicitly defined here to
allow successful probing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722082314.1502=
072-1-pavan.m@oss.qualcomm.com?part=3D1
