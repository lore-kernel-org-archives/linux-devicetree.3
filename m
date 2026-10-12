Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A31377EBA
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 01:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768723; cv=pass; b=H2WFzbxAxom5lUrhcfDtXO9mYfl83++4o3ur9hvBmd4p1EUl4aMP3HVXItMZSYHnoiEgCfg5rM+y8xTklpT6TzX0beOAkn0yz/45jOKsMpecAwhk8FGMD042/Eouq6ip8Ho4mgfC2UmWki5zmaGNdfn6ZWwuCWSeMQyfPl6jsPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768723; c=relaxed/simple;
	bh=vhUDDHake6PjVodeFYRTd89BpqCVb70Env0+ub9W+Ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=auU3MJAJY5+hiD42IvTv/bgjuKx4xJdJtnw+iwq32CedWDucx2tTjX0/QujpWfMJiDzzswhEo4wgEMZNzn5RecwvT4NS/ZD6EjX5JtTNAOiHO+bJSNaqo7ntsOGA3lLP5kEdOJDzThed9WCdDwlo6f34MRWU+FNWcKexyCddAIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCGQwL4a; arc=pass smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCGQwL4a"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-49e08af5fd4so639868fac.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 18:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768720; cv=none;
        d=google.com; s=arc-20260327;
        b=VWLKvNKNEJ1PnDkpsJukcX+nFNNLSmTdpJXm0ILQ5rPdlDzc1FOFfpnSxAGg950/b6
         9ULfeZu75D5WF8Jz7SBi9gs6B0aOCFpglsrCJaCbjSBH2NOSuQp+mkSTUrxAM41GmSKP
         10l7ImkScoV8QaDhJlodMotF0aQ2XlzAxM4Sz07XwtJsjTLJlDrf5AJHn9ECrU9FonVn
         usR6ehHSvBwHVqgAtNdzPK3VUn1CihZNcRzeh3sswTSfn6vzWeEV1pKon5KAzqOqmU5k
         8QVeBxKx2F0KRXZX/LIEP7s6QFhbL1soNK4ryVAG0t+ofEvZ35lnw+06zrgaUzfJtaLG
         K6dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NDQUO9E3aLbOqLlDqGwF/awXVPyTQZEvQb89vn5yfsI=;
        fh=eIeeCS+RIQaYh0/0hIE/Mn4JZL4mrr5pIHLu6YK0668=;
        b=hmiWuUd4wu5FRuK32RI6pw8Kb4eflohu7aIC8mxZO9qyUu/MQQ8b64N1S76O3Ofruu
         VCajXJZN6uLUMfvA8qDf8cHi/ByrhBLCdQO6PizsQkYRYkPS+RLOf1ZxJVQb13dMlt8C
         WvLPRCuAlA2/Rbb7N1D6k0VBvdjMTghDikrp3yh1f8RytwTToHC4QWAtrBuLc8saffj5
         tqZ5dUCoI1c8tdleFm1rjdaXeve4RYtvMCvBT1yEAUyFUB7uFwnpR55Z98DURpVClgqW
         CReeihkYXFUv4oWSMjNandhkalHCtfnD9d0DHpiaveESF7xQqGFuXGeyO48ueMrVSRzW
         0TMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768720; x=1792373520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDQUO9E3aLbOqLlDqGwF/awXVPyTQZEvQb89vn5yfsI=;
        b=GCGQwL4ab1od3moolhk3hHqGU4woVDxfP/nPc5Z2Ra061NJhVqGDZqpfeQ+MpOV/Sa
         PFhkCfhjfe4kgJ4XxoXFqs4HYwiUWlu51BB2NILtfl+uixL0rcCcILPI7bIYFMzgGOpS
         TUs6/NKEcMmCBIMeAbF6iF/RKinW4f2yt7qd1q0uGZCC93M8jrpkPL9/XZ93bpK2Ela4
         c2uEUbLAo1BGHNDs6oeKp+txknqWavUpSPWc020TmDblTzMIRdYLUa1viSmRxdtqV+wS
         PI5HO3HsF7mLbB1Uv1XHuhywQJ9OPQkAk07guSXjoGi+v5UU8uI1nzPqC0Ev1izC91Cs
         AIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768720; x=1792373520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDQUO9E3aLbOqLlDqGwF/awXVPyTQZEvQb89vn5yfsI=;
        b=21o8hWb9nIRb+B5wUzFrvJxDY168UQ+EXK5KNt5OYi82rienyphWLVzqfkTY7yo4lp
         f1hmlhoS77tMVcF+2uECmpTNzGqFYopBiOGYf/DwYwX+fGTed3W+yFvwWdqi0u/G2nEh
         D+wqqB1gSszure81j+kq6l4f2earU4PVfPODWQwGRSeC6cMK2X7hh5sBHoJboj+vuK5U
         pjYhRpk4oRseX+ZZfIi1GMEYnaUB2/mWH+qZhJopT+qw7u40YVng5Iy2a8pPJR4TxIrV
         lCpZmHVtf0ljgzygR1CqJf58+qHaB6nIAS91eujabloVWIfbqstUUsmZffz0j9hgSHsY
         kBFw==
