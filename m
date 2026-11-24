Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556442;
	b=RQeczDgGdVxzu5LgI75PeF94yvvYS89TO//4Y65vuY8Vek2nunY1s4xaVZEqW95HbWNX
	 Nrhw8/BE1fT2w2u1KpgHmwHVuTYirIEEFD0Os4/xZWgBHnBbH+lEPkYyTyN3e8xaysh6g
	 oSnva5cK4d2qMcZ/1YQM4AiU4s6/ytm69CixAWVzrd1YUvFOFhm8mWI768u76t54SGFYp
	 VGDTRCjqcmADAH5iMU8W8TLVTibFJRnrlOIjPxSOC64HT+cOATBHaOp6r73S2wuPUuCbV
	 sm/uTmTJOtzUYhPE0qfIF0cDxLz7raTLAEkHcrlbRY2+LR5jYJzNdO9kLOSFEYLG0AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556442;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=phiuX5Zb8P8aFyzSkr8Lt0LpTmJabsik6/9jkby6ebg=;
	b=VAf/43ID0OtKx9P0yldzdWjPWyiWZUHPX84te837BW5DjgFcmdi7yEMeY4jrZs0Yuf6O
	 QbLZGKrzFh6Wv4/mF4fS6dHZtt4ZSHYiAc1qdMExK6xG0A4y7hZpLljP8K6sc4VZPqXxF
	 MshiLdoLHg5zvE03hqtnClS+ANTOeNDwVVCD8+xWF9JaJNWE42JV7EQqVVJvM+WMLw1Z1
	 3w9GryF0w0EkxTUce0h/XHbneqsDerBy1rTD+l3VRuamY7E3U2+y0Df36wHtmrfGk9g6K
	 6UInCbepoSf1BbCUDxqNNIQGOWOPN2nhOdNgyeTU4XCkmpMet8IuNPyS2AlETMkMULg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a5rKk7uE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209FA606A688
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 21:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a5rKk7uE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DAC1F000F4
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 21:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795556441;
	bh=phiuX5Zb8P8aFyzSkr8Lt0LpTmJabsik6/9jkby6ebg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a5rKk7uEqcp0Ck5LFWJ71VV9g7rkwiRrIP+FkOus5YRe7tvKQS6k51dkdJAQxi3dm
	 ZoAzU8fZ3EgQhsJCxuEvhsIxA6KpbPtwYdflE05QC890cpOrL42k3peiAwvU9pYEaw
	 J2mYpaaAJlfApqVUEyuDRsCEw3GNBXgxl1Srr4aGw8GEuRwWPLyQjfvkW2vSRI1F8S
	 PnJ3u0THMwL6PcRI1dD3OWUKP8vo2PI3quaTGU1lNqF2Lr2dOktJ4pbRqGXxsX6ZwI
	 ilp5ll9k9obmFrZByAPxtyRoYcvQZyaifgcGBASurIiBYr/YesHtv4dcUARSwjLdMG
	 RYCQdsYAZBUTg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso6261305e87.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 13:40:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHnths1tYuZtMrX0DtPhzvrzssP9l0UkDvcgdvlt3wcBJMyL++SVsG5SgCnMUJg3tsPIq424lyOOi3/@vger.kernel.org
X-Gm-Message-State: APuU4Z++5GkwHk1+HZMG6O1kkfjejYJ5klRnWeIXTlWD8LWx5MpiDcOt
	P+Zj/8bmPKHOCPNll6czn9SiGJNsbybAtWbX98Lq/bszwTvKCfHMTVpbCRjqLI7BZIfcqi1SoHv
	TpUgiBaE/5gOVNYH3A/IMCfcCTflTqPQ=
X-Received: by 2002:a05:6512:32c8:b0:5c1:46f8:913c with SMTP id
 2adb3069b0e04-5c1b7c00f96mr4380577e87.20.1795556440465; Tue, 24 Nov 2026
 13:40:40 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com> <20261015142552.4128028-10-ryan.roberts@arm.com>
