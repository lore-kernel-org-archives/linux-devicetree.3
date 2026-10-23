Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750839;
	b=I+IkSoFNCV5t07yaNJn0TGFrujUsrncSopnnBP8nBeNHlW3lcq7+ICL3ULZRfu/ksP/t
	 BjYgUGRIHxnbCCX5N+oWsKHZ7GydcQSt4sGge4KmziB1nhlFoNcYEtka86FkUGPhMRG55
	 7eYMJXlHCXwo835wQFYlrSPPNLT+aDY51Fq3rGg8JPnbQfFuXhx6QHjCEFTJu7ev2fcd+
	 DYSAOetEC5EeuKn4pDrwSDmQqCysn9vRCF6RqMw/1SKjhGPBXJ8fQErXdVykB1yfbuz93
	 TfBXen5ICWDHi6O5+ApXnvRmJ2tta6UM7EfBbuNXuzXL9XZq/mgaFBG4fT2bGSKzZJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750839;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ahSh+R+B8HAr8bri5Y2bUWFfySR0HU3TdSp4wWfqeUg=;
	b=JN12+Hf6vWPxnUJ90FP8VxOPxMmI1yDcCl2pFAvfLJo31XiaXJ6SnBDP1bYkJc+CeSt9
	 ybkOCVXmkifsyt547eu+Y6KKhPnKYDhQscCoc2amaFhjyOPd/2JKhxw6k2q8z0/8DZYtb
	 DHTZHLP7rRJ3LncdtV5wSPvcj+mthxtD6ZHDjx8IRBB5oVYc8STm94ZnDjEBLGrlhc2l9
	 cHdejqt8/0W9jro0A4xzuFEIzmBtBlgulmlmdfpjfLczonmOZrXI6JFxjkSikFLroosFr
	 YLAKf+8XSGNQVhgVfAr91u/DIQlI24dKrGMEjhMAdIqsV5+F0gwSPmivGegsQJ7Z9Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EdeRTlW0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC44606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EdeRTlW0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819CE1F01825;
	Fri, 23 Oct 2026 10:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792750838;
	bh=ahSh+R+B8HAr8bri5Y2bUWFfySR0HU3TdSp4wWfqeUg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EdeRTlW0M2G2TZuwMbwZ8zrSSOTIAMftGpMeMxj6ORU+DdLP3vdob+HeVouipfKB4
	 Yjrp5SmYsNLBZw7LD782qU+2qNSzTdIUaeOsX9yL8eunDD1WadGkXShq3ZYjGtxEDv
	 YQZnpJ6PfEqRQwAtLZ0yw8IJPnc+6d73+wnbYrxmM+tIE3oQPTe6Mz4HzxCuaQ2fB+
	 JN5PuF46wR39YxHQDAEOlbhonYKLMvCOc7jlI9AOROycofStptORVXrKt/k6pkDRhP
	 xlMlRpGBL3ZYYT/ovR/ufQl6UsdO4RwwNOX1hLTPla0rqzn1vR4+kimaBLuiYDg2pp
	 V8o57pLhSBTkQ==
Message-ID: <sashiko-outbox-182673@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: Add SM7250 interconnect
 provider driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ishu Brar" <patches@brar.si>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023-icc-sm7250-v1-2-1e47c1226857@brar.si>
References: <20261023-icc-sm7250-v1-0-1e47c1226857@brar.si>
 <20261023-icc-sm7250-v1-2-1e47c1226857@brar.si>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 10:20:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] interconnect: qcom: sm7250: missing enable_mask on bcm_acv
- [High] interconnect: qcom: sm7250: ipa-virt bcm_ip0 conflicts with clk-rp=
mh
--

commit d08b59b8f7913184c97b90b1dc52c20688a7059e
Author: Ishu Brar <patches@brar.si>

interconnect: qcom: Add SM7250 interconnect provider driver

This commit adds the Network-On-Chip interconnect provider driver for the
Qualcomm SM7250 SoC, defining the interconnect nodes and Bus Clock Managers
for its RPMh-based providers.

> diff --git a/drivers/interconnect/qcom/sm7250.c b/drivers/interconnect/qc=
om/sm7250.c
> new file mode 100644
> index 0000000000000..cef29b80508d8
> --- /dev/null
> +++ b/drivers/interconnect/qcom/sm7250.c

[ ... ]

> +static struct qcom_icc_bcm bcm_acv =3D {
> +	.name =3D "ACV",
> +	.keepalive =3D false,
> +	.num_nodes =3D 1,
> +	.nodes =3D { &ebi },
> +};

