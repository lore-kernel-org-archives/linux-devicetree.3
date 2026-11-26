Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676424;
	b=lObSVQrRmgB2JbDxD/A8l3dVbf2G1EAS3qdJFzF/srAg3v92+G/hIQ4CI6+a2HEbEJ7c
	 FRyPL2h8C8DmW1jxuL+0biRaw1/kJxFLxlACKVfq+r4M/LDtBICOwJzARVTTGXSQCXGuP
	 Y/GcIXz6Gd5MecVAUsGa62OBRiBqA8oW6jAi7vVYWg0OfTyqtsGj/aTOi05wXFtVsqjfz
	 kr/LdbtP6qegsfIl1J48A/F0DZ+Bgul+vapbyeT+jLgmrtOmj8DKcHCAO/ORC+ob4k2ea
	 TVEp6DHmL9Zg6d4CBqdHEXpHkDKnagBIuONdpOZ2GaxG8J5wLSdwSfUdmHFk4IbVi0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676424;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aOMyHm2VcrY58y24nyjkSE+jrlaAv8Czg9Ypt5rU/w4=;
	b=eo9TYMYkwFIGtw97tT3DCLPWBJT+ImKz0gJKc/BRunB/gh0lisxPIQ9mpCaZbtzmpBRI
	 oQRzBrxEd8AEeUuy4HuqmLNBefkVvLYQhSj1T314dAl0zeo8yRDD8dBzl+6rzcdi4QNG8
	 9AV72SdnA3/u/92jQO1dR5OG9orwJ27/VOP6EiTWbnccsIzPTRz6EfQNZ/ddPFPsz6MUv
	 aFBpXTYSZ/1t1DJ80cRFFv7vLmdR73c5i34cTqemk1q1w9Coj5gMU8p9evmNXLCDJip8P
	 /ygc+PQqWtN2iJbYoHq3UZ7PtjMhk0jpjOsxiXuo8X8g9c7HSF16lMyJueLNJJU5PhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dazH4LS5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9AF606A32E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dazH4LS5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4641F000C4;
	Thu, 26 Nov 2026 07:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795676424;
	bh=aOMyHm2VcrY58y24nyjkSE+jrlaAv8Czg9Ypt5rU/w4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dazH4LS5K6+Ij7HLnK4bvtmxuKf57+8TNRGKk/FpDnGMrvEKc5oEtTvoWzK18VxCO
	 QEsl24iJwoSSuEXhhgAAxzfrS+MijkHqpkC+K8I7F/zYsapX+CSZGHe56dGbKJHbkA
	 3U0Be2KY64n7xliO8VNRfY0ghLcgsjJKiaL8axwXhgKta8sGVczme70K5c3cOpRRrI
	 Ytn3ojcNl63+GK+6AI7jlKHMQ8qnfDUVoQtC6UgJiMJTM6PXHJR39bhb6ggAkOxOMn
	 TeesfWw8zDfF8d3YqZOSH3IvA5MXHs+HEIDwMNKX4GxFlLHClhOlySIBMCaZH2xdov
	 JjASHeUWa5xKQ==
Message-ID: <sashiko-outbox-234922@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 20/21] drm/msm: Register the DCP backend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jayant Shekhar" <jayant.shekhar@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-20-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
 <20261126-jshekhar-v3-dcp-v3-20-f1e9d7505039@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 07:00:23 +0000
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
- [High] drm/msm: misordered msm_dcp_register() and msm_dcp_unregister()
  calls
- [High] drm/msm: missing separate_gpu_kms handling for DCP backend
--

commit d33ea5c6d1ac47f420d984821e7b424994f35faf
Author: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>

drm/msm: Register the DCP backend

This commit registers and unregisters the DCP display backend in the MSM
DRM module init and exit paths.

> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index bb383bb0fe8eb..af95237ac8728 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1209,6 +1209,7 @@ static int __init msm_drm_register(void)
>  	DBG("init");
>  	msm_mdp_register();
>  	msm_dpu_register();
> +	msm_dcp_register();
>  	msm_dsi_register();
>  	msm_hdmi_register();
>  	msm_dp_register();

[Severity: High]
Can the DCP component master ever bind when msm_separate_gpu_kms_components=
()
returns true on a system with an Adreno GPU in Device Tree?

In msm_dcp_register() -> dcp_virtio_register() -> dcp_virtio_probe() ->
dcp_component_register(), msm_add_gpu_components() is called unconditionall=
y:

drivers/gpu/drm/msm/dcp/dcp_drv.c:dcp_component_register() {
    ...
	ret =3D msm_add_gpu_components(dev, &match);
	if (ret)
		dev_err(dev, "failed to add GPU components: %d\n", ret);

	ret =3D component_master_add_with_match(dev, &msm_drm_ops, match);
    ...
}

Unlike msm_drv_probe(), this does not check !msm_separate_gpu_kms_component=
s().
When msm_separate_gpu_kms_components() is true, adreno_probe() calls
msm_gpu_probe() instead of component_add(), so dcp_component_register()
waits indefinitely for a GPU component that is never registered.

In addition, msm_separate_gpu_kms_auto() only counts MDSS and MDP4 via
msm_count_mdss() + msm_count_mdp4(), omitting DCP display subsystems when
deciding whether to split GPU and KMS devices automatically.

> @@ -1230,6 +1231,7 @@ static void __exit msm_drm_unregister(void)
>  	msm_dsi_unregister();
>  	msm_mdp_unregister();
>  	msm_dpu_unregister();
> +	msm_dcp_unregister();
>  }
> =20
>  module_init(msm_drm_register);

[Severity: High]
Does placing msm_dcp_unregister() at the end of msm_drm_unregister() tear
down bound DSI and Adreno GPU components before the DCP component master is
removed?

MDP5 and DPU are children of msm_mdss, so msm_mdss_unregister() at the
start of msm_drm_unregister() depopulates them and runs component_master_de=
l()
before msm_dsi_unregister() and adreno_unregister() run.  DCP is not a child
of msm_mdss; its component master (dcp_subsystem_dev) is registered and
removed directly via msm_dcp_register() and msm_dcp_unregister().

To match top-level display subsystem drivers like msm_mdss and msm_mdp4,
msm_dcp_register() should run at the end of msm_drm_register() after
component drivers are registered, and msm_dcp_unregister() should run at
the start of msm_drm_unregister() before those components are unregistered.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-jshekhar-v=
3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com?part=3D20
