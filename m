Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200C64477FD
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387831; cv=none; b=jIEbj3YbyvTOb35chBepG0YIPbFqqAiWoKnoh1uVL69olSyBCzgnCj1L/yTbwxQZtJpwC/DYeP1C7FVl557i5S6C88jlAO84vgBEikh6qMqebDPq7BMtf0NotMnrQtGN4+29huhylKrI0l0JKXWGiLD/SssAmtFzRCf3pE1SIbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387831; c=relaxed/simple;
	bh=Se7NkzKRBbstIWMyWUOVe+AMD6O75GbMwW/t+1YRS3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODDSb/jjTKlMrwiPtglp9zOJ6DCn5q4o5dartKgCmRrrv8T4x2M2ICZqzClFbPRfpZ7Yy7Uvhoyec80qIBmhRYTdRK4cw/qsLE+GIAeRzKcf2b3HwbIdA9SI3MBm/YMlF0ytJd6r0QGhYwQhE7KUwEDqmQ7xzKgfon0n8ws8pDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JlWuwWtx; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JlWuwWtx"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6b1ae6b1b26so783813eaf.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789387829; x=1789992629; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26Uw7zNV0CaU8mcuuO2rFoHLPl3S+teCO+5Ml7uyCio=;
        b=JlWuwWtxH51nEvHn7rF4rdoYC+mKObVerBorCAzI+wqx4svsciLn3rHQDBxyBU/Gcf
         HVDeXuDpwgUQ5ma77MiaPMO8pt7haDKW6ohqTldYLQGdza5uL/J0CK0SKAm/qgEUk1Eo
         FlaV/8RJioxINO1PT2vVYS2NV+h3X6OWkvNLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387829; x=1789992629;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=26Uw7zNV0CaU8mcuuO2rFoHLPl3S+teCO+5Ml7uyCio=;
        b=lfI/YlGlfpOnOLIoVyN5HbMjwus4CjTqERP/D37NcbNRtizbediZYJnwH1pDbp5Alt
         uDYGB9f9MhB6Ll8VBdHzH5QFESbT06si5I5V7rKGpCUKe6NMJO5mebDzySp5iUaBMZl0
         R+24mD7wUKk/nj1Sm4XrAkuyLlpIyERLNBpDZ+Y9HSji/AtK7o/aJTxdZDZBcZgR3G1k
         96D+O9xPPql78J1bGvMimZKXOp3NEMtvSyOdy2khua+xMCAXJMxyM4PfanfWRN6eGkta
         ISrSdFcPUIxj7S5kEaevU5OSUahoWmaV92J2oluChVXqk604W3Aj6G9X1+UkbfEUnxhf
         j4qg==
X-Forwarded-Encrypted: i=1; AKwUvByPp8T5Q+j9JOK9+mZw4NfwnfMLSKdqh61nHi+4CEfSVXVBJaGWBFdgUr25Tkn+LCq8WLP5MGubg2iL@vger.kernel.org
X-Gm-Message-State: AFuF++m1iIn8Y42bc0jaH56xSXQcnRNphBqrWY+56EGFjd8lYRcv7klE
	FeVZ5gD/9jT3HikCiD/i8/nPJyk062wk7MdlVmojb9pt/AFidMq1s/FjPncVucY2nMwImrJyNhl
	ygWHPYYAS
X-Gm-Gg: AYBFou2ePqIxhjYE4C0AU6GsN8janmyIl7V4tIM8gNd91oh2Fyo3eiqd4l6uZzzObAU
	fdxD4EyMow+NEMLpU5s4lcUJqhuFmi78v/3k88yOYoKP9Nh96XnwdCzIUdZuv7YuKPjDAR7JRmM
	woOzQIEBHPm4Q8RIR4aoqwWTBPjpeLIqQVHaAJ7fXYsYGTzI4ySX7OZ2WVEspUtoNWuNI/Z2XXP
	ylxIvd8yDcz4afuPa12FozFzJNh5L01YfswqPAWPQ0cqgOE1tLRv+RG+/L2qqDz7rKK1ILPhQ50
	uIraoh+LLr9i3UOqLgzKM7Ra4o4bofxRofesPBDtcsAZXSj2jbBuJOidFDf8UKo38B9BLIvWhRx
	TOOfkJetqqBaMXZ55H3mlvhZNKQK3Cw94+Bl0ItqJNaj1YSa4mI3XI82WRzEYrwBFvEgY62jdZa
	UofG3PMa/vPesbrALNsk7TkpjPkXV5BEm/8xY1LgaTdOfaLAXdu8DlAlNwnK1Mnd0f4CXctFs47
	gHAj89+72SNRL01+6gH5Dr3DBqInnX9c9oNF0s4CC74hNf+
X-Received: by 2002:a05:6820:4cc1:b0:6c3:ce1d:8e15 with SMTP id 006d021491bc7-6c53fe7f2a3mr1088142eaf.25.1789387828907;
        Mon, 14 Sep 2026 05:10:28 -0700 (PDT)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com. [74.125.231.76])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c0927adc48sm11286688eaf.0.2026.09.14.05.10.27
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:10:28 -0700 (PDT)
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-470417e5b52so1434409fac.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:10:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx7PKu8IJwXCkfmlBQPynEZQ0lWZcBjSPSI0ByHK4SLes8wgeXLWV1zWRZ34gi2M3SGzulabFZnOrED@vger.kernel.org
X-Received: by 2002:a05:6820:1f10:b0:6bd:cd33:b885 with SMTP id
 006d021491bc7-6c541b4585amr1031566eaf.42.1789387826624; Mon, 14 Sep 2026
 05:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain> <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain>
In-Reply-To: <aqU5QFGmYlCtbdiE@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Sep 2026 14:10:10 +0200
X-Gmail-Original-Message-ID: <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
X-Gm-Features: AcwNN1WrtThLwvG4t-JyEDTnuDjJJzAFO-QYuNebGgduCRp--_WjKNF02oVq8vc
Message-ID: <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ceclan Dumitru <mitrutzceclan@gmail.com>, Dan Carpenter <error27@gmail.com>, 
	dumitru.ceclan@analog.com, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu <Adrian.Suciu@analog.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Dumitru, Dan, Ricardo,
>
> On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > Can you check this
> > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > please? If there's a single patch that needs to be modified, I can squash a
> > > patch into that, otherwise v17 it is.
> > >
> >
> > These are the same warns reported by Niklas in V13. Dan fixed them in
> > smatch in devel branch but fix is not in master. Testing with smatch on
> > that branch yields no warnings.
>
> Dan: any plans to merge these things to master some time soon? Or:
>
> Ricardo: could we use devel branch of smatch for some time?

Do you know what patch fixes it? If it is easy to cherry pick I can
add it to our list of smatch patches
https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads

>
> This driver has been waiting to be merged for quite some time so it'd be
> nice to get it to 7.4
>
> >
> > https://lore.kernel.org/all/ai_txjwLPHsSKsJI@stanley.mountain
> > https://repo.or.cz/smatch.git/commit/d12183645a31b737d7fb39cbefa589e34615e8f7
> >
> > v17 is still needed to revert one breaking change introduced in v16 and
> > fix more findings from Sashiko.
>
> Ack.
>
> --
> Kind regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda
