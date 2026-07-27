Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FC637A48A
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785155377; cv=none; b=HjzU8KikDt2lPoWDbk0JHCItPTmMOIzi0JoWTNJyEPOkSW8dGLVj27zH+pg3+X8EhAL46hGtVQJWJYavBY3pR+Dwoa52ZwWhPpDTs+HdVCuc3F/xaAxIvg//SRzj02Tpak3BNzOV5ghH2va64rGZNsBlt/Hcglb6JU/CekUEl1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785155377; c=relaxed/simple;
	bh=WG1OFdWFEEIeRyE9yk3DFzyvSlgxVbfq155VhoMWf/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XGdioD05AxZ6Cll1FNAuK2+HvK5bD6xZTIC4j8mOW/KP4kgji4zpTPxrQCIuOH0vWBT1bFJZDdqE0E0ttlgtv+eAX6bmSyR3zeRZSAPO0Eke9HP5pKzoW+GVZma+YRt3LTLnk7BysXLw2M+HzpVCk6yfSjNDEh8hehQt3ld63S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VoN+wAuj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VoN+wAuj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4DCB1F000E9;
	Mon, 27 Jul 2026 12:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785155376;
	bh=XIGDzX9wHyRZ/psu1489Oj4U0BgYi4gXxe1JasBbZco=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VoN+wAujSgDmyh0uq7esc3NC5ZE0Grfok+XBgkpQc7yjcuI1UdKKYKwiTIHrvP6ON
	 39ZMw37uhBcOS8Nja8LS3YXOPD+wKu7zOJbRBxjEdqvqly7k4BSzWU9NaEF1oT7FHR
	 8tKLOMH5cY9ZzPjDp0kG1vWVNST40bnbqaPjXptrZ8bPt8VE9Ck5Yt1yB2OhZRhCWB
	 xOOaV5B1Jz4pu+752aJfitJHHMmRkNn3xGqVVkoJ66+8IZpsWjRViRprmuMdaCrpL7
	 XGM0/7Wm7FaNm8K36Ytk2WaiRh06AAM5wk+/sys7MXSvZ8JmX6oBY4YFuCA39JiJrD
	 FwSQmUjdZfpUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: versal-net: Add retention state for cpu idle
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jay Buddhabhatti" <jay.buddhabhatti@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727121842.3410495-1-jay.buddhabhatti@amd.com>
References: <20260727121842.3410495-1-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 12:29:35 +0000
Message-Id: <20260727122935.D4DCB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The CPU_RETENTION_0 state duplicates the built-in WFI state and =
fails to avoid firmware dependency, contradicting the patch's stated goal.
--

--- Patch [1]: [PATCH] arm64: versal-net: Add retention state for cpu idle =
---
commit 945569ec7efab4f9ca915d207005b24c2747571f
Author: Jay Buddhabhatti <jay.buddhabhatti@amd.com>

arm64: versal-net: Add retention state for cpu idle

This commit replaces the sleep state with a retention state for CPU idle in
the versal-net device tree. The stated goal is to avoid firmware dependenci=
es
by using a PSCI suspend parameter of 0, intending for the core to simply
execute WFI without powering off.

> diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot=
/dts/xilinx/versal-net.dtsi
> --- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
[ ... ]
> @@ -636,13 +636,12 @@ llc: l4-cache { /* LLC inside CMN */
>  		idle-states {
>  			entry-method =3D "psci";
> =20
> -			CPU_SLEEP_0: cpu-sleep-0 {
> +			CPU_RETENTION_0: cpu-retention-0 {
>  				compatible =3D "arm,idle-state";
> -				arm,psci-suspend-param =3D <0x40000000>;
> -				local-timer-stop;
> -				entry-latency-us =3D <300>;
> -				exit-latency-us =3D <600>;
> -				min-residency-us =3D <10000>;
> +				arm,psci-suspend-param =3D <0>;
> +				entry-latency-us =3D <1>;
> +				exit-latency-us =3D <1>;
> +				min-residency-us =3D <1>;
>  			};

[Severity: Medium]
The commit message states that this state avoids dependencies on firmware
because the core simply executes WFI. However, does defining this PSCI idle
state still trigger an SMC call to EL3?

Looking at the cpuidle-psci driver, any registered PSCI idle state invokes
psci_cpu_suspend_enter(), which issues a CPU_SUSPEND SMC call. This implies
the firmware would still be involved on every idle entry, conflicting with
the stated goal.

Additionally, the cpuidle-psci driver already unconditionally creates a
default WFI state at index 0. Does adding CPU_RETENTION_0 with
arm,psci-suspend-param =3D <0> create a duplicate, functionally identical
idle state in the cpuidle governor?

If the genuine goal is to execute a native hardware WFI without trapping
to firmware, should the cpu-idle-states property be omitted from the CPU
nodes entirely? This would cause the cpuidle-psci driver to fail to probe,
allowing the kernel to natively fall back to arch_cpu_idle() which invokes
the wfi instruction directly from EL1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727121842.3410=
495-1-jay.buddhabhatti@amd.com?part=3D1
