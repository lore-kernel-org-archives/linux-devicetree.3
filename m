Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7651130F958
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035724; cv=pass; b=OKThG0xl9iYu5OJM0Wm9qZkc5QWV9ZVDQAVFbW4o+TLbzfV2/EkRT6/u8b7k/oz7g0YN2Is51qCWwV+AWP64r6PSkWE1n+WmxxrENObf68ZRtvrVAy7I7hIsptkrRWMmU9XCvqP1agBIKHaWX81mguV7H7UUpRUQcK061p44HEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035724; c=relaxed/simple;
	bh=ue6jFvPPvjqPgIpHsXNu6T7RM+b3RNh8Y6zW7p+85hQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BK6cdOdCaYFMCJjvZL8IxDvu6y7HAuawDmZEXZwiiO78sfVPLjOupLsKEuzj8Vm4uKeS6/IyuUTVZq7I3EEXdpLyDViw4qHuT4fHhHSTEG8oEYZV0gPDWaNZ0kbN5ZFII+jLE3phJ9nneQiLV0mdDABq8gCXQmSDhrDqWfTzBPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAMoLggN; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAMoLggN"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cace91f112so38309575ad.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035717; cv=none;
        d=google.com; s=arc-20260327;
        b=YxDCQGKH/CsPlabtpv1lQq0/ccZdlFgaLzW2cgCWbuY4qPdtQ330ylwSpp+vbqhneX
         nJdHlBGcpBxVgdMCOthSgGwY0sPldJWZRSOR94oPQATWy9sh13V+WEm6h7Lqqen/kGC2
         9FjPv2D8I/dUjUMsgv8AJcGHZ4GLPZx7l/ZojnKkYxJTxWQQ0Reb8MxqCEEjRoZpfX5O
         eu5bEwbRxzqK4LtjPKoqaSljsLe5CpI6A11mEaslMffGafHs7zGL5PKu4/6YfSwonrgc
         pUJ5DneEycFKtD4Yk69/4RRiyFsnvJqwmOygDI/rVUfH9UZDZuco4ZwoBCbU85EWs/qI
         JV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ue6jFvPPvjqPgIpHsXNu6T7RM+b3RNh8Y6zW7p+85hQ=;
        fh=LuEvP+cOkkkwX81EtDrmfEsAO+y+HpsUX5j+nWLeyNY=;
        b=B18xvziz3VsIbm+4pRwp8QnFp0Og32rAtHOe/UzrjQ62eGYG1ERapxTZKFfW/Me1Be
         PsNx2vK5KZJbk3iKNC4S68G4bTEWjhEDyzroJ6COar95gbC4B1LIdAtNEUN1PZQ3Tr/v
         OhYwWef/evKGaa16a9ne7Kp0/9rxaFV7F24l79RArtITiL7ehUjeB/rmIvtGQs3mwu0J
         uQvwdSpQscAxloq5dky9QsbavHW/mkxeVDzem5af/ZTihS89ZSq7JXV/sKsdpds6IyZ+
         KdGLPogacrUSzlJ5rlLk9ZDwcnS7h8gNeHTksOFQ2Bfqn9Jk46D2+GC+EGWo6pwEhQxJ
         +uHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035717; x=1784640517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ue6jFvPPvjqPgIpHsXNu6T7RM+b3RNh8Y6zW7p+85hQ=;
        b=HAMoLggNikNfjMaUSjRVs0LKsdZLYv3PPjXr/y1n/bgfeuEWuMbtBEeSeu3Mo4dpnb
         xBWJuI9zz+8g/MpuGUW6WoFposV5HBQV4iEtgMSAkhvsuNGWlsSPZJ+Fq4weUHTdF1ht
         XldyK/rSwsiVV3E4u9TlNCjlt3Ou2fkoLA8RZMEXYqBzcpAXQghG1Qs88zaAroZ2yqX1
         KfYl0+I7ARIkLrHU0obMlW/vLijtNhknmn+ZjZif4tfwcvWHHaYWf5/HzYpfEvh+Ad63
         +uKJ5fbN33gdlEzUd3aolfkrLr4UALNV4xPZv1zsgyrd7pe6vjxEn/lPRxc7yPMrnTkh
         cEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035717; x=1784640517;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ue6jFvPPvjqPgIpHsXNu6T7RM+b3RNh8Y6zW7p+85hQ=;
        b=eTN5jgEYdfS24uh25xOHoCVuTIA2gsChXpYgjLaOaHW824I2/wT2Eh1fxlW6JtPYQR
         VXuatmVMEMV407UmT8YHqPoAFcl8WRLHNavzCIBa+SMer6rUMctGxv57/5jjV3nY0/FJ
         LculQEnc/qZOpIZ4/4butQtmil8+hSMrSGdf5m/cKuvExPl1g9pmSTbZmFOoPqNhLxkW
         yep5iCQ4F/eaTlf7eFuxIK47EXAvisw97BYahwvBmrapZqaTp1XMOWinu++19bRjDYQc
         YbS3xgJzMV+OGSIgq/0IOQwyklIPc1ZSfRT+v9ip91KbG9trVGAWIn4qR2lpug+PKkvU
         jd4A==
