Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD50B3A1B5
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 23:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787183207; cv=none; b=JuTxqkecDjvTVUmzECyJqXRDrvW/ur5ig1/jMHDfIQsZassR7pFGwp9g99csCs31wHfmjH8fkKldMkEerB66lmxfG7p5x1fbam9jshY5nGzW7dZbns4JLAz+gYfrykOK1GAuLZqOs9/Shx065fV0VzFGtsQ9/pMrXIgT/WfIsA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787183207; c=relaxed/simple;
	bh=bk8X/C1AqkDTikcqiW7Hg2XdCI/waiwQ0VemNKokSJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uy6kBgVbHVBtJjuDhzH99eVksa5A3gbEpTZ9cAQLJGwdrCoswLBMevUOyjNLt6JyiavuK/tyHPjllr3bBvTsmjs42BAYs9rQCFAVhvS+RWYmkyaiKOrC84XNcg0M8wKgX2arelSCAxLqiXtFNB54yFjFNvSlNz+as33GN0aPNjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YIBXCDt1; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YIBXCDt1"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9061a795d76so19535506d6.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787183205; x=1787788005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bk8X/C1AqkDTikcqiW7Hg2XdCI/waiwQ0VemNKokSJg=;
        b=YIBXCDt1vQJX4yz/4j2KCTL5vPGF8lFFlCeefbJ4faq3xgDcN2B6oNW16jeGopz947
         E2x5WHQ5/yA6Fht76+m0nXTj1CHbOFnhcfPvG6mmG3kPPmbxwghvAwqM5NZohZBz0odn
         VPqLLl+vhYTSigir1S7zZiRLzFyk3UuHQ+z4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787183205; x=1787788005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bk8X/C1AqkDTikcqiW7Hg2XdCI/waiwQ0VemNKokSJg=;
        b=ap7c87zZtrRdQD99U02mAOnHSQ99d2pbT1Jidqdu4uhy1HRmj7Hqlp1EN8aTBlyiOx
         OJmsz0Gwd5k99aq40wjZ6/ZRHz7KnY7o2v0dLAzCpgw1vsqGbvl2pifeXK7J35RfNyjz
         5qFRpshnf4fvZemg58kzzHzaz1ck/onQWIcJ0BJnyTaDCemtWnfExC4psb6wNuqyYfuX
         Mx7W3Z3qV2oYUN60zUpfw7eNNpXnTME25MKCTAp9nwNdmDcF/C+zUQhHZfH927S92Bz8
         L1KTgX5J0VMi0nP3FuQDWYNTLFdKi27pUOmhUGuXRwOE0vpWRlJ5OgoSg4oD/EnqcVbb
         gsdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrj9zJPPT6m/nMF1+c86Q4eACeYz+Ttzjk/q5ek9whxfRGLx8JUrpeIvogZTeZ8nS4/FjsSmT9Camsn@vger.kernel.org
X-Gm-Message-State: AFuF++lrWD0r9k7GLswJDDH+D5QnM7bFZ5mtjJG+GCG4ebweIdMKeCAk
	Qhyb4cDywPKbcEpsZvonlD4qlMsL31u/k2UXONxSS5Lbcd1GjgQg6M4CHOB0b7ZmLz3+DkWMVSh
	y9JA=
X-Gm-Gg: AR+sD13iPNZrKLseWsUcof5PCv7Q5mzYt44B4aVCeEJl1sp2GGYkFABle5YcqNNAAVk
	SbnPm6U3O0TacX4A34Uujr4YbiZByOsLuJeR+SIBxTH3oYQwh094eMNSkoOkkVXE2z7Hjsb/GdN
	INdOdp6YySCYz01iFeuXuAVIMkMyUg7K8K6X/ug+6hpyIZyP+fjN0R86gxfhbdLAI5QpCHdb51M
	VoXuHtbTidp5zIeDA6+kbE4lu3xYPET70KK4JGgIzQs/93r/rqcQ4Kkg0+7Y+DFenRtfiVDLJeS
	1wYr4aOJcCd7JnRFNkkd5Y2I3GxmkqVyoK+cG05ycqNjN6yvBVDO/gGuOOouvclLZ3mHe+VZRbZ
	ugNG4+JXGuac7qB46mHnwZ/KuJDCUGMTX/ZiwQGgTE+xt2iOGvvdwvjdcpkbwri8BRoZtsLpRBa
	kYJ9tNEqUjYCEy7X7jsctrBoP9SHnr/302i5dB4inXtECikF6w3PzSzL+8weGMFhGNVWgZcjl5/
	UgIDdn9CmPqCHiX6y4VQrUZznV7TUk=
