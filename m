Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C626D424D73
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784896675; cv=pass; b=uOAEifmu8I/d0UD3MHw+mwZOBYB/sYBSta0fVNMvaMSHFKKWKgJAYKvcPkAUQUaiv4zm9OU66XTYy3d2ZsjoLFbn7e3ItqjJCCJ70y0MNWJKdAB2RD0BofktYF52nbYJIVPDMEsLGbIozNVSXw0RjbUI1mZGycP+6rPvcFxZ288=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784896675; c=relaxed/simple;
	bh=vEXE20UjUW8jHA9L8lniOLjS5XVJAtQYjXALCmuoPVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wg/3h0p5Ul/agT6a3O5g9HZAQ0QH5auhk8tjXXMO2eDtE4mHllga2Ymmkw3+CA9zFfznElpwWeLQSc4HAatTu0UXt1noEsHfASFfUiITawSjCgNZtPCdrBZbZTi7f+ZteFin8LurAkLBuV76P5LzwhNVj3EvmzHtGhfWQuSrejQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyMv4Q8Q; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyMv4Q8Q"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b2aab18795so364442e87.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 05:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784896672; cv=none;
        d=google.com; s=arc-20260327;
        b=jOe8Z4knFAYeYDXDjqgkpP2C6Uc28e4zP2uKqGj63MWUKCtMFyBOYtYBvFPfIqGTJC
         5kJIjMqiBskLImgbEEU6Zpjm8u+dmCDEU/rwcdOn45dnokgwCJjd7QtV+BezdRr+oiqM
         N2W+ajj1EB1VMb/W9H5BsBO1Q95TaiOQJIcqrFWcH+UHAXNdPHXxD633xM+mMIxXTcfb
         z1zkhbXhAecFHN44ATN4ivS82A1NKHccdLDG4cDdtKNQwMHERpYb4QysojZ5GXR5RuF8
         KqebZKXCCmZwlZEHcxfFU4nglekX7Qf20P7zmksuHR9Vi42Lpf+PsNgY8ZxCqiM+Mgfd
         YzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vEXE20UjUW8jHA9L8lniOLjS5XVJAtQYjXALCmuoPVQ=;
        fh=SiQBM+Of4pPVs00DNjDyxK9YKjj4RYTVfMTW4K4Hf1k=;
        b=AxWd16vApFJTVg7ckydWzlZcblPGq8ovswFXjF6ikSlkwDiFH6aKSZ7aPvU+mlB6vJ
         lnSuccKobw0XwiwkUX5sJr6GdTVuo946ymQpx3Bd/C0FDR0viIglf7U8/Qi8eB4SfZVO
         da5cdwvtoXu5PdU/GzTsN2uOK2D2czxU36TVHv6u9Buflzen4yBQ1w9+ebOuIIwoJ/v6
         UxQsTOHFkP1+i5GpZNN4BaaHzgH5KZwAAFEmJdKgktTekxvQY4feB3h9sT4xWcZnTVUH
         oNI2ciFL2U0f9MsuaP38g7ZHCO18rhVsEUO3Cr+nPzJzWKGZ/anlg0mhGnQ9jQvm1Tcp
         LknA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784896672; x=1785501472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vEXE20UjUW8jHA9L8lniOLjS5XVJAtQYjXALCmuoPVQ=;
        b=IyMv4Q8QTRgFvB1VDvWu/oXGbZ8zIyJi7X2/WgqSk8ALEvTRNqBeGIps72GVEuEfqw
         W+P7AtoRfTIQ+rzPDROiVr0BXs2JA7+9jvUQL/Tx/2V1jj/UKhTP8P2TIdBfVMYDwlAB
         YyO0cFyut60Y8QCcrk+8VmLAYZslq8yMmSpP/X167X+xpDDDS9RkOvEI6pYx4rrScKwC
         mo1JVo1d161pxNl/KS+WlxDNYZfeTc/nDsb7JCcCLXRMgzYmTDJNT4rFpBrAlUXcEYqo
         gHUavXB2p8SLEKiI0KVYUkrjw9sfrGaVkdskiBZTPx/A9lAiFOnL22V/D6yjXbB4wEwn
         Ze3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784896672; x=1785501472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEXE20UjUW8jHA9L8lniOLjS5XVJAtQYjXALCmuoPVQ=;
        b=bm09RjwTwQ2x3firKdWhKt17iI21oF0szYWB89Ed72ac98USHyymr4Z/l2vidnHcl9
         mpxNKyfyjLCjmNRCoo158P1MYKIRQzYJ/5ZfcHtiLtY9HF4WBaR3Ld6L42XTnhXv/gBs
         r87spxCD3/ChwcHH0QjxZod5NXgXKzlxdAyIZJYkz2c1cYtMrCR9Wt5Q7YvdhFvXEjp4
         NLlWCldf9P0TzBJEmjUD4W9fKKTIk+x+LIVDqbEOxpbQPZ3alX0EZH59mVXdvRTxkBvJ
         fjb5iL0FPscIlGdSI0JV1eJ883KJY4ZzYVVusT4fxY19nFoCccvCx6x+zQcGgQcg1GjI
         upGg==
