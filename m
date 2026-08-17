Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE0F3F12CC
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 23:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787009156; cv=pass; b=fgDIXyayF1M4QD2RAPQTXXnlj0WVunMpYltjWpCryqCBU/S8ewiKvfbhZJofe5ZRCMAYZQwb0LvtpPXkBsnjpef5Kxc+VLEAAhABkPeirXgfYPIpw6xdG+AOTr1e9lGbahos3QlwzcWZ3f4gDTga+o7ONFkvUTPbPHNJhIEdWAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787009156; c=relaxed/simple;
	bh=g1AzLZyhhmggt5mRW1QxTaJqgkbHRAIppDxF6F5qNoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ChXT4SfpNoBIFAwrH9m5vz8sV1Cp5FWPzsXzV8An0lkGPy9Sv7gl5QFglJT/zIzrFu9IrDk2bOABfO5DrJiXdnFfb7QSsjt7oaFIc7pHLnjz5lJtvZeLkQ4esz1RsUAN6VA85a0F/Rb6AgLLvPCmeWgG1frZ8yRM8CBQDzEqgnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxvC+xRM; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxvC+xRM"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69f4acf7047so599672a12.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 16:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787009153; cv=none;
        d=google.com; s=arc-20260327;
        b=R0AR4BJcOTn5PXx0hdKoJAFllQe/awCOvh7IIxfNAe9CVpzNPQotO7jbLfx01A1szF
         nENHC81urcwRr/Wk8wNROVChe3ZqZRxUPKDG1g4iKSK04ITMDX6f9rGByey/1+Zk7ocb
         32npq5uHOWcuIKM8mx6gQZVXzYwyWzJ8unqiqu8KVWG2V0/8jXLzkAoElWRbm6I9RM1e
         K79e4F1YX+oUGSkMpi/2X6BgAlvK/kbYJYiE1ZTIVqwRLFd4WM0dt6b7Ph37RYUPeprT
         SwNbShqmik5Eg74Lhq4U9E5bvQ3cPgQCVTYr0zqcwzt9R+C01/R7ENOtZ+cAdBNdlUkv
         L7Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1AzLZyhhmggt5mRW1QxTaJqgkbHRAIppDxF6F5qNoA=;
        fh=O47rUB5K4rU66EABhKvERO34pY2g6exuvS/Ke9h+3cc=;
        b=fmz1LTYvss/gpGsvzklip39iPukn3SZld6FFgKkMLGnffHMpVP6VvUU095g9qobHpa
         9WrS4Qqv2VLuJn5rBMDWRVXlq14VTFLmpcwCn/Lri9C/nHMeEFVGrneUUkYqHYMOS0gP
         rNg0Z0se8dtVZOimIt+fJE5LwzdUowM1UqH4p1xCf591sS5shaWjzk/pYmxBIaMjaVvQ
         dKYI/ooxr1uyWYuUIqJuCtes31bjlmyEkQ6tlaR6+NKsEvZKoUAszFliP9m01UFDoze6
         H0guBsaeboJ7o0ts9fjSWVB4Y5iKJKKS3imNR0WaQMFhpnV+rqujmhrIKTFTS5wUziRP
         XNpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787009153; x=1787613953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1AzLZyhhmggt5mRW1QxTaJqgkbHRAIppDxF6F5qNoA=;
        b=HxvC+xRMUy9+H+wkU3bP+yruTGMlPShIvV6HHKDfNLfGCoGy4GMAbU6ek5zoNNbohd
         a48sCF/lw3PI82GZJg71mxzU9HV6hGie51H9TYQ16VZ7GEJ/LyrjAea41OlHc2PcSE3/
         E/wA8oyBFEXecww4fpC/w7nxyGYLX29aHq3bw01uAwhGeGRx5EZHG9q/FT9m9ciLXLci
         8awfJ/d2DIrEZHWAtriFcmjL5e6X5qGoagTBPuICLYfBBBqPLrcA+NB0cYiSO63mbr3z
         yu2iBcEBYd3b5PHNcrpOaFYn7+Z2CkawwY4uUYh6k9vKCRRKSDvKtwGMZ8J8XHO6jH0W
         62oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787009153; x=1787613953;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1AzLZyhhmggt5mRW1QxTaJqgkbHRAIppDxF6F5qNoA=;
        b=egXheOolKqxrC4kT9LoVCkLwUNcpzKmeLohdWid4WzCuNDBXIZ6/ME9IOLZomcn9tq
         Owz1psxx9cj36LXU3t8i4TbKNeEq9mQfUwLWoAHIPD+MdZjADXNELtasavvmF1kMX9WY
         Uaq7hvhnM3MKf2ukyZGBeIXMOKnjwLWtumVpk5w4ce1Quk+fa5oVdklm0DR70SrVYoIj
         ZSiwkS2QNg/bLs8wAkLJZVk53c1UwkJmnlzQ+2D02K8USt4HR93hFbOOqtaq7fLPEVUx
         NXFVfOngoUsYIvdgYByLTHEC+mQ/QdyAkvOjD7AGoQN3Pw4kCvsDhzlKcCI6Wzm6PyV3
         izRA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3ICaDWwNN1g/oS7H0GDJdZ/iuyEKad6elUZ7HiZkBLpKkmK9ANT3e91Gi7PvwRHUG9BZ2O5jYLn8R@vger.kernel.org
