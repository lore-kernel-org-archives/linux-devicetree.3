Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA77C361DC1
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 14:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990580; cv=pass; b=TtR6eaCe6nlDLn4Ns6GmR+Lol8yEn0Yi4fRoARAKcl61MBZMsoJwPwlEIYBDddD5bAnzGHoX3RXqQgLJYcAqP4FXMLr/qxZeCtC7GUg60LokkGmv6MY8KDWJc+tJ9WbMEYdXAOmoUj9bb8USYi1uFICW1kqcV72ZXeLRBqkTdXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990580; c=relaxed/simple;
	bh=EZrw+Ff5wgZp12c9wE92Aku4Sa+D6FECWmw9grbidJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0oSxe5P2XnrDDn1AtJSVU/uUMsiet0rGGvn8LKjV1vSpZUmJI8pcZP6WGvoHMHEHsOhmayJbLHmBVf4KepQXF/T6QOtEkgB+kvZf/Bjqu100Tzut4+W1kkXMi302Zs6G5gEXpT1V7Z+NHsN64/at+2LZkEpBTlfWz9FQw/ywwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=esEJqhKd; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="esEJqhKd"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39393ec4ed0so28866931fa.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777990577; cv=none;
        d=google.com; s=arc-20240605;
        b=jzCPIRyATG9MKSkFWYMvMU69ViiI+lblFZlj18GDsLVOtMUcaIXInj0iLoul98YS67
         PagFNpr6kW2yE7TaKOAvdUVB1D0tnaOvx5aA0Ao1/8xY04sCnFidI3HRQT3ND2Yloxey
         f6olAvL902XMwqPNAN0nyN8kuUG0AIV9nDyPXtgE1z9lbg4BUCYFw05TmxSZe83cMOQf
         0Tol4sBnKFZSGIUpxQpV3NsGb2vB7GLa/Pz1Pj2AAM5cHAyuvhv8FxgDZQWC/RzwqL5G
         C8BLA0zshKtQG0Cx7GP7sn235aNPpERPhacTcS+G5lTPfAPplg61K9FX60zdDQTwY8AN
         KGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aFHux40IRBs1/yWZDcql5ry1rXvUTT6afmUx2GtPhjQ=;
        fh=GK7F081zQJmpdjwsdgEkzJVVcfDnFpZxyOMtjJEpZuM=;
        b=IRNB4Hg/PG4QoP4f1coTuzyJ7TmDCutpRH4Jqg0ayUSkn0JnriGEkDwKBY9CKXH+m5
         yxKVXvTpIRqhDEE+9+Y8H+CmcmHs86Nme2+JIaGrDFmb5hayRkVqitwCH+9BzRdlpywH
         OczXuUgj/vETV5uNE3wnNwSH/3ZGcJR0WJzgCCAJQtH5FiNVR1pKn+5swAVOpXLZBc1s
         XCL2U4kxMiH2fQRiS8tvB1bWl+xMg0+arBkXBSGjpVol1pEKMqYikyZaUqbQFJ/Ctkmb
         oqX7h13ClEo1BGrthLMSatYdxfaHawfQrtIbWE/AWKbAp5Ups9V2pHettvH+Vp3YT0ZW
         s2AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1777990577; x=1778595377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFHux40IRBs1/yWZDcql5ry1rXvUTT6afmUx2GtPhjQ=;
        b=esEJqhKdToH7Sg5/UqrdOLMO0NIEy1FRIO5Q0fHx3A3ZjB1c1FZ1kff8vps7x5G7uG
         UdX1mQRv7ogr3fnSRi62rvt4qJTB4aJgDU4+lfOEMVpQBUb5y6BgHsxo8Ay8lsgi0lp3
         fWQZ6OCVhgf0oxq6geAdv8/Gv6XCWEkM/ifDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777990577; x=1778595377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aFHux40IRBs1/yWZDcql5ry1rXvUTT6afmUx2GtPhjQ=;
        b=ZlJ9zXwBRgNS6IBT2sw5g1NEpxXkbXTU6G07MKDyjEXD7mfWXO6vGc9yTed3irgrIU
         iHyTmD5CTsppTKWQdlxv84clqHE4l+6XrjBmzPKqOxw8onW9hcJa3ZdTV71VnYaP6Sf3
         xTUlEmwGfAwPSae+p8krsgNG7L+vVH9f9zNFKO+5WxpzZ2xLjJyH5u/QNQCy5T4JfprG
         2zqafm+dg49Q7+ISfPjq4du7onHviPsCUPt5Zy3rlhx3RpugM/ruRQVDJ8IEKRF5LmxH
         j7jQuyKxawZ1TeU1BtZYMBGHG+Emar0P5FFJhuoPpAUXeWFIfA3DS0/2KyWp1yEl64/V
         BFkw==
