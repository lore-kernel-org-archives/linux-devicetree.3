Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453500;
	b=k6V43A96AreNI5LemE/iCSU8nIF/b04J9g/r8d+fZmdBd3hXYKLZ7XT71uPfjt/TcIw3
	 rgimlotNHti7jNKVIiIXuI7hQxXZVSkfv6mO6aB4sd8sCNwo065u9YRHN0ryh4/07IVOH
	 //wDXlES5RVJYq87xqpfPbB697Hultem1OILnYXtGRRFUhgdCR6UKp0doKs3KZitc+kkI
	 l9QhOjPdtU5qPsKLBkgYlS1EX9AmFTk4YLI6axcrMG0iO+a5qh2SYXShzdgxuAg9O9ivl
	 DVk2Jpn5HGwJJKVOwOMKwzp2Qj7fEQuOKvXkJX5rs8cn+T6WNKZNNniybjsdeH0BFZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453500;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KXSvGnje9GxqxgAxkj3i+QaxqOI6Yldars6JJNqnpvo=;
	b=i3br/4yP+ZKcDY/xn2DjytD7sYzHxgX24C1XkJWfe114gbW39u428JYDlxKHwTuE585P
	 ZBAHFQeS2gXq3gYMmiGg9ZqhDOE3ldUAMvh9zfSVG8k/pjD2vFK3KVN3cgHi82W6VtAQA
	 VFwzt6FEqRsRybFKottY7sxmlt9zFHQ1OqE3AXRjpyhR90sM8dHGVfV8pQkQ2+5DIJEr+
	 +9UGT2bxaFVTMco/epiW6ld/w/HqC+1qI53T+KrcQ4qa7c3RYtf7fz6I2O6D6ltDMOmay
	 LKryAogvLGQHyKkzjq9PxMUNOZBh4RzMwn19P208RcEWLqaH7DPTy2RDltvl2q4mxoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Q8Pc/A34";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C197E606A31D
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q8Pc/A34
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE54A1F000C1;
	Sat, 31 Oct 2026 13:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793453499;
	bh=KXSvGnje9GxqxgAxkj3i+QaxqOI6Yldars6JJNqnpvo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q8Pc/A341aYgAH2FVwvW+MeNxBK6nfxBGKosX2i8KcFJb5pv/rs7pB/wWHvHg+Yym
	 2IJMGzr0US3mKwZuHsbQZ74zQC4ncNs/QCzvqdlbkcsm8+UJl//5TGX2qKES9c8ZhX
	 UbrlGAX6SqIsB6EO5sIqaamhKCEQRVW9RIgQv6TMhMlpNJB/VxxW83rG77aRnXErFo
	 X3y5bmoSQpxPpvcuieHdxpQGRuvDI5F3oQPUKO+gSqBaViAO6nRsKOWMu/m2Ies3t3
	 qa4iupO/WkGQkSoFxTluoPzJNrrcniRsfHpwed8+2RmsssfpuG1tKO9ZuUgwyYIM1P
	 lw6ibublao+Rg==
Message-ID: <sashiko-outbox-191976@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: Add device tree for Lemans
 GearVM variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261031131042.1200862-5-shengchao.guo@oss.qualcomm.com>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
 <20261031131042.1200862-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 13:31:38 +0000
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
- [Low] arm64: dts: qcom: duplicate reserved-memory nodes in lemans-gearvm.=
dtsi
--

commit 2d9e6864e7af49f91d36dd5dcddab2e975bc9d47
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Lemans GearVM variant

This commit adds lemans-gearvm.dtsi for the Lemans GearVM variant (SA8255P),
which manages platform resources such as clocks, interconnects, and most TL=
MM
settings via SCMI over a Qualcomm SMC/HVC transport. It also labels the
firmware, scm, and reserved-memory nodes in lemans.dtsi so they can be
overridden by label in lemans-gearvm.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boo=
t/dts/qcom/lemans-gearvm.dtsi
> new file mode 100644
> index 0000000000000..91c97a55f2787
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> @@ -0,0 +1,3224 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "lemans.dtsi"

[ ... ]

> +&reserved_memory {

[ ... ]

> +	firmware_mem: firmware-region@b0000000 {
> +		reg =3D <0x0 0xb0000000 0x0 0x800000>;
> +		no-map;
> +	};

[ ... ]

> +	firmware_logs_mem: firmware-logs@d0040000 {
> +		reg =3D <0x0 0xd0040000 0x0 0x10000>;
> +		no-map;
> +	};
> +
> +	firmware_audio_mem: firmware-audio@d0050000 {
> +		reg =3D <0x0 0xd0050000 0x0 0x4000>;
> +		no-map;
> +	};
> +
> +	firmware_camera_mem: firmware-camera@d0054000 {
> +		no-map;
> +		reg =3D <0x0 0xd0054000 0x0 0x2000>;
> +	};
> +
> +	firmware_reserved_mem: firmware-reserved@d0056000 {
> +		reg =3D <0x0 0xd0056000 0x0 0x9a000>;
> +		no-map;
> +	};
> +
> +	firmware_quantum_test_mem: firmware-quantum-test@d00f0000 {
> +		reg =3D <0x0 0xd00f0000 0x0 0x10000>;
> +		no-map;
> +	};
> +
> +	tags_mem: tags@d0100000 {
> +		reg =3D <0x0 0xd0100000 0x0 0x1200000>;
> +		no-map;
> +	};
> +
> +	qtee_mem: qtee@d1300000 {
> +		reg =3D <0x0 0xd1300000 0x0 0x500000>;
> +		no-map;
> +	};
> +
> +	deepsleep_backup_mem: deepsleep-backup@d1800000 {
> +		reg =3D <0x0 0xd1800000 0x0 0x100000>;
> +		no-map;
> +	};
> +
> +	trusted_apps_mem: trusted-apps@d1900000 {
> +		reg =3D <0x0 0xd1900000 0x0 0x3800000>;
> +		no-map;
> +	};
> +
> +	tz_stat_mem: tz-stat@db100000 {
> +		reg =3D <0x0 0xdb100000 0x0 0x100000>;
> +		no-map;
> +	};
> +
> +	cpucp_fw_mem: cpucp-fw@db200000 {
> +		reg =3D <0x0 0xdb200000 0x0 0x100000>;
> +		no-map;
> +	};

[Severity: Low]
This isn't a bug, but since lemans-gearvm.dtsi includes lemans.dtsi and
overrides &reserved_memory by label, nine child nodes that are neither dele=
ted
nor modified in &reserved_memory are redefined here with the exact same
unit-addresses, labels, reg ranges, and no-map properties as in lemans.dtsi:

  firmware_mem (firmware-region@b0000000)
  firmware_logs_mem (firmware-logs@d0040000)
  firmware_audio_mem (firmware-audio@d0050000)
  firmware_quantum_test_mem (firmware-quantum-test@d00f0000)
  tags_mem (tags@d0100000)
  qtee_mem (qtee@d1300000)
  deepsleep_backup_mem (deepsleep-backup@d1800000)
  tz_stat_mem (tz-stat@db100000)
  cpucp_fw_mem (cpucp-fw@db200000)

Could these unchanged child nodes be omitted from &reserved_memory in
lemans-gearvm.dtsi so they are inherited from lemans.dtsi like the other
unchanged reserved-memory regions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031131042.1200=
862-1-shengchao.guo@oss.qualcomm.com?part=3D4
