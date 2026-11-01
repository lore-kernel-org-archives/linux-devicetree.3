Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571081;
	b=TxPOpfsMkn6qb9yyMEEPNVfL2eWdKEeq/+90lcrQqqG8XsUsULj2qU6s1rAn0ZY9iJNP
	 5ueOvjX/0Z/lOVJ4OWofoETgdYOaS1lNvL62UO0PIf55mbx+5ZH6vZyP9DLPPEVNCyU6+
	 kHNwAqn9bikRoE9/0ri+WU/rzelaV1KmwStsdTsTOnRQRd9xuAW20ubCYBPIHuOZ99Don
	 3WHxOObDsZnUN+Po6wyAx3PijVJo6jpmLlrfjiGtYd033C5hzUgbKysl0wBuHNCBL5sSq
	 VVEpE/Bhdp56sXIO/rqDxRXPD0mbeJCvNQPyg0lG6z546uhn4qFbi148/BSkP8lBdFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Buc1QDeYtaFDuNaaLime3LTMfQGnM03bKEX58bfBjs4=;
	b=t6XxmFMcIKcw5n+FVh+c5qNu9Wno4OulzvoQ03kkiGQEBuG/HSW0Nu8v0MwSSQW/EDXy
	 43+BpE076xGTgXJDq6DyhIHiKhe0KpFsXvlLkz/NgTccEvcssyihc7kT5f/2EO8Z+lU0q
	 nMsAeCSyIimA5bTtRJ/vIRcFyZRwEh52Jn50a56Dqhqczxj6xsdZhwo8pVHJSP+m8XMWc
	 mTV2wbWFU9kb6qnDRo4Pyx7wxeOC7KYqmta8E/AMdB+geP4oX7GauLNwiYGGeBQH18z8x
	 TqeSs4pN9fJAXOJIXXzez0mzPPcYidv/CMJwvdpI2sw0gSgnAdybzQ9JkliY7d3iUsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZCh0l1wk;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC9B606A324
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CC9B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZCh0l1wk
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c49b431f022so338755766b.1
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793571079; x=1794175879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Buc1QDeYtaFDuNaaLime3LTMfQGnM03bKEX58bfBjs4=;
        b=ZCh0l1wk4NeMsAyYkEI/6+SVF42d/1gDVinYWRAQHq2klMEWIQ5vczvlwM+8oRAC67
         Q/RIE7ZD5vNPk4kmtqddzBorOOVtam7yqe3k/y6Ijn0PKOa8FFqbWqWA5GRPlnoPHRzP
         v+4LCMvX8p9TERD+YbN3+U3Ky68ffZTcWQYpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571079; x=1794175879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Buc1QDeYtaFDuNaaLime3LTMfQGnM03bKEX58bfBjs4=;
        b=WzTF3vFZc6kUDSL7S8DFYLL9bReGVZnURimyp1N1Bty+ds9PeHxsTAWgKEmCS6V66Y
         dBUpel5MqptM7oeQE4cJMvPKX127sG8OuY9CseAXMbweqZXLT5ACEjoKwNSAZhURC9th
         Q6pX9bWF8LO2iTSZfS0kCGgl9+XzBa42Q0YK+9rRuxyPkoK1e5xNlHuLqReMBmhGdZPY
         eCaqiEPAONu9ebeWVWMwUHbyseqfcpEjV0YTBr8Rb1X1PAVeuWK2gZ1lZdIiHtdBGaVA
         ik4VDFtkvNuQHgMBmLn+R6jBmsj75aE/II1n3Eri/YZsYK7iRuTxNiAFLekK5IyDJCen
         6fQw==
X-Forwarded-Encrypted: i=1; AKwUvBw3fwVCYJW2g99pfq0EmEj6SR+slVrpi1IuYouYQBB17gSO5S3AbOtcyTv6WQWPmitZ4uRxH9xiXnBQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJpyKYEemTvvqhIG1AVGQuh/T3psogSwt8yIUX46Di3T5cWc72T
	l6WbqS3iLMhEINKUTHkBEo3lisKGbXjlg0hOe3aUvftM8n+zHWgrDBO9hNc11PW05qn3BuhQcRv
	auY8M3Zwo
