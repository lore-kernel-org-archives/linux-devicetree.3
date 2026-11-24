Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541592;
	b=gsLjEjxgureqvhTQ5Q+Zc7FndRnf/felwqlT0pHSngweaYVxvDdgNB5s5kVzmsjVmCeN
	 yYim4kr3KNfqaU46n35I6jY7NKl7YXDQtg4/UKFEH38SSs3oqayDqWbW/OxxxsXFkOfpM
	 xibJEwJP57hUw6RPgHARt83dxdtyzQKlQbq1mnGVvxTDBFdW0xkLKZIt0VnBbi0sxWetU
	 sDSOQjGRufvRoFnw+Vxb9eZf6rX6LZWvEW0aLZHaY3rgu8NNhT7q4XBPrgft1j7I95Cku
	 AiVWg6HHKE008qqToiO35kfHlCewx4Rx43bkUoYv4ARPA452moo15Cl9bdefcIkfE8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541592;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=o5U2eMZXMEGvf8tATsUAjiB+YYaG3+LXXehgfMHJpQo=;
	b=YFnqgqBSqbVqYPvWUhd+QVTTJPHfCVEJAFUZ5tP+N/T3CV2mAnNxui+2Ye1acLNlkUkf
	 t7b4qCrhSnIJwa3TakH40vAc9Otz86lm2UiDXzDH+CSm+X/0avoW4ho6uhS2Sewc6OtRH
	 41itgL6wKj6KstdZpo377KL/qm/a9gPltTlRAuy9KyGSscG6YYG2wWnNXIWoTlyW0KdwF
	 h/LDBmKs4w63+ioGIwckT9LtT85L4FRvHJk4cz7ZNKeKJbZoy6pO4j1z/iYEamcEk5/y8
	 6/xXexPoYu/WoJVHZfAtWK9YLoI3MQI5a8mYtdS9bPjUA/NG62MzPZzOHi9IGer/2Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JR7ECrpC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15912606A329
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JR7ECrpC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0B11F000EE;
	Tue, 24 Nov 2026 17:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795541591;
	bh=o5U2eMZXMEGvf8tATsUAjiB+YYaG3+LXXehgfMHJpQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JR7ECrpCCFHlY3IebZPG9mB066oJJLdQ8lraEa+PjfdZZD/S33edUiPWsNp+sPSab
	 1AOntl4oMB3TZCb+SIgXwP0j/udowVR72vWLVEvUBHzZn5gStCv6hd65cvUwA5l7y8
	 hqLAI+GJvIi6MJ1ROCGsbK7d9TLpaQZGIVNn4Q851xRGN2e6+xACUhsq2/+fxbc6Zu
	 /dCRmiWOjWqKp2ec3gQW1w5fFe9awTew7uYQfKKA5syS0ZQYXwH5jJvNqumC+R8UUG
	 fpv7nHF27cl8DwAeFDa50rfO/jMH3SCP8lMt8jotiest4FuKCFyykUROD1oaRLniSn
	 ++YPx8gilpbFg==
Message-ID: <sashiko-outbox-231707@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 21/24] media: uapi: Add parameter structs to
 mali-c720-config.h
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anthony McGivern" <anthony.mcgivern@arm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-21-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-21-0cb9bde1bd30@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:33:10 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Low] media: uapi: implicit trailing padding in mali-c720 parameter
  structs
- [Low] media: uapi: undocumented MALI_C720_PARAM_BLOCK_MAX in
  kernel-doc
- [Low] media: uapi: missing kernel-doc on mali_c720_params_*_mask enums
--

commit e1aa4f73c1087846692d06506ff1d937ae9e0835
Author: Anthony McGivern <Anthony.McGivern@arm.com>

media: uapi: Add parameter structs to mali-c720-config.h

This commit adds the UAPI parameter block structures, mask enums, and
V4L2_CID_MALI_C720_PARAM_CAPABILITIES control ID to mali-c720-config.h.

