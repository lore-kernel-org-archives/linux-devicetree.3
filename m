Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12A63FBB72
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827681; cv=pass; b=jioefy5Fl1dwC9gbW6vGPFY80lhs3JfNhzex2/zaJ6gyiVBGea1B5oi0iRDSIjh+hiqxIHDpB1p0kaMV1cRtlPYGj3keTtbkEy5rIZTF6inlI0wNlVx9yDAV4DBayXLf/9ZUYwRdXdZXjaf63lqr4ujJLdlwLrt9GVQk8c2S7Dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827681; c=relaxed/simple;
	bh=kICgOv5/2iXexPp7bGaZdZg6kq1kQTHrVyw4nr3vLtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k6HyB2g3ErlfaOY7LMGRLnEn5chHEt8s/tbX1SbQubRGzJLyESOGCRbY4DQzdmuQ3bp8uzmJ5Oo0rHphy6FbKH4mAExuf5U+ZlKNZC7+j73einXZQYqBs980WHwiVqDPq656coToITTikU8oTABuSFkLap6TMibpvmDx4uybzLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VN+6uH8T; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VN+6uH8T"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1fbe461f59so605113066b.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 00:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785827678; cv=none;
        d=google.com; s=arc-20260327;
        b=JAnmVmhXfCxc92gzCvsH8IfybcIpQbB1+yQif/NalgS4ggzEBpqGrikC2MYU46Vrx6
         uSEHxHEAlFgcHnpbunb+aqmJQvaFmfYLVEnxDEfmEYnMz6RdEB6xBjqQEsS2vmNyeDqE
         qP9Ig8+PDTdBNx3L+VqvyxFpg75NblpxLDABtFHvbbJ/PHw9aiEbzDWvYy5j4y5GQ20B
         O07vy10Qd9XTSqf6PLvcCBgqs8djj7GPgvuf7gceYQCHgJjbZtmnlZAKfdrGGVEfE/eN
         77/DUOOAco3TaMe42JhgvB9qLB1VF+Rck8KzHhpyONrsJv/Hv7QEOUDIVpDQVBMTNHF9
         +1wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kICgOv5/2iXexPp7bGaZdZg6kq1kQTHrVyw4nr3vLtI=;
        fh=6Sal9kwKK/hiLo4LuQLrPGL09K+PJ+8YtMdxmbP73CI=;
        b=ZxkhWQRdZ0XGBkYEZ5MSDavEhfCbS9dukd3DQ5mSklqYlvxK+aeM8CSX6rviDg1UOi
         1jZ5MkiuYHJpEMc+HVLXjUZMHB2+WlwhJxSCha7tA+JGn5mLyGOsFEUsgATsvl4KyeVT
         3rvZLxaaAPRN2Ysk2/8cWKnK7sDT3mOuX1XShtntabrmcaiNLtpRINmqm/T/Ss4a0AW9
         FWN+pNvii7EuFMoHtVuO8Orm6oRjXRgq7uOm3TWlzx+IEbyK8wnhCTEWgg/rRlkqpWc8
         67wb5SaVr2Wsd3NDBVOJW4hW7R3mg6AJcI3Pz8AUUKefyegA8mDFWcLYPz5savRj2R6o
         z+TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785827678; x=1786432478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kICgOv5/2iXexPp7bGaZdZg6kq1kQTHrVyw4nr3vLtI=;
        b=VN+6uH8TrFyO4fxC57spffa9ggzdgj+M11JwDhZZE62BUWUQGI7tuFQZCNCBS2Lhe4
         n1jkXQuIIm4OsK2CAyAQSuQNLnkOXhPCP3APpAYbolJutGjVmtkPSWrYsAR0K91gc7VH
         U+h6cT1G2i5qQRYBhsKSQrPiCA80p71GrCVoCwxRmYPPcfQNq+KCVGnFQ/mhUHQUhwkI
         DfPzoa5Fsu+RHU368uvUmBrAvlundmUnU1Zhoieex9J+NX8kGAdPDDzAf7esoFzxcXJx
         XenDDWl2iFSjlWZTr2RSRp9KyZ7injfNT+gOzlIG8hFYhOE2Xvzib5dWZO4plNIvTHY/
         iQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827678; x=1786432478;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kICgOv5/2iXexPp7bGaZdZg6kq1kQTHrVyw4nr3vLtI=;
        b=TSgOWRFhlBLTzyWTrD5wrNQxHwyGJ3qCg9TkavCxSyKEastndOy+7yTgg1nsPimNTB
         lpHbUxHFurnmlSP3KzdjGTfbuIXuNsKoZsr1WNVuojKqFxSjEmpHLi28LL9+oHBTVIUI
         XB/3AUIIEaSepcW4FdgmYTc9ulek2s3yboMBucaP521FDoVKQZ+8enn8baP+f9QQYUfU
         94YfLKL7Y54/OS1tsSgEWAEmEyZBlVGy0P26wmRuZZb5ZS3YlhXsZSyQ53keLfL93tH7
         8SiFUSj7/XQL/BVDctWv3YOyx3wj2J1FJHYqiRzUE2gXo8+tkK0lT4WdUwKoZOfYbl5q
         TQwA==
