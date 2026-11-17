Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794896101;
	b=yUpPiUMPvCMmyb5EuKoBg92yovIG+lfTHIe8VXeozgTj1k5dcAkZDZtij3tdIppmpYQo
	 DtXpg36aHAsLSH5u1+vMQkwxB26sueaeJiZ3vCGRj0dxH12DDrKGgnfJeNJQ1yxbrRv3K
	 IkmgaDbRvFIDbYLG6u6KYMqjmglTQdHH6ql/iVE83L2pSkrgyqV1xt5b7jMBn8b/0xy+X
	 4O35VvsWD52gpvztpBfXHGeCjdoqJWwSfKd4CO+owDDgaDiD+xtR1TjBSSBCnwgCXt87h
	 oKvgCS96QLqtl+0uKN03oeHyGytuZHlbUbtvqbCe8g/RazxAYIAImVHJbAUz0NTXe4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2tlG1uGoZcjaYy1xmlXhRKnsoUqHxLQ1mQdDaLWoWxw=;
	b=jirS3amHTEcN0W5m9siH0NL9MQFWN+Wft+EgmFQ9pNyKVRqgIY0Mn+cZ/iGE3abdFb6N
	 PV/4/4vF93lH7/JqeJCksQkF0c0Cbz0VM6hbt3J7BFYDG2cYVeAvJ7JJSgmoiv1Q9HsEg
	 UJI1/ldOQlJYY/vbFWjbrrMq1pxA/Q7Hprl4lBbk8wV6QpXbKQEXiJP9/boLcQpqWVAO6
	 0vckbVlg+l5BWKciznFXXP879xBuwhTaQI8PW9uEZgLHkl51MhR1z/WIGPYxFYbCr45Ly
	 MfMpBvc53FNUABLQL/Uq/flXq8pjH1O1cEyEO2NLlJhquyzwwY0klSC16eJi0TVHcHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BG4FZG5e;
	arc=fail smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73885606A329
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 06:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73885606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BG4FZG5e
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-170135e43c7so6858331c88.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:15:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794896100; cv=none;
        d=google.com; s=arc-20260327;
        b=XuRmtASEaJ7ehA7TIyaQYBarAqovnX+dxivX1u+EDQPoXXHOdm+aj2XdGMlnK61PHQ
         IPEbI6V2gQoc5LARTqJCArfAOZAOE8aOI3u//OcFTlxXDsm+tOHT0Qtmt3QSBpaYdxXt
         upJL8fL9FHQqaT9OEzLaPVoqk2vA296uInOZJnrx6nC8seY/8RePZiCO/KBhcJm06JOG
         HN2OFRYyWIZFjOhpNmzb8GvRsPGBqOxl0KYClS4g/I2BFVm+Q9z93/eQ0qMn3kpuYMKU
         gVEfgRSSpnqlTpqXQfcmAVv4teRgVKYGoWHhfm86Ou+rh+g+ePCEY/NhrWzoU1c6Ztnx
         OoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2tlG1uGoZcjaYy1xmlXhRKnsoUqHxLQ1mQdDaLWoWxw=;
        fh=/cTXwoZc0q/6UDSOdYPVWXr0gxC/DfqC+k+2EkvXHH8=;
        b=J5Tbtsv/K5a7dePbIco6USzkkvNxOrb2r7sPC/Xg5kJCPZLqU/4I9RJJYx7/Jo65H5
         bDAYxcPDPXSBq9a1XgABH7AEEt9KxSBAvwLjsjNqRS67SLzyuftxyyAHXiriqwFgOdRx
         x7EOQ7aRgZBxHBbtuq8TruYs0IsaXz3t1efcoSsNTqttsWvmgYd471sbbYs9fMytrlL+
         LfEoFWpDPIPgJu56m7gOaaQUqnom5LR+5cdBQ55d2o/h73dieLkhrjhKOihyzmG9lf8Z
         Z/JeguFU9eiFYIp2bGNRe1HgBFeZSmlnNRu1ywmAcACdyWY39SeAbJfImonbrY9tTYUC
         5rlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794896100; x=1795500900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2tlG1uGoZcjaYy1xmlXhRKnsoUqHxLQ1mQdDaLWoWxw=;
        b=BG4FZG5ebLAflhDHW2u0yN8dm3eyrZXUYTLHo5JldGheWYi1fIsH2FaizeVmFA9kLI
         +RyhuNCMrzqWS7kJhDGPo4BxJFoKyvf2IYtNVsgl0LkC/dmaN8aKXN2eml8i0ij6E0qs
         BvT6Jk6X4MklIDZaKrqCiwvBjo61puWWfw2hdNfM48pEQ/LxtMvvxqI7j9nGjYxHmsE8
         UrnoDT3FJLhp7ZFdLeDNpw5eLbBmuR/zTY+xxKAAgxqoGkfGsb9IZgXJmtfSEGleFcRE
         ifTsOtpXm4n6cQW6dWpaKzDipKLQwPpnl/vqAnbpR0nin39ANrSZbIj8udtOVpcwRmkk
         KvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896100; x=1795500900;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2tlG1uGoZcjaYy1xmlXhRKnsoUqHxLQ1mQdDaLWoWxw=;
        b=wAA00eHiHw6v0gMnS86KyT3m0WK6qHdgcYus2gwznaS2vOoe4mrdV3YWdVx0Bly+JK
         Kq9/AMkP6yTripFZxDNysB9fqhuUHtZLRerVbJhBWnOzcwW6oIkoBjCtKz7zsFs8ao8x
         u8uL1UwKpiuK1eIw3JG4lr0JahDeyBluFaEpRyAGtuft7h5GaDX3KhfABtpybKlpLlG8
         yz7J/ks/HmCkLufW78HrTw4f03z7HcQutyU3fqX5I+c7VzAKsWB/d74+qzKFzTcYPKgt
         YLEGgueYFn99Q45q0jMHbAy/eekNp89jXxkbzWDraQPVIf+jy3f+h4AsnqurMszpvq/q
         AeWQ==
