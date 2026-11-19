Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089430;
	b=CwNh4DmGjGuiJnOQ+eyFSCXQOc5ib8NAmG82CMdd9eUHnLW0TcAEkOq4yWGRsRDHiHQj
	 jYuPDKfNmgXsyeUlvSnPr13hpKQq+4drj/KHWHoKfxszUnLcPOCCMKtx64hg8s3AnGwGJ
	 Vh7eHjICF49j6P7eJHkGuj4xmIJzbL/HI1XBgmvS7At6rUNf+Ee3IogjXYwGnceDPi2DY
	 yqPglswJ4mvWOyDSFSqyfw2ntE9c0lxZdN5ZycS1Dipyd359C9hweqERsI9f4hVMNWKzO
	 D8YkC5eZkXOS8DVZuQa7NHJt9Txa9QoYfG8jSveROvF4jHcG2jAOgq4qFO10FtYybEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089430;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=41YU2iQTYiLv9oMJmho4GXPPMw0uc7wx+qlBTnoFxP0=;
	b=4QV+AoG07qGjmwBCmIyGtlx0Mtpd2MeFqaVw2gZWsJSaVEsn9xcoK8Fzza47FN7udRYt
	 hZicijKSvAShSvJ2/HVO0UKFM1NVhl0sFGmRvylnKtNH/YaU6Y8WMkcjdbjSS1v0JbMeh
	 tYCt6L2OSArtCenTrb+yfkUxVkKmehYey4AnhlBSJl835Z/htPOAi7x/vmBsgsWUF8lYR
	 y8NGIcdyuTmSRAZJ8NQmP7oaOPEes5N7fXh0XVCWrkIiwaVziAJem+dC98WBv675YOGnT
	 k37JCcTmZku6bwun+lIXG7f6Sq0lx1tfOB3abNhDEdi2RoFyWH3hql9qx0rxOeBzVhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HrZU1xQq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77247606A32C
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 11:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HrZU1xQq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91831F000C4;
	Thu, 19 Nov 2026 11:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795089430;
	bh=41YU2iQTYiLv9oMJmho4GXPPMw0uc7wx+qlBTnoFxP0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HrZU1xQqg2c2hN5NVejOv65XsxuBZw35MGDbli5BJwtI3/jRaSpmelZR3yc/zW704
	 88yEe6EAQId28wsTWIZ4PsIiIT4hZaX0zeWuCTC551zYn/J6kCeUj5hDJCrJDRIyZ3
	 kEXhnSILu/CciksU3D1GsWdz461EtdKOoCtp0aiC/hLDqIRfZYQSBbxk6BTJXs+u98
	 dw5TnNzp3ixDdn3H6uYD0r/MqYw7yfScER1HcE7iAuc/g2TaVp/t7zMcaO0evMTLNE
	 12bb180W21YxuVpseQO5pIJ0fDWq/cu+e4HSb7BNXzEo6Sl/VmQ0dwB7tgHC5gYEXw
	 qBWiQN3+ssG7g==
Message-ID: <sashiko-outbox-223069@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-shikra-el2-v6-4-0e91a1467e79@oss.qualcomm.com>
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
 <20261119-shikra-el2-v6-4-0e91a1467e79@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 11:57:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: shikra-el2: q6apmdai iommus fails
  q6apm_dai_probe()
--

commit 0d5069de0241cf74b87f4a2a71c79f4b11c8da67
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings

This commit adds an EL2 DeviceTree overlay for Shikra boards to describe
IOMMU stream mappings for remoteproc firmware and applies it to the Shikra
EVK DTB targets.

> diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/d=
ts/qcom/shikra-el2.dtso
> new file mode 100644
> index 0000000000000..89997ed7699ee
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
> @@ -0,0 +1,38 @@

[ ... ]

> +&q6apmdai {
> +	/delete-property/ memory-region;
> +	iommus =3D <&apps_smmu 0x01cc 0x3>;
> +};

[Severity: High]
Does adding iommus to q6apmdai cause q6apm_dai_probe() to fail with
-EINVAL on Shikra EL2 builds?

In arch/arm64/boot/dts/qcom/shikra.dtsi, the ancestor gpr node sets
qcom,domain =3D <GPR_DOMAIN_ID_MODEM>, and q6apm_dai_probe() rejects any
iommus property when the GPR domain is GPR_DOMAIN_ID_MODEM:

sound/soc/qcom/qdsp6/q6apm-dai.c:q6apm_dai_probe() {
	...
	if (apm && apm->gdev &&
	    apm->gdev->domain_id =3D=3D GPR_DOMAIN_ID_MODEM) {
		if (!qcom_scm_is_available())
			return -EPROBE_DEFER;

		if (pdata->sid >=3D 0) {
			dev_err(dev,
				"iommus and mDSP SCM path are mutually exclusive\n");
			return -EINVAL;
		}
	...
}

Because iommus sets pdata->sid to 0xc, the Q6APM front-end DAI driver will
fail to probe and audio will not register in EL2.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-shikra-el2=
-v6-0-0e91a1467e79@oss.qualcomm.com?part=3D4
