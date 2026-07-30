Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20CA434409
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417526; cv=none; b=MLJGQAGUiQzierfodqN9/ou3eCf75N4EMX6hdx0vBIIBwKlMiF+FKD0TJrj8iR39d7YnNPJiauzth5E3Dt3M6CejSRqvSlMlnaaqccpUZqAGSUW8MHJs16k1L5h8W7wf/PoCZr984akTrVuI2UCprHaIGaIjT/HJu3g180yTlJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417526; c=relaxed/simple;
	bh=yViWIZbNIFZy2KEtroEk78bC6uXTreWRWeMBQjIOHwA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hx6RD56e87gUdUR0yRzrtNaLL95rcK6QlQnXMloU6voimue+UggH5FVNQsSpiis3rg0csATe4GltpOBKgBo1DkTlSylsGdARNmZNrG4i7gvWpP9YubsECbHNCwiK7t4pFTpjCzvRt2JcbzBDztvpQ9jn+84Bk2iwTsmx4+Zz5Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b=UrDNyIaX; arc=none smtp.client-ip=185.125.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b="UrDNyIaX"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4h9qX74WclzCjr;
	Thu, 30 Jul 2026 15:18:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1785417511;
	bh=jf4ZRq/wrnel4LOU01dqWeI/qawB5heyUyukbpuhQ2g=;
	h=From:Subject:Date:To:Cc:From;
	b=UrDNyIaXTWMhJduxqiqjfeXqAG7dEVtRVJOtviak91UuMfbr4wwWspgQaDckEGdwy
	 G/5GqIqDQu1yPs/cD31bdnFO7wKEbLRr9Wrn37wQUqLJPF0uDZ4CUz02Y+XDnLmeHM
	 XO2Hv5mtfLmzsjYIBAPGuz3AczreT55uLQWPBMgzG5T5CRKkPeCAKl7Me0p2ZMGhAc
	 mgZP2nduVaZclrlHZbPR/wc2E/R7PnWEMQIM/VfAytssSAPIA22p1+c3w6xXvWHIvL
	 3xdPeMmlYPbhK4clvF6AEKz6CWEp8waAlQr21i37KbKH/hU1jr0NnWnJ9npIgiAtii
	 XQGYxwAoDp0Jw==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4h9qX53YB7zGNB;
	Thu, 30 Jul 2026 15:18:29 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 0/2] arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter
 for RK3588 Jaguar + enable CAN0
Date: Thu, 30 Jul 2026 15:18:26 +0200
Message-Id: <20260730-jaguar-can-v1-0-9b566bd785da@cherry.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBRF0a3IH2tSlVTYihhUPXyDkhaRNPauG
 J7BvZECPCNQk0XyODnw6hKKPCM7GzdB8JBMSiotq1KKxUyH8cIaJ2qUuoeuBlhFKdg8Rr6+Wdv
 9Dke/wO7vge77AbzJB9luAAAA
X-Change-ID: 20260730-jaguar-can-9e36be67dec2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Cunhao Lu <1579567540@qq.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16-dev
X-Infomaniak-Routing: alpha

This depends on the RK3588 CAN driver support series: 
https://lore.kernel.org/linux-rockchip/tencent_76C8BC251C8C3C068C23BAF859351DD3300A@qq.com/
I send this series early to try to prove that CAN2 also works on RK3588
as Cunhao Lu stated they only tested CAN0<->CAN1 loop. I cannot test
CAN-FD as neither Rk3588 Jaguar nor the Haikou carrierboard for RK3588
Tiger have CAN-FD-able transceivers according to their datasheets.

RK3588 Jaguar exposes three CAN busses. CAN0 on the P5 connector on the
SBC itself. CAN1 and CAN2 via the proprietary Mezzanine connector which
are then exposed via the CAN1-CAN2-UART4 Mezzanine adapter.

Enable the three CAN busses. This was tested with

ip link set canX up type can bitrate 1000000
ip link set canY up type can bitrate 1000000
cansequence canX -p
cansequence canY -r -q -v

with canX being one of the three RK3588 CAN controllers and canY being a
USB-CAN Theobroma Systems Seal device. 200k+ iterations in both
directions without an issue reported by cansequence. I hit the same
issue as reported by Cunaho Lu here:
https://lore.kernel.org/linux-rockchip/tencent_D802EB485A801362BF9F54130C0D990C6206@qq.com/
Namely a bunch of:
rockchip_canfd fea60000.can can0: rkcanfd_tx_tail_is_eff: echo_skb[0]=NULL tx_head=0x00060f7d tx_tail=0x00060f7c

Add support for the CAN1-CAN2-UART4 adapter.

RS232 UART was tested with:
- 1 256-character transfer sent to USB adapter (and checked),
- 1 256-character transfer received from USB adapter (and checked),
done 100 times for each baudrate among 9600, 19200, 38400, 57600, 115200
and 230400.

When the first transfer after a change of baudrate happens in the
direction "to USB", the first (few) characters are missing, when
switching from 57600 to 115200. It doesn't happen when the first
transfer after a change of baudrate happens in the direction "from USB".
I have not investigated this issue, maybe a script issue.

My script is:

for baud in 9600 19200 38400 57600 115200 230400; do
  ./test-serial.py --baudrate $baud -n 100 -B /dev/ttyS4 /dev/ttyUSB0
done
for baud in 9600 19200 38400 57600 115200 230400; do
  ./test-serial.py --baudrate $baud -n 100 -B /dev/ttyUSB0 /dev/ttyS4
done

test-serial.py is
https://git.embedded.cherry.de/som-tools.git/tree/testing/serial/test-serial.py

Another way is:

./test-serial.py -n 100 -B --min-baudrate 9600 --max-baudrate 250000 \
		-F baudrate /dev/ttyS4 /dev/ttyUSB0
./test-serial.py -n 100 -B --min-baudrate 9600 --max-baudrate 250000 \
		-F baudrate /dev/ttyUSB0 /dev/ttyS4

The latter will work just fine, the former will have issues mostly with
baudrates 230400 and 115200.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      arm64: dts: rockchip: enable CAN0 on RK3588 Jaguar
      arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter for RK3588 Jaguar

 arch/arm64/boot/dts/rockchip/Makefile              |  4 ++++
 .../rockchip/rk3588-jaguar-can1-can2-uart4.dtso    | 27 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     | 16 +++++++++++++
 3 files changed, 47 insertions(+)
---
base-commit: 942a6a4d3a94f24d39dd4dc2664c950972d66c59
change-id: 20260730-jaguar-can-9e36be67dec2

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

