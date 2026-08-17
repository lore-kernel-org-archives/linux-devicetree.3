Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46373A8FE1
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 11:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786967222; cv=none; b=XnX1KcZsfMod/DVvSAxIRbftltiDgbH/e8Uzz28SZmYOmV4/aZNF0iT1ZCJY4OHFn5DOyEvjlQjUAGjWUC1hxnLGD9Mkz2gjzs/svtDif3ykG/sTxA7zKAXObqbfqXfVUEFKrYAdur6+tBuux4dMyUJM9Jq9a40Y/N/5HfN49dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786967222; c=relaxed/simple;
	bh=x7SUlNn+sYrLvDBwM3011lJAriD5IDtE8cIN0SaasQ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hdUlWWCqZdcB/bPY4Brn4DWgEBk3HKFA5ubqTRotG78/WdR7nIsuDETQjm3AR7UzIs6rWQ4Ts530BQO9csPwQbbymLMJQdidm1Rre/dLWtAWolmRNltkPJtcZLLsCpjDl72HSgLzVFHlXGkJXF+7JGH4+E2TyWpsoVt6EqwBvao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzfqnUzM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzfqnUzM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014081F000E9;
	Mon, 17 Aug 2026 11:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786967220;
	bh=8gOrGIJS8qBK794BPrHagXX/EF34XXrveZ5B8bezYNI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kzfqnUzM9EW6aSYJ2slOUYv6u9xrAwKdMm0Qq1+d0MXAPhV1JrZwtDk74m4MRu3Cw
	 FEZyG/hubVPcdKDTotwAvY6RPn5qOPTsu8mrd2g0gghaxT6ehvty0hgGW97+VhpAhP
	 IAMnl9F/hluaw2UaD6ywoyPhap0LU8YrFJ33zkpEOXmw91eGjn7KylKpcH6dDrnhNc
	 wUWK57UEGOa1zWxKhYWFazSx6DiGo8gN5am+SfJ2Kv2iGAXJT7JIhtzougBenxN/Wt
	 lqFRqalFNn7XIR8h7ZN1ELrfXC0UBctrEAxNZ915eaufWvRXNXiTq6pAQkVyUQOsy6
	 PjEKQWXPXr8bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] rust: drm: add connector abstraction
Reply-To: sashiko-reviews@lists.linux.dev
To: "Albert Esteve" <aesteve@redhat.com>
Cc: dri-devel@lists.freedesktop.org, ojeda@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260817-drm_panel_bindings-v1-2-1f974508a31c@redhat.com>
References: <20260817-drm_panel_bindings-v1-0-1f974508a31c@redhat.com>
 <20260817-drm_panel_bindings-v1-2-1f974508a31c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 11:46:59 +0000
Message-Id: <20260817114700.014081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `Connector` struct's `# Invariants` documentation incorrectly r=
eferences an 'inner pointer', whereas the struct is a transparent wrapper a=
round an `Opaque` type.
- [Low] The forwarding methods `from_raw` and `as_raw` in the `Connector` a=
bstraction lack the required `#[inline]` attribute.
--

--- Patch [2]: [PATCH 2/5] rust: drm: add connector abstraction ---
commit 3b78dba370077b309a3e8fb4bdf3afb4e77c1754
Author: Albert Esteve <aesteve@redhat.com>

rust: drm: add connector abstraction

Add DRM Connector abstraction wrapping struct drm_connector.
Used by the DRM panel abstractions added in the following patch.

> diff --git a/rust/kernel/drm/connector.rs b/rust/kernel/drm/connector.rs
> new file mode 100644
> index 0000000000000..b3b36644375dd
> --- /dev/null
> +++ b/rust/kernel/drm/connector.rs
> @@ -0,0 +1,33 @@
[ ... ]
> +/// A DRM connector (`struct drm_connector`).
> +///
> +/// # Invariants
> +///
> +/// The inner pointer is always a valid, non-null pointer to a `struct d=
rm_connector`.
> +#[repr(transparent)]
> +pub struct Connector(Opaque<bindings::drm_connector>);

[Severity: Low]
this isn't a bug, but the invariant documentation references an "inner poin=
ter".
Since the struct directly wraps an Opaque type rather than holding a pointer
itself, should this be updated to reflect that?

> +
> +impl Connector {
> +    /// Creates a reference to a [`Connector`] from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must be a valid, non-null pointer to a `struct drm_connect=
or` that
> +    /// remains valid for at least the lifetime `'a`.
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_connector) -> &'a=
 Self {

[Severity: Low]
this isn't a bug, but as a small forwarding function for an abstraction, sh=
ould
this method be annotated with #[inline]?

> +        // SAFETY: Caller guarantees `ptr` is valid and lives for `'a`.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Returns the raw pointer to the underlying `struct drm_connector`.
> +    pub fn as_raw(&self) -> *mut bindings::drm_connector {

[Severity: Low]
this isn't a bug, but should this method also be annotated with #[inline]
since it merely forwards to the underlying binding call?

> +        self.0.get()
> +    }
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-drm_panel_=
bindings-v1-0-1f974508a31c@redhat.com?part=3D2
