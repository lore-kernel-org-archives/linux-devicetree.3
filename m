Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBE42D0620
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782305306; cv=pass; b=nsgQ3ax83XZrajgOwF2llZjrqfhvFF9Vb4EkvHYaNLQL8ZIbyEm7M7JctfNr7/vd5QCUb7t510EZVQ2+ztEk+sLU/18ifXjqPVSZnRaw2I27j5JY4Vmw/cp6WTUL6Za7fyiG1HjEQNV0BM88EY3Zkw0KYeyjTHxFULNRg/9YSCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782305306; c=relaxed/simple;
	bh=e7crjkX7xxDZ9ZyGUXr6JqBDMyWiaXIEE/qm3XJmLi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skWKcbdnwhXkvwPAbzO8mUN2522iHYcJEmBf6lTjwiUfCFDKhzic+IGFQhJSZ8EmKDTtCbdqfD1sT8szlHbRtFTgx3WoBCSK474kjdJXURHD4i+W8RnUj8P0bFhvBFYKh2YR5DuU6Cm3wqM4Ui6j4GZheDzcmEeoiIejFMPZI9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Xn7nVI8K; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Xn7nVI8K"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4629051c946so703630f8f.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 05:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782305303; cv=none;
        d=google.com; s=arc-20240605;
        b=JlALe02JhiAXu8EWQfrIIuYYzA8v8/vJ6l1KCQJiFV2R5YWvEgaYTyXZEU91s3dv44
         zk68Pge1oEoj/22dMPBfwLxs0TXmJBlBTwppEozErd7mtqKd7M9ob66m85aQ4L/smGC5
         z8KECzSdEzH3c3K4hBvbeUHAG0nnaodYLkuQ5u5zHBs3rL6Yo4dOcqcIerzEz81Q9aGE
         kkydHX6YBnYL5yXDb3CQjJCHjh9N/+VIC1JTYUzGGiQCTzJi4pFezcrrZHhv92rpFNgR
         FvcuxGsClZO7JaXiRyzw5OGuUe9hht+RAkIlZTDMLtsIE9mNduJdycpjrLqLZ+f4rAWw
         9GZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e7crjkX7xxDZ9ZyGUXr6JqBDMyWiaXIEE/qm3XJmLi8=;
        fh=SbDWy4h/wdQKij6nSrg+ALz5qpw0NkWfzgZKZdyPo9c=;
        b=AZpbIucflRThVq+EOuvfWbp1nIblKHKyBPDGG0zEE9v8n7kUJiBVck4q/wY+ZFha9L
         J8UtcJVk28hGt87PeyvN5OD7smRRtQjzTatbsbadkSvJG/L7Ty6+/QRn2BMrrpjDjpb4
         9zdagMDTgnAYtldWU9NmOYe7iJ5Q6U21BnpakqHbSnvJLESFE49brN8lTN0sbLaxb4/C
         Fngg5xyWXYfZmBRnEi1YTighYcYy/TQyvcbXgnjimdeNDhhDnFbTddaxyD3YW8wyngny
         cmdk9GeKQn4l+o9CW0/pI4sQVNbOgov91xMv+0waqWDvUnzOIwLzEEIiAWtQ7HwQNJCh
         evag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782305303; x=1782910103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7crjkX7xxDZ9ZyGUXr6JqBDMyWiaXIEE/qm3XJmLi8=;
        b=Xn7nVI8K3anFLQa+LVH+GlTIy/G2oQWSm1DwdLGwT+wyjUu/rYlUNRI4n1PeiGA0kW
         aEIMlXnszyC9MMEujuEwkZufTTXYn38xjEyGwpLKHpZDirzGKD7WfSv3I4+AoS5PDo/5
         495sEMaQ+d1Z5wRBJbZJxWu8zSouO3QhGPxbkl2RbTbr8Hau6uTPOU4V8cHIzQROO4u4
         e1uumAg3+UPVYQokbAn4mq+hLtDISVN5rsD4rliqQEhuEYk+LApER84PvqHWe28JbvY4
         k935EnF2fy07yr52X1RFCOQ4/4zFYtm89MX12a6tM5YzJWc5Hy5RNupclIcs5Q5VHURi
         87/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782305303; x=1782910103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e7crjkX7xxDZ9ZyGUXr6JqBDMyWiaXIEE/qm3XJmLi8=;
        b=U580WvxWsGhuwQDQ3fpp6S08WOHJNiK6GPnUUDTQo378cFkWLvXsMtTTfaDYKWkqFN
         1+l/ahsqRhm7pJjrhsILjPjh2H6Qj0oRDCr+5Rtj0E3HgHVXlKL0TVjrUyfKU0N0UZnE
         Q3ARmjBIgvTRCXo7ERiia6kJVfwn5LFNYmtRiMyMrmlZL3hnOD+7GuctWScHL8L0OWMn
         sqze3V1TofXc8NVmG1HjpbE+8W7nCzl6fKyRz6xkC7kqlSm1CfovQWePCJS3gM40wumu
         NjJBzd5iWmJB8Z08KvmP3fMV9vlKl+F8IhPhGtLH0bK9e5XYSl/2Y1RYerR9rkCvkWus
         j/Vg==
