Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F49388862
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 08:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388113; cv=pass; b=EDuBVYmz3lxrKzida/Q4/7AGIK87zB8PwEd9gOScS+RCwz+Cwh8u3XqT9sEXJw48gWHXCkVOyL7HWCJ84hlWa4Lxr5paYZhTiT1vHXMiA/53gYzytdWM1KGFMr5K6y6Oe01B/Ld3QEEYYXbzhjjumBZsJ6MRS3XmsPOMl+f5n0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388113; c=relaxed/simple;
	bh=SlCJhBylOzlkOPgNxa4vipn9yPxx3vthybfgaVRd4sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7lO8r46Tj11mWqSSlrVu1NX4hPEO3249cJDe1A83q3+fqQD0HCguIWV7CBmkmM1IY5N8ijdllvZIS4y4MUNSlbsQ3FjmF0G8MVemgKD5MZntkHKeeDNJ6b6N9shNC5mCxv9L+dEUChKc0dFRHCKhd7hENz0MjmLfy2lQZ5evgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcrCovYn; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcrCovYn"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490a765d410so24886765e9.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 01:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780388111; cv=none;
        d=google.com; s=arc-20240605;
        b=LdbmPsJygKiK+QxWs+VdA0Fxe4Se5C28QDJXJZj79FX102HsxEfce/pKZHsEJOPKCx
         NYdzr/kCRshYUF+QiMuebTwVbY1YWG7w2jO9/MO0AjsTwWAyoz98FH3zdryOfaMPFUXa
         STAhyixdve1oHeznUNZkUi3F5GdWtAchPQcbtbKd4ahETgkz2/wY1oCzbUEYIwErmvdm
         bu/FWpSvNMFpu3Y0Y97Ke8qewPYdmvy6tWTnZ0nqcBbMEogtZFn6xf6liNFhSKELo802
         99CVVb4l1iHoVRh0qu8pAQomgtn0Ca8xixKSiQ4OWGgXAU4A5cPASkA0HZJDH/+Sg2yE
         Q8Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dViNr93X/dYoXRtlltH7nsrecEamX34qdglxK6qZs60=;
        fh=QMW5FuBFqVR0gKR4VMxXJzbSpE22m+knHAy9EmJEbj0=;
        b=Kgmfs9MR/Dvy1DUQjnaRCJezSZc8W/xS21r6RX4rOhDHReVmOzCkOOa11gJ+qWBAe+
         WWnzEX0tFKOUuIlwMaDop4VzHOTKRBH54R6ZvEdviP50EujO1ex54D8UaYcs75FjK25j
         5atSQ7EXSkuFZ2pDXfOPvfrcREBF9sZ2+W2Cc3Dvi1s119/DQaLYG886/laQ1hfoEMlK
         AlS5529Ejvi7H/fuou3C28G4j9l3sS8eTzPM2mbRsuIBo5Q5eu1VcIMGmqxnRgCeSzi7
         Ksq5HTivwfmVKpqAFDe46gxIm53URkenwxS95oy/Thee3ZNniXf7xqpzlr3WBi9L3RF+
         dA7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780388111; x=1780992911; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dViNr93X/dYoXRtlltH7nsrecEamX34qdglxK6qZs60=;
        b=JcrCovYn50G1LvKq0dVbeymKfPpOUC1b84sETUS+hEOAhWMOPrf4wm++U3oIvBxKtb
         aXkqwTJlXsxx7hXigcpWdcOLkGnhzHAwVerSyqyE2OI7rukze49lM5uAI5oGMFg5UXZE
         pMuWCyAeaMDPzRLWjml6jgyRywrpkmzpfdIVgRwox/pGZwX7qeANa8FYCN3uREtz67Ho
         e4LGFplOQti8k7d/UfzL96Mc7H9iqsYCc3AllDE/QLc0/S7h1zrMWCDD2Q/Fm0MUetvZ
         x9tq4FfIkcAc27ugsZmFUPFbScktSSlFmoDNPstO9nw0Mg9Mb+egHKtSwgsMfTni2ziW
         vBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388111; x=1780992911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dViNr93X/dYoXRtlltH7nsrecEamX34qdglxK6qZs60=;
        b=eSXAxFexRPq/FWGrKZOV37AXt8uTN4OKq8p9Wwkjq1aJKVqZvVpJbJv5eVvLHzItSZ
         TnQwsCllNM4uDOmAMqJ7gEzyIsYYsoVDMm9QkfbXAFA507dg+BqOE6bU6MbVOZiO+bIo
         m22RD2IotfQ60Om5NgHYREsikcxEv8sgP3Msc8T0rhxeOhOvmYwHsfs4PzI19HYwaiMJ
         R8VejXyoEW+mmb3+1sGV+TpUHDkjvbxmE9t7ecrqJ4M7LrL/CzqiSRQqL1F37wOaRasu
         ywC2skPe84LRFw5CqkwQc4N7Vz/SMbD6UYReCZySDlUPfI+uSGhxAyVQ6akxGkiLLZO+
         Qf5g==
