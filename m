Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7022F2E738D
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 13:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787407192; cv=pass; b=OPEgkrCoQ7bh9Rc+sKOQK7M48DgcmJFel5157CbRUT89iorYaaltMv70oEmtlScL9hd+BOlkOt6IOlF6XNRxA7sMR2kgbHT1+jIdQG3sGpoEm0ffWtdBidPftveBHu8oBzIXYLlpYxtqm8SW6kPnl2R1XdHuzn7CcEvcl0JeXiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787407192; c=relaxed/simple;
	bh=QMZlD1tu2gwusvQqoM/+Kdj/rOjVVcGV7cMFTi2mVRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z99ufX1MN9/KkxFf88Y0kJNfRMkVHP3CB6AjieNCtek4K5LjBuXGV4k+BMPRyH7pKJqNXrufIxO6W2qHGdZT4i4YPp1LdOss6OklqFBC1RGDZl5hj7tB70COQAsMzXlC27Zy87a2hmQwYps/dKIoxsV/5G8VojUajO3lzR5n/+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGdxrMWr; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGdxrMWr"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2055573c8cso290296866b.3
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 06:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787407190; cv=none;
        d=google.com; s=arc-20260327;
        b=VOWyfdGhzeaNpcwD/CsEKBWOi7TpiMyXVRrE5k+1VsDnbFY1r1Kih5H+IrioPEFBiM
         HvpEkC4ICnQMiztR6J0l+dr3Bxyjp6jMa2/pVACk7/jyWA6OeGydsJWACOPSn+VUgvjF
         MFepBrMIXhY/wLBcah1mausXxgzdCTz1KwhNOzzkinMOEFD0yYqp3msOchjE/aF2MERE
         wACuawfA/IB5w/AlGwU4bvEDD+dJnbOqbY4ZCR7Uma+bmTrhG5/o2uEyS3g9c66mqwtP
         xEpqKDIrjtn1UNN9YxVFhNSjjJNz8Vyohpfqz3rYfGunMrnS+/3Mh+Tq0+xuEPvIO5ie
         IQjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QMZlD1tu2gwusvQqoM/+Kdj/rOjVVcGV7cMFTi2mVRA=;
        fh=6HNoAQLqiz4tV85hPYRhGRZ+4rP7eR8QyQ4D1rbD7Z8=;
        b=GMiOhJa2mDlAyJgTut0Drnh8oGQj+z+HAq7I8Af3IKh3CPyYH7x9bGtVLMhnc/jp2P
         bET4WV/DUk93BmrhP/NoN5cVRnK+v9/D7QtRTHc7RempJt51yR8rmew//5Ff16/S6K8w
         CF+FzuMl2e7WVzXGSUV9/t2Bvx9EDOj/A191S+6it8snNRUJSEnFj9sYS8t8Q51HU/oP
         ukmkFTqV2KZn2eY/uSAY9U231A/nbNuWGZ5Zk/O4cJF+wxq9jgDy7WMw6Q50f6cUtHem
         UigwTXYPioMswDYV3/aPLM6kYLDlCqClHrvYbIfDVkyatgcc175vbNFq7Nn+gbsc5XQk
         fZ5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787407190; x=1788011990; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMZlD1tu2gwusvQqoM/+Kdj/rOjVVcGV7cMFTi2mVRA=;
        b=TGdxrMWrCrceaCkytD1HeWOuKVLxQNvlESnBiBxiO0VOwdPWRdQmDpcV8yWvh+Cub/
         IMDXIpbYSfQIDXwCGL2g3wKQevED8zEXiybvj8XkBqn9TlJOkyRFb4xLh41fFQ3ISnPw
         phaV+zGPSpZ1OFFh+KPHxEkwL+DZmuQV/L4HMCD9S7KeX4+bA2zXLUb0jdyUvnLqm536
         Yc3HOrMGPUn6w36h3Yx+FagLSVy65Yd8G5llJY6koyimhD8zt/RkHaD2Io7E4zqux6w5
         qgdTX8oQ4yRwrCvWxqy6EjL+T3SC+y29GL9AWvKMXRfZtElvt5wjLk4SXxv8D2MkWK+N
         Elcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787407190; x=1788011990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QMZlD1tu2gwusvQqoM/+Kdj/rOjVVcGV7cMFTi2mVRA=;
        b=EAnDzEDthgEeO0iU0u8kGqQaYjgn+osHs9Pv3FoqMmXnZ7xnAEwEfTj1qJlTQAFDE6
         mJw3bHSuL+O65ndHyYiVslZBVSBOJvFU/zKqv9Zo/xEhaY69ZYU8CTC/niieN47BOcdI
         oP5a/sMZwt/T+TV9sMgE49SUfeqed25GWHrM+VUQbnkz2sMsCdNAKOzwt54Q9r2jZ/Va
         ZHsP34z1Mvn0hHEusi2ZyrXofUgfJvcx1XLb2NInnUVpbMT1l9DRyZn6XqCWEI0foDth
         IjVsCz78EjRStboy1gV6K49cxhHQekXGu17BFB2vIaF4Bo6sBWWfn+erSdEqhy2/+AwY
         ha7Q==
