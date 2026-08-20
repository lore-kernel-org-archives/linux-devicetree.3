Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4513B6C01
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 06:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208519; cv=pass; b=CDa5SNbmRZAh8yHNfHh9n006EMVW8ovgF+xw/FB444/bG898/0FFf9MMz1ViwY5NbotbIphFoGJQNiUC+w9ygbtzPCyvXgfVwHsT0gkTKL+p/W7UxkUqRTJVlUnPE3tEX2Pvceo5r7HWYyzQG/SUy+RGzZr1lqzZhzed4NpaO84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208519; c=relaxed/simple;
	bh=jKx6hb5I9reOutt4e1+r0A1wPu8qOPLMjuwKbXXQc1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kf9R8zrJvx62xZzhdS5aUBffnVO6RbRojrizWGXdoSrNdDrEmoXL9yENnkE5DE92ZRnsJ8QEuzcgUpcFAStGX9qwr4oaqkBfx7E+jsbgyifELg/NupdFCpjKD1ZJPRbqvgf/yCvKvHVlOPaAbtdy2j3rm1unFMjXZqvbGWU5TFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=ZQWbMIDc; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="ZQWbMIDc"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81ed2a06b9eso20639807b3.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 23:48:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787208515; cv=none;
        d=google.com; s=arc-20260327;
        b=GhKl0L5rOQbAERLxTMmejTzRn6GI3+n+/9JPaf0FeRGiaxaoQkImDf/oUQsn3EX7A9
         MOCNI1r4HP/Q77/mI57xzuzHbPtCFHzk1tt5lnsqKmm/RSB0M0CIpFLANPVnYi4Hb/hU
         HeLBbruzWuMlXBgDR6SR5cz0SBO09uHRkoo5Dtah+RcmHm6bvcYhvsbSyQzgQSeMmRi7
         cCrdwV0pITmTo0HgbFgHZurlHK2l7Fk/xGlrk0dlDS8k/W/rJx2aY0F6gSVMZyheU63q
         ubO+ebgNM1RZmli/2Nx/FoSr32ZlE1cSLahxSN9YfX7VHTN1k6Sw76hNhpAR9DAJbkFp
         RrRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jKx6hb5I9reOutt4e1+r0A1wPu8qOPLMjuwKbXXQc1I=;
        fh=loxnXWYpIGeZ5ICVv+b5gwn9sbOfaEYV7WFYi9IQv4M=;
        b=X93DugaW712e7mzDYz7RwEIqSC15HedzU81X2RN7vk5ocSeRvFMgu+16hqjyKOc4he
         cAqBar5Wz7gL9FjjHO/zolswalbwi43QJ2B+/m7FrL2BLSQ2WyhV9X6Rma7Ms10cVapB
         RhasymWPWKpXQTDk4ja3abv+4qDefHK3ftcUfjil5B/XkdUbOYfbW1u57yaUiSZtnmE3
         8/8ZucvTXXjdCTs/Lu35D4cANLaZI5WM79VMWsbH9ya2ZS3/nWExszQULkVktj0Fh/q7
         zBdvIjOfMZhHuwPEA5kiMOkbJCrEVev43/8SNG/boIdd3vD+U5Qk/F5Wf5JWpJ9xk4dO
         6Yag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787208515; x=1787813315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jKx6hb5I9reOutt4e1+r0A1wPu8qOPLMjuwKbXXQc1I=;
        b=ZQWbMIDcKlcUwfYe2ht/FzB3EAXYqselbm24mDvJZAbvg4VUrEwGocdchSp66/QkyH
         U5dyzZbCqxqYiG13ZbqFMYBo/IQFO5iA+rkSnhWexE9hwLAZFXXW1jUZbCb72lgSFACh
         666qGihvn/vwV327ZvwSkUE2tHQCyKw0EoLiWa4J5bZAFpFm2uQ0uniyfFPCuqbDHuy5
         SgGnbzn4d5fA34dNFnuj/PwVmNMtqjOnxXw+LjLg3vw0utLzdGfwRLmUvffl/PhaEyMK
         ogCDpjBZhRu8IVWZx0WDJvcbGHNaMhYtLVsUxl5YF1SCNMCi9L3bid0bULqBqA/lyWYn
         RMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787208515; x=1787813315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jKx6hb5I9reOutt4e1+r0A1wPu8qOPLMjuwKbXXQc1I=;
        b=bx/xjCqkovb6zR8beuDThKk3hMjItJhnraKRq25StJdw4Fgt08BcIRDtYwC5JA0ET4
         4SNNr5myU1K9X+ImVD5Mm2pubv4i8Qq0ZNjiHsaYZ4ljnXWsZngJ53yCxKOxfoVS6/fX
         91RUksFjVThUSgXK9fhK8zI0IekSORyYtnx5Ih649uNzpRIKM8J7sQL7keiJBxPMLPge
         S2EiDZh5pK9EsNwLqtME+p7OMVa3NFXYUwLE5HDBFbrStbIzZbpZ47mMwf9Cm0EEr957
         MsuaJutWUIrGd4xMdQa7zlgauBf014grNOV1/QOclsYaJuO5wh/nmtLE7j3cU1+GxXXE
         uAww==
