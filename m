Received: from mail-wr2-f40.google.com (mail-wr2-f40.google.com [74.125.225.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B454BC016
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765853; cv=none; b=YykGRJLOORF6Nxl6g+0lXfB3khLSg92Iyqp4VwWdGH1F8V6p7ZxaoW3UD1SFzOY8dKr+EpUQcDOjfOAw0XEmEHXJgdVn681TDu42snK/CgmGeZd4P47lv1Gug6GHW2Th2yjawnUmveYNUkc7exQccxHVwuy92Fe2C5dnLnkj3hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765853; c=relaxed/simple;
	bh=0eUUtwctLLTRFzKHTHPyx5X72sDCYOZW5Xifc/3/OXk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qdM+/PlUu8enR07iq3APxfVSXHR/KWH48q21wPFfvi0nZxKpXhHtC/YTvxgBMAps7j24pXj+lFy0Jsa6xGIX5NDkEhYDumAhkCzbOUF/eyjtzAGvUWCo9DjaqkNQB29Uhb9OrH1YMJTpBQ5UFmqo32fZc924E/MEuYTOZaesjNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzvCzxJn; arc=none smtp.client-ip=74.125.225.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzvCzxJn"
Received: by mail-wr2-f40.google.com with SMTP id ffacd0b85a97d-48b017a3be3so451464f8f.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 03:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765843; x=1791370643; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eUUtwctLLTRFzKHTHPyx5X72sDCYOZW5Xifc/3/OXk=;
        b=JzvCzxJnDwBXk7eh4WwtWep0fwHdDRwNiAw0YJz68EYHJoNtS6nqFEe1PiVnvZoCjO
         6cdzDhBdf+WNlfUxBnU62g4z/+vq4ggxahw4poLu+Y1VU3HOn54DMvVk4x1PVcASYP+x
         1xqEkOw+U4G1MrX+9nR5RA/dYUbWNLXkDRPJBjsTi6v0YEoGzkhuGFspgILRWZ6HS2Gj
         VKZ1wAscdSe6tWHx7ioUVL+d1VA7kJfgySJFOXmpY3d0D+qriWtP4rKMqNXj2olEuPMq
         L0KnQ5KpcUaXN7yu923DKvbe/xvcG8kS0qcpW3M6uYVOREu4Daf/nADtak3JsKiaYCRf
         jijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765843; x=1791370643;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eUUtwctLLTRFzKHTHPyx5X72sDCYOZW5Xifc/3/OXk=;
        b=AAeBYlA1atR8wXcvo+bGFzVe/aAA2skZGupIH1BMZeobLpo6+A9wxu01wkZn1ACHIi
         iLfBAye2dOQksW3nXs0BW/gAw438sI1LJyM35Y1RTcd+XY4IdsdWW4gn3IpWy6IZzMB8
         geRV5kGUqTUwB3+ciroGr2I+fEc6KZdGiowWJHnc6QS+LkY5SgjYiyluRczsBAvs8Uzk
         jUGg7JI15Cu2kPfbqwUxf/xSnJTiTtyGOPGSBeoOp/+7+KKxZioGCV9B2CGVJ3otti5d
         0Xfr+hQF26z7WlnzSdfofBXJnZxa2nyyW1mzxo9Hrf5xNRQHzTZjpmqyfNpcu5FFW9iw
         6WGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxj8j4XIIrBMbzbCxnJcRY6h2jtzReiFuRT5+QaSXjRmGXyZU3+xBLH6fQBsUpdhkzu2l0LWAPoANT/@vger.kernel.org
X-Gm-Message-State: AFq9FYKqOb6RWDw/MsETfkr2VBZYgO4Hs8bfab5nPUsGn/mIA3icgxa4
	EN05osheh0/dBLWhVCrY83EKjEJTkZIM4FdrxA9wgoxZirHmR/QdRmJL
X-Gm-Gg: AYBFou0WF/8mYCToToiwpu6nVoxHf07N55C7a1KvuX/pzM5uSjUr8/ozLQqEXuaQPEq
	IHIJW9Mb/vrYvq/EBioi4SIdjjdQ28AXlU3z8ngl0SS8qsPWdF3c6qPNqkZ3LiA1Y6tMtlWHjLD
	fEmYFJ5ABpGyZQv8uOS7q0SbKHwbNinED0jC4DEYAbf8qoBC9qJXUoATpj9pkaVrh6yKyQat/ij
	t9u/qd0SKaYEaUKvhLIhcZHE2uIf9T9AAUXvt+98pRvWL5u1lO5Dq5gYSLOFAwn1ZXny5cbdXGA
	3RncGtbrdAEwod7gxeAFM7nDMPntxn2am5vZ/QsRII8xOmOlDR5Cu4rT7ujU7KbPxJ4zftt2tsC
	kJlCf5s8qJnJztLDosBYDrORyjQ5ZTswAEpmCAYpcXmYMjFc9orPLbYgWSQcSxOqwZsHC5BoW/Y
	QRpKDNr0j6gP159w/fPmnVUrJpP34GtPqFYPGouruax/a8fTfSotgU4J3Xz0kbICwTPiPulATce
	J9DWhBDiZES1bmAU/VPaPHlP/75NfRFII1LVkE5ki0=
X-Received: by 2002:a5d:584c:0:b0:48a:eff0:c31d with SMTP id ffacd0b85a97d-48b02525e8amr1894631f8f.38.1790765843425;
        Wed, 30 Sep 2026 03:57:23 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029bf85dsm2852667f8f.13.2026.09.30.03.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:57:23 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 00/10] ARM: Add support for Cortina Systems CS75xx and
 Securifi Almond+
In-Reply-To:
 <CAD++jL=0Zc939o7UaFgtx+04gLRmgmPVHTAeuW6OS9nPP5Xt8Q@mail.gmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <CAD++jL=0Zc939o7UaFgtx+04gLRmgmPVHTAeuW6OS9nPP5Xt8Q@mail.gmail.com>
Date: Wed, 30 Sep 2026 13:57:17 +0300
Message-ID: <179076583798.3054629.14422335928572048671@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Wed, Sep 30, 2026 at 12:39 PM Linus Walleij <linusw@kernel.org> wrote:
> Is this OpenWrt fork public?

Yes, it is under review in OpenWrt:
https://github.com/openwrt/openwrt/pull/25033
The sources are in target/linux/cortina/files/, the Ethernet part in
drivers/net/ethernet/cortina/cs752x_ne.c (plus cs752x_fe.c,
cs752x_sch_tm.c and drivers/net/mdio/mdio-cs75xx.c).

> Actually what I'm most curious about is the packet engine, which may or
> may not be related to drivers/net/ethernet/cortina/*

As far as I can tell it is not derived from the Gemini GMAC/TOE: the
vendor driver has no StorLink or Gemini references, and the engine is
split into a network interface (NI) with per-port MACs, a DMA/LSO
block, a queue manager with its buffers in the top 64 MiB of DRAM, a
traffic manager/scheduler and a forwarding engine with packet buffers
in on-chip XRAM, which does not map onto the gemini.c register layout.
I have not compared the descriptor formats in detail though. The
OpenWrt driver only uses the NI/DMA path, all forwarding in software.

Thanks,
Fil

