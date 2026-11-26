Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687793;
	b=DO/Ofo/GduVdVZm0WsL+RjVtSkNp1uJh2mwrELvXuLFmFgwveuDYOilcYa67o6223PdH
	 TQkbsi1eyibYsJtHs3DDElUY8yFr6FQosc/+66Z1fshfMjWClNLhOCHn1QZKNucZS9+G7
	 Td2eUox6rcf5mGpsrU7vmUpbQ9/0YbMkdJLU8/Cw7fXMqH0UhIIlETXuKkF+y1C6tSIzf
	 ADDZB3QxVVz5+zfyAPy22mGcEV3Oou2Nd3tCE32UcLsAtDHlAWg2qrfjt866gS6LDF04L
	 UANpwNTrrC5k8c8BTKmmGi0viB2mvDNSkSj6F+dkpLlO1ahNWoM+fWD3lieOOCsID6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687793;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7Eyh8wpGl5sNmzJ5YkTonr7dAhb8JtL5CPOleWN7i5o=;
	b=f7BrIWvuciVqcuDapdDTFb9MgwwRq60dj/P2TQYVpDF+8h0dqnvX3Mmco+lBiYQ5gwNW
	 w2IUacf5hMXmWz5DcWV61JCEJoAfMS2zixzyQQsMButXObf/4BGq3ddVztff1lEThj6OM
	 xI27/1XW9+jjCGVxGeYFfATnkCtbg4P8T4kztA6c+z9I0LYHrCI8QSoO2c+yyt46hCkj/
	 JqLjxxyVUKwnFa+5BpEJNnUBa5Pjlhd/brP9nbVvcpp5icIhw8ibGh/kETCLX8ii05LZL
	 u9Yd1xm5UdOmY5ML4hd5n1V7riCBR5aQ3M01GodCX5hscTX5TWDu89jY7/5qxVvpWYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZcWG05EX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCCC606A326
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZcWG05EX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852221F00A03;
	Thu, 26 Nov 2026 10:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795687792;
	bh=7Eyh8wpGl5sNmzJ5YkTonr7dAhb8JtL5CPOleWN7i5o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZcWG05EXRlEZbyadYfIOkxeFym4zHa0OlZB1tn239VtH4DAOpSF8nfuDN+sCwBC/l
	 DZellZcGsqOSgwSGsF0Djbohgs2WFjb7UvlrBA0IbKi2pxGnSxYvhe/MpviqCHCAdY
	 quCZ99lpo33BBh6IxPadxakxkDRzNYC3QdryKjvcmxNk8P0SjgSdPkYg0yJbih8rU4
	 n1JLMIhXkE54x7Cu+sZ/FHv+L9BuzPCSN8JPkzT7mM/F92E1ydVf6ibeteJ2I1Jwlp
	 4QIex/lxxBupJIVK/Mwc0aIT4GCUeckBW4rjB0Y8AqW61BWs15FW3b/gqIPeUT+Va9
	 6iGIMFEBxVpZw==
Message-ID: <sashiko-outbox-235248@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/14] gtrace: Add RISC-V Trace encoder driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <7c08bb0d199c3a8cf0ec0b875d5a42165ec164eb.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
 <7c08bb0d199c3a8cf0ec0b875d5a42165ec164eb.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:09:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] gtrace: broken source ID bit-width probing in
  rvtrace_encoder_probe()
- [Medium] gtrace: missing trTeEmpty flush poll in
  rvtrace_encoder_stop()
--

commit 23f7809d52c4ad4dc2d6c2111a3f04ab70095757
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

gtrace: Add RISC-V Trace encoder driver

This commit adds the initial driver for the RISC-V E-Trace encoder
component defined by the RISC-V Trace Control Interface specification.

> diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtraci=
ng/gtrace/rvtrace-encoder.c
> new file mode 100644
> index 0000000000000..f528a6af42e14
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
[ ... ]
> +static int rvtrace_encoder_probe(struct gtrace_component *comp)
> +{
> +	struct gtrace_platform_data *pdata =3D comp->pdata;
> +	struct rvtrace_encoder_priv *priv;
> +	u32 val, hw_srcbits, srcbits;
> +	int ret;
[ ... ]
> +	/* Check if trTeInhibitSrc is hardwired to 1 */
> +	val =3D gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val &=3D ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
> +	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val =3D gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	if (!(val & BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT))) {
> +		/* Probe how many bits can trTeSrcID span in the emitted Trace message=
s */
> +		val =3D gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
> +		hw_srcbits =3D RVTRACE_ENCODER_INSTFEAT_SRCBITS_MAX;
> +		do {
> +			val &=3D ~RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK;
> +			val |=3D FIELD_PREP(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, hw_srcbits=
);
> +			gtrace_write32(pdata, val, RVTRACE_ENCODER_INSTFEAT_OFFSET);
> +			val =3D gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
> +			if (FIELD_GET(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, val) =3D=3D hw_s=
rcbits)
> +				break;
> +		} while (--hw_srcbits);
> +		/* Determine if there are sufficient bits to hold max cpus */
> +		srcbits =3D min_t(u32, hw_srcbits, order_base_2(nr_cpu_ids));
> +		if (srcbits && pdata->bound_cpu < BIT(srcbits)) {
> +			rvtrace_encoder_set_srcid(pdata, srcbits);
> +			val =3D gtrace_read32(pdata, RVTRACE_ENCODER_INSTFEAT_OFFSET);
> +			if (FIELD_GET(RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK, val) =3D=3D srcb=
its)
> +				priv->srcbits =3D srcbits;
> +		}
> +	}

[Severity: High]
Does clamping srcbits with order_base_2(nr_cpu_ids) leave priv->srcbits
unset on single-CPU systems or hardware with a fixed trTeSrcBits width?

When nr_cpu_ids is 1, order_base_2(1) evaluates to 0, so srcbits is 0 and
no source ID is configured.  In addition, trTeSrcBits in trTeInstFeatures
is a WARL field often fixed to a synthesis-time width (e.g. 4 bits); when
order_base_2(nr_cpu_ids) is smaller than that fixed width, reading back
RVTRACE_ENCODER_INSTFEAT_SRCBITS_MASK returns hw_srcbits rather than
srcbits, causing the equality check to fail and disabling source IDs even
though hw_srcbits can hold pdata->bound_cpu.

[ ... ]

> +static int rvtrace_encoder_stop(struct gtrace_component *comp)
> +{
> +	struct gtrace_platform_data *pdata =3D comp->pdata;
> +	int ret, err;
> +	u32 val;
> +
> +	val =3D gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val &=3D ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
> +	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	ret =3D gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			      RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 0,
> +			      pdata->control_poll_timeout_usecs);
> +	if (ret)
> +		dev_err(&comp->dev, "failed to stop tracing.\n");
> +
> +	err =3D gtrace_disable_component(comp);
> +	if (err)
> +		dev_err(&comp->dev, "failed to disable encoder.\n");
> +
> +	return ret ?: err;
> +}

[Severity: Medium]
Should rvtrace_encoder_stop() call rvtrace_comp_poll_empty(comp) before
disabling the encoder?

Per the RISC-V Trace Control Interface specification, clearing
trTeInstTracing causes the encoder to flush remaining queued trace
packets and assert trTeEmpty when drained.  Disabling the component
before trTeEmpty asserts can discard buffered trace data at the end of a
session.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795512532.gi=
t.mayuresh.chitale@oss.qualcomm.com?part=3D6
