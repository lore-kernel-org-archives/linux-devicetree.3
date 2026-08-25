Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5DD3A9639
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787697012; cv=none; b=E5DzLle2k0/xv0eOLBmnRPSCHbZ6vXSeD5msrJoews0esG503KOJ1z64X0QFLo6fikI9HKYNze9Bjn7dW34HLGpwecfqYJMVr/MTVm3qSCaUce3BNPuAh4+cRM+vBOmWeiL40s5Xp7wZ/HPrj/KXOuUoy4AT+yt9dgiePBW6hiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787697012; c=relaxed/simple;
	bh=Pjxw5sJ0vKNmgGEHSg/UAgyHQsZJnD0Zy9bA+35WCbc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sD9lm31HDJao51Ouc+bl984cRFinr1tXLtm+Rg02A1vZ6qpf9i8hD+MrmV3iok8+1HomHkqvrjcrc0T05e+iDk8/AHWTy0RYLo/2xRMOfZVFqT14ipD9+3tEVa5IlNQOqY6IdJjA2/RGmAjoqqzP8qsNmKE/h+H7XXvlkotbmMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGCpgHx4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGCpgHx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9986B1F00A3A;
	Tue, 25 Aug 2026 22:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787697010;
	bh=bSv8MUWOMPAN25awP8qmPHtPgASAZEUEF8lg0kG2O98=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hGCpgHx4UYadjgs8lT3g6Mjh958R7pilLo2IwJcj95rAIF5RkHgMfGZhVbRPxEJY0
	 Pph6xxPDmz+5xvt0Bggj8zQZ6Ac/XGhoSmjbd1//Ac8MnHpoWfUmNcuM2xfCmqIjKy
	 QM7wGTVxCLekzs7+kGdrQUfAgC4ovpCct+E+XtPmYkgfhGsVCbc6ZqGZwfQjVLhQEi
	 2B7wqViqtUv78kLvUCbzP9ldxFCiRrvTAcsG3GsyB14MFUVaLDpHkuZC7zyah43tb8
	 c7dxvEE7ZaU7dlv5gOeTVB/75JzdWn0WOPQT7EMHpNgKS+Y47XXjDuOOxfooNZ2cQp
	 VDRoLerKMNGTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/19] crypto: cmh - add key provisioning and
 management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Ousherovitch" <aousherovitch@rambus.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825221539.255951-4-aousherovitch@rambus.com>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-4-aousherovitch@rambus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 22:30:10 +0000
Message-Id: <20260825223010.9986B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Persistent datastore objects are permanently leaked on success and=
 error paths, allowing unprivileged DoS of the hardware datastore.
- [High] Missing `PKE_SWAP_FLAGS` in `cmh_mgmt_sm2_ecdh_hash` causes crypto=
graphic corruption.
- [High] Treating DMA address 0 as "absent" causes silent cryptographic deg=
radation and mapping leaks.
- [High] Unprotected concurrent access to `SYS_REF_TEMP` allows cross-proce=
ss crypto key theft and corruption.
- [High] RSA buffer lengths are calculated via truncation, causing hardware=
 DMA overflows on unaligned key sizes.
- [Medium] Cryptographic randomness buffers are freed with `kfree()` instea=
d of `kfree_sensitive()`, leaking secrets.
- [Medium] `KEY_READ` fails to apply the reverse byte-swap for PKE keys, re=
turning obfuscated keys to userspace.
--

commit 67f85ec0363d5636a036b63752d2d0407ae36205
Author: Alex Ousherovitch <aousherovitch@rambus.com>

crypto: cmh - add key provisioning and management

The in-kernel crypto API cannot express the CMH management plane, so
this patch adds a character device (/dev/cmh_mgmt) for it. The ioctl
commands fall into two groups, enabling datastore key lifecycle
management, KIC derivation, and asymmetric/PQC operations that keep
the private key hardware-resident.

> diff --git a/drivers/crypto/cmh/cmh_mgmt.c b/drivers/crypto/cmh/cmh_mgmt.c
> new file mode 100644
> index 0000000000000..c17a60a436c0f
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_mgmt.c

[ ... ]

> @@ -274,6 +274,10 @@ static int cmh_mgmt_key_read(void __user *argp)
>  		return -ENOMEM;
>  	}
> =20
>  	vcq_set_header(&vcq[0], MGMT_VCQ_CMDS);
>  	vcq_add_sys_read(&vcq[1], req.ref, dma_addr, req.wrap_key, req.len);
>  	vcq_add_sys_flush(&vcq[2]);

[Severity: Medium]
Does this command need to conditionally reverse the PKE byte swap?

If a user writes an RSA or ECC key via KEY_WRITE, the driver applies
PKE_SWAP_FLAGS to store it in the internal big-endian representation.

Since the flags are not reversed here, could this return obfuscated, swapped
keys back to userspace?

[ ... ]

> @@ -661,6 +661,10 @@ static int cmh_mgmt_kic_hkdf1(void __user *argp)
>  out_ref:
>  	if (ref_buf) {
>  		cmh_dma_unmap_single(ref_dma, sizeof(*ref_buf),
>  				     DMA_FROM_DEVICE);
>  		kfree(ref_buf);
>  	}
>  	return ret;
>  }

[Severity: High]
Could this error path leak a persistent datastore object?

If cmh_tm_submit_sync_mbx() fails after the SYS_CMD_NEW command has already
executed and allocated the slot, this path does not call cmh_mgmt_ds_scrub(=
).

This appears to leave an orphaned slot in the hardware datastore. Could a
caller repeatedly trigger timeouts or failures here to exhaust the finite
datastore capacity?

[ ... ]

