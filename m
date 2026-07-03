Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7822343D75
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 05:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055596; cv=none; b=uq1312CB0y/S9hGm0vFc/ZYUjBkjyBxVSbeeNfmGiq2GlWfByLMeimMYuKd7KbC5SZfLQp8ueftDgf9TGmpuGJbl4XwelxYXWqjDvofhHbaZhbnGwuryomLHFApRGGXhaXOmCdQY3hm1pPNEhCwODsv+4Hejq6pauOT4YZwz27g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055596; c=relaxed/simple;
	bh=YpFunbjV7PfVz8Sjpp5aJQVPbfHR8VkpiCmktcMl7Lk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KT4q3zfmRxm24uBWMs5eOQMkJu6XT9byqmrnddvlLMM9jld5d/h3RHXh8gxrxvzRGPL1d/8AnwaSjU5nb1sahF50ij5Wl5i7l8dJayRzPyzmHEHXNtBLsB0Q9RvJUci9cY8Qwzt8790njJ8hRKRJap1S7+kFoNK4KMHBQAMJkww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JdIduJzl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JdIduJzl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB3E1F00A3A;
	Fri,  3 Jul 2026 05:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783055584;
	bh=aL7rmoFGVRNoQgQ+mtuauFF58DYvAVjR+oWP/ixKLV8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JdIduJzljao61mlwzMy0gxXyizzcgYarEht4yfoqlW3SpVAHL8SYcAOfNoiwFMsZ6
	 8JGknsall32uEpn/x9mCM7rOSGYcj27PEW3vH45gbG96P/oj5BGrOVVn90cHWNWRsE
	 U84AUa2tsmAzlmxlK5zPV/DFui92oJu2XRi96niDALrPmQ+uajbfBqEZrHHku90qzb
	 CAoQQN3yCvDaMLnEAJEabmXN1evS4J5TTVHHVlZzTAP/H9UYOH4W94XLl1owd9AC7M
	 lXy/+2/vW8JguL+gdP40hiSxgEKF2wRoFmOFA64/7YV3ZFqoZXO0GAaZAUckx+gzl4
	 z7Pc1RwEO17Lg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] firmware: qcom: scm: Add support for setting
 Bluetooth power modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260703-ipq5018-bluetooth-v3-3-62da72818ab3@outlook.com>
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com>
 <20260703-ipq5018-bluetooth-v3-3-62da72818ab3@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 05:13:03 +0000
Message-Id: <20260703051304.2AB3E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Command ID collision in TrustZone SMC calls causing potential =
physical memory corruption
--

commit 26b3bd594fb013254f8ba044e310cbb49348c961
Author: George Moussalem <george.moussalem@outlook.com>

firmware: qcom: scm: Add support for setting Bluetooth power modes

This commit adds support for configuring the Bluetooth subsystem power modes
on IPQ5018 through a new Secure Channel Manager call. It includes an
availability check to ensure the call is supported by the QSEE image.

> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qco=
m_scm.h
> index caab80a73e17f..5579df5a2aca7 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev=
);
>  #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
>  #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
>  #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
> +#define QCOM_SCM_PIL_PAS_BT_PWR_MODE	0x21
>  #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21

[Severity: Critical]
Does this new macro collide with the existing QCOM_SCM_PIL_PAS_GET_RSCTABLE
command? Both are defined as 0x21 within the QCOM_SCM_SVC_PIL service.

Because GET_RSCTABLE is widely supported on Qualcomm platforms, the
availability check in qcom_scm_pas_set_bluetooth_power_mode() will pass
even if the firmware does not actually support the new Bluetooth power mode
command:

drivers/firmware/qcom/qcom_scm.c:qcom_scm_pas_set_bluetooth_power_mode() {
    ...
    if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
                                      QCOM_SCM_PIL_PAS_BT_PWR_MODE))
        return -EOPNOTSUPP;
    ...
}

When the SMC call is subsequently issued with only 2 arguments, TrustZone's
GET_RSCTABLE handler will receive the call but expect 5 arguments. Could
this cause TrustZone to treat the uninitialized remaining arguments as
physical addresses, resulting in an attempt to write the resource table to
physical address 0x0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-ipq5018-bl=
uetooth-v3-0-62da72818ab3@outlook.com?part=3D3
