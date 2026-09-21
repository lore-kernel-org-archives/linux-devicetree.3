Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FEC4534A9
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981665; cv=none; b=W2OP94eHqLIixm0KvxMKaDoWR4xdDtVzWDO+Aaqlefx2IPxQLMpn9Wg40K/y7XNfS6Ep3Eokp1GMRduqD+D5dGfitHHbT3H+qYddeHi7jVTdT1AYaYZO4DZugF4+eQ0KJWWLU/JwO01HYHCLya+Hmh8KDTlBcHyIIkUAu+Dkc8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981665; c=relaxed/simple;
	bh=3GC0tuWCP3j6JKOJWFFNs0dRZF5bEAVLAyXqilWkh4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lUF68gsg0jaqPXlC2oYSXE8Pz0K6jjmZFTeJB1tVaB2Byly/UKP+mZJK0UrM9gu0dN269KXkDeD/ZhBp4A5yQaX44ZhX/rBZMlLgCbyd14gZHpoy2ITjTL6UttcRhyxepqotj2gZOlEHCxdFXmB72h/+WW9bwyOxduY1HqnoRQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=fkv4qs1A; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="fkv4qs1A"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so15490195e9.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 02:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789981662; x=1790586462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWLqjYwgWnzce/Di5lHAVRJNRcVeLbBZxhfWnjxIPYA=;
        b=fkv4qs1AC1UyQaMlbyClA2nvq8p14OJPdiclF+jcdySRT3MXizpSELUtzUMldZBclt
         KtPm4E+PRz5yJdWXJ2KzzegmcGvwmlB9Txf2r8R+p6aD49GnwTz3801FkpLs8oq+IQvr
         BNIUq6ZybERd7YmkokfyTCPgM92zC3cKRNztY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981662; x=1790586462;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZWLqjYwgWnzce/Di5lHAVRJNRcVeLbBZxhfWnjxIPYA=;
        b=nR/OYGkpbpFbCqw/e3AFWysKKqWvNBZjbmPRr7CsK0FndGDJUDk7VsnX0OTf5NomrM
         aZN0xmr9qeg13U5xqQVoYdiVi2/UjbcvecxbB0FQUqIkMD5f2cfosspv129aBC3HgZA0
         85w98h80Mx+w51svI8cJm1V5evPaW0X7StosRWNDcjavXq37lCRdbqWEqp02O6FJYJWf
         Xv6+OEJ37S4Vei3yZOXSQ/lcoUpKMzmYieoTSiEAhkT22yOiXCn70bTWvm7bTICgKiWB
         hkrpzYjq/6Odg152fRYK4RByl6+Uh95YatiOhzIaWpB4j4iPKfXMT/WY6wg1JNjrCf9Y
         CE+w==
X-Gm-Message-State: AFuF++m0iEBseL8MxuxhB8aRXOxwOIl1wvXox2bNSOIhyQdVU8dxndMt
	Gs36WqFXCOpUa2oX1KKSmRwY5BbuCAjq5o5jhwFdjQbaWidzwes57yYM+u5bu54AxpU=
X-Gm-Gg: AYBFou28DCyQGZqCgi/4T/y4JfLK5DOtBoaawOARL1O7rjld/dVTZNCRK4rZ/r1/V0p
	EtrnXQYQ2zMRxSXGkx2g4+QJBI+hbIx2/KmfqRjfnbm++WofVuAp0wh5FS8UB6ZULABuIa74Byf
	MMuBYlFTU05GxCSJK+YLCfHpbI3+QGDEj53IuKfxEMv59PdkWlcmGrMV97jzO1+IWSp5LV4tAf6
	s8O2q2jmR3xlapsm7ZHArEM4LnerxEjP8MeKJWoE+4CX4HKe5a0NDvclPAnNvGH22XN1O9lgK0Q
	7MUnn0DabNkCUOAukf0ouJtK7mOJ5IJnO7nHXdkUZrrHPZ51cxE+8frz6rFefJZ1CtyGWu2oE+7
	8zburhfgRz+tpATWPLUbsB+4IABkJd1U1i/GY2hq84EY9sIGlZcxxp9Asi33tiKtU0r56eMHnS8
	CwSjT/eGg9w8/gzRRl5KE88KVy/LFGAEn0fEkeYeDASlQROHHzya7s/6Z0II3fxTawQP9zSBWHQ
	hibzYeFrWsFfOGV
X-Received: by 2002:a05:600c:1d06:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49fc56aa3f0mr170381985e9.6.1789981662454;
        Mon, 21 Sep 2026 02:07:42 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm587218725e9.4.2026.09.21.02.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:07:42 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v7 0/3] arm: dts: altera: add Draeger M48 CPU board
Date: Mon, 21 Sep 2026 12:07:30 +0300
Message-ID: <20260921090735.3174292-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the SoCFPGA devicetree part.

new in v7:

  - replaced module with board as this seems to be confusing to some;
  - add Acked-by: Conor Dooley <conor.dooley@microchip.com> tag;

Petko Manolov (3):
  dt-bindings: vendor-prefixes: add Draeger AG
  dt-bindings: arm: altera: add Draeger M48 dual-cpu board
  arm: dts: altera: add Draeger M48 CPU Module

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 123 ++++++++++++++++++
 4 files changed, 127 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

