Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D0748381C
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450787; cv=none; b=XxwNsY3SrMSsE6wD9gCKq8DZ0Kv7Oyc+tzAmKnogoP4HJZ0wVap7hGaPtNQd4+k1dTfObAQBAoowhKXlTgGosVNmPWHAszIzX61QJE5JyBeW9Nar0P6p2I0yaGZCCCSG+qG2ngL32omGV9HWXEOlLIzjbuE4stMSG5sxAnkEAxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450787; c=relaxed/simple;
	bh=2xHCW4lS/YDRpDSTm/LFUjPLYfpOWLdkg2zNdxaTByo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fCcHhgrpuc1dTmHx+UT5F7wOmBGQFR5X0dP7nL7+wzCMj/0nnER3Uw0II/LfH9xtgXzV0NjVgF0bXreEfrOMvCu3yzvnaNY41dGKn9cgLdQVl7LBKbRiR7vDBfSJ6EztYccoYirSq1eHeusAhnKLiHmwWbmbgaXUNmoC66fo+sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+1kmZcQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+1kmZcQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCB51F000FF;
	Thu,  8 Oct 2026 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791450783;
	bh=n7BJN2JG/xfQklEX5jdOK87cIoe0QhSXhxFaQEq2tNM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M+1kmZcQZxtTylFeElBs5bLfCRpfK1/IRWKkZOM1PaUleT3wdZ8DcU0QBC6Ip6mnr
	 qFpEbOr9zrGg5IhyvgySiRKJEk3EDeX5bZYLvIf4bHSOkXQAO5LHfpiAOsLxDPVeJR
	 6LIpdMv0PFgbIkWISsBwAtUgNpJFZXUxU20hpcz4BmA6/NN0mAsk11z1jFnf/9kwK8
	 VItbGtWkcTIRydhkTgHmx2Q7VyIieKV7oWcSL/lXnne0tuhAnJfM8y9qq8IqVfJdWM
	 KVd2+im896MwvbIWH+LdtezsQNF/xOrU3MBCzE/Jxmk/qnnLgjOJOgj4FR/p0M8XfJ
	 b7AF3xfQEc57Q==
Message-ID: <sashiko-outbox-163904@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 8/8] irqchip/al-fic: add irq_set_affinity callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eliav Farber" <farbere@amazon.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008090058.38591-9-farbere@amazon.com>
References: <20261008090058.38591-1-farbere@amazon.com>
 <20261008090058.38591-9-farbere@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:13:02 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] irqchip: al-fic unconditionally returns IRQ_SET_MASK_OK_DONE wit=
hout updating effective affinity
- [Low] irqchip: data race when reading parent irq affinity mask in al-fic
--

commit dc7525463e65d6270acce3615164b09eeb03dc09
Author: Eliav Farber <farbere@amazon.com>

irqchip/al-fic: add irq_set_affinity callback

This commit adds an irq_set_affinity callback to the al-fic irqchip that
unconditionally returns IRQ_SET_MASK_OK_DONE. This prevents drivers from
failing to probe when their interrupt is routed through a FIC instance,
which lacks per-child affinity control.

> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index 141d9d492d43b..1ac360cf9404d 100644
> --- a/drivers/irqchip/irq-al-fic.c
> +++ b/drivers/irqchip/irq-al-fic.c

[ ... ]

> @@ -157,6 +157,36 @@ static int al_fic_irq_retrigger(struct irq_data *dat=
a)

[ ... ]

> +static int al_fic_irq_set_affinity(struct irq_data *data,
> +				   const struct cpumask *mask, bool force)
> +{
> +	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(data);
> +	const struct cpumask *parent_affinity;
> +	struct al_fic *fic =3D gc->private;
> +	struct irq_data *parent_data;
> +
> +	parent_data =3D irq_get_irq_data(fic->parent_irq);
> +	if (!parent_data)
> +		return -EINVAL;
> +
> +	parent_affinity =3D irq_data_get_affinity_mask(parent_data);
> +	if (!cpumask_equal(mask, parent_affinity))
> +		pr_warn_once("%pOF: affinity change requested but FIC is fixed to pare=
nt IRQ %u CPU routing\n",
> +			     fic->node, fic->parent_irq);

[Severity: Low]
Does this execute a lockless read of the parent's cpumask without holding t=
he
parent's desc->lock or wrapping the access in a data_race() annotation?

When a user writes to /proc/irq/<child>/smp_affinity, it calls
al_fic_irq_set_affinity() under the child's desc->lock and locklessly reads
the parent's mask. If another thread concurrently writes to
/proc/irq/<parent>/smp_affinity, it updates the parent's mask under the
parent's desc->lock.

Could this cause an unannotated data race that triggers KCSAN splats and
potentially causes a torn read resulting in a spurious warning message?

If a lock cannot be taken due to lock-inversion risks, would it make sense
to add a data_race() annotation here?

> +
> +	return IRQ_SET_MASK_OK_DONE;

[Severity: Medium]
Since this callback returns IRQ_SET_MASK_OK_DONE unconditionally without
calling irq_data_update_effective_affinity(), does the child's effective
mask remain empty?

Generic IRQ descriptors allocate the effective affinity mask with
zero-initialization. Returning success without propagating the parent's
affinity into the child's effective affinity mask leaves it empty.

This unconditionally triggers a core kernel warning in
irq_validate_effective_affinity() (irq_chip AL-FIC did not update eff.
affinity mask).

Additionally, an empty effective mask breaks threaded IRQ affinity updates.
irq_thread_check_affinity() copies the empty mask and passes it to
set_cpus_allowed_ptr(), which fails with -EINVAL, causing threaded handlers
to remain on arbitrary CPUs instead of following the hardware routing.

Would it be better to call irq_data_update_effective_affinity() before
returning?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008090058.3859=
1-1-farbere@amazon.com?part=3D8
