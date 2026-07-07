Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16413F44D6
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 10:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783421544; cv=none; b=C2WrX7cwAaJP3N4OVMXD33PO12kHUAbNhLKoLMtBWyL89BpFwwMUjkiAK4WSZWvLKYvl1qK7VsjqtVZToyBGIk1orJStQZw8GblXs35MZ+z277vBMciAERBz5SAg87P2QoxjsfagH2MZjntjgIkBKRNL8+w+98rkG6CLA70/5+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783421544; c=relaxed/simple;
	bh=U1qvcFxLKrwEquFjkv7uGnL3tOB3rFVzjZa3qamyz38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWSfePKXvxtmpXcG2xwJ/KHppGzVYs/CqfqcaVYaCB39yT03CElKaJYLHAtFj5cV0LbbC05gJCglNi4woOA9E0E5vWpvcLBYlkKMEOZoOhoZm+EYQAJYw07PWMR/Tuk3eCXt+jfZt8/VMptO+rYTedO4jgVgNe2x1qDBSCngeTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2S6VbhY; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2S6VbhY"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c7902f47so24694925e9.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 03:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783421540; x=1784026340; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xD/I4R2QXs7s+95dAxGC6Ggop7ankDcEDMFD0oYB+2Q=;
        b=D2S6VbhYrlD2hqzn8sgapX710ygbTyX9A2BBWrt76Tx7hhh5DriMr8+490ICdkiCFw
         kH1zKsmQIKmcCUXiNLk12MG1iOpm14y2fU2IweNe8VJx1t46MIXKdYVC/7gcvGVnWcrW
         swl5DlcYq5R7HYmzehkMvTwdJ9PKINaP8mK8zVIPJkPZIhZrWop5QdklUSAxH1Sij+Su
         w+f3muko16oxQMzZ9spFWxlN2kg7mcBLb8tXSfauqoGE0s/5rE5iGNdWedxlUvR7GfAa
         0BoFpEaTePSRwCvz/IaIg3kiDRaxeFmiwVGv3FP3LnucQs/v3YcwGXDNIhO6N38NkEWh
         bRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783421540; x=1784026340;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xD/I4R2QXs7s+95dAxGC6Ggop7ankDcEDMFD0oYB+2Q=;
        b=B6gZwnJaWxUELvEifPmxvzMB6R5rr36msf1InIMzHHHLvSKuMjIvbfDSwYEWZORu2r
         80qFWtDnwPDOST7YJLw067kQ/467rXUTDDeL5lhxwcYiGzlnkCSnW5CamjtrmpIixPUy
         yp9fgh/5XrECoWDuSiOVwCGgihNHhb0FZG2h7c7QU2ZGTogzgaLrTDDr62eTJAoGualo
         xXWMw14ZNP0lGASW+5pT8ysZ9buXAdtauW1nJHS3h21RozjI3+rtvxJCXUxTCJSgvSmI
         IyB9kMTA8DOqfAFcq2sWSJbFnH3Hxv+mU2/2J7itv3mSNZeQWA2SRu54IOAMIaeEi8R3
         Z1xA==
X-Forwarded-Encrypted: i=1; AHgh+RrjKhgiaQOrhKUczkjvCWfyUcCgONYK3WV+hvAZ6YOcVqCN8PDtqH45QhXRGrZ7VpHVUIwcOx/uAAUO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs3sieGWm1eVAooyS371k9Acxmgk2tPedSsLlZH3usP4liyf9M
	n+ov751FOKMhQony11vOivC0c8UnjPvIRVmFnMMDgFiHPH6jXWKr52w2
X-Gm-Gg: AfdE7ckwGD/IxKeVcp2RA2DOMmOIpq+V+O8MAuSWslCuke4+kwNx2kOV6EjwPnSa1eA
	9wafMTG1jSBiWbe4JuqkV/scbJ2Mer54vKQCHuL0rPPD+Yx4nrWn2edEd9vkMn6FMVA/1NQtXK+
	153oEcGf/6Sbw5Agw+n0umrDiTCqY9UU5cukyn0pyQcv9zJGdugNvhXmykuT7N6Ul3hj0Hi/VwC
	EVTUWaNJgAnggS6ozt4k8ACr6QPWXBwI+pOF1rydIRNRa4+S9QXvr4sWoDJmqx3s7jlSiF0AGiJ
	HE/S+5/Kz9iXyCwg8rKeMycUGbSjSrxrgj1G7gHXJoLP6lrtU7qRlCMv4pGw4DIADXDA/JZWlAc
	nvUzIs6RM97LVMykJ7K9s5PPJE/YXF9mIwWRwzb0RM7GlI55D0ZkSCKmB4PHqg15YswpvhU3Sep
	AVfaZu8i9xUdOBTrU=
X-Received: by 2002:a05:600c:c168:b0:493:d282:8298 with SMTP id 5b1f17b1804b1-493df052084mr54038025e9.16.1783421539970;
        Tue, 07 Jul 2026 03:52:19 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493df7010aasm40499085e9.0.2026.07.07.03.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:52:19 -0700 (PDT)