X-Forwarded-Encrypted: i=1; AKwUvBxkoELE/sYtVOH2Sb8uo+NSBCLOOL/2qPxXXh+ox7xpMbJPecFX/pyIHbaVwlO6cuF5KyHCjVh/KPJq@vger.kernel.org
X-Gm-Message-State: AFq9FYKv32fqpu0qSCuM26vTomztLERuxidryXhjIybslWQ2m4n5nSxo
	dW/9DMFjzKySfbdlM0ghaz0q8KycgJVT/ZklmCM3hV2tdUyqkULfsn16WELU6k6yrfFERxKcJjP
	B6gNR8qKR8YzmfBOhguGkh067HymOD0Q=
X-Gm-Gg: AYBFou2CDdtmZd9vTDLaz9gEtlvvHML9YTzoR9k+FOeclp7uOPKfU9cL4ygeTWy9tnz
	t7Mv5qFRJ+sXhZCvihuQjmzhGmIOINxuZzJdAbJuL4AL9vO30QSJ3/5GO+q78olkE+CqQVQ8dUl
	nrjOuaecCTFYaLmWchdLumz+KKFbOGHF4XpA7n5XDpxqNPJgTzkdSqYAsCgg70iec5RklWwVe8b
	JqAuUZacDAQ54/ycmuqf4/DQLCfg5ebnUpoZGDGgbkBHv5r8+DYKoIrnc3oBYiKZzF2nzz6+MU9
	HWdIVxZckM29FoNMtH/YHCo1BvxDhyMarO0UKcrKvDjSfKZF8o9TSAA=
X-Received: by 2002:a05:6870:b523:b0:451:22e0:9604 with SMTP id
 586e51a60fabf-4a2a86aca5cmr6021572fac.7.1791768720455; Sun, 11 Oct 2026
 18:32:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003175659.23536-1-mailingradian@gmail.com> <20261003175659.23536-3-mailingradian@gmail.com>
In-Reply-To: <20261003175659.23536-3-mailingradian@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:31:49 -0500
X-Gm-Features: AclHuK8whbaG7v0eCCsuN4wni82p4hRfYmu-N78P0lmjY_ExUyztPMiJe-8P32A
Message-ID: <CABb+yY3gCzgVL1qZ7XCapkUBr4MGfUO8NG3kXY_3QL9_pkHo2w@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: mailbox: qcom: Add SDM670 APCS compatible
To: Richard Acayan <mailingradian@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 12:57=E2=80=AFPM Richard Acayan <mailingradian@gmail=
.com> wrote:
>
> Add the compatible for the APCS in the SDM670 SoC.
>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-glo=
bal.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.=
yaml
> index 39bc374300c3..74f24e07abc3 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> @@ -50,6 +50,7 @@ properties:
>                - qcom,qcs615-apss-shared
>                - qcom,sc7180-apss-shared
>                - qcom,sc8180x-apss-shared
> +              - qcom,sdm670-apss-shared
>                - qcom,shikra-apss-shared
>                - qcom,sm7150-apss-shared
>                - qcom,sm8150-apss-shared
> --
> 2.56.0
>
Applied to mailbox/for-next

Thanks
Jassi