X-Forwarded-Encrypted: i=1; AHgh+RpsoJJ7rBZFMmNFsgk6rSbHR3ooZQTa4RcRFfrASq0eyLixz4JtTPyP6m8N3P11QzBVSExiguydVMXf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvs2cVSBEHYrc1mEG5AP+KZjdRebTgcYq9XsAAAp3SGfUyd+0d
	P/cko3q6+zuINuATcB8ExIrYdknlQxSiv8x8UiHcH+sSkfyQl7YB7OrMtxlkNFLy+2XhlLJqXhT
	x5OivHBGp22SfIpwlfMXNPNZ0skhNadY=
X-Gm-Gg: AR+sD13HHhiKNMFj5G3FRChmn2FFud1ZG/aBywEg823E280P8G/LjivqRFriklydtoi
	VQMjA+1mpgtCdtdrkYF9p/RFcKiHtVefkCfjCNoAZ92bbOukkKX+otLHrrXRztoCeq6yzJ8TGOP
	TzZNit2VYs7G65o8JTISYAWoaPfQo9MPLLFSKnfoSWXcjuRCbZiZr/mhXXJXXtZ9ss6pz/0vUfP
	86udGLbUVNCmTcqGsCGkszIzSMOkYHcSrb6CMhijab9Jkj56WKTsUkN39BPYclAf9ibbTWmieG/
	+vPW6BAk/pPpobl5HLZgGIXNPFp65l86I0QLi3LRzEKAbilr6dQ=
X-Received: by 2002:ac2:53b6:0:b0:5b2:b004:ab9d with SMTP id
 2adb3069b0e04-5b2b2f6a707mr1282684e87.34.1784896671507; Fri, 24 Jul 2026
 05:37:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724103212.41821-1-stefano.r@variscite.com>
In-Reply-To: <20260724103212.41821-1-stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 24 Jul 2026 09:37:39 -0300
X-Gm-Features: AUfX_mwgknCi6WlphIv37dVpUoZ2x-w1U5-YTUZhiBpTOvf3BDpn5nA4L3y60I4
Message-ID: <CAOMZO5CkN4DidYgfMqMUuZ6mKC7VPR4Rq_Ux0kvcK0t8HhgqOA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: enable in-band
 status for SFP
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

On Fri, Jul 24, 2026 at 7:32=E2=80=AFAM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:
>
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> The 10GBASE-R port is connected to an SFP cage and requires in-band
> status handling for link state reporting.
>
> Set managed to "in-band-status" so phylink can manage the SFP link
> through the PCS.
>
> Tested-by: Stefano Radaelli <stefano.r@variscite.com>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

There is no need to add your Tested-by tag to your own patch. Please drop i=
t.
