Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0193E024F
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 11:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790509483; cv=none; b=exgCm4cavg4y3LIyfFu0DTVVkH4hAtUJbFhdCT98DGjAIO7D6hLNUoyNOgIugF21Ob0bOfWAiWsAbLvOSqk9Jz4lusRwKOptwZAlkygszKIWM+qks4ZYyE4Hw3GfEG0o6NTjM7skatwrs8pUgyroyxiOhechL4aYOgQZrIN/3Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790509483; c=relaxed/simple;
	bh=hfsvOd/SdIwAhDO4f+o0wspmtu0+CDGRWfBBsuzDu0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z28o2SpNum8F1cWdnvjdTIoSmqtz6A3VS5gDbaVyBpJ2580SGGhVIsISsM+WIiptOXkvjz1kMxqZKKCjdOeJA2iMzdUICtJ9TQ8RVP69si79/9yOT3TyfT7kdMisPKGP7SDCdlZlSRA522DMrRXYMT/zUX7pxJuOsNDxz7ih0EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRIGEFuC; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRIGEFuC"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so11463425e9.3
        for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 04:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790509480; x=1791114280; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfsvOd/SdIwAhDO4f+o0wspmtu0+CDGRWfBBsuzDu0g=;
        b=KRIGEFuCIdDt2p20AT1YWXac1xRpbXbPUWPX96oKQIWrMYuuxslEEMXf7wg7F7TyEp
         3+Cd0NrePlaw4TQjmr618f0p3aOqxKSqSJyd1sQX13/Fax9456EQdLS59mSe1O8dgaww
         aAsdRpu9Q5M0szJsxD3ApE6sRQwXc2Sa6mHPGOqaeJwkBT0kA94wa7dIGHKcGaYXhn67
         Tc5csos0QzINaeItrbWrnGXvb4Se/ZsCNNKF2f0ddOXzlPcNXAB0nY7HywW/GFaq5TJj
         xpEhFOSijtoa2HC1FDinCYtfbrcAPOm+tTn+P8hIhhioXkIYEmSlWsJ5jUmd9KKXLzii
         fd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790509480; x=1791114280;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfsvOd/SdIwAhDO4f+o0wspmtu0+CDGRWfBBsuzDu0g=;
        b=irs7lee2lNRNnPXrZw1oOzhVjSONrzBx3JA6dDBiMd/FhB58NGccKsMEmtrzXZbzof
         GpkB7/mp5RNXWWTOpn2kFS9GVTHDiDNqczodNvZkN7VJsyA/ytY71QoC5dXM3VopXfYw
         GkAAXiPGulNlB7kroG2WDVOnPtbtUD0Rb8Rfa3VVunQQ+whPzURy5cdHazRb8hRKNWdJ
         BmtIoyYdpKYk+Yp8PkouptAhKmhIHknL6K8GZi6uFkEY1Ym65BdvRMCaMV0cE+es64H5
         LUIf3dTteBI2EUNHhbU4hT1Kyy3AQGC7L6c4+88eufCsZbWgSKG9CnzxirBA/8OTLHh3
         RxsQ==
X-Gm-Message-State: AFuF++lpEYjVwQqCLBL3TW60hRJvyLv4swyFU2Pg/VnwjjjVuAyloRmk
	MBixhxZzeqvAIDMuR6XVL2W4r7eB+K3H0wFtilh0Tedt+oMvRSFjmzAt
X-Gm-Gg: AYBFou1NFoWjOxWLN4Ay1c9cWF5NIfxdODPWI82Az3XXJkuHWDXdqvbyRKSNhvPQZ5p
	Z0c/tsS0irWQUcQSjeWEbvzB6tvEpzqS6IRpQXA2bCzOmMfP2lyvYMpjTRxOrrhnyxE4lEVxhou
	JdnFzFTlRHFeptvWLOc22m+KKApPaCFZ6GE0iW5FPgOMz9C2aKbe68jPBUEC2tPYMBerA/66Zoa
	b2Z22IH+Ea4ePBuw9qAfdNC4jqJDaZyZ95r06QripM0g3vsn4PWYaKhnc6wYceDxop7/6hxUqVs
	wqe3U2m+VtiIRYcAxYSlYCD9JvM3U+cQ+QuyZoGrjNEmN9kBYSkpKF6b0NFSPunOMNIIN44aj2l
	2TLZe98Wx3NM9evdJAUiFJYt17vRz4/JutiQn15maRhWviCm1bnwIpvaDvhs81xsdLZYb5KD+nv
	z7P7tndq9fHEObQr/Nu7BQEOgxFN+tNur7c4lLcMSCPF42xzeHb/ZHEYuid3WEnlWTVmk4A86Aw
	IZN/S3CUw8m/MEf6X+rrXovLRPHw1je7Ib6+UTU0gK/R3985j6XtS5xcgam/DqQRvdmvMQukQh0
	+JxB+77Nqn6ab+O4evtU6LFQ2DIOTUph6KM6Bqb6H/9KMwiMGkKlvogfftpUJNIl6nQDhsjrc8q
	thQYnGLAAsqHNDNGVAQTIZcpXfCtYafM3d6ulooVZcr1V25ddRjUbkYHT9cuDhiWvnY8QDhvPCk
	74tfSQ5a3d93uCd2af
X-Received: by 2002:a05:600c:8518:b0:49f:d325:9912 with SMTP id 5b1f17b1804b1-49ff06bcd79mr118283635e9.10.1790509480319;
        Sun, 27 Sep 2026 04:44:40 -0700 (PDT)
Received: from jernej-laptop.localnet (77-38-7-79.dynamic.telemach.net. [77.38.7.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018dcf59sm72964095e9.1.2026.09.27.04.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:44:39 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Per Larsson <per@palvencia.se>
Subject:
 Re: [PATCH v2 1/2] arm64: dts: allwinner: a523: add EPHY 25MHz clock fanout
 pins
Date: Sun, 27 Sep 2026 13:44:38 +0200
Message-ID: <IuUnKM8SQNWFRyzY1ves-g@gmail.com>
In-Reply-To: <20260926232142.5244-2-andre.przywara@arm.com>
References:
 <20260926232142.5244-1-andre.przywara@arm.com>
 <20260926232142.5244-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 27. september 2026 ob 01:21:41 Srednjeevropski poletni =C4=8Da=
s je Andre Przywara napisal(a):
> The Allwinner A523 SoC family provides two clock fanout pins, which are
> backed by gated clocks fixed to 25 MHz, divided down from the main
> peripheral PLL. Those are meant to clock an Ethernet PHY, and allow to
> save an external crystal oscillator typically employed for that purpose.
>=20
> Add the pin descriptions of the two pins for those clocks, one is within
> the RGMII0 pins, the other within the RGMII1 pins, although the clock
> fanout works completely independently from the two MACs.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