X-Forwarded-Encrypted: i=1; AHgh+Rq00dOoD50CsZ5DywjY4Tx7ieC2SPsGSDAQNuhACGIXcNL0VZB8DOfXpcFfIIY5/X3t9e1rFDLudFaK@vger.kernel.org
X-Gm-Message-State: AOJu0YzZSZMvLuK4DdVtDiN167fvirE1fm3mRgh2BOvDusQjb+Yf0s+h
	aNtUT0M01M76DumxRuq+GBDTqM7bREWfqsA1/VdMyISVUX8kP52Aco3KeyGfLRg5MFvTK25m4H8
	qz0m2Xl9ENMQY7GQUQKx8+NV8vqZ8QTI=
X-Gm-Gg: AR+sD11PlJOW52FOZejmphZHBs041cBKqyriO1ij3X7hI8Z3fJCzeLLe35EWeVnZv3p
	RDvI8GrMABJ20Rag22e6opb1uifTK6I3eJjON6Qh0RO8ZL6CfgEUyTQ0Pm1kINaAI9vJyvjAlN/
	P3jilEX23XgW6P0K3N8GWUrIAY8H8D546PQvka2glF2TnpW8ckqVazZqVUvqc8W11RIYdaGAxpY
	zgBBj30PowZ/wcoer+lbltWgD3gzyWJPf/TvsucF0B7gC4LhItc8yLK/3WkpquPR6Nt60Feo1A+
	JaNIoLYeIOU0Y56oTfYHMzdeRc4Up9lT2samWHfeoLztZw4iWkD0WOtI
X-Received: by 2002:a17:907:6d12:b0:c16:7414:4c29 with SMTP id
 a640c23a62f3a-c1fe81e0d11mr1024079366b.25.1785827677958; Tue, 04 Aug 2026
 00:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803101734.270821-1-a.shimko.dev@gmail.com>
 <20260803101734.270821-2-a.shimko.dev@gmail.com> <20260804-affable-warthog-of-contentment-b3f09b@quoll>
In-Reply-To: <20260804-affable-warthog-of-contentment-b3f09b@quoll>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 4 Aug 2026 10:14:26 +0300
X-Gm-Features: AUfX_mx_eWsELjCGsOWZC41KbKW65u5Y6L50ulKMLIBcNP7R1jvdMrvS-GuB200
Message-ID: <CAOPX744=Bo2LqT=jSmO7L4uQr3eMuhZ4WCSVFkvxz_dtfTMUTA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 1/3] dt-bindings: vendor-prefixes: add
 Guangdong Dapu Telecom Co., Ltd.
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Tue, Aug 4, 2026 at 9:46=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
> So the prefix should be dptel, not dapu.

Got it, thank you.

--
Best regards,
Artem
