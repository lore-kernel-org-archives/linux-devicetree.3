Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959990;
	b=N+UU1Y1LL+9ew2SstNs4pJqjBjXfela11SjPfSvukn4giUd0OckpiJX7UU/qQAwumFkQ
	 /rnembEmkeXgAKV075fO0YRGQ44Xp12ZJpToxSLJCNdmIgY2Vicnb24/u9MNGk1MUa+I4
	 fM7bwGrNzHxjNoFkSVTYfG6XHVW6BfkqAYLYJ3t9Hg8ZlgP9EW8JFddyotwI57pWtFeW4
	 oTlKUXfW7MxoI7Z1IdM4KZkJjM/dIaPnJjJnRUd5G68IBHGuH9ajakWlCA0kxg+Q5boZc
	 qd7eeRczmBMVYAHf+S0zjU39orPpeLJkVkFPS40osIEOp0FvPKdtKX/G/ju4XfYuVEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aD8+I+UZp21WBX5+us8nW9tJ7k4pcmrSW1MwYtrq6n8=;
	b=Qp4IXfQkUAxJ8FTsf5OBIMB40W5vYB6ToIP4iaHbse1yrjYXZwDWEfC1qxwmDibGp5GU
	 ILBBH5z9xJHiFDwxhaynbWe+OuctiO58NTsxGyK6b8Yx6xw9rUROoDrjlgUB5QFJswO7o
	 82nDXKvAptcPRYozgKVOuF8Ackppf2F155cbGRXa3z+2csu7Qo0Z1p3uw1I3rDcpGjR/e
	 qreX3YNb6Fx8cjpdmg6Y/mVkUvxCNDC6buHY+8dJU5e+7UsozrlWgkJukHqtHbfo4qbGQ
	 /nGgTGUbj9Xbn0NGZa4H6Ix1hSZPgoWQCfkgfqjXNqsgL5Wby2Xol1ON65zCElzLa1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OE8SYys1;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F63E606A334
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F63E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OE8SYys1
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b001cd92bso237483f8f.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 02:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793959989; x=1794564789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aD8+I+UZp21WBX5+us8nW9tJ7k4pcmrSW1MwYtrq6n8=;
        b=OE8SYys14SGEQ18Gg9x8d+GY94o1JNwz946nf2Bj2Qk5qyrAszX8A174fQSdt8qxEf
         s7EbG5bHr9mMoCJpYNHU+kAasRyUw26z341MyjTmBCGi5gCgJq5AqlHsQAfVRhdNa8aO
         bi8giI8VJgMN1grQpRT2qOLfTUGKQ4/Pcxp9c+QW9H7Mtec8AG33C+S9W2CmySoseSlb
         q4AS5y9Rkto39r++XzgPuGRY/5WdO3WLekcsYzoaxQ0Nk4yZX5U1VH80FiZSmfZacVeM
         Eh5b+FK+A+z2fG4ua5+L6IaCyLYlBYOX/3XdJ6FaMdJ3187BG46uin8XovpsQLsIK0iv
         yC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793959989; x=1794564789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aD8+I+UZp21WBX5+us8nW9tJ7k4pcmrSW1MwYtrq6n8=;
        b=pdPW0xUfDpwknC338BQhOXxQ8bXvXXd0o6xxQGcPK4MUFGTfUKb7Fh3yYXcS8MCADf
         2doISkEgce7OukL11yI8E3pR0USQyFBVFXhgjoWWzggCtk63af0TLCn4vMQ8LVt/mPw5
         Of7mttwlatUuravIlww4RmriqHGOByoEx7o3rGh1cCUjWGKj4CYQDH7GlIqNAkByXKhT
         /ZcNq8xeJFXS3scvMWoV7VsCP1txzGz/u0xzgQLKgarspHmwbdSAQun0ZxDOrU6QP1gC
         I21q4oVh2qdK9fgvalPxck4YSCn9x4aI2/iN2MCNz7l5wAKq6iZuT1ITr5guViUbniHD
         GX+w==
