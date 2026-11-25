Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795643902;
	b=WP8uSROROTasWBcHubQwlRlRr9hFTiJfTASqDSSXFvvZ2x/QHKGtjS0fae0zIfCkv5Ce
	 KhxqXP3F5Be+b+O1cEjsiiTX0SNGefXYvlZCESErU8sABbL+QdjagziPgKzmNLL8ruQgp
	 PnimF0PhDt1N4nkx1GhSgDZC496pOnn8wFOgz2mzyfitG2ueAcRkaU0eGxK6MloCfu4Yb
	 JYU4yVRnPGGIoNcOXw+A2FNJv40QH7Z8CAplv/JSQubqhNMIHMtWsUsc/2iqZNEKEotG+
	 5SQPk1OeFTcAiAY3xtVUwyQYizgLJZatz9HFXNfGpgIpBeX7Y5Vib7/9vkUKc+15NRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C7GLy08/lhflvvblmPf5eQJqkFHdN5psewj5XgAMj1E=;
	b=06aJzlBriWTAr8JxEIxSoqQL1v7b70y2jmWkO1+mGZATjR5rLDbbEnPFVzJ6TqmTdxgy
	 9oELQ6YdL2GR7R2VWHpKYTDN+8+wiLsqAs0Kur9YoJueIew+X695CPHIPiLHCXHPLCegd
	 g5+rr1fM8WeAwKgkl3ILc6QNQb7IAxNORgBnAsi/sGvoeTsxdshbZ8UCkkzmLZJeBAo57
	 643DTbSVYop1EbExVS4OeL5EUIttX+1cV0Suog1B5oOwh9qmWg9zUh7KB3bzaHtAUwt2Q
	 1Tqf79y52/KEG8N1tapsAWKLCUZ53veKAnh2hdZ8RdhokFI77tuFm2atvwZVttZOEuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b="D/Lt1j1H";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50E5606A326
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E50E5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=D/Lt1j1H
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c506a231b88so856792266b.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:58:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795643900; cv=none;
        d=google.com; s=arc-20260327;
        b=FTIvtmjxBl2u3f2Awrt2QqvVIr0pOdXeblJY0KmY4LGPgLq236YmWG1jyO5VL6g9qs
         dKRdwYvkkhWH1nCw2aQkDmdDmTvZ5TceR0UI71N0ULqM1n36nzJFLsY41xE0s61vWJkL
         xCJgs5okcpNfEh1uClwXicwr1beEQ7sxBTuBAFFFMDXSJVXLJDDKKrXT5aelWCRcbK2H
         bjnR0VTwTWZPRZqqhJWT/zbyw3T22mzNHMzbGynsKNuOqxmDIuZy2k2MT3554Xjeb86t
         8s4HqPO816oU8KtS2wrntiIWaHWECR0zb1+a6QSmrP1jCbphA7P33JMdDlqjukp/O6bi
         q1/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C7GLy08/lhflvvblmPf5eQJqkFHdN5psewj5XgAMj1E=;
        fh=Gl26jxeq0zUhg315pW1oHMJ1mUsKVgUJgmv6dD5OAcY=;
        b=o+0Y2ra4KSe2i4ZGcu9UQKeNwRzDGyY4CFscSLu8yNEDmLoDCUPCWPdqDGTUcRSuw0
         GTUMmF/hXdCtfv5lPBlPWft1g1t4dD3zZvCocc0dCmJiTHpSVGE9bNcfPcI6FcgZPsXf
         8Aymz6b/YbBbspwq8yFsoKNoD9RZrbjV/IKalkfIZ2OKFQns+P73OAaZtqkdhMEGwrc4
         LA4wG+YI/0b0NIAqCJIy+GKelWqxqWp9JSDtGocG7V3Qd+HLN+/tCjxGVgYw8/YYIRkq
         hyBFiUJv+rBsT7Vu/HrYZSNOihO/t7HBvrTnoBnfjSN9hZgXFW95a+ggwGPcRLmKFQnh
         jcLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795643900; x=1796248700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C7GLy08/lhflvvblmPf5eQJqkFHdN5psewj5XgAMj1E=;
        b=D/Lt1j1HOXp9Od2y2VXDqm8CyndD6Agw9PiGSvO/reqTdpnq9j4AAyRRWS49boH18c
         I18cNvO53HwCWsyilJiLgMVnB8x5sKQI9EjyMg4t40idyx5Ol7wdugO/9bemOYE/8SS4
         4mtr1rUWTQCg55GRbqCLtgtOiKW3WgRKXnFM6otaRwf6un54iWFwK8pPX4YCWcqZRSUp
         5Ti6Iai5HPRUYPtS8mRqP8mLktyp3b+anr9IPWiLmVKO7/zx1OKUOPVKYCGswbU4k0CB
         3fnfKmbzAf8GbvpcC8iZBChmqbu6VDYUYmwSXw505iK4YY2N7DJAtv3HZFlRcsW57dF9
         ZDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643900; x=1796248700;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C7GLy08/lhflvvblmPf5eQJqkFHdN5psewj5XgAMj1E=;
        b=XwjzwGsxbMJjRfhg32W5nSBHBsgbxTqaUay7ZkCHknvyxnsCCwkMs4vtBjaO1JcEr0
         4OUf+WZtzPriT9XWWHskhCmZQuD307JL4vEd6RUvBQiWZWCQtQWBKUI7C37uspxzZESi
         9n+4D5LJutE9auvD8OZ3bDX7+frYvsuOIhGhN0HApqvhvZ5kwKpInVDWCICQODrTyfCU
         UMrYZuCHq4nx/2xucBFFRqNnJgNCTPKha0CpTDQ9hU+RkskiIE0GOes0SolRoyymPxI8
         W8qcb6wr59eQ04GU4FBoNBTugCWMD6GVy3n7S4W/0MDHD27hH+m468L/CAeoMc2BroCm
         9HZA==
