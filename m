Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB2E26E710
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 01:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778291349; cv=none; b=BXFp6KAmjgbHh9maQN5kbdq4PnHRb2nGyofeabEtoXOFzyW3UaCX6S+2mbBU1moJqdgXTyHGJKXWsBtNom3NHRtp880DQwNxGaK39En8n97KwWrOuLcPlbibn/P/tBuxQm71f0wuefJTdRVoMknef7t9/8xA7sBAHb1a0X9HR4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778291349; c=relaxed/simple;
	bh=0bzDWs/kyHQNWbIhECqnEIdbwgFJQHjLTNnUjirxkTI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tjLeGBfHeNTwN6c6AcdrN3DbgRIWoMhbhTXM6Dg8JpNSWprDWb43NkdEEuH0zoICjsgUyLZamq0vaH+28JOm3wk8dG8EJoEbk3aJQ/F27nCO4aCzV4YvL4lxl/Inu5vgC3eRWPeGqUonydqxfTU2Z608si9nv9nZ4J7VO09vkq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgBdZ5Jq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgBdZ5Jq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4616CC2BCB0;
	Sat,  9 May 2026 01:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778291348;
	bh=0bzDWs/kyHQNWbIhECqnEIdbwgFJQHjLTNnUjirxkTI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=LgBdZ5JqMCwPAGqgxRnnj1woB+RyBAnTZq6+uZLmqipbC72BH1FmzlsCUqXw5bK2c
	 FpLlazsCF44AwSHbtE2YLy/TPqvGfV2RMwKe9T+evq3wRQDLKzmSsqrkDTIO/6FoFP
	 GQ6OGee86PujFkqzh+LGlNMAuW+oJ45kyyiJnanN9ZeVwPelP3LgBdbNDMbfZpxnEc
	 YoBk5cGry7G2Rj/okz7JcNqftWENpNC5e/THecn5cvqkNVsdJwbZOMYCCJHqf58lQK
	 trg1AjD/csfqoG5eRld3SPfJgB3r8TdeS81+TgxZmUtLY7v7DI+0waclGxmTXO1jPN
	 LHWkMaVoKfZsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 08/10] iio: frequency: ad9910: show channel
 priority in debugfs
Reply-To: sashiko@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260508-ad9910-iio-driver-v4-8-d26bfd20ee3d@analog.com>
References: <20260508-ad9910-iio-driver-v4-8-d26bfd20ee3d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 01:49:07 +0000
Message-Id: <20260509014908.4616CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Missing `.open` callback in debugfs `file_operations` leads to=
 a guaranteed NULL pointer dereference.
- [High] Function prototype mismatch in `file_operations` `.read` callbacks=
 causes build failures and CFI panics.
- [Medium] Register bitmasks are applied to the wrong control registers, le=
ading to corrupted state evaluation.
- [Low] Using `simple_read_from_buffer` with dynamically evaluated string p=
ointers creates a TOCTOU race condition.
- [Low] The strings exposed through debugfs lack a trailing newline.
--

commit f3ad86f1b54a4f67b1e1ded4fa3bd327c17e7ba9
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: show channel priority in debugfs

