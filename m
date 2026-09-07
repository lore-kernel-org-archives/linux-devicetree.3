Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089AF4A8A17
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784615; cv=none; b=lHXiYNIW2jDMsNEO/RK5DSFHSsrdFGcDh86U8Ar9bzYBvzoGZ/dz7m2EvCFV9dFRgt5EyiMumVQwNx+TtQqwzdVUo2Lb0MJ6OtqNTYyawwGddjMiVd8jcc5Tu3srjy/tmfwmAgQYKewOdvKZPqrqm+JqCrhRg08OUr66v4fZyVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784615; c=relaxed/simple;
	bh=bu12A3+EpnmTdHw1QaZSm0zyUiYnMnUVKdjWsD9Im+Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=E8DzOV1QuPUCIO08dBF38d1ex2xWTya9PzRoJEtdWe/eD6X38PluFplvN5H2WHDmlLo2ueTSAfkCh401xGLqx8wEbIIzomsdEM6W0YiBvq9S6GTArnIu19cqMfZPGcKq1wuf25UXUvcYZ5o9w3U87/7OfBgCXhjU8ecwpkA6GzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8lA/GSv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8lA/GSv"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4858303de5dso4344396f8f.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788784610; x=1789389410; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5mnzHFW7DMpvqoHj0dsJatnMDdH7eHxyBfA59/u8a6M=;
        b=L8lA/GSvSxM36/CNzP1l6RV3hQCe8utacHpNahzZnw9fbFbgFMRZI6fy8wDzKftSZu
         2Jh+I+uLrWf8HcJV71P58Lp17DoXLOSkHKVdlECvRvl8UVmfiSLi1pdVVmWLNeOfAvUy
         CVXi7iCXzKIJexVx9OtOiP6J1SJZcB6tr4yep+eZjAgO/JqcLbUjTOY3nxNgE0rCvdPE
         SKsyiLV5YfovQXADUEM8NdJd8y3Il4smx/38H6VQ4p48Fkqie1Q7FVoVSmKTsGY3AEX/
         /mYucIVZ3erYNa9jXFqMod0zBA6j6fwst5ZcZhldjVTeUn3sEOUgcxW2NKeqNTb8mQM/
         n4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784610; x=1789389410;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mnzHFW7DMpvqoHj0dsJatnMDdH7eHxyBfA59/u8a6M=;
        b=KcKPWt9/EsMv6EhoOaeA45n09gB1x3gep9Rt3ItJU4uM1DPLb8jHnULKIQ/35Z0pmc
         NZmx26el53lnn681Gcnnsz6oNV2B11MFPya5SMfZ8AkhNq10eUUWxACF6WnoY3SlIDIc
         edeHQ9hrApkeHH66AsLOUGNfNc13c4J+7mhBBDdRGouV8diCS3sji6i1vUoxNhO9CdbW
         nUBGo/y37aKJWP3NDn0+iAWb970+DpjA/bk3Mm5imt0VGXw4M+GY1yqV9OmuJr2euEJE
         NqvUvHNbrU4lwhk8fci3p31WBQ/ENdJi9GEHUxFkEce5RwNBQ0bdbmCRMeEYGyPdaNmK
         oOrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzj+jAiCvjILBikoXUnGdF+OLJONkuMarbBnDLHY7+olXypqpsLT0QwjHdO4kF41hbydMODp61EMvoW@vger.kernel.org
X-Gm-Message-State: AFuF++knq8EqPkEc9UrR4kDpHPpwSywIW6eUlxoBlsAZhZeyRyiNJ+QY
	skHIjWCjdQzWR5FGcLqr/QHbFA5R4TJE6Jt++jcqUDnzbnEHMQ8Iq9xM
X-Gm-Gg: AYBFou14efxXhAA8utBjz6wX1QKuEnc9Fzf48OHk7UQKLBlGOies3essyu3hK+9/yDg
	YBaNeBOF8JzGAZBe4XSOJRhx+Y03No21MusXL+ylznTQ/I5KEw3pOYLAVcfnVlI/s5hEDAWOdbq
	aRDvuCPURqMMzLS3de5cHY9IcoThA8aR94PX/Abo/7eB9BJAqS49T8cmrShtPSr9sc5YhYasI//
	Ly9eJc5l5K7+X7g/VWg2DqW+DGXaHcPPEiIT5qNew2OsgyS2q3Y9IWqfEjNV4Y7tiI3UxP14jid
	EEThw3qv0ZOWwsA6IL+C+rTKAxDHA7oIFUwdpb5Fdz+LoXpOvngbCukiB7zSQSgqPR0KnzThYYi
	5+T5DmJ0oCLM75g+jyByQHiAQkpmzn6DVf+NA+3fqvGgA3fhv8uRVkOYOb0WL3jY7Np8WOMvS+G
	66RDPRJvr0NQybbOEli1Ulfm2rVF+lMnDnrW03vqIyvRG2LbQSQp5VUk4SuLgZosrHl5y1uazfI
	g==
X-Received: by 2002:a5d:6f1e:0:b0:485:8c16:a32d with SMTP id ffacd0b85a97d-4858c16a54fmr21799546f8f.34.1788784610004;
        Mon, 07 Sep 2026 05:36:50 -0700 (PDT)
Received: from localhost ([2001:4bb8:178:2f30:d3da:48f5:116c:5642])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883927a3sm21920109f8f.11.2026.09.07.05.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:36:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 14:36:47 +0200
Message-Id: <DL93804A11S1.38XDEBTR8ORSH@gmail.com>
Subject: Re: [PATCH v9 4/4] iio: light: veml6031x00: add support for events
 and trigger
