Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B306F3DE42C
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 07:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778053586; cv=pass; b=W49vapl3HfW2fNlWnRsebl91/GcmhKaqtsz9CMPmeyy86O0zdnepiTpvEHM/yThkTw9vFdja51mdh3rW4ME9pMc7yWH+P3F0baK+VJKlY/TbuEFOfcTkoXCifgYVegKVdCM6lHW0ZYn/nnmygKlR5U5ImLDGfzg8I5KCrfMs6JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778053586; c=relaxed/simple;
	bh=Tx3WeZUNhuBZDbCRie8ddYNOeSRcG90ujTtX2LnV7Iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCKugubtjN5oQ3jE5B5PpKsgUlx/WQfGY5WCMAYJooSScvznkGZ9/CxA+j06+LaZtTGAB7t9oGxKnhQt89fiQg95iexSk0aRQzdfUPJ+7w7eF6BB0YLwQQdXUgR7cl0gchlO28d7OoNiJTft8mhSBkJt0TKefpFScrPepFDGeKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQ9V5fzl; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQ9V5fzl"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a884ebba7dso978269e87.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 00:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778053583; cv=none;
        d=google.com; s=arc-20240605;
        b=hm5uGUb3M8xQNJDhvbTAMjuIzosqvHxVBOg5MpQuvPmb9bG5lktQtFZTqMZ8s/wCno
         8zTqVygs1uMfFIhkRnoCq2TlUuoGs75pxNXYdze3bCUpHe1De9zH6e/qg3ea5IBZ4GNB
         Bhji+dVWDirwlAW5wxG8fq1i2VAXfI15D/p4q+sCmqWYHwNxO/JTBfVVTtsX2ATt262V
         oG/R5n9b+5pL5EIC7Lb3nsGjMMARCt9Edl+NV3n7m33VXXVCKz55pIeSwsr3uN5LLWY1
         h05s3vMGeRi+URfs+MNAI6bA6I+CC6mV/oG/n7GwhtxVq90EGxkBvkAR/cUyVujN1dyh
         KNkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LtNgMFYOhpx95LShPDCJrC6wGLnY6fi+ZP/Q4wbmgYM=;
        fh=qoUcrNX9NAecIJ5ImIhCq9heXcI43+pREsQIjRHdG7s=;
        b=EcEK10ABTVZiWm97KFxHTBxCgucONe57VUQlDUV1DuHbYT84GqeLkk7Nbb64GcNXeI
         PmV0cQcstRdXYzfblH2EZEqpq+Svr8UD1Ww44QRA412ETjhXfFEbgQdQXj6FZOzTACxw
         zxOJ0UpxaDCKYi3wiEtWOVRNF2vrWo8W0wfP2wRgdJ47B2hv32GDAV5dW0mmvH7S6x1e
         FZGeC97rjRLyQXqaQbt8PCwzQLNxvImbN0YP+hZg1cxTMvEgi+Fib/qyzD6KlSlJgJWJ
         RRa+LWvXqof0oL73mBOZaR1h7bRfR6fZylMW+BhErCLOLk22W5051sU0+7pp9e36s313
         zhoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778053583; x=1778658383; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LtNgMFYOhpx95LShPDCJrC6wGLnY6fi+ZP/Q4wbmgYM=;
        b=WQ9V5fzlXWBOB9K1IarwqJe2iIi8ESzapFRZFFZkIvOE8GCzyy7Wb1DzWMA6+v51bO
         f7/vTPLtTGzLWH5P3zR9crsdOkD8NMRG69exxiYXhndmfXx9k3xgRPAMYzjqX8sPiIpj
         QgENld7W18Dyude30cjuhTrgplzsATL/vQ9t2h8YUUVOvk93tHY4+bC/okb/tkqkLntz
         XbCMY4/IHKHID4Kh4294PME7M154rOv4qNIk/j5RUwraOaCSqaxpX9azx5c3Nlfv8caG
         bpRtrXMnu2GVsJvt4STL5/gBcXd8B40Euym8BCrsE+0VloLj0KRcSEEqsoMUzNUCAVgY
         cVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778053583; x=1778658383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtNgMFYOhpx95LShPDCJrC6wGLnY6fi+ZP/Q4wbmgYM=;
        b=D54LTWBiECIoqhHjMAjSX8zVhxcbgnp/wrOnPkmya4dsVFfVtzAymSNTxOaJOzXn9d
         gl4oBQeSPJnrsF9YRFXUOgWhOHFKY1tOKJiBfpBKinBZcpT20qGPS/urBir1z+YjXN+1
         xlZXAEed4JDz/yXNhSnk24QOB9lZI7PcW0JYWgfP6qZLNAFo3/UWD4pjA9Q0sx8kPBka
         EidOD6HHpTWPBkynu9DngE8ugXyxcU80ldSg2oHDKkYiKNACtxT6JHH5aYYf5BxLchTT
         d/FBVRLVWYjmvABEK50q9gkbuwIgt0+3cS8zPSjJDpv+7NFb7Ujs9XZXg1eT9kakUm/o
         IUTA==
