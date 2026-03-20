Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3884634104E
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 23:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774048073; cv=pass; b=r4u5zTEiGYI+/8VsixIphgpdKdn+tZfWD8EKH15RmYHZTtma7+KPAsgzp7Cx1FEVJpKpJgzgV/n9+EhZ1JxR4yGKqIvptM+nXr0TxXFlGJtcqa+31hKKdtSZIyTZNyrkA44EjI8RBk3HhOYtsJqj/F0y59FiW+WOYWB8P2siBxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774048073; c=relaxed/simple;
	bh=6JCzvUReAvmRaGAkyAEznszoR+jf+OXTsBS6N8BL9C0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhKO+65P4BO5yFGfnjYljbESsMB8UBplpnl9Rwab2CuSSqT4FitkjKmfWu9N86rfMJZYzoTAowa7FY3d0OlYIv2DiqoArw+DiRQA9x7YK9uJlXuDhXGUyETdybHZPC9KZPHjTQJ/msxLKjon85C8LxeQD/sMcg+co2+8mqFc5PE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfJfXFyq; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfJfXFyq"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b93698bb57aso491939466b.0
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 16:07:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774048071; cv=none;
        d=google.com; s=arc-20240605;
        b=XFGzd80KJs9cWHao4XXCUg7tDaEJB/kvczoarCXqXaD/v8u48HVEMCQb3o/af1tGKK
         o5IqQtwCO5eDGgnt6DPvdp/+zkG2sRqaxing3nK8Y30clTJ42tci3hdJUEBWMKsFar30
         3WwUjvqkl5MP0ST9Tu8IeaH9Qn3fKLtMF7NWOs5aGvb9Vv9lmneHC8mCvtVjfPOuYaXb
         Mu5FPj/QDcA5J13ThjN74PPqKhzkh9E3dCknmwsnGI0rIimwVTGW2PYCgSP2AJoDBwZl
         LCPPYpFHezXyb7aSAZ8qdUz6ZHoKtbw0ONo2D/bAlpjcAslw8osHxCl8OFKCc9ipqQbK
         qd0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6JCzvUReAvmRaGAkyAEznszoR+jf+OXTsBS6N8BL9C0=;
        fh=LUDUp6kystYAd6+sGXHHcom8a6eah/CeGcyBUouT6j4=;
        b=d0vLNYCYmf9DT/8zxIptNp0LCu22Js+aML5JRbiQ302PsYI3xvXUBohygb6uSt2O3z
         zPDbfHeomOb17KgOmMtDVpYKviVDS+90SEO8C6ms4ld5aDMbEXoIfol0a7jzh3yGzXzk
         u1kjpakg7RawMeJNTh6/ldW0aQ5FUXrXFxTTzBKKXEXTwL6N9p94DnueMhE/577SSxWm
         GZxFc/h6SyaJhIBUFwrbKFCfaqgYaQZgt/NlxFNHatZ/ST+aXKr9YE+/FDLxXI3nGoAg
         f+TqbnIVq7XjxUEx5zJ6uYg1aPnfXxPhO5VYJgYldl8n5beYVu6crza1Cnp/xrE4T/vJ
         MmAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774048071; x=1774652871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JCzvUReAvmRaGAkyAEznszoR+jf+OXTsBS6N8BL9C0=;
        b=mfJfXFyqIN7FvJ26oNwfRGsTsmJFKXooq/FBPjgghVqHohgV+9gDzZYKM1H778LNUb
         xPDu0buXn5+Wfl4M/kF+DY4QHou+u2vVPdC++QU7XwXssI/EFbnmK3+Oaug2A0BpHKP6
         byj3XquiSRJHUanID6277cM2gjUbfHbXb/B4E6uJ/w6bsDIvlnAcHz5CZt8LcpvU3tYA
         JjIJh/WhI60EZRxf/0pQikAeFXrGtikcJalsFjhJKBr8Gj/BuUrOtc10uBJg7XUgP8C4
         +xFN2M0VLpyKZqT355ENgzz/r7sh9QMymv0bAvYrlsirqC9PCHexANlICk4QapGdT3rV
         PkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774048071; x=1774652871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6JCzvUReAvmRaGAkyAEznszoR+jf+OXTsBS6N8BL9C0=;
        b=FfZyLjYVra+t3ctNWOZTGncO4DttZBcX508grafdSPBTR73KDgfKt1Ipwi1aNI/lbQ
         vR82QCf5HxsTnIefWhU9kNhoXZWbtM1207x6HGeqlcBtny+LBooaA7UQ+e2Ws6nVG9KI
         zgsD2yGs99a3RpZ0/adscIPskQJM0tVFDny85EVbcNBVMMti3Y6vuFKL4fWV5oZuuxhV
         BKLlD49pb3A/A63pNdNXC/QK+4aOUtYnfCEb6ojoKqkvhcha4qoWQ/dv5g9CUESDsjwU
         U2TgmhU8ubJjJ81WjDoOzWLl1I1FTe5TPYrvRFzpW6afhG94o1H9oe7TXDARIPGR9x5J
         MaNQ==
X-Gm-Message-State: AOJu0YyJeMX4ro4tVwKhEUvvatP+eBkYDKKayi8LWRaCiKSt3N5zLRaR
	H/mF0uQY6z8ZYN/JA2Emm+TNZE+NTyriUMsPs7KYfZf1ZoL9DyNRtQFK00oHzX4LtdQXwX/7U2o
	yfhThFsltc+uk/lm8BsUUwmIeDzphEuc=
X-Gm-Gg: ATEYQzxyxPcdZUl4VNgJWRmR4e9PtKrhnGAkQMIXlvD6Yzds6bzTuqujrPeZNFCn+nr
	51h+4W7fq460EWaTL9Li17lmeP01qmGHVffZKmQJz0pqoBdYhoTeKN403du1jlxmgz27lupKEps
	AG3rU0iJxuaF9I6dkDIxA32ouCf7be8NKq5tyyfQaxmE56bQ/CRj6aEAtAWQzPFD5LOJ5/g2pj6
	lGvrIaFL4uBxij/ujjiwzxkmaZm8Lguhpb+V5N88rFWixBK5hxmiWPGqgfM8CyX/Btjn35ru81P
	naW2VsU1XnlFGdKi+ARtD6ZnoKAMUvi7nRWs3suPfVswbd48oly9w8Os72MHj84rFKpRdyPwluY
	GNjSw3A==
X-Received: by 2002:a17:907:7a8b:b0:b84:3fab:4251 with SMTP id
 a640c23a62f3a-b982f58ee8cmr336055466b.15.1774048070294; Fri, 20 Mar 2026
 16:07:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302000736.592422-1-rosenp@gmail.com> <fff10c34-6253-4608-b969-98a7220fc9c9@broadcom.com>
In-Reply-To: <fff10c34-6253-4608-b969-98a7220fc9c9@broadcom.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Mar 2026 16:07:39 -0700
X-Gm-Features: AaiRm518z60-KQ1iXqs8-LNx6Z0ndGXEzRtFemv_pentK5ZgaVAgM8oOuBqXssw
Message-ID: <CAKxU2N9db_RA80ikviMHvY+xgG_myPmU3UTYaoD4uvibBeshEw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: BCM5301X: add root pcie bridges
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 2:39=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 3/1/26 16:07, Rosen Penev wrote:
> > They are always required and instead of duplicating a definition in eac=
h
> > dts file, place it in dtsi with labels and work based on that.
> >
> > Also changed each bridge@ to pcie@ to get extra dtc static analysis.
> >
> > Fixed bridge numbers as a result.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> While you are it, can you fix this warning:
>
> arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:142.3-27: Warning
> (pci_device_bus_num):
> /axi@18000000/pcie@13000/pcie@0/pcie@0,0/pcie@1,0:bus-range: PCI bus
> number 0 out of range, expected (1 - 255)
> arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:142.3-27: Warning
> (pci_device_bus_num):
> /axi@18000000/pcie@13000/pcie@0/pcie@0,0/pcie@2,0:bus-range: PCI bus
> number 0 out of range, expected (1 - 255)
I'll look into this.
>
> Thanks!
> --
> Florian
