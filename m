Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D9724BBF4
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781054108; cv=pass; b=DNMB4mdQrtBEf7RTcL28loa5+XRvIsPknO7crmdPDCHxGLV6jk7aSBSAsGtMMWRYCKOI5ewWwITL0trdFs4NncPUkK83FcyYnFLVce7KmSk76dGSF0rIZ2uWb4bb4bRtBtjHVC1oAt+uQwgE9XUl8F7HVamhZ6frR9UM5wx9GDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781054108; c=relaxed/simple;
	bh=UeAssUqYMd9I/hNomjKDWuBothPBNmM7nGphuECKV1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1hCBdohnHPef55KEtTsfHIVsohKHI3er19vs1FeIU9ics7ocwFREip0Cxk3TQ0dSW1rD8Jk9LVZppGkV1YOvcsHfDWpAy4aapkeSUfSLWrQjC7RaJ68i6yLXuZVctQcPi7KgR/YIooSJdaG4z4HDmdUzsng87k80og71KEPEiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=qMjegCCc; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="qMjegCCc"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c132ac5ec2so61027305ad.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 18:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781054106; cv=none;
        d=google.com; s=arc-20240605;
        b=HSKyW5h2+stJ7fef86jA/mT/NhoWkQ9uDqMzXctwjJYUn5ma9CkfU2k8O0OjXbS0X3
         xBlo/7aYMsTHymiuj5pB2Delnesy5QaYvznhsQ/KAxiyJpU0Pb5db5LqNWhlYXLxrK5A
         V+eQ1EiccLlaROBzdq7hGEnvcXvMRbBh15VhY2DraHHNr6YfsQKOUahdUJAj4QFeHTmz
         q5AyissECMYF03YVE1xgaJ7AbZHdVFp4xhhQAhkMXqze7H+dRlnKzZeKvpP1srSkSdhp
         3tKdfIF4Hq+pPsB2nsC1ESHx0IwyNelNdIg84PWxp7v7fQNeyp2u9PbUYLLdDs4yVHb4
         oTNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2Bj40WPn3U8Z/ILKnmF/fVa3Ekp1JSrXZv/lmEeSBo0=;
        fh=1XSi7XFGdcycMYX7061aVnwKeno/WDRCg0NCM0OA2po=;
        b=EWug5yUXhKG8Q+0+W4Mjjy9dtqjZP1kpACyW+dQqRMQEXvSOvHoX1CZFYyCuXy8SUS
         4Fljsa+ZCxG4cS1wUGQtQ1JyNmqB3e94o+Udiulk5f5QQuywOFcgtcQYG1o4Y5MIEuT8
         +OtPbe+OprIBtYbMn3nBms4uBOnqPWTg2YOOTVxdCo0sxWU7GXYF8V7Z8pMCCcPpUSNI
         VsJwhslZFD4IR/WQZQnSvog8d1Ir4qzA465rSrJTTYyRvi8uFomBlY8nH9KUgrMlf5tt
         FuuqXMnu4JHl+2Y4vmPvyQYQsgDScpppoTtb3NWZDQp30HyhbfVqu0Us65Nhg9qFCznx
         dbqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1781054106; x=1781658906; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2Bj40WPn3U8Z/ILKnmF/fVa3Ekp1JSrXZv/lmEeSBo0=;
        b=qMjegCCcUBDxXDPpfJ9kUjrMc0PeKNq3qpNPV4QavlcRiZSK99bDy4G24FJO3temQ/
         f7Zv3uYHOTUIwARONd/StE6tPPjor/oI5kCeJZ7TFLqJn5c/8P0M0BEh1vLajwJaYBUD
         Myg4BfP5r5PX5ieSW2QJ6eVoar+LkRDgNl6GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781054106; x=1781658906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Bj40WPn3U8Z/ILKnmF/fVa3Ekp1JSrXZv/lmEeSBo0=;
        b=GD3Iw9vhYG4QmlIgQEW4FzyKktSR8AP2kt4QbfskCXh5L8F1VsLhSDKwg3SXlvEP8Z
         8e6OtTmoDWZJ3OrieR9lTdTACF0fnXdacbY74wjSvfYEE/YYLGQG0jH4fxhBEl+uQmj9
         FDwMxAoMtX8AI31IqqPliNXKBNqbEC/ukaCx3L0dwtpvUpezsFWR30c3niv7DP1PE8Js
         Lihf98cpllLDf3eO6qdXhjqBM4ytFq2cHSYhV9GKPHrguWBnpkPXYC4jURcDBiSHhiwW
         KutaSyXjCa3lzHGQAspqJO+p6fkTomwVJokaK7YDh0HfEgXGf5GriM9Xj66m2WZR7iCs
         y/Og==
