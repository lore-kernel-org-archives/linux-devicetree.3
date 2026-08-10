Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6A03B5311
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786356985; cv=none; b=h9UisAS274a61I6lWHpmLCkN9vh7eHJlJmo/OST9tHc13x9qCn6cL2v5wZj4hHBCd7K8jGWe2hULeuGmgSn2V2FmP1MfqumyH6m0WA2GzWVjbTMyZ5meW6tpdIPMK3O3A1UFS+gbpjlPXObBXA3f3//1ZoEnrW3eertkyPD+Z4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786356985; c=relaxed/simple;
	bh=6/f9wmm2awoewJ0RJjhCNb25rGgSGL053o6mzKpTT4M=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=uJ2lrN1gtM9m+XtTdSBlVpU1ERWAVLO80oVoySXN01kusbiwToLIDoHOfFIezC95iPIx5y1LI2PYqTxPHxu4Iq3nOSbt3gLpNmwMmalYwQ3wyGNZWN1A6OIfRBLk6febsZrnWXvZUzse0vEL5+qEHQVZ/ihBzZton9MiFWFTYxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fK8c8oGp; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fK8c8oGp"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c169ae1cb26so766577866b.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 03:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1786356981; x=1786961781; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0DdJ1gMHWzOjplPr4v+9JtrcaHIdGLk0WTVEXhfhPJg=;
        b=fK8c8oGpIFlqTtRA0txdBW/cTc3vYYR7auns6Dv2Ygd7T8VchqymaRk3esZaMM4dr0
         fl6qDpx451wKA5s0FoPBbAGePzydjaGh5DpTIZErh1AH6iTTNKgJ/81khcZd5vrHUhQN
         F7AU3wSAuP694rIqtYQZLjIHL3Fs5ZkNldSMPyTRz5Ftbj8S8oATMk1AGSOkndz6z6xV
         fT46Uca4zOFrf+ZGXbs4D3agPRqOvn8IQK04zk4exqrR1GTRNkQKb6TChOsaE3PeAcIY
         OWWqP0TLVPm3zrsrhPU9AuEIFC8yurMUuJzMB7yQ7Su8kbnOKkUQBlwafCwIoR/peiwm
         NqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786356981; x=1786961781;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0DdJ1gMHWzOjplPr4v+9JtrcaHIdGLk0WTVEXhfhPJg=;
        b=BQFiBC/x5iDO1E8sBvWbX/uJtzssAFD+t0zmcmmFK8xnWkuEEh/xBcqOYms6EiFJFn
         bwfzCqcIIMNOSH+RQgY6DQn1Wc1KjhZAN2XntKXIcl4Tyq/ylSj/1h1wEAZuZxDo+spJ
         tmVB3l4pR0an1K00BXowZH1RKjrdm59WL0fiXkyF/epbyz2DeLe+s3qXTzmDrviN0g+Q
         4osdUW8vSO8NspRlIEXwYD4A3XMGTGyYYQq6j21ViIsy7j9PpTkfFpJ0EklQ7ZROC4J1
         vEGJV6ANkCl8qQdqvSu4msUz30Bc9Bc3vNff9WlbvbZtuEnSgGwgfto8sSYDONzJNu9w
         Ss2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqEWjpmNZD+FH82c0ZyQ/nBLUwrMIZR6xrF98haSaZBMq4Qc/VNFskydA3Ey0MJU7W4KGpQbdJLbQyZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxtPnqoIs3tyHVF3VkD77ryVOMbdfmKw8BdyLSGSUwTCpDq9DRx
	B1T7PDeTiMQVxxD+zhCt7sa/SM3QiZLxd2Ft6Ld2MJrVUv9zNFn4X6AOhVOmg1oA5JQ=
X-Gm-Gg: AR+sD12Bt113AhOwmFdYG8/+0AeB302wPbwX51vD1AvfGIFfbxnFJSHXUb+urc87NO6
	yPNIwN89et9g31a9+Q98kjZc//d8fbGMtGUQyT7r3Blj6djdCsPJ3g3gVtJ3ZyBkjtjFgVJK+jG
	/Edxs86eAB6H6U6bXpfcQoFweWXITB+Fk58mPIc+5nC5JqauHr8XuhbRfdfdiItYFUQDxr6TzlN
	bagDCs4VMn4YsQDJOEHiFJzmAKI04hBkly0dFqjxm6ZZPjlQhCBMrwRw7TOjWg5FrN96p+d2OH2
	eJSNegDEegWP0Xq61rmLM8asRTKGG4Rbh6qMA7YNFUix56J7Gw9j+qAId2nAX/f1TR+XRRzgYKH
	HVv607szJJokKqjWecyZqFLFtt2kTkQNfYp+dDNFjfkpOEShdv/KQX6uu3cujmNC7ebAG40EXnS
	QpiO4OmYtGJ16Dn0s7R/2O1pMNgY+/oRq7u19Zh6JGgWBtw9P9kodaTRQ8igw1qykN24TSm4d8Z
	1bmRzD+cM21D1nHw8M2KXepjNYtTpMigQ==