X-Forwarded-Encrypted: i=1; AL+hErFH0vGS7TFyZEFwxDgBaSUIKYbLdPOc9PFbiE0+VZCyDx2kq4ecoAkXk8eX3adFSa7OCVjzazaPz8wX@vger.kernel.org
X-Gm-Message-State: APuU4Z9HyA8myp1l2eWIzFaqfd0WVADHgZQlq6sHDcXM82x7g/N+Z/pY
	3GSik+KtDZ8GIPXSHmFhP1+m6nvH2kTz9dIzAw70OA0nuyGie2m7fttm
X-Gm-Gg: AYBFou0dOT4cQeHqdMUR7Mg0kOkJSAtankWLnYr+BIluRk0biRyiNLCoJKP1A3FPlO4
	G45z+JqrUjuHEDHBzLx9oXazRCEzw5GuD6hJigVGxV9EBCqRdOJC8NB6+uY03U2mpoO7YsWkzzx
	Z+hmBdzb+bRHx9mRum3LAC6NrbBxBYUY8rCQxiIdYKU85/0SaSIAvWQic4gDPVKyvnukOWjZ5b4
	dPGifanvUnT6YIauIr4h6HqzSBWfDIwiag76vme0qj/AOynCtGJK7zvVJmX6RifNK6Ii4mqxgrc
	l6e4/VXotqUuCriKZpIi2Emu+FPTU1vkhROUcDBS+mVuHgdmYBstGyZuBtQOClVuw3FlFTFlwTl
	sanMKcotR/tfE6KvbXx4U5g96Jaoghzfcf/Zls6Fh5NNw4asFvoBQAPw0N49vzAz5fTi94zfMw9
	Dq9DXZoFqU/rHS9gKJsjGgur5hVN0bnjy47VNWACNU2zgPS+wkcuEuD5lWDgcpIwnJgf4XoUW2o
	RrqSZOXCV/yqB7zR6DsGWF1VaVYmoFrOV+JMnwjeqK8TSD2Wt5OvYwXfqOCVKWmvrge34AC+YLh
	l4OpGtR4/vcANMBqrEaWM1P9mZMz9YiclSkvdLc+ORl4J0UKHJ5IoltD
X-Received: by 2002:a05:6000:27d0:b0:48c:67d6:a87a with SMTP id ffacd0b85a97d-49276d4d926mr3096819f8f.32.1793959988755;
        Fri, 06 Nov 2026 02:13:08 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723310fsm2934846f8f.32.2026.11.06.02.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:13:08 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 24/24] ARM: dts: zte: Add ZTE ZXHN H3600 board
Date: Fri,  6 Nov 2026 11:13:06 +0100
Message-Id: <20261106101307.3936492-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261014072109.1759502-25-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-25-ghahramani.navid@gmail.com>
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

Hi Navid,

On Wed, Oct 14, 2026 at 08:21:04AM +0100, Navid Ghahremani wrote:
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x40000000 0x20000000>;
> +	};

My unit has 256 MiB. It boots anyway because with
CONFIG_ARM_ATAG_DTB_COMPAT the ATAG_MEM from U-Boot overrides this
node, but without it the kernel takes 512 MiB at face value: the
upper half aliases the lower one (0x50100000 reads back what is at
0x40100000), CMA lands at 0x59800000, and it oopses in refill_objects
once ~300 MB are in use. pp@5da00000 is then outside RAM as well; the
vendor kernel reserves the top 64 MiB, i.e. 0x4c000000 on 256 MiB.
Does your unit really have 512 MiB? If both sizes exist, maybe leave
the size to the boot loader or use the smaller one.

> +					macaddr_tag_1e: macaddr@1e {
> +						compatible = "mac-base";
> +						reg = <0x1e 0x6>;
> +						#nvmem-cell-cells = <1>;
> +					};

As far as I can see nothing in mainline implements the cell index for
"mac-base" here, so all five ports get the same address
(f4:f6:47:0f:42:64 on mine, wan included). The tag partition also
stores the WAN address as its own record at offset 0x36 (..:42:65 on
my unit), so a plain second cell works without mac-base:

	macaddr_tag_36: macaddr@36 {
		reg = <0x36 0x6>;
	};

Agustin
