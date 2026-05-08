Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57AA2DAFA9
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236831; cv=pass; b=DF802uCkYZQ0ROtmiFnzmkp/yPL9S9+Z4duD0Hc1rEnMyyPE2lBj4/ZO1x73KyvOvNmBunWpN8FmZCAzk2S9H40WpDzXRBnQ95TkoJbujn63QW8rWEI2YnSQRb1yAyFyii6+YQuL9/pVdNo/2vVKJWYZG4YMTEHzwVPiPzRHRmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236831; c=relaxed/simple;
	bh=fuk/ObsC/jtUmX5I0WeHPysLePWeJyTNoXNotejJxnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TFQ0UwzuddMVelzW9OB3WrDjbpdrbqNdlI5oWRqLu1mygCNgXkkbPrkrS4Dy5gb4bSShlf/dOLyFan7jNyORq4szH6lVBDUnuSmodyqxNSNccd2tm5Efns02sVuOPgwRVPalPVEf58L5XMhrWSIonzGoWvxKSd4XfIXk6KJd2Jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVP+PqW4; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVP+PqW4"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50faeb8317bso13238841cf.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778236829; cv=none;
        d=google.com; s=arc-20240605;
        b=VUk9GvcgNFZJ4jpr9VdeP9B7XlVfmPA7aDvMHjxZor/PRplJJEnXkUqE6hw7PqxMF9
         AfKXbZ5IB0sL9cu21RT3udJm5TFSROgtZoiaxtSQHC7jxduQU18NPpbGrDXNMf0fSkXh
         wjoTG0bfQL2Ehk70cL3XT6hrNjOOXnvFStp3znMMsS20Tis4Jjt09fI1a4Id9wG0rRgb
         o9sJGJmDDQoOvvSNBnTAILvevpqUN0DoYNnZfl29SLEZbYXlglMm2eSpn91dTFkaxX8N
         dJmCBZupCrC29um7nTEf6CIzB/YRevOvo9M6YGSLE/31nXGmP6DcRABGq6J/zt+JkZQV
         XGLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fuk/ObsC/jtUmX5I0WeHPysLePWeJyTNoXNotejJxnU=;
        fh=wtwB5XTCfBfI8a0L1nVpTAssHoOx2s4tWvoTkbtin74=;
        b=MdpsYmYGNcgJzR7hyNRcaAeOxUwCxqndnPZf4HFAfxifvth6wpSIrx09x1J0qoWLRf
         ha3Ip5A0aH9VfrilsPUtOdzb7GDnr5o6H8u26NQRZMzWaSiGnR8wQAfsVdtBK1YZvOmW
         bHQ0BZbGXqq87iKZQyp2wPNxFO/xR+lC44JzpcszHkcJeSmdBsZVWX7gKd2i85aQNBfs
         8fZ3gYxf+JTC9uzatYzQ95AaadSjJIzzpUBEvLZXuxun+hLi1LrDivXBxEuVPCF5FofE
         /QDTqtgNpb1PXrn2bJxWExLys8F284bP/g9kroji5vB6h0UpnXEB//+lMtNb6lw99DRV
         evLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778236829; x=1778841629; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fuk/ObsC/jtUmX5I0WeHPysLePWeJyTNoXNotejJxnU=;
        b=XVP+PqW4Y+RKMWOA9FcOf737/QGkgVe+p4NsWKKS+GrcZzrufYEzxUTv6s0BQQCWNs
         iq198NGPGITOW9KYk5hWLg+U7qII7xofDPqPfm7hVJ+hrMu7kZNc0Fqe2+dnKuZ2QtK+
         txIak2OoWZ24FywHEifqQUlYdNtNk92r84a47KO0gCUlqMwRla3LIxrfzITwxvUZZ/Ai
         WfdtszKlyvVnOuZLbgiWcrPzp5M2aT1ZWrjb7WaqTXRoWZYyB7k5zDQ7aOh08SGCWDxV
         NemsKZ2/wquQVJnnftITqpfDdX+eGiewj9SsFSTJLbijPYYRJSDn2sR/lEp08FclCrdt
         86Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236829; x=1778841629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuk/ObsC/jtUmX5I0WeHPysLePWeJyTNoXNotejJxnU=;
        b=odZfpCnktMRE4b+6aj2Ms3CfuZS3qFrHFo2NgeHmj3/VXwlq6q8YVBQqT8dvpW/24t
         2faBeakaU/tPl3IiRGa3o0J9OW1De+6TQnBTu4p0LFa5WiP9VTwB7D6x6Ny0XGJkG1Zz
         oXOFTW4zjNCspy3BCTU8hAoxs5W42UGtnA2CYb+n084nygXvjZ+SmBPlm4nIHG3PTVUl
         QutOREbDmGIpVNlgx11jadbWlyXwCtlSzP/QrRGW9oVvHVCU4dZNY0r2imokJZig6XfP
         FXpPWtRRrZFh+WaCkvkIMPa4/Uoxu5dqGNbgGQqXL02lP4cmXgYvJ9VNWYeWU6WS9irY
         j7iw==