> diff --git a/include/uapi/linux/media/arm/mali-c720-config.h b/include/ua=
pi/linux/media/arm/mali-c720-config.h
> index 445cae09a84cc..f200380f3c2c8 100644
> --- a/include/uapi/linux/media/arm/mali-c720-config.h
> +++ b/include/uapi/linux/media/arm/mali-c720-config.h

[ ... ]

> @@ -179,6 +181,558 @@ struct mali_c720_stats_histogram {
>  	 sizeof(struct mali_c720_stats_histogram) +		\
>  	 sizeof(struct mali_c720_stats_histogram))
> =20
> +/**
> + * enum mali_c720_param_block_type - Mali-C720 parameter block targets
> + *
> + * @MALI_C720_PARAM_BLOCK_DIGITAL_GAIN_INP: Digital gain for the input p=
ipeline.
> + * @MALI_C720_PARAM_BLOCK_HISTOGRAM_INP: Histogram configuration for the=
 input pipeline.
> + * @MALI_C720_PARAM_BLOCK_AWB_GAINS_HV: Auto-white balance gains for the=
 HV pipeline.
> + * @MALI_C720_PARAM_BLOCK_HISTOGRAM_HV: HV histogram configuration (pre-=
Iridix).
> + * @MALI_C720_PARAM_BLOCK_HISTOGRAM_HV_IRIDIX: HV histogram configuratio=
n (post-Iridix).
> + * @MALI_C720_PARAM_BLOCK_COLOR_STATS_HV: Color stats configuration for =
the HV pipeline.
> + * @MALI_C720_PARAM_BLOCK_BLACK_LEVEL_HV: Black level offsets for the HV=
 pipeline.
> + * @MALI_C720_PARAM_BLOCK_SQRT_INP: Square root configuration for the in=
put pipeline.
> + * @MALI_C720_PARAM_BLOCK_SQUARE_A_HV: Square A configuration for the HV=
 pipeline.
> + * @MALI_C720_PARAM_BLOCK_SQUARE_B_HV: Square B configuration for the HV=
 pipeline.
> + * @MALI_C720_PARAM_BLOCK_SQRT_HV: Square root configuration for the HV =
pipeline.
> + * @MALI_C720_PARAM_BLOCK_DECOMPANDER_INP: Decompander configuration.
> + *
> + * Each identifier selects one logical module and instance. Applications=
 can
> + * query V4L2_CID_MALI_C720_PARAM_CAPABILITIES for the targets present o=
n the
> + * device. The control returns a read-only U16 array of supported identi=
fiers.
> + */
> +enum mali_c720_param_block_type {
> +	MALI_C720_PARAM_BLOCK_DIGITAL_GAIN_INP,
> +	MALI_C720_PARAM_BLOCK_HISTOGRAM_INP,
> +	MALI_C720_PARAM_BLOCK_AWB_GAINS_HV,
> +	MALI_C720_PARAM_BLOCK_HISTOGRAM_HV,
> +	MALI_C720_PARAM_BLOCK_HISTOGRAM_HV_IRIDIX,
> +	MALI_C720_PARAM_BLOCK_COLOR_STATS_HV,
> +	MALI_C720_PARAM_BLOCK_BLACK_LEVEL_HV,
> +	MALI_C720_PARAM_BLOCK_SQRT_INP,
> +	MALI_C720_PARAM_BLOCK_SQUARE_A_HV,
> +	MALI_C720_PARAM_BLOCK_SQUARE_B_HV,
> +	MALI_C720_PARAM_BLOCK_SQRT_HV,
> +	MALI_C720_PARAM_BLOCK_DECOMPANDER_INP,
> +	MALI_C720_PARAM_BLOCK_MAX,
> +};

[Severity: Low]
Should MALI_C720_PARAM_BLOCK_MAX either be documented in the kernel-doc
comment or marked with /* private: */?  Without one of those, kernel-doc
emits a warning that MALI_C720_PARAM_BLOCK_MAX is not described in
enum mali_c720_param_block_type.

