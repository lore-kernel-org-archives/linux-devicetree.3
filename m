Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456388;
	b=1xL6MFD8klSkNybvu/PBGr8OiigDsVnVsYwhQJhm+nu7N0Y2kKTR5xXPlAZqo8iUZ7KT
	 ucMEFOBrJ6vGAof1oSts0LYzeaT/2p2jxf4A/+oZ3VjmsOCTeMnllY//21jg2iTQqXRgV
	 Bc7Ik3Tr9hILDQ7tv9Jr9vRzcI3DfaswPKAGJFzHUtrB3frgMfw/oRb5+S/SW4A3L4MJK
	 gBqsOVh5/i8jqdGPLMyGNhz+I72a1ncvEYMNF/e9TFcipEg/hyoJJeCdgyhDBx5X/g7jx
	 yLSP5oBn2MZ6cZPDqHsDNdLCNhnR/XiUnbwU3VcjBWpb1JsfWGe8iFJNmqBbCor9GFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c15yII0Bbqbvlrh2M47suTP3fe26fyb8Izw0IoDwLNY=;
	b=aC73b846zHWZ2KvIh7aLep57DzxXLioLOEyEx8c+n5tEiXeadtqL6Bv3P7WWAtVcPWzv
	 W1u2nhQ2H3dFylsJHWV4NY8iMDObLBYZQzyMG9YZ+Y7lENefnIsYD/qi5WUI9i9l46+dI
	 b3wicQT9SXG5P5g1lxhEnNhh/HxwGxUwase+gU2F4GIulEHRdQx0vA8tQWDkHUsEDs7JV
	 QkH7luaH7RozO6KHc2CIOOFLeJvwZ17tEvFAGa6hw7zOYBCI+WjolJMhtNAapnhLv48R3
	 6BTh2vcky+QGRD0G65bKxfjLfLxQOtGsRenzPCtcBDa3KinmJjtfjAnPDcjADPGW9qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=utAh3K9n;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB03C606A31E
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB03C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=utAh3K9n
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so9978055e9.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 07:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793456386; x=1794061186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c15yII0Bbqbvlrh2M47suTP3fe26fyb8Izw0IoDwLNY=;
        b=utAh3K9n6ASkvDKJCVcthNXfPz/IXZukGbpuM7aKzBdZQ/aWHtg41rLYOxQx+vyywK
         WyliRtagefBD3CuNc6cy3qlkAVHtkwKGaf8+h6pxEpjCyTxzOGbsYi+f8aHxns5KK+hL
         iHE05tiSBV2MEtCWBkRFA2TFoP8kaQ7zMHIjh9Wqv8ciRlbItUIUZjjLy84MGZYrkb7O
         SLcFer62IwjVekybP2FP4RyADwVJGSoWqaFAkG+TZDWoHo+uIndqCkm1RKmCQUuflLZ3
         P+vpGJlOQsZDfm9K09G/35yl7q/OuYF8nld6YjFCE0CA6N3tseIpqKhp0KxLk5pY9oZ1
         PRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456386; x=1794061186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c15yII0Bbqbvlrh2M47suTP3fe26fyb8Izw0IoDwLNY=;
        b=x6Z2j/J5LsK5kP4fYa0KSRoQH8NAMF0D00DPC8TfP+DSTe7hJZImUxuT3ilH5idhmR
         WsQNNvctt81LzdlfmT1j5Ew1MvnRwXXuPeIM4NPuhkBDPZmQp44WJxa8hAUCTXfFK4fm
         q6EF0B7MVPHnWUQNx2vbqugi3gJW5heEi/tERX1j2nD3Fu4EThfpwfF2T9PyTXjPMoTz
         jWn4P4gaDHDoI0DOv/OYDh6kx1LIFRcAHxVgNLlD8ZqaGpRZY0cMvhcRygKL9BOn8zrX
         MSaocT67pk0+gagzwLzDxYrZuAvExxS4/Or3MaTsxz6UEEckhq0guddo6tFLpEcYhLfw
         OX2g==
