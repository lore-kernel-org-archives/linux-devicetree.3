Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C293279DA
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651835; cv=none; b=hk/0NY05lujAUIi3HYSfUutrVsf613LPgUQ1Y2ZDDtZefpBu7q838Q3raXHF0I/cs8RVdHswH0m3HDEd4OLHk5S+yoQ+fCIeg4k8QdOLjSw2LQKcUKevuaWIILzVBDjViVpKzNV8iq84HytRBYRlneRnp5YdcbtG1+t9Qqhfqw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651835; c=relaxed/simple;
	bh=ajfQcHJSLUYgV7lWWOVkp5kwgZTgt7TzfwWJ3YvIyEw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JrY+ZAgAebGRlYZ2B3Hy1Mh1RJ6yaPxwh/Kd/ZYPf2AmFxQHjWjbYpIgN0rdIjjvlk/AowUYlt2rsBfLWLN4Lz2KEhkQfdFqFW37OLbnjc8xFhqvtvcu4aJBuxGexRfxmNgqlUkDOGZF94uH0upcyf5fHeNHWYJZJLxM2a5kuF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEWCZfO+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEWCZfO+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F5C1F000E9;
	Fri, 10 Jul 2026 02:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783651834;
	bh=QTYLkEI7Mh0S4gT6DgDWUeiE/pAbAAETUaXfO9HeWoo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KEWCZfO+C5h2VmvHsDkg2OVNwTcoJnnyej4GhkuFxIkMKSKg2nhq9A5xh2Oh3KPWc
	 qn5yh/4/wQMnew9uC1HtsPZHe6P2IYPTLbTU/XOx0NyJNA19bkxiCviQEEFQTEQKT2
	 75OuBzF5LA0J4c0gR/RVEKBOTP1kiXGJCEq542WFXl4y8SvwLUDsMjU/WcTFEAa6d/
	 goFHTuZbiFW89i2QgVF2n1jbHrWBpZKWvpjHTQ9yHReCrwkodGN/pWOd802XR3uX9J
	 i53wagn7kcOhE0S1oz7BVkyVafhEPPSG0+kvKgPE5EHrlr7LT+4UiU793bBm/nsb2V
	 vPCaApNI6S83g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/5] coresight: tnoc: Bind Aggregator TNOC on the
 platform bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 02:50:33 +0000
Message-Id: <20260710025034.16F5C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Missing check for a valid trace ID before freeing it in the AMBA=
 removal path, triggering a kernel WARNING.

Pre-existing issues:
- [High] `trace_noc_id()` returns a negative error instead of `0` when an A=
TID is unsupported, silently breaking trace path activation.
--

--- Patch [2]: [PATCH v6 2/5] coresight: tnoc: Bind Aggregator TNOC on the =
platform bus ---
commit 969e610c6fc6cafd77fce4593f5182410a622645
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: tnoc: Bind Aggregator TNOC on the platform bus

This commit moves the Aggregator TNOC to the platform bus since its AMBA
Component ID reads as 0x00000000, preventing normal AMBA matching. It also
renames the driver and callbacks to generic names and updates the ATID
allocation check to match the qcom,coresight-itnoc compatible string
instead of checking if the device is on the AMBA bus.

> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtra=
cing/coresight/coresight-tnoc.c
> index 9e8de4323d285..737cc802aefe6 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -130,7 +130,7 @@ static int trace_noc_init_default_data(struct trace_n=
oc_drvdata *drvdata)
>  {
>  	int atid;
> =20
> -	if (!dev_is_amba(drvdata->dev)) {
> +	if (of_device_is_compatible(drvdata->dev->of_node, "qcom,coresight-itno=
c")) {
>  		drvdata->atid =3D -EOPNOTSUPP;

[Severity: High]
This is a pre-existing issue, but does assigning -EOPNOTSUPP here completely
break trace path activation for topologies relying on a downstream Aggregat=
or
TNOC?

When queried, trace_noc_id() returns this negative error code instead of 0.
Because coresight_path_assign_trace_id() treats any non-zero return as an I=
D,
it evaluates IS_VALID_CS_TRACE_ID() on this negative value, which fails and
immediately aborts path initialization with -EINVAL.=20

Should this driver store and return 0 instead when an ATID is unsupported,=
=20
so that path iteration can successfully continue downstream?

>  		return 0;
>  	}

[ ... ]

> @@ -295,16 +295,18 @@ static int itnoc_probe(struct platform_device *pdev)
>  	return ret;
>  }
> =20
> -static void itnoc_remove(struct platform_device *pdev)
> +static void tnoc_platform_remove(struct platform_device *pdev)
>  {
>  	struct trace_noc_drvdata *drvdata =3D platform_get_drvdata(pdev);
> =20
>  	coresight_unregister(drvdata->csdev);
>  	pm_runtime_disable(&pdev->dev);
> +	if (drvdata->atid > 0)
> +		coresight_trace_id_put_system_id(drvdata->atid);

[Severity: Medium]
This platform teardown path correctly verifies the trace ID is valid before
freeing it. Does the AMBA teardown path in trace_noc_remove() need the same
check added?

Because the ATID assignment condition was changed to rely on device tree
compatibles rather than bus types, a malformed device tree could bind an AM=
BA
device using the qcom,coresight-itnoc compatible string. This would result =
in
the ATID being set to -EOPNOTSUPP.=20

During driver unbind, trace_noc_remove() would then pass this negative ID
directly into coresight_trace_id_put_system_id(), which would trigger a ker=
nel
WARNING.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-fix-tracen=
oc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com?part=3D2
