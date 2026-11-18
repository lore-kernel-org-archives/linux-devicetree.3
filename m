Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001885;
	b=XTrNPGPAbPEgMrZf60yP47Ey+agM18rqPYSIEI5Em+QZZnqjgtdrSEBstGHmLjfH+Hke
	 SRbSiY5qKhKSEd2RuClve/uSDmWwvhK2qRx5eoZoA7dQ6savONb7C6+/XnIo+wmVYyc20
	 Y2omylICEYa8NzaRlRBWyCP553oKkP5bSjLAk+xJuqTG20KO+V71u2oxXbWmVuJ0sthoY
	 IdRx3VYAXMLMJjVhKwohHeojpo0wwoojP0zSddpYLM43iaeOliq9hCMSOcgw+f3mU3ArM
	 NCaJhcB4siv3k61mYX9uat3+xWEWv+98jSCTt2hiJaIChwqlvzwwfxIYtcst+//VYcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AZ7qkD0L75OuzyZ7+z/b4gyTaud+oMoBaIWST7AAwg8=;
	b=EIAPheTmCw/dtAORpc8ZoE2Nww3TyU7Ty/mFb+DLgjDl19wIM+xlrRM0Scx2XR7uG+PP
	 LqBQsXVJJA/shmFWYKmFCZfSo+sKAIoZwYLvKJRnF41nCsvionbp5EipVBDxOTxgJzsNQ
	 dveQzWArhfjwz7kIxw1efcNdh4ZcxHvh21JjuBJzlFk3YYbPGpBrTQzXQkbeW76R7c+Zz
	 9z9+7CgQ2VJNXjCI2KLfq211zOzKRbikTqoyKb1+I4UVK9BX6NSUEiVyPB1ViL+ujBffd
	 1daWsoar6H6i6YhMgT6W2Eb48LKBS7KMb4SrJLAMc2sYpSbpcZgmSTSGBl6M2VFP3pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+7og4LC;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCE260A2602
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 11:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBCE260A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+7og4LC
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so538001a91.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 03:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001884; x=1795606684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AZ7qkD0L75OuzyZ7+z/b4gyTaud+oMoBaIWST7AAwg8=;
        b=v+7og4LCpbgt8zqV0qGj5L5k9LpgFcD0H0EJlsFDgNHGtKS0F9k3naOHe+9i/2bWeK
         fPnCiGrJ1oREJ2+h9P6ZKwmoSXSZwgkiENGzo78/EZxbAgOUuY7qaBdPUhqxxdZAdfMn
         PINW7m5SL8HOai4MWvu+6qrQ3a3gdYcAWvU+dqtYCKFjQTTY/LjyJEp9BT2ogV+kY6jV
         wQwSCQwUH1MCU09yI/qoVnTqk+MsQEBxxK++4yao1W4KqJSdklyQ1POSzEjEu3h4QkPN
         R0NvlLmgEt57FkDf2isa3IkqaEuFkxQCgoorgkuw6Irqm5R4d5NvSZmko/MjOATcgF/l
         X1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001884; x=1795606684;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZ7qkD0L75OuzyZ7+z/b4gyTaud+oMoBaIWST7AAwg8=;
        b=V6UMFRK+R+hHRyNRhbOqm646ZBA0BXV3F6Jf10QzEP3nHXUdF+r/Wb9bR+QDn7VP1n
         SiMk7JuBPaXVzzK/onoJenvmbfRIDszNsWGckMbn2bC8xC7/ku/wYwcgI0t93/nzscU8
         4Bp7tZdq3omXzYBlMttfnrf6A02V5uPHXVD2OLpN3Qwnzz91kSNBpk2qYvudw+YXg41d
         rJs0mkU5sHpJz+TeS+jiaDCIAPb1dney5WvKRbXrUR5zzt/I01UYK3sBhBgNvGNPzlZ7
         435tahyeZh1ujUSaLHkSZ3tYuxMcgTHuZTE6sl/ztRCy3BHtYB5C7bT0W0KD8qK/+/Y6
         nn6w==
X-Forwarded-Encrypted: i=1; AL+hErH8sL9rekKPGt+NOz5TmBEG9ZrXnQyfCvYtxbA38KOAHbdk9oPGMoVxE+LclZRVzNezWBrki/i7rHz0@vger.kernel.org
X-Gm-Message-State: APuU4Z/3td/CrbUBc39uhvfyQUtMwkfwubsajlXS7rMLpqEpJVFNNFWL
	YWa8CBUvCiDeI9HfL5fBZnJVjWe5POHgG0HoZ0fBbhmo0zBWu6g//9OD
