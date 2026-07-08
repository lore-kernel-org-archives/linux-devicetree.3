Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A708432BDB
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511279; cv=none; b=aPSG9N5HtJ2FRfAjLhOejJoaJUgW9LrfwKHZ4G7EwdED2Igk6RGfaOftEAyEVyrmXnrDSUpdqG7ikZAh34xHlSqrgkPZFsQk3QjUr8xg/4fuu6J1RrvxxSUlcr9iBcWMw75vmC2Gn8meY/XVKpu+Z895nqPdTvM6K2lyzV+lOaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511279; c=relaxed/simple;
	bh=YgWdbsJ8UAjrSAc8lxvhYVlBDW1BX0UBIoE3vQlrz0I=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HdzWoktWXjJgWOny7d1vfkYOvefHCk/GlA5l7dapTh4dx2GIM2PNIXyv1EhiJMzLPFJyOzPJwheJ+VSbdB9lFYOey3I6DzNpAJEI5ZWomiMwML7HcZTs7btL5AMQ4ovlh1u5FwZcu/Jqg6mD0D178lEPFZr4kHi0CF9Iyve4YFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cecq+hQF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cecq+hQF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF971F0155B
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783511277;
	bh=Is/wl9YqGLEOs03hX4R7RoncNjfkI3qNnoxCKS4Se4s=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cecq+hQFxMrWt7ebJsexLm3Vzm73NiNjjbaqCiTtxFpKDymd5YU9hUS81TdwlAACD
	 5Fn7eN/AhE9DyxNihzwkAymgszg0+UEY5Q/+7wIhPhEFCm4FNMV1EarLsXnaMiYyX+
	 opJ79E0Aq0slRlSxXu7zt6aJuleq6MWpMdhdNsyHMWaMydXDZaLgGMSefHOzorgMW+
	 y03i7BYlADWLmXxZg+KKqRcOQ/SbyVKyGdyClMs4aLjLVFeXdUaHM0xYvUcGQ86yam
	 HXiRML+IN0b4/3H6Mi89xzu2dll6oHp0oEQFWyxHQQve7RDxyQ1U+enUudodzQcOUj
	 jSlt0NaSDsAtw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39b1eb7bde5so4992091fa.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 04:47:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqsZOvk6ANL23jLKp5Rz+sPvVpGNAFfvF2ugEmiX87kV84ILAw15lb7X7HO0D0+PIaRRhEzQbC4ELix@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf62S1byw7a5pceQJuxioXxfbz35KD24sm79ba6dTDN99hnm5i
	TiJlWQgEWhKuUt04Tjg1GWA9RmhJcW3Jaf/w2FUwC2U56xicvwxEcy+4gHNispv1QS4pqXQ9yat
	PnvdOBNIc8EyLXmB/Tei6hb+0x5RglHxzXFoe9yjeYg==
X-Received: by 2002:a2e:a5c9:0:b0:39b:a75:e8da with SMTP id
 38308e7fff4ca-39c79852412mr4803661fa.3.1783511275626; Wed, 08 Jul 2026
 04:47:55 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 04:47:54 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 04:47:54 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <87qzlesfo7.ffs@fw13>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com> <87qzlesfo7.ffs@fw13>
Date: Wed, 8 Jul 2026 04:47:54 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeU0QuRozMscv02M59+a66S05Jm18CyvNE-qSYrY=S7hQ@mail.gmail.com>
X-Gm-Features: AVVi8Ccza8OJ5sr4vN3ioNWBzssDpnygJvxLLZvBUYfXYOw5sGKh-zx4pCfo0KU
Message-ID: <CAMRc=MeU0QuRozMscv02M59+a66S05Jm18CyvNE-qSYrY=S7hQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] x1e80100: Enable PDC wake GPIOs and deepest idle state
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 22:33:44 +0200, Thomas Gleixner <tglx@kernel.org> said:
> On Tue, Jul 07 2026 at 14:51, Maulik Shah wrote:
>> The series has been tested on x1e80100 CRD with both old and new firmware
>> and also on kaanapali. Test conducted with tlmm-test module after
>> applying [3] as test module needed to be fixed first.
>>
>> All 17/17 passes in pass through mode and 16/17 passes in secondary mode.
>> Failing test tlmm_test_rising_while_disabled seems to be because when in
>> irq disabled state PDC is not latching the edge interrupt.
>
> I've merged the first four patches and tagged them as promised for
> consumption by the GPIO tree:
>
>    git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-chip-qcom-pdc-for-gpio-07-07-26
>
> Thanks,
>
>         tglx
>
>

Pulled, thanks!

Bartosz
