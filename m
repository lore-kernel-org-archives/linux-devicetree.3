Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D52B3AD53F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359389; cv=none; b=WkOAljCtCSaN1UYjtxs7O1TvPBKyqGIY2p3ZUqOy6rhJCe2IVeUY7GNMt1/CZBOOv8/TlvAXYpjQ3YJX8wTfQ+/JL0Et54sn0eW5R/kU9DKRHUdL4RaqoRR7I+jMuNag0SMjnr56fCcWPUY232QhfSBpdpfhsq/KIHWTDasbExY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359389; c=relaxed/simple;
	bh=jUgUQVtSmVfvU+Qq5/toIwlKkmd7Zf8Eq+escC1Hv0c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tGIPHppdyisd3ebQC8Zcizfc5btEtqX2+SsLkI5NCsNWoUQj6LX77fxwmxowh0q9aSrthDQENgPD2cYxuc0p0OzyBFNEZPqtxyqXdhFchfjJss7gBF+7cUUA+SDcBXUoA6Ssao9DlGwAWx3DCVoqwYWymxrQmtBv9l8B+7ViEc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diH9EBZD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="diH9EBZD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B817D1F000E9;
	Mon,  6 Jul 2026 17:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783359387;
	bh=+KBqcx+aaRtJztTDREh2Aa+Ei+72ZQN+JtLdl9I0TLU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=diH9EBZDcTAG6U8zm60LGTjky4L+7u47MZzljgzzsduBWWmaVhFNXA35yB4qWGWaL
	 A+0z/D+pSap/XdKqPsCnt7cR322NSFmhdQoLiZzK3y6rdAPzp9jRjAQGt/x1CNmT9W
	 hTL+x7FxAkTFPTwdkbMaRg7Se+tqRpvWvUAHP8I6091iYttd/ZTNhIvqxuk67GUCGj
	 Hfs0ohk/MiwDrnn5hoJOeplenZEHdxH8HRnfNG5TgOfjNMrgen9euAQQ0q/hs996RZ
	 Y7V7F1i6O6Wdj1eLLIt/xEZsQefF76USVMIiK2vwmLjt1flTDkuxT8qIgDudPoNB71
	 lB5jv/IcFHz0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] firmware: qcom: scm: Add support for setting
 Bluetooth power modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260706-ipq5018-bluetooth-v4-3-350262a30959@outlook.com>
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com>
 <20260706-ipq5018-bluetooth-v4-3-350262a30959@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 17:36:27 +0000
Message-Id: <20260706173627.B817D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] TrustZone ABI Command ID collision between QCOM_SCM_PIL_PAS_BT_PWR=
_MODE and QCOM_SCM_PIL_PAS_GET_RSCTABLE.
--

commit 3517e2228bae4426b6fd48e30229414c0c97a8c2
Author: George Moussalem <george.moussalem@outlook.com>

firmware: qcom: scm: Add support for setting Bluetooth power modes

The Bluetooth subsystem (BTSS) on the IPQ5018 SoC supports setting power
modes which are required to be configured through a Secure Channel
Manager (SCM) call to TrustZone. However, not all Trusted Execution
Environment (QSEE) images support this call, so first check if the call
is available.

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

[Severity: High]
Does this command ID definition collide with the existing
QCOM_SCM_PIL_PAS_GET_RSCTABLE?

Because both are defined as 0x21, __qcom_scm_is_call_available() will return
true on any SoC supporting GET_RSCTABLE, falsely indicating that BT_PWR_MODE
is supported.

When qcom_scm_pas_set_bluetooth_power_mode() is called, it issues a Secure
Monitor Call with 2 arguments. However, TrustZone will route this to the
GET_RSCTABLE handler, which expects 5 arguments, including physical memory
addresses.

Since the trailing arguments in the descriptor are implicitly zero-initiali=
zed,
could this cause TrustZone to attempt reading or writing at physical address
0x0, leading to memory corruption or a fatal Secure World exception?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-ipq5018-bl=
uetooth-v4-0-350262a30959@outlook.com?part=3D3
