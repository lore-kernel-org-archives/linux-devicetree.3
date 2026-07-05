Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6383636E494
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 11:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783252240; cv=none; b=tqhagOXNJSJoUKUUCQpjXXxC6a9nYCt28VZ0nCbB3FQSXNgvedFKPlRIU0cEkae1nsGani8B9evaBtt5e6EVw4uhC+TTn36fcPjGFoAD9BzDB6DtUppDLGtuCx0sFyCgjMG8z0uakX8Y9YYEO+MSxiE68oVhnhCn9qve4TMDULw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783252240; c=relaxed/simple;
	bh=8n6Rmu8LsBmzgbImEvRwT5Tv9vaKQzagi0rwqPkveJw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MpSfD0dhlYs1ojWWYdOyBWU/2WB2bJIyPMxQtopBHAVhSe7bfB+8EoSZKf2LLUAc6iUCGNo8kBC6avvzp99OYS0sHJEv+UjbE4EOMhOrfpvS/vUAi/JfCZCKPwW5I5kJ1X2KoM8WEsvU4juDQA27DLVvhjmsC/Benew0c1YNrjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HssKdGGi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HssKdGGi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DFB1F000E9;
	Sun,  5 Jul 2026 11:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783252239;
	bh=A1zYfzRf8kAjIQrhp7jz67PYQh2TAA80DluA8df1pe4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HssKdGGizDVP5qCiodX2PVwWdwnxMX+rhELVee1NRn7KH2s9ozScV/a9QY4Yv8wqa
	 HwbubwrxQZDYmYfOHEcdbQGh91TQ0kEsA6WIx9t+snRkX7yEzH517O1g+6NU7t6Yrg
	 tm6Qz6XjLE+ZpvYOtw1B68lth5YK2Lvcuye9+BYXXKA7wAyFl9m1UR35FqUztrIzfv
	 DFk/VBdO40xpwL27ga923dF7iR1uE4XZtKx4F3S9b0DDTiE5gr3OOdx2W35p38YM+5
	 6zxsMFbTw+Qw+u9AtSxDm5V62yE4I2G0rXE32uN/1UGFt/XzkbOFNhrN7uQ1HIvX77
	 RGzg3rkPJjGsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/6] iio: dac: ad5686: add gain control support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260705-ad5686-new-features-v6-6-269594c7aae5@analog.com>
References: <20260705-ad5686-new-features-v6-0-269594c7aae5@analog.com>
 <20260705-ad5686-new-features-v6-6-269594c7aae5@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 11:50:38 +0000
Message-Id: <20260705115038.D8DFB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Setting double_scale for AD5683_REGMAP SPI devices inadvertently t=
riggers a hardware software reset.
--

commit 4e6717d62a587bcb6ce7e79580f4db51a50f4e5d
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: dac: ad5686: add gain control support

This commit adds support for gain control on AD5686 and related DACs. It
adds a double_scale flag and updates the control sync functions to configure
the GAIN pin or the internal gain control bit accordingly.

> diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
> index 3120e6983d9e4..9165ee07646a0 100644
> --- a/drivers/iio/dac/ad5686.c
> +++ b/drivers/iio/dac/ad5686.c
[ ... ]
> @@ -50,7 +54,8 @@ static int ad5683_control_sync(struct ad5686_state *st)
> =20
>  	return ad5686_write(st, AD5686_CMD_CONTROL_REG, 0,
>  			    FIELD_PREP(AD5683_PD_MSK, pd_val & AD5686_PD_MSK) |
> -			    FIELD_PREP(AD5683_REF_BIT_MSK, st->use_internal_vref ? 0 : 1));
> +			    FIELD_PREP(AD5683_REF_BIT_MSK, st->use_internal_vref ? 0 : 1) |
> +			    FIELD_PREP(AD5683_GAIN_BIT_MSK, st->double_scale ? 1 : 0));

[Severity: High]
Could setting this gain bit inadvertently trigger a hardware software reset=
 on
SPI devices?

AD5683_GAIN_BIT_MSK is defined as BIT(11) in ad5686.h. When this value is
passed to the SPI backend, ad5686_spi_write() unconditionally shifts all
AD5683_REGMAP values left by 4 bits:

drivers/iio/dac/ad5686-spi.c:ad5686_spi_write()
    cpu_to_be32(FIELD_PREP(AD5686_CMD_MSK, cmd) |
                FIELD_PREP(AD5683_DATA_MSK, val));

Since AD5683_DATA_MSK is GENMASK(19, 4), the gain bit at position 11 gets
shifted to position 15. According to the AD5683 datasheet, DB15 of the Cont=
rol
Register is the Software Reset bit.

Does the SPI backend need to be adjusted so that control register writes ar=
en't
improperly shifted?

>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-ad5686-new=
-features-v6-0-269594c7aae5@analog.com?part=3D6