X-Forwarded-Encrypted: i=1; AFNElJ+WXD2Rmr8uK1LKxVkkavB5CKRqpsSqbFjMDNmnse6ZPYXl+Mlm0qyIKJtCEFJEWVXAycdPGpVkryNr@vger.kernel.org
X-Gm-Message-State: AOJu0YwuI7vp7ATylzqpIjhpHe4jAAgYmyY1hBx65lKa85n1BTXU2JN0
	wtUBzynZGm/MKrlSPtNfy+o206YusBn1QP1aBaWmCih+mtYI2c0pWbRPUccZMTzIVxuoywMG6y0
	DBNswVaC5hEz/XQCCdLU9U1BswCj35G15hPyuDBw/HA==
X-Gm-Gg: AeBDietqpenLkocN0p6qPf8bWgKqF49JSD38Z9pvN57dylY0LBKHcw8KSCulGCfN0TC
	Jnjq1jGCtDKabJC6/xAKPEaGPxJisFwdyYUdu63+zES4qWM82qZoOiY4aog6PhLlAHdoaiDuzz8
	OcJ69FZhtjahInWMMqlOsAWNDwYr7vwlxsP1iMAithmQUX9lkQY4SeF0d8pQdFIMBt9OcXpRxRC
	9Zl7NKWo2y4t7RBTLpSmxoBkEMivxbx+VKVJvy4ZlfoX/EjEdSOdVN/jMLQzwjXTcGlHg3U88xW
	dRkHdwTBaIYBLE4TxrE=
X-Received: by 2002:a05:6512:238e:b0:5a8:64a4:2bb8 with SMTP id
 2adb3069b0e04-5a87f1e9f56mr1369841e87.23.1777990576919; Tue, 05 May 2026
 07:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-3-r.mereu.kernel@arduino.cc> <db701e8b-a405-4105-9b5e-b2add3827d83@oss.qualcomm.com>
In-Reply-To: <db701e8b-a405-4105-9b5e-b2add3827d83@oss.qualcomm.com>
From: Riccardo Mereu Linux Kernel <r.mereu.kernel@arduino.cc>
Date: Tue, 5 May 2026 16:16:04 +0200
X-Gm-Features: AVHnY4JUaPaP1Nq1wsangmykEfeEzNjOrLYJgeSdNs9jlx43Fmpe3DuNJWlc_mY
Message-ID: <CAKA1JhbaB8NjHE-Ez98d1b2QaBkrvpndA0d+GfbZ+uHW1BXruQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output
 to dtso
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org, 
	linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net, 
	naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com, 
	chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev, 
	m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com, 
	loic.poulain@oss.qualcomm.com, Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 4:10=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/30/26 3:21 PM, Riccardo Mereu wrote:
> > From: Riccardo Mereu <r.mereu@arduino.cc>
> >
> > This is done in order to support different video output over DSI.
> > Since audio part is linked to Analogix USB-C controller it is moved to
> > the same DTSO.
> >
> > Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> > ---
>
> [...]
>
> > +     sound: sound {
> > +             compatible =3D "qcom,qrb2210-sndcard";
> > +             model =3D "Arduino-Imola-HPH-LOUT";
> > +             audio-routing =3D "IN1_HPHL", "HPHL_OUT",
> > +                             "IN2_HPHR", "HPHR_OUT",
> > +                             "AMIC2", "MIC BIAS2";
>
> The commit message doesn't mention wiring this up, please split adding
> new features

Sorry for that, part of this is in a series that I was sure was added.
I'll make the dependence explicit in V2 cover letter.

> some of these have a double-space, please fix them up
[...]
> Let's keep a \n between the last property and the following subnode, file=
-wide
[...]
> 'co'dec < 'cp'u < 'p'latform, please

Thanks for the feedback, will fix this in V2

Best regards,
Riccardo
