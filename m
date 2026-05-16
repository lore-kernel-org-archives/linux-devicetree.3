Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5907C34DB72
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 14:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778940888; cv=pass; b=DSRkahCBfPivt0JcNvd/3syLym08pXuq7Kc0sAkMUgf3jGZxmR7wC32l2vH5aqpDwPeYVrHmxi23xJaOAwQcTSZ7W1gnBTC08thyUaLj0oX0hdj8ZCEIFQo6jqdcSHNdSa5o21Zeb42u+FDObb8XN/LMcXxTFv6GJ7GrndT+q6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778940888; c=relaxed/simple;
	bh=9L7uSDfYqWpbZbIF7kf11hJJ/d4tbmWtlB4hpNY3gc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5c4ovlZQu81LEIV72gJW5WUl9GF3rlyrULWDTZQ3pqA5wBWQKQOc2+/NMhXJ+F1s1X6aDR7QIlgR95WnIVMDSghbFqJMJngQ7x/Z6hRja2RiXQMJ/cHoy0hjKn5Vr7viwNAMWr1xi/iQ53ZVD71Lj87TM19wieMVtEyPTYYQQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxAEZKtZ; arc=pass smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxAEZKtZ"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-90ca6f20872so257763185a.0
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 07:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778940886; cv=none;
        d=google.com; s=arc-20240605;
        b=FGgsNTcLJnyReCQahyXTa8pVdDPFzEhBP2XAWUlAbNoRCHttTnQ5foz1L3GH3csB3a
         qNXjrPrqhVaMvpuADEBPTYGopQPQYrJjWjg2Bju1LqlfxevsFkeaPYCNrCWqoDpuPCGV
         VLL1aWsOCvoNB4ocIQO5vUR2zD1deRmakE5y9j25PDagvOnYEZ+L9od9JY8N4ZnZE3Gp
         XDzR2DPZLF4DQe10STU0enZK9qWpl57KYCYTy9VLAudRYEuFnSM9evsSZ/E0ZKhACWwx
         eyNAwWhy0dh8JNZsHPUHBhLsgAxFLchILLNXo1Id1l/8zs5Bkygd+BG98mvzE0PXTkeK
         6UGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QNixrMOrBDr2U45lZ0XT+QexEjSwj35RNi4qTyD9BG4=;
        fh=fz2KpU8uJ++NmshbFX1wwWZgyeRegxjVbPQvvYTsL6k=;
        b=JvtxA00HrsLzGq8XfJV01qfver+R/jLQuIP1IvfVCGvz+wtnZuW005j/vEEuoIYwxc
         +eDfuodAYXs8G7xmAdxMhMdCoRd5xw+Y5AMbx5KK4+ffw8LRie1BJv4MULTTqb5EgA5e
         lrXtT5PCdW4ey1xO04/IZwCfKKQg3OzDgpfE8Ikrpvb9prh6OQYg5tHYDSi2foofE4rE
         uxK9RkuAGAkFQAqmzEN0CSYKOzp6ehM+rWcJyoRec974WV/1nqcPMPX3dbIOFs16pMBF
         UccR+9d93PYsTTdJ/mpeGUwfZpc44lk9KPkcsVXrUGD7QczHvdNr7LaTBFERRjIjPedO
         bhCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778940886; x=1779545686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNixrMOrBDr2U45lZ0XT+QexEjSwj35RNi4qTyD9BG4=;
        b=KxAEZKtZguKo3geBrVphjFcKqMlw9CB3tjTkwlPYMM+Oa1wZhAqz/zzZz7A4pJdke0
         sSBbbciQBXUWxJ1VkBPKICc+BRWs8+W5QrH+5ZiziRCDaqvSPIDg4X9kqCmpA7Bw2vgp
         XEiFj2nQM7lEGmV2HkT9rxAdV7AuYeoLIVe9D03zzEWOA4IxnOsGZlCJwgaMVP388AOS
         3WvuwPp5nb89HDJukuJ3KPb4ucSZVvXOX+MJTuoOjeFUlxnJim8mkTzdwPSUKBj8i2oq
         tB5OO5UNWteYbBJ3XeV0aVQ08Vvw+CdfhZwPYSpv3R9y0xUZM+zU6xVuP0p8LUnLtlUH
         MzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778940886; x=1779545686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QNixrMOrBDr2U45lZ0XT+QexEjSwj35RNi4qTyD9BG4=;
        b=OCPNXE1klcdb8x41YyQ6P+U3ga1zoU3qNWf3ST/pMh/RyuYgq95N9bBA1srOBYFjuV
         diNTtA5mQiTJwS2O7d8kZH/o7rd5/y9YJjx2+025hZUOoZh1its6WCVBNXhaskIpvXgw
         acYMcU4xGC5R3gozjOzB7ptD/0m0PwWsDZMUWlOj/4cn/5Vdihjps0y26pikBKIonHzi
         TkSFB8BkGUDAM2olAzZJyk6PE7+70SvJ6Fc+ONxuMu/mBoI3IHZntcsYKbY/ueTUkMh9
         fNZnm5VLZTP05cwes4cPqmx876rFAw3WWuka6wLkO969ymoR36THX0YwXY2bI10l3nd3
         HVJA==
