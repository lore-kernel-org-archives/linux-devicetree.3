Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256153C7DEB
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871069; cv=none; b=QAcivDyFuunOCf6U04WQisH7okq3IhVkgHhLRVZweX+PAFA3UT7QfFt1iCCBrHHKESlWcbyk1+EZL5i9/hoKSvjkX8dw5VAW6ZSlHOM5MydGoIAQlloY7jbnf80Ry806ZvwHEBDxs/O7JtESGIB7yz87hXNTxAlT1NmqW3SgQRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871069; c=relaxed/simple;
	bh=f4YOF8vt92eNl1mKdqZyMCWyNb3+OoCLLo4tIp4YmMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRIqIkrbB9/snPv0+GRCDFVm47Qa7eooNx/XiFg4eNXiPQacfFocCzjP4SrBjTU/GE2xPCSaKTGpExKnUwKDYCsLY+VnI12u+LX3iHcJQiAHrajNLIzzegHe4lbXAyDvDGq/rvu4fHbV4tBoT3R4B89edG7PhRn8vA9C4Vg6qzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uRgEIC0O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uRgEIC0O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05684C4CEF7
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774871069;
	bh=f4YOF8vt92eNl1mKdqZyMCWyNb3+OoCLLo4tIp4YmMQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uRgEIC0OHFTjGnjqpcUzudj5PK0ySwoo0ihbOdzRQr39HpLRTD/b2F2IvmnAy0QMB
	 rMpU3c4qVSq+9B8Y3duAzRNQuULKIQZbB39tqIkx8h89z4P2sZ9eMWiMJ30V3z502w
	 NIF2J7pbUI3fUK3BirFOwUYBzMAggmASC/7WvxLSBKqvpOvo7SunL3gq+bnDoEJUBY
	 /UdVOODG1a06dfavlzYSUXk3tAmWgl7T6tulCQxgzbVEbmMNzTjDANd7cfZfR1sR8j
	 74NgXYv75Qk/gs3G1Y+cluMsPz+Bgmuy8fyQZZ4dv58tGBG5rim27ZzZxmmF48FCKY
	 N6cZh6RtZJ6jQ==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66c1d3fecb2so140050a12.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:44:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzGSIwPYtC92wp6d12g4eYTekYYI2FqDHv9qX7yhiZkQDguwylKGb3XRMZIlzq5vZX2+v8bdo8e+QI@vger.kernel.org
X-Gm-Message-State: AOJu0YznSxnqDVU2NkdEXvMyT6yJBGGLZYTFSC7/aC8KUR0158mgxOGL
	xEK7zrPNAXAFueL21bhFeRR/LOwXhHcV8k2iDULGr+mF61Y5uI0/sXt7lBwKxaP1TUn6DL5YCuC
	wuH2ml2bC/2dO779FNgLfcJU39wV4IA==
X-Received: by 2002:a05:6402:448d:b0:66b:82e6:5355 with SMTP id
 4fb4d7f45d1cf-66b82e65456mr3962353a12.19.1774871067648; Mon, 30 Mar 2026
 04:44:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225060347.718905-1-coxu@redhat.com> <20260225060347.718905-4-coxu@redhat.com>
In-Reply-To: <20260225060347.718905-4-coxu@redhat.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Mar 2026 06:44:15 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+0w2hGN=Loy=ucHbZcdnn+ty3x9qS4WVX0Vj+g19tfpg@mail.gmail.com>
X-Gm-Features: AQROBzBPVOVlPWkIprh4svfiWPChabJG3_HPxZ8omC63yiiiHstiwFYKcyHWrdY
Message-ID: <CAL_Jsq+0w2hGN=Loy=ucHbZcdnn+ty3x9qS4WVX0Vj+g19tfpg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel
To: Coiby Xu <coxu@redhat.com>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, 
	Dave Young <dyoung@redhat.com>, Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Thomas Staudt <tstaudt@de.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, 
	Will Deacon <will@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Saravana Kannan <saravanak@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 12:04=E2=80=AFAM Coiby Xu <coxu@redhat.com> wrote:
>
> CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
> device dump target by addressing two challenges [1],
>  - Kdump kernel may not be able to decrypt the LUKS partition. For some
>    machines, a system administrator may not have a chance to enter the
>    password to decrypt the device in kdump initramfs after the 1st kernel
>    crashes
>
>  - LUKS2 by default use the memory-hard Argon2 key derivation function
>    which is quite memory-consuming compared to the limited memory reserve=
d
>    for kdump.
>
> To also enable this feature for ARM64 and PowerPC, the missing piece is
> to let the kdump kernel know where to find the dm-crypt keys which are
> randomly stored in memory reserved for kdump. Introduce a new device
> tree property dmcryptkeys [2] as similar to elfcorehdr to pass the
> memory address of the stored info of dm-crypt keys to the kdump kernel.
> Since this property is only needed by the kdump kernel, it won't be
> exposed to user space.
>
> [1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
> [2] https://github.com/devicetree-org/dt-schema/pull/181
>
> Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Dave Young <dyoung@redhat.com>
> Cc: Kairui Song <ryncsn@gmail.com>
> Cc: Pingfan Liu <kernelfans@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thomas Staudt <tstaudt@de.ibm.com>
> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Signed-off-by: Coiby Xu <coxu@redhat.com>
> ---
>  arch/arm64/kernel/machine_kexec_file.c |  4 ++++
>  arch/powerpc/kexec/elf_64.c            |  4 ++++
>  drivers/of/fdt.c                       | 21 +++++++++++++++++++++
>  drivers/of/kexec.c                     | 19 +++++++++++++++++++
>  4 files changed, 48 insertions(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
