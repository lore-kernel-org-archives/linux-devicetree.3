Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673885;
	b=0wmBp3KdpEtcSJV+AIn3krU7ILrMFLV/Fxs8daN6Y2kHu+X4/d2fEju5FiDVkbM2/JWS
	 L4WIoRiz8m/6hALXx+2nCz9DuuwpNTmgIscOezscIv8IPBQ27RugM1/Fezp+yJLrgs5IP
	 MBKMha7T9Rw/5SU+cEEoRrgHI3bUkz3a8N7DblMoVsdakCx0AxOMhpHN0vfOjhjpVzCRf
	 OOEuq8mmtCLFb+Jrj96RtC3OgVIGrU+YvgQC5waY3R7zq+grDoP3B3U2sFrmLM7TFvNeu
	 4Bahb3e99lAw73m4CP82iVuc4GVC/mk2oWRJDZ1IRSnRj4whBZ9B3QVz8XIb9PvUgPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673885;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=5Vlv9NX7/q60nT2M57UH6J+SRq53m5fxwmq9gc9UNtY=;
	b=udH8LcMowpAvBfAUp4NpOVrhIddQS5AI+aC/p6U+LJcp2TUJ+CAgdPt1lJn/YuXjINug
	 ghpE3vwpfrAHftya3P/oHbSRJUcJpRW8m/SdhCgCQ15PxN9lrAQpEW/skcDZtrVOGye+z
	 FKvSGcpMU1q1L2FuVvs2BLZkEJX2Ze5qF8LbhVRvdvpfIblIL0T9LUYFOIuTymVVQDXxB
	 p9NjbtbHevRRdA/y7yNTGRt9YAxQkEsnbJAvqcGFXr6R52ltDrJbqF8kPPcj2ewDjMAX5
	 3Nl5J4xxNEhZQ7xSxkiotJ6aP5GGd1UzCGRPoKaWEiXvx1DIyy6JpkA46t/Fhls461Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOp83War;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4320F606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOp83War
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A051F000C8
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 12:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792673885;
	bh=5Vlv9NX7/q60nT2M57UH6J+SRq53m5fxwmq9gc9UNtY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=XOp83WardrYyK1LYlsdXitab8YbDuYqhmMsnqTfjFqP/yQHf47CZVO3CKpiHX5xdF
	 0i78UxnbhUbvryEXZGHm9K552Wjo2sJCs/DpRKBcTBOJEg/Vu5RX/U2R49fhYz+8wZ
	 ax2/yaewWLkKYxAJH5iQN5rgcKk8SNTeiHL2zC7wqN5tsDDZPiwBPYQUqq6OgveVDF
	 eki+fvqSsCLeN1fKsgjEXJG0lM7/XtUBLaJU/UmnutVtSegpQEHxLc3sWFSaA91aq+
	 PNMz876yOI1igHUrbE+/9rwy+R1RgRrDmRuA54CeSD1Zr1uAE94AzpYbk9BsWDDDsl
	 gb0YCa/yc21ng==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a98fc80925so21238381fa.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 05:58:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxZBJRws1R8H9yvGwKAyLGrrZSESd7y+Kgc8SWT5KoYVjT+6vKBqd87xIwvi7xJ40Amv/az8wRhWovS@vger.kernel.org
X-Gm-Message-State: AFq9FYJECdi2nQQ59HQDQ9pD29QvrzpSC2HvFAh4XG5yT1uX/d0C6uJE
	NBCHfd81RSicmwYTjEOQJNcl+eIQAncDQwpHnnHW4bFUTZ4pmsQgM3SzZ3CcvBTR+R0fBM53Y/c
	CVSey4O6H3eVu7F4PaTsitrE/nUoZXUSb7QDiNFLVAA==
X-Received: by 2002:a05:6512:33d2:b0:5be:50ef:ef02 with SMTP id
 2adb3069b0e04-5bfa1ccea29mr2142055e87.13.1792673883580; Thu, 22 Oct 2026
 05:58:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 05:58:00 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 05:58:00 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 05:58:00 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeWQggWX_A+CkAE-Ci420RqLV383HGngAXx7aFnGO4krw@mail.gmail.com>
X-Gm-Features: AclHuK-5CQtiKb0je_S_IE6JRBYFGKIeNGx2LoOrOHFsNUMvJhjAXZmu6HDSJac
Message-ID: <CAMRc=MeWQggWX_A+CkAE-Ci420RqLV383HGngAXx7aFnGO4krw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] arm64: dts: qcom: Introduce SA8255P as Lemans
 family SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Oct 2026 04:37:04 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> While the patchset [1] supports SA8255P as a standalone SoC, this series
> offers an alternative by introducing SA8255P as a Lemans family SoC.
>
> Lemans family has two variants: Embedded variant (IQ9/SA8775P) where
> platform resources like clocks, regulators, interconnects etc. are
> managed by HLOS, and GearVM variant (SA8255P) where they are managed by
> a VM acting as SCMI server.  All Lemans family SoCs actually share the
> same hardware configurations like memory maps, interrupts, DMAs, etc.
>
> This patchset moves those platform resources out of lemans.dtsi and gets
> them accommodated in lemans-embedded.dtsi, so that lemans.dtsi can cover
> GearVM variant as well, i.e. lemans-gearvm.dtsi includes lemans.dtsi and
> overrides/adds properties as needed.
>

Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
# sa8255p-ride
