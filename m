Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826E34446FD
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785839942; cv=pass; b=BEfuBw2IyNicDp4cx2lHCRGW9+cM0wVW/0Ri/vPBJrq8LXf6h2vg+wwp5D8gqaoaK5RDxqedBQb2uPHBkl2Y9OFyAZWabFCeOLjHP/SYevdPtK0kkA2J2iWWT9QnLraEXpJluBF68f5ysNyk4id57gNx+D4grA5OC4ZVkvV1tbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785839942; c=relaxed/simple;
	bh=YbVdxHiCZY6RHGU7G/bJDm4Z7qaf8FZncpTD9z2Kf1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRSdYELSzmUHdRw2Qy+3QsBT6HSuM75MF4MeVngoOz1FmwEsfvQucrFdAcxIelQQLfT4/RinnOLm7hfbKbY9dzmZubkDCDIv5krkCsIRINcjiLf2bnQgtozhVW4U43aT2/Nb6gCkvMSibPhgLV9u8Q+g8BwvpzFxaZpJp7hEdFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZXGKBUO; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZXGKBUO"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15e2dab83eso630287766b.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 03:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785839939; cv=none;
        d=google.com; s=arc-20260327;
        b=ADLnGeZT+aMmaWk8GveDhsni5Dd8RF68jci7J/lY2ll+KJfa3GcNb5gWx7ZVIKwtBS
         B0Gf4XHmqItD9QrOfxnNEtYUGPRlesffn5WMHjtA2fFAogACXsGrDw48SXTBuCJ8KGmv
         kJeRMqinemDqcqVDgjp94Aw6wXF57TlkLv+suJbzCvRYELljIfhlzrzitQK+1LIyBNKr
         Z92UyMg5T8pp0Hg6k7ra8pD4rQJ4U+QpCG9ETJOyQ6kbaT3K+6NVdlQfZc7cqm51gMpo
         Ctl6R4YHRivkcYSK9blA2yLLIkUPX5mnVHo/pgyWg5lY3xWZ1e+PllVS21FtJtHQBVUi
         eJ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YbVdxHiCZY6RHGU7G/bJDm4Z7qaf8FZncpTD9z2Kf1M=;
        fh=xYA3PWQRJohgCzE2ArRpLtOd2+tqk0H59ZASuvK+9Rs=;
        b=XNf0PaweFSVVsTnN4ZMLbQuaUlP1COCr1V1oZcSEpMr/cIU4DVq7/E3HmJfSnuRyca
         AKpC69Vvey/tvZlZP2ljeKLqt1weIAGsTNhUd5HmIN9I7/DhM8fH6Yo6ZVRjbaYVGPJ6
         STgg+jCEP0j1fGKkCqmKzZ5p+zYC4CPx4mrhW8O3GlCqAOKYFrLOcCALeOqdrvlpL58M
         qwGCK6k6W/dhxNX9rF/CCiOe9ErkKJBUcvxFrtpAEvteeCAn4uAC1onooiX7B0FMLUr+
         JM1xA6cxljHR3J+2Qsf9fhHPdFuioEoNt//+CJ67gWZ8SPcLI+Vj6uMBkYiotd2U0OQb
         rwnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785839939; x=1786444739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YbVdxHiCZY6RHGU7G/bJDm4Z7qaf8FZncpTD9z2Kf1M=;
        b=nZXGKBUODkcamVQ59t9mpb/Q46+LbFfWPUdoCwcBm8SS+f12VFJvpp7dVfi3zZNerw
         Qqe9kOM4n3RbM41XCzj/UEm5iDXWdp5dm2SJd+iAP/LXdv2F2aUgzBLfdm2RfRRrhP0O
         j4BJKMegl1hU2qHjE64+d7reWodFdsKd+Jb04KqdIU8sVvKWytpfzJJxgZ2HZAreAnQC
         gUiXHGs+KBNLUPrRjuZgF+hJq+nJo3fXbihLFtSiNfYB+1E6ikaoAJrFK3V3V04OTJvI
         KgQbm66mMqOREHlRBWgBfWem0B00ggs9MLYPe6MhR1Z+WJROjBl3AgaDba1QiEXxpvGP
         6GLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785839939; x=1786444739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YbVdxHiCZY6RHGU7G/bJDm4Z7qaf8FZncpTD9z2Kf1M=;
        b=dtUbji9k6mRE+f0tFJ6KJLolyUoqfbwVJlW3OVwdiDgEvlwkNbeKt3PrpWGTKdhJNA
         wKQBAPS22vxxsquNhMAuSeMveZRqHTfitar4YZh4ddrAmB1nkAOxhxQRGZD6Vp9yGmvw
         eIoMANOhVnhn1FdTJJvyoK8bhMg7Re7L62/FXyOIFxacEhBqJYNNlWGYN63MZQJCd+vj
         hCgUWxuQZzKkUPKUVo3TwRbKLBC6lHc2NQOi8dI9kWn0Nb0vbWEUaCAEKXkerE2tqcFE
         9qHdvMKDzsNKigIycrHY0CdBC+7dAI0MzBo8jFW/dkmfri62+Ivl3AlIKiReyjXWesYo
         1XBQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCWSv+LuIlaRCGSPBoNrUACHKwEyiCVhmBrQz/0BkI+zd/RUguoIb8rcyu+XxxJTYsas4sB2Z9Gg/N@vger.kernel.org
