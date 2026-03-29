Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96133815E9
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 17:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774804250; cv=pass; b=h4btC/p8xtiQD4H7565TGrzlEZ5A2k2keDr8mr8oRC1NX1gi2UyJyVJqtq6cBHtuDiMnNCPHKdZMlmzhhxMVU4F48NpBLVq2/oQbS7lF6/BfeYdQmICrsXTDhgTDo3mEuQBrWN0Z1B0icVVl7T2fJgxrKddBGAMUrEK0MFvaIn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774804250; c=relaxed/simple;
	bh=rsVeJPHdgyOCuxiECCsr2glqWzke2yPywwPZ4x83Vu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jd26vEgrMhDghX6o5y9oxK1/d96PoEVsVXkDR7HFtS6TqC1geIvN7DYaOs75mqb5Vcnb4B5eUEhwObA9xxkFOGwhDp2syRU0wvOtWu6P52i7bLNfYYw7/K4S4toPDen9jUjYppvmHy3iEkjW0Jb2m1aOJNWg+OsO1rXXNYjDVvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3GhcnSL; arc=pass smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3GhcnSL"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-46708149af2so2151076b6e.0
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774804248; cv=none;
        d=google.com; s=arc-20240605;
        b=HeInzM5S4azhI+vT1ztamb+7FH01QQAvFT4JmVBvz8boSUSI13RdpDF6z2kXhdLJq4
         Up2rLkQFJ1tUs5py9W9J4w0xQTOW95wanTazsgpkK3M0yaNaTTufdxqu5bxFc/KnZfsI
         cIgCcp9NeNaifM6tCuq2NukT2tEcW0IFmIAO8yy3eq5mNAJdnQl7HbwIJ5WBY7dRR///
         8s2UcV71NIWTO+jPeAw29wE90XOjJNK+z7B7hPMmoqFTXG2+e5PvaUcaUTTg1JbdiGwW
         JiqiKou2yWX8ImfHoJlRrv840X2C4CUB2X7KK+R/Oia/7b9V3ph8ZzL31nLFP6/0HayU
         kLTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZlxbdeYNKU9+jEQ+FY2jeitF0szXbRjABBRQQBT4p78=;
        fh=ZwSXUKvGypFEzggq8tThpXvP8r0OWk+M7DXorCCyics=;
        b=JaCbNpbIpAshCf3HOS7Ph6yUUQ0kizKxbDlwqfeb0rN3CI6+P0Q1e7l2rBCZALc1Kz
         7MAU4S6XgaGNFYPg/bu/bnAu+6d8nsveTEOaH3zdmoDkJmoiVUYnjEdE+ammX3ZoEk1e
         y4lLaRx0lvaesk1b0O545WG3APFkPxzDoEc5JG4J4XS0lmR4UmsCIAxlFu2Wd1oTL3iB
         WyBN4wOU5rrZZW1figW7HD6MT6GYECiof51TYjfH4akz8PrAeKuYbucn+HYr2acaDrHJ
         98uOVGDLEwct3EfUQ+LxH7BKpZjCBJWDTicCVDaz3YfLGd0I4fSidekKH2+jUSB5547R
         cgkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774804248; x=1775409048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlxbdeYNKU9+jEQ+FY2jeitF0szXbRjABBRQQBT4p78=;
        b=Y3GhcnSLSJ/aDcuVKwWSSubu8zbUdIEgANQ0WCfpTrMDMfxCuPOHjYixeOMaKrHa1j
         Gq74lsXiaRMuMBi1+9DyulDSlCiC+spSghaZDaCk7w5XoxO5Pa09a4K/YlCIFM1NgG4f
         RTC6sZdZUXYK3PfuH0zhfMvDTD4fkcUblyTy9P4lFU+5CaAW6D0+MVcMvd2HR8Et8FIt
         zopIBXe1yhqMiBUV2BBbgo3Y0AnX30eeg2XZM+fj5FZ0jYbNoWEFn8gA/41zbajCwX4o
         lFBp9nBrCoFTXHHAbZyOP6D3NldxSZl7HSLQrVNLul4o7z3ZjOmqFbjA+G9EE+j8rffI
         iIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774804248; x=1775409048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZlxbdeYNKU9+jEQ+FY2jeitF0szXbRjABBRQQBT4p78=;
        b=oKpwvcHmujfrZhR4zHj/z+Gwk/S6V1+eiXHUX2sZzWVAjTnoPWjwTk8szf0OeJwIND
         XmPXduMGW5KJ2Cmh8EXLa2PIPKyM9QAYR0GMNMmfkHI8OHCYh2rZcDUMrVFq1YHJlCen
         A3iIYeYnDC2OE+9y5x0vQmzneGUnFp+nZHK91wtNiAhgjEjhVpUU/Q9L3XYoXLE9ae1m
         tgDatNFdYVijj0uJIQ2l1my58OkJz/2nQVqFP4GF1B5+FayDOvMyt4zmDHsXz7pksMiU
         Lrir16x3hQkja8ZtJAyOJ9KmW0P28Kmo3RpKxkkBJNvqgy/iHa0jpAmX6CU4wJD1QjXQ
         ly8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZE+EqpVfKwzR8hc3NNNcpX8fitqtdzrmRY708FbpslTXmwfAsSe2hPNktRC26VC5StMsuk8vftMjA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Rh6e9vMWenRT++/SXvQ/ZgCfDqq7Qbfwxd+HgJtQ0THDaa0N
	GmXkayJ+QyMG+lJT1rBnT0GrUN76PJfQ2tOYlLlAUvWg9ZY4Vq3Uyni+TbT3qL8JrqM9j36yURp
	JeCK+KITAj+/8k0TR7Q37pzNE5G3EmIM=
