Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9F8401A18
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666559; cv=none; b=WYzsAcghZlDxoMXx1ftW208Z9Pvc4Ha1Z0JCd8XitFUzrelwyAK/8Csb2E8Zt5Qyiph5rZZx+f4CJAvAHCj6aABebNpr2m7tyOeikcdG/8axjjpHg48g+fci5UHsSVwBOvlYXu/I6I007UBC/PW6GFu92LcoX7qrmqypvffWgsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666559; c=relaxed/simple;
	bh=z2I0A0CycI6oBP+Au4Bkf90I0gfA7BeoCZ3tstQPwj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e2WmIDXVbOpUiO65bLYd54l6CydUGLtNgtBbgL8jpK+ZPnnfTOnRFwQIuqb/j3K4yWU2m//Zu449G2ZrmANKbSoV022g0Ip7DHwr7jSXHZepoTPSXTskkWWwnqfboDOEOITg5WdeYxwgiTrKFWo9VfVg4cw/Ez5iMFua3RLF58c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=EeiTCf5q; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="EeiTCf5q"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso8109628a12.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 07:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1787666556; x=1788271356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WfKwrsQsbhSFEOX6SfTu36xoTWQiVVGz+Pctm+PKW2Y=;
        b=EeiTCf5qnBH9XAiTza3HzuWSA/eNTQjDJbs/0uad7aSlqw6DLCJWFO3MU1XxpqyFyW
         D4r0e/X88qm/pZ+qvVNOcniRxRrHuLS8SIbrMfHhky69zCMNVRWU6ieLL/euS9/eKUEG
         IAWQiVTdZVBQZJ7qbXl8jUcvx/JTBFGKXf4Wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787666556; x=1788271356;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WfKwrsQsbhSFEOX6SfTu36xoTWQiVVGz+Pctm+PKW2Y=;
        b=JKhQiJkOdnoTUhVu9PWpOBqA05BEeTGcHzqOgk2iC7TBr4mra148zL+zhPoHhmeYiF
         1afOS7iK9rJQpMo5xqJIGbUl8+1Kh0psm+m84sV52f7XDcNpEyH5UT1ljEUHd9zYCoO4
         OdnfiC+d39T0JYQh4WiQmTZbGkdjaE8KyKgCk93p/9AERhe4iSLNnoDAVLTg8+xbpPP/
         PcEsTuhel0vTvJh4QYbIVFAdNA06kdnahRa1J4Zx9p0pa+HHWcxK0Dro7UySI1qyO0em
         UaSzQ0uV75SEazIlcKpAxGjIh5T/Vt5fThgPwvAkiC5u4XGzIpuwSk97/B9QPZwq21z9
         CSyQ==
X-Gm-Message-State: AFuF++n11b3MlnCgWkzI6rlSWo8CjSGk9rFeEi/fPboiL4eKioAXgGoP
	ZLO2WKdh/fF+sxuXWLpuO8b7fB2+hAE+8Se171Jmo6z/gzhKK8VTEvJ7b69fVUp5tvw=
X-Gm-Gg: AR+sD13x0JQUO8L3t5Gd7Wi9Sp4FvNOZWFF+k53RtksFRV7I19CqnkPKPzM8SAjfRi0
	sv+gQQDKEfba0CtQvMsjqUL2Moi3MyRBNmend/41aEJ1fHNppdHn3uuXNgBx5qnremdUkh5TkSZ
	d0LzJ5Np+gu+bmIKc/fslNBn9dUUxZ4/bjb9rP+KqaW69l8vjYAp/nxiwBLIg/Y3knhNum1y37R
	5nHs1qqwKM0nqXl/lYb4JQX+jhWKGL59VjTx1WW81mT7jWfAXc0VC0PLJK4Jj/PVp70LB+7clRI
	PlkKjJddqAxvucrerPBRlK/3/xfWkQywDUaIdyQkug0qf8MOQnVnk69YNJM6Hhz9IZr4ftQObDz
	dx6bGhe9Xbq8wuCS5Lv8w9eetLuE38rCaNeBXbdm3SfSXEDlPm7rVFB/QlTt7HxdwBvg6Ekuc5B
	lZmJ3UbxPluXYYvo8A0CcUSLZjBgFxe1aYeU/Kjr0ltMfEt8JIfxgbQa/dmiHaAzKgSf10w9nqa
	+IGXg==
X-Received: by 2002:a05:6402:2490:b0:6a1:f93c:f0a6 with SMTP id 4fb4d7f45d1cf-6a5c4157aa7mr8612511a12.12.1787666554460;
        Tue, 25 Aug 2026 07:02:34 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00129fsm17187878a12.1.2026.08.25.07.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 07:02:33 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 0/1] ARM: dts: draeger: Add devicetrees for Draeger's M48 board.
Date: Tue, 25 Aug 2026 17:02:21 +0300
Message-ID: <20260825140225.3968019-1-petko.manolov@konsulko.com>
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

Petko Manolov (1):
  ARM: dts: draeger: Add devicetree files for M48 on NXP i.MX6(Q)

 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  23 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  23 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 369 ++++++++++++++++++
 .../boot/dts/nxp/imx/imx6qp-draeger-m48.dts   |  78 ++++
 5 files changed, 495 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts

-- 
2.47.3