> +
>  #define V4L2_CID_MALI_C720_STATS_CAPABILITIES		(V4L2_CID_USER_MALI_C720_=
BASE + 0)
> +#define V4L2_CID_MALI_C720_PARAM_CAPABILITIES		(V4L2_CID_USER_MALI_C720_=
BASE + 1)
> +
> +enum mali_c720_params_digital_gain_mask {
> +	MALI_C720_PARAMS_DIGITAL_GAIN_MASK_GAIN,
> +	MALI_C720_PARAMS_DIGITAL_GAIN_MASK_OFFSET,
> +};
> +
> +/**
> + * struct mali_c720_params_digital_gain - Digital gain settings
> + *
> + * This struct configures the digital gain and a common black level for =
all
> + * color channels.
> + *
> + * Set header.type to the target from &enum mali_c720_param_block_type.
> + * See &enum mali_c720_params_digital_gain_mask for the @updated_mask bi=
t positions.

[Severity: Low]
Should enum mali_c720_params_digital_gain_mask and the other six
mali_c720_params_*_mask enums in this header have kernel-doc comments?
Each parameter struct's kernel-doc links to its mask enum via
&enum mali_c720_params_*_mask, so without kernel-doc on the enums they are
omitted from the generated UAPI documentation and those Sphinx
cross-references remain unresolved.

[ ... ]

> +struct mali_c720_params_sqrt {
> +	struct v4l2_isp_block_header header;
> +	__u64 updated_mask;
> +	__u32 normalization;
> +	__u32 black_level_linear;
> +	__u16 black_level_sqrt;
> +};

[ ... ]

> +struct mali_c720_params_square {
> +	struct v4l2_isp_block_header header;
> +	__u64 updated_mask;
> +	__u32 black_level_linear;
> +	__u32 black_level_sqrt;
> +	__u32 normalization;
> +};

[ ... ]

> +struct mali_c720_params_decompander {
> +	struct v4l2_isp_block_header header;
> +	__u64 updated_mask;
> +	__u8 enable;
> +	__u8 reserved[3];
> +	__u32 lut_x[MALI_C720_NUM_DECOMPANDER_LUT_ELEMENTS];
> +	__u32 lut_y[MALI_C720_NUM_DECOMPANDER_LUT_ELEMENTS];
> +};

[ ... ]

> +struct mali_c720_params_histogram {
> +	struct v4l2_isp_block_header header;
> +	__u64 updated_mask;
> +	__u8 stream_mux_select;
> +	__u8 nodes_used_horiz;
> +	__u8 nodes_used_vert;
> +	__u8 skip_x;
> +	__u8 skip_y;
> +	__u8 offset_x;
> +	__u8 offset_y;
> +	__u8 scale_bottom;
> +	__u8 scale_top;
> +	__u8 plane_mode;
> +	__u8 reserved[2];
> +	__u8 weights[MALI_C720_MAX_ZONES];
> +};

[Severity: Low]
Should struct mali_c720_params_sqrt, struct mali_c720_params_square,
struct mali_c720_params_decompander, and struct mali_c720_params_histogram
pad out to their 8-byte alignment boundary with explicit reserved fields?

Because struct v4l2_isp_block_header and updated_mask require 8-byte
alignment, the compiler adds unnamed trailing padding to each of these
four UAPI structs (6 bytes in mali_c720_params_sqrt, and 4 bytes each in
mali_c720_params_square, mali_c720_params_decompander, and
mali_c720_params_histogram where reserved[2] only aligns to a 4-byte
boundary).  That leaves implicit padding in the serialized buffer layout
that triggers -Wpadded warnings and cannot be zeroed or validated via
named reserved fields.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-b4-initial=
-upstream-candidate-v1-0-0cb9bde1bd30@arm.com?part=3D21
