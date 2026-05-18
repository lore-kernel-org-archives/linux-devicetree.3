Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E2638BF72
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 18:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130792; cv=pass; b=dJdsxSOC8suR9c29WdLhmr3CtC4zbx1w5905+qEvIft8mg6bBEBi6ZTI7Da9SgfC2kjLPjOFl9b+k6oMP4cQLfTqKcXToumezlBpG31MI7p7McBs3RvepwNL4Dx1uSJdfHiYG5vj7nKHNP/t8Mwv1XEoSV5lEtLbBiPiKSvlaM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130792; c=relaxed/simple;
	bh=rA7OpGZvJY0kAyjp4yVFM8EEzqJcOh5NkQwGIkcj64Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sag7tFGIBrKLB2RZGNK+4kfbFywxbKvAXWxNKPt0ll8Nf/36GQ/ikgfRQhXavrCRUVzHgKBua76mxhd8HO2DtSuYrGYpWqJ1NkyDjgoRVCzuICqpJGblPV/BlJCl36HGlt0ixz9ZGqUnyB8obMQAtflyEYi+hNwPB0NpuRBsWW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loOl5q2g; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loOl5q2g"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7dca4debedaso2869353a34.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779130788; cv=none;
        d=google.com; s=arc-20240605;
        b=lelc9Yf7MAg4bTncKxhjaJghYTLpJOctuR334fBBOJJw2wjavMWJgWfvQise19X2or
         Gv26SXQkGmw5eN+4bGTKrRjW/73P0WxuBb1nmt+OTUfTLMCjf3RaqzHz+ixj1EYHKfZA
         dqNfnMIbGGO+DmQGvYDSVAVoL6BNx+ntRLWP1cN8HZog9JbG8yfpneRGF6f7jiQswxNY
         FGk8ve9PfsrXQC3eexHQe8y9ZovADU9CegoenYZxEkJTff9zCGAt//xRgXDgBw/bFmn1
         IZSIrWkEVOPoAMYg3S9IB9VBA6T86Au164T5bN3HXsfUbFZfih+xVMfkDe0cqrh5gdqr
         nTsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RD7ksUzupx1Ox6QqABpyHcQLgajinzCTeldNPeqycGo=;
        fh=fu0jwY2Qs1pZsno7ZYYJuFMxFleVgSCf5nGVDMVTWLw=;
        b=LGD1nya7TF1SeCDoHBR7o9QlAuhtR/wMN+eAUIANp6P3Z3SP5lFKUq398nxNv+FOA2
         /qyzUjuib+sAim3HlioXD2y38Q3FQMD/Jjq5mnB7Xlh15AGb9PcZ6o2qoMWEIql5Zb9b
         98g5YrohnQWCLRvzca+73FKEiiqI2uF75iQ4py8S8v1Opl4Uf0YGeuQR+viMn1e1RWEn
         HiE+VQrU0moiACqMdmLPkL3A6kF6fIlsZKz9usB8yQdxIgcj2+BdDBaOvWSOz2dYJUC/
         gWjiizzoB8AsgT/TG6al377FuoDrGE+yK4Qr9lTtZJS3Kq7Jq45HbX1hbSryGnPrfkcE
         TMtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779130788; x=1779735588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RD7ksUzupx1Ox6QqABpyHcQLgajinzCTeldNPeqycGo=;
        b=loOl5q2g3eUWY/Q7YNWPeBYi99e3QwR0850sGJtMLPf/YD9w4iDMQbrRGz2yLmxH/K
         qeFO2TR/AKhswMrIDRKYJqjxxpA52HuE2tTdl54+4TkL9+/pTAPXk4XpLn9ALBPYLhrF
         BAwjvMQ57jfhbL3htCXXmZLMR8PTW0vROMUKGHcXgESHOokGu0GeDE5bgwJ5dhR+Y2Vo
         hACDCuHZPn+XJ5NsvrWQM25WjSUBeKn7CQDSAKA6YDcRt/Oqh2jgU9a89hySFNyJnUI9
         moi8Gs+ZTkrNWMgH5o5ziObyJO5f42qFpGLo2+krc/h1mdn7niD8Zji3CsmfIdjJc9DK
         +O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130788; x=1779735588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RD7ksUzupx1Ox6QqABpyHcQLgajinzCTeldNPeqycGo=;
        b=ZmOsnxS58dIwveI9HU28HrlwCgymYA+xeb8XH8D/AdnoPsCe6K6MNLT5boQYgx6hrN
         USErXJn0lqNcC0Tq40H1FgztlzuLBChbQTEulaezdB4mhVblMfJ2PmVrB0Vu5HzcLIAL
         Iqldl0TQMURGeWACDqbj+rEdGKe1V2T6GdKJD8uYoY+CXhpyqPEkQgB41BwemiilKWmQ
         Kxh2vrEYPp3vKt3oWCA88WgRLX8qZKaZJpvJdMjh54ukqwfYS1XdZocAtRIp+IiogCad
         kKJE/dVEA4cN7gzRFeuKIuFl51V5KEtW1gVk777KApSkSQlgf5zpWExa860k4/ktHih5
         EUHg==
