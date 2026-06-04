Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B04425CF7
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 12:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574959; cv=pass; b=hnZc87Vn+MYTR2fqcAL4UtbHwzNTVW6e5b5GLesYLQUG6u/TltuF/sS1E1V7PUubDPD1DDKKa94nPFK1C0f7USy1wEJjEm7nRGiRJSw3CAp06ynwAnr8czNXr6YmvlVuajCTqfEozxiOnqcdoFi1taukZd2PgCh8lV+YkRl7arA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574959; c=relaxed/simple;
	bh=uj4K88qc6lPcbN3Yc1wC9i/Igrgsbe/5UqnLXF7tFxw=;
	h=In-Reply-To:MIME-Version:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssNlW/PsWYVItk78L/nYWakr/HHm8og3vvS2RTydKkMBpNMtc2eZ2ivRCKDoPLe3+kh9E1lpjy8zmLL92PLoiErsaUap4v/Jt2vp92S5NRXDFSdE6DYPJMG8HNfxqIGRZEnYOHC7KLV2FDJVAyUdtgCusOTQOdhI5F94IofpcpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SS+26SIH; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SS+26SIH"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65eb226b1ceso675919d50.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 05:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780574957; cv=none;
        d=google.com; s=arc-20240605;
        b=SxMyQghlMlQ6lKj9rApIlmDbERmPgbtXOT+0chcFDdJrrroxgLOXfjYRevh1tYoW/5
         ggAibRKpSX113HFWKU7NbLImf0VIUkCnk7+rOld9wjQGDSwIVNXwVpiq9JHrF1Nf0iFP
         hpPEg+NX+4Z+zDRRSDRAc/6sU6sKHTo4yXaIt05f1cyL4Cy+UkcHAEwKNwuw1ChRCG4L
         fk4nxFqzCz53we7jeUWcP20c1HXkbNSBxvnd532sO6/W+ct5ubn5NNFzSToz32HQ36/0
         z1EYpE7z3mwZyNDQ3waj9b3UOS+uBtrSU14USbZRZ5dPtiS5uew/IY8+pA8HYKlDANhC
         IN2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:references:mime-version
         :in-reply-to:dkim-signature;
        bh=6ifSH017/6XeBpJ1mk56x+Yz6Ui1nA/vUxvuucn89y4=;
        fh=gNd/AiSxcP+iVlVjbDIVzBRg4ZW4NCXPpafi9YLfXqY=;
        b=Anrv012kqwUejNeufahp5A6vU/qczRCvhAGOpeMZZNRxihsnllrv9AJk27se2FThoE
         Ip7Wyw5F2BRsUDIjD5xc66PmR+IJz//HY2kKj5gPq1Ba1kuLi24XJQDyQVG9dkkEqD1T
         jw4Fw+4O1NjZtvcqU2gqfVgOaI3FLKNvOlDsgx6TFcWZaYLwMpyiK96bdbxLqbIBy1/h
         TykKiS8yBJwo33sXxtbJ1h0x/v7hHQe6pOxWG3dloCvsDaFn2TY2gwB3uW6wgh5fQsM+
         W7e3YapnoVgcWd1hMfZAPMe6KUcDR7g0AebJh4q6o6OewyrnsLun5jamfSM7ecMaq6lu
         eOfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780574957; x=1781179757; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:references:mime-version
         :in-reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6ifSH017/6XeBpJ1mk56x+Yz6Ui1nA/vUxvuucn89y4=;
        b=SS+26SIHrEnTCl1BZkXHSOrEkPe4W0Ol5RQudc9dU/rC3sx+nLUfIQyocnJxTVlYf+
         sqkts8xWA4OUjbDG5cQkV91E5D+LR1LiWPKRPpxmcIh0+JWbfc75VKTSx8vKmBXl5tcm
         CfmGDjn7QCVz+dY5GdeTuqG19N2PUICfF7eygp4iKviHEsVoqqQH5ktTjuHBhKv6LWZF
         HxhgTUajRR0IK4r26UZC2qvgw4SUHpEgWQfBgNpE5z3+WbZ0ongby2Ye2XEX39DeFepF
         PVdbNGZaAW4Cd1tQ+2SeHWgK/OToxe+7uW2XfYKLITM7D7xF2S4VulEbta/hFY9hWkXN
         75ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780574957; x=1781179757;
        h=cc:to:subject:message-id:date:from:references:mime-version
         :in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ifSH017/6XeBpJ1mk56x+Yz6Ui1nA/vUxvuucn89y4=;
        b=RCcsab2xq5K610jKeYh4rVgug7h9FnTf95LL5FQG4hKesR2ZezK1eJCTLO49yWUCUU
         Db/m/M2OtAa+5To33MyzEpiAzuaEJMgv8jyni8iuOPS+s4Ic6NlhO13Uz9CXqcm+vDqw
         AzRQUu1jAnydiZuTz0ukR7tGgdMcw61QmGmH77cAigxMNApchw/XHxArF4ZWube9pjWd
         v/3M/XnX704QTJF9ne1YoG03+d4iMaHbh/a0U2ItGzXh3vFBwWenDQoAoEnuB/w0wKLA
         bI11MR2se1GV7N2jOvk66h986tRrbu+Wq6Lt3+8Q1SCq+Fye2dbxUGhKbmgNKzvdOTVM
         eiaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SEGmdmpIO8g8ADnJWt5iMURXunfq75sP1OFsMnOIaH0FghM9kt0kyVQGkJRZha/rh4VBcPUQAhPjU@vger.kernel.org
