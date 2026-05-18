Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803E03845CB
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 19:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130952; cv=pass; b=Yiv8Wbx57EAUVvDzIw+806QOUyVgAbIL2xJAFKUG5tgWJRxPFwit3qjDniDwLCd95zbi+sIl8oFUez7/pZqnxP1H61clLPmozrenWU40FUvl3Wk8bUZUFzrS+mNkuF1LlH2J+udeXhWtFJqdebB05MKJQtLyax+ARw/VAEaVqWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130952; c=relaxed/simple;
	bh=glP8DPL6jwr1JobQYteyf46Cqn4HGAkKYg+M9aQ+9UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otUhiGYTbJNO6iZll5pt6lWsijRpZgMxdw1sjfYtm7MpkkBuxJ6f1Cr1NcLKLfiWA79i+sY6qzULQ31zDIMK2+oUbtnth2EVljn5y9NEfdXNVzc0k0YoK5/gu4rACzudGLBNbUhMPXw0rzoPPiSkqt2Kw8fd5+yuVBKAC7OwNYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQZnvAdr; arc=pass smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQZnvAdr"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-47c35be031dso1913746b6e.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 12:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779130950; cv=none;
        d=google.com; s=arc-20240605;
        b=gI65808j3sDunfVrgkLV6X17aeaINxB7dMLFM8RYBTZbqNOaR0wX4Vp/4TtPJ6aNUl
         fq4LxpftsMewROfLJUBz/CZeeCu4klap8oD6UB0IOJBdPpalLUvubzCUvTzW2JCBM3Uq
         o+IbKA9eB9chvMOtutQRnOnA3X3faz1hDaRYMAMuJ7BPRI4iSRtW+RIGZ7De9CDBh/Vb
         fALLZgu4TeX9wxBThqq70mzCGOJmj4BTUNcOyTJhe++4ZqM8g+4UX8CtdVeW6LgGMrK6
         m4Fra1S/F94/woW5P8porfMen2vuaP/iQrBFhlTYXX2+RAL4TA8dPg0AOwGA4zno+kvG
         h8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WvF+QQKvp5JAh6n+YqCUQWQtsCCsh8jEk31uTzMh1To=;
        fh=RS66uEKHuwc1VBAZHiqLnlcnxTogzotrm94shcpYzLE=;
        b=VwsHDXt0cDMDZww/4V4s8IFOuxpIz1rW4cGNiex/J6DgZ8p596DZ9r7GQAsD9bx83B
         kdFrD1A/nTw2fd+BI7UPYDzqba/TZY77DG4yUDEXrWUkH7aJGD7XJdAsi/6bQFxMRxNM
         tMlm4rUg/E3dJsDQJ96eAwRcH+/M58kOVpS2PCygKxVNcwFE4Tz+FYFUQryx/k66WWcP
         HZA6IA0au/3OL2CTt2vV2XMyBoE6k2xlCQTiPi4/BYws3QJpvMciC7qEIs5lAtd8HF3T
         d455vY5c26BKMCdRF2cqj4Xubeb0bwvyeKhKgu8xA+edN6dsy0xzlXZJvdXilcJDYAxh
         QI6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779130950; x=1779735750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvF+QQKvp5JAh6n+YqCUQWQtsCCsh8jEk31uTzMh1To=;
        b=LQZnvAdr+6YzGUClYIxzPVbTnW+0j1y2tdfP8Y4ClpzsWmlfJ0t6LlAS2sahTMFUuF
         sxh+VDTqV/kAeFTvA7JuPg62vfnKB/CA/as4wDVWqHvKKNJFpUaRbibbW2UrM1h0SkxF
         N0RoILhkEJyjatxqCGq9YjFEjZqbZOPkGlr+A260N8Cbu6WOMI062K/4rupI+dkGUqOx
         dSApixAxehs76Du8rz5JOkZPbkHUh1lpWrigTVRavJrRux1n00HtrvtniMtVRVz1ONZu
         BwIYuWafayaOOfxL/W2tX2DIt7DdMcKu+b2FIMki/eD8ms/DPrDIhj8YEY9xuKaSD2LG
         YLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779130950; x=1779735750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WvF+QQKvp5JAh6n+YqCUQWQtsCCsh8jEk31uTzMh1To=;
        b=hoPG7A8Y+YbVh1zmj3PYt+0oAPUdAnOF5B3IyIegfB7xSgUY6sZH2KO1I6vnVyZQsR
         DCH6PYEsAQveOat/09WhM3istP8aE5yJpRvpuo6t7is65rgo7dkO3TSLavnCij0YEOP6
         U9zX8TRgNHz+GeGQZoTh6MZ9p57TUYCpa0NvvNsT/bupzOrEHYItZ2fO9qu7UgJzYKuY
         bRKmDw/YLNZNW28tjLRdLtS8ggmXubcTepp0lYo9KwylJVUby6UrzGNF9r4fTIb15l9b
         xLdIw2njsNfo2UJmT8YeU834TckQ0FEdbFlqYf7kXLM0cdO2qR6eJfg5BKG2y9pnLKRk
         dF1A==
