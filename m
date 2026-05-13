Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABC7374E5A;
	Wed, 13 May 2026 06:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778654418; cv=none; b=T6w0izoqjJAEse4Vq3Of49pmBMvbByQtQEwO/hD230IQpVYf8RSI95BR6X1gjqNkjPKZsIzAvwBN976evgU2a/kmtuWfkg9+4tYrdsZHKaBRgf0YBHf8og5Qb7YBUvgQ4pV9J0AqaUdc1RoK0iF33IUHVAXBHTRJ291BRh+A6rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778654418; c=relaxed/simple;
	bh=5RtJsBCfEP9nTcSgqq35MYiy5uXqZAi4jEbQlmPUxEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sSNh3op109gyvcUrn0r6k8uEp3gh2K9bLZJt/aGK8+17oReLCYzUg4JuIP628/JvtXzGzd1N+Vfm9EiX3z4V4D9q9Ki3cvHNizucAdzjYv4ErICm5GicmIx9rg1lg10SbHDqiVMvOz8qQS7I519o5Bkb1DKLxyp40qV4vDZeSC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.. (unknown [119.122.215.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e366dfe8;
	Wed, 13 May 2026 14:40:08 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: linux.amoon@gmail.com
Cc: alex@ghiti.fr,
	amadeus@jmu.edu.cn,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@kernel.org,
	gaohan@iscas.ac.cn,
	huang.ze@linux.dev,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/4] riscv: dts: spacemit: k1-bananapi-f3: Update USB regulator on onboard usb and label
Date: Wed, 13 May 2026 14:40:01 +0800
Message-Id: <20260513064001.621329-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CANAwSgSP8W8QH26-X-mdNBtncDAbHR9CtYRO0F+rjmxKfhDt9w@mail.gmail.com>
References: <CANAwSgSP8W8QH26-X-mdNBtncDAbHR9CtYRO0F+rjmxKfhDt9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e20106ec603a2kunm8225ea4f2a54a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkJOVhpJTUJIGhlLGh1JTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJSkpZV1kWGg8SFR0UWUFZT0tIVUpLSE
	lNT0JVSktLVUpCS0tZBg++

Hi,

> > -             vdd-supply = <&usb3_hub_5v>;
> > +             vdd-supply = <&reg_5v_vbus>;

> As per the schematics USB3_PWREN (GPIO97) pin is used to power the
> USB hub ports 5V_VBUS, please check this again.
>
> VCC5V0_SYS -> USB3_PWREN -> 5V_VBUS
>
> 5V_VBUS is used to power all the USB3_TypeA_Dual ports.

This is correct, so shouldn't 5V_VBUS be for vbus-supply?
VCC5V0_HUB powers the VL817 chip.
