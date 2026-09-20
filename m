Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32733603E0
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881074; cv=none; b=tRVXuiYPvhQcxYlyq+9CmrnzhLSp3KP5DEOYX4HXQ4iH564JiDmMWCjyz5pVffhGEk8uvRXpJroqSnF9IYZGuNgBqmAcYjZNYkDKoz2vaMCqN+YA/qV4kYVEftyjW1O9g5+F51MqY1JYHzfKMRn3TR4yqCXgsfL9/0DRgh2XEV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881074; c=relaxed/simple;
	bh=Vg3ugbqrLuVJKRpB33+Akogp2OZo0PXrg+cVzj+vApE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MYI3wBBE0gisjDad0pv/vEfChGYSRrz+io5xapGjmWyNuHaxwnf/xBUZHIY7KDF5y4p11IFfDpxoezfx0lNJ4KPLQzu97WdNT/P3+/juqCp1HMv/mb7Xhh8hXaq1WF2ODjJDfzaGbMDoHJv5eKboWWX9g0md9uVm31hsJwFKVjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOpwxN3V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOpwxN3V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3C71F00893;
	Sun, 20 Sep 2026 05:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789881064;
	bh=edQkdBHthvYuTVL0zFgumD+mLE8ynAk7Ky/Lxa5WQDI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IOpwxN3V2PqBcqkEGei4wz5VwhPQvZ9FPmCwHayL6i0L9gAEw5Ymp9x78xdk68V4v
	 2egm0GnuPIYvet0nE7MwR4XiaUFRdPOgpu8+rJipVQEXWCxPJV9kBAnejsB17h/qWx
	 FC4Xosbu2bjXwvEX41FLEOTHT+5vRWoWhNrvymJO8FUQkMq485cTOMkT4kSBL/uFkd
	 vgL23w/0YxG0iomI+ttb7mwB0HG3iZaO1m+H+10z2Xq+TcpH+XTu0MZ5b0pB1Xow1M
	 EZVM/SIhtNEPhNwyE/DpbYk/gLnEfVdHqqtUOYIpwl3LDce+I9BbBKpExTZpZFUf+B
	 qlDetlO8X9A0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/28] ALSA: control: Add kcontrol callbacks for
 lock/unlock
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260920-macaudio-v1-8-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-8-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:11:04 +0000
Message-Id: <20260920051104.7F3C71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ALSA: control: Missing element context in lock/unlock callbacks
- [High] ALSA: control: Missing unlock callback invocation on control remov=
al
--

commit 432b3659bebdece13c2a2b132af2a88df66f8e1d
Author: Hector Martin <marcan@marcan.st>

ALSA: control: Add kcontrol callbacks for lock/unlock

This commit introduces lock and unlock callbacks for ALSA kcontrols,
allowing drivers to implement custom policy when controls are locked or
unlocked. It is primarily intended for implementing volume safety controls
where user-space processes must complete a handshake to increase volumes.

> diff --git a/include/sound/control.h b/include/sound/control.h
> index 909db0d0485df..6b3ef6be51003 100644
> --- a/include/sound/control.h
> +++ b/include/sound/control.h
> @@ -15,9 +15,12 @@
>  #define snd_kcontrol_chip(kcontrol) ((kcontrol)->private_data)
> =20
>  struct snd_kcontrol;
> +struct snd_ctl_file;
>  typedef int (snd_kcontrol_info_t) (struct snd_kcontrol * kcontrol, struc=
t snd_ctl_elem_info * uinfo);
>  typedef int (snd_kcontrol_get_t) (struct snd_kcontrol * kcontrol, struct=
 snd_ctl_elem_value * ucontrol);
>  typedef int (snd_kcontrol_put_t) (struct snd_kcontrol * kcontrol, struct=
 snd_ctl_elem_value * ucontrol);
> +typedef int (snd_kcontrol_lock_t) (struct snd_kcontrol * kcontrol, struc=
t snd_ctl_file *owner);
> +typedef void (snd_kcontrol_unlock_t) (struct snd_kcontrol * kcontrol);

[Severity: High]
Does omitting the element index or ID from the callback signatures prevent
drivers from applying per-element policy for multi-element controls, as they
cannot deduce which specific element is being locked or unlocked?

>  typedef int (snd_kcontrol_tlv_rw_t)(struct snd_kcontrol *kcontrol,
>  				    int op_flag, /* SNDRV_CTL_TLV_OP_XXX */
> [ ... ]
> diff --git a/sound/core/control.c b/sound/core/control.c
> index 4199342d4ffe0..c8aab9abd306a 100644
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -126,10 +126,12 @@ static int snd_ctl_release(struct inode *inode, str=
uct file *file)
>  	scoped_guard(rwsem_write, &card->controls_rwsem) {
>  		list_for_each_entry(control, &card->controls, list)
>  			for (idx =3D 0; idx < control->count; idx++)
> -				if (control->vd[idx].owner =3D=3D ctl)
> +				if (control->vd[idx].owner =3D=3D ctl) {
>  					control->vd[idx].owner =3D NULL;
> +					if (control->unlock)
> +						control->unlock(control);
> +				}

[Severity: High]
Since this loop does not provide the element index to the unlock callback,
does it result in identical, indistinguishable unlock calls being sent to t=
he
driver for each locked element within the same control? Could this confuse =
the
driver's internal state machine?

>  	}
>  	snd_fasync_free(ctl->fasync);
>  	snd_ctl_empty_read_queue(ctl);
> [ ... ]
> @@ -1487,6 +1491,12 @@ static int snd_ctl_elem_lock(struct snd_ctl_file *=
file,
>  	vd =3D &kctl->vd[snd_ctl_get_ioff(kctl, &id)];
>  	if (vd->owner)
>  		return -EBUSY;
> +
> +	if (kctl->lock) {
> +		int err =3D kctl->lock(kctl, file);
> +		if (err < 0)
> +			return err;
> +	}

[Severity: High]
Are drivers able to correctly process this lock request? It invokes the
lock callback without passing the idx or id of the specific element being
locked.

>  	vd->owner =3D file;
>  	return 0;
>  }

Additionally, looking at the control removal process in the existing codeba=
se
that interacts with the new lock state:

sound/core/control.c:__snd_ctl_remove() {
    ...
	for (idx =3D 0; idx < kcontrol->count; idx++)
		snd_ctl_notify_one(card, SNDRV_CTL_EVENT_MASK_REMOVE, kcontrol, idx);
	snd_ctl_free_one(kcontrol);
	return 0;
}

[Severity: High]
When a control is dynamically added and then removed, or when a device is
hot-unplugged, this function frees the control memory without checking for
active locks or invoking the unlock callback for locked elements.=20

Could this lead to driver resource leaks or hardware state not being proper=
ly
restored if userspace holds a lock during removal?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D8
