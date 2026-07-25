Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4D9355F41
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 22:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785016860; cv=none; b=mMthFa1Q/Ksw4tO1T7a9atZJJmtt9xwajbSCOAz/QDIA41zyEF8B/LBvGziA+q+S0AHg4owMpyhKOSCX0afAiRkNxYAruQ6/9c6wgsfarUj3Xetn3/2MWInpG9kh7cVt6YJ937b9OzdYAMP2qiJvrjen6N+UZVeRLJ0GbZo1pWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785016860; c=relaxed/simple;
	bh=xrlUg1NEi9GbbfyeOUapud73Dliurvt3+VKo9N+dHho=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tvNvShjV2OwazkNcRBg0Iygx0Xls+CG9hVZuRqUvPOqyG4AzW1GyfTjhfGow9nd4tJ7/WVDkFeg2h7T4wIVkJZjxtJzKf7MbCWOrqBq4sOEg6xqMcCMURbSuG3sPu3Sd7ZdXpWXCNPRv15u6kbnPKxQxVRcyuLA5T0wk3Zk8jjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbJ5Ec2B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbJ5Ec2B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902C31F000E9;
	Sat, 25 Jul 2026 22:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785016858;
	bh=SFqkGYUxzSiJIKuxWzyAKpLvpZ10VnMtnwscn2LdZ+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dbJ5Ec2B+CNlBMUERbuexuVOoYG4Wr2VmfaOEQ3nkHHuarPOJqUl62Iwae76duceX
	 nbpj8VVd08A/oEzlKKWKpgDqmDmwEk8slYilOt1Yyx3Ex6KZfKh0mOooX/Mq5QJrV2
	 9Y/UMsi67sK065QQwsOvS95Q0G9zn5AKusUm9Qr+AbyUqhncub9gNOSkqi/De80Vp0
	 4rRA9yhA7uewRKD8sEVhLCUIwhkanHFm9hqa1VVIOIk7Mq3/TPn411jf7jiAIBtyGy
	 /vUac1Sw15vU1pGAtS1vSTFJCW11Iih/1ETW0YRu8ZtUf6Nm7YMqD5ND7Gmu7CCp7D
	 KrZFlByoRBBjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: BCM5301X: fix PCIe controller 2 second
 interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260725215722.9323-1-rosenp@gmail.com>
References: <20260725215722.9323-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 22:00:58 +0000
Message-Id: <20260725220058.902C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message inaccurately claims that PCIe controller 2 ha=
s interrupts 0-4 mapping to GIC SPI 138-142, omitting the mapping for inter=
rupt 5 to GIC SPI 143.
--

--- Patch [1]: [PATCH] ARM: dts: BCM5301X: fix PCIe controller 2 second int=
errupt ---
commit 61d1b598a171b93e277ba55c095b09aad8291a33
Author: Rosen Penev <rosenp@gmail.com>

ARM: dts: BCM5301X: fix PCIe controller 2 second interrupt

This commit corrects the interrupt mapping for PCIe controller 2 in the
device tree. It updates interrupt 1 to map to GIC SPI 139, fixing a
copy-paste error where it was previously mapped to 138.

> PCIe controller 2 has interrupts 0-4 mapping to GIC SPI 138-142. The
> mapping for interrupt 1 was incorrectly set to 138 due to a copy-paste
> error. Fix it to 139.

[Severity: Medium]
Is this description accurate regarding the number of mapped interrupts?

Looking at arch/arm/boot/dts/broadcom/bcm-ns.dtsi, the device tree explicit=
ly
maps interrupts 0 through 5 for PCIe controller 2:

			/* PCIe Controller 2 */
			<0x00014000 0 &gic GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
			<0x00014000 1 &gic GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
			<0x00014000 2 &gic GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
			<0x00014000 3 &gic GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
			<0x00014000 4 &gic GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
			<0x00014000 5 &gic GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,

Could the commit message be updated to mention that interrupts 0-5 map to
GIC SPI 138-143?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725215722.9323=
-1-rosenp@gmail.com?part=3D1
