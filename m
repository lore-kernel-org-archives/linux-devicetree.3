Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B20416CF9
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502335; cv=none; b=df46SzjyirIhMN+ktUc8M7ei11v7frpfLtxMIlSVx5Ulv22nOEtwPxbRrQo2Zity8LUi7Hco/M9CQmK6eV7UMbImOYBxT5rbr2uZCVoUtaG8QOdebp19la9uM74FDNGJhhPLoCUDdpOispvolDPPHuT33or8A3PlWYek/xiFSeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502335; c=relaxed/simple;
	bh=eDH2tYdoi0b0ofvijaNMD2HtX1hICdbEb+w0OEWQndg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/PFIq3xkQPkVzB5gHLRYaqYyS39/Ydhf9wI6+u/osLfoYSkaiS/ULKB6JxKBCyVY4CG3kwYS5fnzU5GMdvlsrqzucaM64ZiPo35vQRURVNPWpZBQjuPjCgE1zK2nnISBZWWdnCHjnGbKI2nSDKjZsVoD4rUJOIbGY7oEZQ0cdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+bNX10K; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+bNX10K"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493b1710405so2619875e9.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783502332; x=1784107132; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hgts3cXxi3OIQen+lK5BRu5vo0eVsiVEbfqLXX+In5o=;
        b=k+bNX10KjZ/1dgKXum247MaFfweyajH+w9g3kTaBKJ3xL4ZYaApM86CMGuUa8RSYx9
         AuNpbtIhdVfnESR1O8cGUxlcxYxgXqbie/YXsMyVdNwk207dtUy2GGelMizr+e98Uvt8
         QUmXIF3ChFqDbS/bf1OxXpRqsjQZABWARZmN6EzEYCS1XTFHZS9Ck6zd/oUhliyS3kPH
         fWRrtBXcWK2HIJ322ZKk8oJrY8+lKaUW5hobvg17qDs/bGZErEo+PcJXlB7XYLncWl/1
         kDnLVaXTDweMTlIQTUb6/69sAjO9ZEfjh3K5fV5FDxjPJ804AmqWhzLZRf5uhaK1Df9k
         xorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783502332; x=1784107132;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgts3cXxi3OIQen+lK5BRu5vo0eVsiVEbfqLXX+In5o=;
        b=Cc0MRhw1kBXA64CaJ7WgmPO+SUbF5oWgIAMO6udDHmQsl0HMCfRf+0AogCb0HW5tJ0
         MxQHE21yES89589WD+z5VD8LD0PxAxOm+BOIvGlD2UTMuP+dViT5rB8I7QuK+YWBTUjD
         2w0ennSSDpoU2A88xYSwmANqza0Kew9xW2fX3umm3wByyTwpKgHjHp5C8Q2pYkK/oX5j
         znBCXKffZDgQl4jVRrqabc95YM4AJkkC69lPTnembXvhtbCJbuiiJQz5j95ByQiUXprS
         PEYlkly76fQVDFjcAnBSI2NPCOMFhmvZ5YIVdBads+DlnZixUsQEEzpdxN31HTmd/1Ey
         AcPw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7Q7TgcJJqEw9T3qPhh3X2LNNUotGKSZO8U31rJoO/0EBCiXG94CWpNvam7VUft3OMpU3O5bpuyNdd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+7KWee05yWikURyTR0Xjzyf6NObuU2RtQcLpuw0FNAb7PZ+So
	QSDBlwmNxDbj+d1EneYnC4DpHUNO0Oe2ivIcMqbvqsc84aiNJjGs7Ak9
X-Gm-Gg: AfdE7clJgCedG4WBvlPo56ZZL0thoCcjPYQ5jN0qGmeXnaB4PltgTsIjywkpq1d/OrR
	wXEiy7SgWWzwCeZQtlnzrFOTcl9JtNvM+mlm6JWwUKb/l2IVaA99Xd/QIZfy7iRWkMWyWUDpFvN
	uMdrmw0WFtEUyBbUIfwUSSp1Z3cYCRcc5Qk0xY8CpDKOOgGTn6nZpf45VTpXZflRi68UUSMFPky
	422PYPRibPGRuFFwRL6KsHN94t4USKu9+/skPkv3kRhM3MMEIGcvuJdcXZfF1ndwDHMoqZxhZE1
	6YkN1X6YbPlf5sPW/XM1l9DtH21ksqQny+XKx+rGH+bWZfeTM9lB75Nwuc2/Ix6s9uaostLNTsB
	4DiaLaHqrs69UIYfK2gDrz9zN67E6ZpyiBCu/imuLKssTQAPoffIto+xpGjcRTL6/xBtgGUel1L
	Yw0df+
X-Received: by 2002:a05:600c:8b54:b0:493:bc4a:9547 with SMTP id 5b1f17b1804b1-493e68815bemr16151505e9.39.1783502332232;
        Wed, 08 Jul 2026 02:18:52 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f40912sm118117685e9.4.2026.07.08.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:18:51 -0700 (PDT)
Date: Wed, 8 Jul 2026 10:19:56 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Fred Chen <fredchen.openbmc@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>, 
	Brian Chiang <chiang.brian@inventec.com>, Cosmo Chou <chou.cosmo@gmail.com>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
	Antoni Pokusinski <apokusinski01@gmail.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Ashish Yadav <ashish.yadav@infineon.com>, Alexis Czezar Torreno <alexisczezar.torreno@analog.com>, 
	Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>, 
	Abdurrahman Hussain <abdurrahman@nexthop.ai>, Kim Seer Paller <kimseer.paller@analog.com>, 
	Colin Huang <u8813345@gmail.com>, Yuxi Wang <Yuxi.Wang@monolithicpower.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <ak4QO9uhKOt68dl1@nsa>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>

On Tue, Jul 07, 2026 at 06:52:48AM -0700, Guenter Roeck wrote:
> On 7/7/26 05:26, Fred Chen wrote:
> > Add support for the Analog Devices MAX20912 and MAX20916 dual-output
> > multiphase voltage regulators with PMBus interfaces.
> > 
> > Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
> 
> Please provide evidence that those chips actually exist.
> Internet search comes up blank. I'll need confirmation
> from someone at Analog.

Hi Guenter,

Well, in fact I'm in the middle of preparing a series that adds support
for:

"max20826"
"max20855b"
"max20908"
"max20912"
"max20916"

All the above parts have the datasheet under NDA. But before we had a
one page "datasheet" in analog.com but I guess that is gone! For context
I mainly did the base (core) driver for max20826 and then Alexis added
the other ones.

Not sure how to proceed... I can wait and then work on top of what Fred
has but this patch is very minimal when compared with what we have.
Like:

* No regulator support;
* No direct mode. The chip has two ways to access registers (paging and
* direct mode).
* No way to count how many phases we have or if RAIL_B (func[1]) is being used at
all.


Some other things more intriguing is that these chips, as far as I'm
aware (at least for max20826), always have bit 2 set in ON_OFF_CONFIG so
a gpio vout. Also we needed some special handling to read phase current
which I'm not seeing in the driver. So I would like to understand how
the chip was tested?

Anyways, if Fred is ok with it I can just finish what I'm doing and send
the patches. It would make sense to have something more complete on
submission but I don't want to just "steal" the work already done.

- Nuno Sá

> 
> Thanks,
> Guenter
> 