X-Received: by 2002:a05:6214:4b08:b0:8ec:a010:9af5 with SMTP id 6a1803df08f44-90c5e967c63mr95254066d6.10.1787183204800;
        Wed, 19 Aug 2026 16:46:44 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2905d6sm25451996d6.29.2026.08.19.16.46.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 16:46:43 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52b3934af3fso14304281cf.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 16:46:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq8o6Qifok/pHMNs/n+pv4i0Vuh1+pdXscrZM1eeb8a96sM77dEpzEpR06sCM2I4K7/Wy+v8eJsjfbJ@vger.kernel.org
X-Received: by 2002:a05:6102:15ab:b0:777:4e3a:8dde with SMTP id
 ada2fe7eead31-777fab9d4a7mr3615810137.11.1787182853246; Wed, 19 Aug 2026
 16:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
 <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
 <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com> <CAD++jL=VLzW-4eB=izJwaTJ+6xObk9+AQGTDK6ABdrGX4K3vAg@mail.gmail.com>
In-Reply-To: <CAD++jL=VLzW-4eB=izJwaTJ+6xObk9+AQGTDK6ABdrGX4K3vAg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2026 16:40:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VsiQfoGYHw3D2xmV=Jedu+cmqEfrCk0mkKFzsrRCQcTg@mail.gmail.com>
X-Gm-Features: AcwNN1UHCTu0dpSrOeIjoA8l2gjjfO6Nzx_OO7IAuQCNztYoKMKLEde815SfxYY
Message-ID: <CAD=FV=VsiQfoGYHw3D2xmV=Jedu+cmqEfrCk0mkKFzsrRCQcTg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 19, 2026 at 4:29=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Wed, Aug 19, 2026 at 7:03=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
>
> > I appreciate your suggestion of having a separate node for calibration
> > storage. This feels more awkward to me than just giving up and having
> > the bootloader hardcode all known device-tree paths that the UFS node
> > might be found at. That being said, if everyone says that this would
> > be a great solution, I could try prototyping it. The trick would now
> > be that the Linux UFS driver would need to be able to find this
> > calibration data, so the Linux UFS driver would either need to be able
> > to find it at a specific hardcoded device tree path or the Linux UFS
> > driver would need to search the device tree for a specific
> > ufs-calibration compatible string.
>
> Can't you just put the calibration data as a custom property inside
> the UFS DT node? Just a long byte array or whatever it is.
> The driver would certainly know where to find it that way.
> I don't know who or how it has to be put there during manufacturing
> or inserted by the boot loader into the node from wherever
> manufacturing stores it though. (Assuming it's some calibration
> added at manufacturing, I don't exactly know what it is...)
> If the actual storage place is in something the OS can read
> then we could probably use the nvmem to fetch it live?
>
> The calibration business and what it is and where it is stored
> evades me a bit...

The problem we're facing is _finding_ the UFS node in the bootloader.

The device tree for the board is stored / maintained outside of the
bootloader codebase. It is compiled and stored on the device. The
bootloader runs, locates the device tree and then wants to make
changes to it.

The bootloader needs to _find_ the UFS node in the device tree in
order to make changes to it.

The question is: how does the bootloader find the UFS node?

* Does it hardcode the DT path to the UFS node?

* Does it use an "alias" to find the path to the UFS node?

* Does it search the whole device tree for a certain "compatible"
string and use that to locate the node?

Hardcoding the path is the easiest thing to do here, but then the
bootloader will break if the UFS node ever changes. We also know that
this path will differ for every SoC and is currently different between
the downstream device trees and the upstream ones (because downstream
device trees don't have a "soc@0" node). I've also been told that
device tree paths are not ABI, so hardcoding paths in the bootloader
seems less ideal.

We could just hardcode the path in the bootloader. If this
conversation goes nowhere I'll just change it to do that. If paths
ever break, then I guess we'll just have to get yelled at when folks
say "Why in the world would you hardcode DT paths in the bootloader?
That's not ABI!"

-Doug