X-Forwarded-Encrypted: i=1; AFNElJ85NGTZoqYqjjFrhTKtRntebvOxM7S3I4oPTQeBZRH8jwPIBHb71YBSLnVDIW108gvsuJRsV2U6Ekgm@vger.kernel.org
X-Gm-Message-State: AOJu0YwSgk7m2dJust32c7iYBryPKFE8U/D4o62cRbZ5nDtMg6VTZCmc
	+62TC9AnRqRuiK3ejH9Ueo9c1xxD4Lat82JdO9j3wTb9cyJ+9E814QMHDzmnRHsosV6HjaMkcwN
	oOo3f3BqlatG3aHBckqc1tKNwgvj73uI=
X-Gm-Gg: Acq92OF5NeuPr+X0UZwCwmfCngmWUT8aYSDvtBe8eredxU5zDWVbgeWEkx+fD1yJ+Dm
	2yL/mrDbemvPlojI3W3qGAntazHRU/v07tfbOqUrHFUotMALO2aC/QOs6qh/9XC/S4QO+BlLb33
	jHJagnZ7Uj+RKbLcsWgkftZPPGcRhpjLVEopZRykC9wuAiApBM84HbKFx8GXRFPH7shYmFoJyxK
	zYFyUeC6sZuZcurwaYuEFn/4FKSKgWwb6PFLw58uVk9gKnFeRVbfI/nqG8QGKKptyhfg1PQi8Xp
	D7PMCwP47ii0BY/AfhUMT0oxVXq8hkSREt/d4ecuoVsh9qIqOTrpf7cDh3b/VnKceWSCh8QqMw+
	xe+n0Uhk3T22zZdZiZt6X/OqhlBY9Nhc5FALqeGEhbSSS9YkQfO2/9Zp4nm8czUlY3Dhn4YPTu0
	ABOkAtS6j2LfVZPwaV
X-Received: by 2002:a05:600c:6091:b0:490:6237:521b with SMTP id
 5b1f17b1804b1-490a2b6b21cmr270415925e9.27.1780388110635; Tue, 02 Jun 2026
 01:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530-veml3328-v3-0-dd562eaee8d9@gmail.com>
 <20260530-veml3328-v3-2-dd562eaee8d9@gmail.com> <20260531101940.037d1d7a@jic23-huawei>
 <CALoEA-yEA5KcvXqZCCg76qFAgyNq8BQ5+gop442mju-9PiKaxg@mail.gmail.com>
 <20260601101726.203f56cd@jic23-huawei> <CALoEA-w8zX+bzpEfvGoafDaOr6Kd-USgsyZ6SRpV08Yw6MaVrg@mail.gmail.com>
In-Reply-To: <CALoEA-w8zX+bzpEfvGoafDaOr6Kd-USgsyZ6SRpV08Yw6MaVrg@mail.gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 2 Jun 2026 10:14:59 +0200
X-Gm-Features: AVHnY4JQOM4EWly35TPs2fbGJO-3-8pJdZj8RhArbOwKKDnqvspDzMSHGCRlGgQ
Message-ID: <CALoEA-xDSVOj0qkr6fYnQt0s1Xqh6acsVs7c7QKemWRaRh1i6A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iio: light: veml3328: add support for new device
To: Jonathan Cameron <jic23@kernel.org>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rishi Gupta <gupt21@gmail.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Jun 2026 at 16:43, Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> On Mon, 1 Jun 2026 at 11:17, Jonathan Cameron <jic23@kernel.org> wrote:
> >
> > If you have time to figure out the path that causes that, it would be excellent
> > to have it recorded. I spent a few minutes the other day on this and couldn't
> > find it.  Maybe ask AI to figure it out :)

Briefly analyzing this with AI (Gemini 3.1 Pro, just like Sashiko). I
noticed that
in drivers/base/dd.c the specific driver probe function is called and then
pm_request_idle() is called after it in _driver_probe_device(), which
is probably
the reason the sensor is suspended after probe even though I didn't
explicitly call
pm_runtime_put_autosuspend() (odd that this behaviour in the actual
driver base).

To err on the side of caution, I'd add a pm_runtime_get_noresume() call before
setting up autosuspend and a
pm_runtime_mark_last_busy()/pm_runtime_get_autosupend()
combo before registering the device. Technically Sashiko is correct, this isn't
explicitly done in the driver, nevertheless the driver base actually
handles this
if pm_runtime is correctly set up and callbacks are defined.

Jonathan - up to you if you want to fix up the driver since it's
already committed
or if I should send a patch (I guess it isn't that critical, but it
keeps Sashiko quiet
in future patches).

-- 
Kind regards

CJD
