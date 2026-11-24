Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541640;
	b=AP6tP38CbTzmkjZajGgeYpTzZ8rt999YPnPI9X4f1VGBaYWwBSQ61YOA0/DDTsEGnXeZ
	 hBbg3rdDfAuxWMOlan5VtnIulXd+dgOHU66BDnKTHrmmQEnDlH6LlZfKE1hLnavEXVZAn
	 +ioAq20uV07CuNyCw4yEKOsHQotQ2a6uLhzLqX9H0GcW7M6dozFeKuOmlLsYJtcorLhit
	 Hvo6nMwKG/Cv2wiTwmZ8XCnpCOmKaX5Iv0j2WiCoWtqfuuWqJMbuV1nxo/czjAubFMM2b
	 ZijYcTvO60JggD4Wqtj2sfHC9gO0aGC0tm3+ZJAvmKa7/3tUJj+wf5kNZkj3St5v8qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=iqYPNhQdv5q8sriJxPDOk8LmysuftpZ7o/yXP0JyEzs=;
	b=kb5UoZ8qBYWLZungbndxPkkYtLF0jnHTNojustMGHgzEA6vvfFwkFCdpz7L+W7leCrMj
	 6ovv4pppK3jql/yNyroT00OgsTBx3UDHqWGPQeiZoabgNRaq2h0oy2MZu1hTXlpWt/qHI
	 zL0XGsxTaecRfdrDcLsanzvbEcVW8w0F20hCkwDEqbRQQWZODXdJlSgB2l1xa43d9LasK
	 uGO/L0mVKf2P+kwWJqFpRsTcRKV3cgQMAAs16xZ/a1d/kQuv42EqGYnpQ80SAQEKrPWRf
	 i7n7amc8eijqzzDavMR+WdNy0EZITWtB3+w9/eocrgRyB8zft3fr72ZOfTDwne1Pxcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DWhauDVf;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3681E606A32A
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 17:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3681E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DWhauDVf
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c15956ce07so4737637e87.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795541638; x=1796146438; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iqYPNhQdv5q8sriJxPDOk8LmysuftpZ7o/yXP0JyEzs=;
        b=DWhauDVfAmirslFngHjTM1mnMVETNpzC4zCZN6Nu+H+EhFIW1EEv9E6qUNcbdXp5+1
         0iNlpLKUe1Guc0WO6iclRDlL2FbObdhb1InOgL2bK23VPErxebNUqb6vlIjJfrJhutuz
         fAp9WJJ6VP1QNvnXVlxV4KqDZRdNvCWldx1WpPDESL2wvxsBdPh1dEFhxFGPXBw4JfxT
         GDdJaiu+Rlk6h2EV+32PBMl8xTsqxq3qGvHW8OqCqyVyuSWcziRUT8LHfO7RXSFmTkE+
         f0jbOJOGFh9KJAtkYcn1jePsLEAldHTxiLK2g5SrnhAJ4l1QPfnR3f7FBPGl86NZ+hsN
         5S3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541638; x=1796146438;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqYPNhQdv5q8sriJxPDOk8LmysuftpZ7o/yXP0JyEzs=;
        b=pnByUI4Q/sNRfo9CDa+yDMMa/HLbhLCA/o3Rdn5KZH4qHemUzkDpI1L7us8cOInMh7
         VwTxwAOKa7KbTT0vuMYi2rbXalcEgHHTOYPTXpUhU2WnXXY0ZvRx+m0RWQv8x2/rzsKl
         6kf22Ca0aP2OoaNzfVwpnT8T5ku4/jqsjSyGWCgGgjLQuWgFMvu7T3FvSFYvrR12lssv
         +PRVOmJvDEHzUfIU3yDIAHP6VeHoV9dov+l+0jOGtnye7sC74NnKQUlVaa7dPIWpndrf
         PrPw5KYa+LFFkumuUapFWQGSDapQ8bacZtcJnLWGKMKBhH5LfvqZe1Nk8HjpnZN8QMSM
         G6wg==
X-Forwarded-Encrypted: i=1; AL+hErFuAak3n97mN36ZLiql3aidzC8bbKIiYfUe7NRWky/jT41RaqH1Emfe0e8RqTbCWqvlT2NXcwHyihqV@vger.kernel.org
X-Gm-Message-State: APuU4Z9po9EGEV1LznaoSNCnp0j9flBsVxzeSqlVgYe65rz4gvhlrP1T
	hvmeq1F+mMJDxIViy/3xXHHIz3TxIb2uksLLf66iVhyILgAPWI8wL/EX
X-Gm-Gg: AZFdTZfWntdpuci9nsJdZfJUTMzJ19QJq8D+RLF9UthFrGL9eoIct4TLovImVyIpLZ3
	9uMlJC37PNDjXtoBzMdcJfOdKhEfefGgjS/k9I6vfKqimVQBHkO8cYsq0QqWSSoBI+Vjd9Or6aV
	3uMJe6i14Uh9y2V1OX5IU0JqkDZy+MkGwCDVeuyL/55+OVn2hh215r82OnYhla69b5jO3Ai1qr/
	8cIXiIck7FmDrUcaUnNGLY2GHRcaZzU06v7ilXrfHhTKy4/829ik4bP/skveImZNqs7PV1Niki6
	pkKg/SP+5+1kV/WNiKzeuTkKPXCv5JLrSA0gt7pvqgo55kNkzpiFk1FWs3p/ItdjHqztBE3mChl
	miV6nxS07ziU+LXECWpBE+vji1mZkct8RAIZ89YnbWVweNhn8GLAxhKk/ivStRtZJBiNoey6CWe
	K3N09h4nwrC2cHbG77QtY57lUkUT+AVppSYYS/zgkBcwnUk0r1JjOnZVfdczqxiTzInJODuvH9N
	l8fLEWSlTEyCEia/nic4vBNmRw7c04hpxAnzbkrqGfyqMCjY6g6hnxrL/4Tdg6b5iVo8oBz/SCv
	c9lKwkPFUJ5PqBcf93kTgXR/d9YYjE74tk75C272EUdbYScSghbrUGY=
X-Received: by 2002:ac2:4bd5:0:b0:5c1:ac33:5a45 with SMTP id 2adb3069b0e04-5c1b79fc8dfmr4560944e87.4.1795541638132;
        Tue, 24 Nov 2026 09:33:58 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff8bbdsm3990097e87.28.2026.11.24.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:33:57 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Brian Masney <masneyb@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: cs7542: Add global PCIe controls and network
 engine reset
In-Reply-To: <awXFhjXhZ-e_QM_R@x1g10>
References: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
 <20261124-b4-cs7542-global-controls-v1-2-12548785df2c@gmail.com>
 <awXFhjXhZ-e_QM_R@x1g10>
Date: Tue, 24 Nov 2026 20:33:35 +0300
Message-ID: <179554161506.57.3046327489415683188@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Brian,

I'll move the reset controller to drivers/reset/ and send the CS7542
clock changes together. That will put the strap-selected clocks and
the PCIe gates in the same series, with one binding for the global
register block. I'll fold in the remaining review before posting it.

Thanks,
Fil

