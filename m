Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2DD3E44F8
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 15:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781103992; cv=none; b=m1Qfgud8zi0mpmvK4NIhGBvnkaBjuVm8oMLqBH+tFGOjUjhZHwj0f23RKgixzHMIqUk29EvOI36PW7rugKRU3zc90M0G0Bgm8ZryOFVMibYr8rXAJfgwdORKga0FuDkiRb9VwIADiL+WAYVd2mj0t15VVyLJTcUYZPrJ1e/7MnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781103992; c=relaxed/simple;
	bh=n5KY2viCF9d620hXPKRwyH3alTyKCHTYGOkodRCIfnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6QzieQ6KcgyIBvtP0oIDqROwcCersbbjX2az76yUQp4XQm3rL+JIihTtEgJaywyTwm9io79+Dtv0dJ6tlKN9EBv3b0Ssnt7eZ/sg2hdmGNZiID8qaYE2PBJSMlmW17MCEnMhgZFK7xZ3r+xhNYdc5gUwDzo8QX07yyda2JyXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsZBTJRm; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsZBTJRm"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9159477c893so842663485a.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781103988; x=1781708788; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BhXukM9QUkGA+gfv8mb8Arvflyg1/Xv+rebhJGLwPM0=;
        b=hsZBTJRm4D3zFchuJ4wz+jIufJtI8RUqshiDHyQWlrP4MbSY7QEcE+7p7sFQzrh0ff
         Rz13+qCF0mhS13CHfQ9nV3BtugwbpGzeaa0vEhTtB+2WJsJ4flHQzzFLVAq+RB4PlEY0
         CSHjtLuDSP2i5beSdSBi1q5JJaQ7tiDEy4VmvWLDNfpGgsKxAFdr5S8RS3W1yMaRFw8o
         TojabuRB4vVP1LOhogGmwwe5gMydD4IbZiPwwT0yVyHEzY35aD3ZyKTmCyhcmtrGPh1x
         XciqDLjX8lD5Z0owg2t+qrDX4io6zPdY2E+6pCSQff13ZS9RBbFz+6HCDbFCS7Q5gIzA
         PoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781103988; x=1781708788;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BhXukM9QUkGA+gfv8mb8Arvflyg1/Xv+rebhJGLwPM0=;
        b=n8gBOfhRtIPtmXYx3kFmg8GLULrcJeWsGV0lzCFPn/vXNclrWvNHwRuBHsoiBrzLpt
         Rq4IMMT849HAmHkk+lWZVWN2tEx/YaRMFDo6b9UshMeIzdtGOCzB0dijrAJs2kfkukx+
         feCyl7XIMWfgIn1nIdDg2lE450sEmj13oiH87xRq+b8ohSDSLfKt825OOVhB03LibrCV
         Z8lL7GCUuRALs3O9uGebBhd7mlfFnRX6RrkdOScLk6FfpVHo2mbt3+c2vXk4VMuLmaeG
         22WBvA40sJxbiAKxXlJ8g/Yo02YqB5GU3nTPVOZ+Zt6zj0cX0UZtYvVForcvavBYErw/
         0tfg==
X-Forwarded-Encrypted: i=1; AFNElJ+NkrXj4WXZwZDKDcRXJ5lefXtYMyshjqkAArK0UxbcBmZAVlaAGHnll3EhSmL7A5QrS/UjY0oyO8qy@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ9Ui5BThioP6qhLzrY1c6W16ptxwmjIKjJNIhX2unBnbKDJfE
	XudINAmp2m3yWJRnMnqWbRj/BP8rEhyree1Lo1P7MZO+f+qWm+OKArDi
X-Gm-Gg: Acq92OH8DBCu6FsyKJz9qQxSoCG9wgpzweb8x9WLInuklGJIYtSUD5dsL2Vy8QZlCRC
	gYEkr7EDHQT+a9sj2ZfaQQ/wKOidUiM6RrNmBV+pgn+n8FILXRXBMJGhkg9YjQvtOl6tPpOA8HE
	u/TXcINTJg/82R20JgIVy3JgW6o0kr+v6gdxzpzsF+x1fok20RlyX3hsSPqTAwe0n+ZFg3PX9Id
	ynTfkpJPouhAz2kWmNhK4QcDEuOhIAOfJMu+3MtZdibs+0yP+YNuEMAgqY/nVuXvNI4mUJBjiQL
	GKlrSG95Dh86gnppu8Tz3nUS9QCIr9p07HUwGRovUCEPcxcBYfJrhGQ/R6WuaUKzb6U1nTxrkhQ
	bIJhWZllFGiJEvd9KvJ0P1aoaQXbdgxA4x9E4Y2Ij3Izk0OH5qBqHB5zqKZvN5ilg8YMqKxif+2
	6mjq5KVSOSBGv64a7Hpm28rmJF18sl5AephqPyLlo=
X-Received: by 2002:a05:620a:2b4a:b0:912:1:b41c with SMTP id af79cd13be357-915a9a43532mr4135578285a.0.1781103987828;
        Wed, 10 Jun 2026 08:06:27 -0700 (PDT)
Received: from localhost ([43.225.189.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3d2384sm2460658185a.39.2026.06.10.08.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 08:06:26 -0700 (PDT)
Date: Wed, 10 Jun 2026 18:06:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: dumitru.ceclan@analog.com,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	mitrutzceclan@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v13 17/22] media: i2c: maxim-serdes: add MAX96724 driver
Message-ID: <ail9bHXL_NV2DZK5@stanley.mountain>
References: <20260604-gmsl2-3_serdes-v13-0-9d8a4919983b@analog.com>
 <20260604-gmsl2-3_serdes-v13-17-9d8a4919983b@analog.com>
 <20260610144242.GF2948@ragnatech.se>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610144242.GF2948@ragnatech.se>

On Wed, Jun 10, 2026 at 04:42:42PM +0200, Niklas Söderlund wrote:
> Hi,
> 
> Thanks for your work.
> 
> This patch gives me new compiler warnings, can they be avoided?
> 
>   .../max96724.c:402 max96724_log_phy_status() warn: subtract is higher precedence than shift
>   .../max96724.c:409 max96724_log_phy_status() warn: subtract is higher precedence than shift
>   .../max96724.c:588 max96724_init_phy() warn: subtract is higher precedence than shift
>   .../max96724.c:756 max96724_set_pipe_remap() warn: subtract is higher precedence than shift
>   .../max96724.c:796 max96724_set_pipe_phy() warn: subtract is higher precedence than shift
>   .../max96724.c:818 max96724_set_pipe_stream_id() warn: subtract is higher precedence than shift
>   .../max96724.c:830 max96724_set_pipe_link() warn: subtract is higher precedence than shift
>   .../max96724.c:942 max96724_set_link_version() warn: subtract is higher precedence than shift
> 

These are Smatch warnings.  I appologize for them.  I know about them
but I haven't looked at them.  I'll fix them by the end of the week.

regards,
dan carpenter

