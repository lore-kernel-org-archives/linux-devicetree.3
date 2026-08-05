Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38EF3C944A
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 04:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785904181; cv=none; b=nl8Wt+UZpk5dWFoeddiEmxuiwYKiiDautJADrNVBNCTHYgpuB+jHaKW/yup4HxZCm+QB543oSkSZ8GC+VDnDdc7GwUvwDofjZ0MSU/AVWuyIqEqtzD/ocbc8JsVLKdFaVu5rKUAl6SwmIiFBVMsvLOK+a3pQJb4DsQViBs+dQWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785904181; c=relaxed/simple;
	bh=5x3UVYUZwVvQjyiPIt24nB4i7KtVDPE4B16iLDNAFJU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z8rIhzFpNLV6gLh6fDh+u1hocfQ2rRH06k9qxVlBcUEcV8swqZLkYlZz+RHRFQURiSD6/wx1I8uO6KQGfsG5RfntDfkf6lErvML4XkPfpYUbYo65JVruZ+7/kwO/GzKvc775CcGhsVZ9GGY7d9NmNHpN6NY1KA6t72fYtQZ7X2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h8dfXN2G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h8dfXN2G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC691F000E9;
	Wed,  5 Aug 2026 04:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785904179;
	bh=jxVCgvOnNAGVae7lsoZ2MPmEyRp8+Rla9iiNSWIR0q8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h8dfXN2GWpRePfUe0zltLteiKr7PllbnuvrDgogo3fxLQQ4FUsZUPu/C6iGbUZFFO
	 LQmUjw+jClqW1qlJl7y5gHd9toANKhGWnoOs05Y3W3CBQsf0WNdjHBsgniv+pFx9Yh
	 NtbqWy/RkZl0s72HbwntVn008Am42z7dnYFYOaWL+DaSa3HDnuThaYd33R96llrekX
	 yFVvMpG/YQB1Fo38pJwAf6umK66wz0S0GC/BSLRJhB6NSFjAylG8TIRVjf8ttk0B1j
	 x7MkmED11vYVgjVfJtlovRrsZsSNhMTNrWe+0M1J1OWpa+k+0x7r+xsynW+cZuerWZ
	 x27fZT11zOAdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] security/keys: zeroize key payloads before kdump
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmFuIFNlYmFzdGlhbiBHw7Z0dGU=?= <linux@jaseg.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731154608.153258-5-linux@jaseg.de>
References: <20260731154608.153258-1-linux@jaseg.de>
 <20260731154608.153258-5-linux@jaseg.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 04:29:38 +0000
Message-Id: <20260805042938.DDC691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Key payloads detached during update or revocation and pending RCU =
destruction are skipped, leaking secrets into the crash dump.
- [High] Lockless reading of `big_key` payloads during non-atomic updates c=
auses torn reads, leading to massive out-of-bounds writes during panic zero=
ization.
--

--- Patch [4]: [PATCH 4/4] security/keys: zeroize key payloads before kdump=
 ---
commit 5ba36d14be79dc23bd8b584d1f1a143c55ab30ba
Author: Jan Sebastian G=C3=B6tte <linux@jaseg.de>

security/keys: zeroize key payloads before kdump

When CONFIG_CRASH_ZEROIZE is set, try to erase key payloads on panic
before jumping to the kdump kernel. Implement the zeroize op for
various key types.

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

[Severity: High]
Does this code risk an out-of-bounds write if a panic happens during a key
update?

If big_key_update() is called, it updates the payload via
generic_key_instantiate(), which writes the new buffer pointer to data[0] a=
nd
then updates the length in data[3]:

security/keys/key.c:generic_key_instantiate() {
    rcu_assign_keypointer(key, prep->payload.data[0]);
    key->payload.data[1] =3D prep->payload.data[1];
    key->payload.data[2] =3D prep->payload.data[2];
    key->payload.data[3] =3D prep->payload.data[3];
}

If a panic stops the writer CPU after rcu_assign_keypointer() but before the
length is updated, could big_key_zeroize() read the new, smaller buffer poi=
nter
but use the old, larger length, causing memzero_explicit() to corrupt memory
during the crash dump process?

> +	}
> +}
> +
>  /*
>   * Register key type
>   */
[ ... ]
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
> +
> +	for (node =3D rb_first(&key_serial_tree); node; node =3D rb_next(node))=
 {

[Severity: High]
Does this loop miss key payloads that have been detached but not yet freed?

When a key is updated, the old payload is displaced and queued for RCU free:

security/keys/user_defined.c:user_update() {
    ...
    rcu_assign_keypointer(key, prep->payload.data[0]);
    prep->payload.data[0] =3D NULL;
   =20
    if (zap)
        call_rcu(&zap->rcu, user_free_payload_rcu);
}

If a panic occurs before the RCU grace period completes, the old payload
remains in memory but is no longer reachable via the active keys in
key_serial_tree. Will these displaced payloads containing secrets be leaked
into the crash dump since they are skipped by this zeroization loop?

> +		struct key *key =3D rb_entry(node, struct key, serial_node);
> +
> +		if (key->type =3D=3D &key_type_keyring ||
> +		    key->state =3D=3D KEY_IS_UNINSTANTIATED)
> +			continue;
> +
> +		/* custom zeroize since free'ing isn't safe at this point */
> +		if (key->type->zeroize)
> +			key->type->zeroize(key);
> +	}
> +	/* off to kexec()! */
> +	return NOTIFY_DONE;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731154608.1532=
58-1-linux@jaseg.de?part=3D4
