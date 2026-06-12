Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E71313E24
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781257585; cv=none; b=LVmW8frvypJH45EE6Rj56Nt/jTGW17XlqW7c0sVoLVnZ59DemS42wqGxCoNgFBh+h2f6EokiINSicem5+3ptNq1wZY9ahC5di1seh8k9hOxWiPtOs7iuW5p4+wrp0xpPLtEhM7sN5NaaAVmXjGqyyz3jhO0gZtTdNns/8fVmLZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781257585; c=relaxed/simple;
	bh=I/TBiDpskiihncUAWjcPsw7ECeP1U/xtkXVN84mfSvM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SRxxHO6mqU5sFI5BMXenVGbek3DlDP7tKKpCww4NOcmVcaVD0+iM/3dd7t+BywJwf8bQ3eqUW64owswLx96xV34sy9vg142J6ZLTT3DK1NQuM2zo6lG3zndaO2bePVYDS/bEY8HD9FSwLtHwTkbb3nsfWyR5omWZoxTJOw3Mo/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHGq36NV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHGq36NV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B65B1F000E9;
	Fri, 12 Jun 2026 09:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781257583;
	bh=vmLbQK5zwn6D5670X9qAi/HJszrYy27BY94tGEPChwU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jHGq36NVj21fayAT06pBvCCsEISbh67RTwA4JjIcKuEDpsCYC5QlGjTIQMNTtGuvj
	 AlLGvALhb1SHiLu9mvOywHXqTDBHpdjVoL+jKZSsqY0DMUGVW2I9ZvoWuiCQDiZ+Ko
	 xRHJ78bJvrnaKlSB3p2u6/Y5MX/bTEC0wDBJrTh/C5y1aNrVHUROIsi93q0pxwmIYe
	 GK3tbgN9/tSXzs90WMO02ZcyahE8qLPQaOGVqLiHlYrMuxQ42XJJjXXPROcKIGMUY3
	 NZK2zAHiSS7I3xDiCaZ4sUkHICDwSOwjlws2Tgr6O+Xn53Q6unvzhbNeS4Bb1BuLyq
	 KUqbapBsi9+wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/16] media: iris: Add platform flag for
 instantaneous bandwidth voting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612-iris-ar50lt-v4-7-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-7-0abfb74d5b3c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 09:46:22 +0000
Message-Id: <20260612094623.7B65B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The `x1p42100_data` platform configuration is missing the `icc_ib_=
multiplier` initialization, causing it to incorrectly vote for 0 instantane=
ous bandwidth.

Pre-existing issues:
- [High] The `wd_intr_mask` field is missing in `x1p42100_data`, silently d=
isabling watchdog interrupt handling for this platform.
--

commit 341a438b98027e7efd3119d0595101f6ec929a49
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Add platform flag for instantaneous bandwidth voting

AR50LT require explicit instantaneous bandwidth (IB) voting in addition
to average bandwidth (AB) when configuring interconnect QoS. This
requirement is due to QSB (Qualcomm System Bus) 128b to
QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
which is not needed for other IRIS cores.

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/dri=
vers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index aeffd96a4e1cb..8706989d4da45 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
[ ... ]
> @@ -214,6 +217,7 @@ const struct iris_platform_data sm8750_data =3D {
>  	.tz_cp_config_data_size =3D ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe =3D 4,
>  	.wd_intr_mask =3D WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier =3D 1,
>  	.max_session_count =3D 16,
>  	.max_core_mbpf =3D NUM_MBS_8K * 2,
>  	.max_core_mbps =3D ((7680 * 4320) / 256) * 60,
>  };

[Severity: High]
Did this miss updating x1p42100_data, which is defined right after sm8750_d=
ata
in this file?

Since x1p42100_data is missing the .icc_ib_multiplier initialization, it wi=
ll
default to 0.

[Severity: High]
This is a pre-existing issue, but x1p42100_data is also missing the
.wd_intr_mask initialization, causing it to default to 0.

Does this mean watchdog interrupts triggered by the VPU hardware on the
x1p42100 SoC will be silently ignored?  Looking at iris_vpu_watchdog():

    u32 wd_intr_mask =3D core->iris_platform_data->wd_intr_mask;
    if (intr_status & wd_intr_mask) {
        ...
    }

Since wd_intr_mask is 0, the check will always evaluate to 0, which means
the driver will fail to detect VPU hangs.

> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/=
media/platform/qcom/iris/iris_resources.c
> index 773f6548370a2..caeaf199cef74 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
[ ... ]
> @@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned lo=
ng icc_bw)
>  				return ret;
> =20
>  			core->icc_tbl[i].avg_bw =3D bw_kbps;
> +			core->icc_tbl[i].peak_bw =3D bw_kbps * icc_ib_multiplier;

[Severity: High]
Could this inadvertently vote for 0 peak bandwidth on the x1p42100 SoC?

Because the platform configuration for x1p42100_data is missing the
icc_ib_multiplier initialization added to the other platforms, it defaults
to 0.

This causes the peak_bw calculation here to evaluate to 0, which could
starve the hardware of instantaneous bandwidth.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-iris-ar50l=
t-v4-0-0abfb74d5b3c@oss.qualcomm.com?part=3D7
