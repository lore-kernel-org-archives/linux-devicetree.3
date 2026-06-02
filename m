Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DFE3DD52B
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 11:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400117; cv=none; b=AItL9Z1etKOxG1AugQseubbclesjuXg5M2M05Qqgn6pqF3Tn3EOVmEh1ov/d6SXbqzOX0TRWa5Cp28q29GHnmLxJMQaGX8fpSBjy3Js9UNkZw23XKvB+3udvaEw2UKa2VI/LEM59ei8pD59GVl05nbvfDNyW+Bri0c7K+HW7Ve8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400117; c=relaxed/simple;
	bh=HsjoEx9kPh9mogL6cGwXhgkp/fQPrbXvPbytpeM1eUQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=I7YFNGZuU5FnSAAg9hRRq66i6NcqkG1VlIzCPYIoxp68cgrLRjqYejKLZFIyK52C27Z4i1MyKMszMHOsFsSVwKSYkvxPYmEgUICPQksdVzxpsPOvS13Qio8d8KozftakIdjf762ASXyzxfrxwJDv+IW1JTZkN9abHkri9UVjl8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhocrhVB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhocrhVB"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49068493267so64409985e9.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 04:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400113; x=1781004913; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsjoEx9kPh9mogL6cGwXhgkp/fQPrbXvPbytpeM1eUQ=;
        b=VhocrhVBcBjKO9TK+ni/V7HCeVrornCc/Gt1YHoz7slI7AuRa3Ph/sW3VS8/DDiVNS
         0Yf+V2JlnRq+vjiL5pCRuKSXNepJRnz0dOqxo8kUDDynEeFW9MwW8e1r2CE8FXT8RPEy
         JN7YCMnkpkgu/7BVOa90/GwMFtQTp7sIEuvli7W+2EP3zhzkYKRIVn4ohWINIY36dXJE
         BfRR0KTALx/vj/QfT9v/FAgPwCOgBGsU6ACs5M2dwKLfKeESxCZzsVmyXbUGsXJieSgD
         JiDbxJHzvxt4zjUsESv1atOSYvsGVBNQDVUDDXSga7cA6xh+OyICMkE81HNem+NrnniY
         yuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400113; x=1781004913;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HsjoEx9kPh9mogL6cGwXhgkp/fQPrbXvPbytpeM1eUQ=;
        b=dZjY+w9yhIH6yrw84GU/RHGguqQuf9jwT1jvwSdv+3JMyoZ8TA6t4h5qEmrs6ZOrPf
         O/7Hk2O1+6RXNjx/LahKD897fvHP5YZu2hA10jptrvgF1YbGnxGgO3vHpQN97EO28Pxb
         iZeax147u6IkwZT3IXBlfqvHLV8ItJkVFgZVvTVsx9HViWkgguTMlcpij7WAoDu7aZqg
         HCP+YbvaiuMyIh9WG0CpHh1j+UHEjDLISWMfRq2BEqsLcfrzik0aBGIuRBtWudS1D0fl
         rRhiB4Cg/Zx1r+vn8Hb08Y3xSQVXsJF4b5ozFH5A/HQYWIryfIzL3OGCm6zvZ6BeQj8I
         c+4A==
X-Forwarded-Encrypted: i=1; AFNElJ/6d35OUNloeBJtLRtCS7hvUE21WeZKILYf2dTtc6/p0/aaqkmz5DKmfKnSxfivE26/SN45vv5+KNEG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2wnJXqhTkLVSNAhwe0nDxEIyaVlZhgMkgaUtThR6uw+VNnMhW
	2JjT8Z7iX78F9f8Nr19ndTN2sXYd1orFeOWsCsSIW+dbNgIMOKbCD9BN
X-Gm-Gg: Acq92OHTnJ12gnONkp3dvNsjN+Bh2Y3Fu/0f+UU+Vfl5GAPKz/SPDqOwn8cDv8lHYfn
	93373nm5l6QQLPc42HX5L5+YbRXC0uWWJlQBmAVfOcW5FFSfrOd15WGabfrHtwfVQk4Q7ezWYrU
	Nk76DHbO+kJsKLh6e3k8y8PRuCMrxmzER0h38V7e+rvOj9/p1rWu2fOQ0FncpDsiT0jqvnsJx7u
	z7uRiAwS0me5T3GRmMgu7/xl0RJi7NoPpyXRgpsDU1iZRuQxuIkshKqW2Mps0brl4wmIEUxKHwr
	BO51kOlHwhrKNKW6Y6JrFYa34GnjnlJNnXtFcWFQpRZ05meBIzoNgrWCGIRYjqTuRvBLWctzW6L
	9JiJqg25TYJ+Rx2kIkeJyD6wj1z5Eu52KI18+LGKfH199f6aylBu+6hSlXsmqLCyurveLghaNOA
	6jixre5vMtt6e9TurLGBmTA7I/83ishxjq7bZrY4lsWBbi3m4=
X-Received: by 2002:a05:600c:5309:b0:490:b280:9fe with SMTP id 5b1f17b1804b1-490b2800c3emr32480665e9.26.1780400112834;
        Tue, 02 Jun 2026 04:35:12 -0700 (PDT)
Received: from localhost ([2001:4bb8:152:df59:3b69:56ea:a39b:adb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490af5f99dbsm25298285e9.9.2026.06.02.04.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 04:35:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 13:35:10 +0200
Message-Id: <DIYJ5ZACTWVS.13T8L275VHTKM@gmail.com>
Subject: Re: [PATCH v4 2/4] iio: light: add support for veml6031x00 ALS
 series
Cc: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "Lars-Peter Clausen" <lars@metafoo.de>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Rishi Gupta" <gupt21@gmail.com>, "David
 Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Matti
 Vaittinen" <mazziesaccount@gmail.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Joshua Crofts" <joshua.crofts1@gmail.com>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260531-veml6031x00-v4-0-e64f7fdce38d@gmail.com>
 <20260531-veml6031x00-v4-2-e64f7fdce38d@gmail.com>
 <ah6p-f2RCW8VcuDR@ashevche-desk.local>
 <DIYI40YK6CSX.2P4017PHVJHCT@gmail.com>
 <ah66ljSiIc0ywFC2@ashevche-desk.local>
 <CALoEA-wdakU-Ei2FE3WpGR+CYRDN1bjv2sZ=XJ01ZeH3NP8xeA@mail.gmail.com>
In-Reply-To: <CALoEA-wdakU-Ei2FE3WpGR+CYRDN1bjv2sZ=XJ01ZeH3NP8xeA@mail.gmail.com>

On Tue Jun 2, 2026 at 1:21 PM CEST, Joshua Crofts wrote:
> On Tue, 2 Jun 2026 at 13:17, Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
>> > Do you know any tool to automate this beyond asking an AI? Manual
>> > auditing is not very reliablo and it is not that difficult to miss a
>> > header that has been indirectly included. Building with W=3D1 and simi=
lar
>> > stuff did not help.
>>
>> `iwyu`, but it needs a custom configuration. Even with that it's quite f=
ar from ideal.
>> The custom config had been shared in the linux-iio@ mailing list this ye=
ar.
>
> Let me help with that.
>
> https://lore.kernel.org/all/20260512073505.1310-1-joshua.crofts1@gmail.co=
m/

Thank you, Joshua. One question, though: maybe you remember that your
last driver was missing one header (which I am not criticizing at all,
as you can see I missed some too!), and I am wondering if it was because
iwyu missed it and if so, how that could be avoided.

Best regards,
Javier
