Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EE0347FFE
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 03:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047025; cv=none; b=CXC07msri+waR5dGXGtCb5UND2Rc/j7SbBoNjSvp4ptoqCg6yp3CnqcIXlVsvpCU7v/2QUPaXyEXfe7zl/iyIrQtOlZq0BiPTMVRHR+9XlNia893tD+4FTbrzdDQVogmJxgX2X4Csz/BHcU9Lnq9zzQpYxrtKE+b7blBMWfNQWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047025; c=relaxed/simple;
	bh=LVeh8fxHXIqPCnGuTVqLkLgtJjBPyypikaTQ+BLFNf4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U/UZmEtHWVF66aeDFZsJGgUfqNW/qL/8ghVcjjlhfCjL6DsCbCIcsdUrQ1vTuyE2oZwYmHWcj056swiXki466XCdj4XZ/0uJsfYZYoFew5lexgVVdD84P6aeqjNs6Yen2kptQhmoW5BXrc4fe4KSQNq9iOwu1yZhIzhwiYhZaVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBf+gGb/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBf+gGb/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C521F000FF;
	Tue, 22 Sep 2026 03:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790047023;
	bh=RrKD3vZxKk0okmt2BWc7NZNTqKvpIXF0afhEUdDqMUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RBf+gGb/4w6n4zUlGnu8wCScUdDtCRlvumphPJEN2q/e9TdUwPYHzkGhljqhim7UC
	 akI10i4/hXBiepd7++625vQ9F390/KMOkV83PwTewBHy+shJTt2f0dlxrvSfZfX7+l
	 ggnfBAXOV1/Orbhcir2Kk2i0CwBqw6ChV7XJf9chjQzgRaLG9zyEXtVZvd2OwXF/+m
	 4e574YCecESFglZ8mq5QAukzNIT69JFh/fcgmr0GitzpbFek+gPCWlYXTt8N9IjX0l
	 94ZLF3imcbnhs/7O4Jd7XKLZ8KfxD5QhelWw5MmnYPw0TGiYjeOFATuQGketHeoUpZ
	 2pO6CH85BH2uQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based
 probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922-fix-etm-probe-issue-on-shikra-v1-1-56d25e9bbe17@oss.qualcomm.com>
References: <20260922-fix-etm-probe-issue-on-shikra-v1-1-56d25e9bbe17@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 03:17:02 +0000
Message-Id: <20260922031703.54C521F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] arm64: dts: shikra: missing arm,coresight-loses-context-with-cpu=
 property
--

commit aab8605634d60b3bebc7a736fcec36f07d87f859
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based probing

The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
but do not implement self-hosted system-register trace access on
this SoC. The CPU ETMs have a memory-mapped aperture, so switch each
node to the standard "arm,coresight-etm4x", "arm,primecell" compatible
with its MMIO reg range.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index c1f06f692f664..62bacf749241f 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
[ ... ]
> @@ -3218,6 +3150,24 @@ cti@9020000 {
>  			label =3D "cti_apss_pe0";
>  		};
> =20
> +		etm@9040000 {
> +			compatible =3D "arm,coresight-etm4x", "arm,primecell";

[Severity: Medium]
Will this omission cause ETM tracing to silently stop functioning during CPU
deep idle?

By switching to MMIO without adding the arm,coresight-loses-context-with-cpu
property, the coresight driver will skip allocating the save state.

drivers/hwtracing/coresight/coresight-etm4x-core.c:etm4_add_coresight_dev()=
 {
    ...
    else if (pm_save_enable =3D=3D PARAM_PM_SAVE_FIRMWARE)
        pm_save =3D coresight_loses_context_with_cpu(dev);
    ...
}

Should the arm,coresight-loses-context-with-cpu property be added to these
new MMIO etm nodes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-fix-etm-pr=
obe-issue-on-shikra-v1-1-56d25e9bbe17@oss.qualcomm.com?part=3D1
