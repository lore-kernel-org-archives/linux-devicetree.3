Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BD04CC610
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769536; cv=pass; b=jv7uM3grwuMxygWGF5s1ViSsisVVomnzClbYYoJwYojw08JCtehmTo1FAiNL3GjmIgO7B5KEHL1UQT4ZwjTHZ+pkOHPRT4iy0RtUeI2dr8uBEHhWFOy6001dLbdkKRGbg75BenheZXlnATbEohxEoHF17wTvP7QVCUP2jEOr6Hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769536; c=relaxed/simple;
	bh=gDDF0XFUuoqlHKuciYsAXxZPSv08MbbVx/bzfReSE8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYC0kPOVLx6wJ7zyVuUnP8ssOyhPLCyGF+yr5o2fUWkePBCr0/lxv2bdFEyEfQ5MaAwsemdJe5L1x2uwyn2+ugXHQInZmsgcJMcqc2AmU0nsXXst7NKCR56Y3R+W/8MN/6OMr1YdHkpLotiz844unbTqWZTCqAvW9NJQYO7tZ3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=I6Ou7jtF; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="I6Ou7jtF"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af7721e4aso773378966b.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 04:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790769533; cv=none;
        d=google.com; s=arc-20260327;
        b=crR+L0bucgD2GDYSD21WBqxkcC4u4ID9TIow7S5uaHgCfr+drcrwLgeKwopmOkUGX/
         OCkTupNT+ieAFbcPgL3XSC+dFTtiJGaR+wVVrxB1AaJ9rCAehbbShOFLj5OYYLXTAZ9U
         BWFtB7d59VLRIlgUmKgKa2jmAdRKQipa6N/dS3H1wDYUtnQSxl03/vVzq3vGuXQqKpje
         FlglYRbbvizH1KUnYVbHKO1iMKzZ8kjI6kZdlZBszrFsZjYQSDKuRMDTG0o0uc3iyO7C
         yeOlTnNyH6NqH6fQckGhuPpqxugtbalc9HkLdnXPyB1Hg2bBqH1qjiabf+AQaLGSflj6
         yErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6F2ERHZWXw7WA/3EGNJE+vEhgczaBRrblyhbjUi05hs=;
        fh=/J7/pBOvjLsSOY71UvkWbGq3JN5sS/IHm54t2ffqdsY=;
        b=OfTDiXlZVyQBCCDuMgcSWUnbQWQ+i1XDGddCPa7+BaHKFiExDq+Sfaon34ztSACh2H
         64BPzKVNKksFgi0/a1neZVMB3rBpXzB7Z6h1LT1GearXuiRghA30Eqvo+pLOoX2uSWwd
         GvaJBvgRgz01WaNbw2Av3tvtRRyzXuZz90kB8hKVgMfwTjvuSlQTVmFp84t19ZGM1EkD
         u5DQlxdU1Jo8MBGhH1sPFgZwAPE0SyzGZtPFME5fQsascHqCZW+iNa6VSIJMVp/j3MBS
         XppDmwOPCZD3uUQQB6NaZsHugx8DG0b1aOxTJwf7RB/y44tc+9bzRzzsfHi34HCdiGNC
         /lnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790769533; x=1791374333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6F2ERHZWXw7WA/3EGNJE+vEhgczaBRrblyhbjUi05hs=;
        b=I6Ou7jtF3DP4pS402dtNK+2SD6R1BKdYTVSruchFRPXUmAcszzgBp5ws7sA+bY3Zzo
         nKvRl21mTNINsLGVIp17z3PI8aM5mAH4YxlLp2ka9hfRGBqUSDSY347ekDkZNSJ8MMvf
         /+Av059YD6q/04oJaoZ+S01ZjXstAXYxZa/mFrIVnj1C9vxr5jqiZWtFvojuhw8xYIjz
         YcITNQdgSBAheMj+JOR5faow7VYFQGFVDIXFdN45CsI5Y++j0H6eAbkLWzodIwwwCQ37
         e43rJVJEz4BMwQlWb7OfqQr5uQjTa8YpSdndIJAjdCGwkG0kdNk5F+6fhrApZCVr6ooG
         upVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769533; x=1791374333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6F2ERHZWXw7WA/3EGNJE+vEhgczaBRrblyhbjUi05hs=;
        b=NsBV50mnNWlJhkYV1CK7/vm53WW87uRUyX75orRjDJGf0FipDGOBoFpCBYBGke+i09
         vT3qi1631QyEibA9eMJ4JXlcONaFdPq2J0f+OsBe54LFtRYvFMmPHvZ2+PwZ8FCQ04dk
         ppRqkB5YFTvWNY0Eo+xl+gIxWrzQMtT8qn5f/euw4OGTuDmn/eqNksULQHZsyyQGV0a6
         D1tQF6Bvg5dmCexxsk+qX0A71Y4ZafJ6B7vejwdeaKI25GxLmKJdqHSBIGf4O9iUzXz3
         9QugV0pIaHhBDJXzbprLcY1efJ/8meewE550K43AfGVW8tJRKBRtMVU45pFPOnQcfAvJ
         JgIA==