[Severity: High]
Should bcm_acv set .enable_mask =3D BIT(3) (or 0x8) here?

On Qualcomm RPMh platforms (such as SM6350, SM7150, SC7180, SC7280, SM8150,
and SM8250), the ACV Bus Clock Manager resource uses a one-hot bitmask in
vote_y to identify the APPS RSC rather than a scaled bandwidth value.

With enable_mask left zero-initialized, qcom_icc_bcm_voter_commit() in
drivers/interconnect/qcom/bcm-voter.c takes the bcm_aggregate() branch
instead of bcm_aggregate_mask() whenever bandwidth is updated on a path
reaching SLAVE_EBI_CH0 (ebi):

drivers/interconnect/qcom/bcm-voter.c:qcom_icc_bcm_voter_commit() {
	list_for_each_entry(bcm, &voter->commit_list, list) {
		if (bcm->enable_mask)
			bcm_aggregate_mask(bcm);
		else
			bcm_aggregate(bcm);
	}
}

This programs scaled bandwidth values into vote_x and vote_y for the ACV
resource instead of setting vote_y =3D BIT(3).

Similarly, when qcom_icc_rpmh_probe() calls qcom_icc_get_bw() in
drivers/interconnect/qcom/icc-rpmh.c during sm7250_mc_virt probe,
if (bcm->enable_mask) is false, causing the boot-time AMC bitmask on ebi to
be misinterpreted as a bandwidth multiplier.

[ ... ]

> +static struct qcom_icc_bcm * const ipa_virt_bcms[] =3D {
> +	&bcm_ip0,
> +};
> +
> +static struct qcom_icc_node * const ipa_virt_nodes[] =3D {
> +	[MASTER_IPA_CORE] =3D &ipa_core_master,
> +	[SLAVE_IPA_CORE] =3D &ipa_core_slave,
> +};
> +
> +static const struct qcom_icc_desc sm7250_ipa_virt =3D {
> +	.nodes =3D ipa_virt_nodes,
> +	.num_nodes =3D ARRAY_SIZE(ipa_virt_nodes),
> +	.bcms =3D ipa_virt_bcms,
> +	.num_bcms =3D ARRAY_SIZE(ipa_virt_bcms),
> +};

[ ... ]

> +static const struct of_device_id qnoc_of_match[] =3D {
> +	{ .compatible =3D "qcom,sm7250-aggre1-noc", .data =3D &sm7250_aggre1_no=
c },
> +	{ .compatible =3D "qcom,sm7250-aggre2-noc", .data =3D &sm7250_aggre2_no=
c },
> +	{ .compatible =3D "qcom,sm7250-compute-noc", .data =3D &sm7250_compute_=
noc },
> +	{ .compatible =3D "qcom,sm7250-config-noc", .data =3D &sm7250_config_no=
c },
> +	{ .compatible =3D "qcom,sm7250-dc-noc", .data =3D &sm7250_dc_noc },
> +	{ .compatible =3D "qcom,sm7250-gem-noc", .data =3D &sm7250_gem_noc },
> +	{ .compatible =3D "qcom,sm7250-ipa-virt", .data =3D &sm7250_ipa_virt },

[Severity: High]
Will registering sm7250_ipa_virt and bcm_ip0 ("IP0") conflict with clk-rpmh
and disable the IPA core clock at icc_sync_state()?

In upstream Linux, the "IP0" RPMh BCM resource is managed by the RPMh clock
driver (DEFINE_CLK_RPMH_BCM(ipa, "IP0") in drivers/clk/qcom/clk-rpmh.c).
The IPA driver (drivers/net/ipa/ipa_power.c) controls IP0 as its core clock
via RPMH_IPA_CLK and only requests the memory, imem, and config interconnect
paths, never MASTER_IPA_CORE to SLAVE_IPA_CORE.

Because RPMh does not aggregate votes for the same resource from two separa=
te
kernel drivers within the APPS RSC, when icc_sync_state() runs after all
interconnect providers probe, the unused ipa_core_slave node aggregates to
zero bandwidth and qcom_icc_bcm_voter_commit() sends a zero vote for "IP0"
to RPMh. This overwrites clk-rpmh's vote and turns off the IPA core clock
behind the clock framework's back, leading to unclocked register access
SErrors when the IPA driver accesses hardware.

Should sm7250_ipa_virt, bcm_ip0, ipa_core_master, and ipa_core_slave be
dropped here, as was done for the other upstream drivers in
drivers/interconnect/qcom/?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-icc-sm7250=
-v1-0-1e47c1226857@brar.si?part=3D2
