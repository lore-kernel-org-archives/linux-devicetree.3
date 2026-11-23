Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795449289;
	b=MmzUnXzjGMkCPNA6GQVFOevSBW4lE/8zNQUad9rtGBxc1LHm6Osrp/kiwbqlrerI1dFA
	 H40k0Z0T51qd+O1a4jOgEu0xkhQOTW+FBInWKKp3UuoBlMx92TprOde3zCGug1KN4mI7i
	 N6Jxw2ArgHGxwOdYBuKc8MPl9Iq80yav01237sCBKC8/aVzeKksixj7z8Avwz526ht+U9
	 p/6oa2trb++BsV0ovnxVKrTRkGWy+UIcZjJz2tft0naAXkVm5B0qd7g5OpkoAM+odQ6hF
	 bEYwb+bcAYF++/I3qiPRsEIpZTVhR1P3fECFB81Yepe0C+HUtwxD+m0OtFHD0yLfZuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
	b=Hcwm6tRSYcVC1NWSyjHZVwRjbUSwDubJk47y9vPeVqdT7mwjj57CDwR7b1M+u6unGc0s
	 amehCpDXplQenjD8ChdxVDJX1rbL489WJ/vEMl/oEXoduyGZal51FRZ4ua2pddVoM+2nf
	 VI6vbzK+WUzLLieir0oqQ9D+Y5q5CE1pSkGhHrtH+OaDob/uopopSqiNX3lljjjm9rndg
	 HfzBRun3mWXgqYADg9f2/0AG/iDz7pBgRVHVl8z4KymosX6Eqhg4OZ7TPpdZYaUeVy+K9
	 llF6VwQpjpYZM5m0dUzV5KqX+yS70yPIXe2cDxiJiszO2Y5tbXfyjJNu6SimbKsPDIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K31mtXdK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B0A606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B0A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K31mtXdK
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-382f4710a17so5902459eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795449288; cv=none;
        d=google.com; s=arc-20260327;
        b=P85g7CqEk7LG2SDbjFQXPkfrZOspUexE8huMZNTR2jBUkjhPfaYW7PkhY0UgnmOgA1
         EEl2279YfwSzUZjClaBrAUH5sGNXxfjwEHSxiQKwfoYjg1BMavPGK0e82uGBLwTvgEy1
         r+WJ8QXClk3dfcqU1gjuJHwgoIwoILuHx0wZEarboJF+8eg0Fs3Mi1sSz/IdMNjRKz5y
         qVSrkIaFiRnHG2JQQ0mPEuuDjTSSiQMWEngkmfNxnZ4CCMbmmpurrGk/uIW2qyWRi+BS
         4/uu1NF4Dg9TmhG3S6empXU5cgB7WyLnJMTwdPHf5L2umNR8GdO/GoboEw4BJBPkEEmr
         BAaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
        fh=/Vqck2nAa8Cs4qYCa6MhvKvcmDoumjyAh1bE7808TdM=;
        b=r/Ux+HtuFg2C19XWI8LyGYCvXmpSu1z7ZD7tPGgzqVlo5cYKQcvvDv1ybqQf9nNMuR
         QoWOYHh2UIPEU+E8nju2HL8y9hvCF098zIqXxNnV8P04MWWik7+Uu1LtWHmZQ38BKwR7
         eTXplyyrZCn2x1kXziMufb9rQnRv9DVB+DyhpUHcZBFm7IscqVogCNYBdM65Y596atYq
         e9Jpww8TNMCtSfiEkDhO2unLghTIs8B8GT9AeRzaZc68eC/lHR2pAk50WkP+qAow3cwd
         VybO9uHgwFOe32/o/+TQA0Eq9GIRqKHUZzTd50z/oha4gttSJ0t6LZJ9qQFWX5Df282W
         bSvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795449288; x=1796054088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
        b=K31mtXdKcF83FLFamHn4mu2c1WFux/XDEszEG14A98Jt2rLyW5vAa6g0aQrAW3bjzC
         gllAzO506OvE/rfpZOcYCxMRUDQNB4VXopntsohEOrakiet5wYn7sGPPxwfV/CfChisN
         uYXj8HFMNtuEZ+ou9t21iBeUUC7Pic5yoPJ+xhHP/+72mh5EZsszVIGPCdywgkhiTEHT
         PWSHOr4kNaUQ3YX2g4wkBHhAis3nwdahz8TPq6MFehDLcsSCT1djEzG7g4OFRye28hLN
         CCekPYk30csF+W8hqwpRnXEm3DGytgokuK/dlh+xzWCckuPUC6BXDNd7W44jN2cXrX68
         uVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449288; x=1796054088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
        b=IjqTWYbltJ11k2V33gH5MLcIhs7XR8OhrWzg/MdyxY5mgIn2g4yrgbPKVAZazsVg/S
         z6fR+p9DiCC/NJhQkKvKjVUin3fs3HiAIF9eHtkaYhI4/rwUpBbsAigH1kkSBZXZRIBo
         J0GD3kSb0SyMCfmtGz6YzTROEhKngiP9iXa1vMxFSOk1EhVAzwGg1LkqQqjg97hpI91S
         PwVm5yI4LGACEF1OELIMy38ORFSCSilScxfXY1GTJhxy2DbNJsgPR5DD3+pqqsJXXykX
         Ghv1qOjuxs38SWQMPSxMIBquwFUxesJwG2X7y6JTqIbD9zC2PcYWyUbuz9E8KJw+Ngkf
         DfwA==
