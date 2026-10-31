Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793446078;
	b=r3Xd+rYjtScM63V5EPwiaPtaEwY8QN0ClQxjSzCdidmrHaaZwq5MRbhq5mSu/tPtZWUx
	 S5tleGsN+lfR02TNPTD155F5/gbt7vZukfnO9H9OQxV3H5kp60K46gMU9Ynnc36F1Kirt
	 QgbYcaGcwhBtWzZvzKeKnsPZmm+NJLrqAboaXdphwUqbWNeUWIR9b/kL4ez868rwcuTDO
	 ls/12hjtln5zcmlRR77V8YPrcqQcro/mHYY3CEvXc7oDUzUBwaJrzV2mHgtBL1J5p4d3h
	 zGDU9wTAPCPRRvmcF+sT9wJ/Fdg93U47g0+MQxl+7CRLEOMLQ5KQdxVmCLVqo56ZOVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793446078;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KrSS80XXCwpFZ2v3JFNx6R0MAkWjUxeVD3rtiqXWJAY=;
	b=SRBkN4PwAhTWXcKnrqSXAcefckSdNMrtKEaobckWwMNEptrI4bwCIvYcMIzGwh/66w6C
	 agbCUY3asprFRrCmVMjUpm7wk+C7KPwvRXm/zVWsP2aIjEPDW6In3kaDu7l2ieUG6o9HE
	 TkoK0xjOePU18xKI5vA4FB8EZnEkh5wcRbBPJ3FZnxtfoIRkHkCGKLDLqs7HkVwd+ROrt
	 sOvREsn1vElPA2BvfvP6Ttw1QhwbJCoPjUd1jkz3rIwp4VBgglR7krTgPSQ+cVxd7uVXP
	 ymuUhS6kfcVwfFgXohwos8lkNTVTUlTKlKorPDwtw+/Js55FUCun8l06TEUoS8ykudw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHhb3so3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B81606A31A
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 11:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHhb3so3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE441F000C1;
	Sat, 31 Oct 2026 11:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793446077;
	bh=KrSS80XXCwpFZ2v3JFNx6R0MAkWjUxeVD3rtiqXWJAY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UHhb3so3wiHqZ28a2uR/U851dGlCHIVxOQiPZbsbu2RqAEeslOF5IBVElndB0iVtI
	 PsO+Um1ybibRr4nngGtBN85lND2a4HYI10WYTh1VMHFAWQ6rsmdieq86HoVF4utoh3
	 usVZLUv5N4x6eTm9nRgCqGoIdfjwNVfd3ZcZnrE43deGwY1Yxd4BiX4vu0T1FLnDe2
	 hZ7PTxtJKCy47MlbBpRdcnXeyGFSd+V5B9yyFYJtjqiKEeRJZE9Whxip1kKhnDve34
	 P/+i4xrdgPdemyxcl+qSc5ZqNsvje6ol55oqIx4oV5b1Fb0AugpDBnc5KCXHWR1nbA
	 i4Zs5pK3cLDcQ==
Message-ID: <sashiko-outbox-191920@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] media: qcom: camss: tpg: Add support for v2.4.0 TPG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261031112203.545319-4-vladimir.zapolskiy@linaro.org>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 11:27:56 +0000
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
- [Medium] media: qcom: camss: uninitialized hw_version check in tpg_reset()
- [Low] media: qcom: camss: commit message describes omitted Kaanapali chan=
ges
--

commit 9872eb254e7eae29edd30791f0f0da3fb4571071
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: tpg: Add support for v2.4.0 TPG

This commit adds hardware support for the v2.4.0 Test Pattern Generator (TP=
G)
in the Qualcomm CAMSS driver by handling test-enable and hardware reset via
the TPG_CTRL_CMD register.

>     media: qcom: camss: tpg: Add support for v2.4.0 TPG
>    =20
>     Add support for the TPG found on Kaanapali. This TPG uses hardware
>     version 2.4.0, which drives test-enable and reset through the
>     TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
>     TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
>     CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
>     the data source when a test pattern is selected.
>    =20
>     Add the TPG resources to the Kaanapali camss resources so that the TPG
>     subdevices are created on this SoC.
>    =20
>     Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>     Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>     [vz: extracted pure TPG hardware support part from the change]
>     Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

[Severity: Low]
This isn't a bug, but since only the TPG v2.4.0 hardware support was extrac=
ted
into this commit, should the commit message be updated to drop the descript=
ion
of the CSID 1080 RX mux routing and the Kaanapali camss resources?

> diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers=
/media/platform/qcom/camss/camss-tpg-gen1.c
> index d29de5f93c18e..cabbb2638cf38 100644
> --- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> +++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c

[ ... ]

> @@ -164,18 +167,26 @@ static int tpg_stream_on(struct tpg_device *tpg)

[ ... ]

>  static int tpg_reset(struct tpg_device *tpg)
>  {
> -	writel(0, tpg->base + TPG_CTRL);
> -	writel(1, tpg->base + TPG_CLEAR);
> +	if (tpg->hw_version < TPG_HW_VER_2_4_0)
> +		writel(0, tpg->base + TPG_CTRL);
> +
> +	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
> =20
>  	return 0;
>  }

[Severity: Medium]
Does checking tpg->hw_version in tpg_reset() work as intended on the initial
power-on?

In drivers/media/platform/qcom/camss/camss-tpg.c, tpg_set_power() invokes
hw_ops->reset() before hw_ops->hw_version():

drivers/media/platform/qcom/camss/camss-tpg.c:tpg_set_power() {
	if (on) {
		...
		tpg->res->hw_ops->reset(tpg);

		tpg->res->hw_ops->hw_version(tpg);
	}
}

Because tpg_hw_version() in drivers/media/platform/qcom/camss/camss-tpg-gen=
1.c
is the only place that reads TPG_HW_VERSION and populates tpg->hw_version,
tpg->hw_version is still 0 when tpg_reset() runs during the first power-on.=
 As
a result, tpg->hw_version < TPG_HW_VER_2_4_0 evaluates to true and writes 0=
 to
TPG_CTRL on v2.4.0 hardware as well.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031112203.5453=
19-1-vladimir.zapolskiy@linaro.org?part=3D3