> @@ -1094,6 +1094,10 @@ static int cmh_mgmt_kic_aes_cmac_kdf(void __user *=
argp)
>  out_unmap_label_cmac:
>  	if (label_buf && !cmh_dma_map_error(label_dma) && label_dma)
>  		cmh_dma_unmap_single(label_dma, req.label_len, DMA_TO_DEVICE);

[Severity: High]
Is it safe to treat DMA address 0 as an invalid mapping here?

On many architectures, 0 is a valid IOVA. The && label_dma check means the
mapping will be leaked if the label happens to map to address 0.

[ ... ]

> @@ -1470,6 +1470,12 @@ static long cmh_mgmt_ioctl(struct file *file, unsi=
gned int cmd,
>  			   unsigned long arg)
>  {
>  	void __user *argp =3D (void __user *)arg;
>  	int ret;
> =20
>  	if (cmh_mgmt_needs_temp_flush(cmd) &&
>  	    atomic_xchg(&mgmt_temp_dirty, 0)) {
>  		ret =3D cmh_tm_flush_mbx(MGMT_MBX);

[Severity: High]
Is the per-mailbox SYS_REF_TEMP state fully protected here?

The lockless atomic_xchg combined with the lack of an ioctl-level mutex
appears to leave the temporary key store vulnerable to concurrent clobberin=
g.

If two processes interleave calls (e.g., one doing KIC_HKDF1 and another
doing DS_EXPORT), could temporary keys derived by one process be exported or
overwritten by the other?

> diff --git a/drivers/crypto/cmh/cmh_mgmt_pke.c b/drivers/crypto/cmh/cmh_m=
gmt_pke.c
> new file mode 100644
> index 0000000000000..649ad20086579
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_mgmt_pke.c

[ ... ]

> @@ -50,6 +50,10 @@ int cmh_mgmt_pke_rsa_enc(void __user *argp)
>  	if (req.bits < PKE_RSA_MIN_BITS || req.bits > PKE_RSA_MAX_BITS)
>  		return -EINVAL;
>  	if (!req.e_len || req.e_len > PKE_MAX_OPERAND)
>  		return -EINVAL;
> =20
>  	n_len =3D req.bits / 8;

[Severity: High]
If req.bits is not a multiple of 8 (e.g., 2049), does this integer division
drop the fractional byte?

This would underestimate the required DMA buffer size.

Could the hardware then write more bytes than the buffer holds, leading to
memory corruption or an IOMMU fault?

> diff --git a/drivers/crypto/cmh/cmh_mgmt_pqc.c b/drivers/crypto/cmh/cmh_m=
gmt_pqc.c
> new file mode 100644
> index 0000000000000..83af21eec716e
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_mgmt_pqc.c

[ ... ]

> @@ -852,6 +852,10 @@ int cmh_mgmt_ml_dsa_sign(void __user *argp)
>  out_unmap:
>  	if (rnd_dma && !cmh_dma_map_error(rnd_dma))
>  		cmh_dma_unmap_single(rnd_dma, rnd_len, DMA_TO_DEVICE);

[Severity: High]
Is this if (rnd_dma) check correct for validating the DMA mapping?

As mentioned earlier, DMA address 0 is a valid IOVA on some platforms. If t=
he
mapping returns 0, this check evaluates to false and skips unmapping, which
leaks the mapping.

If the hardware interprets a 0 pointer as absent randomness, could this also
silently drop the randomness from the signature generation, degrading its
security?

[ ... ]

> @@ -869,6 +873,11 @@ int cmh_mgmt_ml_dsa_sign(void __user *argp)
>  out_free:
>  	kfree(rnd_buf);
>  	kfree(sig_buf);
>  	kfree(m_buf);
>  	kfree_sensitive(sk_buf);
>  	return ret;
>  }

[Severity: Medium]
Should rnd_buf be cleared with kfree_sensitive() instead of kfree()?

This buffer holds the user's secret cryptographic randomness.

Freeing it without zeroization leaves sensitive secrets in the kernel heap,
where they might be exposed by a memory leak vulnerability.

> diff --git a/drivers/crypto/cmh/cmh_pke_sm2.c b/drivers/crypto/cmh/cmh_pk=
e_sm2.c
> new file mode 100644
> index 0000000000000..9daeaaa948281
> --- /dev/null
> +++ b/drivers/crypto/cmh/cmh_pke_sm2.c

[ ... ]

> @@ -622,6 +622,10 @@ int cmh_mgmt_sm2_ecdh_hash(void __user *argp)
>  	/* Phase 2: read shared key from DS -> DMA */
>  	vcq_set_header(&vcq[0], 3);
>  	vcq_add_sys_data(&vcq[1], *ref_buf, sk_dma, SM2_SHARED_KEY_LEN);
>  	vcq_add_sys_flush(&vcq[2]);

[Severity: High]
Does this missing PKE_SWAP_FLAGS cause cryptographic corruption?

In Phase 1 and in SM2_ECDH, the command is OR'd with PKE_SWAP_FLAGS to
reverse the byte order.

Since vcq[1].id is not modified here, will the shared key be returned to
userspace in the internal big-endian format rather than the host's format?

[ ... ]

> @@ -651,6 +655,8 @@ int cmh_mgmt_sm2_ecdh_hash(void __user *argp)
>  out_unmap:
>  	if (!cmh_dma_map_error(ref_dma))
>  		cmh_dma_unmap_single(ref_dma, sizeof(u64), DMA_FROM_DEVICE);

[Severity: High]
Is it possible that the persistent datastore object referenced by *ref_buf
is permanently leaked here?

The *ref_buf object created by SYS_CMD_NEW is never scrubbed on the success
path or the error path.

Could repeated calls to this ioctl exhaust the finite datastore capacity
and brick the hardware until a reset?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825221539.2559=
51-1-aousherovitch@rambus.com?part=3D3