X-Forwarded-Encrypted: i=1; AKwUvBz46moZGlgZ4Cz7bIKXdF6wLsHrW83o2ALtfH3hbEKFTFeb7tMFHKQSbiME+R6gSyi3g5vX8zwiuXoR@vger.kernel.org
X-Gm-Message-State: AFq9FYKWdaiRiAcL2zXpp3bQLrQRZFtGJZgd8Jxhcr01iEY5kRb6q+M8
	i1QdQ/zA1cLl/iC2/RL02jBx3daS1X+M/sATVh9eCWrQWL9K19UxM0I=
X-Gm-Gg: AYBFou2E8FOsRMpWUF/HMCIalmbpnxjvUk4urYeD8xoy5O+QmZ3Z7k5K9p/0uIUbmrD
	NhzqIA1CFAnqJmNsZc97noFHRYyLQp22gWhvp0zrefkwyisBROizEFzg69YGR49JMMkJDMPPPe7
	zRvsyx6bNzHZUBqUP3tjUsSnz+OT0UF2P8GHgdiDYKZ1u80won6voNZlvyKWjBWwqEgMmuvZbW5
	Elbl2WD7nkg4H8/lIlTfm+/Ezb5ygipnSTEFCTvUKYui8iDrveaP+CCM8At8iBmovk2RXWEPhYN
	Vb5kTjVOTzhbgi7+8vKhMLQOhE/LtQqgWulKcd0/3SZQVDymfv3o+Dp/SADlFzn3Qv3RUuNxaIr
	z0sOB078RyD+vINCmyFBbqb3qoPBpM4lt7cfWYUfoXdCCO835BZZWP84murwwYxFpph4ntPXvY6
	0mXa4BLZFPc2lWDJezB8pFmZz2+NKmf33Xc2FTZ1Xqtu0PTz9OJMsKK3mASwBYRb20EkO2+jr7A
	3IIZQtDeVjT/adIumfNRbOZIddiUZcBDi6WJW4Kvwpf2zz7BiodeQj+dLzK4YRVTl7nhcm55Z5D
	uUP48UtbZV3ojY/U7i58x5HuyfOtb3wLnGT00YX+
X-Received: by 2002:a05:600c:4e49:b0:4a4:6fdb:cc42 with SMTP id 5b1f17b1804b1-4ac17b2c38bmr128602715e9.11.1793456386005;
        Sat, 31 Oct 2026 07:19:46 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm209871275e9.4.2026.10.31.07.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:19:45 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: daniel.lezcano@kernel.org
Cc: rafael@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ansuelsmth@gmail.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH 0/2] thermal: airoha: Expose EN7581 CPU temperature
Date: Sat, 31 Oct 2026 16:19:10 +0200
Message-ID: <20261031141912.1664575-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
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

EN7581 has a second thermal ADC for the CPU die at SCU offsets 0x2fc/0x308.
Expose it as sensor index 1 while keeping the main ADC at index 0 and
retaining zero-cell device tree compatibility. The hardware temperature
monitor and its trips continue to use only the main ADC.

Tested on Nokia XG-040G-MD (EN7581, OpenWrt 6.18.55): both zones read
successfully before and after reboot; temperatures tracked CPU load and
cooling, and matched direct ADC readings within 0.3 C. Twenty driver
unbind/bind cycles with an IRQ pending preserved both zones and handled
the interrupt each time. The driver builds for arm64 with W=1 and the
binding passes dt_binding_check.

Vitaliy Sochnev (2):
  dt-bindings: thermal: airoha: Allow sensor indices for EN7581
  thermal/drivers/airoha: Read the EN7581 CPU ADC

 .../thermal/airoha,en7581-thermal.yaml        |   6 +-
 drivers/thermal/airoha_thermal.c              | 157 ++++++++++++++++--
 2 files changed, 152 insertions(+), 11 deletions(-)


base-commit: 2dc1f296b5754dd2441fc8b6613a362a47f6b98f
-- 
2.55.0