X-Forwarded-Encrypted: i=1; AHgh+RrnrMHlW0tdkvwHGy82kl0MBAR7s40IQ9mOksObi9peTIcUmbN0+o6dOTg8JwbR1bDq5igLmrTZA4g8@vger.kernel.org
X-Gm-Message-State: AOJu0YziZPR4UHsd6XcGhf5HiNCO1BqJ2Sevt5HMaaJAqXq2OY4zorn7
	EOrou26EGpNp6j4FxBU0Y7fB8YVWbzmXyGahtKjz/x6W/mN9OOtoFvH3LSGrUz7Mgh9qP947Ycm
	8L7umq06b+mMa0OTWrAseiUW8KY+zFkY=
X-Gm-Gg: AfdE7ckba+5UkeWk12e/lRgvrGn3h356jsoTCfezTsikKhZ44ShmQXj5v+rHzodW4pq
	9eyr9Rl2np1fIJrhhykbEkq0qsjG5l2qcbV2ifaGgZs10CeTx/HaVGjuP4TlW3wup9Tvs/K5+ew
	C/uc8SKOHtIPoqb25gsAnHG8pmo11oqx6EU+Fb9qYMEb3abL9DWxUOp+rKo43WkwU+UdMTcHQzC
	7teKR0i0sy2mjeFXB4Nn/vyufK3Euy7mPz+vaSoqmN9T5k1K8UzQn6MUx7FbPy7MC3YLa6M7fPX
	Isp7lBhf7BuAg1z4U4Cimsu/yFo6rQ==
X-Received: by 2002:a05:6a21:7486:b0:3b4:b6d7:a992 with SMTP id
 adf61e73a8af0-3c11062f70cmr15032381637.8.1784035717203; Tue, 14 Jul 2026
 06:28:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-5-clamor95@gmail.com>
 <akeF_VrijPbebz3I@hovoldconsulting.com>
In-Reply-To: <akeF_VrijPbebz3I@hovoldconsulting.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 14 Jul 2026 16:28:24 +0300
X-Gm-Features: AUfX_mzREZozvqJIpCZw-bv1kiFlmVezGQdepbPdfuQMwUIt-LOogON_yq372Iw
Message-ID: <CAPVz0n1+wrq+g3p3UTc3hzHcsz8k02=QsvmseBD45d+SoSFsBw@mail.gmail.com>
Subject: Re: [PATCH v5 04/14] mfd: lm3533: Pass only regmap and light sensor
 presence to child devices
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 3 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:50 Johan=
 Hovold <johan@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 17, 2026 at 11:00:21AM +0300, Svyatoslav Ryhel wrote:
> > Instead of passing the entire lm3533 core data structure, only pass the
> > regmap and the light sensor presence flag to child devices.
>
> Again, why?
>

Because none of the child cells needs entire parents private
structure, regmap is all that is used.

> Johan
