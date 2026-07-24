Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B027B368D67
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784878054; cv=none; b=jDq3OvGvjg4EcBEbRGK7nmKUmfuivz6q4E100frkqWifYvrejbdO00GiYBkcrfaJNepef45MADufaMz71Y8JVZk1AtsH6FFEl8nZJqoyDFPDlxlfSr+S3pIf2TXZWvb03F4X19IlxJpvsXKqsbqihYo+vKM3vEVhSqyv5EQykv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784878054; c=relaxed/simple;
	bh=yE7Z00LREi1JzyOoL3dT4850P3Ul5WjyXhKsU0KXxWE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ERXTuXf+BKJ2LuOij+1Uk/TvyIuQldKHSCML77PURdjATsRo29tE75+hNDhqiQ84XxERDswhEycV+cQjxpLLXQRAnYwXEGcTaTzJJaigTEIcS8SYg8+jILPlhWaBO6gEvkLfGy8Cxpf+f5k8jC5UJlfAoYlH7VGDF6e8jWaEo+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GqYt2Hie; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqYt2Hie"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFB11F000E9;
	Fri, 24 Jul 2026 07:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784878052;
	bh=fvYiBP16f9McBp48AODjYl2PUxKeRqYD6TT8zM2UupE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GqYt2HieJd708dF21ONcFjGkbBSe1z2Lcx/G7JEAytpMAGkiRf7xGLa1coL2FDeXr
	 O+g0AcSNGZXwu2k3m0KJrWHpyJE1S6sHG0BOjT35IURmUt8HJinUwu0s8Ry5E1eEEb
	 vMAArRIbwnrIt0zBnBCT8i4WNoeDz67eNZHB6WL8cm+W+qxEscOn0qRs1un3/DxXaJ
	 TQgVxkqZGo5p5fmr5h5I/KSnMsXAIK9zan0pTbYwkOsoFa9XGKW6poBYjcOSrSyLVZ
	 RT9imM8xY1+IH6xOs3kQnpw7MYKPDWvHhPGrL6xCw5orpm1yNX7SZJzXLxigu6rmYH
	 9LcYZ1LqOOpwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 01/10] firmware: arm_scmi: Add SCMI QCOM Generic
 Extension Protocol documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pragnesh Papaniya" <pragnesh.papaniya@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-1-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
 <20260724-rfc_v8_scmi_memlat-v1-1-cb732bcff1f4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 07:27:31 +0000
Message-Id: <20260724072732.0DFB11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] The representation of the MEMLAT algorithm string as a 64-bit in=
teger introduces a byte-ordering flaw that will result in a scrambled strin=
g over the wire.
- [Medium] The generic protocol acts as an opaque multiplexer (ioctl-like t=
unnel), bypassing standard SCMI protocol architecture and discovery.
- [Medium] The 32-bit `cpumask` field restricts the protocol to 32 CPUs and=
 ambiguously refers to "HW CPU IDs".
- [Medium] Using `u16` for `cpu_freq_mhz` and `mem_freq_mhz` truncates freq=
uency values to integer megahertz, causing precision loss and protocol unit=
 inconsistency.
--

--- Patch [1]: [PATCH RFC 01/10] firmware: arm_scmi: Add SCMI QCOM Generic =
Extension Protocol documentation ---
commit a6be594dc6c7f4a121d53c66abe50771e714527d
Author: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>

firmware: arm_scmi: Add SCMI QCOM Generic Extension Protocol documentation

This commit adds documentation for the System Control Management Interface
(SCMI) Qualcomm Generic Extension Protocol. It describes generic commands
to turn on and configure SoC specific algorithms on the SCP, including
the MEMLAT memory latency governor.

> diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst b/dr=
ivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> new file mode 100644
> index 0000000000000..42e327d538414
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
> @@ -0,0 +1,954 @@
[ ... ]
> +System Control Management Interface (SCMI) Qualcomm Generic Extension Pr=
otocol
> +consists of a small set of generic SET/GET/START/STOP commands, which is=
 used to
> +turn on/off and configure Qualcomm SoC specific algorithms that run on t=
he SCP.
> +Each algorithm is identified through an algorithm string and has an immu=
table list
> +of param_ids.

