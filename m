Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098230;
	b=XuNZ1KyTlUAwzdnQ3F6Ov7ygBocvj5Ln4DH+qAALm6RBpgUQXl8xlkygCd44dXXrg914
	 e5U5nkurjmZeKwP8RkW/S0K4CIRYXpvL9Zsbqp3hikVCu1evpVYimT9WANxXq9RzacZhq
	 j9UfgMBWtpHt4mgzzgOgeVgbV+v/fmEg7ObkyS6tCsUwN2xtPUCQI7/MQTDY4XA+Pn/Ju
	 VvlCUIu9aXKFJctjZTeIibZcIq968zewUbtTSW7mG9HOef09Udn+bUI/VCnrvLCGT+sK1
	 Qk9ipk+YncDC391X/XoRcYNthZBjmmEnwDqW6m2gwrQUCOA6srgqzJmkt51ctnKjv+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=t9bWB+Ike65eic+Yy4cT8z9+HxhXkL0til5+GubOeaM=;
	b=ahv/aBC9EqS4hHAA6F1F0uV5ESIUtiwWFfNU5/wViztRpcPg6Z2V8xkhbUySq6F3dqCZ
	 9GORpu926HWmSIyFkHR4fBV8IGu1jbTMz12x0WZFhYLR3Ed5mYL7ZZLf2neDZRjBdJ8Rl
	 K3UoC7/KJ1sqe+Bvp0mGp+NfGXk1sM2gS7BPA7nwOdXjmw8GxFFzkrd1cn4D9JF8nVVHC
	 4ME7TuhO+3bcBf1er4lgimxQ4cjYLKf+nvKsEMoH/5e2vO5SatqVxNtUzydj6GqBDA0u7
	 jcFRI0TTScx6XtRlBPHyZTGMl02dGNCHAxXSwJLhwFBPSKmwC9DyXmthV1cyJD1cXaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RakDrLwK;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AFF606A330
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 14:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32AFF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RakDrLwK
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2efd7259872so13749725ad.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 06:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795098228; x=1795703028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9bWB+Ike65eic+Yy4cT8z9+HxhXkL0til5+GubOeaM=;
        b=RakDrLwKnpFkXQ5x53xU+/JtMeb5PKs/XkG/jGg4XUbPrV73tNZs5tZHokm+sjHSaD
         R53c42cI3ZAqLjcvQeKkxZnMlquo2wkjbjqxPk/+SGxCsClwm9WbYqtlckHmdAMLAW/W
         sCiIayoTguztq+/dzFAq47t/Wgeni9PqjkfBR/GKPGF1vnphVLQ9OSbymwte1rXoSaNM
         SoSH6cEG/+tzOQwWZDOZVZXJKYCAEGrndvMQdcryCRTXj0asVWvOO0gIYKrjdEZhARPY
         FJ5yFBp4vC7QWuTfm2RHldZSJvR1Eo78YqbRmFO191CVsS3RVXrql2nTN/cbG/6WKic9
         Sx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098228; x=1795703028;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9bWB+Ike65eic+Yy4cT8z9+HxhXkL0til5+GubOeaM=;
        b=yqK8vmsD7pPiP3qKgtEcBmKBC5Ug8s700hQa0t3jzzIZ14RezVY8MGjLFqygEIcnAZ
         mYgBfrjIEd6RXQxFmAE5rUpGmqqWNvpD8UsF3uUkW/oHDhDDguxMchJ5yDuoX4UrFMJZ
         IETruv9RX++wtqjFurTbDCF8RiGwDhZkC3iy5Insyhg5c6445mTP2YHGAOVTMSd+hMYk
         GFqzXcJKkm86tTSiCx4F8NCgo0hHR7vEQ7smDObq4pDCbV92/VrKFn9d3LsXCe1fzyVo
         KH5Qwe/FS5AxX8+pL9TsNtkYSJxrODML4nGGDYlVFONTlEZlWJJq0/FHCuJatpv1gB0u
         eJxA==
