Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543314;
	b=ZDmSttkJJNs1yf5oL7egC3wdcfGpH67EwNfvC+yWZb99DGD0af2/OyXbIAyZmjO8JHKY
	 wXsWcwUbUU71NxyvLyQbXbAY8DW7S13jlbfGTrsixw+TymMQ1rkO3rnq7cRibC3CzbEhh
	 gmGFNiwfVLsXHVWE+7Zk95c8z1oNWixbck3nUHob75LhbfbV9Fbn1pxELa16/htoN8fDQ
	 Jqcaz4qeSBMCoCyFIyHCJOMW3eAKYTeZqk8syEx+S4FZpDK5zaZ+jHr7Idl9Ri3TmJa8T
	 iwRfRqpJeO0AN+C7Eix21JB/hE3iAw6lBL++wrjC/pn+uOhHl65WBePYpfijn/hDMlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543314;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Vl4D4TzrMDl5CpRXmkA/SpfEqieMVRmHrivqM5+deBU=;
	b=Bqix3Ubn11gXaXCr00iHc/ehpdv0gcAJMFuzOmcSZPzQNwJhOybyIw/Nmuk57iRYZvnb
	 gFgQUrRI+RwDXdk3EOiOKoSEq7HTwh6A8Fjam+obiZzSGO8OL289V1a6uvnTScJ+WoVZV
	 ubVWsJmWBGvfpiq7DaQnHG75GDGT473r+R3KN/nbaJCnYCZxcUcvrWxuMLfLvnfvFz0KY
	 w4IDoWyRqevI3B3EfR4ubba9o192+Xf6WbO70vEnvCEK+Do1fKvuB42W9gD5TnqtSfkbO
	 maSSC136gIPpnI9P5pZrHHKfo6aOfm2PsrDgJdtUWHOdWX0oA47yXchye+gxq56KvKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQBEaiR7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1AC606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 18:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQBEaiR7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF461F000C0;
	Tue, 24 Nov 2026 18:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795543313;
	bh=Vl4D4TzrMDl5CpRXmkA/SpfEqieMVRmHrivqM5+deBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WQBEaiR76Na3PK2t7r1ESmipOjp9f8iFyVpzvkPlBxMMIZEo4GIGMsSya5V5UFksQ
	 p7JeOzSoVmkN9F+HSrdXJTqq6qlmgQxLuuMF17En3+kI4/e/me4EjAl+3nLaJ4hMIL
	 FsAZwekOg1ylaRQtYqwDA/DXbtubHusQ8H7xMHov37XrhQwI+sz9d2qV1ACipiq3Me
	 MdgRv+rqYFsiul8xKdC+7/LC3Xi1p/aByjbtepanlTLmVxAtFzm5wullA13eYnVC6g
	 px1xN3PbNAqSAae8seOWXfbVOaUxfTqtMfjBtCSyTxkVHlTty/WGkV8Jn01s+VI886
	 uhC388KVwJGDw==
Message-ID: <sashiko-outbox-231762@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] misc: Add FPC1540 fingerprint sensor driver for
 QSEE apps
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armandas Kvietkus" <armandas.kvietkus@proton.me>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-fpc1540-tee-v1-4-6c6985f05b06@proton.me>
References: <20261124-fpc1540-tee-v1-0-6c6985f05b06@proton.me>
 <20261124-fpc1540-tee-v1-4-6c6985f05b06@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 18:01:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 9 potential
issues to consider:
- [High] misc: fpc1540-tee: missing qcom_scm_is_available() check in
  fpc_tee_probe()
- [High] misc: fpc1540-tee: fpc_tee_read() returns 0 events instead of
  -EAGAIN
- [Medium] misc: fpc1540-tee: unbalanced wakeup and IRQ wake on
  fpc_tee_probe() error
- [Medium] misc: fpc1540-tee: unbalanced wakeup and IRQ wake in
  fpc_tee_remove()
- [Medium] misc: fpc1540-tee: ELF header overflow in
  fpc_tee_read_image()
- [Medium] misc: fpc1540-tee: unhandled GPIO error and race in IRQ
  handling
- [Medium] misc: fpc1540-tee: unlocked teardown and UAF race in
  fpc_tee_remove()
- [Medium] misc: fpc1540-tee: unverified size in second pass of
  fpc_tee_read_image()
- [Low] misc: fpc1540-tee: double firmware load and bounce buffer in
  fpc_tee_load()
--

commit 23089f4b85a359ddf10f0fa7ac60bd5d6f60b0d1
Author: Armandas Kvietkus <armandas.kvietkus@proton.me>

misc: Add FPC1540 fingerprint sensor driver for QSEE apps

This commit adds a misc driver for the FPC1540 fingerprint sensor on
Qualcomm platforms, handling power, reset, interrupt reporting, and QSEE
trusted application loading and commands via /dev/fpc_tee.

