Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993475;
	b=I/mNwUMfDZkd2cV23quPTgiN1X30BQUtIAGyUXQtFQfYJiBj27uUoUBLpiXNa1OyXeJb
	 asTXCqsNFzRFc+PO2tAD6aF5+JxuR+q4DS8PZfJ7FCTm13vzek1rXNDU64oM4TxLMFCGO
	 2RyzoWwQ5KzB3Y2Dsovcq+M3hAZX094Iof/Y4Q/MhfTIwMliDbre0jgidvV8VIa9oazeD
	 tT6NrTH56efGpJb2O2MZYLczS0lR/X8NYgvNUaeWXyr6EH8VfiBplD8ud0Wmf01OYEqib
	 4G0Q4UggOfGWBZOi3PcVkEwHyi0DqA7wfP/rQ+IgDMJnOm/96TcpIxUC7a/a9T/wvyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pb4KDmZUh437ZZnXb7B8ESYwa24YJGu0HgUrWTWCI2k=;
	b=S7CsraaWN8D4ytzrQKPYBlldkjthuydxEEpd7vr89ENKcoKSTFs2Jehluzmd5qiWchSv
	 7Ts8wH+1UFscim4XawqgqlxJOlsSjGB50ThxKMSZKuyR+zP32q7UPjwck0p0EN0gXKttK
	 quf4XO2xML2yoX0TPmWb6gr5B91s77FQDvrlQsgMlZXLrOIy3oPbwfaqt05ov4apFVBDe
	 nHL1CMo8bkspTr9/059BHLH5uzZZrRg+f2y743BZAAxkwyLtw34Sn0dzoHgO5dP1h4/vQ
	 sejHdtbLY1cvM+d17Asv/odmmqEu1UTJ5fZfBgycQiZK5R9juccynz6uxroVmyMy62w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rt1NCMPW;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72157606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 05:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72157606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rt1NCMPW
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab98332238so1347016a91.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 22:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993475; x=1793598275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pb4KDmZUh437ZZnXb7B8ESYwa24YJGu0HgUrWTWCI2k=;
        b=rt1NCMPW6K89Nyetn20rvlfOqH0Yt6rO2nrzBiBrxhqDULj6BNHHvgerHC2zOdAwV0
         BdRsfeUWTn4SY1MGHjkurK7RDA5kX+48Po2LUIc4nUNyPRx0kmEy26BOpAzlaOcgLZLf
         nYIW4MT+CtIYD+9UzX4qRLhBw6JPpphdAK1GYxMrlouVTyEyzGEhDg/xf6x+xgiQSlt7
         S1WjS2sedSDljQc7U9OjBuQ0I+gW5U8pJYsQdOpCrjC83nRfqWwt+HyR/+o1iTkbKH6o
         pgqEPaPTeuzE+5JvGkcpaRE4GgRXDBEN4aYr//G2xiClrmW243B/ozI0VbIPOLFAzAkc
         KUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993475; x=1793598275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pb4KDmZUh437ZZnXb7B8ESYwa24YJGu0HgUrWTWCI2k=;
        b=ZQbiKSCkEoAGjNp6B/qLv2nXwJq8aBlio2ULn2zX7ToyaLHbWhadDZm2zHFZd4kB8c
         JovtxksKgRUQHNr9VjN/wi8SeGP9FK3CyjM1VdtA2UBGJ523/ItOUXieCPyjCssm1aHE
         cL+IS2Dkml3KHlpU4mPJG/lYFShi+fYTB6DVlUsATn/1LkjPRMutt0sIvQnfX1wsfOqb
         RFqbTNdVv83duX1JEfqqmbNGnoj6sQLAlyZDhZq8ZbrV2X1cgGbR7UGu6rDQrS6YvZrF
         5megV1NUTjkCeB4sPrV0kDIfJ/EMVFQa/0fEdhNT3i64mgqJo54BfQyvyiruLKx0bMIR
         b/2w==
X-Forwarded-Encrypted: i=1; AKwUvBw4PBogqzAj7g393aHOOBq7ojpciI5tiBusKL47NXgelTXaB4zVuwPTzoAo5wr3odaxEWpJGgbUn64j@vger.kernel.org
X-Gm-Message-State: AFq9FYK9PqyJ5g44ub1ZcU+16H35ythY4QHo8mnSjUIsRP6LFkGixrmH
	ZyF8oN3jrKgA3gplT1MAVPXhmLpSx9qMvROc1awa4Ca/zTCqCLlwgAqi
