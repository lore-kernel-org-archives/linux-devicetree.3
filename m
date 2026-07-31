Received: from mailgate-4.ics.forth.gr (mailgate-4.ics.forth.gr [139.91.1.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBC72BCF4C
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 03:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.91.1.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468153; cv=none; b=M7yEyVlB1O8KPkmSMFKt/vkFxnqflBeMEAqTkTSPOr2QStrjl7le4/zTBwrfX5IxEcwk+wvfMbxnU/hR/FglFcceThMrQ0xVBxxZ17BxKzMydwUsbdKw/uKLNStHm2FWzDyxzYYtdRjnYBn/ov9XoHakl5q8+0bA5vauIkR4EEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468153; c=relaxed/simple;
	bh=TcqbGWOV3xZat/jbZ9FP58nyvNEhUv8/UEH17UX0FK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Awsild1Yq28KNep9bs4MKpPSEFYao90h+0Rqdnd4XOsqVpI7bN2ZysRTqka4sOqJjNI8eFQ0LyzyjUONSdstWSzhlzw9DDWGHdchICCOJaBzjGrkc6W86p1SkuhkV1QklFCVdtXd5eZ2SA7T/KLqCOMTXkRWmk11jb6hWLGF95g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ics.forth.gr; spf=pass smtp.mailfrom=ics.forth.gr; dkim=pass (2048-bit key) header.d=ics.forth.gr header.i=@ics.forth.gr header.b=jNpAcUW8; arc=none smtp.client-ip=139.91.1.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ics.forth.gr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ics.forth.gr header.i=@ics.forth.gr header.b="jNpAcUW8"
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
	by mailgate-4.ics.forth.gr (8.16.1/ICS-FORTH/V10-1.8-GATE) with ESMTP id 66V1uFvR314990
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:56:19 +0300
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
	q=dns/txt; i=@ics.forth.gr; t=1785462975; x=1788054975;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TcqbGWOV3xZat/jbZ9FP58nyvNEhUv8/UEH17UX0FK0=;
	b=jNpAcUW8PGZpRq/iekIe3wl3m8gSFy1pd4Jq+gnYIDe5DSQheZcSojyRBm4j12//
	eYSH6FfkyNSFN9Bb/ghq2m8yA+LxOK/G5fBoJZZQJyYPWH5VsjT2kdngeBmhGlB+
	jvgwAnKfCb6g3cvnbVYyYGE5VTK7GltbFjaQzfo5sb4+Esqo6GRnsNiyAI6z8Ihj
	275aPj0E4+0KGaojjxcSiOFm1GkgCjbkD5fDpk51jGlWSyHRmxGgpe57BAMBBYPk
	n8TlNv1FTIJhLcCEG+R+K7jVG/IdzbgqTyp4jW7Dw/G2Wf6DBhXxcTXOvbth595V
	p/cR5s5obyfIieAjLNSc/w==;
X-AuditID: 8b5b014d-2cdd76400019e05d-89-6a6c00bf1b31
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
	by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id B8.42.57437.FB00C6A6; Fri, 31 Jul 2026 04:56:15 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick at ics.forth.gr
Message-ID: <bf39e87c-c077-4ccf-a791-42ae194b4780@ics.forth.gr>
Date: Fri, 31 Jul 2026 04:43:56 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] dt-bindings: riscv: Add RISC-V Worlds and SiFive
 WorldGuard DT bindings
To: Yu-Chien Peter Lin <peter.lin@sifive.com>, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr
References: <20260729163908.249838-1-peter.lin@sifive.com>
Content-Language: en-US, el-en, el-GR
From: Nick Kossifidis <mick@ics.forth.gr>
In-Reply-To: <20260729163908.249838-1-peter.lin@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphleLIzCtJLcpLzFFi42Lpjp6urLufISfLYNo8PYs569ewWTy785XV
	ouXDO1aLrb9nsVus2XuOyeL4iiZ2i5XrvjNZzD9yjtVi6fZJbBar+1vZLa4ur7Y4dGcRi8Xn
	5gYWiwOHLjBavJx1j83i8q45bBbbPrewWTR8fctisff4RVaLNf+8LF5e7mG2OL7tN6PFjAe/
	mS0uzp3MaDH58TU2i/OTu9kt/u/ZwW4xbdcERovV566wWMyeuITd4mf/PVaLD3dnszkoeLRe
	+svmMfX3GRaPfyfWsHm8efmSxeNwxxd2j5sL1jJ73DsxjdVj347NjB6PLjt4bFrVyeZxYsZv
	Fo/NS+o9Drz6y+ixYspVJo8tMzeyefRdcQ4QiuKySUnNySxLLdK3S+DK2HA1tOAwX0Xv2evM
	DYzfubsYOTgkBEwkTn617GLk4hASOMooceD9FuYuRk6guKXE5k8vWUBsXgF7iYv3J4LZLAKq
	Egv+3GWCiAtKnJz5BCwuKiAvcf/WDHYQW1ggVaJh5UFmkKEiAhMZJa6cX88K4jAL9DNK/Ju1
	nw1ks5CAlcSSGYwgDcxAQ+c/28QKYrMJaErMv3QQbCingLXE4nf32SBqzCS6tnZB1ctLbH87
	h3kCo8AsJHfMQjJqFpKWWUhaFjCyrGIUSCwz1stMLtZLyy8qydBLL9rECE4ojL47GNc8bdE/
	xMjEwXiIUYKDWUmEd9H1rCwh3pTEyqrUovz4otKc1OJDjNIcLErivHERjzKEBNITS1KzU1ML
	UotgskwcnFINTEmsZyR8BdRLZvxb7HPi43Fxj2197G+/xk4vXmA2+flhe+890uk2qmulZzMs
	bF0sMcNSSpvblv1BlqzwXt0K1d6yiviNQbPuFXTvO15vscxQvVdr2us3uhX8F9uCS2XnuRn+
	Ujbslzp1mHMea0+64uJSsboTcTP1E+ozUiZcjF3edkNxitYlj18q87a+6Y83//2qZfvblYYp
	Ttd9l5lqN9pf7Em8cePIgta2yidqrK+KlNk4TFjbey1zZHe5/H2tnH1rjeragt0yLTWr/Xsf
	TGNVeH+D/c7P6GD7d1oi3S/EHh6XrS64vfEUe4LCrqOr5qaeblcQctMtnuX3Ik3kHfsnnlmx
	GQmb5/M0Ti5XYivOSDQyNdNiLipOBADahCH/mQMAAA==

Hello Peter,

On 7/29/26 19:39, Yu-Chien Peter Lin wrote:
> Add device tree bindings for RISC-V Worlds, a standard extension that tags
> every transaction with a World ID for fine-grained isolation. SiFive's
> WorldGuard Checker is a hardware firewall in the system interconnect that
> inspects transaction WIDs and enforces per-World access policies on memory
> and MMIO devices.
> 
> wgChecker specification reference:
> https://github.com/riscvarchive/security/blob/main/papers/worldguard%20proposal.pdf
> 
> Yu-Chien Peter Lin (3):
>    dt-bindings: riscv: Add Worlds ISA extensions
>    dt-bindings: riscv: Add Worlds per-hart properties
>    dt-bindings: sifive: Add WorldGuard Checker
> 
>   .../devicetree/bindings/riscv/cpus.yaml       |  61 +++
>   .../devicetree/bindings/riscv/extensions.yaml |  53 +++
>   .../devicetree/bindings/riscv/worlds.yaml     |  86 +++++
>   .../bindings/sifive/sifive,wgchecker2.yaml    | 356 ++++++++++++++++++
>   4 files changed, 556 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
>   create mode 100644 Documentation/devicetree/bindings/sifive/sifive,wgchecker2.yaml
> 

What's the plan for this and why do we need Linux-specific dt bindings ? 
This looks more like a set of firmware specific bindings, like OpenSBI 
domains for example 
(https://github.com/riscv-software-src/opensbi/blob/master/docs/domain_support.md). 
I understand adding the ISA extensions in the list (although the fast 
track is still underway, it's not ratified yet), but the rest don't make 
sense, not yet at least. How do you plan to use pmlwidlist on Linux to 
associate processes to wids ? Do you plan on adding a driver for the wg 
checker (and the markers that you mention) on Linux ? Do you ever expect 
Linux to run under trustedwid ?

Regards,
Nick
