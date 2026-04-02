Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9FE30F545
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 01:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775094858; cv=pass; b=hUThBQC8em4DiLPmfTpWsN5VBdGSSZv6v5/AECaoUCkqw5xj6Jra5JPeMGI7uZQoipj1FSsC9F8Y7qrkLGzJF1mK0wOc5kwfIso3uMj67knNV1a2L3zTfN2O25yfOSLq69+t9Aes0ymRpRsyqG6zUOJgrRhpuWrPBGMlSJ4lb4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775094858; c=relaxed/simple;
	bh=ZgdAy4qNSHyKJtotTutzlKM7jv1dqpgGb4Vak3LPpxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTnfwG9cOA8G//WTZlu/CS95r9uQedOFNE/G6/hL2rghugvS3K4cZHOH4bP/DkdKFtBA0WVLiVAWk34TefUnrvnqFA6SKYjHgCiow1Jcudr0kD+Gsi7IhmK9+p6PrQVRdppp3+SicHrgXJmlmQZ+h1daCrHhk9rZRUmg3p6HbvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ww7PwDxv; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ww7PwDxv"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6501725d888so328886d50.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 18:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775094855; cv=none;
        d=google.com; s=arc-20240605;
        b=lL1Hb6rFdVgEpJYxPlCjU/ze8JJXBe9J4FD9s00NWss5T/JvQXoxtscgQOaI2jZBRA
         wNGoUzEtIyhthmAP2U9Tv/eGLPG0q3LZWBtHacDiv1sp0VHItLrHXregsDB3gKsLQpH6
         OedBRcVWPHg6vF3RKMzFLByvKvnjJ9VR3EYfWjvRZOS473ChKn6hia251YTtVbBARAeM
         Di+zHJVIfVnO6iNpchFgZMAmDbjk5Px6ZlhXc79f3zCINjdxzFJyU976VEgsE7AtShsO
         EMfx4mjzS44vKJ4d6WcLydBnanX9nNuxg/JanRqeuEPfIxw7o+BK0YyvmeVQGh6cOPEa
         2M4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kiceuLyx91rPyzndVsPjUqGeAIHXDkrelSUnbkKBTJU=;
        fh=07WrvDMeYmcFZSDO7mdv1zcQaTwLDBdOwO0ZJ9YkWTo=;
        b=IzNIT7fpD6Dyc1/s65rumCOWSyXgGsSQ6t7r34yms9J9WgVeHCiMY4YVtfhUmR5FsP
         5vamVVvVW3h9qJ3oYCec5HWfKRpu7XS19VJagb7+pxdNw5E5Z1pH8InT3VXKJsNCX92E
         Z4hOhjCdAm6opQpjFVZwf7wm0qaoRyhCKhAyNt+TAaVoJPj8LoM0irZVpa1A34SeN/XR
         hssGqQp7iBw0eG9Z1pMp5jwgSdQU5qJ+MbbhSnRJPCI5RxFRzpZNCHZBSwdIoBSBxLN1
         Bh6YCf+Z8E0wKbCA8P/nlI3/yjM6XjPxi/QE4iLg3DyZ/UOA+EPuqbNsTloqJl9mPuLO
         rEnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775094855; x=1775699655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiceuLyx91rPyzndVsPjUqGeAIHXDkrelSUnbkKBTJU=;
        b=Ww7PwDxv5MVp3tsNlTeE3CT0Oz5MhiebXjUc4q6rFMf/GmFYPBDczuil0bH3TBySVW
         cQ7fkOrw3Fs2HWzDJLfsnjY/hZHPdGI6yfTW7uszLmZv0eLNZdu2a/xGZzT5b/Uebxp/
         Dl/sKqbTT84G8zvSDyy7UpAWWhRqTBa6rXzvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775094855; x=1775699655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kiceuLyx91rPyzndVsPjUqGeAIHXDkrelSUnbkKBTJU=;
        b=UtVZW1YQ6fy/2W5dxKe59vLKmIvRye6RQ03pEms5n3s6l2RFWAZpy/aNKpnJXJ8q8/
         pydU6yz7s/eCiokrvz2ZtHu0t8CFn0uqZC5sNh4kHZfM57i0pk0S/Zyr9S2uJfH8asvp
         ib92ONg6LW+Wiyr18QYiU/hNW5EvYbqyV6a7qgg3MZ6iNZ9YZ2MlEa8ki7SsygORKscv
         lFl9+i/v4HZ8YhldEo59dorujgVrMxrL6MYW5mNToEJOBqrv+8VKxIABzRECQiCCLxo1
         7LSrhQQsHG1rVw6UsIJiniXfrYsRUm2mi/ZOIVu3BYmtbji/gURxPz6Vov4Nl3K5Rz6j
         SMMw==
