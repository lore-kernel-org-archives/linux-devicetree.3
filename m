Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FE4282F2C
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 22:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783464557; cv=none; b=fQa6UmLAqEH6dzx8oOKC1guVGllyzvwPtZkcL1/0XlT4MYqF2BQ+iWRK1//rfg+hRVJ5YrLCmr1c+krbypjzkq0Sr1Jzkp3nBzunyAM64YhkE/LqxPHPgjPT+4/Rz/XRVIuSV9BPA+o68cASC4AAuVDEyDR2HfWDVzrn6Ku3xxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783464557; c=relaxed/simple;
	bh=aSeJaF7r2G0GVMS2ZS0XnkOYzqBu+fLAkzv6ruj+8xU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EgDeT5rrMHCdWiiS8LRBeDG8vOsdrSSld/EkoalljSzcIE1RMf/51Yl3vlbB1choqY2/G0QUJhgXO4JCNWLhYcMafUIDUSVuM/SZF//PEdmOb97WxOzsFC35MoJMEayfPucUVMJkhcsldy+BUbNxJ0s56kSU3uOAw2+VeKRGqIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+znoGdl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+znoGdl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815D41F000E9;
	Tue,  7 Jul 2026 22:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783464555;
	bh=GV0a1aygTSLJueL15iIhmOI+sYj7HlMhfVv2pC0fa4A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A+znoGdlWBo9RScHwq0krWpaqfBi5tyTiPrREmp8wdHT4+zHeOvdUbxObUPZracmd
	 OrO+C4u2FyZzgtBlbX/S+8aTA6GcYbrZa8fTDFduaeQoAI5ngz/qkFOaAkYP9/V81j
	 PyFWRPxv+7jwFtwqyuIDiTdNsSwT0f5kMOWBpTIcYfRqKfkxBJtKn0Xbugvu1yrehN
	 J/7Dd9lypMBgN3Eu/CpWw9U3DzWvPv1v2FYItGW/w95tcRCmgE6bHGvjRtJUN0LgNz
	 IPyLxlJsdTUIB7h40WCW3XUK5FkOGmCLdFK69tjEFtus0SAGzeXPDMuwse4g8qNZ4r
	 dqtupgWmQYQlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 13/18] media: iris: update buffer requirements based
 on received info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-iris-ar50lt-v6-13-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
 <20260708-iris-ar50lt-v6-13-374f0a46c23b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 22:49:15 +0000
Message-Id: <20260707224915.815D41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] A Time-of-Check-to-Time-of-Use (TOCTOU) vulnerability during share=
d memory packet retrieval allows an attacker-controlled size to cause an ou=
t-of-bounds read of kernel memory.
- [Medium] Unchecked `num_properties > 1` in `iris_hfi_gen1_session_propert=
y_info` will cause parsing failures or state corruption.
- [Medium] Incorrect assignment of `req->count_actual` to `inst->fw_min_cou=
nt` breaks minimum buffer calculations.
- [Low] Returning `-EINVAL` from enum type `enum iris_buffer_type` violates=
 type safety.

Pre-existing issues:
- [High] Pre-existing race condition in firmware response handling leads to=
 Use-After-Free of `inst` on firmware timeout.
--

--- Patch [13]: [PATCH v6 13/18] media: iris: update buffer requirements ba=
sed on received info ---
commit 040bc4bd721ac68f0b5e1bd2726f98e4064f7387
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

