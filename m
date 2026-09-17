Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC874A498C
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 23:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789687035; cv=none; b=IQLnlRogNU9lkpn/5UkWkwpFu5YIebm1nzynoo6BMf+nncX+lLMXsxlqDNPvGSrwkn/90ZUBto3tUCI7k0MZ3V59OM+b7CjZ+4yzzrOocZVIYlsjB1mmRspTC0tYQwabKLg1PNgYFuE9VLoQZkkKAyx/BLfhUF+6RHeuVmdeT8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789687035; c=relaxed/simple;
	bh=YLNem3tHP2DEVdC6e05WoSvB+x/pLYuLFk4TKKJ56W0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M7J8QWSq1OySG98Zy8YIPmzMljB54VsbINEwR+ID38KPC5136L8hoTnGF2DZq+d3WDGBQp5d2b/8Xk+x7PnYqmaK6wDvgDfGmZgHCSo9tibz3flYWPRhuiGN2rDUgJGCQ4jfTDA6R1XgZ98NVYm9FzF3N0MO1kaZmx6nEQSA+yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTYN3RBG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTYN3RBG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54101F000FF;
	Thu, 17 Sep 2026 23:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789687029;
	bh=RcsglbEZvEF/BGSQEk+6yl7CFyxlsWzxf514814SBME=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YTYN3RBGVuQKbI9eHf5xS+UbzZHLYKfpgY9Z1ot7XP8mLg9AIR/Ddek+xVBtpPnI8
	 C5R2rlbriT7bnmwVOuO2oSJKr1O7+E+7bGq5vbzwibQjiv0LlvKvwRkSYP7MQvSBfT
	 UpCtGqv09NJ7zEM2BSF7kNC8amIVAzKr5bKpl7K0GOqRAOIUEhF2A6RCjja2OLswCJ
	 5Xkoh3jkobRYCE5FNx8qsXgNQgwS8L4tj+I0uJ27iRDM9l9UGkTu8N7/+FAljfo871
	 4n9LjCgeuDgEy9zm81m5WogiptZka8qWXCh2r1kdZqrtBox0KJYfIeeDS/BH7b6+4f
	 L2+BrNSHE44hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 17/19] Documentation: ioctl: add CMH ioctl
 documentation and register 'J'
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260917225929.2494111-18-aousherovitch@rambus.com>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-18-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 23:17:08 +0000
Message-Id: <20260917231708.B54101F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] crypto: cmh: race condition on shared SYS_REF_TEMP state across io=
ctls
- [Medium] crypto: cmh: UAPI bypasses standard Linux crypto and keys subsys=
tems
- [Medium] crypto: cmh: missing explicit output buffer lengths in UAPI stru=
cts
- [Medium] crypto: cmh: dangerous naming of SM2 ECDH digest fields
- [Low] crypto: cmh: static inline version field violates UAPI extensibilit=
y guidelines
--

commit 80c4f648ec1405769d1e6246fab5f42797923a76
Author: Alex Ousherovitch <aousherovitch@rambus.com>

Documentation: ioctl: add CMH ioctl documentation and register 'J'

Add Documentation/userspace-api/ioctl/cmh_mgmt.rst documenting the
ioctl commands on the /dev/cmh_mgmt misc device for the Rambus
CryptoManager Hub (CMH) hardware crypto accelerator driver.  Covers
key management, KIC key derivation, PKE (RSA, ECDSA, ECDH, EdDSA),
PQC (ML-KEM, ML-DSA, SLH-DSA), SM2, EAC, and DRBG.

> diff --git a/Documentation/userspace-api/ioctl/cmh_mgmt.rst b/Documentati=
on/userspace-api/ioctl/cmh_mgmt.rst
> new file mode 100644
> index 0000000000000..c02bac1287874
> --- /dev/null
> +++ b/Documentation/userspace-api/ioctl/cmh_mgmt.rst
> @@ -0,0 +1,1292 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +CMH Key Management ioctl Interface (cmh_mgmt)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +:Author: Cryptography Research, Inc. (CRI)
> +:Maintainer: linux-crypto@vger.kernel.org
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The ``/dev/cmh_mgmt`` character device provides user-space access to key
> +management, key derivation, public-key, and post-quantum cryptographic
> +operations on the CryptoManager Hub (CMH) hardware accelerator.
> +
> +The device is created by the ``cmh`` kernel module as a ``misc_device``.
> +All operations are synchronous -- the ioctl blocks until the hardware
> +completes.  Opening the device requires ``CAP_SYS_ADMIN``.
> +
> +All ioctl argument structures are versioned: user space sets the
> +``version`` field to ``CMH_MGMT_V1`` (currently 1).  This allows the

[Severity: Low]
Does this UAPI extensibility design match current kernel standards?
Using a static inline version field forces the driver to maintain brittle
switch statements for every struct version. Standard kernel practice relies
on size-based extensibility (copy_struct_from_user combined with _IOC_SIZE).

> +driver to extend structures in the future without breaking the ABI.

[ ... ]

