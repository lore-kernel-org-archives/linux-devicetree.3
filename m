Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFD040A936
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802549; cv=pass; b=Tfiv/+SOarBKRrmHgP4QY3xl6yb4Ljv6hsdt0GT7I0zY+EQXwY59ukcIOQKPdVlqunUq7Tw4Kd/mv7zyX+34cEVQHB3XRgR8G+Y/CzNZS468LleOkgCe6wGdEQ5e0DEisDkDAM9s0US/ZnP1URsKXZNvHZecl+wfGwZQLK+jGE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802549; c=relaxed/simple;
	bh=l1EXipAKmMkC4QwXJ8OoHPfFNSosRCN5cyKya011Gw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ymla2l9/4KmcUQvWUs5C/uZYkrtQOpnfQUN5AZ0T6EndDsIiko6+v9fMVdtxjhjx+ClIaSnL2RlTaIWn7z2jqP4RymHD3qZRMDf4KFd66rir2tpdQi5iObDTLNRzGqEhrHVkijbW7i9HOp+5rY90/zGgCGqE4q2H7B65Ymht+X0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYX9L2CP; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYX9L2CP"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35834f72d94so2930612eec.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 03:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791802547; cv=none;
        d=google.com; s=arc-20260327;
        b=qTDZweYtkSNJMzEBkRO1aZBCtWNg2Re2ihN8hfi0Gn0BWeOcUB8aZpPrBMI00/9HJ0
         Q+ouDt90A/8bQMHbxGyG1u2N+8JKT3Hpg2dnwDK0jfSosYlDgchQQYwrQLFsBipuDX24
         k/RrXOZyzGy4NfNpH4cuj2EjfTZ5JqHcw43s9hdwaovF22ug0k6Mg1EZwVMQleQEZNJj
         uHBfkmA13kEEmt8yZUQ2SNPx6g9w0vnPxQLgXabZXvamwvsyDOPNXuaFIyhizxH9J36U
         Fix+zhxZslEdlPTNa3EjICt5rIN4I09NllBnqO/hvez+m0wzdcVNJ7//Uc7GOJueil7V
         tthg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+9ROzNBJNDCemx8euIOsygMH5hKPgnw7X8l8m/TjjpI=;
        fh=7xxxUZjt4grF9P7LFh0SHXzjwXXpL/RcbbI0IRbwmF0=;
        b=eBBlG0XHwTTCGzVK4PMlCKiyFNVOx4o48V1usc/zJ5TRrE5jUF8GpLAIU+zDW1pjJQ
         mIP6T03+EPbdSbc+dzotLOBo+Bh6YZBiu+QpiNloJZSF1XmWV1HfQTLaZF6U2jxUBFm8
         mCpuqX/Z5XOz63w57Y0hhSKGq4vLs71XTuPHQCs8pU6Vq251VIQtSZLtIiwYeplB7tj8
         vn63W5UXS2luHKOMk7XQJ1tedMV1md1sHw8ekDwsNoXNn88LMY5GBN6lwz45Mf4xzXVM
         mEU6+XxpqZ7LOmj4IG1yoyXiwjfbyDx51h5d8XmdlWmoEEsVMJNOvPmBxPe/BpbBZ3yV
         cMYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791802547; x=1792407347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+9ROzNBJNDCemx8euIOsygMH5hKPgnw7X8l8m/TjjpI=;
        b=JYX9L2CPwELErdnA2VR9OlUD1AcDPj2aoEDCkMXfTAvCz18j2lgC+sjlHvnXOeTyYL
         zf552/7Z58k6fEPTryNlTjpIYM8WOAbYmmVvWWn5euNzQvNq1cwZo6FbMfRiDPuQMUa3
         IOjeecMdHuouzpxIGddmb8WRfAoCIDw/G4U6Az9rpODAqW6fghbK4sQoib3WtX5Swuau
         xlMr0jESpTTtVDhr7B/oltKVA48Jsz35qtF+GLUJ8oNTmW/W0UXr3vKvxfRnXSx8rADp
         qukLI+YZWa+OP/8RKPgfMUcDtWxBAa6V4OlgmJ0IXmkBzwAdm07jZ+LPIjV5fVewlivK
         372g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802547; x=1792407347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9ROzNBJNDCemx8euIOsygMH5hKPgnw7X8l8m/TjjpI=;
        b=As/3yjjxA8xtlSUvJ8MuvSNN9t38S8D3lDGvbUPskbY9ryOSFrH5aTp7bIfTfAJ2hI
         n63JU2LbsdfpKe0w/u3X+zHJT0DN77GphS3GytnLH58a0Iu59JdYqeEt71zJoQnEtooi
         tf3INeKi72l3dBqzz/15E2y8RMLafbC2DW8/ViOXF9dm4xSCwXxPpPs82XzkEKe5mEfp
         ueFeBzO5n2s1PMEVP0n95I/nY9pPglNBU+yKtRPNrzDw44Jv8f5H/7C8NutQRfMNQLLf
         n7WM2V6bwM/vGRPOztLsIsX2FZmDZCLwYydVKEdj4prptavTmL6pEpid4hqRbiTcg3Iy
         xfFg==
