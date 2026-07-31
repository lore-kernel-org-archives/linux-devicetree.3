Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5474534A3
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785516357; cv=none; b=h8kt8nWfDXuwcVfb9BogDhGbThUfgIi2dCMzv2ttUrweuH7XAXPVg8v+1OLBwcmDoqjHhXzA/nZhWLR4m21t4rORvYxe0cW95/vLu7POToiCMKJNuhzwXxP90JOOtH6TpnJ7573ZWyQVS6TuoEZtlfzcBggvJ/KmdvsTbNrmPlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785516357; c=relaxed/simple;
	bh=bht63iXu0HqbsF+gWaA9W/UCS8bUQGU2eIxi+lyL5Rc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jrZxpROi/IZDv1IxlfBZgTogycGquDxgtTxNjKqIvPtR8Cy9qd0RcbjiejwczU9yBh3vENGcKjTm1XEKOspvuLVsLl/eu02OCTtQu11/moJWk62hY8T4BnU1OTUskIB5BVtnqmIT844/ad4EM6DZbdbTRJ7JTIuxVCU/E1fIWcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=msFzTPES; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="msFzTPES"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DCD21F00AC4;
	Fri, 31 Jul 2026 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785516356;
	bh=PVayJ7QJNjwfqPoRWyIgfpB7F7tL4Vh1zUCt3Sr8Qo0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=msFzTPESC0vRxYXOr/tpTIgyklZ2JGAn3KmtQ0tomzSO0zcgea/mQSkkJBEDVWsXx
	 Qr5q/VGon/Y5eUELhr6DciY+M7HEP7eZEHoTIEFkocxEULX6EoSrxU6gz/f+KXy8tC
	 AcvtjI7KaVW80p/PKrtTrhFHKybs8Zx0lh1PpLSl5PYTZ9V5w3udyiNxqCF8vfrsRW
	 CfY+PHCF+HnhO1QWXO27FT2torGczasLrMrBOFP5f0ZsanSSOce2GWAKkDwz7IBL9b
	 9ef7P/qF60PJaD6+CFLKaxzNIY978ROlUM3bDOzSP69+J+PgkroAdfFpiVZCB2gk98
	 ArGK/FpKQN50A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] security/keys: zeroize key payloads before kdump
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmFuIFNlYmFzdGlhbiBHw7Z0dGU=?= <linux@jaseg.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731162739.158320-5-linux@jaseg.de>
References: <20260731162739.158320-1-linux@jaseg.de>
 <20260731162739.158320-5-linux@jaseg.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 16:45:55 +0000
Message-Id: <20260731164555.9DCD21F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Torn payload updates and in-place frees in `big_key_update` cause =
Use-After-Free and Out-Of-Bounds writes in `big_key_zeroize` during panic.
- [High] Sensitive key types (like NVMe TLS PSK and Ceph keys) are missing =
zeroization callbacks and will leak in crash dumps.
- [High] Keys removed from the rbtree by the garbage collector but not yet =
destroyed are missed by the crash zeroization mechanism.
- [High] Keys whose payloads are currently being instantiated are skipped d=
uring panic zeroization due to a TOCTOU race with `key->state`.
- [High] The entire crash zeroization mechanism can be reliably bypassed if=
 `key_serial_lock` is held when panic occurs.
--

--- Patch [4]: [PATCH 4/4] security/keys: zeroize key payloads before kdump=
 ---
commit 6f552c7707db0ce9c5a1ed7eeec0a2afb30b26a3
Author: Jan Sebastian G=C3=B6tte <linux@jaseg.de>

security/keys: zeroize key payloads before kdump

When CONFIG_CRASH_ZEROIZE is set, try to erase key payloads on panic before
jumping to the kdump kernel. It implements the zeroize op for the user/logo=
n,
encrypted, trusted, and big_key types.

> diff --git a/security/keys/big_key.c b/security/keys/big_key.c
> index 268f702df380e..ad8537dda70fa 100644
> --- a/security/keys/big_key.c
> +++ b/security/keys/big_key.c

[ ... ]

> @@ -279,6 +282,18 @@ long big_key_read(const struct key *key, char *buffe=
r, size_t buflen)
>  	return ret;
>  }
> =20
> +static void big_key_zeroize(struct key *key)
> +{
> +	struct big_key_payload *payload =3D to_big_key_payload(key->payload);
> +
> +	if (payload->data) {
> +		if (payload->length > BIG_KEY_FILE_THRESHOLD)
> +			memzero_explicit(payload->data, CHACHA20POLY1305_KEY_SIZE);
> +		else
> +			memzero_explicit(payload->data, payload->length);
> +	}
> +}

