Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471264;
	b=kV4TmAlWvDjbwFHCIBZWQLmaL2TtXZPOxEyE/bRqeoXgKjGguREqstr1ceH3XLNX0B5y
	 Fy2goxcVi+ljLE2OSHOacglpMqLd2l213TDzrdrsEq2O1kNFxd7wOqEsm5G8kGWpUWPMl
	 OkeYKGa8RHoMDMAqF8qtDEnC/Ma5TUR9l2R5XOs79B7k2+JeH6sTUOYmWZq7+PEPR1TPe
	 kym5g/6J5kMTDbLduMMTmf2gvSiZcBfYoGkBmDCvDg9rvcsRW/ETRN/qwuPHbUMtl92+u
	 6sRbYwUy0ipnCyzVHIfYUT47vq7cUJfYeV6di8kvKVeo6U8Cuf6rYncpnxdyAirtvRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=xhzf2GAdeOLD6c0v2imXIzwLHmXmZhjtZ0JwUowL8Qw=;
	b=ur4K3S4i8YUtggQp2hjEZqrY74zt4WI8RVVXuq2/gCPaI4xQYmwHjmdraWvr6ayhHc7z
	 +3bb/4HCrt4Dy9YUrveJl2548HWoTKDJkki7WFB0EtkUhsyTN/mW5Ew1rsVJN98uH6D8M
	 QVnGA4L6ys7mAQUN99Jm/FDvTIZ54TYFNdoKyttdOMJnxtnJYSq0s9h3vItjirsw5qkJS
	 yLFo0gMq2tFiBjo7WEgxZmGVFVdj7Ijt6ti5H/F2tgR/wzwqasizJYPV01QBU5HsxW09U
	 i9y9nvieW1queH5Kx1rtIXX+GODN7mAapctkv/i1Y6d6gjEM1QrDv50n6y3c/L61bQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UIoZ4/lH";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70480606A336
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 22:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70480606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UIoZ4/lH
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so40552565e9.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795471263; x=1796076063; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xhzf2GAdeOLD6c0v2imXIzwLHmXmZhjtZ0JwUowL8Qw=;
        b=UIoZ4/lHvTVxtimwt0Xz7waHMYTyE06yZOAZu9jyPKlAbl9WKxPJy9S5PhRsFU/bgY
         HUUzexKAtSFnEBTU/UIlxzb9AyZq68R7egGteyDpJthY8yLIwdKmkFzVnSdr7+dgClWc
         UloOzdtLM6pr8k/g3+AdtJt2sWi8yQ+lP69K+sgwalHUl8ZDBjNiVEOC+Te/bdMTVEpA
         hN/qONV4hJoQcDpZg+W8/PfTb8ScloP6eDIS5qwv8wW7XWygW2bvEel5XCmCtA5oCxto
         8tYWlI+6RJXAyhMUJMbBMKcC7zZ2RIsbuQu2gQJEhIyClLkvHrlep7WHWAQ2k9A3qzVI
         3q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471263; x=1796076063;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xhzf2GAdeOLD6c0v2imXIzwLHmXmZhjtZ0JwUowL8Qw=;
        b=2zGvKW9hdSMpg0MoKk/ZkLHp/apRobhZh7c4qB0SClPuE8kCyty5s/tYQTSchWObc+
         PRWkxzZFwtmVD4Y3CrWzuwCwJjemPED31k65jmvCcTmesq0cPSivij2JI2f0cPFUOXR6
         laffFq9J0xHhZXi99jWbMmeSXqxw/zj2C4Xia0z8P81H0S3nzSBED/mnB/+GQ/B//bzm
         mNNlWPAhCl+4MwCeQBBiLl8ZnlNPBids1LFKSgOCfl6g61SdO22Z1moj6gxwlqRVk1S1
         jZ3FxyYE5pPQKTnORsijOMJLylrV4xLlgqrJvSkR6BnEW3qmBwQ7OeuwqiAsllzLehCz
         oAMw==
