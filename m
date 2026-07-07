Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1721D3955F5
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416177; cv=none; b=noZjT1u9c4emn3YmUgG4SKLP73La0lE98HmwRO0LgZboKhH+9spxlWd2e3p4CcxFD2A8QH3kx7s9iX3+pnSiXMJu/WECAgo+KnZ2Ss9Z8s0pgxU2ZAGT48BtKsbrH1qmdP8woDvuJPYEQtA2PD8zu4EgnetKowNzoglhey4zH0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416177; c=relaxed/simple;
	bh=fyLX/k0IeVlUi0UhllSZC7W6VES+vsk/qnHdvicDnZk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fvm9Xn6wn29FwknVuSPFvU+wF29gCUhdfxznpiO9yVYEpJieRmIkJUdcjnY7kf3JtJKaFK0mSXLWZvyfFYu1cQlS1Y6xBMdEoZgjTYfSo7aTeXOl6jr2ERGp+Ubf8nPsoV2qZ8wuJkG4mT/EGXlUdV+aGHaqxYYic0TivA7FDr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djm1nkuK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djm1nkuK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A432C1F000E9;
	Tue,  7 Jul 2026 09:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783416175;
	bh=U/YuRKR40hGAwAIlBkyvUZ+5y4DvTCYIJTNaSN33GFc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=djm1nkuKfRhgWihH94gY33Bzw4ZOtgSgdEEs2QKwg66SEg1hC/J1voTHDSPDj5NpN
	 VBoTft4iL1C+uMD2924PVb2Ft+O52mSj4SRLd/mHPtT5f6Z/euZnC0y6k/0OCbfmEC
	 l7KNJiZS36fVxva0i9gj23rwNoZoazit3hGXMrZS7EqDU8ZJcw0onYl3ldluTfNV8h
	 E3iaMZobObp0VjxtebM55Fu57ERZ4d39X3lWr0MnBGCF9K7cRMIMlbU6m/1nrpHrvU
	 rFJRjnB7GCCsbNz6x8j17HFaIXMoQ6BBhCf+E4o4QmYnf6AJjscQ0gSQZiQguc6h3F
	 k0cfulbg+9snQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/5] coresight: tnoc: Bind Aggregator TNOC on the
 platform bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-2-bf733ed9ebd0@oss.qualcomm.com>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
 <20260707-fix-tracenoc-probe-issue-v5-2-bf733ed9ebd0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 09:22:55 +0000
Message-Id: <20260707092255.A432C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unconditional trace ID put in AMBA remove path causes WARN splat=
 if an AMBA device has the ITNOC compatible string.
--

--- Patch [2]: [PATCH v5 2/5] coresight: tnoc: Bind Aggregator TNOC on the =
platform bus ---
commit f735d2886baa617f8b66d797a2762302ad70464e
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: tnoc: Bind Aggregator TNOC on the platform bus

The Aggregator TNOC was originally bound as an AMBA device but lacks the
required CoreSight component ID registers, leading to probe failure. This
commit binds it to the platform bus where it matches by compatible string
instead. It also updates driver names and ID allocations so the ATID
unsupported check uses the qcom,coresight-itnoc compatible instead of the
bus type.

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
>  		return 0;
>  	}

[Severity: Medium]
Will this cause a WARN splat in trace_noc_remove() if an AMBA device is
probed with the qcom,coresight-itnoc compatible string?

Previously, AMBA devices were guaranteed to have a positive trace ID because
of the !dev_is_amba() check. With this change, an AMBA device can be assign=
ed
-EOPNOTSUPP.

During driver unbind, trace_noc_remove() unconditionally releases the ID:

drivers/hwtracing/coresight/coresight-tnoc.c:trace_noc_remove() {
	...
	coresight_unregister(drvdata->csdev);
	coresight_trace_id_put_system_id(drvdata->atid);
}

Should trace_noc_remove() include the same atid > 0 check that was
added below to tnoc_platform_remove()?

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
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-fix-tracen=
oc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com?part=3D2
