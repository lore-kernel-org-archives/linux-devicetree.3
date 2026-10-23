Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741862;
	b=HKfC9agG34hzUv49hhFJcVhQNFI5htTz9a46CqcvumMh00A4/IfhsxyINg+1grmPspFU
	 xD3jxtMQ5XG7hxF83MlMB6T98SYS1KpuG3t+Jwk5WBk18uY4eTcA+qCajj4L5H/hRROjT
	 0K/2gz93+37Rl7eYAD2ykRTCyBCjr8OWB8qFA3PL7x++J68q8LJvcWBOnuZ0KikSe2pbW
	 rjm+uI/xwSdqy4kZaB6SB+g9bl3HHlDwWUoLyBOPoFdGLK5KHXeTy0KQhxHvuIvfd/4hU
	 CH/eCO1kaE+j7bdxTrK8WNZ6sU8az6zdqSwk9HVrUCxqECyjWY1GXh4MMGITurfVzxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741862;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mibySmlXEPWTc5EM703PPeSakYAc/2HraKR0WHF6ldk=;
	b=5rJ1gOHZaU5H6Fbv/4SKBvJYV8mALrZik9qHb3C1sa6G5198WI14Rs9kBlBXcLocpXix
	 tgEC6ixb6c5JGFM1pZJJ3NYdSsunWY5EAGbmKOTJGY7DK5oX+f6XCpcBo/IkQMALiJDi8
	 WmXSQZlZYVPZYll/xlefTLT8y02OguPzTRz/vMr9F0RdAirOUNDOvrwrzUGafKV47UWYq
	 ANFADMEJrbsl5rHHTsuDZjsCD99+brRlqnCRKGyI645su5kG8hL8/riE/s3V8wExnnmu3
	 Al2U8a/W0SfTaUs7y3O5VmRRlWMVrnt/knwKWpwDc+x1cAbtAzY7idCp9VPwlI8188w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rvem5Yxx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD6A606A31F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rvem5Yxx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640341F01829;
	Fri, 23 Oct 2026 07:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792741861;
	bh=mibySmlXEPWTc5EM703PPeSakYAc/2HraKR0WHF6ldk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rvem5YxxPeTEz6R0tA69+HrM7+jXfoqKZQUMx5Y18cj7ZoM2tBayvyg5K9ivxHzif
	 2WU23grL2C0+I8hQnPQ2hCWRQODGxkvxxDzClT1JRSDofPDD3/6Ma3NpnTd5yb4Z0B
	 b0/xBK//QZbfiec8LpJsAD+olp3U6Hi6fSxYUwQmUp7w2xqAgX6BxjG//DDwC189Bp
	 qmAUI8DnaV7+kOUA9Epq3/5dqDTsh2F2DwWMNxYDXqF+v9vdfpIW1PTFsHuPHohjcS
	 hHwE2sPnVZ6ymTR1O62hD3ZpwNrysP+sqBUu7DlIpNbW1YBz/jV1hInDbPJvS1n2zr
	 x/SGxjfUEyNtQ==
Message-ID: <sashiko-outbox-182442@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm8250-hdk: Add FSA4480 USB-C
 protocol chip
Reply-To: sashiko-reviews@lists.linux.dev
To: "ShiTou Hong" <redstone.dcity@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023072832.2642647-3-dc_redstone@outlook.com>
References: <20261023072832.2642647-1-dc_redstone@outlook.com>
 <20261023072832.2642647-3-dc_redstone@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 07:51:01 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: qcom: missing co-author sign-off and mismatched author =
email
--

commit 1a1ede276cc0d97ceb67bad5a51673b00f7ce0c3
Author: ShiTou Hong <redstone.dcity@gmail.com>

arm64: dts: qcom: sm8250-hdk: Add FSA4480 USB-C protocol chip

This commit adds the FSA4480 USB-C switch node and configures the PM8150B
type-c module, USB OTG role switch, and DisplayPort altmode in
arch/arm64/boot/dts/qcom/sm8250-hdk.dts.

>     arm64: dts: qcom: sm8250-hdk: Add FSA4480 USB-C protocol chip
>
>     The sm8250-hdk has a USB-C port supporting OTG and DP altmode.
>     This is implemented with the FSA4480 chip,
>     which hasn't been added in the dts file.
>
>     Change the USB controller mode to OTG.
>     Enable the i2c controller for the chip and the dp controller.
>     Configure the PM8150b type-c module and vbus regulator.
>
>     Co-developed-by: KancyJoe <kancy2333@outlook.com>
>     Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>

[Severity: Low]
As documented in Documentation/process/submitting-patches.rst:

    Co-developed-by: denotes authorship, every Co-developed-by: must be imm=
ediately
    followed by a Signed-off-by: of the associated co-author.

Should the Co-developed-by tag for KancyJoe <kancy2333@outlook.com> be
immediately followed by a matching Signed-off-by tag from KancyJoe?

Also, the commit Author header uses redstone.dcity@gmail.com while the
Signed-off-by line uses dc_redstone@outlook.com. Should these two email
addresses match?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023072832.2642=
647-1-dc_redstone@outlook.com?part=3D3
