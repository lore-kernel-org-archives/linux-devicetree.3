Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAE143DA2C
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 10:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776998; cv=none; b=ELFR0Bq2yoLJS6lGWpiCDWGOcQJcwLy/GmvEeXh8cE/o/PKDOuMQs94hV0EqR2aQv4yRDV7FHnGIhbdEaKHd6OA2WtrQdwb7EdQ1mvVQsjHNPkLrBla6Ahx5WUqwvEbyeZwyExFxNWs+LHx2QbPz+5lB5qqMdD6D6p2gPJTRpdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776998; c=relaxed/simple;
	bh=YDCqjQk9qB9v81bFPApczlddbInFKKXvmcZ6WWRzTcg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tCG1I/BLEgku9S0nL/BovljKC++DWVmB8wIXMLx8rT6EUTq/uq5d8hcSiF6OkhEY0oZRwF24zfEVgKwbjdlmuyvbY/0FMfiDF8KYn2fdcnmvwOyCWXHph2myV+v/wUCpomwHyo/9bX1O8h9i7Ijcf/oPQkiB49LbdwS1GGmj0aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWRlkvrC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWRlkvrC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142B01F00A3A;
	Mon,  7 Sep 2026 10:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788776995;
	bh=ze1uk8PX0PcuF9tYa7BjGhbGCemPSb1N2EOynQinSxM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JWRlkvrCjBhV4fR5dZXVgPW+JTfwLcpHyRBrBX5QV9mY6Z2oGORCWFYq9zcGBwiwa
	 /NDu/AJZI5H3yZTLJPRx9jbFkIjW6CkcCMdCQRMUX7VEh87iANN82FiFggwWpfDrhm
	 Eu8zxbcGOxrF1Yg7O1B/FxW9sak8ivoo1tRDcVviyKvwIOzP0StkUAYGAraM4OtVWi
	 Awj1SuRwSnuIve08UrGmQj8JPd8I8Tla+L2UzbHxQHTuwndmKX6sUcMtYIldJjSjFE
	 t30VTmpkbs+UgQvHfl/ky66Z3J3HfOCDdeja5PWZzMoM64/Mc2lREj8m9BIXjay0mo
	 iryV8MtOtQ01A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] iio: adc: ade9000: fix ADE9000 full-scale RMS and
 PCF codes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antoniu Miclaus" <antoniu.miclaus@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260907101623.8730-2-antoniu.miclaus@analog.com>
References: <20260907101623.8730-1-antoniu.miclaus@analog.com>
 <20260907101623.8730-2-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 10:29:54 +0000
Message-Id: <20260907102955.142B01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver defines `ADE9000_ST1_CROSSING_DEPTH` as 25, which limit=
s the bitmap iteration in the IRQ handler, causing `ADE9000_ST1_DIPC_BIT` (=
bit index 25) to be silently ignored and never cleared.
--

commit 656c536a824cd57c69e995fb40cb1db36bf309ee
Author: Antoniu Miclaus <antoniu.miclaus@analog.com>

iio: adc: ade9000: fix ADE9000 full-scale RMS and PCF codes

The ADE9000 chip_info uses full-scale codes that do not match the datasheet.
This commit corrects the RMS and PCF full-scale codes to the values from the
ADE9000 datasheet, fixing a 0.3% reading error on the affected channels.

> diff --git a/drivers/iio/adc/ade9000.c b/drivers/iio/adc/ade9000.c
> index fd1362a980523..0f64bfb221da0 100644
> --- a/drivers/iio/adc/ade9000.c
> +++ b/drivers/iio/adc/ade9000.c
> @@ -677,9 +677,9 @@ static const struct ade9000_chip_info ade9000_chip_in=
fo =3D {
>  	.name =3D "ade9000",
>  	.channels =3D ade9000_channels,
>  	.num_channels =3D ARRAY_SIZE(ade9000_channels),
> -	.rms_full_scale_codes =3D 52866837,
> +	.rms_full_scale_codes =3D 52702092,
>  	.watt_full_scale_codes =3D 20694066,
> -	.pcf_full_scale_codes =3D 74770000,
> +	.pcf_full_scale_codes =3D 74532013,
>  };

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in
ade9000_irq1_thread() with how it handles the interrupts bitmap:

drivers/iio/adc/ade9000.c:ade9000_irq1_thread() {
...
	bitmap_from_arr32(interrupt_bits, &interrupts, ADE9000_ST1_CROSSING_DEPTH);
	for_each_set_bit_from(bit, interrupt_bits,
			      ADE9000_ST1_CROSSING_DEPTH) {
...
}

Since ADE9000_ST1_CROSSING_DEPTH is defined as 25, will this restrict the l=
oop
bounds to bits 0-24, causing bit 25 (ADE9000_ST1_DIPC_BIT) to be completely
ignored?

If userspace enables the DIPC event and the threshold condition is met, bit=
 25
would be set in ADE9000_REG_STATUS1 asserting the IRQ. Because the handler
skips bit 25, the interrupt status bit is never cleared. Would this result =
in
an interrupt storm since the hardware register uses write-1-to-clear logic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907101623.8730=
-1-antoniu.miclaus@analog.com?part=3D1