X-Gm-Gg: AYBFou3ipeJ9n8f9X2O69DezgMv1chATM65m+VYkZyRBkVmqzhJ9SONdhLDLlIrBDO0
	Gvuom4JgeMwU1Hgxu5mjTB6iS4hvqPXLH1pVUWAR0l9D9+g13pWDaNEkJmysdcSwKaZ8MqSkxzt
	eLNj2hmY7imGnlLfpCUuRHBeirw+5DA0B3XJOdcbmR0JmNlFBFEey+55lf2Fo5CLK1jkOwcoV3y
	/oMrm5Pi+Gy8EJoyMjx1dFlQIMgqlqxiXxy11zNq/lG8m5kjczReH0FZMHO60FyQaNPit2isuUI
	7y+YjmwFBkH1kbRAfZuJcucTMgDVjEu/Z+2O+4ji6r5DpLjuofafJQ3or0Gd0Qbzi9XO2J0hcMg
	VRggwdoOZVOpwaPz8kUJexXa2oIFwFumjHcTG7OoVqiQPfxAEqedVXLEQ/YQj8CQbtn/keVp2vi
	2JUjMunXag21GRU/XAUeaN3cyT7ppfKNSof5X1Xc7DqugQIZux1VDzTgRaBCtsJgFLvi/W8ZDi1
	MDteK9yGFgWl2XFQYelpo9RbvVqvG2wkzCWrLxm8wRSMHrCW/kymWpDMe9XzEClJP2yZ42K76zY
	sUu2hAdQBeq0/Hq5GOSlC58VguOrq/TIgcf6ejyYQV/soS1e3LgqLfMbNVtwgu0u3K4=
X-Received: by 2002:a17:907:72cb:b0:c3e:e677:563a with SMTP id a640c23a62f3a-c4ca7aee0famr660006566b.47.1793571079523;
        Sun, 01 Nov 2026 14:11:19 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9a767esm2523651a12.5.2026.11.01.14.11.18
        for <Devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:11:19 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso3723825a12.0
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:11:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByNIwAMmbl3MSeGFYX39JLvTfwV1TTsp3kuj2JkclyuJXS5psVI3KmYySiOiG8Ro1S2uEyird7+wwzY@vger.kernel.org
X-Received: by 2002:a05:600c:4708:b0:4a2:167a:c93b with SMTP id
 5b1f17b1804b1-4ac19234ad8mr193309575e9.30.1793570740977; Sun, 01 Nov 2026
 14:05:40 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-9-dianders@chromium.org> <CAFLszThZs9Qx6c_qff4LUXPNpncUAO7LGygkyv6FRtGcxU88xg@mail.gmail.com>
In-Reply-To: <CAFLszThZs9Qx6c_qff4LUXPNpncUAO7LGygkyv6FRtGcxU88xg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:05:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WeMHHTZ5v0tWLhqRivAMogbqVQ-cuF9HRb6sfO+9TVkw@mail.gmail.com>
X-Gm-Features: AclHuK87KLmJoI8xKOrvWWlX0UnZ0z4ES-P-CBsehd7HFous4pSW5-SGmdATFXc
Message-ID: <CAD=FV=WeMHHTZ5v0tWLhqRivAMogbqVQ-cuF9HRb6sfO+9TVkw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] fdtfactor: Add -S/--strip-local-fixups option
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 30, 2026 at 5:23=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > On a set of 47 Qualcomm SC7180 Trogdor Chromebook board DTBs,
> > `fdtfactor -S` reduces total uncompressed size from 7.69 MB to 634 KB
> > (91.8% savings).
>
> This compares against the unfactored DTBs, so it doesn't show what -S
> itself saves. Please can you also give the size without -S, so it is
> clear what the /__local_fixups__ in base.dtb costs?

Done. Updated the commit message to show both numbers: without `-S` the
47 Trogdor DTBs factor down from 7.69 MB to 932 KB (88.2% savings), and
with `-S` they factor down to 634 KB (91.8% savings, saving an additional
298 KB by omitting `/__local_fixups__` from `base.dtb`).


> > diff --git a/tests/run_tests.sh b/tests/run_tests.sh
> > @@ -1238,6 +1238,28 @@ fdtfactor_tests () {
> > +    # Strip local fixups (-S): verify that merged DTBs match DTBs comp=
iled
> > +    # with -@ (without -L), and that inputs lacking /__local_fixups__ =
are
> > +    # rejected.
> > +    for i in 1 2 3; do
> > +     run_dtc_test -b 2 -@ -I dts -O dtb -o fdtfactor_board${i}.nolf.te=
st.dtb \
> > +         "$SRCDIR/fdtfactor_board${i}.dts"
> > +    done
> > +    run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_strip.test.dir=
 \
> > +     fdtfactor_board1.nolf.test.dtb fdtfactor_board2.test.dtb
>
> This rejection test has no -S, so it checks the -L requirement from
> the previous patch rather than anything added here. Since -S could
> easily be read as 'my inputs don't need -L', I think it is more useful
> to pass -S here, to show that it does not relax that requirement. The
> plain no-S case could then go into the previous patch with the other
> rejection tests.

Done. Moved the no-`-S` `.nolf.test.dtb` rejection test into the main
`fdtfactor` patch and updated this test to pass `-S`.


-Doug
