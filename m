Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4AF8472
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605913; cv=none; b=OSYLwdP3yvHA5otT+aQucHGGbAvZPc1/4HY5HLbaOT+GXa6ygtKrKrxiiuHHhy40n0YHrHxdF5kA5daT1aYm+8ko5KHMfq5ZVPAimjpD9lRcHxFzQkCiPQsTTw3tuGQLM2HF7DJwklYd2Cdu9wMmEEUD2Iq2/QMnPQi0qxwc5X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605913; c=relaxed/simple;
	bh=Qf0J6bWemGlfmjmGgxr+eHguk8IWCakPKEnD2W8b6oM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F5CaBRLXiXgm3MjOf6FAgKIsRLicD7xPrAwHiwCiWIcfq5DsXs9sYls7ZaJqv77vA1gXTcfgjR5E+jgB1kbHdVPpQzhyI3kM28Ol3tuRcEJBJGFThLuuHnuSGO2B/fT5MRNVNARtfISRtTqZxjdKW3MZnyPHiE4/DfjAqPnT9Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFVz9FhV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFVz9FhV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B951F000E9;
	Thu,  9 Jul 2026 14:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783605911;
	bh=A/WnIpld9ENE9dRajyAAU/Djnw4yshNdKzpzGB09TOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YFVz9FhVcISvz4ndTF3iQUoOvbc1xJFhy0lSsKAnLOQtz7WsJw/l1LJ6QVWs9k3vO
	 07Ht4x4Eai592Q1GYZPkqWOZFqWS8aNjQiV6MHMecn24qcYXwNBc7c0P1ffSMPbotV
	 Z/QtWajI90fLK1kDFmwrUr5HQQW1GLytUGJKccs9Bm6V3CSlufJOnFpOQ1Dhw04rqr
	 cV5h0XhYyb/lEwGUbHWxj02Bnks66QSPuXnZgGZC4G7nWiG/DkTlIxl2yIwjxPbRbU
	 rA11+7e9e+nYZxOZYjua9mBjhiepa3Cz8Li5nMj9UmTCvmvCLO9yAoDkJ/YrHbleW/
	 W1llPmu1InwaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 13/18] media: iris: update buffer requirements based
 on received info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709-iris-ar50lt-v7-13-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-13-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:05:10 +0000
Message-Id: <20260709140510.F3B951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing reference counting on `iris_inst` objects allows an interr=
upt handler to use a freed instance.
--

--- Patch [13]: [PATCH v7 13/18] media: iris: update buffer requirements ba=
sed on received info ---
commit fb9888a16075cc5bb0904df74da5c901575cc14f
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

media: iris: update buffer requirements based on received info

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data.

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/=
drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 23fc7194b1e3a..7ad6f0bb46770 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c

[ ... ]

> @@ -657,7 +731,7 @@ static void iris_hfi_gen1_handle_response(struct iris=
_core *core, void *response
>  		} else if (hdr->pkt_type =3D=3D HFI_MSG_SESSION_FILL_BUFFER) {
>  			iris_hfi_gen1_session_ftb_done(inst, hdr);
>  		} else if (hdr->pkt_type =3D=3D HFI_MSG_SESSION_PROPERTY_INFO) {
> -			complete(&inst->completion);
> +			iris_hfi_gen1_session_property_info(inst, hdr);
>  		} else {
>  			struct hfi_msg_session_hdr_pkt *shdr;

[Severity: High]
This is a pre-existing issue, but since we are modifying the message
handling flow here, there appears to be a use-after-free race condition in
iris_hfi_gen1_handle_response().

Can an interrupt handler access a freed instance if iris_close() is called
concurrently?

If a user closes the device, iris_close() executes. Concurrently, the
threaded IRQ handler reads a message and looks up the instance:

IRQ Thread:
iris_hfi_gen1_handle_response() {
    ...
    inst =3D iris_get_instance(core, pkt->shdr.session_id);
    // iris_get_instance returns the pointer without acquiring a reference
    mutex_lock(&inst->lock); // blocks if iris_close() is holding the lock
    ...
}

User Thread:
iris_close() {
    ...
    mutex_lock(&inst->lock);
    iris_remove_session(inst);
    mutex_unlock(&inst->lock);
    mutex_destroy(&inst->lock);
    kfree(inst);
    ...
}

Once iris_close() frees the instance, the IRQ thread unblocks and attempts
to use the destroyed mutex and freed instance memory. Does the driver need
reference counting (e.g., kref) on the iris_inst structure to prevent it
from being freed while the IRQ thread is processing messages for it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-iris-ar50l=
t-v7-0-76af9dd4d1f6@oss.qualcomm.com?part=3D13