Expose frequency_source, phase_source and amplitude_source attributes in
debugfs to indicate which channel the specific DDS parameter is being sourc=
ed
from.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index 1fdbaba356d73..d8fe88259f22d 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c
> @@ -2082,6 +2082,170 @@ static int ad9910_setup(struct device *dev, struc=
t ad9910_state *st,
[ ... ]
> +	/* Parallel data port enabled and data destination is frequency */
> +	mode_en =3D FIELD_GET(AD9910_CFR2_PARALLEL_DATA_PORT_EN_MSK,
> +			    st->reg[AD9910_REG_CFR1].val32);

Does this apply a CFR2 mask to a CFR1 register? It seems
AD9910_CFR2_PARALLEL_DATA_PORT_EN_MSK should be evaluated against
st->reg[AD9910_REG_CFR2].

> +	if (mode_en) /* TODO: get destination from backend once it is supported=
 */
> +		return ad9910_channel_str[AD9910_CHAN_IDX_PARALLEL_PORT];
[ ... ]
> +static int ad9910_frequency_source_show(struct file *file, char __user *=
userbuf,
> +					size_t count, loff_t *ppos)

Does the .read callback in struct file_operations require a return type of
ssize_t instead of int? Could this mismatch cause build failures or
Control Flow Integrity (CFI) kernel panics?

> +{
> +	struct iio_dev *indio_dev =3D file->private_data;

Without an .open handler like simple_open(), the VFS and debugfs proxy
layers leave file->private_data initialized to NULL. Does this lead to a NU=
LL
pointer dereference when iio_priv() extracts the state from indio_dev?

> +	const char *src =3D ad9910_frequency_source_get(indio_dev);

Do the static strings returned here lack a trailing newline (\n)? Reading
this file might overwrite or corrupt the user's shell prompt.

> +
> +	return simple_read_from_buffer(userbuf, count, ppos, src, strlen(src));

If userspace performs a partial read and the hardware state changes before
the next read(), could ad9910_frequency_source_get() return a different,
shorter string?

If this occurs, simple_read_from_buffer() would apply the old *ppos to the
new string, potentially returning garbage. Would using seq_file
via DEFINE_SHOW_ATTRIBUTE() safely cache the output buffer upon open()?

> +}
> +
> +static inline const char *ad9910_phase_source_get(struct iio_dev *indio_=
dev)
> +{
[ ... ]
> +	/* Parallel data port enabled and data destination is phase */
> +	mode_en =3D FIELD_GET(AD9910_CFR2_PARALLEL_DATA_PORT_EN_MSK,
> +			    st->reg[AD9910_REG_CFR1].val32);

Is this another case where a CFR2 mask is applied to a CFR1 register?

> +	if (mode_en) /* TODO: get destination from backend once it is supported=
 */
> +		return ad9910_channel_str[AD9910_CHAN_IDX_PARALLEL_PORT];
[ ... ]
> +static int ad9910_phase_source_show(struct file *file, char __user *user=
buf,
> +				    size_t count, loff_t *ppos)

Could this return type also be ssize_t instead of int to match the .read
callback signature?

> +{
> +	struct iio_dev *indio_dev =3D file->private_data;

Does this have the same NULL pointer dereference issue as the frequency show
function due to missing simple_open()?

> +	const char *src =3D ad9910_phase_source_get(indio_dev);
> +
> +	return simple_read_from_buffer(userbuf, count, ppos, src, strlen(src));
> +}
> +
> +static inline const char *ad9910_amplitude_source_get(struct iio_dev *in=
dio_dev)
> +{
> +	struct ad9910_state *st =3D iio_priv(indio_dev);
> +	bool ram_en, mode_en;
> +	u32 destination;
> +
> +	guard(mutex)(&st->lock);
> +
> +	/* OSK enabled */
> +	mode_en =3D FIELD_GET(AD9910_CFR1_OSK_ENABLE_MSK,
> +			    st->reg[AD9910_REG_CFR2].val32);

Does this apply a CFR1 mask to a CFR2 register?

> +	if (mode_en)
> +		return ad9910_channel_str[AD9910_CHAN_IDX_OSK];
> +
[ ... ]
> +	/* Parallel data port enabled and data destination is phase */
> +	mode_en =3D FIELD_GET(AD9910_CFR2_PARALLEL_DATA_PORT_EN_MSK,
> +			    st->reg[AD9910_REG_CFR1].val32);

Is this a third instance of applying a CFR2 mask to a CFR1 register?

> +	if (mode_en) /* TODO: get destination from backend once it is supported=
 */
> +		return ad9910_channel_str[AD9910_CHAN_IDX_PARALLEL_PORT];
[ ... ]
> +static int ad9910_amplitude_source_show(struct file *file, char __user *=
userbuf,
> +					size_t count, loff_t *ppos)

Could this return type also be ssize_t instead of int?

> +{
> +	struct iio_dev *indio_dev =3D file->private_data;

Does this have the same NULL pointer dereference issue as the other show
functions?

> +	const char *src =3D ad9910_amplitude_source_get(indio_dev);
> +
> +	return simple_read_from_buffer(userbuf, count, ppos, src, strlen(src));
> +}
> +
> +static const struct file_operations ad9910_frequency_source_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.read =3D ad9910_frequency_source_show,
> +};

Should this struct include an .open callback, such as simple_open(), to ens=
ure
that file->private_data is initialized correctly before .read is called?

> +
> +static const struct file_operations ad9910_phase_source_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.read =3D ad9910_phase_source_show,
> +};
> +
> +static const struct file_operations ad9910_amplitude_source_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.read =3D ad9910_amplitude_source_show,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-ad9910-iio=
-driver-v4-0-d26bfd20ee3d@analog.com?part=3D8