X-Forwarded-Encrypted: i=1; AFNElJ+FrcZAiqu1njXUOZftGHQhYZV3Quuj+5YBuH5pPc+0otKZ25NMnET+s2necKB5VyJKlaS2znHqoyft@vger.kernel.org
X-Gm-Message-State: AOJu0YzBjwKuYBCln9rhkKDpASzwK8TazyTaG5YCQKhz84NOAaODyurn
	7HBAgG5l+almqa1kqCu3cmKsZdeexfLuC6I0kmviizXiLzPgym4X6MF7wDRlRX4G+9FJo52fOUo
	mWYHMBxvGAEclS97QYo7WsYTsVG+4t0Q=
X-Gm-Gg: AeBDietePKCS/cPANb/nxZuG4V3B5kqa+EHvNMyJ7btxaT0QBNWbDjMVLdKFQsb0Ado
	IIQKbuxIv9ByLfaewplTeItLYRZjRe3JIexEHPmdzsVeoGZzsfrAat8ClDOMdwp+P9H9QkR0ROV
	jm7Hg+E0AXtck0p5sl8CjqwU9nyQmbZZ8ByLS6SxlRF6a2+g5d7HShMA+wYBheF2SWqwTCzkL5A
	iFQLMOsw2csFKt2NhMISMMwqmGxzqO8X8T+59nQeRot4jl79HWY72ZAKhJrMPFFTduBS9+QquFW
	BRNSo6TvFWLc1u6D3lwf
X-Received: by 2002:a05:6512:3986:b0:5a8:5288:5bf with SMTP id
 2adb3069b0e04-5a887ce5fdemr740855e87.28.1778053582536; Wed, 06 May 2026
 00:46:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429132234.30514-1-muchamadcoirulanwar@gmail.com>
 <20260429132234.30514-2-muchamadcoirulanwar@gmail.com> <5f126a59-9f03-44e3-b4cd-27f70bd9840b@linux.dev>
In-Reply-To: <5f126a59-9f03-44e3-b4cd-27f70bd9840b@linux.dev>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Wed, 6 May 2026 14:46:10 +0700
X-Gm-Features: AVHnY4L_5pgV8GXOjPv-2E2wKzMdg04ytr_7aXwttrNdCJshMRLa8vrmmICm4kw
Message-ID: <CAO26r3R_TxwMwLoJMqjAG0pd2P__V-WmGkTcrZFt6CQwa2y1cA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] i2c: rust: add smbus_read_byte_data and smbus_read_word_data
To: Igor Korotin <igor.korotin@linux.dev>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, devicetree@vger.kernel.org, branstj@gmail.com, 
	lars@metafoo.de, ojeda@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, igor.korotin.linux@gmail.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 17:29, Igor Korotin <igor.korotin@linux.dev> wrote:
>
> Hello Muchamad
>
> On 4/29/2026 2:22 PM, Muchamad Coirul Anwar wrote:
> > Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
> > ---
> >   rust/kernel/i2c.rs | 24 ++++++++++++++++++++++++
> >   1 file changed, 24 insertions(+)
[snip]
>
> Thanks for the patch. However, we've previously agreed [1] that
> I2cClient should implement the IO trait [2] rather than adding
> standalone methods like these. This patch would need to be reworked in
> that direction.
>
> If you'd like to take that on, feel free to submit a patch series
> implementing the IO trait instead.
>
> Cheers
> Igor
>
> [1] https://lore.kernel.org/rust-for-linux/20260131-i2c-adapter-v1-4-5a436e34cd1a@gmail.com/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/commit/?h=driver-core-testing&id=121d87b28e1d9061d3aaa156c43a627d3cb5e620

Hi Igor,

Thanks for the review. It makes sense that having the AS5600 as the
first consumer of the Io trait would be cleaner than using standalone
methods. I'll rework this accordingly.

Quick question on logistics: would you prefer the Io trait patches as
a separate series, or bundled as prerequisites in my v3 for the AS5600
driver?

Regards,
M. Coirul A.
