Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF8E3F9F4C
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816389; cv=none; b=q2i+z9WWVNHCUUis6gD3qYZiLLXXagb45Iq4t+RazmfKo7eP+epEk2LZmTkrQ7KH8tTnyfesKk8DgSV9cIx9gsDjPQLlO2mr3qLmlAeur99Qq0KDsBd9qLh4uSpk5JShEJHCCqblbu5Rz3G+z/trDY7oHrxceJOqWr/i5RlolZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816389; c=relaxed/simple;
	bh=nN3l7irb7CKRy+zSYLUpBRNKyA5wk65tDcwUu19fb/Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E0H8xEf7KvR1stg/TekHZ3Vr+nH9MxLgw9DD+QqljYT/ZGa5gxVqxb65i25fxtn6KNu5CwVmKi4EayVaUtw1XiFXdqgHyiMSAhdblvqmJVaQMsa8wO/9J39qqjllbvwK1jJEVqGXu6zK9AaV436f287SOBt0TozJI39Wx3+v7V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFSBLAqI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFSBLAqI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F971F000E9;
	Tue, 30 Jun 2026 10:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782816382;
	bh=1ablbyphcbZ6sxXUzwijtQJ3TLJ4o+q8hvlxXCJbJAE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AFSBLAqIiMZG2d9ldKASf5r5VMlV7kQbtqXQRQE7T+RDNVkdlM94rUYZLYQ7AEGnY
	 QgKLw5pd+cm8545M5m3Vuu/sxdX7da4ljhPZaXDigBvQH8PxuG1cU0L7oy/ulz7HAH
	 WJH2cKs295eZCNI/bdZbZLCUMo4R114beOmLvcobpT5xXiP95iFtBbGDfLLq3+Uepk
	 KFg5jAMSttXOZly5LAZGdZOP+agaYiL3ZphJ/AN0MaVnN0mwh+COcxuNsN/J9mq5Dq
	 AcR58YG6say9ZyoqeH59iGqDnTxquKkRLqKXwrWB3VsM3sp0+9eZak+FOlXpxQKU2l
	 PbgGveFCMg5Bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] bus: simple-pm-bus: Remove child devices when
 the bus is unbound
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herve Codina" <herve.codina@bootlin.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260630102717.413501-2-herve.codina@bootlin.com>
References: <20260630102717.413501-1-herve.codina@bootlin.com>
 <20260630102717.413501-2-herve.codina@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 10:46:20 +0000
Message-Id: <20260630104621.A2F971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The bus device is left in the RPM_ACTIVE state with its clocks per=
manently enabled upon removal, as `pm_runtime_disable()` cancels the asynch=
ronous idle request triggered by child device removal.
--

commit db0675ba90c5bdf94a4790c06b36a7b5f8dff5e4
Author: Herve Codina <herve.codina@bootlin.com>

bus: simple-pm-bus: Remove child devices when the bus is unbound

During probe, the simple-pm-bus driver populates child devices but does not
remove them during its removal. This commit explicitly depopulates child
devices when the bus is unbound to keep the device state consistent.

> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c
> @@ -83,6 +83,9 @@ static void simple_pm_bus_remove(struct platform_device=
 *pdev)
> =20
>  	dev_dbg(&pdev->dev, "%s\n", __func__);
> =20
> +	if (pdev->dev.of_node)
> +		of_platform_depopulate(&pdev->dev);
> +
>  	pm_runtime_disable(&pdev->dev);

[Severity: High]
Will this sequence leave the bus device active and leak clock enable counts?

When of_platform_depopulate() removes the child devices, the parent bus
device's child_count drops to zero, triggering an asynchronous
pm_request_idle() on the parent.

Because pm_runtime_disable() is called immediately afterwards, it will invo=
ke
__pm_runtime_barrier() and synchronously cancel any pending asynchronous PM
requests.

If the idle request is cancelled before it executes, does the bus bypass
simple_pm_bus_runtime_suspend() and remain in the RPM_ACTIVE state with its
clocks permanently enabled? When devres later frees the clock structures via
clk_bulk_put_all(), would the active clock enable counts be leaked, causing
a warning? Should there be a synchronous runtime PM put or suspend operation
before disabling runtime PM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630102717.4135=
01-1-herve.codina@bootlin.com?part=3D1