media: iris: update buffer requirements based on received info

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/=
drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 23fc7194b1e3a..896953ea62ea4 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -533,6 +533,79 @@ static void iris_hfi_gen1_session_ftb_done(struct ir=
is_inst *inst, void *packet)
>  	dev_err(core->dev, "error in ftb done\n");
>  }
> =20
> +static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *in=
st, u32 type)
> +{
> +	switch (type) {
> +	case HFI_BUFFER_INPUT:

[ ... ]

> +	case HFI_BUFFER_INTERNAL_PERSIST:
> +		return BUF_ARP;
> +	default:
> +		return -EINVAL;

[Severity: Low]
Does returning -EINVAL violate type safety for the unsigned enum
iris_buffer_type?

Since the enum constants are typically represented as unsigned, this negati=
ve
value causes an implicit cast to a large unsigned integer.

> +	}
> +}
> +
> +static void iris_hfi_gen1_session_buffer_requirements(struct iris_inst *=
inst,
> +						      void *data, size_t size)
> +{
> +	struct hfi_buffer_requirements *req;
> +
> +	if (!size || size % sizeof(*req))
> +		return;
> +
> +	for (req =3D data; size; size -=3D sizeof(*req), req++) {
> +		enum iris_buffer_type type =3D iris_hfi_gen1_buf_type(inst, req->type);
> +
> +		if (type =3D=3D -EINVAL)
> +			continue;
> +
> +		/* on relevant platforms hold_count and min_count are swapped */
> +		inst->buffers[type].min_count =3D req->hold_count;
> +		inst->buffers[type].size =3D req->size;
> +
> +		if (type =3D=3D BUF_OUTPUT)
> +			inst->fw_min_count =3D req->count_actual;

[Severity: Medium]
The code tracks the strict minimum buffer count required by the hardware.
Since hold_count and count_min are swapped on these platforms, does
assigning req->count_actual here artificially inflate the minimum required
buffer count?

This seems to contradict logic elsewhere in the driver that relies on
count_min.

> +	}
> +}
> +
> +static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, =
void *packet)
> +{
> +	struct hfi_msg_session_property_info_pkt *pkt =3D packet;
> +
> +	if (!pkt->num_properties) {
> +		dev_err(inst->core->dev, "error, no properties\n");
> +		goto out;
> +	}
> +
> +	switch (pkt->property) {
> +	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
> +		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
> +							  pkt->shdr.hdr.size - sizeof(*pkt));

[Severity: Medium]
If the firmware sends an HFI_MSG_SESSION_PROPERTY_INFO packet with multiple
properties, does this code incorrectly assume the entire remaining payload
belongs to the first property?

Passing the full size could cause the loop in
iris_hfi_gen1_session_buffer_requirements() to misinterpret subsequent
property IDs and data as buffer constraints.

[Severity: High]
Could an out-of-bounds read occur if the firmware races to forge
pkt->shdr.hdr.size in shared memory?

If the size field is reread after the initial bounds check during memcpy,
trusting this size to calculate the payload length might cause the loop in
iris_hfi_gen1_session_buffer_requirements() to read beyond the bounds of
kernel memory.

> +		break;
> +	default:
> +		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
> +	}
> +
> +out:
> +	complete(&inst->completion);
> +}
> +

[ ... ]

> @@ -657,7 +730,7 @@ static void iris_hfi_gen1_handle_response(struct iris=
_core *core, void *response
>  		} else if (hdr->pkt_type =3D=3D HFI_MSG_SESSION_FILL_BUFFER) {
>  			iris_hfi_gen1_session_ftb_done(inst, hdr);
>  		} else if (hdr->pkt_type =3D=3D HFI_MSG_SESSION_PROPERTY_INFO) {
> -			complete(&inst->completion);
> +			iris_hfi_gen1_session_property_info(inst, hdr);
>  		} else {

[Severity: High]
This is a pre-existing issue, but can this lead to a Use-After-Free if a
video device close operation runs concurrently due to a firmware timeout?

If iris_get_instance() returns a raw pointer without incrementing a refcoun=
t:

iris_get_instance() {
    ...
    return inst;
}

And iris_close() concurrently removes and frees the memory:

iris_close() {
    ...
    iris_remove_session(inst);
    mutex_unlock(&inst->lock);
    ...
    kfree(inst);
}

Will iris_hfi_gen1_handle_response() subsequently acquire inst->lock on a
freed object before calling iris_hfi_gen1_session_property_info()?

>  			struct hfi_msg_session_hdr_pkt *shdr;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-iris-ar50l=
t-v6-0-374f0a46c23b@oss.qualcomm.com?part=3D13
