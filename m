Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794605988;
	b=tawFJJtcqwM57BGI+mKmxIYv1aGC/lsnayi5IjDkOcmjcZ8cw2giOks+/5gy/noLMbuE
	 ZfGTMCENDB9NEbaIuRdmAtJBr6Bw+x0iZhE1Y1VwDar44FS8ceicmHp7Mj4sMmvVsUi7O
	 25cvNdSNwywW2JfTxdx4tWbXZqg5JCVQkugI76tIZjQM7mXsl/WqX5G7LSz524+2brnXd
	 fEGTM30MGkJbsS6OWdF2WaSq80i+tFfcQkQi+nGXEh5ui9wBjkbVLuSbPdqudmXrNq10x
	 fzc9iukvgGq5t6SpQEEhoIteXXkSGtW2gGIYGgCO87RheG1etXoLZd3s7P8+KugzLjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z09G6Mh32lxTcN93Jth8bp3CpV5mh1cGftMTw1FyV+4=;
	b=0WhCdIWsa2yN+JyvlLqwQWT/RsXPJjiOyo9PTpDXy7Ru6DoF6DWF+/tsPK304doGTySC
	 HK8Z0mXTqTJO9caLC1jOe3KE8zaCBPBMS2fQ2rVWquJgOBHHq1xFYiwLiP8ihjoJp0HG8
	 KbldewKjL6MIQ3wmlXv1p/+xkc4w/JMyFYhcnrRc6L40utwwwiUMbGaAQc4Ptba7SKOP4
	 QLA5lwIo+DShT02XpqQQl23geXytqF4IX+/tC4FMYWSlSkadtnAqLNJ9s8FivGbJI9cLh
	 /Hci2yFPunk+aVNai6Jba9qmdpY74Vw6PGd6fGiwZ/wvYOIr3DihBdKouhxl2P4r8GQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYuf6ucd;
	arc=fail smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CEC606A8A1
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 21:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54CEC606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYuf6ucd
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c3fae9338f0so24989066b.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:39:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794605987; cv=none;
        d=google.com; s=arc-20260327;
        b=s3s495ex5ekCOP1UV4t0e7qUxvMVfW6Nuvl3qeeFgob5XM0SR2kM4NbeGtCvimeCZ2
         KJLkyWTXQOFl9OfdjObDQbytnkznJV9b/fiviZDlf5PrbQIh9BQkoKJZnVLDFrl9cAcr
         neKEVC6sLOd7TCjkT6+bYi998fzbny6Jiq2sa2EH9CVOCYP7h54dTNBdpBURoAQYLEmM
         z/QXnHw/ryWj+M2cHTmnbJaxRsVxeQtqfaAlmJ2OyGUkNBrVEEHRB5drceCofPPSVT81
         MBjgxy8oxfCnB89SMdMramtOEDC7UxbgpJv7L66YJCtKlbYjM79b0hlhXonIn0cvNvKH
         5Zlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z09G6Mh32lxTcN93Jth8bp3CpV5mh1cGftMTw1FyV+4=;
        fh=ZeKcc7iWeikSTk8jd3ydfiQRywBnMrCpvBwTRO2m2PY=;
        b=YXQmBeD+qII9oRCNej8ciTwIQQw4XvikWKTIHtVVEQUttfuKQrP4pmkGfv7kL3Q80r
         8ueiQqiTR7ub+VW9+tyLyWgeU+VeIRThQi4KLr7n/xNeKNFaFv1h0kMvaJNkDPSIBzHM
         ymRzxrwRm8oE9iHEFap5xFx230xh84QGNd834NtX+HagkqPSLwDzEOgJ5vm6SRNiBixS
         Szya23IPU5ZMZ3O3yip0icClqcZX8QnBaes/zKJrgibZ1XXVWs+/0sXeSNwIse0UmJWh
         xKwG5qalUd6UhAtjrcQSuqrKlVBe/Vyog0Jj1VFqHdxX2sqKysMuqhKzqB4bLwR9GbkV
         6I+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794605987; x=1795210787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z09G6Mh32lxTcN93Jth8bp3CpV5mh1cGftMTw1FyV+4=;
        b=NYuf6ucdQlZW6jzeitbcergVg/cyc1cbSBBFDiXM+vZjX1QWO592BJCRfAmF+K/O2l
         M4kH7hN7l3NXN18K/csofZeEeh1Diq+i3H0PosJgBls5YxvxoHJLTYbongEUieXFKycX
         cT0q0BowRibrBYvg7uMSd4+CPViFnKfdEqjcyAVgB4LfFsOU+Q/b2oaFVJcykHqxqE7h
         CHXcRlY+J0fDLurZqPDBZDmnwrlm0VFxD0XMnSRUSEeoHMZXz2U2FMv4P04HnCqY/CYw
         G6uQH57n0shjlpzI6Xus3OWfXDfhs9P0XZjIpt6WXadF071uyv0A3eodz/emGQXj4CXg
         7Dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605987; x=1795210787;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z09G6Mh32lxTcN93Jth8bp3CpV5mh1cGftMTw1FyV+4=;
        b=RJAQh09ZKGUJIDyIgdvOXm5bCu5EBwW7967lCaQRH/PbqIuB+FPRtxabpmu0TjnrkD
         wQXOqWGHhkwF9eFboGPiyEGsapZoG33za+BpD49T+GGT0MT3uJ4TMUc3trfq99ANU1f/
         thUsYwaeWcwg+0+AwYRCQ2x+U0xLmutpr9qlIrX2MWz2KrPhpaD8jMHVdCjV1mkbX2E/
         pOAnlNOig/HuC0rRsAkuxM6DtkaNaEjRcK1ccCSNIE8GMh6MfelxgOtXKMFfSKYZEQJI
         vxUyH4e1TdTilfS+dR2MK1jZusZxlkvNanhrLTgLHEmGQw8ZnhrW7oit2wVkW87oeuDW
         ELYQ==
