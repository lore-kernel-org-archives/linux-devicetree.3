Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8113C0A14
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555615; cv=pass; b=UUHW1bxxa0DTFwWOtIEtcT+g0/oYy9XX79RFg5ruvFOoiFB9+sWnN+iWP2hlv8exbHFmrvnd393oz+CXcgHSp63iTaGxiZLAyi2Ptyk9UherzGc1jFZXJyGAzG+kJknWuvN8wriSPVWV/hsgEs3Z8GDRiSc9r8NDAoCAwGXqejM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555615; c=relaxed/simple;
	bh=I4yDMq8ZmDr5oaZiEBM9CEqvD/HRefTgkgtwWuFh/Zw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HsAw3zhR8RNRk3LC0GWqyPEYx8cJ4hWjiQb7mrEES/u6oiHKtFE20xcl2MOl8kAp8w2kc/d9C9Nwv+jUYClGhQWEC79RZQRCZc9ZjSWUj9IvndO6WluCGZecjHc6xcCmpnLMlrbrlxLpkRDoed8VDLl+8aNYo393LkFYeXPP1Zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qTJ7iXH3; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qTJ7iXH3"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-43cce8288c7so223013fac.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780555609; cv=none;
        d=google.com; s=arc-20240605;
        b=VQbJ3Vh4CPUfWyiEwABQAp5ioZQvh8f7KCi/JANwfUgxwAx3cbGLoGkuF31goWjE5N
         /dX9QdOkbqagPqp4mH4dKXoZHpgOaxQZAvaYQNohbTh9H2jt0GBramd7v1lnZquDe7j7
         t1TFOBceOBG3CA02EkW8x+BCTUvy8UfmOZICcPcBNXZCRCvxhTEyCvwRgDV4p1uuZxf/
         8vSKQkZfZxRc3+GhAJpk5O1UkKY4ZIEIMMte56vTl9L6LjdJRxlGpR/LBaDZhw+hxFcu
         olZSXZtjzgSeZ26JuYXgLf5VptCA49fqkweixuSrOEoGyhsDOWUW2YVH4auie1GrdBp+
         cJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I4yDMq8ZmDr5oaZiEBM9CEqvD/HRefTgkgtwWuFh/Zw=;
        fh=6x9uhpCI/gq+YqWyh60QozKX94C8TIGbO7qpTkaI1lo=;
        b=h1/8vEO7CRO4gBkRysBrK17ZmdbOkOntKeZxCTKIabi9+rv9W4J+jE4Xl7TSTFAj5o
         pj+Mteih0LRjWEynowIdsfkY3dxqBT/6xLUjoVycCSQat7sFQBl9WqNPGXw0Fk3ifd1c
         qGwdGb3TQrxFBAarVDk78PnGwnQBqDr0WxXOfovNZwB8rtUKd1Te5FlpU9ZUCEumQflS
         QLlTLVCtnLSVrZdEk6ZDBsApKBzBhx+o+VKuCiKBmghipJWXHW3AyPcNONn9NvOSFBNW
         wBxoC8IuJZlRmbBT6sMjicysvbx8b4kNe/xJVxYob4Jyt1xUaIqfkwdKVMWHRL3hA+TD
         +wkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780555609; x=1781160409; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4yDMq8ZmDr5oaZiEBM9CEqvD/HRefTgkgtwWuFh/Zw=;
        b=qTJ7iXH3fpLRVkDgLWSAmiwTtySq+sothIi6klf91JW/42bxc8iSb6ymdyaiwF4vgk
         JT2GSuLyAjZ81YHVw8sMg8iWgCeiMJRIRPJzCK+GtvxadiZjx6gRzKJx0A0u5sCiKr9O
         d+TbUpKj7jIM9t97cQ0sYNORwoyUfL4BQed241+xylVlvQT0cgy4jdN7JO3TdckrDb+j
         5DyYDp9BbSpiZUTWrTcan2gaaN1ZWxsRNqgc3oRBYPj+u4dVM1e8D3P7RVb/Fwq/WrbW
         42frYqLErRUvz0B57ukY+yjmieIGRwBJ/horXkYMMNunpmkbttMdkEK2x15BcWbPNA88
         VmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555609; x=1781160409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I4yDMq8ZmDr5oaZiEBM9CEqvD/HRefTgkgtwWuFh/Zw=;
        b=pxMSUmk1qZdE2ZBvVBevgrXdK0cVicjZ3Ys0N7zVPNsAAj1XWmPDhj91RuyoMI/o/b
         K6GE7CUm4XMQp4WLrzDc0QDhoG03eLWJtIo13qT6rwB1EQgnMYv0/x5gwAerh+W+z0+E
         DkaRRZzZiwS43qfQGPFUNRLTIBE3/xm190Ljb0fH7JNRroTtUWxdDrTyjob3yhJqBXQT
         1ia5E7qS/Pcbx+4e7vQqJYbsl1yFBDLWY16Sc5+yPaY+kcmgzJNb/wbmn0gyKnKVqrSm
         REbtALeb4lNjIPp2ORP/mw1LgmJQkYfaMpmraiEeuWPjReW5HidPZ4MXjixLNmb7nwqc
         YufQ==