X-Forwarded-Encrypted: i=1; AHgh+RotKtjtnW5RCRwHxjA9EPFTFuYuIce8W9d7t0YmJJYItDopdfFi4rBfJfXjxt/HTB3lbCWQ5L5U4Q93@vger.kernel.org
X-Gm-Message-State: AOJu0YyoP5UM7Bnu85H7nk9hXXJvZvUVTAvaHRC8jt0FglL+iq70jpRi
	sRLdO96eGtyIM8sbDVPvnJo7d9+LTsQLYhHKWLEViOWgxpjbfBDD0mUZvY3Pmo2GQSO8C2GDsh5
	x81otpuJzTfLYfdv3sNlJhuo3dh0LHsjcNxLqeiMyXQ==
X-Gm-Gg: AfdE7cl2sTMFqXxYBrK31QnyTEAdNMh3hO6vwZzFoYkaJ7nRgWftHxEVM+nvDI3j3LB
	z0drHWem8zDYSZ2iJLy355SBdBqJcNNv8EB+dpY66wiqek1ZJgqhVMxC1qa9kzfP97TNnZas5IF
	xBDrSQBrF0AG1lpyJGe4nS+vV9sbVWC1FSzqWZaiNfN+xfs/1+8dDfEh0bJRfFXv11kYQHjdFiv
	QlPad3SaMBdzmxtf8C9AixHtAPPF/FCMu1OEJWktayO1divg0RF6SEQdifrTvYJdwlYXhA2/jyS
	tWjP3bUfbw4yyMus1phRcLYhq4EOrS9etJgexnvoT/Hig8n1gGJ9Xbh7pA==
X-Received: by 2002:a05:6000:2488:b0:464:c5be:37fe with SMTP id
 ffacd0b85a97d-46d04d45829mr417638f8f.15.1782305303554; Wed, 24 Jun 2026
 05:48:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <80d983887dfdfc7e70a6db95f8cb95b7312f3044.1782224059.git.gregoire.layet@9elements.com>
 <20260624-realistic-spiked-parrot-db1d9c@quoll>
In-Reply-To: <20260624-realistic-spiked-parrot-db1d9c@quoll>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Wed, 24 Jun 2026 14:48:11 +0200
X-Gm-Features: AVVi8CcfDxQiwuKN4se3SFXuUd_U7WotHtCQRVpspiQz6vxahSkFlSb2JfFBv40
Message-ID: <CAFi2wKaL8qiv_H2GQ05CaeBDQwGvHdjb+dqmjQrHHzWNK6qrtQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: serial: 8250: aspeed: add compatible
 string for ast2600
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets. See also:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/s=
ubmitting-patches.rst#L830

Oh okay sorry I missed this information. Thank's for letting me know !

> This should be oneOf (by convention and actually more accurate meaning).

Acknowledged

> More important, where is documenting of the actual compatible?

Yes, you are right, I missed it. Will be added in v4.

Best regards,
Gr=C3=A9goire
