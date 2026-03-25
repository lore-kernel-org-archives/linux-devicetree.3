Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6138738837A
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 11:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775216199; cv=none; b=mfdrwcIgWA8sKxF4Ol1dJyCvy6seYgGYgAxJ2/MBGtipFglwdrknFvnc2jo261GCuggD+KpyGg/UQYrj4cRXF8PeSgBglqTJ+w6HXHuLlvVDXs8gNNqvK7QYzENMdwo0PM65I01GyAGrvjo93QVrjmDSU9BCssS+Tf3xE1LFwac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775216199; c=relaxed/simple;
	bh=B8gWT6yTtSDGc4x7LRJPQ1QhmLOMEOeP5TcL05gueFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q/n6A5/LYYmnZ7NdPF8SvkyHK417MQg6IDcJSQnVNiZaMWJkb51X8Lj7Rw9BA0bW+vph12jAB6fpa1PB+iLvEAnljGEmSFPp5Yuzen8aQeBPxJfJp4A9xCiWHDg2XNx3L3qPL6Nv4rXpFoFI+JVCwjO86Me1cKDbk1E6ITZ0xnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oF4wq75G; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oF4wq75G"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so1004329a91.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 04:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775216198; x=1775820998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ASYJwuBhu5a8LjNhoHAH0mC1WnGEKpiV1VXSV5azjak=;
        b=oF4wq75GRYKXvurqENaf9ZMhqnf2RVWh98M8XZJrTUKyjWvxcYBwT/r4vFXV27tmla
         Lr53WQcxq04+9MhcokYV1miZAD4BZCI+GL2vRwr0x/wUkIcn7wlMV0KWizWam2RPe6mk
         YqzCHNSdkEQrKkN0JZI4T1EU9xfsS6qsH8K4p0os7ShIRuKTDHKWQfVMYHWt5vgFjtdW
         fdwaRv352YPlOwAF1aNq7U/Iouy2e+ze2IRYgpH83cBlwcbNatbrXZM7USZd03sUc2ri
         6i2S/Xmn559U06I+Vs84la2UZScr0V0kOFJX5hko42UoHchmUobviU8Nu4UB9pkGrWm2
         J0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775216198; x=1775820998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASYJwuBhu5a8LjNhoHAH0mC1WnGEKpiV1VXSV5azjak=;
        b=mgEUOlwIE5EWHOtSQuH6dWgAf4tE0sD5stzxUSsYtLT0f1+cpqzwJNw6nG6IbsdDLm
         BIMEA1H/Ux5wf/c/yGKWn9IcfXLMWrwEPdCICHZTMzqvq7ObTH29Bc7etAxiT+UQKQXG
         WWrl8rPZQ9dy8GA5bYarDSmYqk1DB+YaX80dlpqJk/f36q/u+lMh+ax5RO7oqXkuJpKF
         +Wxb9WfFxr6gOuffLLrP+U2msvzaToOK0lkt96pzV7R3bPYljrWcNCWQfahD08MV3SVY
         NGueJWqJzzo+zmkmF6K9d5IoIRFcsC1iACzIHPztMKNLRbcoSEnobexk8HlRGwUBqcTx
         7m+w==
X-Forwarded-Encrypted: i=1; AJvYcCVQ7zdLuHnPc6aNwp4one4OwFY0ygvJ8/tNcvxC31DEIUlI9um3cD0AalexrHDetSSijGrxNp5EqyHT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6gMxDJf1iKJK853GMHHFe/C/+jftPL5LxEC4VJTHvqK40QLQ5
	GOXW1hEnDHM4NcS+vIUXLHuzH/DNYlGHO+W7Bmw5/8M3LDpPXvDX9bdz
X-Gm-Gg: AeBDievYgAbAoxFM/3qrqiXwVgIpw6nqPY2cHLPXwBb7ZqxHa1/selLUF2BfbBY0uLC
	s0Ko7GB7Qy6mFDLprF6JH+754llUD9fKArPjDHQW6/QtPwkPuBHYnqSJ83gUCkXGYCEvy6AffxW
	+tsLTpmnQh0hCa1UTk9JnkZ+zkDng+pOfZclwV9MZmqBh1lbOEiVADPDUhh6I8JQ4NWMay4yD43
	h31nszconRqmdfkcmoFVqqtiGJuzCkgWNnPyV8KBCV89OTifraaDBlFXfdxGim6Li/qoZbGFf20
	80iNeWiHu/1/c5mazKuKt133XEPpLwmEWb5ZED6GnCAVpFQbzDB/pjuSg6m72RbIkNLTpBoRcL3
	JIcdbKi37CPNyxdWNmgum7l0Ep1bE4y+2klItiPn6gW76PqOF2lTD2+ZMJh/fS9g8Lwq+MfTWN+
	d0bTFXPj9wcsn21a+M/uA=
X-Received: by 2002:a17:90b:4b89:b0:35d:a9bd:1ff6 with SMTP id 98e67ed59e1d1-35de695fa86mr2252467a91.23.1775216197136;
        Fri, 03 Apr 2026 04:36:37 -0700 (PDT)
Received: from archriscv ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6860cfbsm957599a91.6.2026.04.03.04.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:36:36 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH linux-next v1 0/3]  spacemit: k1-bananapi-f3: Fix the power source of USB3 nodes
Date: Wed, 25 Mar 2026 13:46:07 +0530
Message-ID: <20260325081700.1502-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following changes fix the power source of USB 3 on K1-Bananapi-F3
development board.

Bananapi F3 schematics.
[1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view (page 24)

Use this patch now we can enable USB hub
[2] https://lore.kernel.org/all/20260326100010.3588454-2-amadeus@jmu.edu.cn/

check regulator_summary for more details

$ cat /sys/kernel/debug/regulator/regulator_summary 
 dc_in_12v                        3    2      0 unknown 12000mV     0mA 12000mV 12000mV
    vcc5v0_sys                    3    2      0 unknown  5000mV     0mA  5000mV  5000mV
       5V_VBUS                    2    1      0 unknown  5000mV     0mA  5000mV  5000mV
          c0a00000.usb:hub@1-vdd   1                                 0mA     0mV     0mV
       VCC5V0_HUB                 2    1      0 unknown  5000mV     0mA  5000mV  5000mV
          c0a00000.usb-vbus       1                                 0mA     0mV     0mV
    vcc_4v                        1    0      0 unknown  4000mV     0mA  4000mV  4000mV

Thanks
-Anand

Anand Moon (3):
  riscv: dts: spacemit: k1-bananapi-f3: Add vcc5v0_sys regulator for
    Banana Pi F3
  riscv: dts: spacemit: k1-bananapi-f3: Update USB regulator on onboard
    usb and lable
  riscv: dts: spacemit: k1-bananapi-f3: Correct USB hub power hierarchy

 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)


base-commit: cc13002a9f984d37906e9476f3e532a8cdd126f5
-- 
2.53.0

