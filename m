Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F14C3C3F7F
	for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 13:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787407004; cv=pass; b=thUEpLOoeCx6W+IU31Aag2wfKqlIMM4ViIW7eFrmgMPnMb5Dkqb0e74qZX3AbHUUbuxIJ++AdQI1o9V5f+7BEpLBY1aDp0gnYPDilfj5LB1iINew/uvkjkddymh6F2ePrjyEOuX2y1W6ARjOekdnkQxFgQ/IVIQ2I3HSLrVDqjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787407004; c=relaxed/simple;
	bh=LW/8llNNM8/lpri29fLU+15TtvguEYyj6F7r2cvmV5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzr4f7+stIt0QU+tsEI8Hn9a9YCXZtlD1BB0AZxe2uZepMmm5sTNpZ4mm5njpkId5htaNs9s5ZTiCjRwWZ9tHUzsauOoHzes5vWqiEA+V6jVS+1Z5quNKET5P8rFP77/OuiYjqOIUm+pz7lE0/hNl+N2NsbLiwbbPvJmnRU++wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8eiVGNG; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8eiVGNG"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so3573465a12.0
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2026 06:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787407001; cv=none;
        d=google.com; s=arc-20260327;
        b=XD7olUTdF0y7yt2dXA0n/ivaGWMHGs8khHJc5TKsF7219uebx9bOJv32FTZvWFfIfO
         LGqIaN6xl6Eb8fIkR7SdsT1FP5cok5MJsZMvQcKYk1bhTYwnC+YFxAyQQ52kBjfeR9me
         xpxaoOdvnMJirumLl3QfUWv2RYzQQazxUSRtxuZT3UBRcS1eYoDJA/904av+2jFfRN5h
         lZnXOQZy5gaIiEvsnjse8mqbWentmIB7RkaXsq5OoaYlbVGSB/CBu/N2O/3lxBmGsc+a
         GUI20ZYL12Hc06U1S71UKuNpG7dHhParul0JIj0m+CYZ51DXGVRyx2dPwfuOQ1w3F8s/
         XAfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hC9XiiM8sQUJSSN/bi+LmoQHRVBCAyQ4fxY0zA6GP98=;
        fh=G+zblGCA5PlhFzLvjelTp/PcgA6Azmlm+xQ3/27xjy4=;
        b=kDw7a1GLB1ooRQqa2QtudnsMbHQYQ7veQJchGj8fSo/vWvsDwb1aI4tH/Mu8JTGt5c
         oN6uayR2Q6YmEQjOgtBqihHXJIJJhVhxwG5XeMrvvsN++Oe2lCcb9HkAZMCmeAoXImUF
         wzT9bu4/BoHTQfbZjQWvuk7Q66jH6I6u4S1HXJiscH/5bO3QGfQlq6t7TIrovO/p62nL
         QsW49zrvGUJXH11RoaBPV+xiaCTpGm8JR7AOeXy0ZVQBPlhkyM2pYbKPHHPFZ2UioGzF
         +a3RA/kjpznQZBPPMflJYlgPk6ZJ/NUnFK8PVGz0F7pIIBDAZO0+ONlM/xlx4dZfo2oQ
         BcTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787407001; x=1788011801; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hC9XiiM8sQUJSSN/bi+LmoQHRVBCAyQ4fxY0zA6GP98=;
        b=h8eiVGNGBiRfxE8jFQtlR5oz43YH+yRvwxShK99ji4wyxvmN6OLUsIwT4U8UTUT0ZS
         xh8Ze9cK632Mh9j5GOYHjrRqT9iHesH/4py7DNpz+/oXtrHa8N452nInAUTILjHfyIW9
         9kRiLF0i8sE8EQv0sQdJXI2XKdNjekQwiy6nvFwefWfB4Uc1THGRFeANLmdCGU95gpce
         I2o6ujPfVVjJYF6m0WNxfhJenS5nLWl+yKsUnT/D/sjvK2EYrjiSAEieeg0yIXl41FOB
         QkEN3VBAhtNc8+1rkDyG0wDzw5+0VOrZYVAgdE4lMJTgcRkiSuwlc+psgpPLxnaaRISB
         htCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787407001; x=1788011801;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hC9XiiM8sQUJSSN/bi+LmoQHRVBCAyQ4fxY0zA6GP98=;
        b=LAq0EhEgrKwa4ZXLUMImCBurTBS8tgfl1kSufWbFFZXOmmsCeYkvl/xXKjvvVHp9Hv
         lyDn3DF3Uv2zCJM0opUEfMtbud8dnhRnd64/UMgYTO6+MoI+6nsCYcKOaapU0eVtVqRJ
         RNiRDTdiv7RsNMyBr06BUaMQl5KXOqbVi2xMW4xnJd0xzEVQLEw5OPSXVuHvva/T3MEb
         zOWkvDL9uV5oeNrfv/IxnrDkRpWvsx6nd+H6klEiII/UaxKT0j+hSRb2mFxcOl3FlMPJ
         rA9F7iQXKp1CffrjS+vR3oIb6ynTgO/SEIW5gvRRK5VAp+tK0JE56yBkUC38TKTkUAEK
         vh0g==
