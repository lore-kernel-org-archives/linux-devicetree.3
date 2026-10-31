Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793416689;
	b=d+1p9LZKa6kcj2JsqxXcdC6bH4B4m+sul4hdfwBWmhTFgqNnxaFLrrSZLD2W/FQL7eKe
	 /GdIdazIHBJBSE2Qs69wFHhfStb2muc7rFev2cuGTAu0LZrYiMvD5Ii4A/h2p6rblG3zO
	 wKwT5yGtLrq1BA7b76lOZiQAL/QQVagtf45/PmPekCuSY7V/M2jmzhqgJnljk/BR+GRzj
	 IEwhFKNE3DsOgC9P11pvf5CUxlmfR+SRkO26y/AMUr7LYhpIhtYg4eZ52BAQ1nz3gRsoJ
	 xVYq6fd+5xyY4Ct8QhegPOK+H+mtZTCScg2csDXjKSnbMKNSQcRFlZMG8Zhi5gyGtFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793416689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
	b=iCUta3PcMbHAIPpFSzincd+T53/nx9DjOS0O3+q4NefxTwW8F99UkWFb/g6zr55Qv6WO
	 wgwAeyMSxnm1cgMwmB7rpPdWJxj1cUKRJlt+GM4MvCCCbZYvdpERJo5m7Jt3bAAp+dKGD
	 O+vq5e4qOZRCm7LXgS62l91UIk41M4NJ/GKZcykCFxAx8jo9GQfpKePTkidliq+WGQj8o
	 NxNbbk4QdmmoIJu3otx5Wz0yBrEGOs7A+/JusfcDbi3fgNH9avWcY3txT3EHV7Sb/zR1I
	 UwKeZ9n16+/xvNIOpF8gexJpnTu3LFH0Lq693A/ECvawZNR572LbBMmInA0Vwj9tKXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VRZSfc4z;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9463F606A324
	for <Devicetree@vger.kernel.org>; Sat, 31 Oct 2026 03:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9463F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VRZSfc4z
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba3fba0080so981328e87.1
        for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 20:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793416687; x=1794021487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
        b=VRZSfc4zk1MkA9Jeav0fg/9I76DrtsjqZ8O8+UGsfirlBHw+YdzYAOM48nvqOAyGPa
         QMgaxBsyKPQRPaJrDYHnYmDDUObdz4Z4AyBE++hgcUDuSpnvTBuaoLjECT+1LsJDa4Ko
         FBCKcnUTHgrTPCliSERYwTgHK+LDgq+S5GR8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793416687; x=1794021487;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSQVuufJqG4DagM4PmCmZM1z/EqJK6JLyOoiv3ybUJs=;
        b=lZYZzu58883nEZ+JjfCbPY75Dp8CEJ28e1jLStjrQX2/UGpzYqox5HRjzdvq3NBuZu
         4y56IrNpZTp6Tfa9FgtQZHN9BbY040L+6IOQru0NhwA4EdGlEx+CCjNfINt2SJoGWP7e
         ND1EycyqYRmDqdLorFVT1HTY1GXN9g3/Z8T7PFC6jfUJqXUh/bYDX6uR2cjgx2PhLN88
         xmwdh/XC1Rpod8CyEcN14UpZNo3th533eN3Ctitjp3f/IZEfD4RANh3YQrFbMwVBzWP8
         3FB3hdRZH82mZXQpRmTz46NOmSp9WdX0J+coP3jEuVwTpsyq9k2bv9vYC5qFsVfV6pfb
         J7hA==
X-Forwarded-Encrypted: i=1; AKwUvBxbJaV71Gk6gDja/JeYnS6dAurICyvBJ5sG0HULv2xfvYierII2IwFVid3hOOrdumi0IJjhTWjK9VRx@vger.kernel.org
X-Gm-Message-State: AFq9FYJF+CB/m6pctvKl/e7Sk+7rZGRNydmNzCUVh5290xQlqaIdNBHW
	Ms3zzVnWh+y84jOXpdkllEXK8QalD0+4OUmXFOL1xaMR/lbpfuZbMa+s0jIJMaACfoqFarMy6jf
	AjMAOnH6s
