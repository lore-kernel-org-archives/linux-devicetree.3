Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551746;
	b=HYNZX/n2rRDSO34YhOHc8x1nDsoGxQ+ogwQ4ItpWUc2PRdozLedyyHcRTYXTTn/099Lf
	 eIY7M8DWtbQkbIngsVXCisVnqTpxAjwdnQBtnm/AYZ32ePuKqPAkNiA/a4PLStTzP6RBx
	 chRNtueVDz5FT3PZEtHWjn70jHcfMhS+eV6KD3gYMSaPNQaVeyVs5b6l97tgHO4qd+xDo
	 CI2r4i/WE2QbA+Hh3gtiILjIxPT0U/51/ADsog28ePLoyUELtNsTqH1ns6iNQvINL7xIl
	 OByS5nJKQdndWBYn8BzX4ZfNFu/ugFJlidMuQU4E1PPDhMfRpjMTOIpnGpbRq9SKBVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cJ2ObhZVOW9zHYEagygnyL7A/D9me4jEjQcn9wi7PeQ=;
	b=3haej+Rq5sdmZflfNtLjD+PEes6gM66o0IjIZKu0gxkrq98mOlNWIwBGHA5bFV2pIV9M
	 nWZfHGZok4joB1ki7DrPssRffEYUcv6++DRpg8YklXQssxJ5OB/afS43Aoj11zL99yPE5
	 GxTRdhEg1ioH83Pu4lCe40HcU2D4OAhy/5DnvCF5CJOk0XAlvCsGqUjD3I20LWADN5oRM
	 qzNkbew8m1g60H+TLN2q8/rL4PyNlLpWjuSRChfxzvFM13ZB/jgWopysOE35cgJRsP48a
	 lNZX8YtUEViYgCrSqu4xXDfWze6oD+uD32sFURlDY5b+3z8rK71gBhjX2AQK9/BEVGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JHN0T43f;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B8E606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 20:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1B8E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JHN0T43f
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso2867444f8f.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795551744; x=1796156544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJ2ObhZVOW9zHYEagygnyL7A/D9me4jEjQcn9wi7PeQ=;
        b=JHN0T43fKCmLaupHQGh44LzbmwRrXUWZiRbTM+wYyWfbCHysfoZqwPjWqjVjU2OT5A
         4mSO+cfbJz8UnHhIeGDCcShhq6a64FLK5uPzS6rtYtbzVSM55ng7xE5AyQjzqr7aP2uO
         4hELDY1Tz4BFYlnuB8XSQsYrweRZVCvfvEYSv9zLKLIV9MCquzadf2SxElCKsfdl4rhS
         q0w+PwUtgIImfhJg+EL8Gy6Hyq7XkTOHpcdo9y8gZhpvDK3n16hmNzcbIHrvAQQ8mAs8
         GgQcXE+wohPAb3ja7ceUCQZEmpkwKh5uwDvH96bPU+YB9yEjGjzhQWhWesaUCuXdga2N
         TEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551744; x=1796156544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJ2ObhZVOW9zHYEagygnyL7A/D9me4jEjQcn9wi7PeQ=;
        b=khThOiM+AEpN2uyOuO3hmuJEssFv0CKL9ETUlfDQp7hGm2T/rd3Dc7I7d9NSpx9gnd
         iOOGTXuhH/A1EymMvtRQcn2ftMDUrxAyOlTqboIrcFnAqn3jMTlIp3JwmZNgBOSGtRka
         Lp+3LdYni8YeZrDMTu9U2TIqO3nmIop5gDMHDLGAg6HGR/+UUExFQE/kiMwP/hNQxI41
         ML7U5XM+YDNuOAUF6Pa9e5heqqsV0ol08xFimIovTnmOfH7X8Xp7qu9mSRtkoCsHL1NZ
         L1skZqpzZNxfwlXl9tKszAlxNKJFDp63zxKk65/xJ1cLUoXYjWnd3olF4qbI5vCecRcj
         UJOw==