X-Gm-Message-State: AOJu0YymhwCFd/wUspubTdOV5W3VD6X/07b0QOo82cEKmjCyT2/lXK4A
	ouwkOwCyARsItN1UWlxO0OvNxOc3TGqLCsCxpoeA1dn6t9dVnd4BEixJBbOQZ1tjUy/bfYaGizB
	lGvKyC5+FCHJwlWa0E04EwPmnrv8eSGI=
X-Gm-Gg: AR+sD11GAjY4IzwUEoTWJRIsUAYi7cY98kSp4XrYujnlCoP7Y7RbkzbQOo6MU25zFlH
	NyC6MmgF4vcn6FIuakRFxXjVZp8MTE0vj+vMeGevaziLwXadmNiy8SdEWtEBwAvHroPVkEXuh7B
	lt8SkSDt/ovD3/eccBJJiNI8JB2RqmjZajkxec12Lav2Krm+eKqy//GuXHxbrqIufP/tkkvHFb3
	d0Ls1asSGn0Pn5Jf3+2n0tF8fJsbGr6HekiICIyCqQRa1OwrN78/AWeLsOjS9yzXhRm/dzoIgqv
	EQ4trB/YifEIXvi/FztUnFJYhxBZPCINILmBn51ovqDo
X-Received: by 2002:a17:907:c1f:b0:c12:e4f7:9a0 with SMTP id
 a640c23a62f3a-c212a17c930mr646591966b.2.1787009152807; Mon, 17 Aug 2026
 16:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com>
 <20260818-ti-am33-usb-v1-1-69ac5f92df45@gmail.com> <20260817215829.AB4321F00A3A@smtp.kernel.org>
In-Reply-To: <20260817215829.AB4321F00A3A@smtp.kernel.org>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 18 Aug 2026 04:55:41 +0530
X-Gm-Features: AcwNN1W_ixQgq_Zd-BIBGZqubOpNe4fyzSrpTQJ0Cu1HvNeHF6H9Fw8rcF7uO0c
Message-ID: <CAOWyW_4YmQ=Dkd9Wr57wxCfWJKmFVOA7BL9fkTiu7NcL=gFFtA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: dma: ti,cppi41: Convert to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, 
	linux-phy@lists.infradead.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, 
	olteanv@gmail.com, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 3:28=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The newly added deprecated properties `#dma-channels` and `#dm=
a-requests` lack a type reference, which will cause `dt_binding_check` to f=
ail.
anything that starts with # dtschema already defines this as
single-cell so no need for any $ref

> - [Medium] The `interrupts` property is strictly required by the hardware=
 and driver but is missing from the global or variant-specific `required` l=
ists, while `interrupt-names` is required without `interrupts`.
yes , will fix in v2