X-Gm-Gg: AYBFou07Gu9JY0M+BWEx0FklitdHELdqICjAJBOdJ0Ch2XMUXxVInDZ3IGIcRcWA76F
	D3o4V7ACJj+4qUAOdQc/E1KHlzBZwakDhnWAi6I+dh9AwfewBA8CO/fexsO3qZUFfh9TeytpuQi
	a2DKdS6TbA0CleJufOy/bcVnCbqU4aebYOiPlEfO/H2LUbdtjbPhFeVbd7GNtRE4leD1B0AAgLx
	vE6wXbaggUvOehrMCmurmNqJghx1l8bsqXntq8RMxjR7VGQwhkMcrd8kov4mdpvYt0xJT9bugs6
	lwXKTyV7dZAk4RyfmyzGjhEp3FJ+yQpD0V0TigvtF8hLjH0tKCO/Arc9Xze+jAueLXwWrb4Lh07
	6Hnw4DVM4IVu681ufcW2gcnK5wWpCCpYS6EIS9PoEY7I8treYZSqNbsMHP8zRBsApnUiOAyiKzS
	W0h8WdTnDbJxsemvLTxZQyaepga+2lCZ2mge//m0qWLrSgqrjnJ+umcGn0BnT9uoYDA8AL+RkSC
	QM9Nw+5GFnGcvsY/REs3SglzvGFXUSuHoMTc0dijFtx1z2JkIBEcsKw3OGIK0aD8Mnqts+f+9Dx
	NYTX99r/Apuykfm5gEmNXVbU4Xuj5LgqjEAboji0ZDsNOK/R9hR3hoAIjlrst6Erex05PotV
X-Received: by 2002:a05:6512:12d6:b0:5be:588d:a0dd with SMTP id 2adb3069b0e04-5bfd957b713mr1290328e87.15.1793416678819;
        Fri, 30 Oct 2026 20:17:58 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edfdesm364938e87.5.2026.10.30.20.17.58
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 20:17:58 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so12419351fa.2
        for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 20:17:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxstVyuECQgjfaLELeqlcpQtFOl7ztXCV5VFfu5FFkWZE91itFRtnD+ad7hhyV3hMFVJaggqVYM5pGE@vger.kernel.org
X-Received: by 2002:a5d:5f84:0:b0:48d:eec6:308b with SMTP id
 ffacd0b85a97d-48e6e4f561bmr9818154f8f.21.1793416220997; Fri, 30 Oct 2026
 20:10:20 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020153652.2907186-1-dianders@chromium.org>
 <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com> <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
In-Reply-To: <CAD=FV=Vt6hgGJuYtv1_mBSQztWQBjmDN9CwLtVxrXcyECGx2-A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Oct 2026 20:10:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xxn75bf6ZjRPyQ5jfWwxx9cPe8_8bV6qzAXQc+gckB-A@mail.gmail.com>
X-Gm-Features: AclHuK-bghq4wzz1qNlwlR04GGQ-u_3zjoGTgsEW-iZ0A7dRvqdHdSoL4JcYqzo
Message-ID: <CAD=FV=Xxn75bf6ZjRPyQ5jfWwxx9cPe8_8bV6qzAXQc+gckB-A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 30, 2026 at 6:09=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > The FIT_ITS path is a second way to build image.fit alongside
> > make_fit.py, and much of it repeats what make_fit.py already does: it
> > puts the root compatible from each DTB into the configuration and
> > compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
> > /incbin/ paths and a shell loop in Makefile.lib to do the same for a
> > hand-written .its file, and the .its files repeat the DTB lists from
> > the Makefiles.
> >
> > Have you thought about extending make_fit.py to take the per-board
> > metadata (e.g. from a small file next to the DTs, or via
> > FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
> > in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
> > logic, and trogdor would come almost for free.
>
> I certainly can do that if that's what people want. ...and, yes, I
> think it would simplify some stuff in this patch series. The
> question is: what does it look like? Is it a file that is a list
> of devicetrees along with descriptions? The list of devicetrees
> would be to limit which devicetrees are built into the FIT
> and then each would have a description. ...and yes, that would mean
> it would need to be updated in parallel with the Makefile, but I
> don't see a significantly better way to do it. Yeah, I guess that
> could work OK.
>
> If so, I think a bunch of the patches in this series will be
> dropped or look very different. I probably won't directly reply
> to your comments on patch 2, 4, 6, and 7 if we go this way.
>
> Should I give it a shot for v2?

FWIW, I did a quick prototype of this, and it is definitely a much
smaller / less invasive patch series. I've got
"sc7180-trogdor.fitconfig" and "lga.fitconfig" files. Because they are
easy to parse in python, they're in ".ini" format in my prototype. So
"lga.fitconfig" looks like this:

+# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+#
+# Each configuration description encodes board and SoC matching metadata
+# for downstream packaging tools in the format:
+#   "<Model> (<key>=3D<value>,...)"
+# where <key> includes board_id, board_rev, soc_id, and soc_rev with
+# hexadecimal <value>s (in any key order).
+
+[lga-blazer.dtb]
+description =3D Blazer
(board_id=3D0x070406,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)
+
+[lga-frankel.dtb]
+description =3D Frankel
(board_id=3D0x070306,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)
+
+[lga-mustang.dtb]
+description =3D Mustang
(board_id=3D0x070506,board_rev=3D0x010000,soc_id=3D0x0005,soc_rev=3D0x01000=
0)


Happy to post a v2 RFC showing what that looks like if you want...
