Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C20194C98
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 00:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784852525; cv=pass; b=fyXoAlO2jqxZ0vxags9NdWDVnzJi70eGWF46QOyYejxSAvBJoE3OaCeVxFN+MN41N/5uODQe/2FlnHORZ9OWkgF2A2iorhfKmZe+Es1Me0at2d1wDkurcA5MM9lVYOABDnv6QunU6Eh6b53+JNAglK1mUKREEnhROKlKuRkQ7zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784852525; c=relaxed/simple;
	bh=CvYiPvUHs25JATfiRWoh2MDCkKkqEc7EU42mJlzPsTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UlXp7HkjVqFA1DIdsOB8O3Xyx4DDr5qdO9xHXd8esXCUcPNnFvax0Bgwsd0PpvRlYduN64Nlb0X1fTFBAoYqGJHC5xEC2sjW91xSROavj7kt+2LT8zOW0K4VLAxcnPTmrmD+JvHFBAT24+Fzsy6GYdsKnUp2aK7RAqhgE50XcX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APeScHbs; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APeScHbs"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b015532f7bso1052523e87.0
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784852522; cv=none;
        d=google.com; s=arc-20260327;
        b=PlAJoxEHj82vqNVkYHX2DlUc4Oi+chPEVDUPQigKbu4a/rlzUcOJNlMk9xJimhgzKH
         w/0Cj2p9ZO+/EVh+I8ZOcmHslLqtNKBnrwfTnMc3QZTSsj5Qr7BT6YHLDyCJyq0IwVDx
         kjteYmvMCGBE5unhFS8d0K1+SHq4KRp3TwrSCQgnxsPTVVrLlXoghx+KxOPLx609Qwu0
         i8lw57WWzlbr3vxQEK0id+u2nyJ6k+TzsHokXwSWs4i61kCKg0Rx3/qJngYLaqJTHSMy
         ZtM56jr1DygSJPLTVt/a14pdoms5pAcE8VQX14x06BwUlDRxucpyDjICIdIJlMSiaNoD
         E0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0prRSNduz+Ji/XS8wepAJVI1GnsS0uEtqzgw4W1wWvM=;
        fh=d/nTopzL5EqZPZoKHv4QqrT23CbajbfNwteIPpR23C4=;
        b=hvh2XNQY1eJzD9VpaKpl8WfNdvmXNhpEtxPZYAXtq50PceKrDefbeaS6b6GuUDb70U
         nuWE87cqwFw8QFPUNEMjTK6RqX5BHAzfNTnYnkCgwsZQaTQEw7fwY/doBW7CrylbKUb0
         a+pMf8gGqvhuayGMOXDTU8Cf2nxwi2IsetAek/gjKY/k4ooy1Mg5klkVKsarjWrtJcxH
         BHKI0r+r4x9KK7n9POW7oZu64VyVS7InuD3gZ0NQSPToz68lPYUKL3Xt1Ng4mQcQ6aWX
         DmlTeKzin0g7cHhow1NzqxbUwFs2oYi58LSFtPb9XbcbDLNz/yRlU5aNoGxPp03kWHx6
         6z3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784852522; x=1785457322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0prRSNduz+Ji/XS8wepAJVI1GnsS0uEtqzgw4W1wWvM=;
        b=APeScHbsEKQOFimEAHrZgM5bv63M44UTq/0HttSxA/+b8AgC76NzEplVT4Wz3q22Nh
         XhGSBdgakSKTck5aOsoFU6GZ/zR7zj7CPo3Erpnc6cqq9UZk+m9N9Hf3xcFC3fuPidEm
         pUAX4dlQCa37tN+KlB1Ti+8A1bEeSgdGK8jv8BrT4ELauGKesXcUQ/NvIl8GPIvtjHUa
         dlq6LGKfwJPDKc1hqxTTexImV3ooa60AkLAwty//TU1Aud+zlDsWoYwc1GJMMw5GrPD1
         i6YTUxWoKGJI6VvLUwVYNe4J93ja8dWxABQC6msHr0VITudSr/EZbiQ57L7f+pXfINUu
         5yZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784852522; x=1785457322;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0prRSNduz+Ji/XS8wepAJVI1GnsS0uEtqzgw4W1wWvM=;
        b=SB5TbaDe3IW6BVh7EoKXnicRpKFgaNKWfA5cNZgc4Vcqbg4k13viuQO5om/TLcCp/y
         COMv3F9wdyzAkyV7a591bZWHejYkP2dHb6/zuzOQIBkSrvt/RKwlTSY75LJglvm+u6/r
         b+ZUbww98ny7aAIQhmSR+whYEJig1P0J0G5o69LdQK5iS18h7Isx+Q1X0bymCg1zZx0M
         o4ii5KfB6BQ4VIa8yWL+0vB3MNv1NbDvYRvT3Ynvmq0CjETPU/IBc9amyn6CcKy8wGQT
         rgVlDc6T5RJdFbFR6wJm4t3bfmN5oWnduF3dmfSquTEcpE8p23P89F68IJ/SYpILGbm+
         kAwg==
