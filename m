Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2E1403AF0
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 10:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787565910; cv=none; b=G1wN/kQ4sZzemxvdSiUvwLcnQ+zIfpYsi1QnuGjIGke8kkDnDJMWBA/1z1kTgo9xPHdBdCsli1CSKkDPte9uxbk5CGkAtawUlK4OxKRObmq6Fg2sVidsWZNySg+if9Jip1pdzOdl4/nUuxu9g8k10+xCsvBNBEQzo5HrXh2zAgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787565910; c=relaxed/simple;
	bh=tCXPfjbfeyr9jATJREVrmtfpm482cc9JqBuaA4EqFHI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=m8GPUBr+82RNN0IDbiLnUPTwAjOJT09/uciGtBqdZSVN4cI1lgN0NN7Bg0xP6RDG0IgS6WenBK0jtsCIytLw099I/8h1EoprIun4OH0GcC377NJUl8ea09x4HVJU/2ibmSO6sBYnKEhEIUjBX5jJxCk7Uf15puyLbRxHTh2YZNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VEGHmAjS; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VEGHmAjS"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso5444508a12.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787565907; x=1788170707; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z+EXhzdCNyL7BX1v534o+kUhKJJy7+6exCGtwlOH/1M=;
        b=VEGHmAjSugSZ6OYL0KbQHSKziaIW3xnd7BhaIq9OwlWcS8BKQ7oUoYMnjIiVqB+jY4
         tA/I3eGR2Lwfu+BHZHAZJDQ0LfksvBc833wRq7GnPzMz4Q0f2DHReKCt1OEjwgEX22fo
         bGg2YZ+eIKp7fwdpEF6knOLYkTXC+UfvxM3/1wp4NQKjBVF8LMJSvAUFv0ng1cuoda+c
         z/vLuC0y0pbAek6P8ohY1aLT5pjAkWDRe+VJ1mt0amO8GUkmeOPgGDAy7gK4S2nfOo+H
         8LRpNz33DYZIMU2zvUkO3Es1T4TQD20qu6gLlFN1K2MwTu0bXDq7noFTNW7YTJGcOq2f
         W90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787565907; x=1788170707;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+EXhzdCNyL7BX1v534o+kUhKJJy7+6exCGtwlOH/1M=;
        b=X93MSPKdmcexX3OF/fcKOqDiVzR7N8l65ovIsMvbY/9ysd2RLj9n2QTFhNnImGvI/h
         5362GHmvoYsl1/bQLI67kkXfZydGm+0MBG5/PmHrGSGEeFi0+Zyq+x9BU4RMz5xqDHca
         IdK/OOYQxeaishpCB8TybZ+u84BQDdWYCXqoV962qR9Y79w6vwS6Uvvse3VP6MG+7QiZ
         7ofufbs4EQY+RywqgJFHHPOgR5PmXn8T/bbQKI/7jldOQ2mb637wDJv3lu4gVO4WU12W
         1oLkON48wEUBrTJNK5y+ZcdaezX0sr/T3avJUkI4FQ7Isqm24lenXZFzwS3j3EN5LJkB
         V9/g==
X-Forwarded-Encrypted: i=1; AHgh+Rq/UWJpdBpYULxPgxcK21ip+ngwtqurvTseNIctKYPFeVYraYGdwSIvQBQDdd8H6zgov3NvkGafRE9E@vger.kernel.org
X-Gm-Message-State: AFuF++l6EFjJWY7CJmgqiWMs76J9RLIOSN/PxwE27uAt2tO+5A4pE13x
	bCvfscDnefLOXUw6vA4umbpNtwwRSVGqaQ5rDPuM77AhfYg1QdTPpvmnWdZVKyZlZKM=
X-Gm-Gg: AR+sD12goiKo1Q3HHSwJPoV+w39uPvh/ua85ji64PbE/1eo1v+b9XaNTVGWuYajkSbp
	uU0N6mtBQEA67OhAyA8SQg8MzfV//W0C80jHjgoD+UN6IJJaKRE93rYEna1/La/ey/vEa845T2I
	ITh6U2rusK4kh/7g0IYgM7gyyxTsFJV+ZcBXApWWIOKHIlHoaGlNMOVYO5NTTZrlbsm8DaCTQE2
	0PrLtQRUQQCRdDcVatMqsy7v/FtaEAMiVLDPlBTzxUOEFX4pe86rZLSb2jlXOjT5+Hy5xJIlk5P
	Ecgmgy2o82kYfU69WIOg7BBsn2dDiVr7H1z2Fu6hIv7nytzIJ77BqYi5KaRMp52eqiukW1opJIf
	qJJMGE0b8Hu3lnOYgGuX8T7zxiGR5gMJj022Z7siJnJ4S/ZTC31Tg5FPt8c60Cwd3vHjrD+CD6u
	ICyl9On9XsQ6rPodBhyT3CwXaBS/QB6Pquefe9FwasC8RsPHgzUiZCGOZy7vA6c9xp7ZuO5VWOF
	CFVlR4FhIgevMSMrkWntOS5U1RLtM8CTg==
