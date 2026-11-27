Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795760660;
	b=2gW5G0QYktQWI826rHStsFZjEcuDZiFgELqHbhbT2e66M/JzR8oyfFHvC8rzuqf5nriI
	 9Gu2lYNvDVf2iaX7VSRhxLRQ2cT8XCYHBiRXt/oMMsWzx2GA5tZFrelHsWzFwrASpjKuS
	 TGFfY7DUTgQb/AZHarZoXCTVHUgFKSHhYpE1TwMg1mE21I818vgAv3S4Qw82o8+wh3F4s
	 d9iYry3OEePZZKXgW8PZtXOSMbgl3r8uywhNAfyp8vR1agZVa3CEYiE/3BBtlG69tJmOc
	 7uguzwaibQOQsZAPqGIb8G739nsgTPXSkUvDm0sbMy4a10xbICFFLTp60+c1DTaXeKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SBkZFZAfcEuvoK54tInJ2sdXwGuJlWuARWjKskeguWQ=;
	b=nShRiSJt8m9fbmbvCIZ0IeUw1XQfh1mQfVTwZiJm3Rofn1CYeq3hbriJQGwjZ0sfC0vE
	 yAs13y3YH0AuWsY64vwUs8vvpsNIRYF3qzAblHyNYgEex5ZKc/T0zwfbd+Rvic2buYhbv
	 WPLyswRAwUPHZrWQAlGcZ4LQ7aOIivJS6YWi4rqN1MMOWKxkNO1IjlLPIcMmZdHyAefer
	 2rqsOebU4Z/2by2MG3eRP3NpQmOOJekF+N6FX488scj4M+VsMXkE5Meikh0aeyeQHG529
	 ySh0dco9nQUupwBYE+l+N6aPRWX9Nmmr/zwSyljX9sN9ZBDboT1FZ2FfUB3iMo0IzCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIET8682;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7486F606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7486F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIET8682
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b89399d92cso1225076a12.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 22:24:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795760659; cv=none;
        d=google.com; s=arc-20260327;
        b=JyrL7AlP6oY+JJRr/ZLjx98wndJ0G68OL2jmD7sIlVsVm2y3M9SqjbrKDY7znJaCuV
         vN/zOiUD4Ir0fF34cj/eNP18W06XBoB/uEpq5NKIy6fTrQebbCYRa1g9vcsdAM1ljWVm
         mtJrEDbrQH7ezDSIBN2SsIAVsLzsfPyX0QkUdrDwEBsCJuxVUlomZRwkfXNsnKwrmNtH
         u48DtHpJaPXhfvex63TWOGMoOt7CPbmTDlbikrfVCgctaOJ3gKq46wEnFnAYcf8Qrl8K
         NHUB5ZQVRXp6ZybYa5cbNngNptWaZab7fKNxXKj/11H98wpacqudo7r/ASKsKQ0w/vQy
         +4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SBkZFZAfcEuvoK54tInJ2sdXwGuJlWuARWjKskeguWQ=;
        fh=kEKh4ygy41oTffmYg+HxYm4sNXxBoVcrccislzx2AZ8=;
        b=pNk/4YIDk129saeTezg4DaHJHIkBK7TXtxbpKH3RCoo/Ph2fP99IJvZOtu2qbjBavP
         yK1J0Bdca4rWQeKIFzQHoCcVB9RggbLsnRZZBCaAlZ1e75xzuacB2DSVZkIPQthm680M
         i3D4Qw9PANw0BgzjpMamDHwQeB/8cJoSscrKtuUkNS3kGFZWwmyKI5FlyZYcd73++thw
         MooOmuquL4skbc3/xuZH5Gs1NIhWiNh0xF/LHUAZcMHzjsQogUVoTvs2H7P8u1Mj7nP6
         1PvexilKgQQksUUNM1WMXawEq/9MZ5ytydLXUWmYIorJCYxwAMId0JOnDd30dkl+kwjc
         d3nQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760659; x=1796365459; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBkZFZAfcEuvoK54tInJ2sdXwGuJlWuARWjKskeguWQ=;
        b=SIET8682aKeUh888hyfIpEH/QzKiNlGQc0MTfL/SL4JkjVKDOvk8LzFJBhoaBxgFmM
         MJFjqn7gPJ02QI1+6cJbGlCgI5Zx/k9CVnuOfWcpGJWasMjHEKyx7tTAgUWcoJUsA+Fs
         EyanKaHO4aqchLXxuAHPfytc028RXiAg4ICMRmC3AsJeuMGqQMKN7Sb5D6zCfZsNUCnb
         DjsiNUdEmjkpy8JFkFDQ7m0xgNeUyxoWJJFLTCR3xnhTZJGjp5+iYOaGmyeESTkbRCvx
         fgiRiJ7RORyG+Y0vqOsDZ1Ai8wjbJCxCzCQmZzdb8fBYZBjroYTDZh/ZJnc+eaNyrp3B
         P2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760659; x=1796365459;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SBkZFZAfcEuvoK54tInJ2sdXwGuJlWuARWjKskeguWQ=;
        b=E8Li3yBRR63EpHVIscka5Hgj/LIwtSY8UWEg539JzTtSbKxYeHV5fGUyW6Bfvnuorp
         1HjU1Sy2+xby/vvUWwKTyNpkd5UuvpNxmKwC/oFO/Mr4UZSAi+Ru49VnOzIn987vuomT
         M8BoZAP3sydbVFLBVj/Aw9G7J9LnOkuZE5SQ6Kvak2Bd5MMe5e/qtDyVa+yXIfvBOSO0
         EVlk8q3ykSlvnW8tW+Myjv1b7FhZdsnAPGZKkWB6G1EBJkGBiCuqX+MNcu21uE21UgCZ
         n80c+tBlVFxgYNr04udCF7+WGFte01w45BIIgeF8FrCjLAQL6aXZc7VODxcIqp3gplcO
         6kwg==