Cc: <conor+dt@kernel.org>, <robh@kernel.org>, <devicetree@vger.kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260907-veml6031x00-v9-0-8c93a6c66a4d@gmail.com>
 <20260907-veml6031x00-v9-4-8c93a6c66a4d@gmail.com>
 <20260907120455.7D4801F00A3A@smtp.kernel.org>
In-Reply-To: <20260907120455.7D4801F00A3A@smtp.kernel.org>

On Mon Sep 7, 2026 at 2:04 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Device left in Active Force (AF) mode causes stale data in singl=
e_read
> - [Medium] Spurious I2C read from device configuration register caused by=
 iterating over the timestamp channel
> - [Medium] Software state machine desynchronization leaks interrupt user =
reference on rollback failure
> --
>
> commit 20d504b87ca25179c583e1df1a78eee06d4b1837
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> iio: light: veml6031x00: add support for events and trigger
>
> The device provides a shared interrupt line to notify events and
> data ready.
>
>> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml603=
1x00.c
>> index 3d5a27a0baaed..110f59625a5b1 100644
>> --- a/drivers/iio/light/veml6031x00.c
>> +++ b/drivers/iio/light/veml6031x00.c
> [ ... ]
>> @@ -551,11 +976,83 @@ static int veml6031x00_buffer_postdisable(struct i=
io_dev *iio)
>>  	return 0;
>>  }
>>
>> +static int __veml6031x00_set_trigger_state(struct veml6031x00_data *dat=
a, bool state)
>> +	__must_hold(&data->irq_lock)
>> +{
>> +	int ret;
>> +
>> +	lockdep_assert_held(&data->irq_lock);
>> +
>> +	ret =3D veml6031x00_set_interrupt(data, state);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* The AF bit must be updated before updating AF_TRIG */
>> +	ret =3D regmap_assign_bits(data->regmap, VEML6031X00_REG_CONF0,
>> +				 VEML6031X00_CONF0_AF, state);
>> +	if (ret)
>> +		goto clear_interrupt;
>> +
>> +	ret =3D regmap_assign_bits(data->regmap, VEML6031X00_REG_CONF0,
>> +				 VEML6031X00_CONF0_AF_TRIG, state);
>> +	if (ret) {
>> +		regmap_assign_bits(data->regmap, VEML6031X00_REG_CONF0,
>> +				   VEML6031X00_CONF0_AF, !state);
>> +		goto clear_interrupt;
>> +	}
>> +
>> +	data->trig_en =3D state;
>> +
>> +	return 0;
>> +
>> +clear_interrupt:
>> +	veml6031x00_set_interrupt(data, !state);
>
> [Severity: Medium]
> Does this rollback path cause a state desynchronization if the I2C write =
in
> veml6031x00_set_interrupt() fails?
>
> If the rollback fails, interrupt_users is incremented back to match the
> hardware state, but trig_en remains false. This leaves the software count=
er
> orphaned relative to trig_en, which can permanently prevent the driver fr=
om
> disabling the hardware interrupt in the future.
>
> Can we handle this failure so the interrupt_users count stays synchronize=
d?
>

trig_en does not become desynchronized in this case. It is only updated aft=
er
the complete trigger state transition succeeds. Therefore, when disabling
the trigger fails, it remains true, matching the hardware state. If it
does not fail, then there is no rollback.

...

>> +			if (ret)
>> +				goto done;
>> +		}
>> +	}
>> +
>> +	iio_push_to_buffers_with_ts(iio, scan, sizeof(scan), pf->timestamp);
>> +
>> +done:
>> +	iio_trigger_notify_done(iio->trig);
>> +
>> +	return IRQ_HANDLED;
>> +}
> [ ... ]
>> +static int veml6031x00_hw_init(struct veml6031x00_data *data)
>> +{
>> +	struct regmap *map =3D data->regmap;
>> +	struct device *dev =3D regmap_get_device(map);
>> +	unsigned int val;
>> +	__le16 regval;
>> +	int ret;
>> +
>> +	regval =3D 0;
>> +	ret =3D regmap_bulk_write(map, VEML6031X00_REG_WL_L, &regval, sizeof(r=
egval));
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to set low threshold\n");
>> +
>> +	regval =3D cpu_to_le16(U16_MAX);
>> +	ret =3D regmap_bulk_write(map, VEML6031X00_REG_WH_L, &regval, sizeof(r=
egval));
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to set high threshold\n");
>> +
>> +	ret =3D regmap_field_write(data->rf.int_en, 0);
>
> [Severity: High]
> Does this initialization sequence leave the device stuck in Active Force =
(AF)
> mode?
>
> If the driver is unloaded after using triggered buffers (which sets the A=
F bit
> to 1) and then reloaded, or if a warm reboot occurs with an always-on
> regulator, the hardware retains AF=3D1. Because veml6031x00_hw_init() doe=
s not
> explicitly reset the VEML6031X00_CONF0_AF bit to 0, the device remains in
> Active Force mode.
>
> Subsequent calls to veml6031x00_single_read() do not assert the AF_TRIG b=
it,
> causing the sensor to never execute a new conversion and indefinitely ret=
urn
> stale data.
>
> Should we explicitly reset the AF bit during hardware initialization?
>

I will reset both AF *and* AF_TRIG, because I can see it coming. In
principle, that will be the only change for V10 unless something comes
from other reviewers.

>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D regmap_read(map, VEML6031X00_REG_INT, &val);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to clear interrupts\n");
>> +
>> +	return 0;
>> +}

Best regards,
Javier