X-Gm-Gg: AYBFou3PBhx0HdvhRhcgIEFazdvO4J4D0YV8yZbSjhhAPskso6hTvduOrKMVzt+Vzbd
	9krNQeaVOBT/mPMwBSoeL15gs90sf97rhom8d5jAr5DuuZFkIGSuE9nqlTwZ8kCskhs0FbKiW3r
	CVjSufD9SnMgkQHXb3jb5z1UorVeay7VgVr1iESaYAv47RFSICixb+gQp/ymd18A1A+frnu64ll
	lcirWFho8poLh1X4wKT8JE1B7GvE5q+eEPU7lcu3mQNdW4MM3gPWv//0ykwHaI7iqqe4HzmrlBk
	Z1w9Y0N3OaBgLXqy9lwW5HnNlfhtL7YSrqpoSdeeaqrBdtIAkLCKb46gDB6FLm3F0d3/oA7A5I1
	LzgNP34I1s33Aa/J7VNNNntNOXUUGwXUCMQg6xvXf8hhxUEqEjU9Ob7pG3XpIPuayNLuqcm9Dx0
	o3Dt2tmvbfaGEPDQZwSyWiRDpiHhsmQxEx9zOLs5mypCNP8QrDvqqQXgg8nB0krd+OXxjKzOVUL
	Rbb+u6rDqe8pNuSYzl1xBe3YpdL9iNsIJ7hF92lnB5EuDKGWvrYSbfUOCx01SEZrQ2CDB9tLRny
	6+OaoLnPOYwsvA3CgQO17HRvuo8+rqc2teE+e9tlqJSR0AXPqb2pu7FQIhPfRe2WtB9vOAfdHUX
	Ry7fPioLzaKIQgsTkDFT13Sev2bjhqJbk81o=
X-Received: by 2002:a17:90b:250:b0:3ae:2969:903f with SMTP id 98e67ed59e1d1-3ae29699194mr612839a91.45.1792993474829;
        Sun, 25 Oct 2026 22:44:34 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa53c3sm6699893a91.13.2026.10.25.22.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:44:34 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Anand Moon <linux.amoon@gmail.com>
Cc: dlan@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	e@freeshell.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Mon, 26 Oct 2026 13:44:27 +0800
Message-ID: <20261026054430.557499-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANAwSgTiSiEfdLD7yUwcbFnXfRpnSNZu_GXLnQnXipc+ansnPQ@mail.gmail.com>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com> <20261024092558.143621-2-alan.tseng.cs@gmail.com> <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com> <20261025130206.187282-1-alan.tseng.cs@gmail.com> <CANAwSgTiSiEfdLD7yUwcbFnXfRpnSNZu_GXLnQnXipc+ansnPQ@mail.gmail.com>
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

Hi Anand,

On Mon, 26 Oct 2026 at 13:38, Anand Moon <linux.amoon@gmail.com> wrote:
> The main issue is that SPL_PINCTRL and SPL_GPIO support are required
> for board bring-up,
> but these options are currently missing from the U-Boot configuration.

Thanks for the log. You're right that the SPL can load the next stage
from a different device than the one the BootROM used. In your log the
BootROM boots from SD and the SPL then fails to find the SPI NOR,
maybe because nothing has set up those pins.

So tagging the pin groups of the boot devices makes sense to me, as
jh7110-common.dtsi does for its i2c5 pins. I'd do that once U-Boot
enables SPL_PINCTRL for K1, so that the tags have a user. It would also
go in the add-on patch rather than the BootROM one, following E's
split. PCIe and Ethernet I'd still leave out, as the SPL does not use
them.

> I am following the approach used in configs/starfive_visionfive2_defconfig
> to keep arch/riscv/dts/spacemit-k1-u-boot.dtsi as minimal and generic
> as possible,

I agree with that goal. For the regulators, I think the board files
should use the names from each board's schematic, and the SPL should
find the rails some other way than by a fixed name. Otherwise every
new board has to use the same names.

Would you like to send the U-Boot side (SPL_PINCTRL/SPL_GPIO)? I'm
happy to test it on a Milk-V Jupiter.

Thanks,
Hung-Chun