[Severity: High]
Can this result in a use-after-free or out-of-bounds write if a panic occurs
during big_key_update?

In big_key_update(), the key payload is modified in-place:

security/keys/big_key.c:big_key_update() {
        ...
        if (key_is_positive(key))
                big_key_destroy(key);

        return generic_key_instantiate(key, prep);
}

generic_key_instantiate() updates the payload union sequentially. If a panic
occurs exactly when the payload pointer is freed, or when the new pointer is
written but payload->length is still the old length, this zeroize function
will read the torn state asynchronously and potentially write zeroes to fre=
ed
memory or beyond the bounds of the new buffer.

> diff --git a/security/keys/key.c b/security/keys/key.c
> index 091ee084bc300..4f0e8e579cebd 100644
> --- a/security/keys/key.c
> +++ b/security/keys/key.c

[ ... ]

> @@ -1268,6 +1269,44 @@ void unregister_key_type(struct key_type *ktype)
>  }
>  EXPORT_SYMBOL(unregister_key_type);
> =20
> +#ifdef CONFIG_CRASH_ZEROIZE
> +/* Called far into vpanic from crash_core.c with other CPUs stopped and
> + * preemption disabled
> + */
> +static int key_crash_zeroize(struct notifier_block *nb, unsigned long ac=
tion,
> +		void *data)
> +{
> +	struct rb_node *node;
> +
> +	/* If we can't acquire the lock, the rbtree might be in an inconsistent
> +	 * state. That's all we can do then, as there's no point to waiting
> +	 * at this stage.
> +	 */
> +	if (!spin_trylock(&key_serial_lock)) {
> +		pr_crit("crash_zeroize: can't acquire key_serial_lock. skipping keyrin=
gs.\n");
> +		return NOTIFY_DONE;
> +	}

[Severity: High]
Does this completely bypass zeroization if another CPU holds the lock when
the panic occurs?

Any legitimate action on a separate CPU that briefly acquires key_serial_lo=
ck
will cause the panicking CPU to fail this trylock. Could this be used to
reliably bypass the crash zeroize protection for all keys if the panic is
triggered during that window?

> +
> +	for (node =3D rb_first(&key_serial_tree); node; node =3D rb_next(node))=
 {
> +		struct key *key =3D rb_entry(node, struct key, serial_node);

[Severity: High]
Are keys that are pending destruction missed by this loop?

When a key is unreferenced, key_garbage_collector() removes it from the
key_serial_tree and adds it to a local graveyard list before freeing it:

security/keys/gc.c:key_garbage_collector() {
        ...
        rb_erase(&key->serial_node, &key_serial_tree);
        spin_unlock(&key_serial_lock);

        list_add_tail(&key->graveyard_link, &graveyard);
        ...
}

If a panic happens between the removal from the tree and the actual
destruction (which can involve sleeping for synchronize_rcu), the key
material is still in memory but seems to be skipped here.

> +
> +		if (key->type =3D=3D &key_type_keyring ||
> +		    key->state =3D=3D KEY_IS_UNINSTANTIATED)
> +			continue;

[Severity: High]
Can this skip newly instantiated keys due to a race condition?

In __key_instantiate_and_link(), the payload is populated before the state
is updated:

security/keys/key.c:__key_instantiate_and_link() {
        ...
        ret =3D key->type->instantiate(key, prep);

        if (ret =3D=3D 0) {
                atomic_inc(&key->user->nikeys);
                mark_key_instantiated(key, 0);
        ...
}

If a panic occurs in the window after the instantiate callback copies the
secret material but before the state changes from KEY_IS_UNINSTANTIATED,
the key material is already present but will be skipped by this check.

> +
> +		/* custom zeroize since free'ing isn't safe at this point */
> +		if (key->type->zeroize)
> +			key->type->zeroize(key);

[Severity: High]
Will this silently leak sensitive keys that lack a zeroize callback?

Several sensitive key types appear to be missing the zeroize callback
definition in this patch, such as nvme_tls_psk_key_type in
drivers/nvme/common/keyring.c and key_type_ceph in net/ceph/crypto.c.

Since this loop skips any type without a zeroize callback, those
cryptographic keys will bypass the crash zeroize mechanism and remain
in crash dumps.

> +	}
> +	/* off to kexec()! */
> +	return NOTIFY_DONE;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731162739.1583=
20-1-linux@jaseg.de?part=3D4
