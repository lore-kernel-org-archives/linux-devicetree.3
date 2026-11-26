Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729482;
	b=vacRBHTaTkgzbICJOdwAA2Sw/qCbl9yxKkujuDX+mHQ0vPn2RQ5+rpO0Rt5E4ivoqL+j
	 tufil5eQFrtF5UO69gnvaAaVkx3c19y0iGQ//u8wfWgRrwXvo7LipWjyluoYmkJvdUTek
	 iRrV7RYdIKbKt4kfP3wt7Ejves6G5OmiN2UdPBiGd/DTaFcCZfHe0sFOqkc/SV5WajIVN
	 Cwz+LHOiLupc02qEvoSn9yf3ymtlZNQlKOZqJVXNRzeDRSnvkpTyUaBCPVKj9bhln0+/b
	 yv6EFSu4YS2UpftGzxWF6VdevrSKicF8y6nB1wICaExIZdTtYlL/9HS8IY8Pn0XfPow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=UYJTRpYCZNTbQQiix5R88SQ1NUZI9ZYUAhpcRTfR3qA=;
	b=NU8zM2TYXd+1HX5TWTvb6KB/dNbN6HV2R4oCT0THQk784YNdjP7ypf6OEyNurWIrf7sx
	 t6+4YhPY6u8DeY2QLrlHDSPIFK8u/T6qvY8yPorZ+9d7X5HKVd+637TT9waAb67oImYJO
	 hz9E/JBgeArh2doqUGGlb5fnWFEObx/kUViGOFO2C+2137ID1f8Kn6VPlY3FJ03cjcnmG
	 WBD9Eh8lr6zcgPEY4UROEsKb1up1nEhOw6MjLmyFcMtWm/tC3Xd2szc2XPtOoGPAZws7o
	 bMN/cPpNhwgZ7cnlPSZM4aGV9pffFif2Q/1dfh+mfGTYpKrbzBSQJyKNvh4HFenkBrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="P1QbyE+/";
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D3B606A6BC
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51D3B606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P1QbyE+/
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-33e48934fa8so1441060eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729481; x=1796334281; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UYJTRpYCZNTbQQiix5R88SQ1NUZI9ZYUAhpcRTfR3qA=;
        b=P1QbyE+/ZmZHXBAetcgcFJcSma35+komyh3M/D3cAlQBYTKdH2dBqUKPv7ssH5/Dit
         hqAr5iGuk/2kXi7qcPizrV+eztl6Lv9vK+BEn8XX9am+s1wCz31+8CvEica98HDq6F3E
         wT7g9EyOHWWgaLowjY8x8ERdBgr36dRTEBScqxJEdZLm9wthRgCVREvjGghKXdKU7Fp/
         0wdmI6kd6L9tgwxG9v6g9XeRWQu302gZv4TWPzZ8WChgPFaD6KsTmq3HjcNdf6l5Y9dd
         4Fqvo2jBhSp2YalxqxJcIEStoPHLN/BI35026hDGBmriCJQY7PnpcUNd1qsRiJZ9kzwa
         O5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729481; x=1796334281;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYJTRpYCZNTbQQiix5R88SQ1NUZI9ZYUAhpcRTfR3qA=;
        b=W9OihmGQ36VKoYYW2ZrIJyAHQ5lwbqlSuI4szjLCwJsYZ9DfiTwnMb+o2LH9/UNohh
         EnBr1FjgflMy4G7kK+uUt7hnzJcJVozztKGioPKqi4sWW2F/xKO9KpRZkKiALJ/JMiMO
         jPa46RCxhvyeIeceOwaD48liSGcS7OJoeP6eRa567fCS2j6ec183XQCviElRMXCYjrF/
         /6XiPbr3gXlUbo9zc6+E+SAd/s1CERn1TBmzw+Ql9le4K6He3xBADBBWJhYCxzx3M+de
         f+XE4Wze5F4tUskhIhFyumpqUbsEE71Uf6j+Sl7BPmUhk8I8ufp0GpNOMQ0zkkqPI7Bg
         jS1g==