X-Gm-Message-State: AOJu0YyvBMpTBPNLSMQOVJNWwkvJlU4VCrOC+FuOX+TlYeac1Ocni1Dg
	BPGf+GsnTD+Z/MTAAnd9IkJ04m61fcE9qEYen0qQ0oTGUorxZ/ClT2IEh1GmVBtN4DBTpL6itBh
	IzhQlqs8A7DG9JXO4wQBbjKHk0XzF3VM=
X-Gm-Gg: Acq92OGb45F7/74ASlAjsxnkLSaydvHV9z6y+jgVBlpC2ym4R1Fn7LrSbiJEspJJbFN
	T7RvKrSwykriTSPyF4wmo9b4ulb8VTckZFiucrFt1LuPJfpJIittdH/bAeVwixdptR+vZZs5dEv
	5ek99lGlsKEu7zFnTtrJ/HPcfE84J2wqGDdAKcgmvTRuGCuFCI/dHoAsxTss6NUvZE5qxUMD7fX
	n0gy7Tkw9mZGnmsDlcxpXZK/lx8lu6YLLHnzDIV8yHVcrLM8yeBj/quHN2nlSQohVFcesY+LwvA
	ynBXmLHQZikGFSMH+oTUEtY=
X-Received: by 2002:a05:6820:2d45:b0:69e:1a0c:123b with SMTP id
 006d021491bc7-69e47ec6971mr2637278eaf.24.1780555608862; Wed, 03 Jun 2026
 23:46:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-rva23u64-hwprobe-v2-v3-13-5529a7b28384@gmail.com> <20260602233750.B03631F00893@smtp.kernel.org>
In-Reply-To: <20260602233750.B03631F00893@smtp.kernel.org>
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 4 Jun 2026 14:46:36 +0800
X-Gm-Features: AVHnY4JQnjs7_bMYHUUcNhOXOgnpJynf1huEM1b6suF6X2cIO5M1zEC4xtBl6pQ
Message-ID: <CA+Ck9FaHADhss2sV=Z-vX4zr6VL+X=goFX_vznYE9JWBGCjwZQ@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, kvm@vger.kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 3, 2026 at 7:37=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Detection of the RVA23U64 profile fails on compliant platforms=
 because it strictly requires the unratified `RISCV_ISA_EXT_B` bundle inste=
ad of the formally ratified bitmanip extensions (`Zba`, `Zbb`, `Zbs`).

I disagree. But I would welcome more ideas.

My reply is threaded in v2, FYI:
Link: https://lore.kernel.org/linux-riscv/CAH1PCMa-5W9PsX8cDLUk6-MkcM53HOz2=
QtaxCHd+XOr7DgH5+w@mail.gmail.com/#t
[1]

Also, when Sashiko says "unratified `RISCV_ISA_EXT_B`", this is wrong.
B is ratified.

BR
Guodong
