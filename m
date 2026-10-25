Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792899894;
	b=dP8Q6tWTqoRYb/Dt88vnLn0y8iv2VMlBXA3JjVVTIQQcDwSfKQA6PHx2Ey/5yYo2RCbA
	 hwgwsd0htzYlWoSSzUqnsW9Qa222MvszoxgZly95Tut3x0nPigOTRsVEBNL1fCkxWPkFw
	 iQm30frgUnvPS29XgemUHjjB9RxXUjVnLCpnVURSImqRgxbnFmA6ayYhACuLNRPYKvOIB
	 8EcmJFd3V9Zb7JnZtJ9J2xkSmQiPoiXncwK5CaGQYFsoywrDmPqfAgg6qrWCIgPrhgHfy
	 EH50wBoYsB3sQG7uH1AoBi2UWwoCg4Zv8gzqwQfycA/bdXRA1cLKGh+1ERgywZYQEEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792899894;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=04Aa1UWoYBk/386uOW/AdhSWVgGEI5LqU0bsisYlue4=;
	b=nYYd2qrhJ85Z+z3g6ba0w6gHhgX5QiQuo4Z68e+lHzNDof7bCxE0MQoJQWHgEB7bRnAz
	 AbiZCBIBDUMgeAivDfgEyu38PB38E987v7WG0IxfnZ2WQNoQ0EN9/ZcTJEV/KkAay3T5D
	 26HDzM0zcYmAucEJOXuEGk5vSoEPvVxsV3X4rY0XD1P6wInYuBGy8Rxrsy0u7P1Jxa7as
	 7fOxTTB9V2XjM+f4VY+LjRmV24Q3oxqSWEfEKfQZFf48x0kmSw9vija2rMefkBRC57GLK
	 f8Pg72Zi39uYAOSLFv1mSKgwt1JPEeZBTZvHzbi747+9guq4F3BPpaXmXA+eB7fSoIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWZqzkMf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E88606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWZqzkMf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 737F21F01825;
	Sun, 25 Oct 2026 03:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792899893;
	bh=04Aa1UWoYBk/386uOW/AdhSWVgGEI5LqU0bsisYlue4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KWZqzkMfG41rk3tnLHuNf7z4kXf1r2BZt1wFgRRyXGDp/avlJVKRmnWO0dsMrY62k
	 0b9ynfeG1p6HE0kmtRrq2UHiE1jw2ZW5opJGL8Cdjpdtr2VdJyTd6PN70hyW/64y5b
	 fROuoGx+hZrd8GsNhSPHu8w9D2b2JoURbnzS2mThdbXwm9uryx4iH54Pk1bzkKh7Ap
	 XIdFamA5pehSk75+axLEvnyQIsbfR7pUeKGt1gzxqcWl0JouPuUrNa3BnTbrmqRv7q
	 6NuYKkLFXo7g9AGpByUA8z5vwNfqMX4aWFFyHJAQ5kqPsp6+irtliRPO63hDtefSfW
	 I4iO0JQ8b5YNw==
Message-ID: <sashiko-outbox-184026@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 08/14] media: qcom: camss: csid: Add support for
 CSID 1080
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hangxiang Ma" <hangxiang.ma@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261024-kaanapali-camss-v22-8-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-8-7da3ea49c8a1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 03:44:53 +0000
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
- [High] media: qcom: camss: out-of-bounds fmt[] read in __csid_configure_r=
di_stream()
- [Medium] media: qcom: camss: unsynchronized aup_update and rup_update in =
csid-1080
--

commit 1c1d5d42b8b4ca9551e5451d2fb39377493b3ca8
Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

media: qcom: camss: csid: Add support for CSID 1080

This commit adds hardware resource definitions, register programming, reset
handling, and interrupt handling for the CSID 1080 module found on the
Kaanapali SoC. It also extends the CSID interface to support separate RUP a=
nd
AUP update registers committed via a shared SET register.

> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/driver=
s/media/platform/qcom/camss/camss-csid-1080.c
> new file mode 100644
> index 0000000000000..9830fa0f8d24e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
> @@ -0,0 +1,402 @@

[ ... ]

> +#define MSM_CSID_MAX_SRC_STREAMS_1080		(csid_is_lite(csid) ? 4 : 5)

[ ... ]