X-Forwarded-Encrypted: i=1; AFNElJ+2EXMhgiW13A6hL6MZwMD4lECwIktHJ0CpHHXGaEtMHMTbq35r3eNPung/rWLQ+Fh9ZzfYwOGL+Yn4@vger.kernel.org
X-Gm-Message-State: AOJu0YxbJHZuBLRB64tSnYkpWJnvwzFScPYeRspJn3+OR5IBR3SFxuWp
	LjvFPgZX69f0/15L7AvB4Yv/dmggNEO7BWEHbMhROOoSswICt4Oyswrn0GMd/OAdvXa2k6TCYSf
	8EwZUcLPPmM35j2Sl33VbHN2/qXSBdl4=
X-Gm-Gg: AeBDieu+tnVibkkmqTslzwofUPzN1+xFxKp8HaaMnAQ0Fr0pv33CpERKays9YNfRHaF
	f0X+5nIePmKQS5CVrjMNRQCwAzKcxXuB0MP4uvUiVsDp9hDaYgt2GLSAQ078mJKtiW51PVYINx1
	pN3SztSJ/q55I4DXrOAefa/KvFkgT3b94GPFQKaz4Kw0gxGQMFi+s45lhvoB7WA/3niZD8iR4up
	ZwqbwNcw0oCGtFUr4OP98afTYPqkEMaLbU4sE+GDCbU/rsbAWfUEHcIQnY3Is1LzEYQfFADSuWa
	nrDCapi68DfpXTPw
X-Received: by 2002:a05:622a:487:b0:509:379b:d4e with SMTP id
 d75a77b69052e-5148e94d952mr24073221cf.32.1778236828776; Fri, 08 May 2026
 03:40:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507205033.951990-1-vlad.kulikov.c@gmail.com> <af206U20Fvky1g30@ashevche-desk.local>
In-Reply-To: <af206U20Fvky1g30@ashevche-desk.local>
From: Vlad <vlad.kulikov.c@gmail.com>
Date: Fri, 8 May 2026 13:40:17 +0300
X-Gm-Features: AVHnY4LxMz11yqQxZHkPRnJIUn116WWMOYnaQqTdS60NOVrbHnvNh-hNfw-LAs0
Message-ID: <CAMY8kpTR3Mt1Onim0etLaoGLkRd1UyXrHJaW=Z-2CQ=7CSJwbA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] iio: magnetometer: add MEMSIC MMC5983MA driver
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, May 8, 2026 at 1:03 PM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> My comment from v1 still applies. Note, when sending a new version of a driver
> like this, give approximately as many days as hundreds of LoC in it.
> The bare minimum 24h anyway.

Thanks, understood about the revision cadence. I will wait longer before
sending the next version.

I did include a short explanation in patch 1/2, but I see that it should
also be visible in the cover letter for a new driver series. Unless you
think the existing note in patch 1/2 is sufficient, I will add a
dedicated "why a new driver" section to the cover letter in v3.

Best regards,
Vladi