X-Forwarded-Encrypted: i=1; AL+hErEVzJ549nglyi11QvP8gS2vpuS52z83k3oobTEw5GBgp33o414gdgua7cVB1qsh7SztCastwF7wynPd@vger.kernel.org
X-Gm-Message-State: APuU4Z+31OcMVbrGwQLLcEwGPaR8a1Fsw7K8keJR5SJUYClLI1BqsP+f
	GNzbQ303ti2PzCrrHaJQFtrh1BUgFe5eq3pKYVvFcSYYp5eUMkij4zR8
X-Gm-Gg: AZFdTZcMYxCqR7FqPuPNYrRWKCbxY+w5lEuxAVjAUOrdPukwkHYKeOVEXcBvOjnIM/I
	WxeKJ47+IuyOrIyb/GmT6XOf15Mk/dtmY5wXd3SBcdwlmdd3WkSK1NywNeWXM7pfMN2U680+KC6
	DLcbYQIrmUpf+e8tKkGPfh52yqssUbt724Syh5/XShNZnek9YzGORnUxvc2fkM95wc1Jkw10kOz
	ccBzX/p8qizIvQhicWni/b21uqD3WuMaXxWWFGSgrY8PLCyrHikCNix6a4pRVRxB4wLuCXbcznn
	sOIrsNAqKeCtOC0E6bQQ/EKuUBtdcjlYdyRQFtdhOACTZaMbD/l8LgyvGixae83BUruL+01aN2S
	Ft5hN76ZQQeXakz9a3g3lSuLZ5l6k5vCahEkBmLamzXr9hDVKAqRHYTPO2WobnFWtdROVICp7E3
	W9GJUaoyCOWgKhTDfIBkL+qvKbx2PNMvTSux4uW0kcoFDv9uqrFea0CYagh8Cm/CjMWC16BJFE8
	WA+H2H+U7NsONT6Q5k2TTHJSfH/JCK8bxBxSpyYjuC5/ivRQj5vm5efnsgZUX0Dgh4Msgu39kKE
	ymyZGdfXiUOGZIwlrV4PM6HH+rn8jA0iuCpG1lh7EkcZtMftgHwNNIy8cOdLPRM=
X-Received: by 2002:a05:7301:c089:b0:372:14fb:2573 with SMTP id 5a478bee46e88-3856fd5bf76mr21960944eec.20.1795729481384;
        Thu, 26 Nov 2026 13:44:41 -0800 (PST)
Received: from localhost ([2604:a840:3:1e0::1080])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm79578155eec.4.2026.11.26.13.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:40 -0800 (PST)
Date: Fri, 27 Nov 2026 05:44:37 +0800
Message-ID: <73f6ebde526f60ff64064ef602e0cae9.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Icenowy Zheng <uwu@icenowy.me>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sarah Emery <sarah.emery@canonical.com>, Ze Huang <ze.huang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Cody Kang <codykang@vsit.ai>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 12/17] drm/spacemit: add Innosilicon DP/eDP controller
 bridge driver
In-Reply-To: <9ec2f818084f2e723e8b82218a302258.docular.xu@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <20261121-k3-display-v3-12-ec419e8e96b8@gmail.com>
 <9ec2f818084f2e723e8b82218a302258.docular.xu@gmail.com>
Content-Type: text/plain; charset="utf-8"
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

On Wed, 25 Nov 2026 20:16:25 -0500, Guodong Xu wrote:
[...]
> I noticed a corner case when testing module unload on v3.
> spacemit_inno_dp can be removed while a process still has cardN open
> (say Xorg or kmscube is running and somebody does rmmod
> spacemit_inno_dp), and the DRM device then still holds references on
> the bridge. When that process closes cardN later, the kernel oopses. On
> a CoM260-IFX:
>
> 	sleep 20 < /dev/dri/card0 &
> 	rmmod spacemit_inno_dp

Thanks for reporting this. I can reproduce it.

[...]
> Other DRM drivers with the same structure, rockchipdrm for example,
> put the bridge driver and the DRM driver into one module. I think doing
> the same here (add spacemit_inno_dp.o to spacemit-drm) is the better
> solution.

Agreed. Will fix in v4.

Cody
