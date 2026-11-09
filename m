Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794192268;
	b=SJHSe1auPvGpfH5Js5Gh5DY43wBkDESN52IBCWxvCO9YUZdN7DEdzdPjV4EOW+4ta7k8
	 Np2bPQ4cIM5vgAgQpKpLWlAtceFQNhc4f2Ka8ZxPFF8GK3jKsR4W2xIBchJuPlX1mqGVq
	 yf+/hBHUYcwbzzOO6IKqRWuP6merPko/YrCNq/rpgN6apm0dteO0SKjtlajrOUehyQBIq
	 y6Z8ttUwWqMvl6EXd5XWbe9248mBgrdcs7yx0wRB3itawJ9h1kSCwiT8M43wdJA0tyOrl
	 3DD7DmTka7AQPsohkJP0Sgt2aJUPAxQwtXBL6XEESEo0Nu0qefcKA5FvuWOZ3B6U72A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lizOVy5JA8TKh5Yky6TmOsMP24uJtn6vdJB5vxQOYHE=;
	b=ShOTbB+QD+6suhWsFuBsoBfv/EqtxugEuBI9yCJkCQddDQXanuP+S4ksRkjEHKBuqNNw
	 YZVymcKxAnN4Jt25Jmh+g9pQTfaIUgGxp6yEpQ0LDVUeu6IpZOj2JPtL8EadAeTbRkB8b
	 lL0D3MvJHgmViMsfV5L4/hxi3vcrvtJPNnTkEcmBamITOaDGtbdtbhYDNZK7IxX05e3ci
	 Dg9dcTB92gjCCtt/+GMmRPz0yFOwaxQ4PjXuS5O1YcA9rmYhLl1LMgcXI9fdEFL17642c
	 98cuqCf94FTOKbWQO0xi0YW6E2JylPhmL7CNUS7Fecx58XdXzyT9k9ST/Ud+S6dtSHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+kwyYZE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA58D606A320
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 02:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA58D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+kwyYZE
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so812594c88.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 18:44:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794192267; cv=none;
        d=google.com; s=arc-20260327;
        b=khLvREn/pY0jofkL3vfheY5YU+zf0E6jTycxWuIgpUW2q4WS3GvRRTFIe+XhOPVpuC
         O3moWBiw8lm0dyQKEZt3rj6AycxLhrXngzbjSz1124+U2Jo9vvnTmWHT1BZpmMGIt69C
         1YNJuEn0DwpYMKS3Etp/8611aBqbffKOvQkpNXVESccnU0h9NCW2vtviuoX/eeTbejkr
         ptnaRVyf9F5TEaa7uV9y5kiO9POF3je3uVc6os5u0CVKpMvmEw4Cnj7yBEIKfZKsMA1k
         Y3b3w9mtpvu2yFhArBzpJOsoftVJKP8XPztXrdPdCJ2jhi+y0ho/6csaE66ILc6ZkU/i
         G13w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lizOVy5JA8TKh5Yky6TmOsMP24uJtn6vdJB5vxQOYHE=;
        fh=NzrKqeeKEuwdViY7XgnvOJr5PSqJ3DQAVt1ZwQKylDI=;
        b=LSDFHczYpQGi11557Ga6v0mImoEGT5uFHRsGnm8/gJVz97j8u2kHWlaNA07d+TqqZP
         qT9tBlYkvyM4eM8SuToNvgWnlwNMknxRvX7uzqKp+YzO/4TvMz4UJXssrjMPSYlSjGwq
         q61IkUtWVqg4ltPcuDJyVm0Io8P1IeShzHrkd3l55ciK268Qu1Ju9kbmdMrZnZ4UoYGo
         0tWhhT0CqQiVHm+XJ3SzKmWRie20CCAItzv1W1+1qcR92Q/UGEM1SKvunsml3rBOAyDP
         D5kivS/x32wxNplWYkeHbOpLO9GV/9QWvAo2+QJMRyrIasHxatbBZZO+AO6fRbYKuroO
         aTng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794192267; x=1794797067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lizOVy5JA8TKh5Yky6TmOsMP24uJtn6vdJB5vxQOYHE=;
        b=H+kwyYZEDd0R4A0FTkVD3QYfw31uPv8dnVBZ+nh7D3zue5lQXWlApwrN2t+qKvMO5X
         fosgAAv/Ifq3+tVChuvpbuxpExpKsio1+YJch0/8Z04kTStr1ucu4edsg9igk5Dn457P
         7empY6zGNQ92virgcqoWC7E30OTFchyuOBibYsJjx+oYXRRCP+9tKQyyFqdxCWicxT8H
         rPocIhDVNE2NPXXgM7mjHyytT9R0+bs/xEulfCq5iA19tOwiwOVtTElJbNUoHlgf3fy/
         rtbvX8kbhobLvbBzEFhBY+Eomy6OI2ZFLIfJl95SXChKq0pPhutZE/WaoHTKW0CHj+7X
         MqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794192267; x=1794797067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lizOVy5JA8TKh5Yky6TmOsMP24uJtn6vdJB5vxQOYHE=;
        b=waRDOfDTNy4KGHYCWRI6tAjgWtSieT/TFlFP/eZYKnJxr6b0UoZ9Yw+h9ZyGrU43Lc
         /iUFxQ3lJF6ax70CX4QIRCQAE58pi3mknAOFjiwl97/Gm/jW5MQwAWrgrYuvATAAChIL
         QFmhPkiI+8fXEXL4PGNC/HvB9pyOGkTTGWqwGHGvJT5oGLIArWqcHAJaGZAtllLxEm1s
         CmRegPMeI4AkUpuXBrGQGxKZCAUCetXdt3HuHUxmnlfkYBfhzZZszItRDEplewpzeLyx
         lym/Xdyb9H3fLuWvjVhKF99FX6KQfBtmJKrGOMYeRi3dpFJTWkeCpKDvVxDfBKy7TItr
         aaog==
