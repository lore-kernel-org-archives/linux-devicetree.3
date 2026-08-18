Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECDC3BF68D
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044024; cv=none; b=rtsILfIREJUgKBpKRcd9nvwiV/AWYJ9CDp4PAc/mM9AFsBnLbAZoa1DwhSM9tQJW/5HnQmGEn4GNUmQGdELESawzNG/bG8Oy5bQpNjbHmTkXXG3/iIK/jppLRcCfqdJL9WrpSq8v/LC1IZN0kZFuAD8f5KghSS6fonHCJ2VULyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044024; c=relaxed/simple;
	bh=r+z+CNlV0SQ7wzCvvzFGgEFJQCUfNb+xMjsPV4zaW2g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WC1vr56aTX0Mna0qbNnZcJMnl4sR/VEhDe9yDFrrh96TvZ7VknZM6Qm3M5k6NoB/r6Fy3SXO7A+jNi4HNMtwH3NRy/vSUXmDT2WBDGIKHMMZ1MLkl0WAsE5amqb8YsG4gNSDgWK2wtLrx/j1UALMfEQV+PVgnCwe55HqaUDaJtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+pKhjL3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+pKhjL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0CD1F000E9;
	Tue, 18 Aug 2026 09:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787044020;
	bh=/FXhqGsFow8hkgcKX9d5xT4CHSbDKSP6v189xA1DUOo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y+pKhjL3oDps9CmekM8VtCJ1ULT19kG8CfPV7aPmtqCDOHQrkrfQSz2ZbizNml+45
	 2WfDYKwcePVnkgrQ9ontOYgT5SJ/UODoNIhXsQXBU9nBX6Yy97GtLr+WmMxrmM872C
	 qFcb8uiIp+VI2MhWD3Cu6TLS/cGErGcJbxkatNvzlO4VWeYbMtDPsWwOE+7VYWk1kQ
	 WIj579l+2zQRna21BDG4EuNcIzmU2YrWM/btoxfK6TPYKnw5rMQAQOT9OgXVpsoFd5
	 NMmzl3lN7aS26X9cUMeOhXaojbh6tWU+4DxRjjJpyeUFGB1xEfFEH9oeOF8T0AbW73
	 pqF+ABNYqe9sA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: qcom: qdsp6: Zero-initialize AudioReach
 module config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasad Kumpatla" <prasad.kumpatla@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260818084655.3240284-3-prasad.kumpatla@oss.qualcomm.com>
References: <20260818084655.3240284-1-prasad.kumpatla@oss.qualcomm.com>
 <20260818084655.3240284-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 09:07:00 +0000
Message-Id: <20260818090700.9E0CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing dma_rmb() between reads of frame_counter and index in q6ap=
m_dai_pointer().
- [Medium] Memory leak of dynamically allocated fragment buffers on error p=
aths.
--

--- Patch [2]: [PATCH v2 2/4] ASoC: qcom: qdsp6: Zero-initialize AudioReach=
 module config ---
commit 8c62450bf2680c8f23f31e1b33efb46a0ed00f8a
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: qcom: qdsp6: Zero-initialize AudioReach module config

q6apm_dai_prepare() and q6apm_dai_compr_set_params() build an AudioReach
module config on the stack. Initialize the whole config structure so omitted
fields reliably retain their zero/default meaning.

Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatl=
a@oss.qualcomm.com

> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6ap=
m-dai.c
> index bf1f872a09f45..033197bdd8705 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -216,7 +216,7 @@ static int q6apm_dai_prepare(struct snd_soc_component=
 *component,
>  {
>  	struct snd_pcm_runtime *runtime =3D substream->runtime;
>  	struct q6apm_dai_rtd *prtd =3D runtime->private_data;
> -	struct audioreach_module_config cfg;
> +	struct audioreach_module_config cfg =3D {};

[Severity: Medium]
This is a pre-existing issue, but while looking at q6apm_dai_prepare() in
sound/soc/qcom/qdsp6/q6apm-dai.c, could there be a memory leak of the
dynamically allocated fragment buffers on the error paths?

If a failure occurs during setup, such as q6apm_graph_media_format_pcm()
returning an error:

	ret =3D q6apm_alloc_fragments(prtd->graph, substream->stream, prtd->phys,
				(prtd->pcm_size / prtd->periods), prtd->periods);
...
	ret =3D q6apm_graph_media_format_pcm(prtd->graph, &cfg);
	if (ret < 0) {
		dev_err(dev, "%s: CMD Format block failed\n", __func__);
		return ret;
	}

The function returns without setting prtd->state to Q6APM_STREAM_RUNNING.

Later, when ALSA cleans up and calls q6apm_dai_close(), the teardown
logic skips the cleanup of the buffers because prtd->state is 0:

	if (prtd->state) {
		/* only stop graph that is started */
		q6apm_graph_stop(prtd->graph);
		q6apm_free_fragments(prtd->graph, substream->stream);
	}

	q6apm_graph_close(prtd->graph);

This frees the graph structure itself, losing the pointers to the buffers
and permanently leaking the memory.

Should the error paths in q6apm_dai_prepare() clean up the allocated
fragments, or should q6apm_dai_close() be adjusted to free them even if
the stream isn't fully running?

>  	struct device *dev =3D component->dev;
>  	struct q6apm_dai_data *pdata;
>  	int ret;

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the changes
in sound/soc/qcom/qdsp6/q6apm-dai.c, I noticed a potential issue in
q6apm_dai_pointer(). Are read memory barriers needed in the retry loop
when reading from shared DMA memory?

q6apm_dai_pointer() contains this loop:

		/* index is valid if frame_counter does not change while reading. */
		do {
			fc1 =3D READ_ONCE(prtd->pos_buffer->frame_counter);
			index =3D READ_ONCE(prtd->pos_buffer->index);
			fc2 =3D READ_ONCE(prtd->pos_buffer->frame_counter);
		} while (fc1 !=3D fc2 && --retries);

On weakly-ordered architectures like ARM64, is the CPU permitted to reorder
these reads from the coherent DMA memory? If index is read before fc1, or
fc2 is read before index, might the validation fail to detect a concurrent
update by the DSP, leading to an incorrect hardware pointer snapshot being
returned?

Would adding dma_rmb() between these reads ensure the correct ordering?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818084655.3240=
284-1-prasad.kumpatla@oss.qualcomm.com?part=3D2