[Severity: Medium]
Does this multiplexer design bypass the standard SCMI protocol architecture?

By routing distinct algorithms through a single generic SCMI protocol ID (0=
x80)
and dispatching them via algo_low/algo_high tokens, the design circumvents
standard SCMI protocol layout. Standard SCMI expects distinct features to
occupy their own vendor protocol IDs and utilize standard protocol discover=
y.

[ ... ]
> +MEMLAT: Memory Latency algorithm
> +________________________________
> +
> +The MEMLAT algorithm (0x4d454d4c4154, ASCII "MEMLAT") scales the DDR, LL=
CC and
> +DDR_QOS buses in response to memory-latency-bound workloads. It runs on =
the CPUCP:
[ ... ]
> +The 6-byte value is treated as a
> +64-bit algorithm string and split into two uint32 fields on the wire: al=
go_low
> +carries its lower 32 bits and algo_high its upper 32 bits.

[Severity: Medium]
Will this 64-bit integer representation result in a scrambled string over a
little-endian SCMI transport?

The document defines the algorithm string as a 64-bit integer 0x4d454d4c415=
4,
which is MEMLAT in big-endian hex. Splitting this into algo_low (0x4d4c4154)
and algo_high (0x00004d45) means a little-endian transport will send algo_l=
ow
as 54 41 4C 4D (T, A, L, M) and algo_high as 45 4D 00 00 (E, M, \0, \0).

This results in the string TALMEM in memory, rather than MEMLAT.

[ ... ]
> +MEMLAT_SET_MEM_GROUP
> +~~~~~~~~~~~~~~~~~~~~
> +
> +param_id: 0x10 (16)
> +command:  QCOM_SCMI_SET_PARAM
> +
> +Allocates a new memory group on the firmware side and binds it to the
> +underlying interconnect path (DDR / LLCC / DDR_QOS).
> +
> ++------------------+----------------------------------------------------=
-------+
> +|Parameters                                                             =
       |
> ++------------------+----------------------------------------------------=
-------+
> +|Name              |Description                                         =
       |
> ++------------------+----------------------------------------------------=
-------+
> +|uint32 cpumask    |Bitmask of HW CPU IDs that contribute counters to th=
is     |
> +|                  |group (limited to 32 CPUs).                         =
       |
> ++------------------+----------------------------------------------------=
-------+

[Severity: Medium]
Are HW CPU IDs guaranteed to map to a contiguous 32-bit bitmask?

If HW CPU IDs refers to ARM MPIDR values, those IDs are typically sparse and
would not fit in a 32-bit bitmask. If it refers to SCMI logical CPU indices,
could this be clarified?

Additionally, does hardcoding this bitmask to 32 bits limit the protocol on
future hardware with more than 32 CPUs?

[ ... ]
> +MEMLAT_MON_FREQ_MAP
> +~~~~~~~~~~~~~~~~~~~
> +
> +param_id: 0x20 (32)
> +command:  QCOM_SCMI_SET_PARAM
> +
> +Programs the cpufreq to memfreq voting table for a single monitor.
> +
> ++------------------+----------------------------------------------------=
-------+
> +|Parameters                                                             =
       |
> ++------------------+----------------------------------------------------=
-------+
> +|Name              |Description                                         =
       |
> ++------------------+----------------------------------------------------=
-------+
[ ... ]
> ++------------------+----------------------------------------------------=
-------+
> +|struct {          |Per-row mapping. cpu_freq_mhz is the cpufreq trigger=
 in    |
> +|u16 cpu_freq_mhz; |MHz; mem_freq_mhz is the resulting memfreq vote (MHz=
 for   |
> +|u16 mem_freq_mhz; |DDR/LLCC, a level index 0/1 for DDR_QOS).           =
       |
> +|} tbl[]           |                                                    =
       |
> ++------------------+----------------------------------------------------=
-------+

[Severity: Medium]
Does using u16 values in megahertz cause precision loss for frequencies that
are not perfectly divisible into integer MHz?

Other commands in this protocol, such as MEMLAT_SET_MIN_FREQ and
MEMLAT_GET_CUR_FREQ, use kHz. Could this struct also use kHz to maintain un=
it
consistency and avoid fractional megahertz truncation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-rfc_v8_scm=
i_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com?part=3D1