> +Mailbox Dispatch
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +All ``/dev/cmh_mgmt`` ioctls are submitted on a single management
> +mailbox.  This is a structural requirement of the eSW datastore model,
> +not a tunable:
> +
> +* Datastore access control is **per-mailbox**.  ``KEY_NEW`` grants the
> +  creating mailbox read/write/execute access; other mailboxes have none
> +  until granted.  The returned 64-bit ``ref`` encodes a randomised
> +  offset and does **not** carry the owning mailbox, so an operation that
> +  receives only a ``ref`` (``KEY_GRANT``, ``KEY_READ``, ``KEY_DELETE``,
> +  ``DS_EXPORT``) cannot itself determine which mailbox owns the object.
> +  Using one fixed management mailbox guarantees that a key's create,
> +  modify, grant, read and hardware-held-key compute steps all share the
> +  mailbox that holds its access rights, without exposing mailbox
> +  identity in the UABI.  User space may still widen a key's access to
> +  additional mailboxes via ``KEY_GRANT``.
> +
> +* The eSW ``SYS_REF_TEMP`` scratch store is per-mailbox and persists
> +  across ioctl calls, so a multi-step flow that derives into
> +  ``SYS_REF_TEMP`` (for example a ``KIC_*`` derivation) and later

[Severity: High]
Does this globally shared resource map multi-step flows without isolation?

Because all operations are directed to a single management mailbox, concurr=
ent
calls from different user-space contexts could overwrite each other's tempo=
rary
state in SYS_REF_TEMP, leading to cross-process key material leakage or data
corruption.

> +  consumes it (``DS_EXPORT`` with ``wrap_key =3D SYS_REF_TEMP``) requires
> +  both calls to use the same mailbox.

[ ... ]

> +CMH_IOCTL_PKE_RSA_ENC
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +RSA public-key encryption.
> +
> +:Direction: ``_IOWR``
> +:Number: 0x10
> +:Argument: ``struct cmh_ioctl_pke_rsa_enc``
> +
> +::
> +
> +  struct cmh_ioctl_pke_rsa_enc {
> +      __u32 version;
> +      __u32 bits;        /* RSA key size in bits (512-4096) */
> +      __u64 e;           /* user-space pointer to public exponent */
> +      __u32 e_len;       /* exponent length in bytes */
> +      __u32 __reserved;
> +      __u64 n;           /* user-space pointer to modulus */
> +      __u64 input;       /* user-space pointer to input data */
> +      __u64 output;      /* user-space pointer to output buffer */
> +  };

[Severity: Medium]
Can the kernel blindly overwrite user-space memory here?

Since there is no explicit output length field like output_len in
cmh_ioctl_pke_rsa_enc or cmh_ioctl_sm2_enc_hash, if user-space allocates a
small buffer but specifies a large key size (e.g. bits=3D4096), the driver =
might
infer the output size from the bits parameter and overwrite memory outside =
the
provided buffer.

[ ... ]

> +CMH_IOCTL_SM2_ECDH_HASH
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Derive the shared key from the shared point and ZA digests.
> +
> +:Direction: ``_IOWR``
> +:Number: 0x35
> +:Argument: ``struct cmh_ioctl_sm2_ecdh_hash``
> +
> +::
> +
> +  struct cmh_ioctl_sm2_ecdh_hash {
> +      __u32 version;
> +      __u32 __reserved;
> +      __u64 peer_id_digest;    /* ptr to Z_A -- initiator's digest (32B)=
 */
> +      __u64 id_digest;         /* ptr to Z_B -- responder's digest (32B)=
 */

[Severity: Medium]
Could this naming cause developer confusion and incorrect key derivations?

The terms peer_id_digest and id_digest imply a relative relationship to the
caller, but the API requires absolute ordering (Initiator =3D Z_A,
Responder =3D Z_B). An initiator would be forced to unintuitively pass their
own digest into the peer_id_digest field.

> +      __u64 shared_point_ref;  /* DS reference from SM2_ECDH */
> +      __u64 shared_key;        /* [out] ptr to shared key (16B) */
> +  };

[ ... ]

> +Relationship to the in-kernel crypto API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The main reason these operations are exposed as ioctls, rather than
> +through the standard in-kernel crypto API, is the CMH datastore key
> +model: an ioctl can operate on a *datastore-referenced* (hardware-held)

[Severity: Medium]
Is this justification for bypassing standard kernel subsystems accurate?

The claim is that standard crypto .setkey() requires raw key material,
which justifies the custom ioctl interface. However, some of these custom
ioctls (like CMH_IOCTL_PKE_RSA_ENC) still accept raw bytes. Furthermore,
the standard Asymmetric Keys (security/keys/) subsystem natively supports
opaque, hardware-held tokens.

> +key, identified only by a ``ref`` or CID, whose raw bytes the CPU never
> +sees.  The standard crypto API cannot express this -- every
> +``.setkey()`` takes raw key material -- so hardware key lifecycle
> +(create, import, derive, grant, destroy) and compute-on-hardware-held-key
> +operations have no crypto API equivalent and are only reachable here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917225929.2494=
111-1-aousherovitch@rambus.com?part=3D17
