Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5A94D6C28
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 15:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350987; cv=pass; b=BzAZ1x765vaWOJahALmn2jqVM7rRErzLUilsrypKeIvkyMrFHmVagDXJdlbbd9//qP1mi135JYS5FLyyX0PSTaFvSH+JvLhwiTupme2K6YTnk82k1e3zjUQC2TAglesuYSzogyMJ6jvbzj0wOcmdd6DBWbeChyWqvme5gnavbAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350987; c=relaxed/simple;
	bh=YdJbeVGqh9AgSmmj5nG5sf7cECD5ZVbeKNl4YktWcOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKcHk1ywp1B7K0LkSHv8VC34evvMToz84eKyg9Oc1XBKmsJCOEYpvLcbRPwAHHzO8kkjsMylzpgsG4pLK9I6Epf+ba5VaH+bOi1joQgVllTMf0CFSVcWJsSkI2Ipsbw0sERDzlieA3dj/NndD3SmLZP1Dm7ZJi0rpzuO+dAHJnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=Ghur7AVG; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="Ghur7AVG"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aafe2a64efso251493a12.2
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790350967; cv=none;
        d=google.com; s=arc-20260327;
        b=ccN0nEdq/pqJMYWFi9QOnBRo1fH+lIuSJHiFdxQ7A7MrJPZVuYi3dugH1UJGdRZTnf
         PR59BGo9bQ3Mh8Zi1k8z5055t9uiqdn/lhGWUAfy2t+6oVBj2b0Wu/z6C7KNMfZnX6GQ
         9IOTh/PP5td2kOTLEJ6shw5XAzkixbhS1TCOXJ76CCZsjlbt3IokmdHy9uvYutwegmZy
         i2+5a23Szzaa8VMb+hnwjFVG4lvcnNR1yrscObPqO7mKWONpdkhJvqcWhd5Di1abodaK
         X3nKYqhsAK+Rc269Guc3W/ewhJeGrq2US85QicJJSmSAXhqNHeFDRkEHGmtE04KAbbDR
         v92w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YdJbeVGqh9AgSmmj5nG5sf7cECD5ZVbeKNl4YktWcOI=;
        fh=P1jdCfl7Bha81rNP4HqLBnn1V8rrBI0Co7gxL5cX34k=;
        b=Oapm9KnSPlm0zZWUCD58WEuDBpxvOVgD3hpu1x81z+cuvkogtLokutecFfIxYAasXJ
         CjxSyRIptvIR2c5fPNw+yRh9sWebsKOlS8rcn+J5dr9l/kKsekeK+5CJ92YgPdjSrj8S
         EtmUMmuL/J+7KzCuKZh3ARqtYrulTtRs1t2M1mQcOFESnqxUgUDoPC1ajzx4zsibwkD9
         iDpHRF09mx+aO+Reib2z29Vymm89jBeq4g2WI8GWndD34xpyrDl5ztTlTudZ2MIV+Iev
         Ch1e2UbrggDJO/xCr2lO8lR7530gd3utc0+ew97ArWI6ho3tmHHHtpLnlkcwYFuz6dBF
         L6LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790350967; x=1790955767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YdJbeVGqh9AgSmmj5nG5sf7cECD5ZVbeKNl4YktWcOI=;
        b=Ghur7AVGaAGv7aj1VLmHVIHmdZRjM0EHqIdBNStVlKO3HzXNYvsPD+dOHhSnFwood5
         rbGpiQS0KygzjJs6oXCI2MAOF217jSTgrb9k7LxrvFRM0d32hG91+Nao9j9XLG9Bzq8J
         rLT/nQ/kAa/J2M3wVoIaAFdeb/UxZwXYhfAQRfQyH3DZ4vSG/suY2uHfjQ/cQvEt6eIR
         qDgXzUN8rBdyn46kzu8UceLnEAF5KROE0h7Xp3e+oW379j37gXwu1Zp8FAvgXTeV+WwR
         gqGAjVjrSs7gcNbD+iXNQLA8YoacfZDv6aCFhPo8qhF1k+QqM9NvvncaAACEKMDcf4JP
         NfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350967; x=1790955767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdJbeVGqh9AgSmmj5nG5sf7cECD5ZVbeKNl4YktWcOI=;
        b=IXXcfJ/A1y+Ss1F5qotEk3CBCPRBS+SpwbKOqynloAgq+0AkdjtSrvKHi9ofAjHxpi
         0Delx1vakEQP9Y0l97WaZflsiQhN6u+zJgGMcUmYBgQYiEuCypVsvgw9dEBIY1Pw1PG9
         kvz52/GDsfE6QgjDDv6eUMcgVN/RT8copXmPz8e7rAr28Xf9x/pGxlIPRPk4n+4uIr76
         N8FyVSh8cTKmTk4hXJ8G69fIcRsF7ERagmcEgsIUOLWocyWV7WZ2G2l0czt1wfcf78ZE
         Tlhn5wRDQcGiPFG3sHSx25GY5n/Dy5z94Nw1jgBxFrIy/17yQwJGj8kFmzQ/3WGLbDmv
         5QKA==
