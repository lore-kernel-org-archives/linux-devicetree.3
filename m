Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD723F1AA8
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819101; cv=none; b=M0esEKFNTP7jH7RnqcxRk40obAL2EgLY9lVAI8XoVmb4GFTGQWSUflC3rVnFYJ69burOVR6KQyNSZp6sfEUXOXy8/q+ZrzbkNq3OuIV8i8Jr7FwYwfIHVDAdMONphoro2yueibFv1aGhV6nzyl4JXuTriEvD5QipUzHL1wjEUzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819101; c=relaxed/simple;
	bh=o7Ih0Y5o9Or1v4TeOfPMfSwhCKw6R91cMfMXJ8cmCC8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dhT/DqPmsvrEjs/Dg04oOpW06EZg9JPjzsvn+R2qgG4S5H9aWZKWjRvgrm9qB7WKOjiPelNsr/Pl207U253fZ+qddj1qyX3aVTdgIpeCTvwNg1vou3H0vr/qQCGeY9HF22nKp+FCgB5+WSocVk5wD+970qJKi9kuxSeUluttdLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKd46WIF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKd46WIF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A553C1F000E9;
	Tue, 30 Jun 2026 11:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782819099;
	bh=ajGNcOoPzKhMJ5aucWgLJh9gWgDQzOyYHnXmzw12Pg8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HKd46WIFCvO/dJVSprSe9RpTD/+SiHCeK0ioGgsIIukDs+BdmoBMCkZy4KhFehmZQ
	 pnn46OQ9EjDMesJ/rF/foFo3VuwYLucFcH7NBWoR1BF+f9nvA84ya3fyZ6Obwut0nk
	 evZ+7QpSr8vFbFMpK5Vd4Q9Z+bC0TVqA+yGrC3luKBoaY5YzD1czsjZpDhOZxvWkWS
	 CdjRl/OF+RVoWWSxKOjynzOzKNNrEKjirxfcj5KDPR7znC4hCGlgO+na7/aA3ATcJM
	 zskQv0baunJ5Zhr+d78d7acKCtozIrTRjoxmxZ6xsBdBzBeVns0w309LREnLu/O7W6
	 C8y7UTZ3izcYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260630-fix-tracenoc-probe-issue-v3-5-7201e1841e94@oss.qualcomm.com>
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
 <20260630-fix-tracenoc-probe-issue-v3-5-7201e1841e94@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 11:31:38 +0000
Message-Id: <20260630113139.A553C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] System trace ID leak on device unbind or module removal for Aggreg=
ator TNOC platform devices because `tnoc_platform_remove` fails to free the=
 allocated ID.
--

commit e1acaab1b46a7af95def9021d30728ac2de6b44a
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: glymur: use Aggregator TNOC compatible

This commit updates the traceNoC node in the glymur device tree to use the
qcom,coresight-agtnoc compatible. This ensures the node probes as an=20
Aggregator TNOC and properly allocates a system trace ID.

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -6038,12 +6038,12 @@ qm_tpdm_out: endpoint {
[ ... ]
> -		itnoc@11200000  {
> -			compatible =3D "qcom,coresight-itnoc";
> +		tn@11200000 {
> +			compatible =3D "qcom,coresight-agtnoc";

[Severity: High]
This is a pre-existing issue, but by switching this node to the
qcom,coresight-agtnoc compatible, does this expose a system trace ID leak on
device unbind?

When a platform device matching this compatible is bound, it allocates a
system trace ID. However, if the device is subsequently unbound via sysfs or
module unload, the current cleanup path fails to free the ID:

drivers/hwtracing/coresight/coresight-tnoc.c:tnoc_platform_remove() {
	struct trace_noc_drvdata *drvdata =3D platform_get_drvdata(pdev);

	coresight_unregister(drvdata->csdev);
	pm_runtime_disable(&pdev->dev);
}

Unlike the AMBA counterpart trace_noc_remove(), this platform removal funct=
ion
lacks a call to coresight_trace_id_put_system_id(drvdata->atid).=20

Since the global trace ID pool is strictly limited, could unbinding this ne=
wly
converted device repeatedly exhaust the system trace IDs and prevent further
CoreSight trace sessions from succeeding?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-fix-tracen=
oc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com?part=3D5