X-Forwarded-Encrypted: i=1; AFNElJ/5lUOxs3dWyB9dgdd+YCxbDFoWIGOPXKaYDfCsCdnxqbOl+JefI4RNB0gIniUChcKspkroHZl6OIXm@vger.kernel.org
X-Gm-Message-State: AOJu0YyuRqy/DujZecfRSn+q1RqFV2FWW1ynN4ZELcE7y8XOUgaM8EVP
	ZiDgc4chJdIDz0ULvUjzGoaaY1WorLnmQ0Tq/O+Z19lBbxhziPJsVA5FVf6cgFVtGAyqKyXrhk9
	ZnkQg1z1WmWKf4B1iFS88ZCNMWBmEXkk=
X-Gm-Gg: Acq92OFmqis5BJEXLQJ15hhY4gBvDoSSya9c8JyYJKVazgnQLsrdUDS5TJ31KBi9o57
	w241sDt/NtmBybr3tnEyExJh6roFO/A8TaZdwGBNngfLbzCCOZ9Huz2YY2oJpz2vapipBP6ykTC
	c6C/zueLAOm3QIyuUHVTzLmSOBuoRNsGITQAebp5eJKoqDyedFv9nQpfORaqDkQwmJw+mcuCE1f
	fR69gnnh2tNpm5N9KYUxeXjdZZ/pA0kKzuKNX554cR3e7kOF1/9hro8xkiEQTAtus8BILYdegdK
	rk65CBJzcTbRCIqzyk4=
X-Received: by 2002:a05:6808:c16c:b0:47a:4fd:95de with SMTP id
 5614622812f47-482e57bbebcmr11900173b6e.44.1779130950436; Mon, 18 May 2026
 12:02:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427005236.230106-1-shengchao.guo@oss.qualcomm.com> <20260427005236.230106-2-shengchao.guo@oss.qualcomm.com>
In-Reply-To: <20260427005236.230106-2-shengchao.guo@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 18 May 2026 14:02:19 -0500
X-Gm-Features: AVHnY4L4zZ_7_kwrJIR6IMsP8FbD1-FSMRPeQMcTI4u2e1QXNzCJk_KWHeP9sFw
Message-ID: <CABb+yY3mjH-aWB4KkfK4LFuux-sC0LayoaOo2EvebH4i9nFUxg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: qcom: Document Nord CPUCP
 mailbox controller
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 7:52=E2=80=AFPM Shawn Guo
<shengchao.guo@oss.qualcomm.com> wrote:
>
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
>
> Document CPUSS Control Processor (CPUCP) mailbox controller for Qualcomm
> Nord SoC, which is compatible with X1E80100 CPUCP, even though it support=
s
> more IPC channels.
>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.ya=
ml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> index 90bfde66cc4a..c8107d58f3d5 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
> @@ -20,6 +20,7 @@ properties:
>            - enum:
>                - qcom,glymur-cpucp-mbox
>                - qcom,kaanapali-cpucp-mbox
> +              - qcom,nord-cpucp-mbox
>                - qcom,sm8750-cpucp-mbox
>            - const: qcom,x1e80100-cpucp-mbox
>        - enum:
> --
> 2.43.0
>
Applied to mailbox/for-next
Thanks
Jassi