Date: Tue, 7 Jul 2026 11:53:24 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>, rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v6 12/16] iio: frequency: ad9910: add RAM mode support
Message-ID: <akzaWsIIA-uF_Crs@nsa>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
 <20260618-ad9910-iio-driver-v6-12-79125ffbe430@analog.com>
 <20260703040544.08a8ea5e@jic23-huawei>
 <ake_YWfvVC9RQ3wu@nsa>
 <1493eed5-5bb8-4a2c-8f2d-8b4bc5dde157@baylibre.com>
 <akt3i_YxG-jF3IdJ@nsa>
 <2d84950f-c56a-48f5-ab7c-c7b7ccb3b28d@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d84950f-c56a-48f5-ab7c-c7b7ccb3b28d@baylibre.com>

On Mon, Jul 06, 2026 at 09:10:21AM -0500, David Lechner wrote:
> On 7/6/26 4:47 AM, Nuno Sá wrote:
> > On Sat, Jul 04, 2026 at 11:50:35AM -0500, David Lechner wrote:
> >> On 7/3/26 9:09 AM, Nuno Sá wrote:
> >>> On Fri, Jul 03, 2026 at 04:05:44AM +0100, Jonathan Cameron wrote:
> >>>> On Thu, 18 Jun 2026 14:27:28 +0100
> >>>> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> >>>>
> >>>>> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> >>>>>
> 
> ..
> 
> >>>>> +static inline void ad9910_debugfs_init(struct ad9910_state *st,
> >>>>> +				       struct iio_dev *indio_dev)
> >>>>> +{
> >>>>> +	struct dentry *d = iio_get_debugfs_dentry(indio_dev);
> >>>>> +	char buf[64];
> >>>>> +
> >>>>> +	/*
> >>>>> +	 * symlinks are created here so iio userspace tools can refer to them
> >>>>> +	 * as debug attributes.
> >>>>
> >>>> Maybe worth a reference to appropriate ABI doc here (even if it is introduced
> >>>> in a later patch)
> >>>
> >>> I'm not so sure about these links. I mean, I definitely agree we should
> >>> make it easy for userspace tools like libiio to be able to handle
> >>> these kind of attributes but using debugfs is questionable to me. Pretty
> >>> much because this is not a debug thing. It is a real setting for the
> >>> driver so ideally we would be able to control it (using the existent
> >>> tools) without enforcing one to mount debugfs (I know that most of the
> >>> times it's always mounted but still feels wrong to tie "real
> >>> functionality" to debugfs). 
> >>>
> >>> Having said the above, some suggestions:
> >>>
> >>> 1. Make the iio_dev the parent so that the attr name is just "ram" and
> >>> it will be a subdir /sys/bus/iio/iio:deviceN/ram/.
> >>> 2. Propose a new helper for the firmware_loader code so we can get
> >>> struct device from struct fw_upload then we can easily create a sysfs
> >>> symlink.
> >>> 3. Name the attr as dev_name(iio_dev):attr so that it becomes
> >>> iio:deviceN:attr_name.
> >>>
> >>> Now that I think about it, 2. does not make much sense when compared to
> >>> 1. And If I'm not missing anything both 1. and 3. can be sanely parsable
> >>> from userspace (being 3. maybe a bit more reliable). And yes, both require
> >>> user space tools (in this case libiio) to support a new type of
> >>> attribute (firmware) but that is another problem.
> >>
> >> I would say that udev should be used to find the firmware device from
> >> userspace rather than creating symlinks. And you probably don't even
> >> need udev if you already have the `iio-device:<ID>` value. The path
> > 
> > Just one note. If you mean <ID> as the attr name the above will fail for
> > multiple instances of the same device. That's is why a proposed
> > dev_name(iio_dev) which I think it should reliable be iio:deviceN. 
> 
> My <ID> is the same as your N. It looks like I just had a typo of
> an extra : in there.
> 
> > 
> > I guess N might change so anyone hardcoding it might have surprises. But
> 
> That is why I mentioned udev.

I see! I would still advocate for apps to properly do the matching
between the current device id and the firmware path :)

But the above is obvious something we can't control.

- Nuno Sá

> 
> > properly done and we have a sane way to match the above with anything on
> > /sys/class/firmware/iio:deviceN:<attr>/
> > 
> >> is always going to be `/sys/class/firmware/iio-device:<ID>:ram/`. It
> >> seems like the same amount of work for usespace to computer the path
> >> either way, so might as well keep it simple and leave out the symlink
> >> stuff.
> > 
> > Yes, at least for libiio, `iio:deviceN` is already what we call the
> > device ID so we can match fw attrs against it and everything after the
> > last ':' is treated as the attr_name. 
> > 
> > We just need to keep in mind that if a second user of this stuff pops
> > up, we should add a new helper to enforce the ABI.
> > 
> > - Nuno Sá
> >>
> >>>
> >>> - Nuno Sá
> >>>>
> >>>>> +	 */
> >>>>> +	snprintf(buf, sizeof(buf), "/sys/class/firmware/%s/loading", st->ram_fwu_name);
> >>>>> +	debugfs_create_symlink("ram_loading", d, buf);
> >>>>> +
> >>>>> +	snprintf(buf, sizeof(buf), "/sys/class/firmware/%s/data", st->ram_fwu_name);
> >>>>> +	debugfs_create_symlink("ram_data", d, buf);
> >>>>> +}
> >>>>> +
