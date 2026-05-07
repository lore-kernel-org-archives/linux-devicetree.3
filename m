Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD0231354C
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151621; cv=pass; b=Oi6YH9/XaPXYn+gkIkoySwexYEHcgJJeFAv7eGS+zXqjVSpbWNDXXSjuKEbM7IHIHBeom7oBHpW7Xjdmh+9G+oQg1DvtnlrAAhwK0Fnzr/ECqU+kQV9SrlbDzR78aib/RFL+541pQOjpSj57esjD2EiOpt4RY70RxOFS5rXCkOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151621; c=relaxed/simple;
	bh=xJIizpowMvzwIxEMfksjLr0o/68e1fz2uZMcWo33RFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FL+PZrcFQkaKnVbA0zRy2jFTbAe9jb+tJue32zNxeZVs8wfp6T/0aWj7QtSxjTA6qcUQFv/VibAKCGnsrIQ6CYbEsmPVHFz9/9wjun+lJbNCUmnmdFCtxVrcuPa6dG5FSrVYVn5BPkRz5BBzRDGd4/JDmRyJEf7EkJ4KNePNazg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GC0mKCPV; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GC0mKCPV"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso3372098a12.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 04:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778151613; cv=none;
        d=google.com; s=arc-20240605;
        b=Nn6NLfybH8GcDbSIOqAaQieTIwGMHNi8F/t6AhjD1pLFsxQWf39Ozqa2DNQ2Nyl4dG
         vrlgwHOOI82jf8TbMq3Oyq87+QrYh9y13AfwdjdPlq/4H+LYlW0qhKqXSPAI10yG2sIk
         GlS3qz7F3woNEKyOHWmZsao09Y78FhsDp+TPFJmEufgvX8Ao5OgJpptcm017Kh0HrVPu
         lHYqmu2wPvbBsThDsyIKRI/3eD2FvV2wKD/TAMlBs66bS6ffobW/lmjck5N3LuGUHNcB
         AVWptdSGApPLCF3HXxgRkHLWs3V1VWQp0OrnmZYTMDZjNZg4vCIYGJ0AXi0yVhoN8hqZ
         nb4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2t++Big+xUoAOFwEvlD6LQmlFsv/9Bm6ONnqBrqhXfc=;
        fh=qK8HYecxybcGM3BAKLEiXcaUuqI6/dVl0SD8Q6NqRo0=;
        b=P2t8Px6dYI8X2KnZzNg3njZEqOIgKQve94VENnsbtRsBqUOpyfyGPJ9GGR4YcuNxU+
         Y0A8YuqR0bZnSVRREwTX9ylMjgYBZ2squ26gTFARdIvRSXbpupGUDduEvVyQ9amETgOz
         iPnyThuULLQC18r8RAay+8oFirRDMiInAdOlnwkGxPBbg05ntbfG+kKjMsUKyxqogI6I
         RUcg49Juspp3jJh9liQdJo0cqGv/4P8tkORt8KzZ8arjxrDfyMW3mvnCwAtNXeDxA6bw
         KZPbSqwqCbYAJj33wJAGNmr8ggJ/RP5E9ZeQxLuR+p4Gy5PdukngCNbVgUMppFOPciwu
         rczg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778151613; x=1778756413; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2t++Big+xUoAOFwEvlD6LQmlFsv/9Bm6ONnqBrqhXfc=;
        b=GC0mKCPVF1/pxQ23dODKxdIWOKRp6HToWdMWNHglyqGXLFg11witGWgmPW4c/HkKzO
         PjNwHAWoUEThipLpCTO/58C6ZZAfmNKY/7S/FBdomqbwahBJYKwPkInOy/tLAOZLP7kO
         g1F8+mTAvJR62LyaNiMyK5ZFuzI79RJqzsJc/s32nh4gijqv6FZhRVEYJ3p2BHruyzul
         /o7QhKJOuRcfkqJIKCkZ0moyKu9E42q4WHCtKzBM+gcQf2xmcrgIeydduyTq+kSvgx4u
         W1fzU1+6VxegyDWYH4HcAm3qZyN0fFpU9dY8eHRNE/6+iZFNRLfIBCabsi94qnCK8me2
         bkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778151613; x=1778756413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2t++Big+xUoAOFwEvlD6LQmlFsv/9Bm6ONnqBrqhXfc=;
        b=tDl4KN5s/PQ6W9nxP8/QKYV94FmqHPa5Q+B46PPtvqQUM+5NibLOyA8SDRE2XZ0e48
         Q6wx8ELEjvI6FDtbdzWxnL157wA3j7Y9kkKwZCncjeVE5qz8o7WP/YPErVws9J66RJXE
         9gtB42oaL4svOu6MbPEVzNM5j+skWr2W5uLz829ohN7SDcEYWZNQ8WOelE5lDfNJM3Wi
         ANaJrtUMwsZ5rDHPGnhG09auM2wNAQPUL0T+NULym/rN4RzbIgnhSRcEFfD6oI5RRiPQ
         cqT7Nq06EZ9AN0/UFjh0KFeOQCxyJFNte2GyW8vv0x3RjDMs/WHJkeSir0aMUeLzHwnx
         tkNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xIs9W6EMupZLNurTFGs0rbXoKU6hAIMs3RdcPZ21S7Wrjb0NYdqlKYndj43y6IgqqZbcYsKWWpf+u@vger.kernel.org