X-Forwarded-Encrypted: i=1; AL+hErGXYlj/8AllkKmL+doTDer6XopfPAvptN/EYVyx0ca9UgNyM0Y9L27HH34EM0BAqWql4XZuOU+Eg9Zm@vger.kernel.org
X-Gm-Message-State: APuU4Z+qbFF4DPUzoCIeXukEqWNutG+AX6pAcmt4QbYIYh93UDzpBIAg
	/ycfEm/G2EHk8xRZ4skJOGJgAKLqJ1BL9FU6lLYTqQQ2dWtQC3QzrMTcrPwvy2xxIbntycorpoT
	I1d9MUMYdiwTChsY3oS6Eatf6SmBePm4=
X-Gm-Gg: AZFdTZfWnzC0wNl/3fi6y2VMfb04NXNh3QrJf0yn3bIajo3tmNmQ353QPOHgy5sJ7jT
	1c938B+UM8S9SfHT2w/PtdpQ034EGa9ih97u9VakRoSP1jPmv3ZhKxtbMPV4igaExpngjfEXcee
	iL1F1oitGcV2xCMsTuiEyZl8siHi0jZCSeMfZJCeo7YHJ0UVJYJN5vJQdnmpWrTOKL4sgYZT9bt
	oACSHyy652VbBEWjwWzk8/EPADTIms/69PLEwUR26dKmEz/tHJddtW9TZS6r3gRzgyn6khufHn2
	gxvwVIBdlM7rxmwC5vM4PtAGkQ+eMXTOmu+QnizgbnYFKVm6CdV5j/9/C6YBZxAQPt7HzUJS+q2
	5Se9/PB3hkOgZsXg5idaIsNADF7vHpWUlHTMMEcEEOKr3avxNPyWFJBnMFDAnm8EYfpgPWeQ=
X-Received: by 2002:a05:6402:c521:20b0:6bb:3e3f:2cdc with SMTP id
 4fb4d7f45d1cf-6bb3e3f2fecmr4072358a12.2.1795760658224; Thu, 26 Nov 2026
 22:24:18 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 14:24:06 +0800
X-Gm-Features: Aa3M54ovbh04_f0CIR-_hXe0njTveJM5wqr9aBZi2LAaLZkChYM5oN2Bhm_6rKk
Message-ID: <CAPwA33K7f2EbtH8rqihnxB8RkB1PzJTmDyGJ39ojROuTYwK0Dw@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] phy: rockchip-samsung-dcphy: Add the MIPI D-PHY receiver
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

Michael, I kept your Reviewed-by from v6 on 6/9, 8/9 and 9/9, as the
v7 changes there follow your suggestions. Are you fine with keeping it?

For v8 I only plan to drop the Tested-by tags from 1/9 and 2/9.
Please let me know if anything else should change before I send it.

Thanks,
Jason
