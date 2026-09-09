Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346571F12F8
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952535; cv=none; b=TVXV3ZwRpnoMK4ru4/KM9+lQeQsgDneBffLZMTXstqQUg3CiNHKxV2+qHR9gKyYvHbRjZ/fS+tiK30xUi7BVoaPWfL8Lj85twIdTE9fZUqvBt/E/J5rX6NHP0nSpw+j3QrULCEmXkRuCX8Nvkayl38Z1CvE3M33R8t7sUDtBAhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952535; c=relaxed/simple;
	bh=snlMqwyYUafP7d/pSIwvzXmTqJKkpO3QnYy28S7ZydE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YexzZwjvmvhpT9Z05y0CxHe5VLEBGu9tOXFzzU3dNIckdl0NT0u4mfVAguTVw8Clky0Qhcd866KRmjeR7AJsPGQwYpRzTrJaGYyCkTuE9UbpSHB7tVv/ZQ6C5/sx0qRJi2ySkP72RJOyTKEZ8WvzUsI+YhZ5acCjGoDsSy/D9DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Gf9qvHpn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Gf9qvHpn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so37090685e9.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 04:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788952531; x=1789557331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoxuaA9JpWMgU56nq3M5cvSZAVoUseUX/nhRtKSz29E=;
        b=Gf9qvHpnH/OqfJzTCcCsBTaoRO2wcXlhi8Y3dVYcEKPUs4IjhcC5rPR/sOMoPeSYpB
         PAJpQvyTy+0XY4oLjbslzMIHueeRPyFo/HQwyDYI2lKNHEpNdV+vRUxTMUxfNQOkvqi8
         V3mvsuVfBESLa0jgRVkO1GwTR4+MicvuURk2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952531; x=1789557331;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LoxuaA9JpWMgU56nq3M5cvSZAVoUseUX/nhRtKSz29E=;
        b=tWPufLNmd9BiVDaTITrojKKqlwdniURyX6fdHR9NFRGmxKXctBQh4MHa7MDmBhb302
         GAfSuLXTxUE6J9q/40g7gX7FdvjCQrByL8/BCZBiVgZ56atUovWoNj3DFRwZwGY3Ymmg
         Br5RWoJd6uffnPCYpmjcBH/1uhnjO1/D854xLw8l8n0xuG7kcsDkYFr+ll8K74eOG/EO
         AdZvIZf11/XnPvFjpeOqhzV4EC71zNjhPokHw/8VnP24i1RHLPdcncbAHb+wvxeOvE5F
         eU4esntj0CjwrRjM++sRgXF8XrmT5ZuG3vaaC0RfY2FUBgjT7tvtsFJVBJt/x/uB+lTX
         DIKg==
X-Gm-Message-State: AFuF++lWqnV47F9WDSjy2euw1qVgHLKYjbU5+wNnsR5fxI1nZSXwhFoA
	QxGuK0+6Vk/HdyBcc5rDNa6izZ+SO1p0O1L62j5kMnkZuPtViY8Y5vNdo4LZQeR1haE=
X-Gm-Gg: AYBFou30GM/i+7rMTKWDrLeNBDTqeQLdXJbEcE4vwMnb9b7u+LeBm3wsAT4y+jkbX8g
	BBhaUxkDeNHWJMqPwfFvcTsYVt3k5BQPKq1g3+pNSvX55qM99ydpVDLEX5nZnswVazKEVs3HCcI
	zvdQJwt/pG4ZIi3D0LHQZfj9sDFuIItEyZdO3L3l931YTnPkhBvEc97/YMYEGCkICGsaSBMwcLK
	Dtx7WLp/f7kTstiiNM6ia2jjE9UpmceMfSaRQFt1nM9jxopcZoCpv8ZzfZs0kZBAI/Vpv7PhsOz
	H9YEIpR+xMyexS/7b1RhMQjXdnGvjYnZ8snZCRxARANidkrJt8etynS8iIwzJYEUnFMRaY54vbn
	OvbzyRw1gjF3mRTkeHmHyv1o6zHWAAOR2MABcy9BL28Ttk5a+2McJCDEK5bxrdZABaVrcxA2KYG
	KIqKgfT+1KMj9PSZhywgVlFYCf+HzBRmE5genlWaKOhqhnLUUF5HMJzQoa8TP8rB2xbAe2K5cPe
	kFYmTxtRYptj1jB
X-Received: by 2002:a05:600c:1551:b0:49c:fa21:1c89 with SMTP id 5b1f17b1804b1-49cfa211d5fmr340935015e9.30.1788952531125;
        Wed, 09 Sep 2026 04:15:31 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm107391915e9.4.2026.09.09.04.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:15:30 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v3 0/3] ARM: dts: draeger: Add socfpga devicetree for Draeger's M48 board.
Date: Wed,  9 Sep 2026 14:15:08 +0300
Message-ID: <20260909111513.2259643-1-petko.manolov@konsulko.com>
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
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the same
carrier and they are cross-monitoring each other.

This is the SoCFPGA devicetree part.

Changes in v3:

  - add Draeger AG in devicetree/bindings/vendor-prefixes.yaml
  - separate binding changes from the actual devicetree patch
  - remove "earlyprintk" from the boot arguments

Petko Manolov (3):
  Add Draeger AG as a vendor
  Add Draeger's M48 board to the SoCFPGA family.
  Add socfpga devicetree for Draeger's M48 board.

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 129 ++++++++++++++++++
 4 files changed, 133 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

