Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4F13E92B5
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786967551; cv=none; b=D9Ipo1VZiWcO3+fmMVanFa3Chelq82U07M31y3ugUsuEwV9BeoMRXrLPd0aWrg62NvDEArxtIfYj/3nIBPsefalT/zKzNw9Eu09wOQQDWjguQrozmatj8U1qzBiBdty3TAxKaFNy4g3E6xu+7a9PnXBV0lKo2zNu6RgQlpDBLJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786967551; c=relaxed/simple;
	bh=kpIlRef1UsvcxMzzHYAJxvn/CmmKAwm452iTi+bUDhM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q3TlymAICY6x3+KlJPMNuSZYmteQDDq3z9wz6GJoXONoESFUhCoZD8IVO10D3HJGoZVhhPqUWvwqLqvk647yNko7n6Lk4W/HRtgvZitj+RpgHrIhdGTGwWP8I6jwpgd6PrOBQ7gMpCc5Co/KgNVbdUA1zb2Ku4fEUybihYK4TbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFQp0ilo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFQp0ilo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9CB01F000E9;
	Mon, 17 Aug 2026 11:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786967550;
	bh=c3JuC82Ira9B4K76DVYQKEvOWtnFSnFONhGBjjkEiSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eFQp0ilo501ypAq6nTsIRO2rjyDPNIplfoszodQFCo2BwEEK6AJBnOcobInRf72EP
	 xl4ur2KpYYGkuIHi7JoEjrR5otdhOLErjUW92LtcacCoQR6ih0ZUGw2rjsPJLTQ6Yn
	 zEi6vZcoxJGCTbnT8H1z4lI6wRlhGWeOI3YzdYxMJE/s/IojHcrQL/5wxlzPsJlegS
	 P1dQpZEKG1FeL5mDalyx6/cQ+ZlwFjmZUW13dawkiRNR9xFcZh/PTuPUd5H6TQ6mdV
	 Z5weLRCdk6CJKl+v5Rnx9xmk0HG5i0uiUGqHFsyFAxJ30bvKyRw0k2qWxwqQPcut+M
	 RQ0kIQfF0HGVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] rust: drm: add KUnit tests for panel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Albert Esteve" <aesteve@redhat.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, ojeda@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260817-drm_panel_bindings-v1-5-1f974508a31c@redhat.com>
References: <20260817-drm_panel_bindings-v1-0-1f974508a31c@redhat.com>
 <20260817-drm_panel_bindings-v1-5-1f974508a31c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 11:52:29 +0000
Message-Id: <20260817115229.E9CB01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] Missing Kconfig dependency on DRM for RUST_DRM_PANEL_KUNIT_TEST
- [Low] Horizontal import formatting violates subsystem guidelines.

Pre-existing issues:
- [Critical] `Panel::from_of_node` creates an `ARef<Panel>` without increme=
nting the reference count, leading to premature free and use-after-free.
- [Critical] `Panel::new` improperly steals the devres-managed reference co=
unt, leading to use-after-free and double-free.
--

--- Patch [5]: [PATCH 5/5] rust: drm: add KUnit tests for panel ---
commit 075cc8b6578147fc552359e30a2b237e1bdb801a
Author: Albert Esteve <aesteve@redhat.com>

rust: drm: add KUnit tests for panel

Add a test module to verify basic data type conversions and layout for
the Rust DRM panel API.

> diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
> index e6a5c7a795f0f..397b916dca0d4 100644
> --- a/rust/kernel/Kconfig.test
> +++ b/rust/kernel/Kconfig.test
> @@ -83,4 +83,14 @@ config RUST_BITFIELD_KUNIT_TEST
> =20
>  	  If unsure, say N.
> =20
> +config RUST_DRM_PANEL_KUNIT_TEST
> +	bool "KUnit tests for Rust panel API" if !KUNIT_ALL_TESTS

[Severity: Low]
Will this Kconfig option be available even when CONFIG_DRM is disabled?

Since the tests reside in rust/kernel/drm/panel.rs which is compiled
conditionally under CONFIG_DRM, could this result in a dead configuration
option where Kconfig allows enabling the test without DRM, causing the
code to be silently skipped during compilation?

> +	default KUNIT_ALL_TESTS
> +	help
> +	  This option enables KUnit tests for the Rust panel API.
> +	  These are only for development and testing, not for regular
> +	  kernel use cases.
> +
> +	  If unsure, say N.
> +
>  endif
> diff --git a/rust/kernel/drm/panel.rs b/rust/kernel/drm/panel.rs
> index 8f87774e06ed7..3da203c39edd6 100644
> --- a/rust/kernel/drm/panel.rs
> +++ b/rust/kernel/drm/panel.rs
> @@ -595,3 +595,90 @@ pub(crate) const fn build() -> &'static bindings::dr=
m_panel_funcs {
>          &Self::VTABLE
>      }
>  }
> +
> +#[cfg(CONFIG_RUST_DRM_PANEL_KUNIT_TEST)]
> +#[macros::kunit_tests(rust_kernel_drm_panel)]
> +mod tests {
> +    use super::*;
> +    use core::mem::{align_of, offset_of, size_of, ManuallyDrop, MaybeUni=
nit};

[Severity: Low]
Does this horizontal import list violate the Rust subsystem guidelines?

The guidelines mandate following the kernel vertical import style when
commits touch imports, so shouldn't each import be placed on its own line?

[ ... ]

While reviewing this file, I noticed a couple of pre-existing issues in
rust/kernel/drm/panel.rs:

rust/kernel/drm/panel.rs:from_of_node() {
    ...
    // SAFETY: `from_err_ptr` guarantees a non-null pointer on success.
    // `of_drm_find_panel` returns a kref-incremented reference.
    Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(panel).cast()) })
}

[Severity: Critical]
This is a pre-existing issue, but I noticed that of_drm_find_panel() returns
a pointer without calling drm_panel_get() to increment its reference count.

Since ARef::from_raw() takes ownership of a reference count increment that
doesn't actually exist, will dropping the returned ARef<Panel> decrement the
panel's kref via drm_panel_put(), effectively stealing a reference and
causing the panel to be prematurely freed?


rust/kernel/drm/panel.rs:new() {
    ...
    let raw =3D unsafe {
        (container as *mut u8)
            .add(core::mem::offset_of!(PanelContainer<T>, panel))
            .cast::<bindings::drm_panel>()
    };

    // SAFETY: `__devm_drm_panel_alloc` was successful, hence `raw` is valid
    // and the refcount is non-zero.
    Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(raw).cast()) })
}

[Severity: Critical]
This isn't a bug introduced by this patch, but does Panel::new steal the
devres-managed reference count here?

__devm_drm_panel_alloc() allocates the panel, initializes the kref to 1,
and registers a devres action that owns this initial kref. By wrapping the
returned pointer in ARef::from_raw(), we assume ownership of an existing
reference count without incrementing it.

If the ARef is dropped, the kref reaches 0 and the panel is freed. Later,
when the device unbinds, won't devres execute its action on the freed
memory, causing a use-after-free or double-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-drm_panel_=
bindings-v1-0-1f974508a31c@redhat.com?part=3D5