X-Received: by 2002:a05:6402:21dc:b0:6a3:fee5:adcf with SMTP id 4fb4d7f45d1cf-6a42f14d952mr27894029a12.1.1787565898379;
        Mon, 24 Aug 2026 03:04:58 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e2da49bsm8922721a12.29.2026.08.24.03.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 03:04:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 12:04:57 +0200
Message-Id: <DKX384NK76OS.3NNOMAH72PV2P@fairphone.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, "Will Deacon" <will@kernel.org>,
 "Robin Murphy" <robin.murphy@arm.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Clark" <robin.clark@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <iommu@lists.linux.dev>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for
 instances on MSM8974
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com> <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com> <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz>
In-Reply-To: <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz>

Hi Dmitry,

On Tue Aug 11, 2026 at 2:43 PM CEST, Dmitry Baryshkov wrote:
> On Mon, Aug 10, 2026 at 12:16:19PM +0200, Luca Weiss wrote:
>> Hi Dmitry,
>>=20
>> Many thanks for working on this and sending this patch series!
>>=20
>> On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
>> > Qualcomm MSM8974 platform has five SMMU instances, used by display, GP=
U,
>> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
>> > spec, however they differ from other Qualcomm platforms in the
>> > implementation-specific registers and also in interaction with TZ.
>> > Venus, MDP and VFE SMMUs are secured and require programming only of
>> > CBs, while GPU and JPEG require full programming.
>> >
>> > This series skips IOMMUs which can't be tested right now (VFE and JPEG=
),
>> > and adds only MDP, GPU and Venus (although untested, it is required fo=
r
>> > display to work) SMMU instances.
>>=20
>> I do have a patch series (sent years ago to the mailing lists as well)
>> for CAMSS so I can definitely test this in the future.
>
> Ok, let's land these first, unless VFE IOMMU blocks display on your
> platform (Venus was blocking display on APQ8074 DragonBoard).
>
>> > Note, to get display to work properly one fix is necessary, [1]
>> >
>> > [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d=
2e@oss.qualcomm.com
>>=20
>> I've applied this series on v7.2-rc7, with the extra commits between
>> that and linux-next for qcom_iommu.c backported so that your series
>> applies without conflicts.
>>=20
>> So far I'm stuck with the GPU not being able to probe, adding some
>> printk's shows that in msm_iommu_new() the call for
>> iommu_attach_device() is failing.
>>=20
>> [    5.971154] msm_mdp fd900100.display-controller: failed to load adren=
o gpu
>> [    5.972991] msm_mdp fd900100.display-controller: failed to bind fdb00=
000.gpu (ops a3xx_ops [msm]): -16
>> [    5.974073] msm_mdp fd900100.display-controller: adev bind failed: -1=
6
>> [    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to att=
ach to DSI host
>> [    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-s6d=
6fa1 failed with error -16
>
> See the patch [1], it's picked up for 7.3

I missed replying to you, with this patch the display lights up again!

Unfortunately the GPU still seems to have issues, I don't have a log
right now (I think even SSH was dropping then with a bunch of log lines
appearing in kernel log on screen). I assume kmscube + more complex
workloads worked fine for you?

Regards
Luca

>
>
> [1] https://lore.kernel.org/r/20260730-fix-qcom-smmu-v2-3-18e0daf2d836@os=
s.qualcomm.com
>
>>=20
>> ~ # dmesg | grep iommu
>> [    0.127014] iommu: Default domain type: Translated
>> [    0.127052] iommu: DMA domain TLB invalidation policy: strict mode
>> [    0.739899] platform fdb00000.gpu: Adding to iommu group 0
>> [    0.741358] qcom-iommu fdc84000.iommu: iommu sec: pgtable size: 90112
>> [    6.006877] platform fd900100.display-controller: Adding to iommu gro=
up 1
>>=20
>> Have you seen any issues like this?