X-Forwarded-Encrypted: i=1; AL+hErFAXtzjn4eG+2J2OGHW26hk6OQ5NaII+ca+a2u7tK3E354Bsi11Hr8Sz3fgXEWUcfl5bEmM3Sm5X2Ce@vger.kernel.org
X-Gm-Message-State: APuU4Z/y5Q6YnPrlVyuUDFBoEfOUQlbRalDGLRdl+k0v1lk9zktQYNTl
	0/Ppv4CeK7osTUA61AhoZzU2LRzBkzylORjApq/OQn1k4beZDRjyk9RKlWQr7MG7J89k/SfPcO7
	1v/8Y+vtk0TrpzhDAuPmkzbRmnbD0pPs=
X-Gm-Gg: AYBFou22Nsh2ZtLYHWEcpCcWI0Jbzz1CCLFbnWnOLORqV1dlJnkeDuKI2UqQz3ElGfV
	2kWxu+XsFSBIxGdPtmn2Ls+1IU1rbZXWxD9VnJbWmfu4awU7jzKrFNw9vv22/dO0fUWoulkoZZa
	ZXM1FIqlU05noK80JoQu2yc1e229hjwTJnmU6QHhJLNJmGPBv1GLJWHuK7V0joG3MmdZlqtLr6b
	Q68qgn8tHFQj73IM1JaGnR6e+NyUH/hn+63apornaPOl8rsg0PaNVzpOY2nUW0x+y6M9HtDXiiK
	B6wHDdVEA5uo5yTVeDGxDkQWL2aptzKt0X91dw8kd9+3KD08nFuMyEMrrhpG1gFxmBCHuYNT0hh
	Kwl+cs3GUuk60dvPIQQ/BHGaflxZvM/dgZunByLI=
X-Received: by 2002:a05:701b:2616:b0:1b2:558a:d781 with SMTP id
 a92af1059eb24-1b39fe291d2mr3839870c88.5.1794192266580; Sun, 08 Nov 2026
 18:44:26 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
 <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com> <20261106212939.GA1814035-robh@kernel.org>
In-Reply-To: <20261106212939.GA1814035-robh@kernel.org>
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Mon, 9 Nov 2026 09:44:14 +0700
X-Gm-Features: AclHuK-MtGA26JxVmDU8vwHD7H1Dr6pcTzIJGZiqmr_2gGFPDRoc8BRW2dGJq-o
Message-ID: <CAAq9HC7Fk-duB0LKaDDKeEmLYvZuvWTBab-YpjS9x9QHm0z+7Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Val Packett <val@packett.cool>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

The failure isn't fatal on MSM8917/MSM8937, so a runtime fallback
would work there. My concern is other platforms. Today, a rejected
PSCI_SET_SUSPEND_MODE makes the driver stop, which is the safe
outcome when firmware misbehaves in a way we can't diagnose (PSCI
has no call to read back the current mode, so we can't tell what
state it's in).

A generic "try, and avoid on failure" would turn that into
"continue", for every platform, including ones we haven't verified,
unexpected things could happen after that. The property lets a
platform that is known to be safe opt in explicitly.

Best regards,
Reza

On Sat, Nov 7, 2026 at 4:29=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Oct 22, 2026 at 09:41:10AM +0000, Reza Kurniawan wrote:
> > From: Alejandro Tafalla <atafalla@dnyon.com>
> >
> > On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
> > that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> > call is rejected with NOT_SUPPORTED.
>
> Is that call fatal? Why can't you just try the call and if it fails,
> avoid it. Then you don't require a DTB change to fix the issue.
>
> Rob