X-Forwarded-Encrypted: i=1; AFNElJ8EQspYe8K+qOOyIMJgoCZ3HzKPZT2ZsANmuib9XUGWtUQPmLLct8vAB8oQGm3NVUDvXHJOWlv+qQes@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/iGRSvbMikXHOGTJsp9G3kywmtWipIkUvL5foLJhvHTd9T4vo
	S4/KRd4wksz1+CpmEBwBXWWvkwTmmjos5g0XOmpN+1M/plseUg72fc3UoxowZC2Av3H6emuIUeK
	AHNJ8cFDw2DEXnX7A49URDuhWvABVF/An5df7hSGlYQ==
X-Gm-Gg: Acq92OFYpORUgYC7UCt9viwQXwgYYH/shVB5WZARNtVT40NOeoaFv/ntH0umIUYX7Wj
	giJsh96BRKTY4hrE7/KSm9xU4KhehF21Pbetaaq6H9jWRDyhObxXrC4z3y9GSupy4h/d3LePtET
	Fpf3L3MtAkNHiC0D8U8djC8907xEUVDRzHynz//NE6n5rsz1i8Iy8dvM9uXlHWsMISAwF74Hbi9
	5hmJFJIKHl5Ox7lBV/RitVKxZfNddLUWhBHK2CEVbYG8O/9nXA0Sxw1SmLPKvUXhFbznGJ1TF6+
	vuICHzK3F+fQoxvEhTgNRQCTQRN0Ed965kJJ5i1Y7TKbnOQke0grB7i22/KB5ywbw2a55OJV6aW
	NyNv+uPUwm3I2jLfU1cW9vxQL+EPXlezxPu6t8eMkBd27XdwmwcgvRiSVQe9h874K2uFE3g69mZ
	NtyiQ6I6MT21+Qw+w3HcIc+MTo1WRoqYF6fjoVLyZeeuODOpyCSbuJTcBDjC/j
X-Received: by 2002:a17:903:708:b0:2b7:abc0:3bd7 with SMTP id
 d9443c01a7336-2c1e7e3adb6mr148795125ad.9.1781054106527; Tue, 09 Jun 2026
 18:15:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601041336.9497-1-daniel@quora.org> <ecavEnqJTDXvfFykc9uJb5No7ioighpjrCdw2CFZ4c8Izr5DxpTs-606Bg7K0RtHTaOqksWivHxWQLzMBP6qow==@protonmail.internalid>
 <20260601041336.9497-2-daniel@quora.org> <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
 <CAMVG2ssnyH=KUKrdfnUOtPYU7p17inyzcYWcKhT4EAZxDzDjfg@mail.gmail.com> <cb37e7cc-4fb0-4c24-8f89-f6f9eb08a107@oss.qualcomm.com>
In-Reply-To: <cb37e7cc-4fb0-4c24-8f89-f6f9eb08a107@oss.qualcomm.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Wed, 10 Jun 2026 09:14:55 +0800
X-Gm-Features: AVVi8CdzfDox6mz_iOGKn72MQqEfSSNkYmI5x8N9Awxjs-n8z1eY5R0tOZeJjNw
Message-ID: <CAMVG2svgnGKix5vSe8kG694Vm1dU=0Z=MZqR4M5LFOxCXoXYXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jun 2026 at 14:39, Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
> On 6/2/2026 9:05 PM, Daniel J Blueman wrote:
> > On Tue, 2 Jun 2026 at 18:27, Bryan O'Donoghue <bod@kernel.org> wrote:
> >> On 01/06/2026 05:13, Daniel J Blueman wrote:
> >>> On X1-family hamoa platforms, Iris DMA below IOVA 0x25800000 (600MB)
> >>> triggers unhandled SMMU page faults
> >>
> >> How do we know that is a correct address - does it come from qcom
> >> documentation or trial and error ?
> >
> > @Vikash, beyond your comment I linked in the patch [1] kindly cite a
> > source for the different stream-ID <600MB behaviour, and share
> > specifics, eg if silicon, firmware, or driver and constraint, defect
> > or otherwise, so I can include a definitive description.
> >
> > Also good to know if my workaround is good for long-term, or on the
> > other hand handling streams <600MB is important/useful.
>
> Thanks Daniel for raising this patch. Did you also try the memory fix i
> mentioned in the bug [1] discussion ?

With this patch, my Lenovo Slim 7x spontaneously rebooted after
opening 3 tabs of https://ui.com rather than 1 without it. No
crash/reboot is reproducible with the patch I proposed.

> 0-600MB range, VPU hardware would reserve this to generate different
> stream-IDs primarily for internal (non-pixel) buffers.

Thanks for the clearer description; I'll respin my patch with this and
the DT fixes shortly to get the X1 user experience under control until
a real fix.

@all I appreciate the ideas and discussion already ensured!

Dan
-- 
Daniel J Blueman