X-Gm-Message-State: AOJu0YwAEPFH9OrO3WQpozEwNxpIx6Xt5rtd7rPp1xad19H80poc/N5W
	tmIH3tuE0kO1hafV/43s1X3s3hCD4WTqm91amEUWEg8drDUbmzIbVXPkQD5aSI6hMvIXVVDjC7M
	J3LVwbYfS84i1qhjWcvnPtCWN60yOdVApgBLV
X-Gm-Gg: AR+sD111HT26+1F8Ne6ldTeHrJfZCcCMnIYCPXVQEZw6aD+FRoyFIqPyQ4bvyGhNyu+
	SVXAjTiRRRWbynkufA53brAfcZqMtC225w8EVugZgfp9OMTPH7kD3+Ux40NQWzCBLzx50Jrc1Tx
	WC9JMSBZWfOfrE+UvF3NaZOUDtv4FMVRMhJeXNqbMFt7JqfxMDukjsH6tEdw3w142rYtsTLKSIX
	5RtNa4vxDmMz1/M7tW4i9MkhsJfi8LDM0foWZfKW8wjW5mSptBsKn0CMVxeRha2p0uFCw9hQUA3
	5XjR2TpjMdrOSVl53cjQVtK5MlOVWZBXo4Lb8H9E6APLJA==
X-Received: by 2002:a17:907:76fa:b0:c19:fb6e:5ff0 with SMTP id
 a640c23a62f3a-c1fe81a5d9fmr1017103766b.15.1785839938403; Tue, 04 Aug 2026
 03:38:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803101734.270821-1-a.shimko.dev@gmail.com>
 <20260803101734.270821-4-a.shimko.dev@gmail.com> <20260804101756.F350A1F000E9@smtp.kernel.org>
In-Reply-To: <20260804101756.F350A1F000E9@smtp.kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 4 Aug 2026 13:38:46 +0300
X-Gm-Features: AUfX_mwfcSVcebTIErfjkkWZbedHhg6pzo_BnOzwwfFTZmY6o_KUALSIaBBb6ys
Message-ID: <CAOPX745iC9w_7=TsO317GK1gBCg1zX-OvMF+oeZZaA6501zZcg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: phy: add DAPU Telecom DAP8211R(I)
 Gigabit Ethernet PHY driver
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 1:17=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: Low]
> Should this exit condition explicitly check for val < 0?
>
> If dap8211r_read_ext() returns a negative error code, this loop currently
> terminates only because negative values in two's complement happen to hav=
e
> BIT(15) set. Relying on this coincidence might mask errors if a different
> register or bit is polled in the future.

The driver already checks this after read_poll_timeout() returns.
The check is present and handles negative error values.

> [Severity: Medium]
> The function's docstring mentions "Software reset to apply settings", but=
 here
> the RGMII configuration is written after the reset completes.
>
> Does this PHY require the settings to be written before the software rese=
t in
> order to latch them properly?

This was already discussed. The reset is active low and self-clearing;
RGMII configuration is applied after the reset completes, which is the corr=
ect
sequence.

--
Best regards,
Artem