X-Forwarded-Encrypted: i=1; AFNElJ/vqfdC3ID0eXIi9kA1z1hL0jlXeDY42AIi8eBpEKrbTpmNUGqzUOA+Ygp6UQqDnjB1J/wrPYWQlnIf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8lln1eaKODspgadvUVYwIgg0PZBoyDgzYogpdxyI/gTNRSopw
	iEM8dfoAmOOM6tT8971a+wok6UamrybdA0p4AblPdrupIhhYfYfbwkIWLwLtOmlL364PWJtlRoq
	p3MqVlp4gsPyi483AALWRuc0bNvGjVP8=
X-Gm-Gg: Acq92OGObgxoP09JhQD9Kf5IQXJFEEJ2iTkN0z19w2ZBmUxj3m0TwVpSZKpbfdzTZsC
	Vrgth2lgxHhicNWZtV7pSzqAa44s6UNoJkvtTvG1buj0lu4MpsO6kx431XCTCgCyLev1tw15ttx
	p8VBgmDgrg3mfN26UUqHGXoNwecXNB3iVc06fYMT4VAeN0h/RqWK8eJGg6LtKXxlvFtY9L1fxd/
	RY2Gjh8tdDMGkk6psM8NlrypD6vNnVySuky2iC60YJ4hVvRwVmRpEXIIcD98EBfoEKqEvaxfVQU
	HmUBI0ol
X-Received: by 2002:a05:6830:82ec:b0:7dc:5899:c711 with SMTP id
 46e09a7af769-7e4ea06e807mr12155754a34.3.1779130788484; Mon, 18 May 2026
 11:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427182412.3666971-1-mukesh.ojha@oss.qualcomm.com>
In-Reply-To: <20260427182412.3666971-1-mukesh.ojha@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 13:59:36 -0500
X-Gm-Features: AVHnY4LvXLvEiGc0M61iDSp3rJwidmLTqLdTvLhF4D9A7Y_zOnZhpQp_gao9Op8
Message-ID: <CABb+yY2Sif3t=ZNXpeMwiaDNzTgdmjRmj9v+x15AexjNOs9AjA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: qcom,cpucp-mbox: Add Hawi compatible
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 1:24=E2=80=AFPM Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> wrote:
>
> Document CPU Control Processor (CPUCP) mailbox controller for Qualcomm
> Hawi SoCs. It is software compatible with X1E80100 CPUCP mailbox
> controller hence fallback to it.
>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.ya=
ml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> index 90bfde66cc4a..167ee222a163 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> @@ -19,6 +19,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cpucp-mbox
> +              - qcom,hawi-cpucp-mbox
>                - qcom,kaanapali-cpucp-mbox
>                - qcom,sm8750-cpucp-mbox
>            - const: qcom,x1e80100-cpucp-mbox
> --
> 2.53.0
>
Applied to mailbox/for-next
Thanks
Jassi