X-Forwarded-Encrypted: i=1; AL+hErFD5WH8cYFHru5J1N0eUwv/UoRKMTL8YFgvn9HuFjmJA9hnevf/0Ccd5ZvDWMU3TrCx/lv4G4DtJnIO@vger.kernel.org
X-Gm-Message-State: APuU4Z9uMxqMWoq2iddllO6pcl1yIbN8DejaYRufGkWetL2B+pUUDwdx
	78cyRtcfdSFPyK84u+E1B9Qg/ApZDXLy4nVQVd7BLFte/cDmPk+Cj4AgCvRRfq90CImPx7jm1Ur
	5T5bgHfvoLZ3aO7eUMKF9Frdk7DT2lW5EdsRyWtlxgjbCTHcWFCA9
X-Gm-Gg: AZFdTZfnM9QljGnrgZMZ/ZKoQFm5qO6C+K29UisD4dzPyhFAkZMIMWpy6fXprq+sn1C
	06nOfG05WHPd5/WXjbjj32qQ8CzvYYt3UbxivO+UFURJ7VeWhrCVfEU8XQf0X15XWuwAuFlXI0n
	qUELrIK+6P1FU7kb18XRoDJGPEeA4XidS8mUWgmfcjplWwjV3BzSAj4Y7ggzvQ37ABP+57pALmP
	sNh5APBpvcQwTsAyCw2LBiX8xuFgSBANBPBNuOW538k1h7+hntyatWyIokZH66zb1EvqYE9+OIj
	aF+xjUQA2NRjRPWDfc/VGFXaStTimu1y+x/5JSUdYblnAOgNOUhg6IPv6aXdD0m8dVGbT32WkJh
	KzSHyEOFHGAQCtOr7OsLibJPir8+lXghOeT5ebl8Vrizi3sssY58m+mtSJXi1V5BT+lJV
X-Received: by 2002:a17:906:c114:b0:c51:baf0:f9a with SMTP id
 a640c23a62f3a-c51baf010eemr165270866b.15.1795643900272; Wed, 25 Nov 2026
 13:58:20 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net> <179563805247.3885553.6358930861216631692.b4-ty@b4>
In-Reply-To: <179563805247.3885553.6358930861216631692.b4-ty@b4>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 26 Nov 2026 01:58:09 +0400
X-Gm-Features: Aa3M54oLnZsGvDIV2wcXPOs8zFTEwAusYc5yVbOMSviur1uF26N0thu0Jxy5z48
Message-ID: <CAKTNdwFrQErYOgG9gnCc3g6JOGoimKa2AOKMs3LAcBVYuDuE0w@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: rockchip: Updates to RGMII PHYs on Sige5
 and NanoPi M5
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, John Clark <inindev@gmail.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Thu, Nov 26, 2026 at 12:21=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> w=
rote:
>
>
> On Fri, 20 Nov 2026 14:48:08 +0400, Alexey Charkov wrote:
> > Both ArmSoM Sige5 and NanoPi M5 boards use the same Realtek RGMII PHYs
> > which currently share an issue preventing them from enumeration unless =
an
> > earlier boot stage left them out of reset: at power-on, their reset lin=
es
> > are asserted, so they cannot answer an MDIO probe. Until they answer, t=
he
> > OS cannot look up the ID to match a driver. And until the OS has a driv=
er,
> > nothing releases their reset line.
> >
> > [...]
>
> Applied, thanks!
>
> [1/7] arm64: dts: rockchip: Describe NanoPi M5 Ethernet PHYs by their ID
>       commit: 693e0c4f00389a097d710577ed5c24c4ac3f75a7
> [2/7] arm64: dts: rockchip: Describe Sige5 Ethernet PHYs by their ID
>       commit: 5d839ad9553f90c727157c45471a911f64cd067a
> [3/7] arm64: dts: rockchip: Drop NanoPi M5 PHY reference clocks
>       commit: 9c83b53e6c858a9a8f00ca82ecd1f46d2d723b70
> [4/7] arm64: dts: rockchip: Enable ALDPS on NanoPi M5 Ethernet PHYs
>       commit: 620ad5b09bec5abd83d35bf23c1af1fb68eed80b
> [5/7] arm64: dts: rockchip: Enable ALDPS on Sige5 Ethernet PHYs
>       commit: e48f1d304f7b69b47c6f98b701aa6f8c84ffbb9a
> [6/7] arm64: dts: rockchip: Shorten NanoPi M5 Ethernet PHY reset to datas=
heet timing
>       commit: 5efab9e7c28448f6035e7216255f7b76b28ff97b
> [7/7] arm64: dts: rockchip: Shorten Sige5 Ethernet PHY reset to datasheet=
 timing
>       commit: a2a390e7fa9e73ff07d2a9fc002114e299483202

Would you mind dropping the last two patches here? Sashiko pointed out
that a later revision of the datasheet prescribes longer reset timings
vs. those in the revision I had, and with those in mind it's not worth
the churn.

The rest should be fine.

Thanks a lot!

Best regards,
Alexey
