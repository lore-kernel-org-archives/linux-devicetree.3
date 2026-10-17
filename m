Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AF837DEA8
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792250725; cv=none; b=qxNMex9qKJGbzYI2QGPKuk91h6vjOhr7QLlKWXnbKSun0DZmPrnBzXlv44/zsekGtAoCB/dIIN7vReJfmYZyxVqX0tnbZzrAoEqNaxUqoZ+h8y7rrA4ZL6nkk6foLwNIQdZQGqrndnHOXbgyWUt9IhSih1o0OrmJGtN5daoGpI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792250725; c=relaxed/simple;
	bh=/DykAFh0o/fcV/Z98QGSklF5QVPgy118xECj0izIMzE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=s74fwmFL2wp1Pz6Ws3VHZGDi7O8K0yZCjwSmMj/2Oo8qlslrQP0DQ3gLMs3jX7ljZBiNGCNAA41rx5rcNcMXBrlh+vgY4z62PzmHre4EbPCU8DDUaTzY2D5NmlWEkL49I/gQjaGZMefyFxKx6TDhs0ZaGj+It+BsvzNOFgyQxDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jt66Co2f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jt66Co2f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38AE1F000C4;
	Sat, 17 Oct 2026 15:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792250723;
	bh=jwD85STprU+5HSyl42T3Hz46XA8JfLPLZWq/NZiw3oU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jt66Co2fkByQs4FH5Iluv/DAMp3KrJQ/PVc+p33Erj/xYUWdMRXIvnE53sKRTKkk8
	 Ubyde785FfIdY+wgxvY0Kh6W7Ja+7N80rox4Q2xx0FXrIeeSwyS8i/k0/C3DdVPHBt
	 z237UX7vUalf6ZXT7VOqVWglIq2/MLzqrg6W4uikFRMkP+U/662JklU8BHJi+z0LDx
	 hV6VorHSkU0p+9JsnIqnKIHopw2qT05ZiM+eF4aisNHDtfTc6KdcZQ0sdMu1YSAWWf
	 qBtK38E2wNHyrN/VThlD4uM0ulhUv9eVW+Lp9shGLg3W49ttD4RHJdYF9t+fn2fgQm
	 Np1iS8VRvISsw==
Message-ID: <sashiko-outbox-175580@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 3/3] net: ethernet: qualcomm: ppe: Add
 IPQ5332 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Til Kaiser" <mail@tk154.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016152449.934312-4-mail@tk154.de>
References: <20261016152449.934312-1-mail@tk154.de>
 <20261016152449.934312-4-mail@tk154.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 15:25:23 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: qualcomm: ppe: out-of-bounds register write for multicast que=
ue config
--

commit 685879ecd74a6118d193f93282001e1b28945b42
Author: Til Kaiser <mail@tk154.de>

net: ethernet: qualcomm: ppe: Add IPQ5332 support

IPQ5332 shares the IPQ9574 PPE architecture, but has only two front
panel ports and uses a different clock rate, interconnect paths, buffer
limits and scheduler arbitration.

> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net=
/ethernet/qualcomm/ppe/ppe_config.c
> index 65ac6c0841d5a..91e6ee9524a60 100644
> --- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
> +++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
[ ... ]
> @@ -264,6 +298,30 @@ static const struct ppe_qm_queue_config ipq9574_ppe_=
qm_queue_config[] =3D {
>  	},
>  };
> =20
> +/* IPQ5332 unicast and multicast queue thresholds. */
> +static const struct ppe_qm_queue_config ipq5332_ppe_qm_queue_config[] =
=3D {
> +	{
> +		/* QM settings for unicast queues 0 to 255. */
> +		.queue_start	=3D 0,
> +		.queue_end	=3D 255,
> +		.prealloc_buf	=3D 0,
> +		.ceil		=3D 300,
> +		.weight		=3D 7,
> +		.resume_offset	=3D 18,
> +		.dynamic	=3D true,
> +	},
> +	{
> +		/* QM settings for multicast queues 256 to 299. */
> +		.queue_start	=3D 256,
> +		.queue_end	=3D 299,

[Severity: High]
Does ppe_config_qm() calculate the multicast queue register address correct=
ly
when queue_id is >=3D 256?

In ppe_config_qm(), the code calculates the address like this:

			} else {
				reg =3D PPE_AC_MULTICAST_QUEUE_CFG_TBL_ADDR +
				      PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC * queue_id;

Since queue_id ranges from 256 to 299 for multicast queues, and is not offs=
et
by 256 (PPE_AC_UNICAST_QUEUE_CFG_TBL_ENTRIES) before multiplication, does t=
his
result in an out-of-bounds address calculation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016152449.9343=
12-1-mail@tk154.de?part=3D3
