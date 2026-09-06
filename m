Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC3A2BEC2B
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 18:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788720526; cv=none; b=X41hW3THSXJrbpNhaHl/6Vb/Utpak4Vr3evOhSOiv6g0E8J4DuvQMg49gAowP+9McOjriXQ4cgum406Fwb8rcq7DyD15c/SKaj+zZ1k2TXv5KGDlhQADJ/ch22XEpmD6T+dRIDRIQQTfrVL3OnRML5oPz/apdW4FPCAZ5k+TwWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788720526; c=relaxed/simple;
	bh=j9oaO6rLbKmWf66tVv2piH43uVTLPg4k7VAtKP42Dr0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dX9i/juiA8u2ePh1HDuShIj5BkDpJTbbRa9TR9jGAwr+q3KMQgEyNQux8ckfemMi0ZiTw5WDO/ygF6Ti5x51rljyzmQ85kviNl8tN+wzwuY4Ej+73o45syvgqiOJpJvB1BXBJISM4q82T3aO0TSL6xN5Qc366dqEne78W05drUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGDVaRu+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGDVaRu+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E631F00A3A;
	Sun,  6 Sep 2026 18:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788720525;
	bh=LUDNUjOdJGvrXXXqQZHSzsXfzvtFGlBFzgPnTrqojLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bGDVaRu+lAW/krG41ppwTjVIW6OySkV/J6ic0b34e9RmXUR042+UZfPb6RzSMG6qz
	 w/quR5iB9b+JNAsfh594ntbYQn5KqYBj8PmMWhVvLvlhdg9Znsg7Y/PFINDYXhMjEj
	 woaUENtqIobrjwL27rfjKP26sh4ozfusiCtl2Y8woZLzVlQNjaR9ijp/fwjGEPMZkv
	 KWx608PyzXOjZeVRhwWE+GIIhZRiQH6eyQe0pI3uMFtoO8HRNZ0uCl2ZVN5P5cO5wI
	 jkt3Q//A7AbhrAx/Gw2cwX4s6RgNr3PWbvCb9vVvqP5qlF9Mxk0LxmW/lt92ZD5SC1
	 lH//l8TJopUxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/22] usb: typec: Add alternate mode state notifiers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-1-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-1-1f80085f93fb@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 18:48:44 +0000
Message-Id: <20260906184844.A5E631F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Synchronous notifier execution inside deeply nested TCPM locks cau=
ses recursive and AB-BA deadlocks.
--

commit 24aff87629a22c99f4d8e24783e51c35bd321aa1
Author: Sven Peter <sven@kernel.org>

usb: typec: Add alternate mode state notifiers

This commit adds a blocking notifier chain to USB Type-C alternate modes,
triggering synchronously when an alternate mode is activated or deactivated.
It allows drivers (like Apple Silicon USB4/Thunderbolt) to react to cable
details and state changes.

> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 54c7810b563be..5808a3ef0d6cd 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c

[ ... ]

> @@ -312,6 +315,10 @@ void typec_altmode_update_active(struct typec_altmod=
e *adev, bool active)
>  	}
> =20
>  	adev->active =3D active;
> +	blocking_notifier_call_chain(&alt->state_notifier,
> +				     active ? TYPEC_ALTMODE_ENTERED :
> +					      TYPEC_ALTMODE_EXITED,
> +				     adev);

[Severity: High]
Does this synchronous notifier chain execution risk recursive deadlocks or
AB-BA lock inversions with the TCPM driver?

Looking at drivers/usb/typec/tcpm/tcpm.c, tcpm_pd_svdm() calls
typec_altmode_update_active() while already holding port->lock:

tcpm_pd_svdm() {
    mutex_lock(&port->lock);
    ...
    typec_altmode_update_active(pdev, true);
}

Because blocking_notifier_call_chain() executes synchronously, any subscrib=
er
callback will run with TCPM's port->lock held.

If a subscriber callback attempts to interact with the alternate mode
(for example, by calling typec_altmode_enter()), the TCPM altmode operations
such as tcpm_altmode_enter() will attempt to acquire port->lock again,
leading to a direct recursive deadlock.=20

Additionally, if subscribers acquire their own hardware locks in the callba=
ck,
it could create an AB-BA inversion against port->lock.

Could this notification be deferred (similar to the adev_action deferral
mechanism TCPM uses elsewhere) or executed outside of the port->lock context
to prevent these locking inversions?

>  	snprintf(dir, sizeof(dir), "mode%d", adev->mode);
>  	sysfs_notify(&adev->dev.kobj, dir, "active");
>  	sysfs_notify(&adev->dev.kobj, NULL, "active");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-b4-apple-s=
oc-tbt-v2-0-1f80085f93fb@kernel.org?part=3D1