X-Received: by 2002:a17:907:94cc:b0:c1c:6d29:8a11 with SMTP id a640c23a62f3a-c208d3ec3cdmr919652366b.13.1786356981152;
        Mon, 10 Aug 2026 03:16:21 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a29a33sm357250966b.2.2026.08.10.03.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 03:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Aug 2026 12:16:19 +0200
Message-Id: <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Joerg Roedel
 (AMD)" <joro@8bytes.org>, "Will Deacon" <will@kernel.org>, "Robin Murphy"
 <robin.murphy@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Luca Weiss" <luca.weiss@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for
 instances on MSM8974
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>

Hi Dmitry,

Many thanks for working on this and sending this patch series!

On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
> Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
> spec, however they differ from other Qualcomm platforms in the
> implementation-specific registers and also in interaction with TZ.
> Venus, MDP and VFE SMMUs are secured and require programming only of
> CBs, while GPU and JPEG require full programming.
>
> This series skips IOMMUs which can't be tested right now (VFE and JPEG),
> and adds only MDP, GPU and Venus (although untested, it is required for
> display to work) SMMU instances.

I do have a patch series (sent years ago to the mailing lists as well)
for CAMSS so I can definitely test this in the future.

>
> Note, to get display to work properly one fix is necessary, [1]
>
> [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@=
oss.qualcomm.com

I've applied this series on v7.2-rc7, with the extra commits between
that and linux-next for qcom_iommu.c backported so that your series
applies without conflicts.

So far I'm stuck with the GPU not being able to probe, adding some
printk's shows that in msm_iommu_new() the call for
iommu_attach_device() is failing.

[    5.971154] msm_mdp fd900100.display-controller: failed to load adreno g=
pu
[    5.972991] msm_mdp fd900100.display-controller: failed to bind fdb00000=
.gpu (ops a3xx_ops [msm]): -16
[    5.974073] msm_mdp fd900100.display-controller: adev bind failed: -16
[    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to attach=
 to DSI host
[    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-s6d6fa=
1 failed with error -16

~ # dmesg | grep iommu
[    0.127014] iommu: Default domain type: Translated
[    0.127052] iommu: DMA domain TLB invalidation policy: strict mode
[    0.739899] platform fdb00000.gpu: Adding to iommu group 0
[    0.741358] qcom-iommu fdc84000.iommu: iommu sec: pgtable size: 90112
[    6.006877] platform fd900100.display-controller: Adding to iommu group =
1

Have you seen any issues like this?

Regards
Luca

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (12):
>       dt-bindings: iommu: qcom,iommu: document the MSM8974 IOMMUs
>       iommu: arm-smmu: add global register definitions used by the QSMMU
>       iommu: qcom_iommu: extract context bank programming into a helper
>       iommu: qcom_iommu: support the short-descriptor pagetable format
>       iommu: qcom_iommu: handle the SMMU global register space
>       iommu: qcom_iommu: support non-TZ-managed instances
>       iommu: qcom_iommu: restore context bank state after power collapse
>       iommu: qcom_iommu: halt the micro-MMU while programming context ban=
ks
>       iommu: qcom_iommu: allow faulting transactions to terminate
>       iommu: qcom_iommu: program BFP (prefetch) settings
>       iommu: qcom_iommu: add the MSM8974 instances
>       ARM: dts: qcom: msm8974: add the IOMMUs
>
>  .../devicetree/bindings/iommu/qcom,iommu.yaml      |  16 +-
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  85 +++-
>  drivers/iommu/arm/Kconfig                          |   1 +
>  drivers/iommu/arm/arm-smmu/arm-smmu.h              |  10 +
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c            | 445 +++++++++++++++=
++++--
>  5 files changed, 517 insertions(+), 40 deletions(-)
> ---
> base-commit: 6c5c106bff878247a9cc7255077aab9040df8bf8
> change-id: 20260809-msm8974-iommu-upstream-144b1e2a15f0
>
> Best regards,
> -- =20
> With best wishes
> Dmitry

