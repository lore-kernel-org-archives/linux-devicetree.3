Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795128014;
	b=4phJLxZMvHrs4eZ73keGCdE16fREkspzwT9hwWq0tVVoNPzJUmHuv72B8GtdIfVx9bjv
	 MYrUxAXm2aTwk+sL1RghdD73r3+yHF0JUK3hwdE03iCfYU+bTMX1BAPOFTYRiPYxs92Q9
	 Cex21pVBbD4gea13m2+yo+mK9sQDgMmIMZI1CR4/KVLMKLpyj38UJh6ukdVBTFF8vNT9+
	 CNTQySkpyYI86rtG9BtfeqfCOvyiWVr09zI9IK0m8MG2sb7Oua2pcuhU7SR0w9xSuVprr
	 El6IGz2Ce3nNDZWYM/RAT+/0hgxrhmhg7jDw1dzCM81ENqbxzkNMMzovmqxBhftJXNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128014;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=rKp7PNH6tJNu5Ik4ShS1ZRJDjuC2vJSB+ltgqzc0spc=;
	b=XrkP7RTKKgHkMQcP20GnoAh0tBYyZ0J0sG8KAK3xU4kODmaBovxzdu/RDObVPjkmlzoT
	 FsJRQD7cTgnaWKR8EfWNqereirUxRNSOMFS9L5/hNsHznZS20LJhHwZYfOteEfTmDUCdr
	 HaBfdNCrerBN/v0keEaQBzIodWGyjA3xt16r7uYCfsnSFbp11HzJ2Jad/cBZgWfnq3Jhp
	 ttkDJu6PQEfqDxn/fJybGLifWJauWpiULFVzUL7wFoBGHltYMom2VjQWN5IlEGsZ/t1CM
	 TiGARuVfRHVWsL22V/q/hOz2yN2TvLH9hzTZ/YDRKJ+CW4BrdZyVhbvYRJluKlfXWwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hugK28bK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB712606A320;
	Thu, 19 Nov 2026 22:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hugK28bK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795128014;
	b=qIqpkEJ6m8mNnMtpMVU9Gy7sJggIRP+05q0ooFrRWZRc6zJHQ9QlXl1Oy6/irHz25La6
	 XvqQyyDeb16rhw/nDd20JX2VRthTKlq3mHPDwtFxbsNTaPckPqQj7kPJ/vlebdTsnHkLp
	 rX+/LT7a7laiiYW0mGtH/1x+1J1DvzsVrjkxavl6Aqkv70PAnzjxwz2CVI3om018TwDKR
	 WoHZBjdZLb4pMU34cppwqgIfwRlX6T5YQ0enSN7o1vZnaKJaf83CiKixQJLYLAKHWviYi
	 0sxdMN70XmlE8mqzW/Us2ItD9czmBrVHFpMNO/vmtaGQOXUqU848tsEk7y/NSi9K5sQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795128014;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=rKp7PNH6tJNu5Ik4ShS1ZRJDjuC2vJSB+ltgqzc0spc=;
	b=JcOdWKgnNfOJ2u+OBoJLrqonpoi3TSLBSoaeUVppDofwMirMV9laZRnS3ZR0bJiIU+6Y
	 sOiIoyljF+gVVy3ccQpsEDJr5NnJHpWEgav6G7/g4+7vTPLGO6cI9wkN4pVOxN9GNBqsX
	 0vkr1XbQCYPEGvr90cGVakbO3l6py60otIc1WVurzeQjAAAz1bdOjh89Jbnvs55NJC7dH
	 gR8Y0S5iBwTIwzxFgBuk/JLwIgOWsDBmP6ZbQ4dYGNOr1K1sPwS/EQyMqq5kHixpseydm
	 1xZS4RNUYZyv34pMfFpnu3sRGSgnQDj/CGT2T46I93eoBFYSI7Ph7tzuuSUhiPoV6pw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 114671F000C4;
	Thu, 19 Nov 2026 22:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795128014;
	bh=rKp7PNH6tJNu5Ik4ShS1ZRJDjuC2vJSB+ltgqzc0spc=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=hugK28bKeyYzbgjUDed10hEi0PUf0YfYTcVwXxm99oOoHhDD5z+42ax+RawDYJ3/G
	 uF3PN0b1QrnwIXgtLfXXYly98ahMBGdHZYsBb2NKl78/X4s+X2KF5NHkVIQbo3rVop
	 YAwzZfFR6KLKqIFSZudILNanWD30MhN5BGw46y5kMZ2tZCW4ExNlPeVDhXytyGmyKx
	 bWkL9Pq4EAFNL7PPTmnYR8vvY7EuZGpG52ZTXnoXTuenqI5rCCBHohvfEbLhgPR/m9
	 y1ukAMtP10pgg7itF3zRskyYybw+FsDBJPKUbojHomL2Firt5MD5ApRgmwvjXvxdYN
	 aVQEdqu2qVVDA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 99A6E41DC7;
	Thu, 19 Nov 2026 22:40:13 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Subject: [PATCH 0/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Enable more
 peripherals
Date: Thu, 19 Nov 2026 23:40:03 +0100
Message-Id: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSQqAMAxA0atI1gaMiNNVxIW2qQbESuME4t0tL
 t/i/weUg7BCmzwQ+BQVv0ZQmoCZh3ViFBsNeZaXRNTgWOC0a3OJE3R+Wfx1bIq1saYyZGmoK4j
 tFtjJ/X+7/n0/Fm9C/mcAAAA=
X-Change-ID: 20261119-b4-gts9wifi-followups-8cdc7c1d1a87
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nizat Mikayilli <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795128013; l=1145;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=l/rOmrHcrx0V4i+2/VhyNsiibsipwyDGfZ6M6/al5/w=;
 b=PZAwGtHU9digB4wAFO4X0dPvGGBnlE/p9BReLL1wtlbN2bC4jTii4Hoon6XOelm6JMQS4x/w8
 1gVvBWJkWtACO/dJi8CakEnBYJn5QjDbkUgbPQxeWpm++spSmHV5/9J
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc

Add the CDSP, the vibration motor, the rear flash LED, four board
thermistors, PM8550VS-C and the battery fuel gauge.

Patch 6 needs the fuel gauge binding, which is in power-supply for-next:
https://lore.kernel.org/r/20261108-b4-sm5714-fuel-gauge-v1-0-c659b6c0884a@dxdmail.cc

Tested on the tablet. The LED was only tested as a torch, not as a
flash.

Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
---
Nizat Mikayilli (6):
      arm64: dts: qcom: sm8550-samsung-gts9wifi: Enable CDSP
      arm64: dts: qcom: sm8550-samsung-gts9wifi: Add GPIO vibrator
      arm64: dts: qcom: sm8550-samsung-gts9wifi: Add rear flash LED
      arm64: dts: qcom: sm8550-samsung-gts9wifi: Add board thermistors
      arm64: dts: qcom: sm8550-samsung-gts9wifi: Enable PM8550VS-C
      arm64: dts: qcom: sm8550-samsung-gts9wifi: Add battery fuel gauge

 .../boot/dts/qcom/sm8550-samsung-gts9wifi.dts      | 145 +++++++++++++++++++++
 1 file changed, 145 insertions(+)
---
base-commit: dde0308a2f8867806a444df1fdd7e685b1c56d5b
change-id: 20261119-b4-gts9wifi-followups-8cdc7c1d1a87

Best regards,
-- 
Nizat Mikayilli <nacht@dxdmail.cc>


