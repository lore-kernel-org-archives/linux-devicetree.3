Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0EC246762
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 00:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789516841; cv=none; b=RSIZn9e8pHxpUrmRPyrdZIRFu+2CTyB/PjneYtK1KNmcmwfVRIOfnnek7E+RPMNOnTNe2iFEeiaMVMpCDy6vYcYjI0MEcP+7Lf6tMe23GioVPZbkWaEa8dnnvroB+a4sTD1JGvfbZgLFxfSQlya2Z1AmqH+c/6dIK4KJfQVw4Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789516841; c=relaxed/simple;
	bh=YnjDkqGnyIN3I7cvU9fMcWsBputF5Jo+weqLEK0CKA0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gtDjECMbkc2JjmTeDEALkl+oXB3KtGazfTfKfwiTta90yAIsiU2lHcuwxhNPVfmjq/gn4jilXilu0LIAA+pnwaES0h3s+ygalUf8mnPsm3cyFKkFqpjywzZtjofhL4/JoJ6TWwwRbGwS7Tz99w5ywjN5Fewxp+S6PKNWUpUYZAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWB6QSjs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWB6QSjs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0081F000FF;
	Wed, 16 Sep 2026 00:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789516840;
	bh=elQpigi0jGlql4hRegCagkK4fxVTolLB4/CG1p2C88Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JWB6QSjsTxmyQJXhIdfV4w4lYySZT9Z/UNK4ZI/f1SaY5KO+QIuiDLXhdcScAAUeF
	 7rUd4PGarloL8j302of4ZLkiavz8Wl8uNQmegBWctPxTsdCKuEYSNtwzMYDrGzZrZG
	 krlDo3zqhPS0t3BIaLzqYkW/Dy6Uf9//dE7CagjKxsMZopyWPuWuOsrWz/xhop5BRf
	 Df6Wv1bFwo17VBdmI4rjtUW9KApYrkzig5CiH1c2+cReD6jwhqf6ZAixRehdhlv/8R
	 vsl6Rji56ReVod8xCNrccUq01PFztJ+nWXAkIuBxs2WgwpYbUOZIJhsmKAKWBJdYNW
	 jV7U/q7rDw95Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 07/15] dpll: sit9531x: add support to get
 and set priority on input pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260915000015.80480-8-arouhi@sitime.com>
References: <20260915000015.80480-1-arouhi@sitime.com>
 <20260915000015.80480-8-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 00:00:39 +0000
Message-Id: <20260916000039.CB0081F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dpll: self-deadlock in sit9531x_dpll_input_pin_prio_set via dpll_p=
in_change_ntf
- [Medium] dpll: absent inputs alias with lowest priority in sit9531x_input=
_prio_get
- [Medium] dpll: priority table cache corrupted by failed writes in sit9531=
x_prio_table_commit
--

commit e60b7c983f9c78bdbd8985a082cc6489f1c9b61d
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

    dpll: sit9531x: add support to get and set priority on input pins
   =20
    The priority table is ordered: the slot an input occupies is its
    priority, and the device selects the lowest occupied slot whose signal =
is
    qualified.  Getting the priority is therefore a search of the table for
    the input, and setting it moves the input to the requested slot.
   =20
    An input absent from the table has no priority to report, and the core =
is
    told so rather than handed a made-up number.

>     An input absent from the table has no priority to report, and the cor=
e is
>     told so rather than handed a made-up number.

[Severity: Medium]
Is this statement accurate?

Looking at sit9531x_input_prio_get(), when an input is absent (!slot), it m=
aps
to SIT9531X_PRIO_MAX_SLOTS (11), yielding a priority of 10:

    if (!slot)
        slot =3D SIT9531X_PRIO_MAX_SLOTS;

    *prio =3D slot - 1;

This aliases an absent input with an input legitimately placed in the lowest
priority slot. The core is handed this constructed priority rather than an
error, which seems to contradict the description.

diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
index 25418485e9757..484c94def578c 100644
--- a/drivers/dpll/sit9531x/core.c
+++ b/drivers/dpll/sit9531x/core.c
[ ... ]
@@ -570,16 +570,30 @@ static void sit9531x_prio_mask_build(struct sit9531x_=
dev *sitdev, u8 pll_idx,
 				     const u8 *srcs)
 {
+	struct sit9531x_chan *chan =3D &sitdev->chan[pll_idx];
+	u8 first[SIT9531X_PRIO_NUM_SRC] =3D { 0 };
 	u16 mask =3D 0;
-	u8 slot;
+	u8 slot, src, src_canon;
=20
-	for (slot =3D 0; slot < SIT9531X_PRIO_MAX_SLOTS; slot++)
-		mask |=3D BIT(srcs[slot] & SIT9531X_PRIO_NIBBLE_MASK);
+	for (slot =3D 0; slot < SIT9531X_PRIO_MAX_SLOTS; slot++) {
+		src =3D srcs[slot] & SIT9531X_PRIO_NIBBLE_MASK;
+		chan->prio_srcs[slot] =3D src;
[ ... ]

[Severity: Medium]
Could this corrupt the priority table cache when an I2C write fails?

This function populates the newly added cache fields (prio_srcs and prio_la=
st)
based on the provided srcs array. However, looking at the caller
sit9531x_prio_table_commit():

drivers/dpll/sit9531x/core.c:sit9531x_prio_table_commit() {
    ...
    for (slot =3D 0; slot < SIT9531X_PRIO_MAX_SLOTS; slot++) {
        ...
        rc =3D sit9531x_write_u8(sitdev, reg, val);
        if (rc)
            goto commit;
    }

commit:
    ...
    sit9531x_prio_mask_build(sitdev, pll_idx, srcs);
    ...
}

If an I2C write fails midway, sit9531x_prio_mask_build() still caches the f=
ully
intended state from srcs. This masks the failure from subsequent getters, w=
hich
will return the intended but uncommitted state until the background polling
thread eventually corrects it.

diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c
index ab9aa7db1839c..e2ff21adfdb23 100644
--- a/drivers/dpll/sit9531x/dpll.c
+++ b/drivers/dpll/sit9531x/dpll.c
@@ -469,10 +469,112 @@ sit9531x_dpll_input_pin_state_on_dpll_set(const stru=
ct dpll_pin *pin,
 	return rc;
 }
=20
[ ... ]
+static int
+sit9531x_dpll_input_pin_prio_set(const struct dpll_pin *pin, void *pin_pri=
v,
+				 const struct dpll_device *dpll, void *dpll_priv,
+				 u32 prio, struct netlink_ext_ack *extack)
+{
+	struct dpll_pin *changed[SIT9531X_MAX_INPUTS + 1];
[ ... ]
+	if (rc =3D=3D -EINVAL) {
+		NL_SET_ERR_MSG(extack,
+			       "Pin is not a reference of this DPLL; connect it first");
+		return rc;
+	}
+	if (rc) {
+		NL_SET_ERR_MSG(extack, "Failed to set input priority");
+		return rc;
+	}
+
+	while (changed_cnt--)
+		dpll_pin_change_ntf(changed[changed_cnt]);
+
+	return 0;
+}

[Severity: High]
Does this code introduce a self-deadlock?

The driver attempts to notify userspace of priority shifts using
dpll_pin_change_ntf(). This function tries to unconditionally acquire the
non-recursive dpll_lock. However, the DPLL framework already holds dpll_lock
when dispatching the prio_set callback (e.g., from dpll_pin_pre_doit()).

Should this use the lockless __dpll_pin_change_ntf() instead to avoid hangi=
ng
the kernel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915000015.8048=
0-1-arouhi@sitime.com?part=3D7
