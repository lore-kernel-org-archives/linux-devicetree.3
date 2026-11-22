Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341152;
	b=gpuRvK7oglL70OwxNR9cuKd2rcOp28xD4QpE24hr0HjxLKAev3cvIWAjfomjaiduyMY6
	 xhqbjG3OLsRaVpHOhpnhZdUDOFrBpQESPQe4XhdFpuomF7T40e2A6xMh9FfgWM+fjB/NX
	 lif13lVd/wr3QGkTi9c+nkoNzdx4F8iMZ651+gEq8QKfqvTlswkujMYFiVavUEx2rvWyH
	 H0QZ2eTv+iUbRUbzyn5P0OJWQDAzXT8EFen9hw9sqOiUCFr7rOnzZ5Ok2HeqJKgiUYUIR
	 c39h7jhdjxy5UhbMKN6Phe1iUuS9kTXR4oft8NtiljyAy9Z/FYWDt/TUxMz7yzlSVbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0NWssteZPPVU+nMk7IUnyZcBf2kF3Y2sa8v4XCIsjDk=;
	b=PilLn/aaEP/beO1z7pM/eybR16NnxvAxN1UH/ySZCR1nS3iLW9/QPlx9WrgjiQFccZJ8
	 cMew5bUW/IwlNUdQTfa2inIDhqEB9EKVaEgGRHtpenolA8khNWf1fnROYwye71MBXspFK
	 aWuO0/8gFlaaPMY3YuJYP87Vhu25wuF9Hf2PbeOSIgdY2dWJ/JyDZyKjdPhcJJk+sfJns
	 y4g9PNu70UXuwi6BPZXRQCUDZ9jrONm2mJZ+wkfhmdf6LExwA7Z9IudvCLwvMJXLU5uFu
	 sTO/H7aEu9wWpv6fMxYGpIlDO0puhkrjplrbeYJ2f4toJ1S/CqRfRN1bVMS2/6tIXNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5s5r2ZO;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2CC606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D2CC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5s5r2ZO
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso877406a12.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341151; x=1795945951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0NWssteZPPVU+nMk7IUnyZcBf2kF3Y2sa8v4XCIsjDk=;
        b=p5s5r2ZOw7S2UK5YF2dVjoCiXwbvOZ211XbGS3nEH7tWVh+lgd9aL5CAKSCYTwNBJK
         fZKuvblVH4mBSvqONI19trzwTMvJ1N7CZX7vw3IA38b7Dc5p3AHV5vHcKlP5PNO+sxD0
         GMijWtMbZZmZV7+4wiUvzbu/2RmQIF9nsdbdcn9tK4l/gN54hQtKkKjUsqWKrikfBGBl
         yUVoJzMrEFFRty/I20UzT1ik+WfjCPGn2eso3yBkJHv0G5bkO2u+V3VkKXjsE4+ZhTlP
         iwSyyiqr/yJv7SPp+PefocR6NepFwFnuypqwBY+e+1TwSmLBb2jYruDg1RJrTy+UnxOP
         ZIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341151; x=1795945951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0NWssteZPPVU+nMk7IUnyZcBf2kF3Y2sa8v4XCIsjDk=;
        b=cW1gzEZgndEPqWohwXsoCHSPace2sxau1CIkHJoqnLNrb8At+4vZ3FmgEhJctyD3Ze
         bqp6fZFUitzIEHX1U4fgA6BYy2yjCquPU8SV4aDGQrF5Q9GRxlwNaYqm4ZyfaGL5sCp1
         8qB93R8sNS1bWV9nnan/Sbp2iN6XNqbU8dXVfklfXOX76vfhieJJPSL5NIiZKoBQCmu9
         C7ytWG3DK3zD3PNhFxNVus/MVoz8xglNGMqGL/TvmdgBjkFkoXmnhRAWi05KkSLHWrAK
         39P1sVUOc8AX3vK0d+IS6JO4/VI5Tsad2I8C9GWrQGtvAvcRqTmsl5D5hxnBaiJBDlaL
         /f5g==
X-Forwarded-Encrypted: i=1; AL+hErE3pqsPHhkvA+UIF9itE38soefawCN/OvgPJEcjG9CgKh2YrgL5g0Pa5HnQG4LjQcfFVn3Gj+h+U1Rm@vger.kernel.org
X-Gm-Message-State: APuU4Z907DEw2G155J1wupV7hAUQjjQCAIevbI7K9jd1G7soIcWHKSmE
	dKbWfPo4TRd+ZKuxt64zEMjRn9qetHXSCOyUeWVqYS3x9cHSweZJ1YPJ
X-Gm-Gg: AZFdTZf9G1/zHfQr0cDbSpjEl4yhwlqkNun065GS7lh88fZBni+g4oRny0ctNehtjfB
	6Azm6xZZ6KSVxWoy0o1MupnsI1Wfy+C+06CgcGCa/3IPVlBRFb7TZXKl+pKac9t3OGEuDhFsgch
	TjrZXdDZkQK1Zi1vZh7WWZg9KF3c5qTdE79ieCVahcLbuGSHSGb7QqDZ5+d2FxeRf80AiromcHu
	RABZAkjilnSgEBLtq1L7KR1dj2cPtcTdnnTWl3745U/n4HL+khRKVA955aqWsQvQdVF1IhDm9e3
	F9Rz/hFStmOO8yPzd9Yk4nf1M2hZTbUDnktdbgARLNcgSTt+IePGeCmSA48ja3yESRrQm2jnbwB
	GtmSiUisOqYFZXhvpdyQfRt+S1nC5Vom1NWvFDZxjj6i/NiV4Wmkb5A5oB1M+72xVWHdX0+lywu
	YtUReYej8FBuNGyQp9JPfe23Yd2MCERO9yD6jctTUDSjjgsrhuSlrko+Nil/6hzrG6ciNr/xdRE
	dD8K08VgTqLrHMy7suNe9EZeetaoNIhSjOTqjuPHJGpV5zsJ7QyA4sZGVJpxBxGU4BsKL0Dp/Ra
	yDiw6gTSEogR5eknVFMPT7r/dEsjp/ih7r9B8aXKPucnESHX6k0=
X-Received: by 2002:a05:6a20:ef0e:b0:3e2:84a4:8875 with SMTP id adf61e73a8af0-4014bc52bf0mr6906650637.53.1795341151175;
        Sun, 22 Nov 2026 01:52:31 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm3289722a12.18.2026.11.22.01.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:52:30 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	robh@kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH 0/2] ARM: dts: bcm2835: replace deprecated LED fragment
Date: Sun, 22 Nov 2026 03:52:23 -0600
Message-ID: <20261122095225.200916-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The Raspberry Pi Zero and Model B device trees include the deprecated
bcm283x-rpi-led-deprecated.dtsi fragment to define their ACT LEDs.

Replace the fragment with board-local gpio-leds nodes, preserving the
existing GPIO assignments, polarity, default state, and heartbeat
trigger.

The changes are split into separate patches for each board.

Artem Novak (2):
  ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi
    Zero
  ARM: dts: bcm2835: replace deprecated LED fragment on Raspberry Pi
    Model B

 arch/arm/boot/dts/broadcom/bcm2835-rpi-b.dts    | 14 +++++++++++---
 arch/arm/boot/dts/broadcom/bcm2835-rpi-zero.dts | 14 +++++++++++---
 2 files changed, 22 insertions(+), 6 deletions(-)

-- 
2.56.1

