Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364635;
	b=jDE4PXvC339STVhxp/INLHgu8aUCJxTei4giKxYZ3p2CmqckfPFN8/KgAD2YnAc7Ghsa
	 lHizpxl3g1wHfO/W+2KZf5wOwD0+/dtvnuarg4n4O+QBh1FJxodDXvMCUzjZwRUIo1z2U
	 vfSMvsdggA7G3mkphVWk2CVItczJVwHVSxd0COJCkWpPv/P7+MTsyczyBEe/Samvn21Nv
	 jTurueQ7EviniliTqx65sT3qOKvmPHLlatzqi8drSyyRDQxUs4Vu3iZcxJRlmEDKSuv27
	 jvH63xHe+rgy13HmdVQAwJxsV+2YPaihxQ7rs7emUubr9rCVyRNFMV3Yqfrlr5Hb55w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Vmtd7JJoFGhykDhF0G/LsCU5RDkiJvwQnc8PEHADvFQ=;
	b=Mt5DDJ+qPSf6jx+UukYb3FSMyRifxxY0z2MDlyZWFGiNd9sj+ZUCA1kNWcPUc5QYZD87
	 k0F3LuPCCGB1deV+XUFTMt0yJ+hc9ss5wPOIuy1Ryn8dxoXx2wKHZAlfLElfn9vI3BNbp
	 zvBCXO1AXCpDIsZuIwBi29cVmiw31BVOpMYF0tRoujnjlJDJvA/50ODMlyLi61eA6vXNc
	 XA8/mpdmPz/NMPO/m6JAVIWx4KTdFxTT+OZ39ulhN+MTOxwnP/o3vHxRBfS+CtpmdDUcH
	 xaFIUgtOCrwoNP0agxOtworG2I6XUEy0xfFQkfzPgXzFnV/G5pjxWNPRKI3qyiBSz8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SXJZT+d+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D2860A2613
	for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D2860A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SXJZT+d+
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6af8620a7d2so748653a12.0
        for <Devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364633; cv=none;
        d=google.com; s=arc-20260327;
        b=AwmuADNZBTzyZyDIM6KRJP9F+uutgZlh2pa7ib60JidtGf7xoIlJaEi/pH9GbpDMiv
         n+aqP2Jdz0DVk4HEj5TLr/FDHH/a8qyFaYrDUdHR0yaWmt+wvVipVJW6X2WqoEZNUngs
         1saZ4Vi+wJqXhcq6v7OBsHrbLlg0Rkh6hFA3vqzl145quZsuCHJDjYUyFy+DmcRRjr3U
         8hTFtnYQt6Q24DgfdW19LW2bTQANb3ZsMw+LRjO7y7UC0RHXlBP8QovHw6nYkTW2cmdn
         MqmzJQejTWelq1WC4Td5VlmpawwarcRgPYJsfokmOSFWRXGr8Oax1JeGeZGscH9xCfrs
         F43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=Vmtd7JJoFGhykDhF0G/LsCU5RDkiJvwQnc8PEHADvFQ=;
        fh=7uXkkQJ/1psCKu4yoK+OeInhe1nfh8YK91aQ6M3KcAc=;
        b=H3s1laOW95ObxiThl9o5WRCRtIbynB/iEh7AqV+Of6c9l+q0xqX141XD80kXY4F+kG
         u766ISM7TQnxmPc16R5hS+mQHvd/Q+SEKp6TDIHZrgYTnxRProciB9hwADfqeR8BjEPu
         t5ftNZC+Fq0hXLWehcxO89ALZsjkVSB+CcTAYKpdlDvVp9U26mhXehI2w0cX5c50rik9
         5pzMNrrHpnNOOTS+Rgl9WmSl7x9erZNgiBUnfqZj85yxXo+9yQfu82zRbdI5w22e8rH1
         bkh6TNp61zt5DpS6RuCqN9TkIWM+6BZZpa6e/BZJXF/GEUAgeiKGQHMpVW7GylLTU6Qo
         YxuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364633; x=1793969433; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vmtd7JJoFGhykDhF0G/LsCU5RDkiJvwQnc8PEHADvFQ=;
        b=SXJZT+d+uaZZlF2rPrHT207P6kfJJZJDSd9/kfAJXowTchpwxDZ0iBAXspx9nhSLaN
         apKyQNznXrHhOYlHZ7DXhJ9tZ0plN9oQvAm+L7t9xu7p4NjfWcf7Zk+KXrakZhLyh0ar
         MAWkgS75WsxOLYHjTALeuDP8TEDTDnUiBGQyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364633; x=1793969433;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vmtd7JJoFGhykDhF0G/LsCU5RDkiJvwQnc8PEHADvFQ=;
        b=NfvrZFBIXj+sJyltO4py9acJQKuVDbg5frDFyrtmch8PFppA2rQ6MYzF8Q41hn3S0x
         RTLpedihI8xkawiuKzcnypLqAFaId8R2HFUw3ML9XOLboK1OxCEfBxLj0JVTDZebIdEN
         oQitCVzgAz7UsM4OSvbXiG+6nl90PBnk7quBEJ3hfkyqJbj11tACubsL0Jkr42ZmTYrq
         gPGFyhJNlYhUjbMF3EHOwhu5JyFP67CKTh/C9ZmeGuFnrJPO8PymLAvhLIlppQHAYSnk
         l6SRWb4k36hrqsfLTOqkSVs/UHwDrModOojaMnNlorgIHug2AFWnd7caZ2gh09nvmMDE
         wa3w==