X-Forwarded-Encrypted: i=1; AFNElJ+fwFp2ZckD13AU//ALkPQFwsVfwZ0rtyTAFD8oXGFGsefESGFSlxFT0z2hr2KDlvXYPUatJV1gu3Rg@vger.kernel.org
X-Gm-Message-State: AOJu0YwjbiRbR3EuFOhbnmZBIox9JLZ7G3kqrwlcjc7+bs6S6PZ7Z/UJ
	Aku6+oLOgGwm3XJAnZJfsPj/nWvMGLMmCpYYZi9q8ZNRSZQeB9VIkwKqvnGCX8LCOEaSW32DWXj
	YwQhnd5aaofMu/dILQiF7tjGm4H1UsSw=
X-Gm-Gg: Acq92OFvOmhcGQoMJQi1Wx+B1RaPlKxVqTVBTnmd0Infqait9K61DTUxDPmwylQGJPf
	sffLe7TmX8oZm9hch/wSEOefU1pIfqvaNYjC+xfOy4hOcS/Xp6XVRLBPYVAfhqJyHnH8gfTcS01
	vouPopmen5fVYteBUztaX/CLZ404Y5AmzER1S2V/6EYVdf2eEOQq9w4EKPOsCkphHl/wJcGCB9b
	OtgaYnRf2zrljV9wiWBQUDPryBeDFGMfbJDbYAjjzXDEtEMJvgv+iLhE9GmI/reaFJWVz9EbCVR
	LEAb6/UdzFwojCgf
X-Received: by 2002:a05:622a:550e:b0:50b:29da:ec58 with SMTP id
 d75a77b69052e-516596ed043mr105211611cf.8.1778940886177; Sat, 16 May 2026
 07:14:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511191135.36691-1-vlad.kulikov.c@gmail.com> <20260516124055.4b7e0c43@jic23-huawei>
In-Reply-To: <20260516124055.4b7e0c43@jic23-huawei>
From: Vlad <vlad.kulikov.c@gmail.com>
Date: Sat, 16 May 2026 17:14:35 +0300
X-Gm-Features: AVHnY4JbFfksTAwPYgQfc6zBWXSa4ledaSY2ewxTiKF1bZtGidjLDgiclZF197o
Message-ID: <CAMY8kpQPg9jc7cnY_jJ3sFR7+G_JNxQKkuyRF90guc9jJP02jQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] iio: magnetometer: add MEMSIC MMC5983MA driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	andriy.shevchenko@intel.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

Great, thank you!

And David, thank you for the review and the kind words. I really
appreciate it.

Best Regards,
Vladi


On Sat, May 16, 2026 at 2:41=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Mon, 11 May 2026 19:11:33 +0000
> Vladislav Kulikov <vlad.kulikov.c@gmail.com> wrote:
>
> > Add an IIO driver for the MEMSIC MMC5983MA 3-axis magnetometer over
> > I2C. The driver provides raw magnetic field readings with
> > per-measurement SET/RESET offset cancellation, giving 18-bit output
> > with a full-scale range of +/-8 Gauss.
> >
> Applied to the testing branch of iio.git.  Once the build bots are happy
> (and I catch up with backlog of other review!) I'll push that out as
> togreg and it will get picked up for linux-next etc.
>
> Thanks,
>
> Jonathan