X-Gm-Message-State: AFuF++lA5L1Pm2Z78CdoaLEv9VzkkKZGPjD7TyuMNwzuD3chU5JwdxS2
	KgXUXJMyqPRWnfdaUoKxU4DHk2WdDajNMJwmwwer1aVQgJZ6Cs1QNXA8w0x6iyDhj53OJTyRinY
	NY3iEkmRdrKZ2SiCA8hvOYPm+Dk1BstkN994jq9LlVA==
X-Gm-Gg: AR+sD10dPfs98FGOGzcgdvUGVO0Kxfp1uN2VsCY94ZtaCMJYKudbIljlhdaukq8ITNg
	G/HJDvSVqJDSnoa57ufljsSh1Qrgy3da75+D5Wesl3lQm6CO3wPW4Cihq3mPOPLfYLIa0/GfFkn
	P6+Xyf0rGLHAhxd0gSdsi4C7R1tBBjSXfghiWcvTSu5OHrQJDOG8wlXmKEKw85GkkYn0ZLZClnK
	bxTDrDj3bZUQT+ft+T+mtKopSrCn5KhjCqaHUaT7o7qf49s4o9Ke/sJzivacqkWIauSVRE2CFue
	IrjMv8hMwaCeJgIcMAzb1V2CaLYZVwjFLtzkbFA08srTERAOCIFoPQsS8FaqK0lz7Iwz1kJ90rg
	S
X-Received: by 2002:a05:690c:e68f:20b0:812:c9fa:9910 with SMTP id
 00721157ae682-844e7d84198mr32821637b3.29.1787208515021; Wed, 19 Aug 2026
 23:48:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820062626.39218-1-karl@asseily.com> <20260820062626.39218-2-karl@asseily.com>
 <f893c76c-32e2-49c7-a791-c86ae818c2e6@kernel.org>
In-Reply-To: <f893c76c-32e2-49c7-a791-c86ae818c2e6@kernel.org>
From: Karl Asseily <karl@asseily.com>
Date: Thu, 20 Aug 2026 09:48:23 +0300
X-Gm-Features: AcwNN1VhnIFEtxZ1zXYTfgcVa4Bw2RCVizoJlif7hDhp9-lIZ7ayVC_FRjmCe7Y
Message-ID: <CA+gvwbq0sxs6b9=d=LF01L9V6sn0xLkkeAo==xLhAGkm9vTqrg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: add ESS Technology
To: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You're right =E2=80=94 esstech.com. I'll switch the prefix to esstech and r=
ename the
binding accordingly in v2.

Thanks,
Karl

On Thu, Aug 20, 2026 at 9:30=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 20/08/2026 08:26, Karl Asseily wrote:
> > Add the vendor prefix for ESS Technology, Inc., maker of the SABRE fami=
ly
> > of audio DACs.
> >
> > Signed-off-by: Karl Asseily <karl@asseily.com>
>
> Website is esstech.com, so your prefix should be esstech. Unless the
> website is ess.com?
>
>
> Best regards,
> Krzysztof
