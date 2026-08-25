Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDD53B634E
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 18:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787684094; cv=none; b=Bg44E6s040WeHeeYWZfpnlFP1LgPUFjcdbZXE5aXOT4n00Eqs4UG0Im71+Tw5lzgrfyUgewhOkFyKUbXFp2FP11x345DWUuhrRskjfRtto4mMm28/14u/i5B49G4x2URNOKQ86k08RnTcSSCIpQQMv/SFNNy6FeS8tqJYQ7RqE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787684094; c=relaxed/simple;
	bh=lKgk5PwZ5UqNiZjsAYbYnAwKN3ScILn1PoirZyzqgOI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tht4lXxE/VQhMBo3sd6tcubXHYiKLGFsMjip9sbbzEYChmvmcqAlerwhECtc7iDvRdF4XJCSY6oktDkFklWsFcllx0F25WaFOrvWjh8Tl+cSKklzuRfHkHYfNuqJZWMR/WkqcqaFGH01RitEqmmCtDbBeF8ln05vvjAeGWTBYHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/5m2iCv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/5m2iCv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A291F000E9;
	Tue, 25 Aug 2026 18:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787684091;
	bh=O9kMeT7v20s6cW/johSDZocC8Mc+kD+InlYH7WEi3bk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E/5m2iCvFey3AwuD22xXsftNSF44PNpAQan9acTxFWHpFDf9sTeawD4JnoJxwKuF0
	 YQ+wLo8WDGYb7ZlW0Ibnv6RxtP7vCBYOXPH0YKD8pr5/ys4ZLxE8dh7FNiGLW9cZec
	 WQK/hkA+fM+5iR7kE0sFBv16ukjnPvfIidsEdNkhYjkUZxxrXUC4Fk+mlYfTkjsIu9
	 y9k8SCEa4+smtJKsPtV5Xz8x6MpPBelz7pP5AA1PMN4wBt2iDoJmCqFCaW3T7lsQt4
	 Z2IMaCt0rcKjXD1DzRr5NXSpZqByQTmJ49oZUpbd3vQlUj0GHEE8MPjdfoNi61eSTM
	 sV0WkqcaGci/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] ASoC: qcom: qdsp6: generalize GPR service domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ajay Kumar Nandam" <ajay.nandam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260826-a2a-shikra-vmid-v5-v2-3-c3dc62354eee@oss.qualcomm.com>
References: <20260826-a2a-shikra-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com>
 <20260826-a2a-shikra-vmid-v5-v2-3-c3dc62354eee@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 18:54:51 +0000
Message-Id: <20260825185451.61A291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Global pointer `g_apm` is not cleared on driver removal, leading t=
o a Use-After-Free.
- [High] Functions acquire a mutex and allocate memory with `GFP_KERNEL` wh=
ile holding a spinlock with IRQs disabled.
--

commit bafa8aa7e49a38a568945d982b4109f80964d60c
Author: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

ASoC: qcom: qdsp6: generalize GPR service domain

This commit generalizes the GPR destination domain in AudioReach to support=
=20
targets where audio is served by the modem DSP instead of the ADSP. It=20
updates the packet builders to dynamically stamp the correct domain from=20
the device, rather than hardcoding it.

> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index f167b9dae3fa1..3ec3c5a18c7a2 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -29,11 +29,13 @@ struct apm_graph_mgmt_cmd {
> =20
>  static struct q6apm *g_apm;

[Severity: High]
This is a pre-existing issue, but does this code leave a dangling pointer
on driver removal?

The global pointer g_apm is assigned dynamically allocated memory during=20
apm_probe(), which is bound to the device's lifecycle. However, apm_remove(=
)=20
fails to clear g_apm:

sound/soc/qcom/qdsp6/q6apm.c:apm_remove() {
	of_platform_depopulate(&gdev->dev);
	snd_soc_unregister_component(&gdev->dev);
}

The devres framework will free the apm structure automatically after remova=
l.=20
If another subsystem subsequently calls q6apm_is_adsp_ready(), it will=20
dereference the freed pointer:

sound/soc/qcom/qdsp6/q6apm.c:q6apm_is_adsp_ready() {
	if (g_apm)
		return q6apm_get_apm_state(g_apm);
}

> =20
> -int q6apm_send_cmd_sync(struct q6apm *apm, const struct gpr_pkt *pkt,
> +int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
>  			uint32_t rsp_opcode)
>  {

[ ... ]

> @@ -502,6 +504,8 @@ int q6apm_write_async(struct q6apm_graph *graph, uint=
32_t len, uint32_t msw_ts,
> =20
>  	mutex_unlock(&graph->lock);
> =20
> +	pkt->hdr.dest_domain =3D audioreach_gpr_dest_domain(graph->apm->gdev);
> +

[Severity: High]
This is a pre-existing issue, but does calling this function result in a=20
sleep-in-atomic bug?

Earlier in q6apm_write_async(), it calls audioreach_alloc_pkt(), which=20
allocates memory with GFP_KERNEL. It also acquires a sleepable mutex via=20
mutex_lock(&graph->lock).

However, callers in sound/soc/qcom/qdsp6/q6apm-dai.c such as=20
event_handler_compr() and q6apm_compr_copy() call this while holding an=20
IRQ-disabled spinlock:

sound/soc/qcom/qdsp6/q6apm-dai.c:event_handler_compr() {
	...
	guard(spinlock_irqsave)(&prtd->lock);
	...
	q6apm_write_async(prtd->graph, bytes_to_write, 0, 0, wflags);
}

Could this lead to schedule-while-atomic panics or deadlocks during compres=
sed=20
audio playback?

>  	return gpr_send_port_pkt(graph->port, pkt);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-a2a-shikra=
-vmid-v5-v2-0-c3dc62354eee@oss.qualcomm.com?part=3D3
