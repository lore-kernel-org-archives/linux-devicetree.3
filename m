Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7094735C181
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516595; cv=pass; b=SapaBvTTIUMLyDEAAXirfPWtjboGqXe61ElXb3lZS45hgN9L5+WxcC3YVDyrKd2Ol1Ab87SemZmGL27OahIr9lesZ+Flpq9k0WO6LcE1Wzr8iIQLgqjAQzI2iMqEkKnxeCtGyBhKKnvoomdj9YB/nz37q4EAB8QyynJI1S4kmJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516595; c=relaxed/simple;
	bh=jKtfd7ltufCd8Kwzt8vVP2Wk3ili/vgHCvXxUlPxLTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0u0p4OI4omsKPerKexsgWQK7x27sFN4BbJeHefNcJ0ppat0/Awxvd/V3Hrceb3vuPFJgrp8EdTThpp4sy9Dw1a23CKNb6kRIAddmV83RsX+ixEKR1S4z1N9F73g/nn1/ktKYNCcNq5JAGtoUQodk1eTVQ2MWAT5uGZLZhmCGwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiKztB8M; arc=pass smtp.client-ip=209.85.208.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiKztB8M"
Received: by mail-lj1-f195.google.com with SMTP id 38308e7fff4ca-393c93a0166so46294931fa.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:23:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778516592; cv=none;
        d=google.com; s=arc-20240605;
        b=gDTt+y0rCtEGMv1afD7WKGpNRKwkxChe/ed9NyR5ZGUWN9UQOTc1KSMR8HHISDmbqU
         JTNcyt6al7K15MFrrN/8gWeVbdY2tsetKmKR4HKFA3ojVJ6LisgHtvjYTpAYg5iFOK2M
         MW/D76ueAZ5GEV3QjnMhKJ9HQeqjXaa8/N3GNaRbF6IFEegtUWv+XTyr7A7sRmrkd6K8
         rvBVy1RMx+zat44uyTybBpi9t1m301nfs6pBTTogi/u0YM0MIG02Ff/mqbv5W9CxsPLu
         dEB5h0ZflinUr0G7GKIs2Qym/Y7SPofQg3bNq6cDOFyQCmqIt7BzMrsDSBXaFPxQAwxG
         4dog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jKtfd7ltufCd8Kwzt8vVP2Wk3ili/vgHCvXxUlPxLTM=;
        fh=VSn36dOCh07vpkVU5sldYnCtj4sOl2LQ/qiLoXnaU6c=;
        b=Ez9PZ48LVHx9mTQHD5yaP7cYqiBABVEGVLfVjNRfRetpZwclC2RVkBGH/2pVdDxIs9
         RZLmy6A+sTm6kHrQMhyWT66+gNg82Nic+ij6hAmLwjPerBKfyIoR8ZC5fv64ISuQXSTN
         PadCSdscOb7n514auffmo+W6SS3zr03FSw+0WiTNTeldtnqthobeB7YOrkFhee9K7Eqw
         qDWt1dlwhxGKA6ACcvzXlPg244G9jasQQ4H1PvK5N0WU7KnCowjLe9coTkLNfMco83a8
         qSpH5FYrSlPRJUQ+EzrzXjzCYrFATS90ZdtGZIXpyYt3ke7oW/DEO1O5TtstTSHV4t78
         VJlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778516592; x=1779121392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKtfd7ltufCd8Kwzt8vVP2Wk3ili/vgHCvXxUlPxLTM=;
        b=RiKztB8MYN7d4+ajKnLbrzyIS3KQiMFT2cYHEiktr75ZE9WxDwWUtkxKvWplKBFkZT
         RwaQPlXmWcPYOWLiFHb7O+QSd+dM3+mWzn47cDqKBvPWNpLqP09rRd+zlIEp+yHAHgvW
         FVXaIjka5+HqspLI0qM/VgHZxHALvOB4we+eefc3D0SsRAFCTX+ElDtEtYkQJXfAn/eo
         CGkaU6B5af+aTqMfbw7vbSYruq7UyKXfC+OeyPSk5GuGxt+KH2OtPPLL9wdoxU9YGpmG
         0kInyO1FnEAoZfhUHDoaZhiFJZX68l9s3KpITYaUDgTGYKMErStmYIZT3Rjdy4bCx5o8
         t0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778516592; x=1779121392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jKtfd7ltufCd8Kwzt8vVP2Wk3ili/vgHCvXxUlPxLTM=;
        b=UPJVwUIAyxhNxPAuwV5FcEscfTDJ4hM0jtOrYStK5jqxzaif0pw0+N1nvbzvi5Jn1c
         PRYokV5+JrcSyaZRMkwE69MCfZ70x4utMXO+uucB6RwnJ3QT69ubkXxBFCDNhPduyN1d
         r5WwHTM+81+fEVrev4Z3/YttJO95FsZ6ID0LDNDKRC88LD4mQiHxgCIKUXEv1WYBJLqW
         lkjQHnGgFm8agOVD+qCJf1aoxd5wMKaoH5mCFDj7RHTuLlPuV3jJfzX1ymJ6opdrEzb5
         0cgb2gSs5lwysWs6QbUi+2Qe6zq/4p7ctF4ODo5nU+v2RUp/Np/zEKXBfEl+MVjrxRUF
         cV4A==