X-Gm-Gg: ATEYQzxBlIoSRfPvJeIkULCN5EWgbtVq55cxAe3MzQ3rQALpb0hJepMllMBeuK9bUCs
	4jqzlAKLrhg7nGaYTZ+ONVeR9od/ft7/Evnb2LTSMJaSRGTSgcEQ/A6m4hOJLu1YPEooS9Bddws
	J0VW/6nDLd7rOJh/zsizm8OCPCeLjkHCPjZ4lqZa93vqkBiUMWdN7qeqrc18biETe83QiJ2OyZ5
	+wXhEmqXJclBPFSDN9RzHXe0TgSQSNEZFBEaM4juahBbMAJM4sH50PXb6GYzpx6giFfyxOdtHuo
	FQvBdMPIiCGujibcXjE=
X-Received: by 2002:a05:6808:5296:b0:467:133f:ec2d with SMTP id
 5614622812f47-46a8a5ed427mr4757024b6e.42.1774804247851; Sun, 29 Mar 2026
 10:10:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-eliza-bindings-mailbox-ipcc-v1-1-3f1c89bdf72e@oss.qualcomm.com>
In-Reply-To: <20260327-eliza-bindings-mailbox-ipcc-v1-1-3f1c89bdf72e@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 12:10:36 -0500
X-Gm-Features: AQROBzALnYSR6ICZtBkS1SOfWG29206cWXGKz2mD9ry34Mbei70R0dkKaWCq6wQ
Message-ID: <CABb+yY31SMUKrTaeu2mq341GM0v+waT4DmoakhB6FK4Kx9XC=Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document the Eliza
 Inter-Processor Communication Controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 7:36=E2=80=AFAM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> Document the Inter-Processor Communication Controller (IPCC) found in the
> Qualcomm Eliza SoC. It is used to route interrupts across various
> subsystems.
>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/D=
ocumentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> index 7c4d6170491d..f5c584cf2146 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -24,6 +24,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,eliza-ipcc
>            - qcom,glymur-ipcc
>            - qcom,kaanapali-ipcc
>            - qcom,milos-ipcc
>
Applied to mailbox/for-next
Thanks
Jassi
