Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1090A381AF0
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425975; cv=none; b=vBHDqkp3lRb+amdpaebcNbq7Qf3k4vIBlsgHlYgt1xSZnMPaAKTVPq1gw8PMfK5VbkNzsrDwVh8iQrU/X9qXQIT58Tfw6amBp+tviNXBoKNHBEd7KYdX8pyhEEHUs9PzpVeNE1sWaWwqltePSUoOWun6qYw1G23dP7ynWWG6JQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425975; c=relaxed/simple;
	bh=6P3wZvE8mlyWwpy4mlFasgJ4GnTGvrdHQF1nzkt8r2Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WXAbUxtIuxgRh7KPAJ7w7unkTxVHyyiHc2VBj+9lqjX7DrJI0LxELQlqtUfbeKTq6qodr7MhrW4waFs7xZPkY/NK/gPMDXj0p+RbEtg0Q6ByrGMrvUdmI5D8ej2qoJDz1RTAUfQctUlRBhG4Y058lTlqhq2pzFGgy33AD2hzuA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UjHCmlZ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UjHCmlZ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6943E1F00A3A;
	Thu, 30 Jul 2026 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785425973;
	bh=6aZkuEOjA4J9MjZHL0W8HnEgmqtNLqCwB+v7Y2On8Ds=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UjHCmlZ9j69N33SmFLNQMI3WyqICLDzuAWBnvjgw9Jjd6t4RTPP36p7loL4HDs+nR
	 MohPYXMn/qsIaXCNgRqwd5by6bfgzqlvvce+l3X+iOvIhg8u2vl4OeYbeASABn14up
	 mvPUoc2DTHNd9uK9lEsajVKBLF0o3Fmuqj3jMxJEDov7DVRQWUV/PVrPpTHmHYIqTc
	 MZnqaOOqOFwM8nD3upxG3Fxvmxzt77rTrFkQe0sSMZ/RecaFSj7HKHRZQhckKl7Xi8
	 fepQwiMI1Xy6G+sn3+42cnx7A+esiKHK0rXJP8pF/wvFP+fWzpoNAw0L8XwEcXqV7V
	 kfuOC75xNK3Ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 12/18] media: iris: add minimal GET_PROPERTY
 implementation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260730-iris-ar50lt-v8-12-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-12-6597c08cea6f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 15:39:33 +0000
Message-Id: <20260730153933.6943E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-after-free race condition in `iris_hfi_gen1_handle_response` d=
ue to lack of instance refcounting.
- [High] Concurrent commands can corrupt `inst->completion` and falsely sig=
nal command completion due to lock dropping.
--

--- Patch [12]: [PATCH v8 12/18] media: iris: add minimal GET_PROPERTY impl=
ementation ---
commit 30243b6f486f6a7511eef1e8f6ae8cf07acc9093
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

media: iris: add minimal GET_PROPERTY implementation

This commit adds minimal support for querying properties from the Gen1
firmware in the iris driver, specifically implementing
HFI_CMD_SESSION_GET_PROPERTY. This is required for AR50Lt to read
HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS.

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/d=
rivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -1117,10 +1117,31 @@ static int iris_hfi_gen1_session_set_config_param=
s(struct iris_inst *inst, u32 p

[ ... ]

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
> +}

[Severity: High]
This isn't a bug introduced by this patch, but does dropping the lock in
iris_wait_for_session_response() while waiting on a single shared completion
allow concurrent ioctls to corrupt the completion state?

A thread executing a V4L2 ioctl can lock inst->lock and issue a firmware
command. It then calls iris_wait_for_session_response(), which explicitly
unlocks inst->lock and sleeps on inst->completion:

iris_wait_for_session_response()
    mutex_unlock(&inst->lock);
    ret =3D wait_for_completion_timeout(done, ...);
    mutex_lock(&inst->lock);

While the first thread is waiting, another thread executing a concurrent
ioctl can acquire inst->lock, send a different firmware command, and call
reinit_completion(&inst->completion). Both threads end up sleeping on the
same completion.

When the firmware responds to the first command, the single completion is
triggered, which could incorrectly wake up the second thread prematurely.

Could this lead to corrupted driver state or commands assuming success befo=
re
the hardware has actually completed them?


> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/=
drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -652,6 +656,8 @@ static void iris_hfi_gen1_handle_response(struct iris=
_core *core, void *response
>  			iris_hfi_gen1_session_etb_done(inst, hdr);
>  		} else if (hdr->pkt_type =3D=3D HFI_MSG_SESSION_FILL_BUFFER) {
>  			iris_hfi_gen1_session_ftb_done(inst, hdr);
> +		} else if (hdr->pkt_type =3D=3D HFI_MSG_SESSION_PROPERTY_INFO) {
> +			complete(&inst->completion);
>  		} else {

[Severity: High]
This is a pre-existing issue, but is there a use-after-free race condition =
in
iris_hfi_gen1_handle_response() when dealing with inst?

When the hardware triggers an interrupt, the response handler retrieves the
instance pointer using iris_get_instance(). This function returns the point=
er
without incrementing any reference count:

iris_get_instance()
    mutex_lock(&core->lock);
    [ ... ]
    return inst;=20

If the response handler thread is preempted here, a concurrent close() on t=
he
device file descriptor can execute iris_close(). This would lock inst->lock,
remove the instance from the core list, and free the instance memory.

When the response handler resumes, it attempts to lock the freed instance:

iris_hfi_gen1_handle_response()
    inst =3D iris_get_instance(...);
    [ ... ]
    mutex_lock(&inst->lock);

Can this be triggered by a user space process rapidly closing the file
descriptor while firmware responses are pending, leading to memory corrupti=
on
or a kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iris-ar50l=
t-v8-0-6597c08cea6f@oss.qualcomm.com?part=3D12
