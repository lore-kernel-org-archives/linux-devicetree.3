Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD404A482C
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005528; cv=none; b=tW5+quDLpJTlpbBnJZzalJ/mNdVTvbwUx8D3tzany+ezO8fgmDBbZDogcmC38OdBbgrQHvbToRUo8GRTndkuUwPOXP7RSyEdk+o/3r3zWCRm9SmTKbk28TOpUj0tNHvoMgEVwifnljwNFxSXnUcnzULQyzMKCbNBHRy9OSumAiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005528; c=relaxed/simple;
	bh=4eBc7mWYjtCqQNkdWCtQOaqEDiWm3jaez8nSnOt0qAg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QAyhJ2elXlyOwPJUzwWg7+g2CCPYRuJy/H4j9IYMNc4ulR7gA3f2IONDQpV7WTE4iHMjmpuWWQ8qeX4fxEJ13wzPGe14v92PyW5ATW44nf2Q6iw1fJ4HEh7VsizQg52ESvuxe/kFSeD9M5jC2i2XG5gPo3jf0VOXG8OdGoogvB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bkby5BNo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bkby5BNo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532E31F000FF;
	Mon, 21 Sep 2026 15:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790005525;
	bh=/weIVZ0h6+144uZ5OrRqQb4VYlMp8j62TdnDJqUaZzU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bkby5BNouEV1emh4CBxWU3g2T+hEQmVZg/41wB5nwgnkNdtvJWSnWmNuMC5OBUcWI
	 qNsbRd3zck0zUpf5CXbWJWDlkT5fYuwm9EOfOEtF4wl1M0XbX6qrA7klYypMRyOVuW
	 402vXx61ui6EJx8Vos45xqRuaEigVd8XLZffoFbTl5CZhaL10yhdbAEwGar9DTxkfs
	 utJsTAjkoJvQpiPziijmuUCzEi5HW8Lb4+5TStWwo/aHmTyWqk+SolXPis/UvjJjmN
	 z3Bbpm14O9R4JhGrcxVK8vTXajSgdrwZ99i8TylBu0macHtlB4XUxe8kXhnHqrdJL2
	 VI6xGEszjnKLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/9] media: Documentation: uapi: Add qcom-camss ISP
 params documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260921-camss-isp-ope-v8-5-dd1c86a3c8a0@oss.qualcomm.com>
References: <20260921-camss-isp-ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com>
 <20260921-camss-isp-ope-v8-5-dd1c86a3c8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 15:45:24 +0000
Message-Id: <20260921154525.532E31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] doc: userspace example crashes under _FORTIFY_SOURCE due to __co=
unted_by
--

commit 051ac0c97fb5f4276626ca22d484402bd8d6a07a
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

media: Documentation: uapi: Add qcom-camss ISP params documentation

Add documentation for the Qualcomm CAMSS ISP parameters metadata format.
The patch defines parameter structures and includes a code example to
illustrate populating the buffer for the OPE processing pipeline.

> diff --git a/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst b=
/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
> new file mode 100644
> index 0000000000000..5e1fd5814ff78
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst

[ ... ]

> +	struct v4l2_isp_params_buffer *params =3D
> +		(struct v4l2_isp_params_buffer *)buffer;
> +
> +	params->version =3D V4L2_ISP_PARAMS_VERSION_V1;
> +	params->data_size =3D 0;
> +
> +	void *data =3D (void *)params->data;
> +
> +	struct camss_params_wb_gain *wb =3D
> +		(struct camss_params_wb_gain *)data;
> +
> +	memset(wb, 0, sizeof(*wb));
> +	wb->header.type =3D CAMSS_PARAMS_WB_GAIN;
> +	wb->header.flags =3D V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> +	wb->header.size =3D sizeof(struct camss_params_wb_gain);
> +
> +	/* Unity gain on all three channels (15uQ10, 1024 =3D 1.0) */
> +	wb->g_gain =3D 1024;
> +	wb->b_gain =3D 1024;
> +	wb->r_gain =3D 1024;
> +
> +	data +=3D sizeof(struct camss_params_wb_gain);
> +	params->data_size +=3D sizeof(struct camss_params_wb_gain);

[Severity: Medium]
Could this example code crash userspace applications compiled with modern
compiler protections like _FORTIFY_SOURCE=3D3?

The v4l2_isp_params_buffer struct uses the __counted_by(data_size) attribute
for its data flexible array. Setting data_size to 0 and then writing to the
array elements (via memset) before updating data_size will cause dynamic
object size tracking to see an allocation of size 0, leading to a runtime
bounds-checking abort.

Additionally, does this snippet rely on non-standard pointer arithmetic?

The data pointer is declared as a void *, and incrementing it directly
using data +=3D sizeof(struct camss_params_wb_gain) is a GCC extension rath=
er
than standard C.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-camss-isp-=
ope-v8-0-dd1c86a3c8a0@oss.qualcomm.com?part=3D5
