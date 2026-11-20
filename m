Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183885;
	b=1XC2fMvt0+TVUFP51Xf6+9azYd6HHcTSghNRbnoGKM3hAJi7XYSdTlJntWJ5656x4QnM
	 bBK42c3EtGry3Wk6z4CR/PPCiaDD5T+mu+hZPigaIIta44H6ESa8I0gNK7YbkVE5+NQUc
	 eGK1mW99d3yJTJ+vp8RO1ArzSn9djpC9vmv4zJvMQqbh+nKlK9f8c6cAku1jVQlNOHemv
	 nxAQMHJSjE+G3vg9qsdBMuw+GFmoAohQ251wd4/IFWQLRYV+c+hjcU+9/J/1hVHMsuM6o
	 VnkX9jEWREdP59r30cazZiesvl375ssns2lXScelvMr4BRQFzCuCH/oNCdX8Imr69cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183885;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3gYBs56kAsjtxUacV4LsaH3IHliGuGIJRJqS+UjidRI=;
	b=3xUL9ExS08Mr/vqk048pqRPjxpFH9hKqwrmrVk7ZZYcePNeSSl7ae5lM+Ihtc5q+evXA
	 FzRIgJp2csMRFnV2L6W4gyU8+XR1WcpVbG3Z4RRAgSphQ4LwARQ+upOSZoIlFc8fiFzDB
	 pOIarsn8U6ajPK+DfQ04o3pDYHVqBonRpKAEMM8x2YMavR8UjtCbrh+5vA7vF6uc9AkGy
	 HWLU+vcSEOneDYiK85ZWpQRjwqn6OULqIR33tj0qIQ+Z2aJkdPMK3z4FZP87BTaFWaqNV
	 xDLOSUQ/RrcRw2lIdb6RDVyGStmDzIx8ZxjnXW/x1aVvaul0QX/d4XUIM+I0c3lLXLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2eZstRp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6879B606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 14:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2eZstRp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F9E1F000C6;
	Fri, 20 Nov 2026 14:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795183885;
	bh=3gYBs56kAsjtxUacV4LsaH3IHliGuGIJRJqS+UjidRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K2eZstRpQxawxs3eLNh1w+9mlYgTvSwUpsF2YQuBZLRro3aOvWjQzLaYGnLb7IeNd
	 xM/K/gQIPQhDvMOLX8602W3VNuayLkTnU3rKwWYeqzgh6ortcT/Q8ZjrtgEPKQDsf+
	 gJNP8AVVONjJcSFNFnABjsBPuyipBiBfTpgAFUKRyRC1oSlQGZXEkxH1OvIogFUO4d
	 9QNsXq6e+3tLJ1l7iKZ3+kwv9dDFhL+NfmO7GLfH4Yh0lsKzLzEgpCFCbhjxfZrQuw
	 EFWoQ9EW4F+wd8zCUm+gFWME9fWtJdnsKroHalmlp8jAn2XBPkHbx5OYE6Jk++MDLv
	 7uJCGW4GyEWzA==
Message-ID: <sashiko-outbox-225334@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] phy: qcom-snps-femto-v2: Add support for SA8255P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mattijs Korpershoek" <mkorpershoek@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261120-phy-qcom-snps-femto-v2-8255-v5-2-86a9880ee5a5@kernel.org>
References: <20261120-phy-qcom-snps-femto-v2-8255-v5-0-86a9880ee5a5@kernel.org>
 <20261120-phy-qcom-snps-femto-v2-8255-v5-2-86a9880ee5a5@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 14:11:24 +0000
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
- [Low] phy: qcom-snps-femto-v2: use devm_pm_domain_attach_list() and
  check ret =3D=3D 0
--

commit 40323ed83ee6f03c36d2767d1e91cd08ccff373b
Author: Sriram Dash <quic_sriramd@quicinc.com>

phy: qcom-snps-femto-v2: Add support for SA8255P

This commit adds support for the SA8255P USB HS PHY variant, whose power,
clock, and reset resources are managed by SCMI firmware through "core" and
"transfer" power domains.

> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/=
qualcomm/phy-qcom-snps-femto-v2.c
> index 0dae8369671ab..0ec34bc5c26ec 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
[ ... ]
> @@ -164,8 +167,82 @@ struct qcom_snps_hsphy {
>  	bool phy_initialized;
>  	enum phy_mode mode;
>  	struct phy_override_seq update_seq_cfg[NUM_HSPHY_TUNING_PARAMS];
> +
> +	struct dev_pm_domain_list *pd_list;
>  };
> =20
> +static void qcom_snps_domain_detach(void *data)
> +{
> +	struct qcom_snps_hsphy *hsphy =3D data;
> +
> +	dev_pm_domain_detach_list(hsphy->pd_list);
> +}
> +
> +static int qcom_snps_domain_attach(struct qcom_snps_hsphy *hsphy)
> +{
> +	struct dev_pm_domain_attach_data pd_data =3D {
> +		.pd_flags       =3D PD_FLAG_NO_DEV_LINK,
> +		.pd_names       =3D (const char*[]) { "core", "transfer" },
> +		.num_pd_names   =3D 2,
> +	};
> +	struct device *dev =3D hsphy->dev;
> +	int ret;
> +
> +	ret =3D dev_pm_domain_attach_list(dev, &pd_data, &hsphy->pd_list);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "domain attach failed\n");
> +
> +	return 0;
> +}
> +
> +static bool qcom_snps_is_fw_managed(struct qcom_snps_hsphy *hsphy)
> +{
> +	return hsphy->pd_list !=3D NULL;
> +}
> +
> +static int qcom_snps_pds_enable_all(struct qcom_snps_hsphy *hsphy)
> +{
> +	int ret;
> +
> +	if (!qcom_snps_is_fw_managed(hsphy))
> +		return 0;

[Severity: Low]
Can qcom_snps_domain_attach() succeed with hsphy->pd_list left NULL when
dev_pm_domain_attach_list() returns 0 (for example, when CONFIG_PM is
disabled)?

If that happens, qcom_snps_pds_enable_all() returns 0 without enabling the
power domains, and qcom_snps_hsphy_fw_managed_init() proceeds to
qcom_snps_hsphy_configure() and writes PHY registers while clocks, resets,
and power domains are off.  Also, qcom_snps_domain_attach() and
qcom_snps_domain_detach() with devm_add_action_or_reset() in
qcom_snps_hsphy_probe() duplicate devm_pm_domain_attach_list(); calling
devm_pm_domain_attach_list() directly and returning -ENODEV when ret =3D=3D=
 0
would avoid both issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-phy-qcom-s=
nps-femto-v2-8255-v5-0-86a9880ee5a5@kernel.org?part=3D2
