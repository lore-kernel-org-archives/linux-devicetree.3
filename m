Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779991;
	b=rV8lPuCcelELvBdxb+FBraVsLO9YoX5W7DMwfOWsvHb366faiSLm4Q97j+Pjc9r7vN+B
	 2pdFQd4F6F07IKNzWAH+zzLUlwUgPYurDvVGhP9SFTxQJrwBPbihur0OvcLmiKbVc/2kw
	 zf2BRORIcX8emOypgSpyE5apCaWx5EP+SWO6x5rsvNM7o2Ab9FaOjBqr6ZjfWYu3B2QRv
	 HpYFYUJSGypEssFTzf+4Gsz9GrPINkEH0jJb/xF6paZAHbMFakAtJtmK7yrtDdYIqXndv
	 avSF/FU3an2AMb02oxyB+LF6MSuFqfT92LvUj/5ogMREIgs+rKAzFcbKyYeZKtIHsSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rYVCxbzjhwXie807mRKlkMf4y7MqKXFbNmLhmKxHJ8o=;
	b=zaQMpOgFuaRmqYZQAU1dzh5m4BRgh00NbCj78J5TZqsrVdRCT8fka8FHQpc2Gv+cxGOX
	 JgS4ldo7RZGzhxmEGY5d+YXjRoEhUfowOWg/WHCHXqv+akIOXraZJAx49iKStLWhkpkic
	 tuZugqwSHi3KmWv/qo6uLXzh8S9BLDwDpKp1qyfjzQRsgLd4ybzE1c+5VJClwkV68WRsk
	 SbTe/Wf7oYg1qD9YFlFF6Xd0uFhOYYoGoQOKkX2/FUhGtFT/0+6WlGLt2/llXhiFl9jAa
	 w4FhyVANvlDYko0e2Lea5pU1HRFA39ZpM+1XU+A+4qlK4rrj+hUM3VR0Y6ogJWfrWjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TFaB6tYC;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2C2606D80E
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 08:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D2C2606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TFaB6tYC
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso218798a12.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 00:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793779991; x=1794384791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYVCxbzjhwXie807mRKlkMf4y7MqKXFbNmLhmKxHJ8o=;
        b=TFaB6tYClWr47CyI+QVWgH2XnHepS1ZR30HLKq+OHkfjGoSD9zH77KR1UEVuzMdF1/
         FQGdUc5GMqrG7Xz7U3AAXyKq9yt1s+nsYkQRwvvbmlpFJS7LA0gxFBv2J9g3o3yU8YEj
         btkw4iXwJTHCVBXzhjkb17P4Gy9Ui5iA8465mjoIOx3CHHukV/bY8N5JiWLUZTycuJzQ
         gmUgo146yhClERrtnSeKe2RapGOCMHeIMfWcGdKmMoScUaXcekZcbWaE1tIblpDLjubm
         1O/UjBE2m+IputViurgdQC6lNHdSXP7mwOzTmswhIdBbFiCyp4dPfQDUIYVzMGZs7wi6
         w3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779991; x=1794384791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYVCxbzjhwXie807mRKlkMf4y7MqKXFbNmLhmKxHJ8o=;
        b=Tiaw6v1OH5w1E/DMIn6veWfXCHuD8eb2JYlv/z6cSdy1b2Fh2Yb1J5ztgq9rIKo7Wl
         k2hr8aLdxWWsGQcrsECFx1s7/i2qTsAcFLIMUz5o0C5tjxgqjGqYMhWookKE943U6zsi
         z0x0jKSAgYK2UO+u1+fMtX/6YFc6rf1fUUiEiWQZhdDU6OWYii5p446oIAA/gvR7ZG/e
         7uBl+WJbZBtO5w7soS0gBIB+DIGQajMrvfLEpeIykyvpbtIlGuBDVsE9WeSgYcAASKqF
         rEEDufnUTuTM7a2mdWQsVeIhMkMVch6QGn1hnzYis6b9FfvmxcCKhOaSrmnvw1PEgfnV
         9Zqg==
