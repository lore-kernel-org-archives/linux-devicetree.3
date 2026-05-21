Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D952338331F
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369575; cv=none; b=eeqM7ySzI5wUqIE6oU4K85L2mh+vYnLmxKnk+nl5Fx/txJ1jycPVv5cCMkiqB0yuIIHt+CxT+Qv/wMvprRhPEPwruDhcr/RtQDVWgkWPyEWljX0mXhD89fhhlEZb8X3yfF51TObPyOi4EDBMdMUMSOmrfsh1J5Op8N9ZkaXHLl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369575; c=relaxed/simple;
	bh=kHws44ZUcTJjl90LJ/hi6/YawafU8uOzK+oXH2N2P28=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o2EeHNiSzY9is8OU3bUJNXQ7Gn4TvAwmFHJwt7oMomxI1d6ZbVJfAvhqkSkrdpn+focSnGl4H6kf2WgHUUgWTfdaa2jeVdJOGRX6rKUYki15pDw0/wCH132vb3y0qr6/HHCicmmBFgK3XoBAWFKgf/nQh3p16tfMwhw+PABpEow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bnLC0/Jd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bnLC0/Jd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E491F000E9;
	Thu, 21 May 2026 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779369573;
	bh=YF9BlpKLUqi2XZvUIpDDopex0TwT353eX3z8jKO2kfA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bnLC0/JdutMvB+iVtycmcMs8phGpOfZ9oHCMORh8xBuWssj/CTbcYqVtXBHbk5zbS
	 a3eEFLyUp/T58s8Wlo+Ac5kbKJWDiBbm2MT7RH4gjX2OxrbC1wcaN6Y4u0SGxLK8vA
	 vL+VZFQEmCsqK8HswY0T/PE7ibzz5fp3XzcesDtecnpB9iX+NZw2GwZ0Njj2W3A+r2
	 UeQdx7NHABGvh3wLMUIVi9MEfr9eriAqzRtZ/z3KtSQaZP9JsrXu4kO7K+lLMrXkm4
	 w60TJxSAC9BNfEIoEYFR8AKhcB6n6kHx2TNndQyHCpJ59U4DGRMJ1jpf1H+qMLEg28
	 x434OY4jp0MrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 01/22] media: mc: Add INTERNAL pad flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-gmsl2-3_serdes-v12-1-b26d92931196@analog.com>
References: <20260521-gmsl2-3_serdes-v12-1-b26d92931196@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 13:19:32 +0000
Message-Id: <20260521131933.37E491F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The fallback logic in `media_entity_get_fwnode_pad()` was not up=
dated to ignore internal pads, mapping external endpoints to internal pads.

Pre-existing issues:
- [High] The error path in `media_create_pad_link()` causes `num_links` cou=
nters for both the source and sink pads to underflow.
--

commit fcec98f088400370f507804a947df270add985d6
Author: Sakari Ailus <sakari.ailus@linux.intel.com>

media: mc: Add INTERNAL pad flag

Internal sink pads will be used as routing endpoints in V4L2 [GS]_ROUTING
IOCTLs, to indicate that the stream begins in the entity. Internal sink
pads are pads that have both SINK and INTERNAL flags set.

Also prevent creating links to pads that have been flagged as internal and
initialising SOURCE pads with INTERNAL flag set.

> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 3fa0bc687851b..7938f785e2e3c 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
[ ... ]
> @@ -1148,6 +1154,9 @@ media_create_pad_link(struct media_entity *source, =
u16 source_pad,
>  		return -EINVAL;
>  	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
>  		return -EINVAL;
> +	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
> +	    WARN_ON(sink->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
> +		return -EINVAL;
> =20
>  	link =3D media_add_link(&source->links);
>  	if (link =3D=3D NULL)

[Severity: High]
This is a pre-existing issue, but does the error path in media_create_pad_l=
ink()
cause the num_links counters for both the source and sink pads to underflow?

If the forward link is allocated but the backlink allocation fails, the err=
or
path calls __media_entity_remove_link(source, link):

drivers/media/mc/mc-entity.c:media_create_pad_link() {
    ...
	backlink =3D media_add_link(&sink->links);
	if (backlink =3D=3D NULL) {
		__media_entity_remove_link(source, link);
		return -ENOMEM;
	}
    ...
}

Inside __media_entity_remove_link(), it unconditionally decrements
link->source->num_links and link->sink->num_links for data links:

drivers/media/mc/mc-entity.c:__media_entity_remove_link() {
    ...
	if ((link->flags & MEDIA_LNK_FL_LINK_TYPE) =3D=3D MEDIA_LNK_FL_DATA_LINK) {
		link->source->num_links--;
		link->sink->num_links--;
    ...
}

Because these struct media_pad link counters are only incremented at the ve=
ry
end of media_create_pad_link(), they haven't been incremented yet. Will the=
se
decrements cause the unsigned 16-bit integers to underflow to 65535, corrup=
ting
the internal state of the media graph?

> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 1c80b1d6bbaf3..80cfd12a43fc1 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -208,6 +208,7 @@ struct media_entity_desc {
>  #define MEDIA_PAD_FL_SINK			(1U << 0)
>  #define MEDIA_PAD_FL_SOURCE			(1U << 1)
>  #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
> +#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
> =20
>  struct media_pad_desc {
>  	__u32 entity;		/* entity ID */

[Severity: Medium]
Was the fallback logic in media_entity_get_fwnode_pad() updated to ignore
internal pads?

Since internal sink pads also have the MEDIA_PAD_FL_SINK flag set, the fall=
back
logic (used when a driver lacks a get_fwnode_pad operation) searches for the
first pad matching the requested direction flags:

drivers/media/mc/mc-entity.c:media_entity_get_fwnode_pad() {
    ...
	if (!entity->ops || !entity->ops->get_fwnode_pad) {
		for (i =3D 0; i < entity->num_pads; i++) {
			if (entity->pads[i].flags & direction_flags)
				return i;
		}
		return -ENXIO;
	}
    ...
}

If an internal pad appears before external pads in the array, won't it
incorrectly match and return the internal pad?

Any subsequent attempt to establish a link to this fwnode pad (e.g., via
v4l2_create_fwnode_links_to_pad()) would then trigger the new WARN_ON in
media_create_pad_link() and fail with -EINVAL, breaking initialization for
new drivers utilizing internal pads.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-gmsl2-3_se=
rdes-v12-0-b26d92931196@analog.com?part=3D1
