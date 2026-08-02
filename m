Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74914364EBF
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785656678; cv=none; b=kmJl0KEhbaS2eOCiRaXOC40dxp0LN6F7rzEP3PDwl51CsOfdp8/DHXtFj0+rzNEPl8S5PDrHid7FzCWAy20zW7u/PMGkay6jfyZ33ILBy+6W0c9ENRSZBDvOWk4b3yUvvkeBurnHUVw1L2I1VcEvV3I5Pbg3oWnwcJD0Tf5Zxi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785656678; c=relaxed/simple;
	bh=n9yV7PgfuUnpfGXGvdeGGlfo+DPz5HgatkekdzzQAc8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O/KktG82GJGq9eRp+YkS7IsaqDFDGS0Wxv0F0VB2bfzzKZK7hv2610PAd0txyU/9ezaz0Hn6dXOdTL8QObB+vfdulU9DJ+0Z3JIeIK8Pw9E5LBvHZQXnEUjqxAOlkpjHMAn/H5VoKGGjj5ztX8jVRWjTk9ackYhUJyj9wORpLGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMf7Y6/w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMf7Y6/w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12331F00AC4;
	Sun,  2 Aug 2026 07:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785656677;
	bh=KKIQiiv71dRHK36vjd98qCoPZRibvad9hOXOMfYcI/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DMf7Y6/w/rKo65hYw2cYR5JnUZYCPbZp7cv8CM2oQj9xDs914JqCBohVv/nj+BuX+
	 goHDXYQ5vhpI1CVrT2u82nN4Gae4hTCRozRssEG6r61QOpFJpRCrdZwsGpTYOD4YgW
	 jpyHJ3YsMg1maQhnI+48g/d1MNm6CeC08E1iqzkocMlyF2A/zlSYhxRzIFW2aWEaVy
	 lgw1+CXEASbG7DWngZyqq7PJ1akXl3HklnoTUVoqTywu09gP0VCzJvuvX2mCyCBc+D
	 c2K6uNEoMi9FRvv/ga6MMCtY2Ps2qt8Vtp4dPutc3wJ3ZCWiXgr6OwnABfLv9gmZzl
	 VT44Qy4/RLt/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] pinctrl: qcom: Commonize pinctrl-sm8450 headers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260802-sm8475-tlmm-v2-2-a93e1d1cb53b@proton.me>
References: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me>
 <20260802-sm8475-tlmm-v2-2-a93e1d1cb53b@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 07:44:36 +0000
Message-Id: <20260802074436.F12331F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Moving `enum sm8450_functions` to a shared header creates a brit=
tle design highly susceptible to latent NULL pointer dereferences via array=
 holes.
--

--- Patch [2]: [PATCH v2 2/4] pinctrl: qcom: Commonize pinctrl-sm8450 heade=
rs ---
commit f4cf6bf6634b4b995dec36c0bcb15b338f264b61
Author: Esteban Urrutia <esteuwu@proton.me>

pinctrl: qcom: Commonize pinctrl-sm8450 headers

This patch extracts common definitions, including pin groups and
functions, from pinctrl-sm8450.c into a new pinctrl-sm8450.h header.
This prepares the codebase for adding pinctrl support for SM8475, which
shares some of these definitions.

> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450.h b/drivers/pinctrl/qcom=
/pinctrl-sm8450.h
> new file mode 100644
> index 0000000000000..7501c694db572
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8450.h
[ ... ]
> +enum sm8450_functions {
> +	msm_mux_gpio,
> +	msm_mux_aon_cam,

[Severity: Medium]
Could moving this enum to a shared header introduce latent NULL pointer
dereferences via array holes?

If a future patch adds new functions for SM8475 in the middle of this shared
enum to maintain alphabetical order, it will change the enum values for SM8=
450.
This would leave holes (zero-initialized elements where .name is NULL) in t=
he
designated initializers of the sm8450_functions array.

During probe, msm_pinctrl_setup_pm_reset() in pinctrl-msm.c iterates up to
the highest initialized index:

drivers/pinctrl/qcom/pinctrl-msm.c:msm_pinctrl_setup_pm_reset() {
	...
	for (i =3D 0; i < pctrl->soc->nfunctions; i++)
		if (!strcmp(func[i].name, "ps_hold")) {
	...
}

Because there is no NULL check for func[i].name, iterating over these
uninitialized array holes would crash.

> +	msm_mux_atest_char,
> +	msm_mux_atest_usb,
> +	msm_mux_audio_ref,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-sm8475-tlm=
m-v2-0-a93e1d1cb53b@proton.me?part=3D2
