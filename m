Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06C74657C0
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786709128; cv=none; b=uZRpbIFSCiXjyEki7cZufIms4oxvP/zCs/fP0NL70LpAx7m9RI6Jf29k1hmlZk8POtyqBENC+p1+30noCNpqYEvOPAiN9IK5gegeoW+kWpm6qTf0s3MYbqcOK4W8ys2+/X4jLH/9n6xeNinrdkAvgvKbjNGSRhCv+U/hO+2uuuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786709128; c=relaxed/simple;
	bh=o5jd90A42ZW75HIH2fae5Txk4XINJhJ5RPrwgIQJ3Ag=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hwejzg8gvM9nJLdG/RjDOBbIegIjvQkw4ZW4PaCrlo4c6ZBJ2YeuYhTFyF/eTJZEA3JxkUmhhVt3QNggv6WbVjEXG338U78Da85x6bL6gPNw9fdPOeuzP+KILoD5uAfxBzzgXQLcnoedAnaMqjcWSFvhOcFChmdl6scQlHHVIBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMZIqqqO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMZIqqqO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D5C1F000E9;
	Fri, 14 Aug 2026 12:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786709126;
	bh=da6QMOOTS47oqmV+uMOmXrkFq5NFs5k6BPvCf9jG+/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MMZIqqqOU91iux4sT/jHY9MJ5cKqUScj500zATapqE9cx2q8lRQ+GnA3NMYyToa/f
	 ODdJ8dcth7xzJI/punAcf9Xz04kRXeYxq4nm9+JoBHte7BzIi3SclBL66lVYgHoqk6
	 OeNqNPth9NvoCTaUxjcrPuBfcpfHAuIkXhjEheI7tySwOSF7XU8JD1Tlcsx+vfTSur
	 fOqwyg5zoQPNA87UNFM+q92C0sRkdfDsvO1+KlLr/3Tl3GMo62DUwbuaTBX0lZL4KR
	 hk4Ybh5qkAe+lpyT+EwEca4mjxKCZyIo7lmaRxkxvD0KI9U1MJBYbTJ4yMXZBdkQt0
	 sztljURneIsDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] i3c: master: amd: Add hot-join support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260814115155.3974988-4-shubhamsanjay.patil@amd.com>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
 <20260814115155.3974988-4-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 12:05:25 +0000
Message-Id: <20260814120525.E5D5C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver duplicates the I3C core framework's Hot-Join work mecha=
nism but conditionally cancels it, leading to a Use-After-Free during drive=
r unbind.
--

--- Patch [3]: [PATCH 3/3] i3c: master: amd: Add hot-join support ---
commit 06fad25ac0b3ab8838ac7e9c3c0f9c33f86244dc
Author: Shubham Patil <shubhamsanjay.patil@amd.com>

i3c: master: amd: Add hot-join support

This patch adds hot-join support for the AMD AXI I3C master controller.
By default, the hot-join acknowledgment is disabled, but it can be enabled
via sysfs. A hot-join event is serviced by re-running DAA from a work
item so the i3c core enumerates the new device.

> diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd=
-i3c-master.c
> --- a/drivers/i3c/master/amd-i3c-master.c
> +++ b/drivers/i3c/master/amd-i3c-master.c
[ ... ]
> @@ -221,12 +228,14 @@ struct xi3c_master {
>  	bool xfer_resp_valid;
>  	int irq;
>  	bool ibi_capable;
> +	bool hj_capable;
>  	struct i3c_master_controller_ops ops;
>  	struct {
>  		spinlock_t lock; /* protects slots[] against the IBI handler */
>  		struct i3c_dev_desc *slots[XI3C_MAX_DEVS];
>  		unsigned int enabled_count;
>  	} ibi;
> +	struct work_struct hj_work;
>  };

[Severity: High]
Could this custom hj_work bypass the safety checks in the core framework?

The I3C core provides i3c_master_queue_hotjoin() which safely handles
queuing, checks the shutting_down flag, and guarantees unconditional
cancellation during i3c_master_unregister(). Defining a custom work item
here bypasses those safeguards.

[ ... ]
> @@ -1474,6 +1483,40 @@ static void xi3c_master_handle_ibi(struct xi3c_mas=
ter *master)
[ ... ]
> +static void xi3c_master_hj_work(struct work_struct *work)
> +{
> +	struct xi3c_master *master =3D container_of(work, struct xi3c_master,
> +						  hj_work);
> +
> +	i3c_master_do_daa(&master->base);
> +}
> +
>  static irqreturn_t xi3c_master_irq_handler(int irq, void *dev_id)
>  {
>  	struct xi3c_master *master =3D dev_id;
> @@ -1494,6 +1537,9 @@ static irqreturn_t xi3c_master_irq_handler(int irq,=
 void *dev_id)
>  			xi3c_master_handle_ibi(master);
>  	}
> =20
> +	if (status & XI3C_INTR_HJ_MASK)
> +		queue_work(master->base.wq, &master->hj_work);
> +
>  	return IRQ_HANDLED;
>  }

[Severity: High]
Can this unconditionally queue the work even if hj_capable is false?

If the device tree lacks Hot-Join support (hj_capable is false), but the
hardware status register still records a Hot-Join event (for instance, from
an I3C target issuing a request while an IBI interrupt triggers the handler=
),
this will queue hj_work since master->hj_capable is not checked here.

[ ... ]
> @@ -1588,6 +1647,12 @@ static void xi3c_master_remove(struct platform_dev=
ice *pdev)
>  	if (master->ibi_capable)
>  		disable_irq(master->irq);
> =20
> +	if (master->hj_capable) {
> +		/* Stop new Hot-Join IRQs before flushing, so the work can't be re-que=
ued. */
> +		xi3c_master_disable_hotjoin(&master->base);
> +		cancel_work_sync(&master->hj_work);
> +	}
> +
>  	i3c_master_unregister(&master->base);
>  }

[Severity: High]
Could this lead to a use-after-free during driver unbind?

If the work was queued while hj_capable is false, this conditional block is
skipped and the work is never cancelled. The devres framework will free the
master structure, but the work remains on the workqueue and will access fre=
ed
memory when it executes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814115155.3974=
988-1-shubhamsanjay.patil@amd.com?part=3D3