X-Forwarded-Encrypted: i=1; AKwUvBz9dJ91eR+CuPc49e6hb4+/dH0A2/Yj4MqfvoywF4LaE4MzhSe/XLXluf+ei+G74XvcVkFU3rsTUQSP@vger.kernel.org
X-Gm-Message-State: AFuF++l1kwM4N+/MaglyAkBhGJRo+0ofbPqESudn/owxW7ZH22bQAsbQ
	ocTPdpU+A2vrn+oYQjknVkZx1ltqSJO9ZeeDAfqAUqsLqhbkGBbevB2x5wDUH2INWGvVKW8Em6X
	SO5YZ6/q+f59pZUKT6uKebRucalED9D4Cv0cMSYxfDQ==
X-Gm-Gg: AYBFou05mXTq99Dy8m9dQyQ2hBYS6ATHnCI4qtPJtCU/AcLnuiUDc5Ihh5uceO4vFMe
	6GyD6n/b/feHhNlFbETAn48hUKCKRdjKlxExBsc4OUI2txey/zcepK+ZHCrm1vejO7hG7mEWcDi
	OZC4ggyzwThSr7Tppvs6f2Rmc7z5EpMw2ZaYdYCKOPdk1nqRBoKnGyvvbw9Cam/pyjW8MxzwPah
	316a6rRoZVFZrCjlLVX/kwgPKkaHu+M/dotuNiNF/rnHhuugIimx0+DdplUUpx3boqK8Mq8olq+
	ZlD5qx7vGwEtKQ1TJQZ4cQUr2VjA3S4pbF5OE0m2zRG5mkLG6maLPlP4
X-Received: by 2002:a17:907:c308:b0:c28:ec7c:27ae with SMTP id
 a640c23a62f3a-c2ac5396f65mr492269466b.25.1790350967019; Fri, 25 Sep 2026
 08:42:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924071445.441822-1-adam@wermuth.pl> <20260924071445.441822-2-adam@wermuth.pl>
 <e03db2e9-085b-49ff-8d4a-bc112bc4ddd7@kwiboo.se> <CABkrwJ6uvjS8bez6j0MZbp2Y+O9RhyU09YOLrUzHaeUEVC=Qkg@mail.gmail.com>
 <arZ0nqBvHDzSbZOE@venus> <CABkrwJ5xdMcRJsjubSJcfMkTs5CzKdAvQK83Xar3gZPvO_wa0w@mail.gmail.com>
In-Reply-To: <CABkrwJ5xdMcRJsjubSJcfMkTs5CzKdAvQK83Xar3gZPvO_wa0w@mail.gmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 25 Sep 2026 19:42:33 +0400
X-Gm-Features: AclHuK-2aRN6dX_Oa2Kxhd9aYgpoKvv0HzTIcerNNDpaAcjfSDE1KhpeMcsyZ5E
Message-ID: <CAKTNdwG8YB7j-TrfJUr3f=7OBYC1Qx55Yu7ax=_C2NOtgNVrvQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa
 ROCK 3B
To: Adam Wermuth <adam@wermuth.pl>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 5:56=E2=80=AFPM Adam Wermuth <adam@wermuth.pl> wrot=
e:
>
> Hi,
>
> On Thu, 25 Sep 2026 3:26 PM, Sebastian Reichel wrote:
> > Why would this be better suited as an Overlay? Nothing describes the
> > specific card plugged in as it is auto-discovered via USB. The
> > overlays are mostly required for things that cannot easily be
> > auto-detected. FWIW we don't have M.2 Key M as a DT overlay either.
>
> The overlay was Jonas' suggestion, so I'll let him explain his
> reasoning. My own understanding was that it would avoid powering the
> slot (always-on supply plus RESET#/W_DISABLE1# hogs) on boards where
> nothing is plugged in.
>
> That said, I agree that the module itself is auto-discovered via USB,
> and the Key M slot on this board is described in the base DT as well,
> so I'm fine with keeping the B-key slot there, as in v1.
>
> > Something to consider is, that for Key E and Key M there is a proper
> > DT binding now: Documentation/devicetree/bindings/connector/pcie-m2-*.y=
aml
> >
> > We probably want the same for Key B.
>
> Thanks for the pointer. As far as I can see, a Key B binding would
> also need driver support to handle the supply, RESET# and W_DISABLE1#,
> so it is a larger piece of work. Would it be acceptable to describe
> the slot in the base DT for now and move to a connector binding once
> one exists for Key B?

Key B binding would be somewhat more involved than key E or key M. The
spec defines 16 distinct interface mux configurations selected by the
four CONFIG_X pins, which neither key M nor key E have (PCIe vs. SATA,
USB3 vs. SSIC, different audio configs, different I2C configs, etc.).
So it's a bit more than the supply, RESET# and W_DISABLE1#.

See for example [1] where just the PCIe vs. SATA selection is defined.
A proper binding will be needed sooner or later, though.

[1] https://github.com/flipperdevices/u-boot/blob/rk3576/board/flipper/flip=
per-one/flipper-one-rk3576.c#L41-L172

Best regards,
Alexey