X-Forwarded-Encrypted: i=1; AL+hErHRrN4EpOERxYK/bmooJ9FQIj8K2McveqcjvNELiXCK7KhC8Pb3CU9Qlu9jxjJdq1Hue7H9fAzh5Ik4@vger.kernel.org
X-Gm-Message-State: APuU4Z9aGgHs5GLUE1iKHHnsI5N20e8mubgJOWpnp3k8K2TCarNm+lwY
	aSNNuu2TcnCDwgKs442GOLGXuoUZciDESRgQrbD/HeJPqLPCu6L0P3aeGeWWkEeUEQc=
X-Gm-Gg: AZFdTZeX8aLdNN1wtf36iIfd+QWXR6CqTzd4Cu74g5A35B+6/9ZOVrWDxXcb4SMSfC/
	M77cvfYwZg/hzEmuaivmjChxTZOfxgaNbwZYEDo1mujDnLjoOCfAYr2U/01w2GxrxlEqu3oL7Rh
	5qbW/7bMYTTGpocwItwW1yH74R8q5PRp4r5pEyZ+tqAR3gowZxVRAkMLUCZOLQ/4CZBQ2x6WnD4
	v7oub7T4UToIhL1pxQY7YkJFrOCaJ4bPAjeJgwJfVBgZ7MLXu8onap/LTXOx3RAcHuAppOCsBit
	YXrJOQSenTmD0xKG5FbSSud2iN5zm7gZvZf2hlfDhbWEVlNBRViK4b5EWaS7JQftbOZXaSXkVy+
	+Mi7CbHWOo529fmA9Er8SVkgGZdK7EqPmZ84xNhT6LG1Tpjbhp1RuCKtKowxlLyGEA7CZydl2bH
	sEQt0RaExA5aTYBlu73WcqnM5mD+ur11OCl7G2qMepfWQ5kSmI7Ue3lE6QyqWGe7dEKkokkaQ4R
	fTeY/yebFA31bG50DZ7XgICD+vtG7CkH9Wrx8ALpnWvj7FAjk39DY5Ww4mqXcO5cVGPS4eS69Hb
	/M2nVeDlaL4xl035I5S0zfHKJ19ak7W5JD9iHsGlwJQKdd4hj2Ptqn8z8hGRWEixWSYyk2MvVlh
	xhS0CpiJ2IXc=
X-Received: by 2002:a05:6000:1841:b0:48e:6f76:de9d with SMTP id ffacd0b85a97d-4abb4c7ac1dmr35270346f8f.46.1795551743608;
        Tue, 24 Nov 2026 12:22:23 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm35130525f8f.21.2026.11.24.12.22.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 12:22:23 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: fabrice.gasnier@foss.st.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] iio: adc: stm32: describe the STM32H7 temperature sensor calibration
Date: Tue, 24 Nov 2026 21:22:18 +0100
Message-ID: <20261124202220.23721-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

The STM32 ADC binding lets an ADC take the factory calibration of its
internal voltage reference (VREFINT_CAL) as an nvmem cell, but not the
two calibration points of the internal temperature sensor (TS_CAL1 and
TS_CAL2), although the STM32F4 and STM32MP1 device trees already
describe those cells.

This series adds the two temperature sensor calibration cells to the
binding, and describes the factory calibration area of the STM32H7 in
system memory, passing its cells to ADC3, which the temperature sensor
and VREFINT are connected to.

PebbleOS uses these bindings, including the new cells, to describe the
STM32H747 and read its temperature sensor.

Gerard Marull-Paretas (2):
  dt-bindings: iio: adc: st,stm32-adc: add temperature sensor
    calibration cells
  ARM: dts: stm32: add the factory calibration data to stm32h743

 .../bindings/iio/adc/st,stm32-adc.yaml        | 10 +++++++++
 arch/arm/boot/dts/st/stm32h743.dtsi           | 21 +++++++++++++++++++
 2 files changed, 31 insertions(+)


base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.45.2