X-Forwarded-Encrypted: i=1; AL+hErGLUWDrKxhKXYKR3ktcivzGpUJBXWTcrgnsM0OpaJN42KiXGn6GU6ZS5+zTlksNMkdDUemJOR0EDIUX@vger.kernel.org
X-Gm-Message-State: APuU4Z+YQthb0feGX85xC1oxCK0rWPB9DCT9azz7vVHj9P7PtWDQ27Ke
	FAYVbJxu8lRpM+1IHXN4g5lfI3yUulcm8kwvk3Nt9foOQOar41jM3oLg4UnZeMLMzrj/aNAomb9
	dekdC3VLalqB3oxWfRyQ8SJ66QHhsQYA=
X-Gm-Gg: AYBFou1qkWWFSsYQtE/qyEmy5AZK/tGEi7l4YmlhOego8rEzioaEkCidTyPtT+4OMZK
	cX6Rm6XdZh8uokva171T1fgpPxkTgPZn/KbRDus6w3FastDmsAYbgX8vkEzqCn6FtEQJ9JuNrg/
	BCCvUgCjZ5ui4XxV9AojcZBt4AqugN8uUuSVc2h8Q6IrKgQoXuj+8S4rp4VdZmye4do2BwIQZHc
	g1Xyyl4rfcr+wevmPqv07WJFdnNqfOjQaL1tT0JEgxtca40MobMOAyXQpH8eAuiD4yRAo6bknAm
	sjwD/ZubOXrMsevqIV3sH/wLFtJEAZHsLx445Wp5wGXWdtDE1Aor5kPsSQKzXdniVtjKquKAp8h
	NXF1xsFOYgKWa2J35CMOOJ7uGHmrE5WckReRWYjuE39GiGqyl1cK7EsHUcmvWbz1QDbfgY2A=
X-Received: by 2002:a17:906:fd4f:b0:c50:850d:7317 with SMTP id
 a640c23a62f3a-c50962e7ec1mr326906266b.2.1794605986507; Fri, 13 Nov 2026
 13:39:46 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-ti-omap-dts-fix-v1-0-19022d1ff4b4@gmail.com>
 <20261111-ti-omap-dts-fix-v1-1-19022d1ff4b4@gmail.com> <20261113-handsome-agate-beaver-a641b5@quoll>
In-Reply-To: <20261113-handsome-agate-beaver-a641b5@quoll>
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 14 Nov 2026 03:09:33 +0530
X-Gm-Features: AclHuK9qMuSavHyZMHRslPpanBiVn4xnkEDEtZmjGZCm_S2Y7T6WYHlCBkoM4Pc
Message-ID: <CAOWyW_5xDrEmuEpm8LKuDKFjS__kJfr=oDLJT5884NTSfuTatw@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: vendor-prefixes: add eets and newflow
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Mark Jackson <mpfj@newflow.co.uk>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 13, 2026 at 4:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Nov 11, 2026 at 01:22:31AM +0530, Bhargav Joshi wrote:
> > Add vendor prefixes for EETS GmbH ("eets") and Newflow Ltd ("newflow").
> > These prefixes are needed to document the compatibles for the in-tree
> > AM335x PDU001 and AM335x NanoBone boards.
>
> I see no eets in tree user. Neither newflow.
Actually both boards are already in tree am335x-nano.dts (Newflow NanoBone)=
 and
am335x-pdu001.dts (EETS PDU001) but they only list the SoC compatible
"ti,am33xx", so the root compatible does not identify the board. Patch 5/7 =
adds
a board-specific compatible to each, so the compatibles are new but the boa=
rds
are not.

Best regards,
Bhargav