X-Forwarded-Encrypted: i=1; AFNElJ8fqJ5moBb1bYxxUkPfWiFisgKjvGB8Nq7wY48t+9szT3y4EKURcicvh5nygDA4X3FhriqhyNwluztX@vger.kernel.org
X-Gm-Message-State: AOJu0YxvyvROLx32b6B2Uml2qH+XkAGPpA8td2emjB5NGrnXJfXL6n/o
	suG29UG9nE97yxKijDi81vSkUHxEF/5VRNHDH1NpughNYOqqt7gkYozpcnUBAqZRFAXt0HBQ56+
	NsrOLwyX8T1LWXoGioJNPZdawFKju/7/PHr/fiwE=
X-Gm-Gg: Acq92OF/AmLsS84q8kbmP4lNOuf/qJ+lR/xghZr87vM+WFYDedn/FI3FCvs3DoqHLS1
	KQsqzgG5MhE4+CuJVgftQc4BQy0cNax8KVsAbS01isuYkMBOFqINv+Qj0kDqBPTVbPcrInwXTIh
	sDUgA8ga/5mV4uiEJbR0s7rfqSSA5dBIoX5F58XOygW2OPAtpzQs8/jNOZdKsxm45Jt8ZxQZygQ
	ziiHvr/q/LtlHJxC5NaOdUTGeXSa2AYPXDrbAx0RSre+EUoV/iOQg5oTIKaPvUTAKkdYAEOmOVW
	4IdiPNtj4LZbT/knIN3kyADuI27yld5K/9BnSRIZ8a/EIsLyAP2n
X-Received: by 2002:a05:6512:3b84:b0:5a4:11e:5c7e with SMTP id
 2adb3069b0e04-5a8b6c9d5c7mr2666988e87.5.1778516592291; Mon, 11 May 2026
 09:23:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509022718.82957-1-dennylin0707@gmail.com>
 <20260509022718.82957-2-dennylin0707@gmail.com> <f6e2a4de-4c1d-46ef-b383-db62091fd0f4@baylibre.com>
 <CAGEkeHfeZWi99TMvkXHhMSrUS8PshuekqjszBXaS39VsLUZ4eA@mail.gmail.com> <3493d6ef-5f02-4eb1-b81a-89597045acbb@baylibre.com>
In-Reply-To: <3493d6ef-5f02-4eb1-b81a-89597045acbb@baylibre.com>
From: Denny Lin <dennylin0707@gmail.com>
Date: Mon, 11 May 2026 09:23:00 -0700
X-Gm-Features: AVHnY4If-1z7wpsY5leg3b5K7tW-GzwRZV047ZkiArkvnziT1qHja6pu8cjzndE
Message-ID: <CAGEkeHcA+aJ_h5APbL_bG3vpyY+rSGEVn=Dk1Abe76MKDdyVpg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: iio: adc: add AD7816/AD7817/AD7818 binding
To: David Lechner <dlechner@baylibre.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 7:51=E2=80=AFAM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> Usually, we want to be moving the drivers out of staging when
> adding the DT bindings so that it all gets reviewed for correctness
> at the same time.
>
> Drivers in staging are usually there because they are doing things
> that are not actually acceptable for the final stable mainline
> version of a driver and need more work.
>

Thanks for the explanation.

I took a look at the driver and noticed it still uses the older
IIO sysfs-based interface rather than the iio_chan_spec + read_raw
model.

Would you recommend updating the driver first, or is it okay to
proceed with the binding separately?

Thanks,
Hungyu