X-Forwarded-Encrypted: i=1; AHgh+RpT1LNe19kOxZwDXpP4s9T4Ke5UEC4tFgDfziw0/aLcRbRM3CQcv6h5OpLZkbtW/kVA2P2BzJlFVjC6@vger.kernel.org
X-Gm-Message-State: AFuF++mLgQBr5UL6UKSZmCXVftvP6hyYxVUHCwAPQ1NUfsrE+2Mzj+zZ
	SAiplD6qd8JnmzIXhduCBnwTslfnPJF/g2HwFILIZn2kzJNxLj97nfUYxE8lvqdTJrJpzEW+LXk
	LWLRUA6T0NJ3Eos8RsKeCqp1pnwD2GbU=
X-Gm-Gg: AR+sD11OSWODUTKXW6ERVNAIuvc6I6rH6VU24+cHn5WXkybQck915BJX6b4AgvPD3qN
	2dJjA+fPdwN8zFGECp6b4iRs0ZAdezizWNeTGMOXc98GehojcTMHjht3xJX0YauoI2+f7BNHzmu
	YKCaXi7gXwgVf3S0N+KZsr153kM937JRKSUAKtEvYUIjFwW0FQtR3fKv4bW9zP/eChA6tWBmdge
	oVhj5jnqobRvGcHzor3pICUBBetlNrUtS3DQPe2HeypuBthYiCR12amlWF8ZakWWPvl/ol5rhVO
	93oeeoDnsea/fEMZneS2dlg7FVvNWKXt1xsKqTgFj5ttMpTNUEob8tFKz/PWwsOgxq+Ug+BeAqZ
	9AD9raRA=
X-Received: by 2002:a17:907:c8c6:b0:c1f:1520:4de5 with SMTP id
 a640c23a62f3a-c249257c128mr661278666b.1.1787407189637; Sat, 22 Aug 2026
 06:59:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-6-sreeshankar0910@gmail.com> <20260818211749.GA687014-robh@kernel.org>
In-Reply-To: <20260818211749.GA687014-robh@kernel.org>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Sat, 22 Aug 2026 19:29:40 +0530
X-Gm-Features: AcwNN1UInbL88MEaThabOx-Pd2MTrrUX4H4Rd5JSV9-PnyAPj2dgucrt6K9bcJw
Message-ID: <CAA-+ukLBfgWVf5Gf6qmX3_t1MsbuJ0hFshGfZzi0H_+HLWkE5Q@mail.gmail.com>
Subject: Re: [PATCH 05/12] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC
 bindings for SM7250
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, konradybcio@kernel.org, 
	tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, lpieralisi@kernel.org, 
	quic_tdas@quicinc.com, danila@mainlining.org, davidwronek@gmail.com, 
	robimarko@gmail.com, linux@gurudas.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Aug 2026 at 02:47, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Aug 18, 2026 at 08:07:47AM +0000, Sreeshankar K wrote:
> > Document RPMHCC bindings for clock rpmh driver on Qualcomm SM7250 SoC.
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
>
> Missing tags.

I sincerely apologize for the issue caused by my action.
I am new to kernel patch submission and am still learning
the workflow of the patch review process.

I have corrected this in the new version and ensured all received
Reviewed-by and Acked-by tags are properly included.

The latest patchset has been submitted here:
Link: https://lore.kernel.org/linux-arm-msm/20260821154030.2514-1-sreeshankar0910@gmail.com

Thank you for your patience and for guiding me through the process.

Best regards,
Sreeshankar K