> diff --git a/drivers/misc/fpc1540-tee.c b/drivers/misc/fpc1540-tee.c
> new file mode 100644
> index 0000000000000..37229190c46af
> --- /dev/null
> +++ b/drivers/misc/fpc1540-tee.c
[ ... ]
> +static void *fpc_tee_read_image(struct fpc_tee *fpc, const char *name,
> +				size_t *mdt_len, size_t *img_len,
> +				size_t *map_len)
> +{
[ ... ]
> +	*map_len =3D 0;
> +	if (ehdr->e_ident[EI_CLASS] =3D=3D ELFCLASS64) {
> +		const struct elf64_hdr *eh =3D (const struct elf64_hdr *)fw->data;
> +		const struct elf64_phdr *ph =3D (const void *)fw->data + eh->e_phoff;
> +
> +		phnum =3D eh->e_phnum;
> +		if (eh->e_phoff + phnum * sizeof(*ph) <=3D fw->size)
> +			for (i =3D 0; i < phnum; i++)
> +				*map_len =3D max_t(size_t, *map_len,
> +						 ph[i].p_offset + ph[i].p_filesz);
> +	} else {
> +		const struct elf32_phdr *ph =3D (const void *)fw->data + ehdr->e_phoff;
> +
> +		phnum =3D ehdr->e_phnum;
> +		if (ehdr->e_phoff + phnum * sizeof(*ph) <=3D fw->size)
> +			for (i =3D 0; i < phnum; i++)
> +				*map_len =3D max_t(size_t, *map_len,
> +						 ph[i].p_offset + ph[i].p_filesz);
> +	}

[Severity: Medium]
Can a malformed .mdt header wrap eh->e_phoff + phnum * sizeof(*ph) and
read ph[i] out of bounds?

In addition, ph[i].p_offset + ph[i].p_filesz can overflow (or produce a
*map_len that wraps PAGE_ALIGN(map_len) to 0 in fpc_tee_load() before
memcpy(buf, image, img_len)), and when e_phoff + phnum * sizeof(*ph) >
fw->size without wrapping, the function continues with *map_len =3D=3D 0
instead of releasing fw and returning ERR_PTR(-EINVAL).

> +
> +	*mdt_len =3D fw->size;
> +	total =3D fw->size;
> +	release_firmware(fw);
> +
> +	for (i =3D 0; i < phnum; i++) {
> +		snprintf(fw_name, sizeof(fw_name), "%s.b%02u", name, i);
> +		ret =3D request_firmware(&fw, fw_name, fpc->dev);
> +		if (ret)
> +			return ERR_PTR(ret);
> +		total +=3D fw->size;
> +		release_firmware(fw);
> +	}

[Severity: Low]
This isn't a bug, but fpc_tee_read_image() calls request_firmware() and
release_firmware() on the .mdt and every .bNN segment once just to sum
their sizes, then loads all of them a second time into a vmalloc() buffer
that fpc_tee_load() immediately copies into a dma_alloc_coherent() buffer
and frees.

> +
> +	buf =3D vmalloc(total);
> +	if (!buf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	off =3D 0;
> +	for (i =3D 0; i <=3D phnum; i++) {
> +		if (i)
> +			snprintf(fw_name, sizeof(fw_name), "%s.b%02u", name, i - 1);
> +		else
> +			snprintf(fw_name, sizeof(fw_name), "%s.mdt", name);
> +		ret =3D request_firmware(&fw, fw_name, fpc->dev);
> +		if (ret || off + fw->size > total) {
> +			if (!ret)
> +				release_firmware(fw);
> +			vfree(buf);
> +			return ERR_PTR(ret ?: -EINVAL);
> +		}
> +		memcpy(buf + off, fw->data, fw->size);
> +		off +=3D fw->size;
> +		release_firmware(fw);
> +	}
> +
> +	*img_len =3D total;
> +	*map_len =3D max(*map_len, total);
> +	return buf;
> +}

[Severity: Medium]
What happens if any firmware file shrinks between the two
request_firmware() passes?

The second loop checks off + fw->size > total, but does not verify that
the reloaded .mdt size still equals *mdt_len or that off =3D=3D total after
the loop.  If a file is smaller on the second read, buf[off .. total - 1]
is left with uninitialized vmalloc() memory and copied to TrustZone with
*img_len =3D total.

[ ... ]
> +static long fpc_tee_ioctl(struct file *file, unsigned int cmd, unsigned =
long arg)
> +{
[ ... ]
> +	case FPC_TEE_IOC_IRQ_CLEAR:
> +		atomic_set(&fpc->irq_events, fpc->irq_gpio &&
> +			   gpiod_get_value_cansleep(fpc->irq_gpio) ? 1 : 0);
> +		ret =3D 0;
> +		break;

[Severity: Medium]
Does gpiod_get_value_cansleep() returning a negative errno get treated as
an asserted interrupt line both here and in fpc_tee_irq()?

Also, when FPC_TEE_IOC_IRQ_CLEAR sets fpc->irq_events to 1, it does not
call wake_up_interruptible(&fpc->irq_wait), and if fpc->irq_gpio reads 0
right before fpc_tee_irq() runs, atomic_set(&fpc->irq_events, 0) can
overwrite the new increment and drop the interrupt:

CPU0                              CPU1
fpc_tee_ioctl()
  gpiod_get_value_cansleep() -> 0
                                  fpc_tee_irq()
                                    atomic_inc(&fpc->irq_events)
  atomic_set(&fpc->irq_events, 0)  <-- loses interrupt event

> +	default:
> +		ret =3D -ENOTTY;
> +	}
> +	mutex_unlock(&fpc->lock);
> +
> +	return ret;
> +}
[ ... ]
> +static ssize_t fpc_tee_read(struct file *file, char __user *buf, size_t =
len,
> +			    loff_t *ppos)
> +{
> +	struct fpc_tee *fpc =3D fpc_tee_from_file(file);
> +	u32 events;
> +	int ret;
> +
> +	if (len < sizeof(events))
> +		return -EINVAL;
> +
> +	if (!(file->f_flags & O_NONBLOCK)) {
> +		ret =3D wait_event_interruptible(fpc->irq_wait,
> +					       atomic_read(&fpc->irq_events));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	events =3D atomic_xchg(&fpc->irq_events, 0);
> +	if (copy_to_user(buf, &events, sizeof(events)))
> +		return -EFAULT;
> +
> +	return sizeof(events);
> +}

[Severity: High]
Does a non-blocking read() return 4 bytes with events =3D=3D 0 instead of
-EAGAIN when no interrupts are pending?  A userspace poll/read loop
draining a non-blocking descriptor until -EAGAIN will spin forever.

Even for blocking reads, atomic_xchg(&fpc->irq_events, 0) runs outside the
wait condition, so a concurrent reader or FPC_TEE_IOC_IRQ_CLEAR can consume
the count first and cause a blocking read() to return events =3D=3D 0.
Zeroing fpc->irq_events before copy_to_user() also discards the pending
events if copy_to_user() faults.

[ ... ]
> +static int fpc_tee_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> +	if (!ret)
> +		ret =3D qcom_tzmem_shm_bridge_create(rmem->base, rmem->size,
> +						   &fpc->bridge);
> +	if (ret) {
> +		of_reserved_mem_device_release(dev);
> +		return dev_err_probe(dev, ret, "no shm bridge\n");
> +	}

[Severity: High]
What happens if fpc_tee_probe() runs before qcom_scm_probe() finishes?

Without checking qcom_scm_is_available() and returning -EPROBE_DEFER,
qcom_tzmem_shm_bridge_create() runs while qcom_tzmem_using_shm_bridge is
still false and silently returns 0 without creating the bridge:

drivers/firmware/qcom/qcom_tzmem.c:qcom_tzmem_shm_bridge_create() {
	if (!qcom_tzmem_using_shm_bridge)
		return 0;
	...
}

If /dev/fpc_tee is also opened before qcom_scm_probe() completes,
fpc_tee_open() -> ... -> qcom_scm_qseecom_app_start() ->
__qcom_scm_qseecom_call() dereferences __scm->dev while __scm is NULL.

[ ... ]
> +	device_init_wakeup(dev, true);
> +	enable_irq_wake(irq);
> +
> +	fpc->misc.minor =3D MISC_DYNAMIC_MINOR;
> +	fpc->misc.name =3D "fpc_tee";
> +	fpc->misc.fops =3D &fpc_tee_fops;
> +	fpc->misc.parent =3D dev;
> +
> +	platform_set_drvdata(pdev, fpc);
> +
> +	return misc_register(&fpc->misc);
> +}

