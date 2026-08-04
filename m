Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C76E485CE1
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865022; cv=none; b=uhziMi+fuwh0LlMikQ92Wsl6FYxKV6gpYVR55BNN6rKeuWAFFGP4Bv+9jVGquakVX3q6DPxzZxANXUaPiN/0Vmv4rzR0jNkws9u8Nj9GPgxhsKCI9frfWeRD+ZW0K3xGhlJxhKwkrT1IuU0R/t3G6/aU4cURncN38f3kX+qNXCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865022; c=relaxed/simple;
	bh=jjAqszaWmLUVQbeU8+DT9KBhox48FATSmWVOPnQUnJo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F2cEWAp/JVrzEUOxydBVoNZVJhPGLhSS8CcQFsDewTGO/aWCyHP1x39sf9QStww2OkNL9oobo4BfkzOoSSBMl9kj2ENAv9LYijOhqLbjqdM/I1yGdp42NgvOhiYfEoBggIOjlh39BI3B3n2Neq05t2rNJCMKeze/EoksYQmiiwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKZwLjIg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKZwLjIg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799FC1F000E9;
	Tue,  4 Aug 2026 17:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785865020;
	bh=WZLvU8TMiHl2cl6mpOmI2juEgP11OMXEYaKR2VxMy2c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SKZwLjIgPi/u7HAnIFrxFWPVD0zh+7DhydnjOhRB3O1n4ZzJR//oIFJNXH6565h7r
	 dTwe0XppcJ4AXe+a1BlUrwIMUNg++Tnqpr3OHJERMMsqP5LYk60dotmZSGMLoNX4B+
	 9qD7js7QnK5T6ec9RYO5xTp3VS9+C2vOdBP0B4djuOEelTNmhJSML+LJBF39yMtz/a
	 zhNcNVFEjM5R/v9sHcjZRCH7dS0mll0GRkaTfLBZ/kh+t4OTYDpyO/CnHuSXFPmLsK
	 eqmOGynkABUKkwpLZyH4/cPRfxWwq0gyWtjJz+lvcNFYSfEUo4apgIWbrUTCFREtqB
	 1Ip4EBr6JOwYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] iio: light: ltr501: Power down chip if request
 irq fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804-liteon-ltr329-v3-4-c6b768c7c745@geanix.com>
References: <20260804-liteon-ltr329-v3-0-c6b768c7c745@geanix.com>
 <20260804-liteon-ltr329-v3-4-c6b768c7c745@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 17:36:58 +0000
Message-Id: <20260804173659.799FC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized kernel stack memory is leaked to userspace and funct=
ional behavior is broken on Big Endian architectures due to `regmap_bulk_re=
ad()` reading into a 4-byte `int`.
- [Medium] Data race (TOCTOU) on `data->als_contr` and `data->ps_contr` bet=
ween raw sysfs reads and writes.
- [Medium] Data race on `data->als_period` and `data->ps_period` between sy=
sfs event writes and sysfs raw writes.
--

--- Patch [4]: [PATCH v3 4/6] iio: light: ltr501: Power down chip if reques=
t irq fails ---
commit 9f4c589a7c5ec63bde9127853783856ae3e751dd
Author: Esben Haabendal <esben@geanix.com>

iio: light: ltr501: Power down chip if request irq fails

This patch updates the error handling in ltr501_probe() when
devm_request_threaded_irq() fails. It ensures the chip is powered down by
jumping to the powerdown_on_error label and removes a duplicate error messa=
ge.

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index 7d045be78c6df..b36bd10a02624 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c
> @@ -1537,11 +1537,8 @@ static int ltr501_probe(struct i2c_client *client)
>  						IRQF_ONESHOT,
>  						"ltr501_thresh_event",
>  						indio_dev);
> -		if (ret) {
> -			dev_err(&client->dev, "request irq (%d) failed\n",
> -				client->irq);
> -			return ret;
> -		}
> +		if (ret)
> +			goto powerdown_on_error;
>  	} else {
>  		indio_dev->info =3D data->chip_info->info_no_irq;
>  	}

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem with
uninitialized memory when reading data on Big Endian architectures.=20

In ltr501_read_thresh():

        int ret, thresh_data;
        ...
        ret =3D regmap_bulk_read(data->regmap, LTR501_ALS_THRESH_UP,
                               &thresh_data, 2);
        if (ret < 0)
                return ret;
        *val =3D thresh_data & LTR501_ALS_THRESH_MASK;

And in ltr501_trigger_handler():

        int ret, psdata;
        ...
        ret =3D regmap_bulk_read(data->regmap, LTR501_PS_DATA,
                               &psdata, 2);
        if (ret < 0)
                goto done;
        scan.channels[j++] =3D psdata & LTR501_PS_DATA_MASK;

Could this leak up to 2 bytes of uninitialized kernel stack memory to users=
pace
and result in data loss on Big Endian systems? The regmap_bulk_read() call
reads 2 bytes into the MSB of the 32-bit int variables and then the code ma=
sks
the uninitialized LSBs.

Similarly, in ltr501_write_thresh():

        ret =3D regmap_bulk_write(data->regmap, LTR501_ALS_THRESH_UP,
                                &val, 2);

Would this write the upper 2 bytes of the 32-bit integer on Big Endian syst=
ems,
silently passing incorrect zeroes to the hardware?

[Severity: Medium]
This is a pre-existing issue, but is there a data race on data->als_contr
between raw sysfs reads and writes?

In ltr501_read_raw(), data->als_contr is read locklessly:

        i =3D (data->als_contr & data->chip_info->als_gain_mask)
             >> data->chip_info->als_gain_shift;

While in __ltr501_write_raw(), it performs a non-atomic read-modify-write:

        data->als_contr &=3D ~info->als_gain_mask;
        data->als_contr |=3D i << info->als_gain_shift;

Can a concurrent read (via sysfs) during a write observe an intermediate
configuration state, leading to the driver temporarily reporting an incorre=
ct
scale factor to userspace?

[Severity: Medium]
This isn't a bug introduced by this patch, but is there a data race on
data->als_period between sysfs event writes and sysfs raw writes?

In ltr501_write_intr_prst():

        mutex_unlock(&data->lock_als);
        if (ret >=3D 0)
                data->als_period =3D period;

And in __ltr501_write_raw():

        ret =3D ltr501_write_intr_prst(data, chan->type,
                                     0, data->als_period);

Does updating data->als_period outside of the mutex lock in
ltr501_write_intr_prst() leave it unprotected against concurrent event writ=
ers
or lockless readers like __ltr501_write_raw()?

Could this lead to stale or inconsistent values being used to configure the
hardware, potentially setting incorrect sampling frequencies or interrupt
persistence counts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-liteon-ltr=
329-v3-0-c6b768c7c745@geanix.com?part=3D4
