Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA003CCFD2
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817070; cv=none; b=E5tv7cOlWrVYXIKAPXOnTTewHyFu+/HeYA/FZQLmo0jGzhuyoWs1vkaNO3zzI1Fm+G90CWdmIQLyrW6bm6koNQf/rPj9TVnC4VaqSehw8WSCUcClw7BxvTZ3ElB2MB9MlFONcTajj/sw3dqyueXPowH+6BkvhprZfzOlrnIbwSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817070; c=relaxed/simple;
	bh=YAGjExc2ajzEMKoB7dCay4wWkth40nowl6q+ZdwxtgU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h6gSHNOIPdwVXgXf8vTDt89I4degrTsAtsCCdPpmVoxmOHg5+GxmULPzJBUCfVxzMse7qfhgvcc4mKf1FpiNG/QLK/Da1IEUHYCezhoa8z9v5XeHHCyqsCSMpGD/b5/ug1Pw2j2iaVl/GXDIYR+zm/lCg7hLfP7bdKvpTQkL4M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XrGx2oQM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XrGx2oQM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197541F000E9;
	Tue, 30 Jun 2026 10:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782817069;
	bh=ki7QH7l3wDnRJrKfhir6lAwm3VXvOsBl5nkng+tR5ro=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XrGx2oQMDqB4nmSNWhhs4bY0T4hPpGC6qwwEsm1ztp129VTeQKepy2qOPcNDU2cXk
	 krpXt00ogcPwWEum95tGxSpZ7anLPOEOhJwKIZHHIWStfuIHyucgcjVH/MWF07HIVY
	 jLo5+fm6XekwAL3cFXROZJ28p9yaoxlprHikBYyzdsU2a1dArTJR4mPxwR+yxK8d28
	 ZjKpCLYt2z09TS+sEPfbgWAgDXEMI3GQPKsdVsawm6DdOQCAIfuyE47eybkDOBjc/M
	 MjBL9uW6zEDyxjgkxjpsCGt++VBcn3e/p4hOmxsmFBkaEhXvzWqRCozI+5MedxiNZX
	 KGnbfTPOWhLGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] coresight: tnoc: Add AG tnoc standalone
 compatible to the platform driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260630-fix-tracenoc-probe-issue-v3-2-7201e1841e94@oss.qualcomm.com>
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
 <20260630-fix-tracenoc-probe-issue-v3-2-7201e1841e94@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 10:57:48 +0000
Message-Id: <20260630105749.197541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] System Trace ID is leaked on platform device removal for standalon=
e Aggregator TNOC.
--

commit 060ed6649d8ad0bd7b6b53c7f626563782e801df
Author: Jie Gan <jie.gan@oss.qualcomm.com>

coresight: tnoc: Add AG tnoc standalone compatible to the platform driver

This commit adds the "qcom,coresight-agtnoc" compatible to allow the Aggreg=
ator
TNOC to probe as a standalone platform device. It updates the platform driv=
er
and callback names to generic "tnoc" variants. It also modifies the default
data initialization so that only the Interconnect TNOC skips trace ID alloc=
ation.

> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtra=
cing/coresight/coresight-tnoc.c
> index 9e8de4323d285..8237467faba72 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
[ ... ]
> @@ -295,7 +295,7 @@ static int itnoc_probe(struct platform_device *pdev)
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
>  }

[Severity: High]
Does this code leak the allocated system trace ID on device removal?

Because trace_noc_init_default_data() now allocates a system trace ID via
coresight_trace_id_get_system_id() for the new "qcom,coresight-agtnoc"
devices, it appears tnoc_platform_remove() needs a corresponding call to
coresight_trace_id_put_system_id(drvdata->atid) when the driver is unbound.

Without this cleanup, repeated unbind and bind cycles could permanently
exhaust the finite system trace ID pool.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-fix-tracen=
oc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com?part=3D2