> +static void __csid_aup_rup_trigger(struct csid_device *csid)
> +{
> +	/* trigger SET in combined register */
> +	writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
> +}
> +
> +static void __csid_addr_update(struct csid_device *csid, int port_id)
> +{
> +	csid->aup_update |=3D CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->aup_update, csid->base + CSID_AUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_addr_update_clear(struct csid_device *csid, int port_=
id)
> +{
> +	csid->aup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +}
> +
> +static void __csid_reg_update(struct csid_device *csid, int port_id)
> +{
> +	csid->rup_update |=3D CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->rup_update, csid->base + CSID_RUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_reg_update_clear(struct csid_device *csid, int port_i=
d)
> +{
> +	csid->rup_update &=3D ~CSID_RUP_AUP_RDI(port_id);
> +}

[Severity: Medium]
Can concurrent updates to csid->aup_update and csid->rup_update race with
csid_isr()?

During streaming, vfe_queue_buffer_v2() and vfe_enable_output_v2() in
drivers/media/platform/qcom/camss/camss-vfe.c call ops->addr_update(),
ops->reg_update(), ops->addr_update_clear(), and ops->reg_update_clear()
while holding vfe->output_lock.

However, csid_isr() in drivers/media/platform/qcom/camss/camss-csid-1080.c
clears those same bitmasks in hardirq context when INFO_RUP_DONE is set,
without holding vfe->output_lock or any CSID-level spinlock:

drivers/media/platform/qcom/camss/camss-csid-1080.c:csid_isr() {
	...
			if (val & INFO_RUP_DONE) {
				__csid_addr_update_clear(csid, i);
				__csid_reg_update_clear(csid, i);
			}
	...
}

In addition, csid_configure_stream() calls __csid_addr_update() and
__csid_reg_update() in process context without holding a lock after
vfe_enable_output_v2() has already set output->state to VFE_OUTPUT_ON and
while csid->irq is enabled.

Could these unsynchronized read-modify-write operations on csid->aup_update
and csid->rup_update, along with the writes to CSID_AUP_CMD, CSID_RUP_CMD,
and CSID_RUP_AUP_CMD, clobber a newly set RDI bit or write a just-cleared R=
DI
bit back into the command registers?

[ ... ]

> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 port, u8 vc)
> +{
> +	u8 lane_cnt =3D csid->phy.lane_cnt;
> +	u32 val;
> +
> +	/* Source pads matching RDI channels on hardware.
> +	 * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
> +	 */
> +	struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_PAD_FIR=
ST_SRC + port];
> +	const struct csid_format_info *format =3D csid_get_fmt_entry(csid->res-=
>formats->formats,
> +								   csid->res->formats->nformats,
> +								   input_format->code);

[Severity: High]
Does __csid_configure_rdi_stream() read past the end of csid->fmt[] when
configuring the fifth stream on non-lite CSID 1080 instances?

For non-lite CSID 1080 instances (CSID0, CSID1, and CSID2 in
csid_res_kaanapali), MSM_CSID_MAX_SRC_STREAMS_1080 evaluates to 5. In
csid_configure_stream(), the loop iterates i from 0 to 4 and calls
__csid_configure_rdi_stream(csid, enable, i, 0) when BIT(i) is set in
csid->phy.en_vc.

However, in drivers/media/platform/qcom/camss/camss-csid.h, MSM_CSID_PADS_N=
UM
is still defined as 5:

#define MSM_CSID_PAD_SINK 0
#define MSM_CSID_PAD_FIRST_SRC 1
#define MSM_CSID_PADS_NUM 5

struct csid_device {
	...
	struct media_pad pads[MSM_CSID_PADS_NUM];
	...
	struct v4l2_mbus_framefmt fmt[MSM_CSID_PADS_NUM];
	...
};

When port is 4 (RDI4), MSM_CSID_PAD_FIRST_SRC + port evaluates to 5, which =
is
one element past the end of the 5-element csid->fmt[] array. In addition,
msm_csid_register_entity() in drivers/media/platform/qcom/camss/camss-csid.c
only initializes MSM_CSID_PADS_NUM pads on the media entity, leaving RDI4
without a source media pad.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-kaanapali-=
camss-v22-0-7da3ea49c8a1@oss.qualcomm.com?part=3D8