In-Reply-To: <20261015142552.4128028-10-ryan.roberts@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Nov 2026 22:40:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLmnVpGm9pG_g777yz6XvbyAgTBCM5moYy=gAeenhjQSEg@mail.gmail.com>
X-Gm-Features: Aa3M54pcwQV3xdAu47_dI0b9w902bsdzijUBVbDcdwg2QkzqqV6jsuD637lp5XA
Message-ID: <CAD++jLmnVpGm9pG_g777yz6XvbyAgTBCM5moYy=gAeenhjQSEg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/15] misc/arm-cla: Add userspace interface
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan, Jean-Philippe,

On Thu, Oct 15, 2026 at 4:27=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:

> Expose CLA devices through a character device so userspace can enumerate
> the available hardware and map accelerator register frames.
>
> Provide ioctl interface to report device topology, CPU affinity, domain
> membership, mmap offsets, architecture version and attached accelerator
> masks, together with the IIDR, DEVARCH and REVIDR of each accelerator.
>
> CLA registers can only be read from the CPU local to the device, while
> enumeration may occur on any CPU. Validate the supported CLA
> architecture version during device setup and cache the CLA and
> accelerator identification registers for later ioctl queries.
>
> Support shared read-write mmap of one or more CLA register pages. Create
> a context for every domain covered by the mapping and resolve faults
> only while that context owns the domain. Queue unassigned contexts with
> the domain scheduler, drop mmap_lock while waiting for assignment and
> retry the fault after the context is woken.
>
> Co-developed-by: Jean-Philippe Brucker <jpb@kernel.org>
> Signed-off-by: Jean-Philippe Brucker <jpb@kernel.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

This uapi is very simplistic and IIUC only provides a mmap:ed view of the
accelerator memory area, without any details on how it is actually used.

Since we don't know much about the usage it is hard to say whether this
is a good approach compared to using e.g. an arm64-specific syscall.
Whether to choose one or the other depends much on the error
modus of this thing, how a CPU or a context should recover etc.

> +       /*
> +        * Cache some standard accelerator registers that user space may =
query
> +        * via ioctl from a remote CPU.
> +        */

If you're caching these registers for efficiency, a vDSO syscall could
be more efficient as it could return the cached information without
a roundtrip to kernelspace. OK kludgy, I know, but efficient.

> +#define cla_for_each_mapped_domain(_vma, _domain)                      \
> +       for (unsigned long __pg =3D (_vma)->vm_pgoff;                    =
 \
> +            __pg < (_vma)->vm_pgoff + vma_pages(_vma) &&               \
> +            ((_domain) =3D cla_lut_pg[dev_nospec(__pg)]->domain);       =
 \
> +            __pg =3D (_domain)->pg_offset + (_domain)->nr_devs)

I like this macro. Very helpful.

> +static long cla_ioctl_validate_param(struct file *file,
> +                                    struct arm_cla_param *param)
(...)
> +static long cla_ioctl_get_param(struct file *file, unsigned long arg)

Looks good.

> +static int cla_file_open(struct inode *inode, struct file *file)
> +{
> +       unsigned int index =3D iminor(inode) - MINOR(cla_devt);
> +
> +       if (index >=3D cla_nr_classes)
> +               return -ENODEV;
> +
> +       file->private_data =3D cla_accel_classes[index];
> +
> +       return 0;
> +}

As you mention that this absolutely will not work unless the process
(task) is tied to the current CPU, this should be verified and enforced.

Obviously the task is running on the CPU it is running on when it
gets here. What we need to ascertain is that it absolutely cannot migrate.

Essentially it needs to execute as a userspace version of a
CPU-local workqueue or other CPU-bound kernel daemon
that uses kthread_bind().

You *can* of course pin a process/task to a CPU with
sched_setaffinity() in userspace and at a minimum this
chardev should not be allowed to be opened unless the
process has already done this and the affinity is set to the
current CPU and the current CPU only.

You want this to be enforced, but userspace does not provide
a way to irrevocably bind a task to a certain CPU. Interestingly
the kernel does, PF_NO_SETAFFINITY which is used in
kthread.c. The only thing (I think) that can affect a task with
PF_NO_SETAFFINITY is CPU hotplug.

So I suggest that you might want to pursue some syscall
extention to sched_setaffinity() such that PF_NO_SETAFFINITY
is set on the process inside the kernel after creation, and then
cla_file_open() should verify that the affinity is set to the
current CPU only, and that PF_NO_SETAFFINITY is set.

(You could of course hack-set the flag here in open() but I
don't think that would be appreciated.)

Yours,
Linus Walleij
