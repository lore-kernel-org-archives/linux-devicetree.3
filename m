Received: from mail-oo1-f99.google.com (mail-oo1-f99.google.com [209.85.161.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1FB37DAD7
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 23:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785194033; cv=none; b=tYHtLXeqllYbkFyNAGN5mfgVa15U4D51mGQd7z05/YhF9NFJ58qzBjYjRFJUZCgR1bmWcQAXn9vosFhjyWp1Mg3S+x40KO41U5zxHLpC8jbGHe5NvsNg3Yh+v4EFwFE5M+MzrtEzIkFY6WVaXbN99DIRiEag/46po+sXnE1IBqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785194033; c=relaxed/simple;
	bh=zLSHSlA49BYyyHUHzOoJdO9BHdcI6rnTT6w1nCw/5jk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fHBZsZIHP4RTEU0ST2pNwbTgnRhN7Andcg6VqkACgVwGqZ6GRW41PWQGtC9nX3ym/jpz5tErwt5kxHojHMMeIVWg/Z62t/l9LWvngaH3BWcj4g62EmJaNY+QhGprC2oUVovW7iaGBSXUjxseSJL2Jc3FXbF1dLzd92RfxEedGLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dq8JrAcO; arc=none smtp.client-ip=209.85.161.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dq8JrAcO"
Received: by mail-oo1-f99.google.com with SMTP id 006d021491bc7-6a198cdc4e4so1483810eaf.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 16:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785194031; x=1785798831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBBRC+4dBOGUpUnVf1j+pdxrs8Bv9jF12/3OQB9wVH8=;
        b=TokPNgYMERdtliAmZt0BVKm38g2r0ioEUbWUZ9nc81zyap5YnydjzbykydYwtBOBLV
         cAKwOboz24L6zdtO+rJZpAfJ370ZADeBdwP05CxA0WLwOKOzwnEwb+NMTZKYmBoSocX9
         99AALij41R3PAx+oUh+P85/TxFwzgxo/nw1OUDYmec4LQagvwKhmHTQUp5P4m117rYmF
         MFxGNoI6/iDgHh9JS09LQKrFFcEdLKQza/c195Aj2lpnlsmGUVuNBVHTiAID6CQyVhSY
         5HJbx7sKrx/JAZZG5pOGPn13RomBpUgHkXHdSv2eJN+WQL1xJF8iMC6AE8hkzwPKb5Tm
         2A+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoTuRp9hmqjVDKMF+YfOjYfKCvGD/sSQTzStoSbCz5tByvVIwh70wIO3WEfAh3mexLxJtbWDCMLToZk@vger.kernel.org
X-Gm-Message-State: AOJu0YzKhpvLYF5xb++jmCDLhgzeMpnPP7Wk+Q/RPah7WUflzOWD4DF0
	BYYHJetgSQt1Op3wlkqzkr58xcC+i6cCswZT3EnzOsx+9DPWXn8u+h1DW4lL3snK/x9mkAYLjkR
	lRvluXMNZfnAw97Tjxf83XZ6OTwj//GiYNbxBhl6DGTZ8i01oZSFKzHWEFoDKl+9Lni+0oUbIy+
	rBTUX4OMALRork/+8T2bmCMWkCgyy6tIfYOfwfQHMeYQ8wrIQUwWNXDpY4fohiS7bOGJTSO9AZP
	w8zeovB0HvvUXMkvw==
X-Gm-Gg: AR+sD12Cm368Ojb6TtJridXCNhmvSnFtocHOCb3zMHouSGDhQOoHaUJMl9emALjwIHO
	yJBlIXL9Ue1yO4NPfmkro2hUx25XaeI1FugnKam1VcZGkAfcoEeueVDXZAbczDfolbMeUoz6cg4
	GNs3WWxdIC/yiULsU060/R1T1QjI1TGDnSOupI/B/c456ov3VrWZr5dKEaKfSBmHUkc/iZwASlv
	/s3j5CfD6qpnvkKg945BPeCDJcLWpp5wqo+Oq9dqd6vYr3ddB94CRRVUYU3RWlNv1atRb+FVTfO
	dgW7qf18oV0GfcLqIbWvjC1KcxVZD+3ugT+2oW9iOrxERV/pQ8m81iEw2jCw2lYl2C5TJI/BeOg
	ttB0QWYvUbWUhSl3+jCQPEog4SploqdlCJRWL83PjGWE5Rj7StWZl8No1Km0UP+MzmasjDLV5a7
	MDXuYqEqJmxzwPmqyX7QtL9lTTfWTm4OrRsQgd
X-Received: by 2002:a05:6820:151f:b0:6ab:480:7168 with SMTP id 006d021491bc7-6ab048088damr7511721eaf.4.1785194031125;
        Mon, 27 Jul 2026 16:13:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-6aaf92e98fcsm339290eaf.1.2026.07.27.16.13.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2026 16:13:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so149226a91.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 16:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785194029; x=1785798829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBBRC+4dBOGUpUnVf1j+pdxrs8Bv9jF12/3OQB9wVH8=;
        b=dq8JrAcOGersFKwULuLoxRgEQ6ah3/MWTX9MFa+dJxUwylVR+vqQwm+MYcarg3xAc2
         2/RPJ9qnEC/Oa5VrzjFvsWBipLrLZH1P4vIHXIm7YzJfrfnNrHtb41SMWG49MQu9RNj4
         0jC+Kgvq+nKXZsVitPAuOm6pPvj9RRN+DfLao=
X-Forwarded-Encrypted: i=1; AHgh+Rru3WgFAaImOPPxfVWcEgu4nJiBDOvqrj0OYFCzEHVDiuhx/teYC0AG4zbb+hatcZZiQb5PtNe8lHIS@vger.kernel.org
X-Received: by 2002:a17:90b:2ccf:b0:387:df8f:1409 with SMTP id 98e67ed59e1d1-38f2988462emr8728037a91.42.1785194029540;
        Mon, 27 Jul 2026 16:13:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccf:b0:387:df8f:1409 with SMTP id 98e67ed59e1d1-38f2988462emr8728013a91.42.1785194029098;
        Mon, 27 Jul 2026 16:13:49 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc415eafsm36964437eec.7.2026.07.27.16.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 16:13:48 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: dan@reactivated.net
Cc: bcm-kernel-feedback-list@broadcom.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	florian.fainelli@broadcom.com,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	joro@8bytes.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	nick.hollinghurst@raspberrypi.com,
	robh@kernel.org,
	robin.murphy@arm.com,
	will@kernel.org
Subject: Re: [PATCH 0/6] Add support for Broadcom BCM2712 IOMMU driver (Raspberry Pi 5)
Date: Mon, 27 Jul 2026 19:13:43 -0400
Message-Id: <20260727231343.1520006-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hello,

Please give me a few days to give comment and test this on
the Broadcom 7712, the sister chip of the RPi 2712.

Regards,
Jim Quinlan
Broadcom STB/CM

> 
> ---
> Daniel Drake (6):
>       generic_pt: allow missing sw bit in DMA_INCOHERENT case
>       iommupt: allow full-table contiguous leaves in unit tests
>       dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
>       iommu/generic_pt: Add Broadcom BCM2712 page table format
>       iommu: Add Broadcom BCM2712 IOMMU driver
>       arm64: dts: broadcom: bcm2712: Add GPU IOMMU and IOMMU cache nodes
> 
>  .../bindings/iommu/brcm,bcm2712-iommu.yaml         |  65 +++
>  .../bindings/iommu/brcm,bcm2712-iommuc.yaml        |  35 ++
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi          |  15 +
>  drivers/iommu/Kconfig                              |  15 +
>  drivers/iommu/Makefile                             |   1 +
>  drivers/iommu/bcm2712-iommu-cache.c                |  73 +++
>  drivers/iommu/bcm2712-iommu-cache.h                |   9 +
>  drivers/iommu/bcm2712-iommu.c                      | 587 +++++++++++++++++++++
>  drivers/iommu/generic_pt/.kunitconfig              |   1 +
>  drivers/iommu/generic_pt/Kconfig                   |  10 +
>  drivers/iommu/generic_pt/fmt/Makefile              |   2 +
>  drivers/iommu/generic_pt/fmt/bcm2712.h             | 259 +++++++++
>  drivers/iommu/generic_pt/fmt/defs_bcm2712.h        |  18 +
>  drivers/iommu/generic_pt/fmt/iommu_bcm2712.c       |  10 +
>  drivers/iommu/generic_pt/kunit_generic_pt.h        |  39 +-
>  drivers/iommu/generic_pt/pt_fmt_defaults.h         |  13 +
>  include/linux/generic_pt/common.h                  |   7 +
>  include/linux/generic_pt/iommu.h                   |  13 +
>  18 files changed, 1147 insertions(+), 25 deletions(-)
> ---
> base-commit: f4fb100039e96211609dfc44fb24b9e4a8a0f2f9
> change-id: 20260712-bcm2712-iommu-submit-2e09899e65c4
> 
> Best regards,
> -- 
> Daniel Drake <dan@reactivated.net>
