Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B283A3DA5D6
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176046; cv=none; b=cI/Z1rpzqQ9ezL/yhcDqaHeW/gEGENl0qhir/Li421ADDUymhoylyCEvxNZJv7UjOTsdWu30AMlMGZyZmwYWrvv05VT3IkYPNf+s5EDPUuJKXNoj3eS2qJympLw5IFgqr6NdfDNLjTiJKbLmDwq01IWnglTA9H4AbNDsId5dfFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176046; c=relaxed/simple;
	bh=lr74lmr+0PHRW7N+okbg1gYYp/2ufhnbdxFFiAu0Uq4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eAqj0LPEuAA3LnFc1qSyO4xH9Ir17S+fiJZZyr4NjbLrwFcuhyDxzv6/x6kYsBdc+CiRmmSDP51Iqqs9UfCFLtI0S9hEwyfBqdzZb4S1D6BtXSWHchFtJ9UzXrh8ADwclJ5IJn19cGlgHt6Xbdb+sPqJda6e3yC/WRUzm/i+PO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TGhObx19; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TGhObx19"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA28C2BCB3;
	Tue, 19 May 2026 07:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176046;
	bh=lr74lmr+0PHRW7N+okbg1gYYp/2ufhnbdxFFiAu0Uq4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TGhObx19EzjPSHg832cUXMazSe1vbZe5dQeTszWgYNB9xGg0srIIdhcvyX5CIcVew
	 TbLdwzxh8ggv+lWtni3+lWTQXNqAsgtnZwn/6etPKCQvd/DUuiqwnby5AzmWutswlj
	 FH3Ajy4ubkJ1L2CcsH1gIEeSzD82agh6T+FOpjgdrJ1D60oOUD4mfRz1nUGALH61+m
	 G4zZKMJcVkZFgpZ0IDSlXb9cn4y8KGDUqKdbdRDtH3hp3wLgsuX4jddp3n+GuK/mzV
	 TumPfwMF9PCbrcuxQoUrEskAyu5Fj6mV5K0Ipdtz9c+4A3HlceqkZ+SJ0eEeyLyJWF
	 TRYjy/dUW3xOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/16] media: qcom: Switch to generic PAS TZ APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518072856.22790-12-sumit.garg@kernel.org>
References: <20260518072856.22790-12-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:34:04 +0000
Message-Id: <20260519073406.4CA28C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unconditional use of SCM-specific API (qcom_scm_mem_protect_video_=
var) will cause a NULL pointer dereference when using a non-SCM TrustZone b=
ackend.
- [High] Migrating to the generic PAS API exposes a TOCTOU race and Use-Aft=
er-Free due to a lack of backend provider lifetime management.
--

commit 2d2fe5038803b9390438e02f3c0f53b945cc9bdc
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

media: qcom: Switch to generic PAS TZ APIs

This commit switches the Qualcomm media client drivers to use the generic
PAS TZ APIs instead of the SCM-specific ones. This allows the drivers to
support multiple TrustZone backend implementations such as QTEE and OP-TEE.

> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/m=
edia/platform/qcom/iris/iris_firmware.c
> index 5f408024e967f..b3c5281aea919 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
[ ... ]
> @@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
>  		return -ENOMEM;
>  	}
> =20
> -	ret =3D qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> +	ret =3D qcom_pas_auth_and_reset(core->iris_platform_data->pas_id);

Does moving to the generic PAS API introduce a race condition with module
unloading?

Looking at the generic PAS wrapper qcom_pas_auth_and_reset() in
drivers/firmware/qcom/qcom_pas.c:

int qcom_pas_auth_and_reset(u32 pas_id)
{
	if (!ops_ptr)
		return -ENODEV;

	return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
}

If the PAS backend module is unloaded concurrently, ops_ptr could be set to
null after the check but before the function pointer is invoked. Do the
client drivers need to hold a reference count to pin the backend provider
in memory before calling these APIs to avoid a use-after-free?

[ ... ]
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media=
/platform/qcom/venus/firmware.c
> index 1de7436713ed9..3a38ff985822f 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
[ ... ]
> @@ -218,7 +219,7 @@ int venus_boot(struct venus_core *core)
>  	int ret;
> =20
>  	if (!IS_ENABLED(CONFIG_QCOM_MDT_LOADER) ||
> -	    (core->use_tz && !qcom_scm_is_available()))
> +	    (core->use_tz && !qcom_pas_is_available()))
>  		return -EPROBE_DEFER;

If the platform uses a non-SCM TrustZone backend like OP-TEE,
qcom_pas_is_available() will return true, but the qcom_scm subsystem
might not be probed.

Will this lead to a null pointer dereference later in venus_boot() when
it calls the SCM-specific API?

venus_boot() {
    ...
	if (core->use_tz && res->cp_size) {
		ret =3D qcom_scm_mem_protect_video_var(res->cp_start,
						     res->cp_size,
						     res->cp_nonpixel_start,
						     res->cp_nonpixel_size);
	}
    ...
}

Looking at qcom_scm_mem_protect_video_var(), it executes
qcom_scm_call(__scm->dev, ...). If __scm is null because the SCM
subsystem is absent, this dereference might cause a panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518072856.2279=
0-1-sumit.garg@kernel.org?part=3D11