X-Forwarded-Encrypted: i=1; AKwUvByl+vQTfnfmQ7KmDjViDMTKhYsG1Ou0Wt0e7qUk66GhKtNWe7dHhtFMxPDmIHaZyr2AIoYM1Mxauoiw@vger.kernel.org
X-Gm-Message-State: AFq9FYJTHY5Y1f2aILtA6jZ4ZNGXYhgyWucjRJ/7QX47XfTfOy2TAdGr
	ShCylHpFV6hMs8KZuAfFkYVlxWHDS6oCP2YA68gsAQWv3hUb5JCE+6or/f/EQ1x7aRFDC392Vap
	/3ReNNLKgcQP9T0jdvEp18/3Yd9iz7LTJ8g284cVE
X-Gm-Gg: AYBFou2bLQHq9A+CEbpjDCamHWoPpERiEfnsNok89evAg7M58SofO+1raKS4/BdmF5r
	KvySx/4cGpl3HCN0fRIs06fOXgMLnW0p94eqTzGGHOmfm9egJEE12uhyR+1eTTW9A/fl35B2SzO
	MaiElWNObSL4CXuKkfrDuQm1R3EFBWvGl/95SdxMPVVPmMwV3xbPy8oDvk+XsCqx3tyjUk8RKCc
	LXRLdzG9lD74BF9V/Gh8ph4HsOEvFihAmROO9F6dP9VqXgyvICYakpcJHfPiqtDe/S1TS7jLXcL
	NJ2JMtxoY5+F5IJs918jtn3rJsLsFzb0MLxK2qqfP+hKn+KQ0FaVzFk0bpGJzv0aMEdhNR7hNXC
	y+aarLpfLzeiaLuuGbw7VjXcsTeb8HGJgo9EmmT5DZ7Q2jUIugLFGoCDI1Evl862P80HH3as=
X-Received: by 2002:a05:6402:c2d6:b0:6b1:ef5a:6720 with SMTP id
 4fb4d7f45d1cf-6b4d497c52dmr1137228a12.16.1793364633266; Fri, 30 Oct 2026
 05:50:33 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:31 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:41 -0700
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-9-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-9-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:31 -0700
X-Gm-Features: AclHuK_Ix-y3tb_fdHHUHOXuGJaiv5uFLJy8cMpdGuMAdrZfprBlED_NL9u2V2s
Message-ID: <CAFLszThZs9Qx6c_qff4LUXPNpncUAO7LGygkyv6FRtGcxU88xg@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] fdtfactor: Add -S/--strip-local-fixups option
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> fdtfactor: Add -S/--strip-local-fixups option
>
> By default, `fdtfactor` preserves `/__local_fixups__` on `base.dtb` so
> that when `fdt_overlay_apply()` merges a `.dtbo` overlay, the
> reconstructed device tree retains full `/__local_fixups__` information
> (for instance, if an OS kernel wants to know which property cells
> contain phandles at runtime).
>
> When `-L` was passed to `dtc` solely to help `fdtfactor` locate phandle
> cells at build time and `/__local_fixups__` is not needed at runtime,
> retaining `/__local_fixups__` in `base.dtb` wastes space.
>
> Add `-S` / `--strip-local-fixups` to omit `/__local_fixups__` from
> `base.dtb` (and therefore from the merged device trees produced by
> `fdt_overlay_apply()`). On a set of 47 Qualcomm SC7180 Trogdor
> Chromebook board DTBs, `fdtfactor -S` reduces total uncompressed size
> from 7.69 MB to 634 KB (91.8% savings).

This compares against the unfactored DTBs, so it doesn't show what -S
itself saves. Please can you also give the size without -S, so it is
clear what the /__local_fixups__ in base.dtb costs?

>
> Add a test case in `tests/run_tests.sh` verifying that `fdtfactor -S`
> followed by `fdtoverlay` reproduces DTBs compiled with `-@` (without
> [...]
>
>  README.md          |  9 +++++++++
>  fdtfactor          | 34 ++++++++++++++++++++++++++--------
>  tests/run_tests.sh | 22 ++++++++++++++++++++++
>  3 files changed, 57 insertions(+), 8 deletions(-)

> diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> @@ -1234,6 +1234,28 @@ fdtfactor_tests () {
> +    # Strip local fixups (-S): verify that merged DTBs match DTBs compiled
> +    # with -@ (without -L), and that inputs lacking /__local_fixups__ are
> +    # rejected.
> +    for i in 1 2 3; do
> +	run_dtc_test -b 2 -@ -I dts -O dtb -o fdtfactor_board${i}.nolf.test.dtb \
> +	    "$SRCDIR/fdtfactor_board${i}.dts"
> +    done
> +    run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_strip.test.dir \
> +	fdtfactor_board1.nolf.test.dtb fdtfactor_board2.test.dtb

This rejection test has no -S, so it checks the -L requirement from
the previous patch rather than anything added here. Since -S could
easily be read as 'my inputs don't need -L', I think it is more useful
to pass -S here, to show that it does not relax that requirement. The
plain no-S case could then go into the previous patch with the other
rejection tests.

Regards,
Simon