X-Forwarded-Encrypted: i=1; AKwUvBzzJ9uRI5TNIEoNz0LbQgTzc8Biq12Ctehy4SsfuLLxZey+NbwwOZHjUMcvII/u1bAwN157oV+RdWg6@vger.kernel.org
X-Gm-Message-State: AFuF++kfkGgGSWAyk1oKd8MAMN+f5xRgnKFlr1ZLnV2z3hdwpdlICIuO
	eQCzGdvwM1X7CwsRTkqQG9Crl5RRfVLzfTbOYk3GNTqIqRkX36fo6Fc5dtA/BsJh1C5F20zD6O2
	sgcuoxnf7QvtxNSjKQQhpgSWHVf4TYdAic7nGdT0BIQ==
X-Gm-Gg: AYBFou3CENzXDwad88SfFK0xz56ditioCgshY4sXVvTckrn82pdiYfG3DS37gAkw9Ov
	1e8H8yxKbG+DE/AEHA3flRjEaeOzqnS2UuyHIJa/pT221pNsXHF+rpP1isI60YCW57HF3FpBMzn
	inasirDR3U9r/Nu5JOLeQgV+Ff4lrrTr6ZQhZwcHRaszIDz0Oam931KtULxUQfKtUpnEjstR3n3
	3a/S1rxV/VDKB93SPZSBrvE4mzbbGgBTZxXZva1hwC3ACNXZSWUDXj4wrtkKwZFG4hb/TWVjC00
	wIoKq2SI6+8K8tKG+fqxvZAFtPMtc+vk6KNdHyRCza3Cb7P3Pp3MDEWvs3L+us7X0JaWDYtt7j7
	WHfHLH5qYuN57iw==
X-Received: by 2002:a17:907:9708:b0:c26:19de:913a with SMTP id
 a640c23a62f3a-c2e23e58df9mr108073466b.45.1790769533085; Wed, 30 Sep 2026
 04:58:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
 <20260929-b4-rk3576-reboot-mode-v2-2-5a34ca72065a@flipper.net>
 <20260930-fascinating-cheetah-of-speed-7cccd0@quoll> <eb2d513b-3c7b-4298-932f-8e7cc8d9c08b@kernel.org>
In-Reply-To: <eb2d513b-3c7b-4298-932f-8e7cc8d9c08b@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 30 Sep 2026 15:58:45 +0400
X-Gm-Features: AclHuK9WjZS6N6YQrXd5XAL-P_3Z00CVqfe-4TuT9v8_bFTVQ6par63t-_u8TFM
Message-ID: <CAKTNdwHy41vh_Hp1zOnOtK-v7LvpvH0tgjP0MrMXdtZUqwubnQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: power: reset: syscon-reboot-mode:
 allow supplies
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Shawn Lin <shawn.lin@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 3:50=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 30/09/2026 13:47, Krzysztof Kozlowski wrote:
> > On Tue, Sep 29, 2026 at 02:28:19PM +0400, Alexey Charkov wrote:
> >> Whatever program that acts on a reboot mode runs before a full OS, so =
it
> >> may lack the capability to enable the regulators it depends on, and a
> >> reset that preserves the mode register generally leaves the regulators=
 as
> >> the previously running system left them.
> >>
> >> Allow a reboot mode node to name such supplies, so that they can be
> >> turned on while the mode is being requested.
> >>
> >> Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
> >
> > Again fake tag.
> >
> >> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> >> ---
> >>  .../devicetree/bindings/power/reset/syscon-reboot-mode.yaml       | 8=
 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/power/reset/syscon-rebo=
ot-mode.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot-=
mode.yaml
> >> index 79ffc78b23ea..5ed70c87269e 100644
> >> --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode=
.yaml
> >> +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode=
.yaml
> >> @@ -36,6 +36,14 @@ patternProperties:
> >>    "^mode-.*$":
> >>      maxItems: 1
> >>
> >> +  "^[a-z0-9]+(-[a-z0-9]+)*-supply$":
> >> +    description:
> >> +      Supply that has to be powered for whatever program acts on the =
mode.
> >> +      That could be a boot ROM with no access to regulators, and a wa=
rm reset
> >> +      leaves them as the previously running system left them and not =
necessarily
> >> +      what their expected out-of-reboot state is. Any supply describe=
d here is
> >> +      enabled when a mode is requested, and stays enabled.
> >
> > This looks like workaround for missing supply handling in actual
> > consumers. Fix your devices instead.
>
> Heh, I misread - you need to power this on? Then how does your board
> powers itself in the first place? And how do you even solve the
> incorrect - e.g. too low - voltage on these regulators?

When the PMIC comes out of a cold reset it has all the needed rails
enabled by its power-on default state, which the DDR trainer relies
on. But the OS will normally disable the rails it knows it doesn't use
itself, so a _warm_ reset which keeps the boot mode argument live and
keeps the PMIC running would leave those rails disabled, unless the OS
put them back as it found them.

So to make warm resets work one would have to either ignore unused
regulators in the OS to keep it from powering them down (ugly), or
mark them "always-on" in DT (also ugly), or state that they are needed
for the reboot mode feature, as done here (which is least ugly IMO).

The DDR trainer unfortunately cannot access the PMIC at all, so it
won't be able to enable the supplies it needs.

Best regards,
Alexey