X-Gm-Message-State: AOJu0YzMa+uvu+0zFAl+MGMyFbGzwDiAAlqhL+y+gDQaamxf7hUfUgvJ
	Dws/Mu3sIG/cKeDEqb0BWoQyd6UEM6KbVkgIwUbVbKfUDP6NPhagN7zzuFpsxIxzWltk8K2wS1S
	goKOHXmJ7JBgSv/Ll7OxsEz8sEdagcYlFWzkWJwIcaw==
X-Gm-Gg: AeBDiesfpmv37sWDugD0RYt/QvZY9Da16fw7fHmUU0vATcDEhIvckHK3I2iph/UbZYV
	lKQSJYAZ9LTGsCrT2ei0e6Q8Na3WW1IZpd3ORRkdY21sdkBBBwrOVELHA25fPWEA8k/7ampZndO
	/5H15wf2OBpW4USWrYqqssN6T10f2+VKbYDN4RtCeCrVIgHFZqYs7j0jQnr0kyJ0IIU683Qrkh7
	QmGLWH0jDYqjZneFZ6H/u97ah5PFvyzKQcfuvKFiR8HuphMIF1lEaaJ4CGi0Q5XEUWXhS5S71XT
	EpjW+6KNaWutm2FqNzWnEUqQDPJ3CkgN4jZ7hBYr5Dgd0cOdxN9ItGoYgf+3Xw==
X-Received: by 2002:a05:6402:a583:20b0:676:d851:447e with SMTP id
 4fb4d7f45d1cf-67e0dbfa297mr864649a12.4.1778151613070; Thu, 07 May 2026
 04:00:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org> <20260429-exynos850-ap2apm-mailbox-v3-1-8e2719608c46@linaro.org>
In-Reply-To: <20260429-exynos850-ap2apm-mailbox-v3-1-8e2719608c46@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 7 May 2026 12:00:01 +0100
X-Gm-Features: AVHnY4LglSrSyhxrD3_RZ-F9y2tAHPw4q5NwDa0ckqm4CO9WeIJhM2zzkB74KAY
Message-ID: <CADrjBPoxH8ZguPMygP4X_DDC4PCbGu5fR4UnfLV1Qd=UKQ5yyQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: mailbox: google,gs101-mbox: Add samsung,exynos850-mbox
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Apr 2026 at 20:00, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Document support for a mailbox present on Exynos850-based platforms.
> The registers offsets are different from gs101 mailbox, but the
> workflow is similar, hence new compatible.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
> index e249db4c1fbc..c109c1f7af24 100644
> --- a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
> @@ -20,7 +20,9 @@ description:
>
>  properties:
>    compatible:
> -    const: google,gs101-mbox
> +    enum:
> +      - google,gs101-mbox
> +      - samsung,exynos850-mbox
>
>    reg:
>      maxItems: 1
>
> --
> 2.51.0
>
