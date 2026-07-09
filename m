Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473F83ED3CC
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589477; cv=none; b=bDwNy8L4iLl/SsMdJfewzgULuhAYSyQR0W8XGytoZiJ549HcWRV4likxB6WTe+QCp24sJ9WfhHaCM0mnJpMri2I7ugJRhp23VBWdbtK5PktK1k3vl+jcklA5hC2QDyg56nTJ4HOZ/s31VExLZMYBVKIeKwzmuZuZ3zLk0RnJQew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589477; c=relaxed/simple;
	bh=imzdk8Qy/hbzupWF6s3QdnFI/uxqT4aJxACBOPnt/Ag=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dzQhfjKCMR0fhMLEmk9cs8UjiI9RskFyDwa9ur+irplaetidPQgyQHrcUABSQy1Sv8/6utQh+Yu2GaJO8KQHLsw9p2Q7I09X+pznziB/t8tscnw3ddaQRvnWvx2z86giptjPQJ+EVLdL4LgGK++R+ifCEB66rhEDk4l027svt5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OodNzOah; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OodNzOah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B4B1F00A3A;
	Thu,  9 Jul 2026 09:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783589476;
	bh=MAGHa5vZpXFQsoreOmIR8VNrIU47nw2gioBgxXT5HmU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OodNzOahtum6Et/3iI3pA0WcGwjEcRxtlqRIJSUz09k9IjHoIwiAX1KhVAVu0E3IP
	 ok4uqZoLQ6GkT/1MUKVB5jVn6XbcsPZ5V2Dyi2HAGgjeV2KJu+9VxY0IlCaMuwgsFo
	 /fwSt8IamfIwcwxi8WMtv7j3V5M2CJGUri+TDiQUP1e4bjIJlTgMHlygSjcYEsC9Ko
	 2CDD22lqkWpf5pxgeY/2GlOTKSs233BawWs27JS1Kxrjm5YOt2XMeQAWKyzPNHmLet
	 C2/sRPlc1sP4yN6IuAILM0dF5krrnScXH0WKVEBBqzTAEv6pkx87YTM3lYJ7xAWvhB
	 j2vIpZD3aUuaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: ipq5018: add node required for
 Bluetooth support
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-5-e476c41f03b8@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:31:15 +0000
Message-Id: <20260709093115.A9B4B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Out-of-bounds write in `memset_io` during firmware ELF loading.
- [High] Unvalidated hardware/firmware inputs from shared memory lead to di=
vision-by-zero panics and out-of-bounds accesses.
- [High] Direct pointer dereferences to I/O memory without using proper I/O=
 accessors, leading to potential alignment faults.
- [High] Incorrect teardown sequence in `btqcomipc_close` causing a race co=
ndition and unrecoverable bus faults.
--

--- Patch [5]: [PATCH v5 5/6] arm64: dts: qcom: ipq5018: add node required =
for Bluetooth support ---
commit 30194f675ebc660c7f509c3ca16e858f9db019e2
Author: George Moussalem <george.moussalem@outlook.com>
Subject: arm64: dts: qcom: ipq5018: add node required for Bluetooth support