X-Forwarded-Encrypted: i=1; AL+hErE/WahlDxh2kZ/9Ofw1/rmvsyQV1ZtnZtTk4P4d5AK7TFIQBZZ8mVcKbqMAK0DWVSRmaWIm4wlxs8FB@vger.kernel.org
X-Gm-Message-State: APuU4Z+6NTM5eLJwBO4bFNh+qcpDcQb/D0/w/1aHrFn/kPfkt/57iKFU
	QHDYjIJwp9V5x5ihXniqM4BIfNqG5/KIKSvQzBxu4oRHfeaSNOwHigez
X-Gm-Gg: AZFdTZcJ+DKQx55WeLp7CRtjrvuZs+lNhuLTnF2s1Ks7HO0kDMs23FvaBJeMDUGxw0z
	FXbgEvuoo1yyDhsYNenGxZpwoWOGFW4sQIEg/oMEQVlzvgiTQpHC7AFWECrSM+jku3J3hedw3LN
	zzzKxikuE9rKBpOXaxPgxlf53nxBP+0xbS1oc/IhZcAACTEsgIJ6Pta/O2iyrivlmTkZQyecHyv
	olw+kYqO99SA6ybKJtPxrQL8RogE+tld5IIYY4Zytkrp0ZcEay899P7QEyo8p5KeklrcMSm97V8
	CiQ3voAoqcwLgMK7iQ8I9khLgLwf1gLFAGF5c2FbNSs/sEuI8lWjIYzKqM4j0n2EvIQEG0BMndM
	WAFKbuCp2JgfZgU1KFC/rjgbXGVIg/II8ttPCT3ICVlC1mT3YXRgTqrUMOCt/jb3rWRWPTy0kBa
	XZWenEcORn781MC+5z+P4YNN1p6SkUSS8Rsr5o5T7pccaEtPuWVv+BiQVK28JJMdO8m/zzgTDQH
	2V7Y5Qfroi94h4faRkAERTtEi8nH0rom8nIVAvXL8KbousKwyWmmkj74Fu0woVyCmpR0jeD/ubc
	myCZOvBVfCzWjEKhwuxnvxOYpTVq/KsOR1o=
X-Received: by 2002:a17:903:244f:b0:2ef:ee39:5dbb with SMTP id d9443c01a7336-2eff754e579mr60705635ad.61.1795098228295;
        Thu, 19 Nov 2026 06:23:48 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10e67csm164415ad.53.2026.11.19.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:23:47 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH RFC 4/5] wifi: ath12k: Support MAC address from the firmware node
Date: Thu, 19 Nov 2026 23:23:41 +0900
Message-ID: <20261119142342.2063-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261014-b4-nvmem-efivar-v1-4-187c85f65018@oss.qualcomm.com>
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com> <20261014-b4-nvmem-efivar-v1-4-187c85f65018@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026, Abel Vesa wrote:
> Read a MAC address from the device's firmware node (a DT "mac-address"/
> "local-mac-address" property, or an nvmem cell named "mac-address" via
> device_get_mac_address()), and use it in preference to the address from
> the firmware board data.

Another user for this: the Lenovo Y700 Gen 5 tablet (TB323FU,
Kaanapali) has a WCN7860 on PCIe, and its firmware reports a new
00:03:7f:xx:xx:xx address in the WMI ready event on every boot. Network
profiles bound to the permanent address stop matching after a restart.
The factory address is only in a file on the Android persist partition,
which the vendor stack passes to the firmware over QMI, and the
bootloader puts no address in the device tree. So on this board a fixed
local-mac-address is only good for testing; a per-device source would
still be needed.

I tested this patch on v7.3 with three changes for Sashiko's review [1]:
the return value of device_get_mac_address() decides whether the
address is used, the buffer is __aligned(2), and with more than one
radio SET_IEEE80211_PERM_ADDR() also takes the firmware node address
instead of ab->mac_addr. With local-mac-address in the wifi@0 node, the
permanent address came from it and Wi-Fi connected as before.

The cover letter says this patch is only an illustration. Do you plan
to send it on its own? If so, with those changes (and the comments
dropped as Paul asked), feel free to add:

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Y700 Gen 5 (WCN7860)

qcom,ath12k.yaml has additionalProperties: false, so it would need to
allow nvmem-cells/nvmem-cell-names (as used in 5/5) and
local-mac-address/mac-address as well.

[1] https://lore.kernel.org/all/sashiko-outbox-171329@kernel.org/

Thanks,
Joonhoe Kim
