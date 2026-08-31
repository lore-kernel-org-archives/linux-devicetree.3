Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F2342F715
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183032; cv=none; b=PhHSN9Gu+yuIoUP+gJeZiYxZuRfX+ACzjCHZLu2U8m1f5g0MphvqjzJLYm1VDB+hkBW1rqihd5iPjl9UtYTTgdxXA1hVFYw5l6GMXFPwTo5hyiMFIaVql6YpRZGEZ3jDZkwccEfBqj+EyeEDlEcKNorLEMetK43KgR1wgCQw3zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183032; c=relaxed/simple;
	bh=yBBBR3Z1F+myPI4Xa9imPhNOFS1l2cmT3C1F4nXI1/A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gqk35adIvWvY6w7KWKR178ruNcs/yIwsENCCcEq9RsZ3yKw3PlA/JUNwA+cI7wSGsSAT9f1EpAiTJ1Zpr2VyvWlvhgt03CSt8OSMYerpzGON2yJCQrt6F0FUoMlNbwLC80wqgCAMar4gMI8LwBsJnLYvTHTx9Nrg1SDOJOofQvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hM0Z3yJ+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hM0Z3yJ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84A81F000E9;
	Mon, 31 Aug 2026 13:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183031;
	bh=VQhlV19/Kva5AmbQLz3Dg7yWzDW3H33EwYo5xd0pmjM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hM0Z3yJ+8bBHtNoczCRd+Wb2Z9iKdnXVUGW+iovMs6D0I3R8gavBnut/9nb+rjql0
	 NOvBsEZTlLiq6A6XQhYxeH+rV+JqtJqPo3hf6KvtMiwajv/K4thSfBpyWup7SIPk7j
	 koH78Exs3qysXZuQ1i7uRs+f28RgZMbSv1a8n18Xzridb6mDByNWNxrd6Pns9GwvtI
	 Fdv9cVHI3j3cCXGEhp6+eOE6cIXhtGdVSbfjqNC5/Ie6O1hv0Ai+lSVs20B0Brxl9D
	 h4tyAdZ8ndVNRtd9quSTNRnPd5V0+rfQJpSelZnBMJCC+mPRNAYXOvUdjvW/nnZAHl
	 qSThXJ3nPokKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 01/22] media: mc: Add INTERNAL pad flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-gmsl2-3_serdes-v16-1-4fa6e08bb514@analog.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <20260831-gmsl2-3_serdes-v16-1-4fa6e08bb514@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 13:30:30 +0000
Message-Id: <20260831133030.D84A81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Fallback fwnode pad matching incorrectly maps external endpoints=
 to internal pads.
--

commit 8c2ba56726bfa940940f5ffec523ef8ae74466ed
Author: Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Mon Aug 31 13:21:20 2026 +0000

    media: mc: Add INTERNAL pad flag
   =20
    Internal sink pads will be used as routing endpoints in V4L2 [GS]_ROUTI=
NG
    IOCTLs, to indicate that the stream begins in the entity. Internal sink
    pads are pads that have both SINK and INTERNAL flags set.
   =20
    Also prevent creating links to pads that have been flagged as internal =
and
    initialising SOURCE pads with INTERNAL flag set.

> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 3fa0bc687851b..7938f785e2e3c 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
[ ... ]
> @@ -1118,7 +1123,8 @@ int media_get_pad_index(struct media_entity *entity=
, u32 pad_type,
> =20
>  	for (i =3D 0; i < entity->num_pads; i++) {
>  		if ((entity->pads[i].flags &
> -		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) !=3D pad_type)
> +		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
> +		      MEDIA_PAD_FL_INTERNAL)) !=3D pad_type)
>  			continue;
> =20
>  		if (entity->pads[i].sig_type =3D=3D sig_type)

[Severity: Medium]
Will this patch also require updating media_entity_get_fwnode_pad() to hand=
le
internal pads?

Looking at the fallback logic when an entity doesn't implement the
get_fwnode_pad operation, it iterates over all pads and returns the first p=
ad
matching direction_flags:

drivers/media/mc/mc-entity.c:media_entity_get_fwnode_pad() {
    ...
		for (i =3D 0; i < entity->num_pads; i++) {
			if (entity->pads[i].flags & direction_flags)
				return i;
		}
    ...
}

Because internal pads have both MEDIA_PAD_FL_SINK and MEDIA_PAD_FL_INTERNAL
set, the bitwise AND will evaluate to true if direction_flags is
MEDIA_PAD_FL_SINK.

If this matches an internal pad before an external pad, the core framework
would attempt to wire an external fwnode link to the internal pad. This wou=
ld
subsequently trigger the newly introduced WARN_ON in media_create_pad_link()
and return -EINVAL, causing device probe and link creation to fail.

Could media_entity_get_fwnode_pad() be updated to exclude internal pads?

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

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-gmsl2-3_se=
rdes-v16-0-4fa6e08bb514@analog.com?part=3D1
