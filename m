Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEBD37F8D7
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427017; cv=none; b=TKoejOVh6mFh2YllPQZPbYs738SIkfSqC/0mrCa9o17+bHW88PGjUC4UAfaJD2vlRX8YhKhpBzxGkQYUW7sYMMuA1slisJWtydO2cm+g1WHbSX/1hX3e5Mb1NakiAbDzavRQRl51CnueQpSBh45Id14cnIJKluO0ijh3fy/zmL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427017; c=relaxed/simple;
	bh=5Q2oew95xpekzlT96gqmmQRRrIVeHzGewIz4pN2Naz4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QQ9WpYk8MW1lM1Kz69kSP7TzROBohJLkP02nnDuUURCDSqst9PWQv7sRmMPAM+3fx6oLnjr3z75KvrY7y9CcUZ5HeVhDDryrGOW+Z091brSQmFsdWo0fhWHi9PDBZ6VMl7tghjljO8uHSh7ti9XWgpv9kf+BAbBe7mKtJVagwPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSvso3yT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSvso3yT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094E91F00A3A;
	Thu, 30 Jul 2026 15:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785427016;
	bh=xzhXjcnJ8xiFoB1IBmWGXfZFAQWjNC0eaGJyd0LnAiw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FSvso3yTGIil2te7p51qmCagbg+qDzBZhgT4kKV8Wz2qbqLalzQ0WNO3XNf27AaBH
	 f7GqDMSCDBufb0KhwCrxt8tQQ9fi6GWJsq8CdCxl4lU47xjObcptnYkMlDGHn2dhBm
	 BZPf5KiM/1p2qB+/8UPBvJyeG86TxTBo9453SuZYtzug1Q9I9AkAjQGSYicRfk7qWV
	 hhVDCuHQ6+/DxQRkLk5vwJqIJnAru5xTnUVzmJQOguRBetKAFh1Xrg20jpC8oQURjY
	 14clFaxLFnVSlb9XACVFUOE5upjd6zRh14RZWPJjwpm7tPhcxKrdFy6GNhLB4YVfdl
	 FtX/AH5D3tWNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 10/18] media: iris: skip PIPE if it is not supported
 by the platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-iris-ar50lt-v8-10-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-10-6597c08cea6f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 15:56:55 +0000
Message-Id: <20260730155656.094E91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Omitting the PIPE capability causes a division-by-zero kernel =
panic in `iris_vpu3x_vpu4x_calculate_frequency()`.
- [Medium] `iris_set_stage()` lacks the fallback check for unsupported capa=
bilities that was added to `iris_set_pipe()`.
--

--- Patch [10]: [PATCH v8 10/18] media: iris: skip PIPE if it is not suppor=
ted by the platform ---
commit 47a09938f9dc9bf17faca2d850a92320d738ffe8
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

media: iris: skip PIPE if it is not supported by the platform

AR50Lt doesn't support HFI_PROPERTY_PARAM_WORK_ROUTE. Tables for AR50LT
won't have corresponding entry in the capability tables. Let
iris_set_pipe() silently skip propgramming the property if there is no
corresponding capability.

> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/medi=
a/platform/qcom/iris/iris_ctrls.c
> index 10e33b8a73f60..33a34573391a4 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -534,6 +534,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platfo=
rm_inst_fw_cap_type cap_id)
>  	u32 work_route =3D inst->fw_caps[PIPE].value;
>  	u32 hfi_id =3D inst->fw_caps[cap_id].hfi_id;
> =20
> +	if (!hfi_id)
> +		return 0;
> +

[Severity: Critical]
This isn't a bug introduced by this patch, but by allowing platforms to
legitimately omit the PIPE capability, could this lead to a division by zero
panic in iris_vpu3x_vpu4x_calculate_frequency()?

When the PIPE capability is missing (like in inst_fw_cap_sm8550_enc),
inst->fw_caps[PIPE].value is initialized to 0. During clock scaling,
iris_vpu3x_vpu4x_calculate_frequency() in iris_vpu_common.c unconditionally
uses this value:

drivers/media/platform/qcom/iris/iris_vpu_common.c:iris_vpu3x_vpu4x_calcula=
te_frequency() {
    ...
    vpp_cycles =3D mult_frac(mbs_per_second, caps->mb_cycles_vpp,
                           (u32)inst->fw_caps[PIPE].value);
    ...
}

Will this trigger a kernel panic if a stream is started on a platform where
PIPE is intentionally absent?

[Severity: Medium]
This is also a pre-existing issue, but should iris_set_stage() in
iris_ctrls.c include the exact same hfi_id check?

In iris_common.c, iris_alloc_and_queue_input_int_bufs() calls both
iris_set_stage() and iris_set_pipe(). Since iris_set_stage() lacks this
check, if a platform omits the STAGE capability, it will call
session_set_property() with an hfi_id of 0:

drivers/media/platform/qcom/iris/iris_ctrls.c:iris_set_stage() {
    ...
    u32 hfi_id =3D inst->fw_caps[cap_id].hfi_id;

    return hfi_ops->session_set_property(inst, hfi_id, ...);
    ...
}

Would this pass an invalid property ID and potentially crash the firmware?

>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					     HFI_HOST_FLAGS_NONE,
>  					     iris_get_port_info(inst, cap_id),
>  					     HFI_PAYLOAD_U32,
>  					     &work_route, sizeof(u32));
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iris-ar50l=
t-v8-0-6597c08cea6f@oss.qualcomm.com?part=3D10