X-Gm-Gg: AZFdTZdAbhklgBX0QzqE95/eoMjoPEsGqfMwflrY9dTogzDmYYXYR/Z4o9hm4H2QiXg
	eCQSvmLs9S6Tn31fPTqFelU5mG4NT5aumLEY0JOgz8AjFseryhEYZIjV4x8Or81hCcbKTZv8yJk
	//A2gpuyBMxrIe9ISmP5phBQNCB0JMEhgNUekgl3E9fUTZbyAhRQIiiB1wzO6fqOzwlu30fq/W6
	pwa7chCpPuBwr+O5yugetCoYltugYd73WdHQEGYZYsY3MZnA00I9w+6Nyutnrlu330FySzrY7u7
	dZSLdRz8o4RPnSnQOEy4jCURYN4jMcjOIuRljSw9VkJ6wVEb6eef0lFECqzrzIbbW+oBz155fPz
	5jXWy4mGVnshMNj6GDQE8sK3o0nJOVGdmErQdtIq5JM4d80meinAYqdZeYBzMiNbX1A6TQ3xl2u
	JqIedbhuLEX+iOYN7Ah7In1TqZ6T5hSmLdSlTTTgnNOoLKnV3GQ1YG4o1dt+9qu/n1E6btScAGa
	9KeltX3fHe1F1XppDw/efLr5bezaj/hJxWMsZzCR6BJaz8mHzHBaA6TMoi0oUjd8mtrt0357sXj
	N2axFjH0JBDWphgzqe4Usfn0pKLfDhdw3AJJwJDYr8i73/Saeha3P5nDyK0BxCpFPzxRYoplhqe
	XofXij9PDAfc=
X-Received: by 2002:a17:90b:5407:b0:3a6:e901:e79b with SMTP id 98e67ed59e1d1-3b3d074d841mr2303560a91.15.1795001884103;
        Wed, 18 Nov 2026 03:38:04 -0800 (PST)
Received: from 1.tailnet.ftu ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac254ba6sm8950084a91.4.2026.11.18.03.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:38:03 -0800 (PST)
From: =?UTF-8?q?Tr=E1=BA=A7n=20Trung=20Nh=C3=A2n?= <nhan.094.vn@gmail.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy Note8
Date: Wed, 18 Nov 2026 18:37:19 +0700
Message-ID: <20261118113756.304373-1-nhan.094.vn@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CADrjBPph5r0rjZPLz7db9-QtmN5+7S2Ft8Zgn1oi+C0Okvas_w@mail.gmail.com>
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com> <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com> <CADrjBPph5r0rjZPLz7db9-QtmN5+7S2Ft8Zgn1oi+C0Okvas_w@mail.gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Peter,

On Wed, 18 Nov 2026 at 10:51, Peter Griffin <peter.griffin@linaro.org> wrote:
> Does the Samsung bootloader not pass a correctly populated memory node
> for the device? Or is this required because UniLoader doesn't pass
> along the memory node it received from the previous stage bootloader?

From what I can check here, it's a bit of both. S-Boot doesn't build
the memory node itself. It loads the DTB from the boot image it boots
(BOOT, or RECOVERY as in my test); it checks that a /memory node
exists, and only fills in the bank at 0x900000000
(reg = <0x9 0x0 0x80000000>) when it detects 6GB of DRAM. The other
three banks have to be in the DTB already. Samsung's own device tree
for this phone lists them and leaves the size of the fourth bank as 0
for S-Boot to fill in. From
arch/arm64/boot/dts/exynos/exynos8895-greatlte_common.dtsi in
Samsung's kernel source release for the Note8 (SM-N950F_PP_Opensource,
N950FXXSGDUG6, on opensource.samsung.com):

	memory@80000000 {
		device_type = "memory";
		reg = <0x0 0x80000000 0x3C800000>;
	};

	memory@C0000000 {
		device_type = "memory";
		reg = <0x0 0xC0000000 0x40000000>;
	};

	memory@880000000 {
		device_type = "memory";
		reg = <0x00000008 0x80000000 0x80000000>;
	};

	memory@900000000 {
		device_type = "memory";
		reg = <0x00000009 0x00000000 0x0>;
	};

The DTB in the stock SM-N950N BOOT image (N950NKSU5DZE2) has the same
four nodes.

S-Boot does the same on SM-N950F: the device tree fixups in its
N950FXXSGDUG6 bootloader are the same code as in the SM-N950N
N950NKSU5DZE2 one. Every Exynos Note8 ships with 6GB of RAM, so the
fourth bank is always filled in and the DTS doesn't need to differ
between them.

uniLoader then doesn't pass that DTB on. It boots the kernel with the
DTB linked into it and only adds the initrd properties to /chosen, so
nothing S-Boot wrote reaches the kernel and the memory node has to be in
the DTS. dreamlte and starlte do the same for the same reason.

btw, the name's Nhân; Trần is the family name, and if the convention is
to write first name first, I'd be pleased to adjust!

Thanks,
Nhân
