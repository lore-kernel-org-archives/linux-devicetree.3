Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926263F58EA
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 20:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780086325; cv=none; b=Ek+paTcBsi/LwIIL+RfAxGnXSii/kyiNdZ+0W+MeTxOJTkSQN7M/vkynkTp0msqskNJ3xqWaueWj+nZndfO3z+mTS532lwyyn2vNETHKga+BTr2xAKaWziZQseh7XGadisrhrKrwclTiU+gRxwopQk33GZFoSLlKYL6VqEU3Hws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780086325; c=relaxed/simple;
	bh=0WDNHiD+BZ65Ar6D6wNntHf7njQpuEgEybxUL3DMUEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M6BAqoo2DTDMCfjukTdDynzUUvJiHJz0sFGHK6+LRUpyinsY0tRN9qnelWzyG9AEe8aYgzCuzMC12shDii6cS+fNh+bD+85KPq2tXhNjpng9s5LaLaW8x+ogM8baieD/VXgS+YT7aUwxXPodwBdRbBN8uHODQ9BYrw3QF0m/MVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwvx5FXJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwvx5FXJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9811F008A1
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 20:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780086322;
	bh=0WDNHiD+BZ65Ar6D6wNntHf7njQpuEgEybxUL3DMUEo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lwvx5FXJilSw9OVDTMZ6br+yvBAtqOJd2dAeeZPzX4bZ5mlNfdaP2sTxkdVr/U6sd
	 X6owIdU/uFR8Hq99iC6hLEVZKrdhIPLCUI2W9rGsAH306lriaMdxqMpHGmy9X5h7zP
	 Vdo+1o8uCNQ5wrnsoz/rRsUUog0fttb8GcecAGnTwzF4qhXMMa/mhF8JrAJNNf5kCu
	 vRfpKf5I6ByqvgLR99r+W4eNg2/zUHrx1vjJUo9e0fERD4SV9S7nHZXVhUGV+oVev0
	 lTFH3ZJXzfXIXJKa6ALYow7g4r1WADa/2nSElb+oUum9gLrnRmRf8zy6LUgNbCROum
	 6WLX4Ewn3VwoQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa5ce4904eso868123e87.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 13:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9WjIcB40+GwfpYR72OOP0xqS6VUW+B5M9bue//71638Dpi32VFjnNv95y37ewD2uNHOGuXW7h77oxG@vger.kernel.org
X-Gm-Message-State: AOJu0YxCbQB7S6jPnzz/SEBiokwmRXmM1om3lMR2AZxbVsVADTA1BOS8
	elJ/T5PTnQxr/4baaqvH2H/JK7UgJsXlL0gIInZYuht0RUc2K3+stHMOJwVdl1eZl2lfQD2Zs60
	WquaXtLDbI2+EUeNvw+PmLr7I1uH8tiM=
X-Received: by 2002:ac2:4e14:0:b0:5a8:f6fd:f201 with SMTP id
 2adb3069b0e04-5aa607adf72mr422699e87.15.1780086320986; Fri, 29 May 2026
 13:25:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
In-Reply-To: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 22:25:07 +0200
X-Gmail-Original-Message-ID: <CAD++jLnK1PwLcjeFuv1sCYhe9WQLi6MN6S8UHO_poh28iEFKVg@mail.gmail.com>
X-Gm-Features: AVHnY4LXAJrI8t_ItYg7fZ1mD4eacY2tMVyI4OJFiM4v9KHCpnnptx1nZjWucbw
Message-ID: <CAD++jLnK1PwLcjeFuv1sCYhe9WQLi6MN6S8UHO_poh28iEFKVg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] pinctrl: qcom: spmi-gpio: Add bidirectional
 level-shifter function support
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	kernel@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 3:05=E2=80=AFAM Fenglin Wu <fenglin.wu@oss.qualcomm=
.com> wrote:

> The PMH0101 PMIC introduces BIDIR_LVL_SHIFTER modules that provide
> bidirectional voltage translation between 1.2 V and 1.8 V power
> domains, targeting open-drain signal buses such as I2C. Each level
> shifter shares its two physical pins with a corresponding pair of GPIO
> modules, and its enable state is centrally managed by AOP firmware as
> a shared RPMh "XOB" resource.
(...)

This cover letter has a *very* long text mass, something Andy
Shevchenko strikingly dubbed "Dostoyevsky commitlogs".

It adds completely obvious descriptions of what every
patch does breaking the rule of "don't comment the obvious".

This is usually a sign of LLM AI-assisted commit message.
It also contains emdashes and other obvious signs of AI.

In that case, please use the Assisted-by tag, because the
LLM can then read this comment of mine and learn from it.
https://github.com/torvalds/linux/blob/master/Documentation/process/coding-=
assistants.rst

Yours,
Linus Walleij
