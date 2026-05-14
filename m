Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9541368D67
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 11:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758280; cv=none; b=JvzPhRoPZu3UW1uTqy1F8x0nSCKAN+5VvyMrlRVS+oqN01JV+G1neC0qDzvvg+cO/phgFfv/zHh02iqXog2ocVOhrSAHyQtekedsAZHK9dyyODRL0+oa/GlsoP+ofBbV6xREb9GkDrqnmOG7NJ3VH9mAGD9Tr87fFXRjvF24xwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758280; c=relaxed/simple;
	bh=B3jF1YK8LeOiXVFWWJKkYtSkav7HXNxJOmJ/RmRwrY4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=giFfIflcfe90HH52f9rACXMWU6RBx1KO4vN+7wMowSw5wp5yHQvZPR0/c0EHa6Q8eELfwqzP8uQ1vjuc2PM7Z82wVXR6QSv27rssYaFu2BcqE9FozEGY58TPNZyspRqNc+4XMEofEQmxe/NYJ+RK1KRv+WVDYz289LQCu2y/yv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qD0G3Dci; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qD0G3Dci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5EDC2BCC7;
	Thu, 14 May 2026 11:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778758280;
	bh=B3jF1YK8LeOiXVFWWJKkYtSkav7HXNxJOmJ/RmRwrY4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qD0G3Dci9q4TxZGIq7J2CqpE+OL/V/CPPd4KOj2+DOJo2x61ojoP6Zm4RxCs6bV5/
	 MqMNLX+9ei38rXeaOKzfB37FNpxKTIUp3r4vxIHbQBESjik0Np2n3gxPhR0O4cljnv
	 mmTA9Z7czg2WCwzThZQYc/W3O1ZIkOjy3DP85UAW6dhNsomJM83C/rmgrpDOIgv0W8
	 fAryu2tSl5iF6E0DjkNNB/i7S4Kw5e/X3cD/C59Hc+WgdR9YcWLhZTkuSLB8UAuobe
	 1u1yCffQyq7UE1zHdTda3vakfYfVSfttWCYZpdwdaxbod8gC8Iqjnpc1qErifcffVt
	 bXtToIH0YDJHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Add PSCI node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marek.vasut+renesas@mailbox.org>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513225037.49803-1-marek.vasut+renesas@mailbox.org>
References: <20260513225037.49803-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 11:31:19 +0000
Message-Id: <20260514113120.0B5EDC2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing 'enable-method' in CPU nodes prevents SMP bring-up.
--

commit 0e20af8dd1fbf54360d3f87985cba2a59a5ee08f
Author: Marek Vasut <marek.vasut+renesas@mailbox.org>
arm64: dts: renesas: r8a78000: Add PSCI node

This commit adds the PSCI node to the r8a78000 device tree to describe SMC
based access. This enables interaction with the TFA BL31 PSCI provider for
tasks such as CPU power management.

> diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/=
dts/renesas/r8a78000.dtsi
> index 4c97298fa7634..9e759ea46ee20 100644
> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi

[ ... ]

> @@ -665,6 +665,11 @@ extalr_clk: extalr-clk {
>  		/* clock-frequency must be set on board */
>  	};
> =20
> +	psci {
> +		compatible =3D "arm,psci-1.0";
> +		method =3D "smc";
> +	};
> +

Does this also require updating the CPU nodes to actually use PSCI?

Looking at the ARM64 SMP bring-up in arch/arm64/kernel/cpu_ops.c, the kernel
relies on cpu_read_enable_method() to determine how to wake up secondary
CPUs. It expects an enable-method property in the device tree for each CPU
node:

arch/arm64/kernel/cpu_ops.c:cpu_read_enable_method() {
        ...
        dn =3D of_get_cpu_node(cpu, NULL);
        ...
        enable_method =3D of_get_property(dn, "enable-method", NULL);
        if (!enable_method) {
                ...
        }
        ...
}

Without adding enable-method =3D "psci" to the cpu nodes in r8a78000.dtsi,
does this cause an SMP regression where the system fails to initialize
secondary cores and boots as a single-core system?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513225037.4980=
3-1-marek.vasut+renesas@mailbox.org?part=3D1
