Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687933;
	b=Zygrhse3I5sk6khEH9Gy5TBlIyTFzFT6VYHYswSXzUjc7xMFvgIzdkdoYOqSDiAX2eGj
	 hs+CKsoeoXqQznShOmACPfiXRVYk1rOqemLWjTxTuhmoPO+ZneTcUhQ8/dES87YGEcjMO
	 wMkp/bvUo0vlb5bzWNQZxqtOsKG/gkwkV73qfs+HXO4ZM6h4a45yYj4UcQeO1/4oJsqSK
	 Akqp3+q2h7nxjp+HxTzo4P1s9nZV9TZXSCWJ67JJsvuGewDB+3LhQnk1+Q+5jm8yrjb49
	 9waOdunCXAh4rmmeO3dgvaJywqWynnWXVLkh81CMexMPsH7tMTRnUazmG9YTZXcy7HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687933;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hnQPlN6as0O3dpTiW12fxADq1eDM3DKq0SFdRGNzkD8=;
	b=ljOp47E4Tbqsvttswoz+IuQXU5rwczGbXVlMIUGq7+LPdBedYeeChuiYPAaY2C0hyaa/
	 nm3LR6Z43NVmewrmHRZYU6Ik0WnTYoUCVyYOUh/pnEfJyzUbrr/nGW3pDMsVuwVtz/lpI
	 ye+n8lkOOPtUU8X0M3Cf9QQxP3sMJO36eTGqWuGQxz0xlsD9EY1EC1H26mOzM+//eQ0sI
	 V19Y3xrh+y8+V7JpB0OU/EPK7TvpeujMKUg/06YDIFcBBuOrLycFAuIIVeYhtx+8RaqpV
	 tXRzZfw0Bkr9l8Utv9M8aGsNQrTdbCBbWwfWP60OM6YJQsNI6t3Nzjuwd9SLzqHy0GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Az9OxYxW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A46606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Az9OxYxW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA39C1F000C4;
	Thu, 26 Nov 2026 10:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795687933;
	bh=hnQPlN6as0O3dpTiW12fxADq1eDM3DKq0SFdRGNzkD8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Az9OxYxWxnb0/2XEVglqmLoCAoqdUGRzzulm1N+5J85VZbjwqsfEmgK9RjZJpHAKA
	 Dnos0CKik7/8tTRXA3Ydu1MuduhMBWzpsxbD7/pE10bTQMEMqUblr0OtiY16iITKKr
	 HQ6xasaznyypIsZcKBOIV0Xucm+GYxAUUXaF0l0NDbvSFQ1An2nyceeZhlT/ybph6T
	 8fsOUMrxUhBpY+Qy7vEZ4VNpQ+7fWW4dNh065wjTvRuH+tGjgXHUmVXcTky0TysRL2
	 cInuV4/6/sgY6Mj2AHw14zkBsSKdkO+omiNpOAlphzkPk+c1jhWObj2WyEY4BgT5oH
	 ysbdsBK6RA8Qg==
Message-ID: <sashiko-outbox-235253@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 03/14] gtrace: Add RISC-V platform driver for the
 gtrace framework
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <b5b3dc4a1ca378ea74498d1adb0207e281e6ad01.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
 <b5b3dc4a1ca378ea74498d1adb0207e281e6ad01.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:12:12 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] gtrace: device reference leak on dest_comp in
  gtrace_of_parse_outconns()
- [Medium] gtrace: TOCTOU race between gtrace_of_parse_outconns() and
  registration
- [Low] gtrace: CONFIG_RVTRACE module name mismatch between Kconfig and
  Makefile
--

commit 4636c1fbe60ae0aca475723fde99c3bc6d009499
Author: Anup Patel <anup.patel@oss.qualcomm.com>

gtrace: Add RISC-V platform driver for the gtrace framework

This commit adds device-tree connection parsing helpers and a RISC-V
platform driver for the gtrace framework.

> diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/=
Kconfig
> index bcc3b4169a764..04986f2165491 100644
> --- a/drivers/hwtracing/gtrace/Kconfig
> +++ b/drivers/hwtracing/gtrace/Kconfig
> @@ -13,3 +13,18 @@ menuconfig GTRACE
> =20
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called gtrace.
> +
> +config RVTRACE
> +	tristate "RISC-V Trace Support"
> +	depends on RISCV
> +	depends on OF
> +	depends on GTRACE
> +	default RISCV
> +	help
> +	  This provides the RISC-V backend for the generic hardware trace
> +	  (gtrace) framework. It parses the RISC-V trace component topology,
> +	  provides the RISC-V register-level control ops and registers each
> +	  component with the gtrace core.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called rvtrace.
> diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace=
/Makefile
> index 3f90fb99c5149..20f67a78b8abc 100644
> --- a/drivers/hwtracing/gtrace/Makefile
> +++ b/drivers/hwtracing/gtrace/Makefile
> @@ -2,3 +2,6 @@
> =20
>  obj-$(CONFIG_GTRACE) +=3D gtrace.o
>  gtrace-y :=3D gtrace-core.o
> +gtrace-$(CONFIG_OF) +=3D gtrace-of.o
> +
> +obj-$(CONFIG_RVTRACE) +=3D rvtrace-platform.o

[Severity: Low]
The Kconfig help text states that the module will be called rvtrace, but
building CONFIG_RVTRACE=3Dm produces rvtrace-platform.ko.

> diff --git a/drivers/hwtracing/gtrace/gtrace-of.c b/drivers/hwtracing/gtr=
ace/gtrace-of.c
> new file mode 100644
> index 0000000000000..4ffeda32c4a38
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/gtrace-of.c
> @@ -0,0 +1,133 @@

[ ... ]

