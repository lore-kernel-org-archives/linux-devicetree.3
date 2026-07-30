Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E793769FD
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785426775; cv=none; b=NO3PcKp4rGRg5lPlJzBON2yZD2ciUi/zBA9JA29ZcKdwquQbPxu0IO80cXS0b0BrzvZrgCbJY4y6vwFjMWoL8g6/MuIspPKXJMqSQmERgW4FSkhDuPUA7JrBGaBBWD33l+APB96We6SPfDf7nAqRcml86mbIGF/X+CETWVmpxZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785426775; c=relaxed/simple;
	bh=F+y4m7VibDZOEtIg5Nrqpu2L5RBbpNVyEcj93wj/2mI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gM0wC2QMvEz4oXMm0n2JMXsgDWmYIk43r9t9El82htw9c4aC33M5nj06KirsQl6zutCWkD23MPgdyY8ZOvOKqyl+mSrJnWWmH1Qm7QpLnJ6upMf67THHp7j+ygsFvPUJrD+B+PVRlc49Wk4fqrwEns0VdJ+KEJ7z9dxhMkxvYow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apTx3aZv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apTx3aZv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D921F00A3A;
	Thu, 30 Jul 2026 15:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785426774;
	bh=H6ma4n4K3QQhV4hJbi560Dr1iQEsNPL1hEFBXFQ4CwM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=apTx3aZvlrUee8yO3C1RmduJbncFzLmnD0udxTLasyP/7fa3jceKT0Z2VFCpheocj
	 hwhiFaFCYhZHJOZjN5IDiXuQRv7jQ2BSP+K0yUv7EGgweqHduPbCEDGB2WHNb2WWCs
	 R18Tn4kegsi63O/BMmy2AnFxpeRYoCRVtQuQmkyA0Mb4hknM9KAXBNNdqNAtMHc6M2
	 akgtmeCFyNc/Zo7CDBuwnbcSTno1UXHMjxFlbBkq7gytsUmGKSCo2lm5b0OBjysTPF
	 xAG2BSRlEcYLtasDsH7F7nehqSPHS4MI0meyXtDtYLWb4J0kkLz06fC4uYE7wpcXIa
	 JiMp9SRaaaQjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 13/18] media: iris: update buffer requirements based
 on received info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260730-iris-ar50lt-v8-13-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-13-6597c08cea6f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 15:52:53 +0000
Message-Id: <20260730155253.A6D921F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free in threaded IRQ handler due to missing reference co=
unting on iris_inst
--

--- Patch [13]: [PATCH v8 13/18] media: iris: update buffer requirements ba=
sed on received info ---
commit eebc551c83e572d39b479f0c60f9705bbd9fe71d
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

media: iris: update buffer requirements based on received info
   =20
Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/=
drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 23fc7194b1e3a..7ad6f0bb46770 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> [ ... ]
> @@ -657,7 +731,7 @@ static void iris_hfi_gen1_handle_response(struct iris=
_core *core, void *response
>  		} else if (hdr->pkt_type =3D=3D HFI_MSG_SESSION_FILL_BUFFER) {
>  			iris_hfi_gen1_session_ftb_done(inst, hdr);
>  		} else if (hdr->pkt_type =3D=3D HFI_MSG_SESSION_PROPERTY_INFO) {
> -			complete(&inst->completion);
> +			iris_hfi_gen1_session_property_info(inst, hdr);

[Severity: High]
This is a pre-existing issue, but could this inst dereference lead to a
use-after-free if the IRQ thread races with userspace calling close(fd)?

Looking at iris_get_instance() in
drivers/media/platform/qcom/iris/iris_utils.c, it drops core->lock and
returns a raw instance pointer without incrementing a reference count:

drivers/media/platform/qcom/iris/iris_utils.c:iris_get_instance() {
    ...
	mutex_lock(&core->lock);
	list_for_each_entry(inst, &core->instances, list) {
		if (inst->session_id =3D=3D session_id) {
			mutex_unlock(&core->lock);
			return inst;
		}
	}

	mutex_unlock(&core->lock);
	return NULL;
}

Concurrently, if a userspace thread calls close(fd), iris_close() in
drivers/media/platform/qcom/iris/iris_vidc.c calls iris_remove_session(inst)
and then kfree(inst), without synchronizing with concurrent readers in the =
IRQ
thread.

If the threaded IRQ handler gets preempted after iris_get_instance()
returns but before acquiring inst->lock, would it wake up and
dereference the freed inst pointer when calling mutex_lock(&inst->lock)
earlier in this function?

>  		} else {
>  			struct hfi_msg_session_hdr_pkt *shdr;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iris-ar50l=
t-v8-0-6597c08cea6f@oss.qualcomm.com?part=3D13