This commit adds a device tree node to enable Bluetooth support on the
IPQ5018 platform. It sets up the bluetooth node with the appropriate
register space, firmware name, clocks, resets, and interrupts.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5018.dtsi
> index 6f8004a22a1ff..8c252fa3ff5bf 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -453,6 +453,22 @@ tcsr: syscon@1937000 {
>  			reg =3D <0x01937000 0x21000>;
>  		};
> =20
> +		bluetooth: bluetooth@7000000 {
> +			compatible =3D "qcom,ipq5018-bt";
> +			reg =3D <0x07000000 0x58000>;
> +
> +			firmware-name =3D "qca/bt_fw_patch.mbn";
> +
> +			clocks =3D <&gcc GCC_BTSS_LPO_CLK>;
> +			clock-names =3D "lpo";
> +			resets =3D <&gcc GCC_BTSS_BCR>;
> +
> +			qcom,ipc =3D <&apcs_glb 8 23>;
> +			interrupts =3D <GIC_SPI 162 IRQ_TYPE_EDGE_RISING>;
> +
> +			status =3D "disabled";
> +		};
> +
>  		sdhc_1: mmc@7804000 {
>  			compatible =3D "qcom,ipq5018-sdhci", "qcom,sdhci-msm-v5";
>  			reg =3D <0x7804000 0x1000>;

While reviewing the driver code associated with this hardware, a few questi=
ons
came up regarding the implementation in drivers/bluetooth/btqcomipc.c.

drivers/bluetooth/btqcomipc.c:btcomqipc_firmware_load() {
...
			if (phdr->p_memsz > phdr->p_filesz)
				memset_io(desc->base + phdr->p_vaddr +
					  phdr->p_filesz, 0,
					  phdr->p_memsz - phdr->p_filesz);
...
}

[Severity: High]
Can this lead to an out-of-bounds I/O memory write?

When the firmware ELF is parsed in btcomqipc_firmware_load(), it appears
we validate that phdr->p_filesz fits within the allocated IO memory, but
is there a similar check for phdr->p_memsz?

If a malformed firmware image provides an arbitrarily large p_memsz, could
this memset_io() write zeroes out-of-bounds past the end of the desc->base
mapping?


drivers/bluetooth/btqcomipc.c:btss_process_rx() {
...
		ridx =3D (ridx + 1) % rinfo->ring_buf_cnt;
		rinfo->ridx =3D ridx;
...
}

drivers/bluetooth/btqcomipc.c:btss_get_tx_rbuf() {
...
		idx =3D (rinfo->widx + 1) % (desc->tx_ctxt->smsg_buf_cnt);
...
}

[Severity: High]
Could these modulo operations cause a division-by-zero panic?

The firmware running on the Bluetooth controller populates the context_info
and ring_buffer_info structures in shared memory. If the firmware sets
rinfo->ring_buf_cnt or desc->tx_ctxt->smsg_buf_cnt to 0, could the kernel
crash here?

Additionally, are offsets like rinfo->rbuf checked against desc->mem_size
to prevent out-of-bounds I/O memory accesses?


drivers/bluetooth/btqcomipc.c:btss_process_rx() {
...
		msg_hdr =3D le16_to_cpu(rbuf->msg_hdr);
		msg_len =3D le16_to_cpu(rbuf->len);
...
}

drivers/bluetooth/btqcomipc.c:btss_send() {
...
	rbuf->msg_hdr =3D cpu_to_le16(hdr);
	rbuf->len =3D cpu_to_le16(len);
...
}

drivers/bluetooth/btqcomipc.c:btss_worker() {
...
		total_size =3D le16_to_cpu(desc->rx_ctxt->total_size);
...
}

[Severity: High]
Does this code perform direct pointer dereferences to I/O memory without
using proper I/O accessors?

The memory mapped via devm_platform_get_and_ioremap_resource() is Device
memory on ARM64. Since the driver drops the __iomem annotation and accesses
packed structures using direct C pointer assignments, could the compiler
emit unaligned load/store instructions?

Executing these instructions against ARM64 Device memory violates
architectural rules and could trigger an alignment fault.


drivers/bluetooth/btqcomipc.c:btqcomipc_close() {
...
	ret =3D qcom_scm_pas_shutdown(BTSS_PAS_ID);
	if (ret) {
		bt_dev_err(hdev, "Failed to stop firmware: %d", ret);
		return ret;
	}

	disable_irq(desc->irq);

	spin_lock_irqsave(&desc->lock, flags);
	WRITE_ONCE(desc->running, false);
...
}

[Severity: High]
Is the teardown sequence in btqcomipc_close() safe from race conditions?

The driver calls qcom_scm_pas_shutdown() to power down the Bluetooth
subsystem before disabling the interrupt, setting desc->running =3D false,
and flushing the workqueue.

If an interrupt fires during or immediately after shutdown, or if btss_work=
er
is already running concurrently, could the worker attempt to read from or
write to the BTSS memory-mapped I/O registers? Accessing a powered-off
peripheral's registers typically results in a fatal bus error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-ipq5018-bl=
uetooth-v5-0-e476c41f03b8@outlook.com?part=3D5
