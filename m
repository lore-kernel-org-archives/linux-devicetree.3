Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E25370AD6
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784376931; cv=none; b=FSzQD7Cx7A/KuoJNcgBqUB3a7f9iNFz5YSAR76ugZCtqPQpOm4vSV3x2HwaeMtz5VAEzS8ce0aUJXHY+kcMZJnKBccFg7zh78nRGdzgSIWZzU5Qnu5BNM+ClT6dhdG94qOidcNqjgvWIZSpcY/1Ygwpxz1/bUmYKCQ+8te0TqMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784376931; c=relaxed/simple;
	bh=4i8mThI/5nJg5BOe4xWE7l8k9lBocxglTgmlsqp/rkY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JiMtgtlkXxMIUhAZ5jaOVpGzFEYwXRpf5ZYQVnSWw+axv6fuL9rexUH3JhlYaiiixXMUJmH9gpD4Syhpke2ipmp3S45nEcR20uDZHDo8HeKTykR8a5Wa8mW6tgP9ief/l+YNZX5kTKgAE77fsedX6QlFr60OR1e2XQs8pGunT1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4OB/gYz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4OB/gYz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17C21F000E9;
	Sat, 18 Jul 2026 12:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784376930;
	bh=azL5l5HDDmz2JjzUCCBBZHl5c1Q8QqnmrtBB3Yb+J2A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e4OB/gYzjQ4XYzj6PZzZ7VVpYWlUQSh+RYYrUzdUqeBeXQznJGgF9t+GPazJJdi2n
	 mj3/FtC2fPsuuG9QeJ3qG7bxKbTTXKhHgsGZVB8vNVtLIeVoJx0sD1GPGhfJiprpzR
	 dTDv2XN8B5g+ANZXTERqd4zlsZb2Ss1k2UdvUeN7m6ck/jLz0lxFzfG+SUrOuUlC8M
	 bb/WLGAw1u1/tMoGD/0TmT+/8LR8+1xXnMGo1i8JygF9i1qjZ8kZag88ymelSm48HU
	 unUSlVxI7uoAjyJe2c+2BEts2Mk9QtpeEmG5EDRgkZYWT7FMibs4sp4WEWsSB6hH9t
	 RNCyfjNr9r/wA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gopikrishna Garmidi" <gopikrishna.garmidi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260718-b4-kalambo-crd-v1-4-a1069b5a2757@oss.qualcomm.com>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-4-a1069b5a2757@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 12:15:29 +0000
Message-Id: <20260718121529.B17C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect error check for irq_create_fwspec_mapping() return value=
 breaks deferred probing and causes permanent probe failure.
--

--- Patch [4]: [PATCH 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CR=
D ---
commit 64635e7b37ce27df0438767be7b9b4011a0fa5f6
Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

firmware: qcom: scm: Allow QSEECOM on Kalambo CRD

This commit adds the Kalambo CRD board to the QSEECOM allowlist. This
enables access to efivars on this platform.

> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index f35f2ee391304..d1cc6c908daa4 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2327,6 +2327,7 @@ static const struct of_device_id qcom_scm_qseecom_a=
llowlist[] __maybe_unused =3D {
>  	{ .compatible =3D "microsoft,romulus15", },
>  	{ .compatible =3D "qcom,glymur-crd" },
>  	{ .compatible =3D "qcom,hamoa-iot-evk" },
> +	{ .compatible =3D "qcom,kalambo-crd" },

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in
qcom_scm_probe() related to how the return value of qcom_scm_get_waitq_irq()
is checked.

When qcom_scm probes before the interrupt controller,
irq_create_fwspec_mapping() fails to find the IRQ domain and returns 0 to
indicate a failure to map the IRQ.

drivers/firmware/qcom/qcom_scm.c:qcom_scm_get_waitq_irq() {
    ...
    return irq_create_fwspec_mapping(&fwspec);
}

This means qcom_scm_get_waitq_irq() can return 0. However, in qcom_scm_prob=
e():

drivers/firmware/qcom/qcom_scm.c:qcom_scm_probe() {
    ...
	irq =3D qcom_scm_get_waitq_irq(scm);
	if (irq < 0)
		irq =3D platform_get_irq_optional(pdev, 0);
    ...
}

Should this check be if irq <=3D 0?

By only checking irq < 0, a return value of 0 bypasses the fallback to
platform_get_irq_optional(). This function would have correctly deferred the
probe by returning -EPROBE_DEFER.

Does this instead cause the driver to attempt to request IRQ 0 via
devm_request_threaded_irq(), which would fail with -EINVAL and result in a
permanent probe failure for the qcom_scm driver during boot?

>  	{ .compatible =3D "qcom,mahua-crd" },
>  	{ .compatible =3D "qcom,purwa-iot-evk" },
>  	{ .compatible =3D "qcom,sc8180x-primus" },

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718-b4-kalambo=
-crd-v1-0-a1069b5a2757@oss.qualcomm.com?part=3D4
