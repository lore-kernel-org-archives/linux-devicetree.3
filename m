Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EDB34E74D
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 20:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786047915; cv=none; b=SV0QC1GRKq73gSOcg8jE4WQUqAFpfipUZ9zo3QYOaPCKNztspsUbv0zzRog1tlrrkSBYm8Wy7uoKqjL36cN2mSEhw1KovtBeQwI1dfG+EZ8OuX1EwyVEeIF5BcDocSFJ0eCJyn1CwMEqMT+GVXkP5cbxonGzkbT68cixiqdYrUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786047915; c=relaxed/simple;
	bh=sjkoEtjJXrbpVmsmAIGsEBnmUKpVayaIi+OtqvA8VN0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RfMXvhC4kAkLjpIDkXofztJhLKe5NHMxya7EUrZ0pd3V57TN0yhT7C+F4YQOcLBDjUdPOaw53H6Jh7TyqpdiZhb5yHNJz5ReWTniyyhq3i/D9a5KZPCacmz2Uk+/2fCx60NZqhVfWvcBNaGQ//7NFYJErmW7ayNmZXYdptY9aXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKJ9aEoJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKJ9aEoJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DB71F000E9;
	Thu,  6 Aug 2026 20:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786047913;
	bh=zvhMSCKiM7gKLIB57q7WK6hDQ+YNcagJPd/+S58s7Gk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LKJ9aEoJ761Luj7s2wXES++JVKCMmfkCM498bwKeYBSO2aGb4L8Ie3AVCIXU878ea
	 vBfKnX5SSYFO2qOVqLSF4YtW2uEG36seW24vyfHgkPBXnn2YWPXALaTcEWVApCypow
	 eiA7I0sVJjoFUNpF962HV22FM4MQRQgIdCSrYqQ0Y7fDCw6W5JhXuJZPQJ8vdeG06g
	 r2nG7CFFW4VVYHraNyghnl/pjCs4tB0VfdefdDiISW059T2AzgWO28M6LV+FN4zyAF
	 wjdctaQ6tnJ2PMWeSBDp/YtzplGshboqw+3VQtrrESjx5SpTnVK3zYAsHkv+ileZ8b
	 5S87xQYbUdMkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 17/19] Documentation: ioctl: add CMH ioctl
 documentation and register 'J'
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saravanakrishnan Krishnamoorthy" <skrishnamoorthy@rambus.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806195519.2703224-18-skrishnamoorthy@rambus.com>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-18-skrishnamoorthy@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 20:25:11 +0000
Message-Id: <20260806202513.34DB71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] UAPI Architecture Anti-Pattern: Bypassing standard cryptographic s=
ubsystems with a massive custom ioctl interface.
- [High] Privilege Separation and Access Control Violation in device node.
- [Medium] Misleading UAPI Naming in SM2 ECDH Hash struct leads to API misu=
se.
- [Medium] Hardware Error Management Anti-Pattern: Exposing read-to-clear e=
rror state directly to user-space.
--

--- Patch [17]: [PATCH v3 17/19] Documentation: ioctl: add CMH ioctl docume=
ntation and register 'J' ---
commit dcc392785ff594e59facfd1248a64d489fc2a2fd
Author: Alex Ousherovitch <aousherovitch@rambus.com>

Documentation: ioctl: add CMH ioctl documentation and register 'J'

This commit adds documentation for the /dev/cmh_mgmt misc device ioctls
used by the Rambus CryptoManager Hub (CMH) hardware crypto accelerator. It
covers key management, derivation, public-key cryptography, post-quantum
cryptography, and hardware management. It also registers the ioctl magic
number 'J' (0x4A) in ioctl-number.rst.

> diff --git a/Documentation/userspace-api/ioctl/cmh_mgmt.rst b/Documentati=
on/userspace-api/ioctl/cmh_mgmt.rst
> new file mode 100644
> index 0000000000000..d17a77975df6c
> --- /dev/null
> +++ b/Documentation/userspace-api/ioctl/cmh_mgmt.rst

[ ... ]

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

[Severity: High]
Could the global permission check on the device node create a privilege
escalation regression?

Looking at cmh_mgmt_open() in drivers/crypto/cmh/cmh_mgmt.c:

    if (!capable(CAP_SYS_ADMIN))
        return -EPERM;

If an administrator opens /dev/cmh_mgmt and delegates the file descriptor
to an unprivileged process for cryptographic data-plane operations, the
lack of per-ioctl capability checks means that process can escalate its
access to invoke system management operations like DRBG_CONFIG or EAC_READ.

Alternatively, if delegation is not used, this structure forces standard
applications to run as root just to access the crypto hardware.

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
Will this struct naming lead to API misuse and silent protocol failures?

The names peer_id_digest and id_digest naturally imply relative ownership,
but the documentation requires absolute protocol ordering. If a developer
implements the initiator role using the uapi struct fields as named, they
must pass their own digest as peer_id_digest, which contradicts the naming.

[ ... ]

> +Hardware Management ioctls
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +CMH_IOCTL_EAC_READ
> +-------------------
> +
> +Read and clear the hardware Error and Alarm Controller registers.

[ ... ]

> +The eSW atomically reads and clears the registers on each call.
> +Successive reads show only new events since the last read.

[Severity: Medium]
Does exposing read-to-clear error state directly to user-space risk silent
loss of hardware error events?

Looking at cmh_mgmt_eac_read() in drivers/crypto/cmh/cmh_mgmt.c:

    vcq_add_eac_read(&vcq[1], rsp_dma, sizeof(*rsp));

The driver unconditionally fetches and clears the state from hardware
without multiplexing or caching it for other listeners. If multiple
processes, or a daemon and a debugging tool, invoke the EAC_READ ioctl,
each caller steals events from the others, preventing reliable error
monitoring or telemetry.

[ ... ]

> +Relationship to the in-kernel crypto API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The main reason these operations are exposed as ioctls, rather than
> +through the standard in-kernel crypto API, is the CMH datastore key
> +model: an ioctl can operate on a *datastore-referenced* (hardware-held)

[Severity: High]
Does bypassing standard cryptographic subsystems introduce a fragmentation
regression for the user-space ecosystem?

By bypassing standard kernel abstractions like AF_ALG or the keys subsystem
in favor of a vendor-specific uapi, this approach commits the kernel to
permanently maintaining a massive set of custom ioctls and requires
applications to implement vendor-specific code instead of relying on
standard interfaces.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806195519.2703=
224-1-skrishnamoorthy@rambus.com?part=3D17
