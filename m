Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795564899;
	b=yHgCODoIZttxZPG716AdcZstIMvHVlqWc8WkE9xSNyKxO+kpB3bU/gbRw7Zb4N13XPZu
	 NIS2jxKeq/OE04iB4dkdbrNIKy+7E206bIhCAyPvTpOftQW4DJIEKRgIcYvH05weotRNn
	 JffZYDfu7mnafWCbm4yDw7BZMgvHqeNxHGz7PrZM/xGdOwnRQb+SzN++y49Nc7CmtrEIA
	 y/NUjpEZgeju90PEir5Q2zcOKP2ILwyQFpQzEyDwxIMeuJjvLHictqfIyMxl0Nhr2oGLB
	 1jwIYjKgKa6cUUbWoTudtKpJJgzUPh2Eon8VRzsLT3JSCu7ktVIqPFOurxG20dlTffw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795564899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8DK3yldnIUojdVzCr2+XwiNL7LP7CGhb9/YkbV+PBQY=;
	b=YMAiYN2qdDf099+QgcYOMYZWT7ZvfhqcVllsxDnfPvHfmDsJCaXf4mB1Irb2Vk/T2lOF
	 0aAAIs6W62NsomlrRHLPgH5UCMVq3LR5i9XBkaedu2Vxs9f92asbH8ZXuJqPdLsqU/XB5
	 01GJGCY+EvBKpAUR8d/QorkLivbBJ7fJ0d7sFIROe/CU6cvVb9YQbanZxsrTXenR7tebg
	 mx/74NnSSvL8mYNf5aMewbcQqlwcc7u/ADxvixWQCnUG4r+NHSK/rNXqjOkvNRO4uJuAj
	 X1frpnitHpLeFjzvWk0Nw6na3MR++pzIcRIZcptRWLj4JKeCgiuoKk6I8DkrbJDF9FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jZqCF521;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD230606A333
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD230606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jZqCF521
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38190551625so10321932eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795564898; x=1796169698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8DK3yldnIUojdVzCr2+XwiNL7LP7CGhb9/YkbV+PBQY=;
        b=jZqCF521yDr09fUmzi6RgygaLzmw94KaaOKAsaY89oBxs5KQC7DkwM/NuNnQC9xAQP
         EBFLieZm4OZnZCHp6SACkT2ki+diJp/jYfgr4rMm5srpcb6TGFVh44XYpWVz894XA+zV
         NslcaQ6iro3zpioeo7TmXCxnby9VDCBgIBWO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795564898; x=1796169698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8DK3yldnIUojdVzCr2+XwiNL7LP7CGhb9/YkbV+PBQY=;
        b=ASkAP0/GLCeTbEdjfrzekn1jde2P+ofZxY3NePbu2Q1UQUzMTZAbkC9/ErdScymFVl
         jWtYLQzPe5bM7J2OYwwSEq1A3ZnEWOxvguz8a3TOq3ivMZTQETEcIksEGR302VgDHg8p
         sXTy0WcpNeSIejBjqo0EYmoiSkyEQbylcbAto9HJ5yfFHvcioi9a92+aFcey9YomzdIf
         KvXd+eV/lEL4aynQD1Kyjhh0UCdjDwNdNIQpsS1/PApSvPxN4pkZzvXnmhtTLN51ZbXa
         2HTilfL9Q4bGN9lHtFNwQd+Y/5nJy9puUxBfxYyyz9T3KdnJgPyJ8yICYBKRwjlOmgWW
         WItg==
X-Forwarded-Encrypted: i=1; AL+hErFsl8yQjDfdNPhBNyhyN64KiKlMzVrnwOkAWGtqq2+iK5VEV09Li5lQit50/EjU8CoTcQdUILqjsXsJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8iJw+VEAFEIZC5MxFfdrclJHqlMk8mt9CaRjWIQ29hiFZOq7ih
	JCNU+PpPt9rADPikW3POiCmkRifxBQsOmTtVxoulYKk5DawN8NhVLwXwuoM1Llpb+w==
