Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EBC47D95D
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523932; cv=pass; b=I5zssWzyuLLZVcLggQUuZwjwLDONog4GYBgES2Mavvb+plz2M//VUx8dwxrB824ZIAgnEVmFvX+BStSRrdoeap1n6kYBCeij5P8b2dC1WAPD5RubYYe4lcQ8P8v+DranWA6osQBCGSZCykovswhFYrhOSGJRov4t9xWoNM2mjsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523932; c=relaxed/simple;
	bh=5kwna2xOk6dGjGj7gk7txAhtmP7Kn7mVAW9LcJaKhew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3lzH+ZwJefh58mIRryMXwseWQlUi9Zfi/oaG0O8cYoZKYsH350JV4ysp3jpYNXBD5YY7FvETCoEok89doKr6IHyZz7fyz/LHjIs3fTRlmhvemZOX6g2sF9faEHr6FZaA0ORkHCxzBonQ1bTByMb6CILBkXhTEbWfljV996rZqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+Ji8ewF; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+Ji8ewF"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9030f8ea3b3so12607276d6.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785523927; cv=none;
        d=google.com; s=arc-20260327;
        b=UNnFFlA+9S5geh1aeu6vKkh9h2lMZnUcG/jzLj3VgjwOFLRn6k4rEa0bD5ljqkktTv
         Itas8d8ot9x8BgcutXhN3+0Jsz4S8wRo0Tr9keobQOrhewZb2IUWN6xoSqp3yAsjTYLW
         MkEHVNPUvj3Y69/0SyR9bVMBiZgWFr685DMeiQ2RZ1HUkg2EX33zMLJsuTJ5sfvwyDVe
         xGiuIS423qrC36V1z6kJqWRDaHqHZfqE1VRJbTAnSi/GXpiW9Mk960rQ/0wOwtp2t3jn
         y1IdoWopAbkfD2bU1ffMLGaJf40xQ+nY9QQYaHVwx7QAvlh0dIR3S2C4qVQLvafpYz31
         W5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5kwna2xOk6dGjGj7gk7txAhtmP7Kn7mVAW9LcJaKhew=;
        fh=0BnYzSsDDm08Wc4K/tWuZZi4F3UeCGjF5q6ajYFww64=;
        b=MfY9CELqFPt0Wnd43X0UZBh7cxKsMivyrq4bvNG0sFbLfNNpCh4XyGmH7m1MqBIGZz
         mW5tcBFRtzmeyAAgPV8PeLuZ9MrtQD2XvKZAdS4FYqkMm34scZey9Mwu5xzgY99dSVzb
         ONB1mgRVv0bgsNL/2Y3uEUUTFPkwZgBv+dTSAJS0neqjdoFi2/6pkkfOhluNlZICdiXz
         Whg2vdGE7i6uDd6JqULmvAwR0T8NlHsHILgbYbaoNseUeFKjBDAodkJckZnXujvowMh3
         YPbQE8Xx9xGeWi1HuirptptRRbLiGVYWXyHwITehw6cejZsSp4AS2PuAiCznqknNTVLM
         7cag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785523927; x=1786128727; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kwna2xOk6dGjGj7gk7txAhtmP7Kn7mVAW9LcJaKhew=;
        b=C+Ji8ewFOYe+AobNptoD8+VPZX/LN/5DOyQN1RAALRxDUFa5/t9V/aQXFEnXJTA3w1
         Y25wEd2R7AUfxXiQY5E4EUOSB8f7kO19XO4OdIVAQJ1eyGjXkiKScLhf1RHhuz5+e3p3
         Q8IEbArvBe6lE2Ux6eYKhX1HZZeLIArTuKegsrbLvQa64xAgElPl5diTEL6Kqkm06WEx
         xvk98Ly6NW7BqjmBIQs2Qm2ac+tLpsFPIt3WtfG+TpVMYkayRGCkG9aJhXwtimzks5A/
         9rnn2ZxCyQKW7RvFOeC4t4EHeD9WRaC7B2WR7KJtbR/FEXvlR4DTx76vB6n9GlMTWcE3
         ylJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785523927; x=1786128727;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5kwna2xOk6dGjGj7gk7txAhtmP7Kn7mVAW9LcJaKhew=;
        b=LMfcKE8Lwq5Yd88aCZtY3Ltvx78SWUVBB6iRz8TxrrXkmUsTC1S2luDua9tIPKULOt
         0x3XOZqx4oQT/63S9VrVZn+LnoH9YuUI32RoOhLEEb2z86fsdXLcjalDfvWN00eUFQLQ
         0S6iKSUxe+Tk+ZCVGPGsmS/YigE9EI9sAiZE+c/0mO2znZr/DY7r4mxcTcCnKyMvl2qu
         GSU2LIOJA+hzVVdQTtAHoiYfaUEOQuSjpxU1FQ4uRjg08Wpu+7EVylKdC4XSVn3gruoh
         LI1J5hz6vOXmXX4kKe68gh3b/ylo53Sl+AjzDNgYYZMKf8K+NIkHGcrF9y08WIVkEXiK
         NWiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqxcn1ua39LmSkRtUptUDbRQ/ZF6o7FNq19pkjeQGWaT0heYnNYZ/hVDom8jg28DzyuLlw0VWpcCBNb@vger.kernel.org
