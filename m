Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887EF3246EB
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 07:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851012; cv=none; b=ZHLBe6SCXtD6vLIHGW5Rt5VzfOXVgbOAPXjNwH8543EBRq0QCjhNL0Apuri/365k/ce+GyVkETc9hyeUOeMcui08mvRBPYBR5Bhhc5hc8M241cPS0hfFZKroJSha83IZxPz5z5+KxUapJr9sqTqAxlY6y1fyMs/oIZb8VX9V98k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851012; c=relaxed/simple;
	bh=YDnXzWdSADEyWmZMlHW4CzhF+mLcfT9q6uGYCwtIulI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aZlV6OKNSuUn8lRGGpU1WM4u60KEuAGUUEjKj7UeZT5K+jMscOOZNUhNb5L/mlSrz/GbRe4EhGiUcKB6nEHiLNXytTVaQ/e1nzN9M1HRRwombwuRs+gry1Yj91iCDcWCu3LNknX17RDavblIMzoVu26RqgXdwdYloKiEY9tIiI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkzRUfNS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkzRUfNS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2189A1F00A3A;
	Tue,  8 Sep 2026 07:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788851011;
	bh=qbKBt9NEwsK7J3EtXRd8ktbdKgGC7WkxjDASWd3hmpk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LkzRUfNS4znzHvF1dQmkD7/6K9GwqgQhMkRD5Cd+MqZA500NzFMFGX1323TJ7O/6v
	 ulQQzrYh8v+N0jUPhWdJU9pT5WwItQYvSZnuGFkp4NPuslMBncABvSDENPqvCAgPhI
	 W2GFwuKOS7Onn51TZrkh+R6Gc99SbIXdlpdMEtuVGYdUR5v3cHNd8/VKyyPO2QppsJ
	 9hoEVTCOH34AAfiNxo5boEPPDjlylH8FRi0Y1ohvdysRf6xffjwNoxyCSugWvKn/ee
	 +olXxLKhKKt1WkMVAlrY10tjfFXuoWdbmoqfap8eI5XM39CIOidNZ1Xy6lgCD1eLz6
	 B78mli6E050qQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: agatti: Add memory-region for
 audio PD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinayak Katoch" <vinayak.katoch@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260908-agatti-audio-v4-1-b3db91d3fdec@oss.qualcomm.com>
References: <20260908-agatti-audio-v4-1-b3db91d3fdec@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 07:03:30 +0000
Message-Id: <20260908070331.2189A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The fastrpc driver assigns CMA memory to the DSP via qcom_scm_=
assign_mem() but never restores HLOS permissions before freeing it back to =
the kernel, leading to a fatal XPU memory protection fault.
--

commit ec8640fac73b78cbfdda01ddc330dda934f6259f
Author: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

arm64: dts: qcom: agatti: Add memory-region for audio PD

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/q=
com/agatti.dtsi
> index e7fed60a59d93..8d557010d3c0d 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
[ ... ]
> @@ -2346,6 +2354,9 @@ fastrpc {
>  					compatible =3D "qcom,fastrpc";
>  					qcom,glink-channels =3D "fastrpcglink-apps-dsp";
>  					label =3D "adsp";
> +					memory-region =3D <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids =3D <QCOM_SCM_VMID_LPASS
> +						      QCOM_SCM_VMID_ADSP_HEAP>;

[Severity: Critical]
This is a pre-existing issue, but does adding this configuration activate
buggy TrustZone memory assignment code paths in fastrpc on this platform?

The fastrpc driver assigns CMA memory to the DSP via qcom_scm_assign_mem()
but never restores HLOS permissions before freeing it back to the kernel,
which leads to a fatal XPU memory protection fault.

For example, when freeing user-mapped remote heap memory in
drivers/misc/fastrpc.c:fastrpc_req_munmap_impl():

	fastrpc_buf_free(buf);

Or when freeing the static process remote heap in
drivers/misc/fastrpc.c:fastrpc_rpmsg_remove():

	if (cctx->remote_heap)
		fastrpc_buf_free(cctx->remote_heap);

In both cases, the physical pages are returned to the generic CMA pool
without restoring HLOS permissions. Any subsequent kernel allocation from
this CMA pool will cause an immediate kernel panic (XPU violation).

Since a local userspace application can allocate remote heap memory via
FASTRPC_IOCTL_MMAP and then free it via FASTRPC_IOCTL_MUNMAP, could this
be trivially triggered as a local Denial of Service (DoS)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-agatti-aud=
io-v4-1-b3db91d3fdec@oss.qualcomm.com?part=3D1