X-Gm-Gg: AZFdTZdA0X0xj2NOjvEO5i5hBmovqZN0DdyAu0YfK5mLTToYas0eXb5hyL+3PbuMsyn
	fNI4Qy7eHo3e8/ol/xXdhW+yCPsITcyzZGa3+W8kF0+9izKwCqfbRjTBd78HzgFMy8CjI+6ysfS
	KaEwJOdf58Uu/TNB+t7XWhazT9CM1Js7kGeN9Xx/o+AHm4H1K32JZW1pf22NeRWrdViVjpmfjfV
	b4neJyD/Uxm0Gc9c4gxoAnyDReCCvfiblcNhtM0JrRfXrd3AmwUzEEWB42Dvw0RHDKKOFB+Lt/3
	SRUn1jH3yh2I/SDe/1jhE+W1Hz3Dig6hYiwbEHCKH6Ff7/ePFAS8zwTcqoFs5CttrsJRIc6qr8U
	qVqHp50srcwzcIN8cnFMyuYh0cy5Gz5r0K17lURlvMKScgdElvnmmzJfetHoXUiCO6lOiLbELw2
	Ma9Y+LFxqHnW8aLdJ2Kq2fPlYxKv44n9DYx+ROwYaQcjYWzCRJ0dpm7hn3xZtz5szNryGJu7zqu
	jN9ExUWVABAH6RMp9UAZLlFVIjEJVuqfrIMZdsHvqOvb5gK6krTEc17w2Zfk3ZeshrAGtgqpWfo
	JTut0Y12bvtPICZF0h8BvlwHUnXeHEUu9XBcO5EQCaqVl1uWWgpFtInrqMfW/tYY5bPg
X-Received: by 2002:a05:7300:601e:b0:386:1e2e:ce0a with SMTP id 5a478bee46e88-3861e2ed1bcmr15600970eec.27.1795564896357;
        Tue, 24 Nov 2026 16:01:36 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-385665f21aesm59652400eec.4.2026.11.24.16.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:01:35 -0800 (PST)
Date: Tue, 24 Nov 2026 16:01:33 -0800
From: Brian Norris <briannorris@chromium.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
Message-ID: <awYlXdfJcciCy1Cn@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
 <CADrjBPqnRrFeYT9J6NGxy+Xzy1PTZEz+BMs1_u2md7Ra6xPPDQ@mail.gmail.com>
 <awXf86suGgKeazZx@google.com>
 <CADrjBPqG_TLwgOTzQ-o5pM7k1DzkeVxNkV2xDHsU4OBAyYOofQ@mail.gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPqG_TLwgOTzQ-o5pM7k1DzkeVxNkV2xDHsU4OBAyYOofQ@mail.gmail.com>

On Tue, Nov 24, 2026 at 10:31:11PM +0000, Peter Griffin wrote:
> On Tue, 24 Nov 2026 at 19:05, Brian Norris <briannorris@chromium.org> wrote:
> > On Tue, Nov 24, 2026 at 12:28:24PM +0000, Peter Griffin wrote:
> > > Should we also have "depends on OF"?
> >
> > Why, precisely? It's not actually a compilation dependency (I tested),
> > although it's needed at runtime. It doesn't seem like this is
> > consistently done simply for runtime dependencies, and instead work has
> > generally been done to ensure everything builds fine and fails closed
> > without CONFIG_OF.
> >
> > Anyway, it's a bit academic, since ARCH_GOOGLE (ARM64) selects OF.
> 
> I was thinking more if COMPILE_TEST=y && CONFIG_OF=n &&
> CONFIG_WERROR=y is set. I'm not sure if 0-day performs such a build. I
> guess since no 0-day failure has been reported in this thread, perhaps
> it isn't required.

Yeah, I can't tease out any warnings/errors. I had to resort to arm(32)
to get such a config, and I can't even fail with W=1 (I end up hitting
arch/arm/kernel/signal.c -Werror=unused-but-set-variable
warnings->errors first, but...):

  $ grep -e '\<CONFIG_COMPILE_TEST\>' -e '\<CONFIG_OF\>' -e '\<CONFIG_WERROR\>' .config
  CONFIG_COMPILE_TEST=y
  CONFIG_WERROR=y
  # CONFIG_OF is not set

  $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- W=1 ./drivers/soc/google/google-cpm-mba.o
  [success]

Brian