X-Forwarded-Encrypted: i=1; AL+hErEowLFX9J2tjv/kYr2I/LWfOATnxbuiCBdqW21SdZsmIzGFzXgn6+fHMBUF1GA/bkMDlN01EWb9dYbn@vger.kernel.org
X-Gm-Message-State: APuU4Z/9H3AZeBmVygUCCFUhOf18hV2K+gEyit2ZF2NfNGf2oRNSc4PC
	lP2yzuVQy1gRLcBujF9zDyN53g6hyDgGsTaZ0WFmUSXV4ccs5p0fMnoVDFGyHbIDCxLcWIbUpSo
	R/BTSUt5LBl5XhbT2gZohirhGxz76CT8=
X-Gm-Gg: AYBFou1J/75hAV2jeVHMT5v22O3kRjgrKOedg0/gNiarhG2iig+vRhFudbuUOjPxttH
	TElMZ6Mv6qQmgncxqFT0f+j34B/CtXKZD+rLk5nU1wYhbSpv0d7xZncdOHPBTai2nMgUtrullKh
	hjkL/DeDElp55cP0n6Ba/wewdbnQO+TJFLaKUj4RgPrRmHvtJfd8b5/GaxhwOeNe6SbnqeIdy6S
	Rw30L46FgILBQnlPo2pujPZDFegKVGjdwl0s62QrMTbq4tbtLShQeAtpYbOudqUAE0ldWxfCjgs
	yds5LMY3WcNUlOJ/In+oWYihMC1rxrFeTFTnPswrHQYt1Gpd7huDNf6EZqVbTfuXnR1p9sbOyU1
	HlKCMuGkAa7ui+SAiVi02vjKe3sljQKyQoEuoKfE=
X-Received: by 2002:a05:701a:cccc:20b0:1b5:32d7:7d73 with SMTP id
 a92af1059eb24-1b532d780bbmr3902889c88.30.1794896100415; Mon, 16 Nov 2026
 22:15:00 -0800 (PST)
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
 <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com> <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
In-Reply-To: <CAPx+jO-rMeg8BvemcMUcC10enjt0dkqWvsK+uRwc75rWpLXhMg@mail.gmail.com>
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Tue, 17 Nov 2026 13:14:49 +0700
X-Gm-Features: AclHuK-92z3C_GXFHu7R-8mmf-2cWRgFAIJrCVXLvNtI2-ZT_Yern3kmnNXQGro
Message-ID: <CAAq9HC4doEs2v=aW0-tR+ARD8a1OGes8xDi2BV=T7m40YFBmww@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
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

On Fri, Nov 13, 2026 at 8:10=E2=80=AFPM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> + Sudeep
>
> On Thu, Oct 22, 2026 at 11:41=E2=80=AFAM Reza Kurniawan <imkyufie@gmail.c=
om> wrote:
> >
> > From: Alejandro Tafalla <atafalla@dnyon.com>
> >
> > On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
> > that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
> > call is rejected with NOT_SUPPORTED.
> >
> > PSCI provides no call to read back the current suspend mode, so the OS
> > cannot tell which mode the firmware is operating in or why the switch
> > is rejected.
> >
> > Add an optional flag that tells the OS not to issue
> > PSCI_SET_SUSPEND_MODE on such firmware.
>
> I think it would be nice to further clarify what's going on in the
> PSCI FW. If I understand correctly, the only supported mode is the
> PSCI OS-initiated mode, hence it's always running in this mode, right?

That is correct.

>
> This is clearly a violation of the PSCI spec - and I guess updating
> the FW isn't possible at this late state, or is it?

Just as Val stated, it's not possible sadly.

>
> >
> > Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
> > [Reza Kurniawan: split out the patch, rewrote the property description,
> >  renamed the property]
> > Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
> > Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Document=
ation/devicetree/bindings/arm/psci.yaml
> > index 0d04389c81..2eee38d155 100644
> > --- a/Documentation/devicetree/bindings/arm/psci.yaml
> > +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> > @@ -98,6 +98,19 @@ properties:
> >        [1] Kernel documentation - ARM idle states bindings
> >          Documentation/devicetree/bindings/cpu/idle-states.yaml
> >
> > +  skip-suspend-mode-switch:
>
> Maybe a more descriptive name can be found?
>
> osi-mode-only or broken-suspend-mode-osi-only?

I initially settled with a similar name before (with 'osi-only'
phrasing). I ultimately went with 'skip-suspend-mode-switch' because
the root cause was only due to the mode switch not functioning
properly. This property doesn't do anything regarding the mode the
firmware is stuck at as it's only fixing the failed call. Normally,
the driver sets the PSCI to the preferred mode at driver probe (OSI if
supported, PC otherwise). This property simply skips that part and
assumes the FW is already in the preferred mode. It could
theoretically work for firmware stuck at either OSI or PC mode, as long
as the platform shows the same symptom, It is mode-agnostic essentially.
That being said, I'm not completely against the 'osi-only' phrasing.

What do you think of the above rationale? I'm open to suggestions.

I admit that the word "skip" here isn't really helpful since it counts
as an implementation detail. "broken" should better describe that it's
a quirk.

Best regards,
Reza