X-Forwarded-Encrypted: i=1; AJvYcCX1GWPm2dIVXcyLQFpODo9iYuh9zKG0/RnDpbSlCJos91jp6qf8U6eD/X42/cLr01Mzrb3MVnW3Bo+1@vger.kernel.org
X-Gm-Message-State: AOJu0YzxPfWgNFcC78ogXAU4aF48Pn0UaTld81i1NjjZsNQeAnxgp0j3
	xk+3FYA4nvkbxvfYLWr1+BJwRdLAxBRLvao0JwdjBpeLtqsbZgwfNu/5eP4ZbbGawWX7vSxQpgI
	X7HvqcUIdJMl6Zr92tQRVm+Gnfo2sZha55I1P8j64
X-Gm-Gg: AeBDievcbEvcVgD5oYTaEJoL09tbtIV5VGCmIj6x5hVhZYacV3aV1cenRIOpURneyUg
	gOjBVzU/QiiKMm1MXCVu5tzK8MFOs/a1XiYaPh4adDgTUHJSBON6nGvTnTZYNJN2X9lE/EWP6B+
	tLRQmLXAKF+fi4ij2yX30uzKwHNgB1Q4Y89oAssPYgX44+0hGwKx4c1aGWNbWMI+L+jOdjFn6zt
	CgpUxMrsi0HSNYdnnbG5wpSO/nFjrhBANBXVJuTi3Vvp79XrJ41uPEv9TkmJ/fnRTABcAFU0Y8p
	czxK6K5d3MNv6h2v3BfArktr+KGZ1C5V+sirtn0idQ==
X-Received: by 2002:a53:df45:0:b0:64e:abca:564a with SMTP id
 956f58d0204a3-6502fdd0ac9mr5063421d50.22.1775094855220; Wed, 01 Apr 2026
 18:54:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-send-upstream-v2-0-521ce8afff86@chromium.org> <20260325-naughty-hungry-wapiti-658e83@quoll>
In-Reply-To: <20260325-naughty-hungry-wapiti-658e83@quoll>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Wed, 1 Apr 2026 18:54:03 -0700
X-Gm-Features: AQROBzDfrwBIaLEV9wnEuLry8lUVCQVrP4uxpF2MQpcY1Q98CokyJ5Vf0yATg4k
Message-ID: <CAEe3GZFWiUG5ET2oQ42+KvO-TMy2Eq02tR0UMaTbACJ0=V8D0A@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Add spi-hid transport driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, tfiga@chromium.org, 
	Jarrett Schultz <jaschultz@microsoft.com>, Dmitry Antipov <dmanti@microsoft.com>, 
	Angela Czubak <acz@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 1:49=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Mar 24, 2026 at 06:39:33AM +0000, Jingyuan Liang wrote:
> > This series picks up the spi-hid driver work originally started by
> > Microsoft. The patch breakdown has been modified and the implementation
> > has been refactored to address upstream feedback and testing issues. We
> > are submitting this as a new series while keeping the original sign-off
> > chain to reflect the history.
> >
> > Same as the original series, there is a change to HID documentation, so=
me
> > HID core changes to support a SPI device, the SPI HID transport driver,
> > and HID over SPI Device Tree binding. We have added the HID over SPI AC=
PI
> > support, power management, panel follower, and quirks for Ilitek touch
> > controllers.
> >
> > Original authors: Jarrett Schultz <jaschultz@microsoft.com>,
> >                 Dmitry Antipov <dmanti@microsoft.com>
> > Link: https://lore.kernel.org/r/86b63b7b-afda-d7f4-7bfa-175085d5a8ef@gm=
ail.com
> >
> > Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
> > ---
> > Changes in v2:
> > - Fix style problems and remove unnecessary fields from the DT binding =
file
>
> Style and removal? So other comments were skipped?
>
> Please write detailed changelogs, otherwise it feels you just ignore
> parts of the feedback.
>
> Best regards,
> Krzysztof
>

Comments are either resolved or awaiting further confirmation. I will
add more details
to v2 changelog in v3.
