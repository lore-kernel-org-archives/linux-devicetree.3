Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990305;
	b=oUTdmSk3ifgZSLyKXpW5GJwRyg/2qbHOWBRemW5XkYU3tlXOeD6SsaZ+I2OeD6Gf21/y
	 ZbzDVAuoPmWWILwmw4l8pd6/1LM4LgL49/mukcUV/s7LGx7sgX5wVKw65FwsS9pbviVsy
	 I2+QQTGq27r7M6y0MTT+aM+Q1LVCj2IKqaMzvxxUadUUV89Z/uBLgDUhhiJtRFk73bjaI
	 foSkKayPI0Ws/tcctldqxDFjr6G6VKaiwKTR/vJgdCz6nAtAtRk7VIlo1ona3yIk9HEq5
	 NLd1S7gGH6FpryLFku9oM9zDZyK9EoGBAPtFYpd3g/WnzpLtOXyFS7BP2YMDpnY/+iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990305;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1bMN+CY6S4aBdokjPDOGEH0UePsHivYO8WuNYflhkCA=;
	b=Jm+KYe786e4/OFtzR+a35Zk8HDSQAICy9QVk6yaSOgB8+VSg7zblDwGjhG9XR6C8iY8g
	 SK+g4bIruAIrvH2Nxv3kkxtJE7uH7NGCE1oC5+aV069SRI1NOjoxtS5/ABF9v0VEwnnKX
	 dfw+WHx7MMzVMHoQI6tg0BSu5pzwYwIe+hWM/ov+M3Z4OSwi1icKXwhcJOL3YaaeumV2I
	 MTlZwAryUx1KFDeH8oW4AQS0/vmmXh7Ysu3S3gA7VAxAwGICSM594DzLaLMjJSZwzVP+/
	 TJhkPUw1XhrhRvLuje5Rb7DaO4bLm4ibp4fVsIZq8fAZMA4QWaa3Zb+oztFObl3KnMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=omycNkeW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544C0606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=omycNkeW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C49D1F000C4;
	Wed, 18 Nov 2026 08:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990304;
	bh=1bMN+CY6S4aBdokjPDOGEH0UePsHivYO8WuNYflhkCA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=omycNkeWQeaxqUBPTi6BJMCMCrsU4za2IuhlWjqGQ/mKjMuTAkupT3WkJLjC6rYvi
	 khXrCop0xTV/Gve/7rzFVA4f5OPDfJRAxEKJts4EZKHiKX4BwiXz4/g2dXUpRwG4s+
	 UDZhmDaYchJxLrdGBAEasElkpxIu+bYc6cg+W00rUuDu9M7YekcK5ncJ5LD6xxpiWm
	 gW1CxLGOT6Pn5rgeGy28Z3JxiG0uv7DgRbskcyC83rWS8jE2i3Ry95ovAZTzJxoHna
	 ELluHlPvE5RBstPLALhxEDzqFsEXxrdIZYvWs6/INU3YKkok37Ra2wJDKdFhea2BSC
	 xCrDgfweveXiQ==
Message-ID: <sashiko-outbox-220438@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 8/8] arm64: dts: qcom: lemans: add interrupts to
 CTCU device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jie Gan" <jie.gan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-8-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
 <20261118-enable-byte-cntr-for-ctcu-v23-8-67fd9db6bc0e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:25:04 +0000
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
- [Medium] coresight: ctcu: premature read_lock release in
  tmc_byte_cntr_get_data()
- [Medium] coresight: tmc: negative error codes swallowed as EOF in
  tmc_read()
--

commit edad46341b45ed2bbca9daa024c7d236792c6c79
Author: Jie Gan <jie.gan@oss.qualcomm.com>

arm64: dts: qcom: lemans: add interrupts to CTCU device

This commit adds the byte-cntr interrupt lines to the CTCU device node on
Qualcomm Lemans (SA8775P) to enable TMC ETR byte-cntr trace reading.

> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 1fdb72fa55184..852a1142100fa 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -3132,6 +3132,9 @@ ctcu@4001000 {
>  			clocks =3D <&aoss_qmp>;
>  			clock-names =3D "apb";
> =20
> +			interrupts =3D <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
> +
>  			in-ports {
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;

[Severity: Medium]
In commit "coresight: ctcu: enable byte-cntr for TMC ETR devices" that this
DT change enables, does tmc_byte_cntr_get_data() release
byte_cntr_data->read_lock too early before tmc_read() finishes copying from
byte_cntr_data->buf_node and updating its position?

Because /dev/tmc_etr* is a misc character device opened with
nonseekable_open(), concurrent read() calls on the same open file
descriptor are not serialized by file->f_pos_lock.  tmc_byte_cntr_get_data()
scopes read_guard to itself, so copy_to_user() and
tmc_etr_update_buf_node_pos() in tmc_read() run after read_lock is dropped:

CPU0                                    CPU1
tmc_read()
  tmc_get_sysfs_trace()
    tmc_byte_cntr_get_data()
      lock(&byte_cntr_data->read_lock)
      pos =3D buf_node->pos
      tmc_etr_read_sysfs_buf(...)
      unlock(&byte_cntr_data->read_lock)
  copy_to_user(data, bufp, actual)
                                        tmc_read()
                                          tmc_get_sysfs_trace()
                                            tmc_byte_cntr_get_data()
                                              ...
                                              actual =3D=3D 0:
                                              buf_node->reading =3D false
                                              buf_node =3D NULL
                                              goto wait_buffer
                                              tmc_etr_switch_buf_node()
                                                <-- restarts ETR DMA into
                                                    bufp while CPU0 copies
  tmc_etr_update_buf_node_pos()
    nd->pos +=3D size  <-- advances newly switched buf_node->pos

While CPU0 sleeps in copy_to_user(), CPU1 can read from the unadvanced
buf_node->pos, drain the buffer, clear buf_node->reading, and call
tmc_etr_switch_buf_node(), handing the buffer back to the ETR hardware for
active DMA while CPU0 is still copying from it and leaving CPU0 to add its
read size to the newly switched buffer's nd->pos.

[Severity: Medium]
Also in commit "coresight: ctcu: enable byte-cntr for TMC ETR devices",
does tmc_read() turn negative error codes from tmc_byte_cntr_get_data()
into EOF?

drivers/hwtracing/coresight/coresight-tmc-core.c:tmc_read() {
	...
	actual =3D tmc_get_sysfs_trace(drvdata, *ppos, len, &bufp);
	if (actual <=3D 0)
		return 0;

tmc_etr_get_sysfs_trace() propagates negative errors from
byte_cntr_ops->get_trace_data(), such as -ERESTARTSYS when
wait_event_interruptible_timeout() is interrupted by a signal, -EINTR,
-ENOMEM, or -ENODEV.  Because tmc_read() returns 0 whenever actual <=3D 0,
a signal or failure during a byte-cntr read reports EOF and terminates trace
collection early instead of restarting the syscall or returning the error to
userspace.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-enable-byt=
e-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com?part=3D8
