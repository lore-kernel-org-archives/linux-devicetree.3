Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802F54BB296
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054702; cv=none; b=IiPsfIehkkuOx2rGcsIXu+uyJ/2aaBVLBBJtbo7U9saL744mhACpOO4pNKyO2KS3IgsEd+b5Iyqj8yRGJyhZGIHC5Z4j3l4ILhlEDpeMcmrqDiL9egnTKyIYAhvEH2SOGMea6bUHF2Xub5Q6wF5lbS3eHVBytJ0vXM1ls8g2H4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054702; c=relaxed/simple;
	bh=ZxqeS1E771yr0ofEeWkRJncYn+0HDmT7Y6kC3tSRRLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UWDP1yqoKRAUW5ubVOLHfVY2TkKDUfCkNDWsqpLFbk1U9hX4T/NVvtr4yAiMncPYuXNWF3SyRm0g8vTd8uPkAnd9kqdCNUvkGIem/CTDQBAdvwHtczTunXw0r3y8N9qDxepmG6ZzztZM6auv8dO0b3l4lVTzT/wmewOTT7L5Ypc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=N4HrI+01; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="N4HrI+01"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso72115455e9.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789054698; x=1789659498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZxqeS1E771yr0ofEeWkRJncYn+0HDmT7Y6kC3tSRRLQ=;
        b=N4HrI+01u32kOe55aBgx/5Fqt1Rgje787WB9kHAqk9J7O1wH86VXlH66I9ZjEsKDI0
         xhaSfwqZPfRFjAE1zozPoF1RO7P/w39HBXbAichZO+q7bASHiuVVx+GpQk4cYnZLCdFb
         i1HwMh8+WOzNAl71LbCMPOxqj9WBOHPX+BD9zZEI3OYDYItiHmHAROZqmCPSUfDNHZ40
         ORlNXspml1CdDQezdx4HXnk6IZYBACvOMAeVX1bxdWDM+F9+FjF9aiAPhoI1lUtd86jL
         WlzJgIWqGLSXK4OzFY0FC+NVZtOa7TaykJNmcVNIQtsNufFie2wVUFizMHGocsY1okp0
         pLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054698; x=1789659498;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxqeS1E771yr0ofEeWkRJncYn+0HDmT7Y6kC3tSRRLQ=;
        b=rhZHP9K4IWnqqieWLEarTJjOpnoASkDfRkhn2EHBKR5l0Q5e8RUp3DPotN7jcC57MV
         VBpAMa4+AEP3ewAIp/ajd1+FRM1eXoVdik/tvORjDnLieWsHB9KIMGRMCgU1lo6b1Kd9
         4zBF3c7uB40zkKXKv6Fo0CFHpm2ls8QDUdwx4szU90LvwQeOMefqDVFhHTaTfqRy9NOP
         GNFIJ8YPMLjNjLaX5YR1WA8+lWcCqeeZBdKmwudG0uyj67LAOXIi5rdmPtZCll/trE66
         PctE8OWGpaUC2wOnaR0iR8F5LWA4+4cK1O9//iryvM89JDvbdd1TVnxRtknbRbG6z+qm
         00dA==
X-Forwarded-Encrypted: i=1; AKwUvBzx17pv00E9JCqs83phpEGbgxoZSUCW2Ei3LFIKdrdc+KeaNZaq1Hby62bCN4UikSgc3Dee41/VVwuL@vger.kernel.org
X-Gm-Message-State: AFuF++ko8O71CrFim3frlXNFbf5zKmOCbuBr18D0bqVnXAHRd0EBru91
	QmFqSymc2js5o9efG8k/hurBHI2KFLzfpWVxpnOU87RfjhJdDCDQbaXxy6G8re6FxNM=
X-Gm-Gg: AYBFou2QaNVhHwcdsdi1iD4M7hUi7pu1CdQKbJN3ofYNoppbKSTjEAn8uv4llbWUk9M
	E6JoE6PyFfE5/9nebZHcwb1Nw34RRdiV0ocDsdrZnUZvmT3aSXobOi3MGddlO+gBWRNf8qcHGXZ
	sLB0YuDFyE/ph3avlA/z/JjA0glKMt5kgQEjiVz8zzDzO0ValrrIGtVGLQAqJ0isd3Yr4Rces0K
	FSSqGkvhAwnLe1FQepocT3/pK+WzuBv+kchwDZq/ENZUxlq8HwAASu8bmmrR+iHC1wcfJM0KCXl
	Vx3ZaOixHSEAdo3EUVSwzDb6r3IQQBxfDL5GraDoTqmmVjt+IuIgI/GtuXZnWIB5p1MglLLd6IM
	u9XRY9xB376iHAL8ttAJ34AW5ujAS/MVjnvHegPYM4gI2wV2HYPWW18hzVQFCuZEgR5HucmkZut
	bKBLwNdvygw3MszvivHcYWNX3DP3ZvL0rKsgc507rs6ItRjXmBnxHFImlUJMoAxg==
X-Received: by 2002:a05:600c:3115:b0:49c:e1b5:b2bf with SMTP id 5b1f17b1804b1-49cf7f48645mr421170135e9.0.1789054693628;
        Thu, 10 Sep 2026 08:38:13 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e5dcb40b3sm16903555e9.4.2026.09.10.08.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:13 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Conor Dooley <conor@kernel.org>
Cc: Aleksei Sviridkin <f@lex.la>,
	linux@armlinux.org.uk,
	andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH net-next 1/2] dt-bindings: net: ethernet-controller: add phy-needs-host-firmware
Date: Thu, 10 Sep 2026 15:38:11 +0000
Message-ID: <20260910153811.778387-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907-shallow-universal-b614da6fe0c4@spud>
References: <cover.1788711837.git.f@lex.la> <20260906174621.4107320-1-f@lex.la> <20260907-shallow-universal-b614da6fe0c4@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 06:26:31PM +0100, Conor Dooley wrote:
> That doesn't seem right, sounds like it should be on the phy if the
> behaviour is caused by the phy.
> In fact, it seems like something that should be determined when the
> phy is identified, not really sure why it needs a property at all? Or
> based on the fact that the phy has firmware-name.

firmware-name it is. marvell,aquantia and aeonsemi,as21xxx already
describe a firmware loading PHY that way, and as21xxx requires the
property for the compatible the chip answers before its firmware runs.
The node on my board already carries that pre-firmware compatible,
ethernet-phy-id03a2.a411. So the new property goes away and the wait
keys off firmware-name.

Measured on the board today, same kernel, one line of device tree apart.
With firmware-name on the PHY node the port survives setup and the PHY
attaches at 7.1s with the interrupt from its node, link up. Without it
the connect fails at 1.83s, validation -EINVAL, "error -22 setting up
PHY", and the interface never appears; the firmware still lands at 6.37s
with nobody waiting for it.

Identification is not what is missing. The chip answers 03a2.a411 before
any firmware runs and the generic driver binds to it. What the kernel
cannot see is that a driver for that ID sits in a module the rootfs has
not offered yet. In the other topology, where an MCU driver registers
the PHY's bus, there is no device to identify when the controller
probes.

One thing I do not know how you want it: this chip takes two blobs, DM
and DSP, and the bindings that use firmware-name allow one name. Name
the first and leave the second in the driver, or allow two entries?