X-Forwarded-Encrypted: i=1; AL+hErGUs6xc5ntuQaDjm+Edu3PuSF5X3ajm4zFS4+suq9s6fUz5SjqA1F/mUZcfhKMrxNi2zC5sTqC7jw8o@vger.kernel.org
X-Gm-Message-State: APuU4Z9OlD9z6LhDzpXOVGjmt7I0LrzYuHYhjFAD9Q/415d1CPLwLLcv
	5cJn5+YhdwGLBsTnZ5XqHxMRvYLHK2fEpqH6S+GjOGN0HsjSak/MPj6ov17A3/5oN4EyQULL6vr
	goTRbz+VCWIjNNtsDUOLEMtZ4YZSdloPhGj6MCC7sbw==
X-Gm-Gg: AZFdTZfICsWlBSEW2oot+ztAyH1pD8B9p6ut0egWcW+68nkcc+LqQjlpc7M/EN+11ZQ
	z/t5JGLI7I0QUoaWiopophg/tsn1qyh0BtmzrsgloaFv9r3Z4IJZY/COvzFelrBJFki3fNAZ+NJ
	cFTUHGmxFKYTyzHmS89LKzmUDeZawoe70+H7TqiG4fwCdkfznIcTMZucuWpQDYzZ0ET8p4QVxG/
	Jctvugs5gnwf40zGU+8CdvbBl/9fDrKri4n/s3+eG2K6okee0TlqU9pJnUWcw1uFCBqTkX/I3kB
	lsFJu9zedwY2Srb5GWvsGYkXcusoHGdh//PLOv1tqyb4e/DvMNkqm0DWITWtXh45gSnNCvSBzpf
	ZWJJpRq2UwKlK7L3PiziFOw6mf0ZSUF4g0Cl3XZ9cbBsNTUQrdbkqx3igTf6g1dkRxBlCvH8FC/
	quNrA64g+NSkrkuVKl9YaWbqvWTfpe7mTY/0cjJTKlxI+3ay7Kmo8jgnHfm6Tw4B6Q7WRN2/Hjo
	4Q=
X-Received: by 2002:a05:7301:e103:b0:385:496e:80ac with SMTP id
 5a478bee46e88-3856fe59334mr13784647eec.8.1795449288031; Mon, 23 Nov 2026
 07:54:48 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>
 <awARmkCuelD_fdX6@shikoro> <5d8530485716d129be2efa0518254e3322cecdb0.camel@pengutronix.de>
 <awAq7vxcY8CGjhNl@ninjato> <awGV8BU_AfaXQyBv@maple.netwinder.org> <awIMBj_7OLrlM5G-@shikoro>
In-Reply-To: <awIMBj_7OLrlM5G-@shikoro>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Mon, 23 Nov 2026 10:54:36 -0500
X-Gm-Features: Aa3M54odzMyo7xKMWSU836vO5_C9zRbLplW5YRgzXWccrFx6zqrBud8_l_A46R0
Message-ID: <CANp-EDbNxWnpjXDshVhPEwppGu1cf2V2UBO+hk2NtFDFeqCAdg@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clock: r9a06g032-sysctrl: Document reset cells
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, khendry@reliablecontrols.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 4:24=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> > Thinking about it some more, perhaps instead of using 0 as the special =
case
> > for "no parent", we could set .source to match .index. In other words a
> > clock pointing to itself means "no parent". Worth changing?
>
> What would be the gain? As you said before we can't update the values
> because they are already in DTBs.

It could remove some potential confusion about whether 0 is allowed.
And perhaps more importantly, it would make consistent the .index and
.source fields. Having one of them shifted by 1 can be confusing, and
could lead to bugs.

Ralph