[Severity: Medium]
If misc_register() fails here, does fpc_tee_probe() leave IRQ wake enabled
and the wakeup source registered on dev?

> +
> +static void fpc_tee_remove(struct platform_device *pdev)
> +{
> +	struct fpc_tee *fpc =3D platform_get_drvdata(pdev);
> +
> +	misc_deregister(&fpc->misc);
> +	if (fpc->loaded)
> +		qcom_scm_qseecom_app_shutdown(fpc->app_id);
> +	fpc_tee_power(fpc, false);
> +}

[Severity: Medium]
Should fpc_tee_remove() (or a devm action) also call disable_irq_wake()
and device_init_wakeup(dev, false) to balance fpc_tee_probe()?

[Severity: Medium]
Can fpc_tee_remove() race with an open file descriptor that is still in
fpc_tee_ioctl() or sleeping in fpc_tee_read()?

misc_deregister() does not wait for already-open file descriptors to close,
and fpc_tee_remove() inspects fpc->loaded, shuts down fpc->app_id, and
calls fpc_tee_power() without taking fpc->lock:

CPU0                              CPU1
fpc_tee_ioctl(FPC_TEE_IOC_POWER)
  mutex_lock(&fpc->lock)
  fpc_tee_power(fpc, true)
    regulator_enable(fpc->vdd)
    usleep_range(1000, 1100)
                                  fpc_tee_remove()
                                    misc_deregister(&fpc->misc)
                                    fpc_tee_power(fpc, false)
                                      if (on =3D=3D fpc->powered)
                                        return 0;  <-- vdd left enabled
    fpc->powered =3D true

In addition, any reader still sleeping on fpc->irq_wait or holding an open
file descriptor can access fpc after fpc_tee_remove() returns and devres
frees it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-fpc1540-te=
e-v1-0-6c6985f05b06@proton.me?part=3D4
