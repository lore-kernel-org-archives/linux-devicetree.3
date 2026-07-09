Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B306A42B307
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605971; cv=none; b=oMigfbjrPH3GhOJ5jVwMQq8ON3cwYEiV+tgUYD/Lu39bBRYPYmfnFaZu82i0cgZVvB+bvB6NJMEGCclyTesQG3tZz6HSr9M8WFvHFGQx2Fqr28+NxGPkq9iTcU7fod1LsYHIsVy6N9YXVFA0FfxwyiyCG9pQqAhyqdeCa8jEYoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605971; c=relaxed/simple;
	bh=NJSgq/cgH8jwv1p3nYEd7PwMrLgyK9/d4y3qZt7wFyo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dHD3kZnCh/tLJtQpAP/Q5BhmxiXcMcy1dPZCYJkHXOjkurjAsiZeBm3tv5PT37AyW+K8LV6lNwrUxawd3QYepFdkGxSRqTi0AAOb3K9iH1Tg+FRCL6Gya+UvtD1Wi2ZqK/rmkXzY1sd/b6vqHCok3oCGt+jE1BYQi4Mgw8REUAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/bjK9ia; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/bjK9ia"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CF91F00A3F;
	Thu,  9 Jul 2026 14:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783605969;
	bh=hEThS8myXa3gXlILjRUSPXuiNz8lfDeWA8Sh3Ykq6qk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h/bjK9iafn/bhEgwzKCaVQoDkmOqCB0Xtpf7LJmO9Byp0UGA7nw/QRPk7eEwSTBWM
	 sl2+DKb/N42DjH5gRj1CKu+CpqvMYJAfD4Lrr3SfHGuYGn7QAd0gJaYALRuhb0S/yF
	 vygvVoKVotuJPEvCcFtMF2EWw5qiXqSbwiIKDuemj4rtpNd0tKMw8r//eQPj5L9REC
	 gbf+MKDT9itcEZGdCJXlEhbCA2nzVwmR+jAR1TAGI3cxF4/Nr1PhDrz/zBkNfwvys7
	 XC0TMaYT9wSS1fLNQzoIbwubnLnCxh0ME/xNyUW/wrSCTw8Jua712guX55KCJf/NKE
	 ZXsvlMpaes8YQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 12/18] media: iris: add minimal GET_PROPERTY
 implementation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260709-iris-ar50lt-v7-12-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-12-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:06:08 +0000
Message-Id: <20260709140609.59CF91F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free (UAF) occurs in the HFI response handler when an in=
stance is concurrently closed.
- [High] Concurrent V4L2 ioctls can race and corrupt `inst->completion` due=
 to dropping `inst->lock` while waiting for firmware responses.
--

--- Patch [12]: [PATCH v7 12/18] media: iris: add minimal GET_PROPERTY impl=
ementation ---
commit a6032a96e9889c0a8753d5947e2b2a2b8f59d3be
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

    media: iris: add minimal GET_PROPERTY implementation
   =20
    AR50Lt with the Gen1 firmware requires host to read
    HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS property, otherwise it doesn't
    update internal data and fails the HFI_CMD_SESSION_LOAD_RESOURCES
    command. Implement minimal support for querying the properties from the
    firmware. It is used by one of the following patches, adding support for
    Agatti.

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/d=
rivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 7674b47ad6c49..99e82e5510abe 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -1117,10 +1117,31 @@ static int iris_hfi_gen1_session_set_config_param=
s(struct iris_inst *inst, u32 p
>  	return 0;
>  }
> =20
> +static int iris_hfi_gen1_session_get_property(struct iris_inst *inst, u3=
2 packet_type)
> +{
> +	struct hfi_session_get_property_pkt pkt;
> +	int ret;
> +
> +	pkt.shdr.hdr.size =3D sizeof(pkt);
> +	pkt.shdr.hdr.pkt_type =3D HFI_CMD_SESSION_GET_PROPERTY;
> +	pkt.shdr.session_id =3D inst->session_id;
> +	pkt.num_properties =3D 1;
> +	pkt.data =3D packet_type;
> +
> +	reinit_completion(&inst->completion);
> +
> +	ret =3D iris_hfi_queue_cmd_write(inst->core, &pkt, pkt.shdr.hdr.size);
> +	if (ret)
> +		return ret;
> +
> +	return iris_wait_for_session_response(inst, false);

[Severity: High]
This is a pre-existing issue, but can concurrent ioctls on the same file
descriptor corrupt inst->completion here?

The driver implements manual ioctl serialization by acquiring inst->lock.
However, iris_wait_for_session_response() drops inst->lock while waiting:

drivers/media/platform/qcom/iris/iris_utils.c:iris_wait_for_session_respons=
e() {
    ...
	mutex_unlock(&inst->lock);
	ret =3D wait_for_completion_timeout(done, msecs_to_jiffies(HW_RESPONSE_TIM=
EOUT_VALUE));
	mutex_lock(&inst->lock);
    ...
}

Doesn't dropping the lock allow a concurrent ioctl to acquire inst->lock, i=
ssue
a new command, and call reinit_completion(&inst->completion) again, thereby
wiping out the completion state for the first thread?

> +}
> +

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/=
drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index bfd7495bf44f0..23fc7194b1e3a 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c

[ ... ]

> @@ -652,6 +656,8 @@ static void iris_hfi_gen1_handle_response(struct iris=
_core *core, void *response
>  			iris_hfi_gen1_session_etb_done(inst, hdr);
>  		} else if (hdr->pkt_type =3D=3D HFI_MSG_SESSION_FILL_BUFFER) {
>  			iris_hfi_gen1_session_ftb_done(inst, hdr);
> +		} else if (hdr->pkt_type =3D=3D HFI_MSG_SESSION_PROPERTY_INFO) {
> +			complete(&inst->completion);

[Severity: High]
This isn't a bug introduced by this patch, but is there a use-after-free ri=
sk
when accessing inst here if the instance is concurrently closed?

The threaded IRQ handler iris_hfi_gen1_handle_response() retrieves the inst=
ance
via iris_get_instance(), which finds inst but drops core->lock without taki=
ng
a reference count:

drivers/media/platform/qcom/iris/iris_utils.c:iris_get_instance() {
    ...
			mutex_unlock(&core->lock);
			return inst;
    ...
}

If a user-space process closes the file descriptor concurrently, iris_close=
()
acquires inst->lock, calls iris_remove_session(), drops the lock, and frees=
 inst:

drivers/media/platform/qcom/iris/iris_vidc.c:iris_close() {
    ...
	iris_remove_session(inst);
	mutex_unlock(&inst->lock);
	mutex_destroy(&inst->ctx_q_lock);
	mutex_destroy(&inst->lock);
	kfree(inst->fmt_src);
	kfree(inst->fmt_dst);
	kfree(inst);
}

When the IRQ handler iris_hfi_gen1_handle_response() resumes and attempts to
acquire inst->lock or call complete(&inst->completion), could it dereference
the freed inst pointer?

>  		} else {
>  			struct hfi_msg_session_hdr_pkt *shdr;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-iris-ar50l=
t-v7-0-76af9dd4d1f6@oss.qualcomm.com?part=3D12