X-Forwarded-Encrypted: i=1; AHgh+Rr9pGbGaxEgGAlqu53CzFJMKVjIBbCSPUwbYRq5crfIfOHwTW28wiPZ+ZsZ9PFp+I7tzr/QC6/4mNMX@vger.kernel.org
X-Gm-Message-State: AFuF++nhhFCXAhFWbwjdC9CigwdLk3ToNOGKAUn1jskMErzmNfT4zxm5
	hB/KccppK7xP6DVQbxSnP6OTLpThrMHqiN5qz96O97FJSID8mgUEbnwhsOP+PjdK8bPT+0l1r7U
	VJVRMRlLi1Yirpms5DOgXR+izF6n6dsI=
X-Gm-Gg: AR+sD113/bvbw6bCf9RTaoPYoLYTjeiIJCxpS2XqqHB2vd1kl9n1qgHvGovzn6DgzhQ
	4klrSOBiu2R+gaJKfv5DkDjDVhUVWv0GWlxxqFRgpkJD6xemC6QAIwjq9b4FgeoYHeAXHO4UDAn
	Oy/kU38ThrnIdnuHgwyBEfAkUDD2n58AuxGPFE3hb3jTw9JGUwKNXvR5FHMLxZG7JwjL6XdZMUe
	9d9Xpi1vPcL8ecWjjX4fwr5alDfa3ZAmgh/QNCXUDIzPzZBJ8VHR+zs3/IsAljY1wOEvoBHUKS0
	afBk8hdSE/Y7Xj+ggxPrnfXajqQmNkH/qO04z4tBDLgkJ32IWuyUwE8UfqKh7VdpszKEOA73+bw
	hnw==
X-Received: by 2002:a17:906:eec4:b0:c20:1bc5:6ff1 with SMTP id
 a640c23a62f3a-c246a2cf049mr1459910466b.5.1787407000605; Sat, 22 Aug 2026
 06:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-2-sreeshankar0910@gmail.com> <20260819-statuesque-shrewd-sparrow-deead1@quoll>
In-Reply-To: <20260819-statuesque-shrewd-sparrow-deead1@quoll>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Sat, 22 Aug 2026 19:26:32 +0530
X-Gm-Features: AcwNN1V8umJNfcbQppuc1ASR1pboBIkKFdS9EHV8sj10gVhB0jnzTf8DX2VpIH4
Message-ID: <CAA-+ukJTs1yb6yig2k6oHLeGYk4Y_ATman7f6tfpZWb71T+gWQ@mail.gmail.com>
Subject: Re: [PATCH 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, 
	lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org, 
	davidwronek@gmail.com, robimarko@gmail.com, linux@gurudas.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Aug 2026 at 15:20, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, Aug 18, 2026 at 08:07:43AM +0000, Sreeshankar K wrote:
> > Add the ID for the Qualcomm SM7250 SoC.
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> > ---
> >  include/dt-bindings/arm/qcom,ids.h | 1 +
> >  1 file changed, 1 insertion(+)
>
> I will not be doing work twice. I drop all your patches from DT
> Patchwork now.
>
> <form letter>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
>
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
>
> If a tag was not added on purpose, please state in the patch changelog
> or cover letter why and what changed.
> </form letter>
>
> Best regards,
> Krzysztof
>

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