X-Gm-Message-State: AOJu0YwGi+YI4Q7s8YOpA7whTM5p0CuwEqLklqXodQlYT/cxiRi8Q0FE
	8+9Zt1oGLY59IsQbCI4SsQH2slstsgJjPWrQqM0AYyT3/oDznzk7H2KdkdyinrE+bPcyz/G8zwF
	GGtIw5EuSmTPwmYxpuztkHr+e26y5E4Q=
X-Gm-Gg: AR+sD1331rXGSFub533Zu3w2RFwlkfBBQJHw6PJQHE5R1NSG8CLwcREvel3jYgjnfuj
	8wkgPMbEC2oHpWKxX+V95mR+ZWlyWq2JDJOxYu5YqiFIc1LZplhr2WorH7UFghI/Y0P1UFNuMfp
	CiVI2PvWPb5vZCqD9kj4Fjc6wGbcymh+DXIFkcomtkazk0lmALyvkh9JPHHL7qEOz8rfDM6fFNy
	iCPFEcepnIsn6XbUnpap/TeYfa8BUu0AJ26T2xWkOxliuNV2b27BDZ1w1+pyiuz/V3oXbRwa5+4
	vxn9pG4vOQ4I2kuj0sWZMgjXrMhSXUQvxwchi2T/d/Zy8y+SJ7IQF7J5mvaGKfRfQkIWvHfaYlQ
	8iG79TD+D5/7DKZfGe99+RtpjKxP2THUZfZTS81GsPGtmnD7qJ35SVyyHvXv2RqFLC1cUc2y8iE
	ZNp8B49To6eMY8T/mN0L+HnGrwUw8Kft7/IG8p3dPOp12b7sjYzg==
X-Received: by 2002:a05:6214:4303:b0:8de:25f7:98bc with SMTP id
 6a1803df08f44-908496a5548mr23058966d6.22.1785523927226; Fri, 31 Jul 2026
 11:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924085712.1040284-1-pbrobinson@gmail.com> <37220187-7369-4b20-8e00-0846ee0ee6fd@broadcom.com>
In-Reply-To: <37220187-7369-4b20-8e00-0846ee0ee6fd@broadcom.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Fri, 31 Jul 2026 19:51:54 +0100
X-Gm-Features: AUfX_mzQnZLWCFJQhCZHQY17kUuP3iVdbulRTa2AVQinjNouiLe0xQFMr_sqY84
Message-ID: <CALeDE9MfhU+hL-d1vruhCzN5vvb9LsR8YwDPOR1XmpLcygLbLQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: adjust display status
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Andrea della Porta <andrea.porta@suse.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hey Florian,

Not sure what happened to this, you said it was applied almost a year
ago but now I dig I don't see it upstream.

Was there a problem, or did it just fall through the cracks? Should I resend it?

Peter

On Tue, 7 Oct 2025 at 22:11, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 9/24/2025 1:57 AM, Peter Robinson wrote:
> > Typically non critical IP in a SoC are disabled by
> > default in the SoC .dtsi and enabled on board specific
> > configs. There are usecases, such as some CM5 carrier
> > boards, where display output may not be desired or
> > connected. So disable them on the SoC .dtsi and enable
> > them on the RPi5 board.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Cc: Andrea della Porta <andrea.porta@suse.com>
> > Fixes: 25d77bdd7df2 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
>
> Applied to
> https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
> --
> Florian
>