X-Gm-Message-State: AOJu0YyE+p0+gFp/noNXz6VG0hLDGPYTS3TMHxFq902+58/8KretUuxD
	Phlm+2htuQL3lm+XztikgnR17G+c0+Nziv5LjLEKSjTFhAtOu3IGJXvrEY4C7ZBfI7oIdCHuMWM
	JEuRCBR1/UsnAPpzHgQ9FAxMCCS9tMZImezmf
X-Gm-Gg: Acq92OEmz+VQ+Au5dJ43FYoA4o+4ZeOZcVlHD/SMv+nmT3Qn8Er+b39KocBc6Pu2wd5
	BG+2XGPyrgN6IIDtLJ0dQWacJV09fgSkU4kMS4CqmHd+WdWmmm9CGaIFg3uBsrhKk/J13dpjzyx
	GXFPSeGqheaScihE4JMz5GxwM20IqxCKYoLUw0Doys6XLG0J9Ph6h4aJcsKy3tDx6/zyE+E9w9A
	70qgxFmho6KJ79B+n48h6pWI7q31pbsHk8fTQT3dgRxIQR4XTxpU7v8KxdmYtDeNasnxY/6qfe4
	dHIpjidj5Q08yqF27YI=
X-Received: by 2002:a53:edc1:0:b0:65e:b223:c15 with SMTP id
 956f58d0204a3-660dc561bf3mr5574275d50.49.1780574957417; Thu, 04 Jun 2026
 05:09:17 -0700 (PDT)
Received: from 922524751902 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 08:09:16 -0400
Received: from 922524751902 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 08:09:16 -0400
In-Reply-To: <76bb3e5b-e4fa-400c-b7fb-98f95c7a068a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
 <20260530-mutant-gecko-of-anger-ce8803@quoll> <76bb3e5b-e4fa-400c-b7fb-98f95c7a068a@oss.qualcomm.com>
From: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
Date: Thu, 4 Jun 2026 08:09:16 -0400
X-Gm-Features: AVHnY4IchoeFwiwuUzc7MAm7ADNP4K3glOC3B0Du3JAMkFblKsf5YvA0cBqg6dg
Message-ID: <CAGyK6coCyziKzffGmj+fGs4U+mXEeYJ0Q2+z6xHCA+i=gop2oA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] PCI: qcom: Add PCIe support for upcoming Hawi SoC
To: Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 01:26:53 +0200, Matthew Leung
<matthew.leung@oss.qualcomm.com> said:
>
>
> On 5/30/2026 3:06 AM, Krzysztof Kozlowski wrote:
>> On Fri, May 29, 2026 at 01:10:07AM +0000, Matthew Leung wrote:
>>> This series adds PCIe support for the Qualcomm Hawi SoC. The Hawi
>>> platform features two PCIe controllers: one capable of Gen3 x2 operation
>>> and one capable of Gen4 x1 operation. The first patch adds the device
>>> tree bindings documentation for the Hawi PCIe controller, and the second
>>> patch adds driver support by enabling the Hawi compatible string in the
>>> existing qcom PCIe driver.
>>>
>>> This series depends on the following series queued on linux-next:
>>> - [PATCH v3 0/7] clk: qcom: Add initial clock controllers for the
>>>   upcoming Hawi SoC (Change-ID: 20260316-clk-hawi-1ad4cad36d6a:v3)
>>> - [PATCH v4 0/2] interconnect: qcom: Add support for upcoming Hawi SoC
>>>   (Change-ID: 20260311-icc-hawi-d6dc165f8935:v4)
>>
>> It cannot depend there it makes it unmergeable and untestable. I skip
>> review in such case, please follow standard documented practices about
>> decoupling independent works.
>
> Thanks for the feedback. On checking the dependencies, the changes are
> applied in their respective maintainer trees:
> - clk: applied to qcom/linux.git for-next, commit d6cd9d5692ba
> - icc: applied to djakov/icc.git icc-next, commit 07548b04dc36
>
> Both commits are present in my linux-next base-commit and have checked
> dt_binding_check passes cleanly.
>
> I can resend with the dependency references updated accordingly.
>

No. It will still break the pci tree when this series gets merged. Please
resubmit after v7.2-rc1.

- Mani