X-Forwarded-Encrypted: i=1; AHgh+RrWraV7iB5RRdpbrEi83BjimHlFrd0fK/JamxQ2yE56rdcO9b1lZC+m5DYKSXfhcEcoYrgjCQi+d2bB@vger.kernel.org
X-Gm-Message-State: AOJu0YxXceIZlRT2yBY00LqXR8ONvb+eN8dIvWRAc3UcobDS6veWegNK
	7ae4JDsVr+hEOTseckiOdoDHmrHQh+Ck6nYjFp0eCcE4Bdvvm4uiVOBOisz+H7ttnjo5FYs9dS+
	kqKLh6EkL++F7n5+MbtdRjEUa/mvJcUk=
X-Gm-Gg: AR+sD10kP7lXNrnS31UvLVZWi9gkwONx1HXUVA188GObfSAhN9Nl3lITKuzS/SaFa7p
	rndZA/Nu3v71nNDiTNTbH76CyrptmDIT7BFXGXLDB3JAoF1+b45RRt/m7DnF/dLj857+FpyLmov
	VsHOCuJ+XNAcbXdwc86x3yCd5NHDcDi9OsTChw8AlWxuPyhBv/WdySpHGZOtUCrJoMzNu9AOT01
	w8yxHe2ENJ8vzNau77QccFNTL5i9CETP4NF8sDHjQBl0RumfFhiafYixx33pdwUzkktdmKm8q6+
	Jt7kW5PAEi66fAEEbhDfiWdLunwBIjUBkQd2rla5uB562iJ8EA==
X-Received: by 2002:ac2:5b1a:0:b0:5ae:b9fb:1582 with SMTP id
 2adb3069b0e04-5b2b2f6dd1amr699298e87.40.1784852521800; Thu, 23 Jul 2026
 17:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603184859.89693-1-piyushpatle228@gmail.com> <20260614220400.106dd636@jic23-huawei>
In-Reply-To: <20260614220400.106dd636@jic23-huawei>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Fri, 24 Jul 2026 05:51:25 +0530
X-Gm-Features: AUfX_mxzNJZ3fgQIe67qr4_QzOSjCjon-5KcXoIL4PiIg6XtabyfXedcfWFcXYg
Message-ID: <CAMB+xkbpgDxv1Lt=qxqKyeEhXyxRpZ3Y1v7ZDaMGKUqAa1hDxg@mail.gmail.com>
Subject: Re: [PATCH v11 00/11] iio: adc: Add support for AVIA HX710B ADC
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ak@it-klinger.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andy@kernel.org, nuno.sa@analog.com, 
	dlechner@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 2:34=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Thu,  4 Jun 2026 00:18:48 +0530
