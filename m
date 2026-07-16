Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6414302EB
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784221291; cv=pass; b=ZJLjvRtTujuFBlahjVfi8RhMVsa53lSdnZhwCHcwqqBa1yHTM6GCD49q0mm2mSINElBbwaERF9cVAJevoRmSO03lCdbo+F24K7lYlHPr9IKTfNlr2QsTaHjRP57DW4kjIw3Twz2k+o/pC30vlITPzi6aq/ZGKTHj2kCc2KdmhVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784221291; c=relaxed/simple;
	bh=4h0sRg3GsMnzMqv1J/fmmCFy78xb8pm2m0ZoBq9L4Ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJHN6TEDk81Bej+q2mQSV4hg9yZmapWf9+yWsgSOSCeuZkohOEe+l4uc+M9hp9QS3SNKG6KBNgNfDP4tuYFZdBEY9jYUA8d8iXcbRGYWIN2y7jVg0F15fqZYkTLZatECFeDLcSHKhMPTywH443fL/6lIgmUb0TLc3EUGkaBpCO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xk/bbkGJ; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xk/bbkGJ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-698bf7a1a2dso9824743a12.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 10:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784221288; cv=none;
        d=google.com; s=arc-20260327;
        b=NgfRYSXZqnCzryi0g1K+1+L0QvBPc/3kIa4KM8I+nBkZTG9fRxTSxxY+C6x7PbfvfV
         st9XqjNI6t/Oh42IX3ExLyPtc4x8IB+L0RC9XND7jPnpwBHRylEDGeSl532kZciP5FIJ
         QbtR+VB6XpDeSojMlVcfydMn7K903UzVC35WIF1lESzaN6Ne/qYMQmVvnlvQMM7Crxgt
         YvpZTX1vsNtcg95yyDM0DgJLrCinqij/Wsk8V0XLczYT3QEfIoPwjkkvUobEehk6zeIe
         +xoppyzBYcxvQpnMlLLEEtwQcXQOWjMSOqhXJfhO6sS7GIsV86btPPBhipx1ao0QGFgD
         mw7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XS0UmqIKYMykgWaY9+AHkSpVUpr/nsVzh5HTFZmlsow=;
        fh=29arxth/rc46QCfjLj081xkU0Wz8HbvpC6TWZv0KqNQ=;
        b=AbrG8IP1CTaBfUTZ8TfHf8q7mMj+Rjy1zOcTWmw78HoLkVPqnmaScFuYpbhQA4zrQz
         cf+FlbbnW26Nkz3qD8QEdl1HzPRSfN9k+0ZjYCGJwBPtjof7Bkf0qCELFmGNS03NgbMw
         eEzvHIvSb0kY2ewmM/3hD4Xnv4xLwV77ZdY5hyMkZ23mZHsCWPsIfO0oY490lFB8HaSA
         MCzt7B71l/fnPZr0HVuxSOlN2Jo0NyOiy7pOkQTf1WulJn0kNm7pUaN3IMJGv4uWi6iO
         JYysRV064JwpO9zPVuDbsrJie8GyPZhM2qcjjrNbT6gsi6ueJdDmzg24/MTXzm3qTvqm
         okvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784221288; x=1784826088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XS0UmqIKYMykgWaY9+AHkSpVUpr/nsVzh5HTFZmlsow=;
        b=Xk/bbkGJmzzMOigf7P3WZMLA32hYjpjw5tjobpm3vywdRDEFyQOEiMw2KwUKOzbIt3
         f/KrPqoKOzCjUe8mvhD+ri6JRBafN+rPxAbZSRp0gk0sDJWycd2zNufoT6A1aHSPSey7
         bfn1Y/0MY6ZCUlc5OpCBo3NKVGCbsOoGe18SyBDEUg+NS/7BLOKLwHAgQT4Y49L6zgN3
         XbHV4b0t/E/5xAfd/1T1ee8Fj0ignQEtSLcB1VdHbClOKepOdqAj4cSfsOr0U1suqEtn
         oVe3Kr6tn1hV+7vruZYdF8w6/clPkQ+X1j3KI9PEYkU5brEidpL2Wvah4l/CmfIZInf8
         zlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784221288; x=1784826088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XS0UmqIKYMykgWaY9+AHkSpVUpr/nsVzh5HTFZmlsow=;
        b=A2pFOFYdjN4IzlivrfyJyUC5F+dOcitX8gzQiKjvSkhZW2XdIyGz3oSR/asRr5hOnY
         VfvT3GXiVMRlNNN0wb2yPqubsXH2LRiTt6aBu9C02+cXtFJKtjnpaBZ1Cia0Zn7UG6gz
         daV40i71XwsVHRQ8JPLi3jisrzPiJL2LmxnYrTrXeV1PdjvAekLw6Ykcl9s63JLX3bo2
         rgb3G6Ha3xCoQ8PjmcgzvFYdzab5JvN35ggzRs7UF2Glu1VoXbfe0UZ/RdVNdAntWtDl
         +RnnUSXxM7WKpJGI5iJu1Y7QXPXBQqXDqVg81BMFfPvsdjY4ZtGppNuxw7ewQ+ncdNmZ
         8j1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpW6T+BD6i4UoJYOKNr3ZGfqssuVw53GqccTaPiu9Fq1OIrC802EXu4FKFrdxPDwSEJMLd0Y15XSkli@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Vk9oiSYXwcswNYxdzfi+epTSKFrsalrhzP4k184eMbh/oBnm
	ktlUSJIicyl9WB7pjGygHAftWWtrXkV8csmqOS7wqVumxuykfYib4D33Ox5QTsLxVAJem4NUKDj
	lvnVCafy61+RsSngj1ovfVxptDFUxaxU=