X-Forwarded-Encrypted: i=1; AKwUvBzYFY5kpoba8IMfHBaIAZ8fSMyb/AWzmFmMViYdxQM++Hvhv2CnyJCIulmnvczb3v33bfNn7wbCkcZR@vger.kernel.org
X-Gm-Message-State: APuU4Z/2Zm3xB+9jAoHcr/EpC3+QZBLNOd/a08oqwJlzfKVN1vML0oUW
	6Ov2qRXKg6cpk/qnBXgDFHcbGAK/UpxkLrMP6evyGnUqcB2l8eiTM0oD
X-Gm-Gg: AYBFou06dNzA7d4cALjyzrJXhzAl2TKHMa8mCi+iub0FSkLQJo5+MbI1aR3ord841zu
	Qk8xcQvlGrgI9T/8XP8vNIyDRtcrXkJrRmGm36tV22aLFKBHrhkGDX29GZYtOrToqG/t7gGvaZx
	pRfGsAeyy7GMPBEk1PTRE3pZS3GuVkns9B18OlDNGSNccPFSc/S4B8uWs3aIzD6nPWLO/MBEcBJ
	O9FebMNpQMOuo4XjO5xIGu01rLKd4PqQoAOcSNnSPK8VV0oKtBfzpIrT+veyJIziOHxKSun7AJ7
	Q/5ccwUf6kfkmt6RHjMNhHshwLwPrlXb3OioJVevh17g590zpEuAEgF9cnTwmWuTLhAyzI8Sf2/
	Usf0f6IVUpigjY8thKBqD+CHcBX2KUYweEQBZfnUb8fsSTKb/ouRpaYxNa/fwPoiqcIGawrq84M
	t+aM3OSXiCUPQqsX34mOSX8e6Mt52pVThElrL0ucrY+vWiUPVQ7CaCBOvATTRo6mvDrXHT88tTg
	p0LDTBIFMlBdGNVX+A9HqYHjK2wHjAZWT9HOZq6gsAwBaBER3Om3/uZXsHlE1wj1y70XYHJxl//
	3GONdInoFwonHBlp4Qt8Q6PtyauoWi7TNaHtsj6Z3m+hmOnnGtTOsVk=
X-Received: by 2002:a17:90b:2dc5:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3ae897a5be6mr11780916a91.42.1793779990608;
        Wed, 04 Nov 2026 00:13:10 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c2ab1cdsm8423510a91.0.2026.11.04.00.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:13:10 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: yin.li@oss.qualcomm.com,
	robh@kernel.org,
	james.morse@arm.com,
	ben.horgan@arm.com,
	sdonthineni@nvidia.com
Cc: andre.przywara@arm.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: Re: [PATCH v4 0/6] arm-mpam: Add basic device tree support for resctrl
Date: Wed,  4 Nov 2026 16:13:02 +0800
Message-Id: <20261104081302.304667-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Yin, Rob,

> Changes in v4:
>   - Drop memory controller MSC patch (no concrete platform user).

We do have a concrete platform user for that patch.

On our SoC we have implemented an MPAM 1.1 compliant MSC on the DDR
egress path, which provides system-wide bandwidth QoS. The MSC is
described in the device tree with the "arm,mpam-memory-controller-msc"
and "arm,mpam-msc" compatibles, and this patch is what classifies it
as MPAM_CLASS_MEMORY so that it can be used through resctrl.

We have verified this on hardware with v3 of this series (patches
1-6) on top of a v7.4-rc1 based tree: the memory controller MSC
probes correctly from DT, resctrl exposes the MB resource backed by
it, and both bandwidth allocation (MPAMCFG_MBW_MAX) and the MBWU-based
mbm_total_bytes monitoring work for it.

So this patch is genuinely useful for us, and we would like to ask
you to reconsider dropping it. We are happy to help with testing, or
to provide more details of our DT description if that is useful.

Thanks,
Ping Li