X-Forwarded-Encrypted: i=1; AL+hErG3B1hcXlnM0rvcxpplhxdnG2pzGzfRliFtmZ6aXH3e8i7jx2hbKFQWmupaBqDequ0jzbEaXIJfbRJp@vger.kernel.org
X-Gm-Message-State: APuU4Z8+wv8UOwHQZwaXgyNnF7SQZY+w4reoQUJtVA8QKzyLa4ngMvMc
	hOXYZkjynt7IPVCdX3m8Esa4zDAbpwI26w3/1g23xhYdcNa25G33ngJ+K9gXYcuEKPLpEg==
X-Gm-Gg: AZFdTZf++5tebQCYO5ba0DgPMg3OS3FKckkiAiZnj45ZVYPFyNn53RzdFSE+4kRn256
	wJmFwauFiI7coBl1ib2lKOqlHJTfoKb5xSDyxpe47mW1krcYN6pp1ypKuTvZwL/RV0dDRjOYCy5
	6dx1Ss4iFEYdmgtgrbGKU/rQQF8QOtao96ZYyJzD15Cu7bT9Q+farKniHYx+NHJIt111nIzSqW2
	wGpbTSAvAGaVe5VpY4aMO2g/mepBvGmusgO/kZdDC1v3q5FdTYwfeb9+vVAydSsuKGIlh7aPTwr
	WMKMFfmEkIzaqNQWM9YyuUtjHAYgsgVPrFsFUEcTPGsnAegTxx2ZALiHSBKKcTxbldMkuY08nHV
	oNhBnpS02ptpkZWu+o6eoXc3gGeb72z9bXVhBu0aHo5p6DXdtvTemmn2hQyxfSdPU6eZmmnRQ2u
	3MEttS2AajbHvQknSIQfkssRYcLbc/Lc/IjNhNkkeN4wPVddZqi8o4sXrgAobtcb4Z/MbvPKI4U
	TrzWKdJYi34GUgdPeIL9/iU22NRe7tvqyMNL8aLn4UF+PlMO67dn0aFROasVZbLHDi46+ezKoXY
	eiEPvY0mP6/HFz+MBNWeCY8InRuONINj/rQaemFI2KxF5abzbEAuMhg=
X-Received: by 2002:a05:600c:1384:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4bb88816c44mr270320725e9.15.1795471262627;
        Mon, 23 Nov 2026 14:01:02 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm434896805e9.7.2026.11.23.14.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:01:01 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rtc: Add Cortina Systems CS7542 RTC driver
Date: Tue, 24 Nov 2026 01:00:59 +0300
Message-ID: <179547125963.75567.6386430167092445665@gmail.com>
In-Reply-To: <202611232056209fabb078@mail.local>
References: <20261123-b4-cs7542-rtc-v2-0-31ab43f2cc8e@gmail.com>
 <20261123-b4-cs7542-rtc-v2-2-31ab43f2cc8e@gmail.com>
 <202611232056209fabb078@mail.local>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thanks for the review. I have sent v3:

https://lore.kernel.org/all/20261124-b4-cs7542-rtc-v3-0-53902bfbe0ae@gmail.co=
m/

Probe now leaves the enable/reset state alone. read_time returns EINVAL
when RTCEN is clear or CLKRST is set, and only set_time enables the clock
and clears its reset state after programming a known time. I removed
the redundant rtc_valid_tm call, the two probe messages and the ALARM
feature clearing.

I also checked the year field and the calendar on Almond+. The vendor
register definition gives BCDYEAR bits 15:0 to year data, with bits 31:16
reserved. Using a separate RAM-only range fixture, the hardware passed
2099 to 2100, February 28 to March 1 in both 2100 and 2200, and February
28 to February 29 in 2400. Century carries into 2200 and 2400 passed too.
The 1970 and 2038 first-second/boundary checks, year 2000 leap day, and
9999-12-31 23:59:58 to 23:59:59 also passed. I therefore changed the
advertised range to 1970-9999. These are specific boundary tests, not a
hardware sweep of every year.

An exact-driver RAM run separately checked reprobe with RTCEN disabled
and CLKRST set: probe preserved control, reads returned EINVAL, and
setting current UTC enabled the RTC and resumed counting. Each run
restored current UTC before returning to installed OpenWrt, then I
verified restoration again from fresh host UTC. Firmware was not flashed.
Full independent ARM built-in/module builds and source tests passed.

Thanks,
Fil
