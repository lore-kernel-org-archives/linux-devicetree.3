Received: from mail-qk2-f38.google.com (mail-qk2-f38.google.com [74.125.230.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0976C445AD6
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 10:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.230
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195949; cv=pass; b=rwj4jMGDhN+UkmS0lrh6+TIAhCf8WgOVTD1q3QFlwe+x6V6R1UHw73VCcOX7ZubSjEUU+N4Wa1gzbcQxV7564C2gVZj63nMXFJRKKR4nmqkm9KsExLlxCh4nHoIbbUzLtdK8VS6h2ef2BU0KUujunfp5ysIvZTJLZgIrsrGoqMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195949; c=relaxed/simple;
	bh=ucvU/kgR0f2PerJN5pmTYU8pDaFbpOpWlV+rcfhn4p0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWmvhpTB0dutyEYtpbljkZ9/v1eRuMrys1KfUWepCUCQQLu2lgkf16a0NYwjjsY0VQWdXubPzw0d2cf18glia4W03VtLl809GEQOdy03JybBFLPbz6TNsBEM5rpQUV9b7xm0qHVeHvKlYRv19TMnp0pltUPymlrmqTCtlbI0gqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csMTY8Ox; arc=pass smtp.client-ip=74.125.230.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csMTY8Ox"
Received: by mail-qk2-f38.google.com with SMTP id d75a77b69052e-5339b4a29f9so14653831cf.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 03:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791195947; cv=none;
        d=google.com; s=arc-20260327;
        b=f2z0HoN3Vlkrk1t5hxBDyXHLLGfbMQvcY1A9BOAnrBDa/8fIbOQOL+O2aaBDZSejaH
         1zlfiREFdfDFEuD+NyXwcJHpTqDwgZkPt2IwtewDI93L1uh5NnP6rfuaccmu5bYGOEtG
         UWu+P4rZ0bqY4kbjT0xBj9htEYP6JeCRrsm9NUcwozOP5Vi7BS1mQ1/WeWbN2Ur+kDlE
         +VI8NZWqwbB5IpCkrvR9DvH4H6RVopUrLTSbTPuLT+a2zW9JaC5gkKFe71lciCn4KT0S
         YtN/imIs1VnE+UAtyLId9hHGHN7LSL8fFWMxfj3lEL0lXMH1kd89TiVnpxEGn7Wdru1h
         KNDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ucvU/kgR0f2PerJN5pmTYU8pDaFbpOpWlV+rcfhn4p0=;
        fh=HLc6FpdWLO1l5R0Bs0bbZc/+51yiDc5h92OwVQBqqHg=;
        b=Pz/tv7zqKVqrpF8pejdUPBk/HO5tFKWwFk7dgR8wrvuUwAXsjSitZtLrJ1xIMfZOws
         NVg+75p9wq74ilWkjHmJHb5qu/PUf+ta0I35qPBE5p05d0SIo65jEjlz5PGP9wJKxYWi
         TfR+r4R+viBfz1GkndMDqexMyDO18HAZ8837duK7yYpS29RFTxBR7Omm9VSK2rdUen6g
         0QOyWOSQQc+czcsYIVncZtjNQRWDife4+GO9gMx2c6KNzzwtExm+N0zGOQ6hhG8EWo69
         PBUGka1NKppNlB+qOmF68tU9wJ96DabZIArdFOL9uR7rcVq7N+3gdfd1Va/ncGyZX22r
         Rqwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791195947; x=1791800747; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ucvU/kgR0f2PerJN5pmTYU8pDaFbpOpWlV+rcfhn4p0=;
        b=csMTY8Ox4rs2sHwbYAe4kdLfZHcAdNr4baJOZ/JVveY8zWFTt5wYIVohDWjQxoFcoe
         xQd1wZ5r4ELNp5/7I7jbVDfy/0D3fcKN2QPXg+2pV/VF2Nka0dZaRuvPdzRiV5nfs7da
         muDKjwY3GPCsBCF2D85E/7Vya09Yq9pOKp4XVx7/UFdldGqTCnXtNcQ+DDqwAmzEBJy+
         rOTuf/+lXuGbgvXfsOJWpkgl6zLULtLhshH6RezyNxOrqoo9ht2lh6Ga7KZaarFY1Vyq
         qCRq+LrNnJhIASGng0U3b6yzLMCnt+ujYnJ+dkwelGG5BlrrkNzJSYfBIzhmxPlb3SBu
         bjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791195947; x=1791800747;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ucvU/kgR0f2PerJN5pmTYU8pDaFbpOpWlV+rcfhn4p0=;
        b=L1e4R1p2yrQzC87DWsRKEvAkgRqSZpm/eIZzP90EdpF1g1ZH7h5YW2uBOQm4KT+xyn
         BjZUMH5IHlq6evC7U5C4XD2rdB13zJ147FMJSE7itI55iwjp/LcSF2ZIZ1Jbe5kHOJzh
         WSHTnk2U8GjFw+Z4L2I0ot3JQgHSeAV5092pOrG+g1SlvPpYKOHI5GRB0o4Yqz/Xf+Uq
         E1PJE4Tvm5tHhxZ9E7GLWvA5t5bC5Z/HKjlBSorfyBYwUKJqoIDMVuKTZNQpnufpDzz7
         aUqydSNa3JhlVRRrldSZqW3A5LTOLw96RIVqNsBsI3l6GzG4kC9vAYvPsg/8LsJFROcG
         vMnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwS8rZYFc0guesNiYFlyzEXkZMT8yD+lVxR4NjwWxdvofhhq9/g0uFKsbcRVXbpTZrJoPO771UPURV7@vger.kernel.org
X-Gm-Message-State: AFuF++lGCl2JvDEQjRIkoOiITPF/28U8vafsio4e27m4QlDcIZcGYr3O
	HrEIwLzKpsMKMDqhYbDG5uSKbuPyMY7qCrmWETE/ZgsUoqBK6AqRBqF02CEOacnvmXWVkeAn54j
	x/yFEVwO7psfTeu8C+7FOUHTYdKLCsR0=
X-Gm-Gg: AYBFou0eU9WB4hCqqI1uUykBetF5jclYPLTf6EQhARzG3U9Di3YsCnIlzJ7eWFayPR5
	pmzZ/IvllU09NIkvP9Q0HRH65GPTZUUbEQ0XVVBe/SFe3MK5/ZoCDWl9HIiYciQJClATQzcA09M
	NS/P2h+96cpAqpnFCriU4VA+cnMfGoQUyieu0R4rljhchk0//3xa3jwWJFe6D0EPDAwxjWwOfF8
	tBxA2faMqwT/12YgWuetp3RNI9QY1T3DHPhmeXfq1MCuu41+C2MkskCOQZ9LgAhVII+DREtBfd2
	y4LzNfJL4kK+ZAZmFWvQQ5AuC/i1PV4uq6eBYBmBCnCtrJcWhl+TYGLWnJz6FLncJuTod/STVDm
	2E/6PWzC/
X-Received: by 2002:a05:622a:4d45:b0:533:972d:ff95 with SMTP id
 d75a77b69052e-533cbdb3d51mr186553931cf.34.1791195946812; Mon, 05 Oct 2026
 03:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930071826.48811-1-ansuelsmth@gmail.com> <asN42bZlK_jwS6uH@parshuram>
In-Reply-To: <asN42bZlK_jwS6uH@parshuram>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 5 Oct 2026 12:25:34 +0200
X-Gm-Features: AclHuK8w1WLWfIar1hB2u7SB0lgs-cuuBNgIsiH-Khygv0yU4CoS92D4l8-G0p8
Message-ID: <CA+_ehUw-Lx0wvN5O_9QFZb7USV8xBc=_z+7dkkB1ZW6owv3jVw@mail.gmail.com>
Subject: Re: [PATCH v12 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 5 ott 2026 alle ore 12:15 Vinod Koul <vkoul@kernel.org>
ha scritto:
>
> On 30-09-26, 09:18, Christian Marangi wrote:
> > This is a major rework of the old v2 series.
> >
> > The SoC always support USB 2.0 but for USB 3.0 it needs additional
> > configuration for the Serdes port. Such port can be either configured
> > for USB usage or for PCIe lines or HSGMII and these are configured
> > in the SCU space.
> >
> > The previous implementation of a dedicated SSR driver was too
> > complex and fragile for the simple task of configuring a register
> > hence it was dropped and the handling is entirely in the PHY driver.
> >
> > Everything was reducted to the dt-bindings to describe the Serdes line.
> >
> > Also the property for the PHY are renamed to a more suitable name and
> > everything is now mandatory to simplify the implementation.
> > (the PHY are always present and active on the SoC)
> >
> > Also other unrelated patch are dropped from this series.
>
> This does not apply for me and Kconfig seems to have a trailing
> whitespace which checkpatch complains about. Can you fix these and send
>

Sure I'm doing right now!
