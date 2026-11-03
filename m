Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719909;
	b=QzU+d0Om4oIFDDPVvMtbKcvDNuMBe0FZC4XPQmnhYOqoz7jYpJ8ayU0g4mPjANIc/GJ1
	 edc/Po3mbBR4R81V56N2s88nypLg6Qal6JHFkN2QgjhLk1jRu2WH2SVACJog2Wmtkv9wl
	 YXwC3+0R2BpGgPduOqao56YYmSQeWPLZ7Y+ks9wqK7OmlwH0xjoEjN43GHfbUSh1Blg3T
	 CrpAkoUyhEfz1xOzywygCg7G/9Ee7Rs/Fjm3o3P6ChOyAGBWJYV5eTv05H/G2zmojs7wz
	 fMJCMHgkG62gPAyKmoCFwikrqfLBlOFprkhqADc7r0VNEjBtblRurAlbaIWXOsKfZ6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CPNNCo+GFGu/9nal5nPw6bilsFuJkUchsPFZNI+iVXk=;
	b=KKTGqogCaxol1Qeh1/was/REICIAgco9ft2AmvB4PjBmsZzpfkYz+cGY2+m+tCCkr8/H
	 euYs3Kw3ipvNFp8v977L6zXjkmOdIRSH87JjyvMLJPUocSzn96JQE+yjf6l9j6qXy5mfN
	 Qo9OcYRwOHDBCaGTRpNmzLCIdlvU0iyEbIYRZBiqjp7iSi0H6/eKTORQ/jvdGNr8R9Jm3
	 XFV0d6vAjGpM8DdoyY40ljbMWUl7YY8AFJ0dzlm6v5mB+uMgWOI6dvgTHS0ISMer/z7/a
	 UyEE5Mz06rBuMA37dd2tRt4vkRPxQtIsf2CrWVMhQmMur/F+wfuJP3kgd8QCuSgQo9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="t/R4+HYK";
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC077606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC077606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t/R4+HYK
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-82109f51565so2210231a34.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793719907; x=1794324707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPNNCo+GFGu/9nal5nPw6bilsFuJkUchsPFZNI+iVXk=;
        b=t/R4+HYKW+/Fm+UogBo7D7mmpiuj1rhuTEJDyPf+b0LIUsY31q3k2rDmr3fF5PqV0f
         xYEZLuuGv0awJhh17doexj0ARTnHZcZL9pFUFhY3rB3pFUlV4aE4GTRxBsg2dZDAKhRN
         yVoMyYPgGqVpSd9uMdg/+guWXKovdtcKQbleIGrGzG4Sn8QPZn6ufnSQBT+Qgxh8iwZj
         HAD/vFvNwNDgDVIX5eezEqyaALRWWQQLYJGPEgmod0tt66MnXh/QPZ9g5awOr/ekGcIh
         FGftaxTEyvU+LKYpZk051ZARA99aQ41Yayb8o39kbAAqgbbY1DfMHEdwgi5F+8tx+uUh
         rJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719908; x=1794324708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPNNCo+GFGu/9nal5nPw6bilsFuJkUchsPFZNI+iVXk=;
        b=fkZovjrSoXr3uAtdooYzXVqblNWLxQFAC3G0eWH5E+oBDM1zAfb5kjSBuDxczmpFv1
         Ab9oQLIry2L0nYKBIrrBrWl+kMpvv9+obnIsPENl4pdI20aQupYl6Hg9+x05hx+Cz79M
         Snb1lzwDupCNx2aHTRtUkwlfc+rNxAVEdhDQRLeI00q2Bgu6/wfrLUTOQbLKbr6HqNo4
         4aD8M6vPvFp5NTy70jt8zViPp8CwAFUjqPGjSHFSGtCljeVPQvF9xrHLp4QS2E1TiNLs
         G491p2TG/6KGy3oWn/iKg1KwOEFFvf2b5kx1nY8xolcXUKp3m8f8hOQFFamfVcaEhYMz
         4zYg==
X-Gm-Message-State: APuU4Z+OyZuE6ct5rNUt1DwzEvRj+D86SiiiYqp2iv8+MlSvKtXWqYkv
	3+CwPNYDXWmCTaL9k6PfksF1UqQ6qdAicwgHJNSV0rTGppFCPymxyptx
X-Gm-Gg: AYBFou3E/LcQxorp3vmn98qekvTy/m/+v4EZPWC3bklV68MXBGmjR/nnG58mX1IXTvH
	GPNQHMcRA/Rvrtjp5RfU9zzG8mBlkx4hSJLFHT9k/6TwKHudxdOrjhSNbJx1+2i7C53K/UOe1l8
	HKcCme/F/WDzrOJx1Fbui0uOGRFwvvq7C/vR1tP8ExRsqklzWHAoRMClM22zSZpRCSChn3lTtZR
	VAc9zHLxI/KTIsqfLS3hMQ9Ao6i4msKBRm9tUQ1PvcSNoJX5kZFsYvXB1jCnRkwF9IY6clLe8Xe
	165eS/Z2sntnQlBYzK36lzUYEDqg7Uz8u5Q4oZHqkoCswqUBoP1IOV5Iy3IJWhoxoDzwO/TtFjL
	0C3DYy0/dMuGqi97arcq6Y8sOcHlOffm6Zao1g2ehaLkehgBLpFmu2S+h/QiSeQbHcMwGYOUqHt
	9gduQbJzR07U6Ofl6RPGwpsbh79fA1d0obTQ6+zWBfbG41ZwgtAD0IvbabpQves2bg3mQ5G+3WF
	EkT3auWrZc1skX+o7+QCTodekHLGMVpeJbkzj3A7B9VQzl3GPOLlY8Li5YqwdJhvxrIPbj3C41X
	0SrAU8ntTTz9P7jvlHpjkqjFBRoBUw==
X-Received: by 2002:a05:6808:2389:b0:4d3:6be7:c64a with SMTP id 5614622812f47-5640d62df3fmr8545899b6e.0.1793719907638;
        Tue, 03 Nov 2026 07:31:47 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11599188b6e.6.2026.11.03.07.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:31:46 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com,
	diederik@cknow-tech.com,
	michael.riesch@collabora.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/2] Add rockchip-timer for RK356X
Date: Tue,  3 Nov 2026 09:31:42 -0600
Message-ID: <20261103153144.343764-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Chris Morgan <macromorgan@hotmail.com>

Add the rockchip-timer to the RK356x SoC. The timer for the RK356x is
register compatible with the rk3288. Address range taken from BSP
device tree and confirmed with rk3568 technical reference manual.

Chris Morgan (2):
  dt-bindings: timer: rockchip: Add rk3568 compatible
  arm64: dts: rockchip: Add timer node for rk356x

 .../devicetree/bindings/timer/rockchip,rk-timer.yaml      | 1 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi             | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.53.0

