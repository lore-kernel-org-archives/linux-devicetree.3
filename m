Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B58324113D
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037536; cv=none; b=QdsT3ktwBeUWa6j4CdDTHMZyRXg6WaYXUxqUUAn8T93gIKJHdaUbfvhy1ONRSzTfUEL1bXpc0HnXhrqW0GuKiBgokilsvXwUd6ihwggF83+CbtQ96oZXktcjL/TVR6kKjEcBlXRwke6mKunyCHRzt6YrvapFIEctzmWTXP5c1E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037536; c=relaxed/simple;
	bh=F6v5do/ijq3Jit8s/ohmPj8bm0QAruQMlWQx1e5Hig4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bPtmEGFmZjsTZWGoGAJTUG2tPBl0F5Tum1g+L5JnWUbjAvwBmDLOaFNblN9eXMpUAnUQEXkbM84IH9aGQBISGRMqLLqE2mCd22uA5L/sbh6nWVrAqGB9kGCTB5AIexLdktU5yyi8/Ip+uA/XZNqs2eJUGlGPaCiepDn251aaIRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZHSqB0u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZHSqB0u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F97B1F000E9;
	Tue, 14 Jul 2026 13:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784037534;
	bh=UrYre6NNebOdd2h4p4xjCRXkBevp9Ugj/uqPsL27Lmo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YZHSqB0ubaBzVaRR32G5zbCCjR+jY0XKfTlGKU9UNP4epNIrMJ4AsWuHsUc188nq5
	 qUO3MrxoXptauNwoPZjeK8whbPF3rFKAuYQzb/GH+F31nh5BY6VCd7Vjwox3hjaJD2
	 nkAWlK+QZVkh6DykKJ6j2PCbyN4JF2ehjgIP2IcNWgrJcrGsgx+weu1c/X5Ajl4cnJ
	 2x3thshwM4K3NXtPxYMFhexJilH/PccFE5/ktY+TVllZQ7OsVmtnKc+bVl4dAYn93x
	 hMymjsgtEmubdFnqpGabXCh8gclYWGh4LLskGue3AveS7AjAEygPcIQcvi2oc1WONm
	 z7r1xqupUG3hg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] pmdomain: mediatek: Add support for MT6858 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikolai Burov" <nikolai.burov@jolla.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260714-mt6858-pmdomain-v1-3-4f09bbb822e0@jolla.com>
References: <20260714-mt6858-pmdomain-v1-0-4f09bbb822e0@jolla.com>
 <20260714-mt6858-pmdomain-v1-3-4f09bbb822e0@jolla.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 13:58:54 +0000
Message-Id: <20260714135854.9F97B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `.sta2nd_mask` initialization for `MT6858_POWER_DOMAIN_MD`=
 causes the power domain status polling to check the first acknowledgment b=
it twice, ignoring the second acknowledgment bit.
--

--- Patch [3]: [PATCH 3/3] pmdomain: mediatek: Add support for MT6858 SoC -=
--
commit c973791cdeb399024e52d84d14f8ed20c88d8b0f
Author: Nikolai Burov <nikolai.burov@jolla.com>

pmdomain: mediatek: Add support for MT6858 SoC

This commit adds support for the power domains found in the MediaTek MT6858=
 SoC.

> diff --git a/drivers/pmdomain/mediatek/mt6858-pm-domains.h b/drivers/pmdo=
main/mediatek/mt6858-pm-domains.h
> new file mode 100644
> index 0000000000000..6d85835115b4f
> --- /dev/null
> +++ b/drivers/pmdomain/mediatek/mt6858-pm-domains.h

[ ... ]

> +static const struct scpsys_domain_data scpsys_domain_data_mt6858[] =3D {
> +	[MT6858_POWER_DOMAIN_MD] =3D {
> +		.name =3D "md",
> +		.sta_mask =3D MT6858_PWR_ACK,
> +		.ctl_offs =3D 0xe00,
> +		.pwr_sta_offs =3D 0xe00,
> +		.pwr_sta2nd_offs =3D 0xe00,

[Severity: High]
Does this domain initialization miss the .sta2nd_mask assignment?

Looking at scpsys_domain_is_on() in drivers/pmdomain/mediatek/mtk-pm-domain=
s.c,
if .sta2nd_mask is omitted, the polling logic falls back to reusing .sta_ma=
sk
for the second status check:

	mask2 =3D pd->data->sta2nd_mask ? pd->data->sta2nd_mask : mask;

	regmap_read(scpsys->base, pd->data->pwr_sta_offs, &status);
	status &=3D mask;

	regmap_read(scpsys->base, pd->data->pwr_sta2nd_offs, &status2);
	status2 &=3D mask2;

This would cause the polling loop in scpsys_power_off() to check the first
acknowledgment bit twice instead of verifying the hardware's secondary ACK =
bit,
returning early without waiting for the second ACK bit to clear.

Could this lead to disabling clocks and regulators before the hardware has
actually finished its power-off sequence, potentially causing a hardware
lockup or kernel crash during system suspend or runtime PM?

> +		.ext_buck_iso_offs =3D 0xf20,
> +		.ext_buck_iso_mask =3D GENMASK(1, 0),
> +		.caps =3D MTK_SCPD_MODEM_SECURE | MTK_SCPD_EXT_BUCK_ISO |
> +			MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT6858_POWER_DOMAIN_CONN] =3D {
> +		.name =3D "conn",
> +		.sta_mask =3D MT6858_PWR_ACK,
> +		.sta2nd_mask =3D MT6858_PWR_ACK_2ND,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-mt6858-pmd=
omain-v1-0-4f09bbb822e0@jolla.com?part=3D3