> Piyush Patle <piyushpatle228@gmail.com> wrote:
>
> > The HX710B is a 24-bit ADC from AVIA Semiconductor, related to the
> > HX711 already supported in this driver.  Unlike the HX711 (which has
> > selectable gain and two input channels), the HX710B has a fixed gain
> > of 128 and two operating modes selected by the trailing PD_SCK pulse
> > count after each conversion:
> >
> >   25 pulses (1 trailing): differential input at 10 SPS
> >   26 pulses (2 trailing): DVDD-AVDD supply monitor at 40 SPS
> >   27 pulses (3 trailing): differential input at 40 SPS
> >
> > This series first extends the existing HX711 binding and driver with
> > preparatory refactoring, then adds HX710B support on top.
> >
> > The differential input is exposed as a single IIO channel with
> > IIO_CHAN_INFO_SAMP_FREQ, allowing userspace to select 10 or 40 SPS
> > without needing two separate channels for the same physical input.
> > The supply monitor is a second channel at fixed 40 SPS.
> >
> > This revision is rebased onto current mainline.  Note that
> > iio_device_claim_direct_mode() / iio_device_release_direct_mode() were
> > removed from the IIO core since v10, so 11/11 now uses the replacement
> > iio_device_claim_direct() / iio_device_release_direct() API.
> >
> > Tested on a PocketBeagle2 (TI AM625): the avia,hx710b node probes and
> > the driver registers its two IIO channels.
> >
> > Changes from v10:
> >   - 02/11: Retitled to "add VSUP and DVDD supply properties"; the
> >     commit message now documents both supplies (the patch already
> >     added both; only the title/text were out of sync). [Jonathan]
> >   - 04/11: Reworded commit message so DVDD is no longer described as
> >     HX710B-specific (it is added for both parts in 02/11). The
> >     compatible match now uses "contains: const: avia,hx710b" so the
> >     constraints still apply if the compatible is later used as a
> >     fallback. dvdd-supply is now required for HX710B (in the HX710B
> >     branch only, so existing HX711 device trees are unaffected) and
> >     added to the HX710B example. [Jonathan, Conor, Sashiko]
> >   - 11/11: Kconfig title and file header use "similar" instead of
> >     "compatible". Simplified the tail of hx711_set_hx710b_channel()
> >     to "return hx711_wait_for_ready()". Dropped an unrelated
> >     reindentation of the iio_push_to_buffers_with_timestamp() call.
> >     Converted hx710b_write_raw() to the new
> >     iio_device_claim_direct() API (see above). [Jonathan]
> >
> > The Reviewed-by (Andy Shevchenko) and Acked-by (Conor Dooley) tags on
> > 02/11 and 04/11 are carried over although those patches changed; please
> > re-confirm if you disagree with the reworked constraints.
> As the only comments I had (well mostly sashiko) were on the 710b patch
> at the end and some patches were queued from previous patches, I now have
> patches 1-3 and 5-10 applied to the testing branch of iio.git.

Thanks a lot for picking those up, and for the reviews through the
series.

Two questions, mostly to make sure I do the right thing next:

Looking at mainline I currently only see 01/11 ("dt-bindings: iio: adc:
hx711: clean up existing binding text") and 05/11 ("iio: adc: hx711:
move scale computation to per-device storage") under my name.  I assume
the rest are still sitting in testing/togreg and will flow in at the
next merge window rather than anything having gone missing, is that
right?  Just checking I'm reading the tree correctly, no rush from my
side.

For the two that weren't applied, 04/11 (dt-bindings HX710B) and 11/11
(driver HX710B support): would you prefer I resend just those two as a
standalone v12 based on the testing branch, once I've worked through
the remaining comments from you and Sashiko?  That seemed cleaner than
reposting all eleven, but happy to send the full series again if you'd
rather have it that way.

If there is anything still outstanding on 04/11 or 11/11 beyond what
was raised on v11, please do point me at it and I'll fold it in.

Thanks,
Piyush
>
> Thanks,
>
> Jonathan
>
> >
> > Patches 01/11, 03/11, and 05/11 are unchanged from v10.
> >
> > Piyush Patle (11):
> >   dt-bindings: iio: adc: hx711: clean up existing binding text
> >   dt-bindings: iio: adc: hx711: add VSUP and DVDD supply properties
> >   dt-bindings: iio: adc: hx711: add RATE GPIO property
> >   dt-bindings: iio: adc: hx711: add HX710B support
> >   iio: adc: hx711: move scale computation to per-device storage
> >   iio: adc: hx711: introduce hx711_chip_info structure
> >   iio: adc: hx711: pass trailing pulse count into hx711_read
> >   iio: adc: hx711: split variable assignments in hx711_read and
> >     hx711_reset
> >   iio: adc: hx711: localize loop iterators in hx711_read
> >   iio: adc: hx711: pass iio_chan_spec to hx711_reset_read
> >   iio: adc: hx711: add support for HX710B
> >
> >  .../bindings/iio/adc/avia-hx711.yaml          |  82 ++++-
> >  drivers/iio/adc/Kconfig                       |   8 +-
> >  drivers/iio/adc/hx711.c                       | 343 +++++++++++++++---
> >  3 files changed, 359 insertions(+), 74 deletions(-)
> >
>