X-Gm-Gg: AfdE7cl37NoOGWZuyG4Szd3vQnZQxE/pdurG1q+WWRgc+ZBV4MQnIQhil8TTISCpO3b
	lQbNwfkeKO1p/U5KgG1sMhOgi41D+LcOKSfZ85t4VuNGqAzAeAyuVj6xNJdeXrwUv6kG5c+djLK
	ELa/Nlk5R/W6iZ6g9oPODOhb2/5wzAnE4EiY9+qZe2B9TcKvtR+y5Wp/aoNllUmgNxPycFuH9T5
	KvvufYPEzUk3m6lVNUHN4kMgVmbM+L2fSHkw7u1nMmeuTx0Q+d61/Fd6mYZkpg=
X-Received: by 2002:a05:6402:234c:b0:698:1973:1da9 with SMTP id
 4fb4d7f45d1cf-69e199c4036mr5003292a12.19.1784221287783; Thu, 16 Jul 2026
 10:01:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716113805.593215-1-a.shimko.dev@gmail.com>
 <20260716113805.593215-3-a.shimko.dev@gmail.com> <f3be1229-1d46-4cb3-a83f-0715d6789651@lunn.ch>
In-Reply-To: <f3be1229-1d46-4cb3-a83f-0715d6789651@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Thu, 16 Jul 2026 20:01:14 +0300
X-Gm-Features: AUfX_mw8ClbUaZoBn4r4Iv1iQaSKbKk79pCbvsv0ZhuCJcFgz03_1qcx4Pm6zN8
Message-ID: <CAOPX74651bEHyHQaKmjFheG8_sfbuD7PUagkAOQfYKYBXaEqgw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: phy: add DAPU Telecom DAP8210R(I)
 Gigabit Ethernet PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Thu, Jul 16, 2026 at 4:55=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +     /* Wait for reset self-clear */
> > +     do {
> > +             fsleep(20);
> > +             ret =3D dap8211r_read_ext(phydev, DAP8211R_PHY_CON);
> > +             if (ret < 0)
> > +                     return ret;
> > +     } while (!(ret & DAP8211R_PHY_SW_RST) && --retries);
>
> This does not have the usual problem, but it is still better to use
> something from iopoll.h.
Thank you! I will replace the manual loop with read_poll_timeout() in v3.
--
Best Regards,
Artem