> +static struct gtrace_connection *
> +gtrace_of_parse_outconn(struct gtrace_platform_data *pdata,
> +			struct device_node *ep_node)
> +{
> +	struct device_node *rep_node, *rdev_node;
> +	struct gtrace_connection *conn;
> +	struct of_endpoint ep, rep;
> +	int ret;
> +
> +	conn =3D devm_kzalloc(pdata->dev, sizeof(*conn), GFP_KERNEL);
> +	if (!conn)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret =3D of_graph_parse_endpoint(ep_node, &ep);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	rep_node =3D of_graph_get_remote_endpoint(ep_node);
> +	if (!rep_node)
> +		return ERR_PTR(-ENODEV);
> +
> +	rdev_node =3D of_graph_get_port_parent(rep_node);
> +
> +	ret =3D of_graph_parse_endpoint(rep_node, &rep);
> +	if (ret)
> +		goto out;
> +
> +	conn->src_port =3D ep.port;
> +	conn->src_fwnode =3D dev_fwnode(pdata->dev);
> +	/* The 'src_comp' is set by gtrace_register_component() */
> +	conn->src_comp =3D NULL;
> +	conn->dest_port =3D rep.port;
> +	conn->dest_fwnode =3D of_fwnode_handle(rdev_node);
> +	fwnode_handle_get(conn->dest_fwnode);
> +	conn->dest_comp =3D gtrace_find_by_fwnode(conn->dest_fwnode);

[Severity: Medium]
Can conn->dest_comp become stale if the destination component is
unregistered before gtrace_register_component() runs?

CPU0                                  CPU1
rvtrace_platform_probe() [src]
  gtrace_of_parse_outconns()
    gtrace_of_parse_outconn()
      gtrace_find_by_fwnode()
        mutex_lock(&gtrace_mutex)
        gtrace_get_component(dest)
        mutex_unlock(&gtrace_mutex)
                                      rvtrace_platform_remove() [dest]
                                        gtrace_unregister_component(dest)
                                          mutex_lock(&gtrace_mutex)
                                          gtrace_cleanup_inconns(dest, NULL)
                                          device_unregister(&dest->dev)
                                          mutex_unlock(&gtrace_mutex)
                                      /* devres frees dest->pdata */
  gtrace_register_component()
    mutex_lock(&gtrace_mutex)
    gtrace_setup_inconns_from_outconns()
      bus_for_each_dev(..., gtrace_setup_inconn)
      /* dest is off bus; returns 0 */
    mutex_unlock(&gtrace_mutex)

Because conn has not been installed in dest->pdata->inconns[] yet when
CPU1 runs gtrace_cleanup_inconns(), conn->dest_comp is not cleared.  Then
in gtrace_setup_inconns_from_outconns(), bus_for_each_dev() returns 0
because dest->dev is no longer on gtrace_bustype, and checking only
ret < 0 treats that as success:

drivers/hwtracing/gtrace/gtrace-core.c:gtrace_setup_inconns_from_outconns()=
 {
    ...
		ret =3D bus_for_each_dev(&gtrace_bustype, NULL, conn, gtrace_setup_inconn=
);
		if (ret < 0) {
			gtrace_cleanup_inconns_from_outconns(comp);
			return ret;
		}
    ...
}

Registration then succeeds with conn->dest_comp pointing to an
unregistered component whose devm-allocated dest->pdata has already been
freed, leading to a use-after-free when walking output connections.

> +	if (!conn->dest_comp) {
> +		fwnode_handle_put(conn->dest_fwnode);
> +		ret =3D -EPROBE_DEFER;
> +	}
> +
> +out:
> +	of_node_put(rdev_node);
> +	of_node_put(rep_node);
> +	return ret ? ERR_PTR(ret) : conn;
> +}
> +
> +/*
> + * Parse the "out-ports" graph of the component's device tree node and f=
ill
> + * pdata->outconns.
> + * Return: 0 on success or when there are no output ports
> + *         -EPROBE_DEFER if a destination is not registered yet
> + *         negative error code otherwise.
> + */
> +int gtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
> +{
> +	struct device_node *parent, *ep_node;
> +	struct gtrace_connection *conn;
> +	int ret =3D 0, i =3D 0;
> +
> +	parent =3D of_get_child_by_name(dev_of_node(pdata->dev), "out-ports");
> +	if (!parent)
> +		return 0;
> +
> +	pdata->nr_outconns =3D of_graph_get_endpoint_count(parent);
> +	pdata->outconns =3D devm_kcalloc(pdata->dev, pdata->nr_outconns,
> +				       sizeof(*pdata->outconns), GFP_KERNEL);
> +	if (!pdata->outconns) {
> +		ret =3D -ENOMEM;
> +		goto done;
> +	}
> +
> +	for_each_endpoint_of_node(parent, ep_node) {
> +		conn =3D gtrace_of_parse_outconn(pdata, ep_node);
> +		if (IS_ERR(conn)) {
> +			ret =3D PTR_ERR(conn);
> +			of_node_put(ep_node);
> +			break;
> +		}
> +
> +		pdata->outconns[i] =3D conn;
> +		i++;
> +	}
> +
> +done:
> +	if (ret) {
> +		for (i =3D 0; i < pdata->nr_outconns && pdata->outconns; i++) {
> +			conn =3D pdata->outconns[i];
> +			if (conn && conn->dest_fwnode)
> +				fwnode_handle_put(conn->dest_fwnode);
> +		}
> +	}

[Severity: Medium]
Does this error path leak the conn->dest_comp device reference acquired by
gtrace_find_by_fwnode()?

When a component has multiple output endpoints and parsing a later
endpoint fails (such as with -EPROBE_DEFER), the loop only drops
conn->dest_fwnode on the earlier connections and rvtrace_platform_probe()
returns directly without calling gtrace_release_outconns(pdata).  Calling
gtrace_release_outconns(pdata) here when pdata->outconns is non-NULL would
release both conn->dest_comp and conn->dest_fwnode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795512532.gi=
t.mayuresh.chitale@oss.qualcomm.com?part=3D3
