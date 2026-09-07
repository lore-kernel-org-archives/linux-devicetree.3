Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6632E43E488
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771711; cv=none; b=siqTL6RFQ5Rr5sxzxh21LBwGuxMBL0C4jUfm5fJ8zBzn0O5+KbgWnVuMS6sKXRczPWIFcToTLfb7w0+43zk1gzk1OHWggzHOPyCb4W4Jj95vVtP47O28MCZwOGozvDmdg/8uNsDHWqzLvIGP+rDsCGAZCsgWAecBrhkm81QBIrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771711; c=relaxed/simple;
	bh=5fPl2HSDi6PbOf+LVR/iccpaLi4BOUwniqo2FnDa98s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ndo/rnmY20aTppN44hEY+DwhyTidVC+jZgdt2jBDt3enwfDAAnt35CsrL7b1dmY4kFpVrkqGZB0QJGEgyxkM4e728akd1kWAjLqi1M1bUWdOYJnm5H+8GW3t3sGXe9DeSgQcTzky7KE84CwsvvxyreRLsCat4J2mEmisVDkVTv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYZvg2N5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYZvg2N5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70171F00A3A;
	Mon,  7 Sep 2026 09:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788771710;
	bh=ByQfHcoETYzrSWwzlhYHcDBmJG5s/c7Y9ld0sfIckic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YYZvg2N5QJigogN5SkcqaE5yshhtiAxRj6SyBO4RmRQsoFb3DboSpjLR9f20/oWLX
	 PZlb4BRBeCl2pqnfB0qry69j9d+7Xq0GWrrYnysCjSEazEeCI5RAHDagNktY9v4UiW
	 ys8lbeFtNJH8r6aX8VCpY2eu2u7eLcSmc5TAVp89cIK1L5p1PKn3DORJuXKL/7oHJz
	 2ytDN0JBafGgJAUo4WdhmfyKiz3QhtVFLD0obt8Xfl5GretqYUo4o7hsPlzO+0IxaO
	 9Uj0PYnynGyYZ4sDIwstIxs4UaqZl7euQfOo4dkdJLjoJaP6YQisMxFSRxYZRIBD8n
	 sV2tUkSM/KKQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 09:01:49 +0000
Message-Id: <20260907090149.B70171F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing DT patching for IT 33 MIC_BIAS and unsafe mutation of glob=
al static topology structures.
- [High] Disconnected playback topology graph (OT 43/45 bypass processing u=
nits).
--

commit 87e473cde38b9ce58f289bd43fe4fcd2cf63830e
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA codec

This commit adds support for the Qualcomm Tambora (WCD9378) headset codec
in SDCA mode over SoundWire. It supplies static SDCA topology and SoundWire
port properties for ARM/DT platforms without ACPI/DisCo firmware.

> diff --git a/sound/soc/codecs/wcd9378-sdca.c b/sound/soc/codecs/wcd9378-s=
dca.c
> index 0000000000000..6a77fac017005
> --- /dev/null
> +++ b/sound/soc/codecs/wcd9378-sdca.c
[ ... ]
> +/* OT 43 (Headphone), OT 45 (Headset): no controls. */
> +static struct sdca_entity *entity_ot43_sources[] =3D { &wcd9378_sdca_ent=
ities[QSJ_IT41] };
> +static struct sdca_entity *entity_ot45_sources[] =3D { &wcd9378_sdca_ent=
ities[QSJ_IT41] };

[Severity: High]
Does this bypass the processing chain for headphone and headset playback?

The output terminals are hardcoded to source directly from the input termin=
al
QSJ_IT41. Because the SDCA/DAPM graph traverses backward from sinks to sour=
ces,
this appears to orphan the intermediate units (MFPU 21, XU 42, SU 43, SU 45)
and the volume control unit (FU 6).

The commit message mentions that playback uses FU 6 for mute and volume, but
the volume controls won't be functional if the unit is bypassed in the grap=
h.

[ ... ]
> +	/* E006: FU 6 (FU42) - vendor Feature Unit; HPH mute + Q7.8 volume. */
> +	{ .id =3D 0x6, .label =3D "FU 6", .type =3D SDCA_ENTITY_TYPE_FU,
> +	  .num_controls =3D ARRAY_SIZE(entity_fu6_controls), .controls =3D enti=
ty_fu6_controls },

[Severity: High]
Is it intentional that FU 6 is defined without any sources here?

Combined with the OT 43 and OT 45 source assignments above, FU 6 currently
operates as a disconnected dead end in the topology graph.

[ ... ]
> +static int wcd9378_sdca_populate_function(struct sdw_slave *slave,
> +					  struct sdca_function_data *function)
> +{
> +	/* @function->desc is already set by the framework; fill payload only. =
*/
> +	if (function->desc->type !=3D wcd9378_sdca_desc.type)
> +		return -EINVAL;
> +
> +	function->num_entities    =3D wcd9378_sdca_data.num_entities;
> +	function->entities        =3D wcd9378_sdca_data.entities;

[ ... ]

> +	/* Elevate is_volatile / has_reset to match the DisCo/ACPI path. */
> +	sdca_apply_default_control_classifiers(function);
> +
> +	return 0;
> +}

[Severity: High]
Can modifying these entities cause a data race if multiple device instances=
 are
probed?

Here, function->entities is assigned directly to the globally shared static
array wcd9378_sdca_data.entities. Calling sdca_apply_default_control_classi=
fiers()
subsequently writes to the structure's fields. This mutates global state wi=
thout
making a deep copy for the specific device instance.

Additionally, the commit message mentions that wcd9378_sdca_populate_functi=
on()
"patches the IT 33 MIC_BIAS default with the DT-derived per-slave value" via
the qcom,micbias2-microvolt property. The logic to parse and apply this DT
property appears to be missing from this function, which leaves the mic bias
voltage stuck at the 2.75V default.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907083727.7337=
05-1-srinivas.kandagatla@oss.qualcomm.com?part=3D11
