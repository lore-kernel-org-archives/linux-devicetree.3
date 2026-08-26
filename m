Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CF83E3156
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787741569; cv=none; b=d2DG3yexGbJyHfhHnTGDvalzWz2+uzIavkw9FNtV2o8z6jS4EUi/DByP0+iR6X6HIVsDlkytoGyZK3HZvdvRLqX2d2alk2J6rIb6zeC05RP4VtfvbGDHjaXhv2n3h6Mm3BPXGJCM+/j9reth527X2LDWgU5x9uUUkPI7h5kSKXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787741569; c=relaxed/simple;
	bh=H/P0/OKywne6byVHECm6KCdWcF+LcQSCv0bo6NlHHYw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cZV64rQ/DgiaLZbkL0YRqzqz/aWe6bQfFLvPVWSPnSAt5Q/tPVFTZmdDUnN2gWmaMEwzSI5ItiMZdKhlLl1rn/6YQXOme+oywSyJqutpl6QSrygz8q+1Xa5domdL5dyRizHFjYNtVB1yJlhlDJYTRhJKq3piWaCubdZbU3QmiHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWAfIOsB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWAfIOsB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BF91F000E9;
	Wed, 26 Aug 2026 10:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787741562;
	bh=abZ99My9Qae/qtii2IQ4mJ0HjFfZtD/2RL9o4UAtJ5w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SWAfIOsBePrtq4vmnGb9PifQxA/N0Up2Cyc8qWJCkAE5mD5drTpQijA2FZs+IHrCK
	 FpeXHgrhF3ZKdXdANUoDXUSZckt0Jf27C98URk2Y0tR5z+LX0D6fHWRoR5yC8H3Kha
	 7e0EEnW1ceBLAKZZTWUFLnU8uSRCZ+YFCq9JMu2VhHprzgcSPmMdDZC53x+8idOLDG
	 jH/NBCKKqZ/jX9X/5CfA5r4pxMZmgu89LKpBECePK5RtIIU+kCjcg950/LnpiDshWi
	 XorfAOIYtsc+K3WHYyzurp2Zh3XaU9wkBl72FCExhy2OgX17vV9nX8yuvWKGcJGupW
	 SuRmWdSJfcuEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 1/8] i3c: master: Add APIs for I3C hub support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20260826103819.1614843-2-lakshay.piplani@nxp.com>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-2-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 10:52:41 +0000
Message-Id: <20260826105241.E2BF91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Failure in i3c_bus_init() causes i3c_masterdev_release() to errone=
ously remove ID 0 from the IDR.
--

commit 1f089e3141f5a635df33d2273d7de2114b2f6ef5
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

    i3c: master: Add APIs for I3C hub support
   =20
    Add CCC helpers to check CCC support and send CCC commands, address slot
    helpers to query and update I3C bus address slot state, registering vir=
tual
    masters with an explicit firmware node, and exposing the bus maintenance
    lock helpers.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index f1be38a640ca1..03fb41f0786c5 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c

[ ... ]

> @@ -3195,34 +3267,31 @@ static int i3c_master_check_ops(const struct i3c_=
master_controller_ops *ops)
>  }
> =20
>  /**
> - * i3c_master_register() - register an I3C master
> + * i3c_master_register_fwnode() - register an I3C master with a custom f=
wnode
>   * @master: master used to send frames on the bus
> - * @parent: the parent device (the one that provides this I3C master
> - *	    controller)
> + * @parent: the parent device providing this I3C master controller
> + * @fwnode: firmware node describing this I3C bus, or NULL
>   * @ops: the master controller operations
> - * @secondary: true if you are registering a secondary master. Will retu=
rn
> - *	       -EOPNOTSUPP if set to true since secondary masters are not yet
> - *	       supported
> + * @secondary: true if registering a secondary master

[ ... ]

> @@ -3352,6 +3427,39 @@ int i3c_master_register(struct i3c_master_controll=
er *master,
> =20
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(i3c_master_register_fwnode);

[Severity: High]
This is a pre-existing issue, but can a failure in i3c_bus_init() cause
i3c_masterdev_release() to erroneously remove ID 0 from the IDR?

If idr_alloc() fails in i3c_bus_init(), i3cbus->id remains 0. The error
path in i3c_master_register_fwnode() branches to err_put_dev, calling
put_device(), which invokes i3c_masterdev_release() and unconditionally
calls i3c_bus_cleanup().

This executes idr_remove(&i3c_bus_idr, 0), removing whatever valid bus
happens to own ID 0. This corrupts the IDR, breaking bus lookups for bus 0
and potentially leading to a use-after-free or a double allocation of ID 0
later.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826103819.1614=
843-1-lakshay.piplani@nxp.com?part=3D1
