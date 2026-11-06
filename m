Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972306;
	b=Fy/G4qy4VcoCzu7/wqgQxriDG9oji2BPag3YsARWW6Wzm+a8evr5Hc5WsgszfR8XXkrC
	 Ini1I9XX0akJ154CAqZSEuYMAPc3+HosXJN9hygiNnyHy7/uNMXLviWs5RzmiVofV5Gk7
	 HnCyxo8FEFVovCMeF0uLs37fEpoXW9/+wS7CdvWd5dpFV07yewnlzyw+VMWPZB2HTtEBx
	 gobS4ioWQJNw4KxXp1iDMW2NNlyY0bbKU33MzEW5pKa3+s3Jw8zAO2dUtSEi+cWB4IuT+
	 6D2GWNNEZJ29hxbCGdk3kbGn6fSyZkqRcxEpQWL8JZ97svlNWZwQDh3YfqlLAzTgI7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972306;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gQBS7v9tFl3fjkelQi9sJCplAiT3WJd75iogpE1L0R8=;
	b=hf6Ci54FU0RGD1WiXbH0MDQ2l/Zd+zo/RLmUoeW5hoHmUrg5iOhe0//ISoE23WpJndSc
	 ssGdP7yAuqK2Evi+FcM6AIYvMimHfdasj60nxe0Bfh5M+J3+Rv3SpJxj6oREmPjcGeGlc
	 e3j+FsZZFGlMg2UUOvG82TQUCJPOMFb17E407To0cRT6RTR8J2LJh4l56VNqfYH/Yu94u
	 gJpBF89J2nAhIBbA8gIpaiUzZTlmdi9t750M1FUpnFXxU2YliOAJqYmnAIqneoE6fcgN4
	 /lDUbgwpiu/1gly3R+rYNGs/Av4Hd3HQtjtU+na93wdrDKMjaI6Kjl/JXfEd37nEn9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CdTJaBUh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F836606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CdTJaBUh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE041F008BD
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 13:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793972304;
	bh=gQBS7v9tFl3fjkelQi9sJCplAiT3WJd75iogpE1L0R8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CdTJaBUhRIDbG1lY/eBuinJ4AvxcV8862ho72UfnOVOkh4gjQ9J8I2l5glOEL4GRE
	 g9aT+KJ0K7CKt/1OXiqyeXKNcsk5Zurm7BbVGiNwFLHaIgw0T9B96IUOByszAm6JBE
	 BovY4hXsz1/ZKN+4OdViMwN9nwZpmuHSxhlSkxE/zcshe4zBTP2n+5B7N9rV8N44ZA
	 6LPlYcy3NChfvEUFyvcrurx5CgEvbBbyiNy7w039DFdPjF0tW0m+yhT2CV4S62BpQA
	 hSw4oee+AW49xzyfn8/D4RoY6mqppuUwfqPj4djCViqZp7CAl4YAzn85Rrile634sy
	 agtl2slta2Fig==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab39af88aeso7748491fa.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 05:38:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBya6TTu7fRxY02Q/QorbFTOABXEGevAKPCtbaAjAbwc5GEZHPNoxElRfFey3vLv6jxn/iV7fjChDGpV@vger.kernel.org
X-Gm-Message-State: APuU4Z8wctFX4yOI2fHiqN+aAa1lkOKSn4O1GyYJdHOm8bHZveWLNzBj
	JZ9AKeW3PF8gFgc95JG+lFMsmx2+i0aExTmElfDMhm5ABRShLj1SsXo/axp1Ff++aQDFWt4cRPf
	GnIN7khlrhe6KcKBg1UR1nLhC181S4z8=
X-Received: by 2002:a05:6512:23a8:b0:5bf:a6f0:99f5 with SMTP id
 2adb3069b0e04-5c003c3c415mr845462e87.53.1793972303645; Fri, 06 Nov 2026
 05:38:23 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:38:11 +0100
X-Gmail-Original-Message-ID: <CAD++jLk8Eh89re2xxkKKOvsCMeLKMJHNsJfuP_KwYALYeQXvgA@mail.gmail.com>
X-Gm-Features: AclHuK_6Bx8k78KNBHAtmOxBfZAHVK4oXzuHSxzv8jywI57DTrJQRyqi2wnS5w4
Message-ID: <CAD++jLk8Eh89re2xxkKKOvsCMeLKMJHNsJfuP_KwYALYeQXvgA@mail.gmail.com>
Subject: Re: [PATCH 0/7] ARM: dts: arm: Another batch of warning fixes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 11:34=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> This is a batch of schema warning fixes mainly for 32-bit Arm, Ltd
> boards. While all these are 32-bit Arm fixes, vexpress-v2m-rs1.dtsi is
> included by vexpress-v2f-1xv7-ca53x2.dts which is 64-bit platform. Patch
> 2 fixes the last DT schema warning on 64-bit Arm Ltd boards. Yay! For
> 32-bit boards, this cuts the remaining warnings in ~half.
>
> I verified the config-bus devices still probe after moving 'mcc' node
> with arm/vexpress-v2p-ca15-tc1.dts on QEMU.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