X-Gm-Message-State: AFq9FYLZcLphWANsC5oEbyACW3ZSAKDSYGQORG57FSUa/f6H7U/cuSre
	RaNN3GXaukHCyrC7ZKM/NL07neRTlPNUYsb/sNMCKICe0jKgzYkbD2OPQWxZ15Qy7BkRcnHOe9t
	kBU6E7JiucBdeXviTqvwSAZj128YOBTc=
X-Gm-Gg: AYBFou3BJPlpaRYScCiyokUC5QvV/wL82fKaSnQsvoYVSZCbiJQlDlj2ho9kJKTjXx2
	gyqHgYZz36O35dhs4ciWgjB8a7AUlV4gk7MBgrGOPecphWwphop7sccwug+sYcTo/zUPGqKNjP8
	sIDaU8a7Dlqi3XhqPheps6i1mZY1rDkPN3ZzRFPdEWdDbqZnk0uQAup4Usp/F8PO+4lk6fyWQg5
	vkw8K8VYCqW+aA1ixqte0abh++suJYpA12eMV085EfXHXqxRQF15A8iA4pmZup5KKf1aY3aJlhO
	+Ke92qUjz9njNYCx3YwESE03KyeSpEKb6Pt+eoGZ7wHdJ+lmHqx/dW56kdOpQLAbuO/bF3VK09M
	zJwByD46YNXR2hzHH1EFasg3B
X-Received: by 2002:a05:693c:820e:b0:351:5b99:5f35 with SMTP id
 5a478bee46e88-3537df50ea8mr13679930eec.6.1791802547178; Mon, 12 Oct 2026
 03:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004154456.145362-1-clamor95@gmail.com>
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 12 Oct 2026 13:55:33 +0300
X-Gm-Features: AclHuK9-WY5HBOzJjdXhPqCGEm0X08eS8KVRxjYfB0CV_-KCl6-E-4-979CzLCw
Message-ID: <CAPVz0n1HOWAXMwfeCBV76Z+N+6mgynXW5GeMebnqYQubNDqpOw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] ARM: tegra: lg-x3: Add newly supported devices and fixes
To: Thierry Reding <thierry.reding@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ion Agorria <ion@agorria.com>, 
	Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 4 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:45=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add nodes for recently supported device (ALS, LED controllers, haptics)
> along with minor tweaks and fixups.
>
> ---
> Changes in v2:
> - added USB configuration update commit
> - added p895 power LED trigger update commit
> ---
>
> Svyatoslav Ryhel (9):
>   ARM: tegra: lg-x3: Adjust WiFi node
>   ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
>   ARM: tegra: lg-x3: Lower supported suspend mode
>   ARM: tegra: lg-x3: Add light sensor node
>   ARM: tegra: lg-x3: Add flash LEDs controller node
>   ARM: tegra: lg-x3: Add haptic engine node
>   ARM: tegra: lg-x3: Add backlight LED controller node
>   ARM: tegra: lg-x3: Update USB configuration
>   ARM: tegra: p895: Update power LED trigger
>
>  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |   5 +-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |   7 +-
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 125 ++++++++++++++++++-
>  3 files changed, 127 insertions(+), 10 deletions(-)
>
> --
> 2.53.0
>

Hello Thierry!
May you please pick this patch set if you are ok with it?
Thank you!
