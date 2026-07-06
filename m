Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A8F38E126
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 18:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363481; cv=pass; b=Ng/fuXLu7w4LJsXxqPB+6n9w+psvA6C+J1TP6BXVa4ks9+IYAf40/QvPFR1B/AlXdpAyhaESsPl8ahVF83KXcgPXo5VFM2deQ9NI/j+G+X+vz7Cxjg3GqrgwiIZjXn6wRk+CGR2Bui63cqZ8P4WRFlCM5owA1oazBPUhfhmQk6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363481; c=relaxed/simple;
	bh=PQ/1xy6a3puINBaYqT2e7b7BbcSZZGAO5m3b6c5J4R4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RWmxCYvzmy0lRxxTALUQeYEfCT3s2/SOxMy7/8HxP5LmCsh7fE9oCVn4hfKfEkQsNjCwiiQOYa4fmgHNN2s0oYWGjV60FqJdaTbP6U0WDJnFIj8PEa6Cb4JTETl63+FGn398ojAA2sMbG/O6xxQdh4NzAQnsVak6HfeG326Pb84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+BifvUw; arc=pass smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+BifvUw"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bdbd631a6aso78178e0c.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 11:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783363477; cv=none;
        d=google.com; s=arc-20260327;
        b=CSxDdftJf+r+v0OVxjumizYtZCFYMLHmqXxA/23nKl4wGv6j42o+V+p2VDD7bhgtBr
         w8+l86U1H5FqpEvdci8Iax9k6p/Ut22g1ipbnk0I3HV8/k6gzNTV+1uV8G2Zz5AFbaRK
         uA0gx2FxDjBJcVo604JjK3pjmrv0H6rPy34dKXjODDy21hhuUCa1Qe5fm6I5g8+AwKPB
         OBNrvYqhvh7b6geig5CY4yrUYisq4tYstL21tIhZSPABLWxe/kjK3f7VLSDoZroWpLVN
         dw8kFfTZBJ+Qq43nWM71PYb/c7mXyF442fI+MuwPJIs2hcTOo0p4IFj3F3/eEaRuEcGR
         EwMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fZqkJjaKpXhp4TDNIgLLDiBbOKbRzti84NpGMNpZWKU=;
        fh=pGt5FMq3U+wgl+pcghvdwuw4ctmCkjVnzGugcYbXVv0=;
        b=Pqk9g7CRdT8xC01qwmJlHmZLyGEK3sJwyxozbG8jhxMZ7EZESU4oppNK2WtopdX6a0
         on+kLje7CyRdVANp7MAEZFGkR5o5ADYYmHkhRuAKRimzzikFnJ8UiEDNUwylQCh13I5c
         x+FjbBgEuzIxkZdUYlMKA3yGjtVoeX3xUtB8DhUA21JvqQuLCJ2hiWeC9iZ6IQ36ZwTD
         vYi8Yl0JPRSdiKpRtVqEnGDnRNGVH2Y+Tucx8di4lwl7T/5/ss5bU0oJzWh3/DE253oU
         gPtubqeCwry2cEjt16OhoJDPPVls7617s66/dIbjiIo1t/Qu6Wciv821zX4o6lg9cFaM
         Y3Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783363477; x=1783968277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZqkJjaKpXhp4TDNIgLLDiBbOKbRzti84NpGMNpZWKU=;
        b=S+BifvUwqarWJhlaSB3vYgNzuLegW90rf7FdDDYlGKVINNsx3BteaoVm3NE+uzGhZF
         AwkJqeDjyk0PFiZngw9NCLMeI6pGWjGqyADYU/a+vDlBlaMaP2ujmUGpm4KpUNtcJjBw
         0sTBcZxBTUvWElElg75YuoUwoMGsK0jSlFsiDwpIJGGGVJYxZls8X13auQchT4bXcC2H
         k/w3bOGmv8J6UrxvepjbHU4+tdDMqtquoG4sh006EkZlvXgnaWNKNdpNm2c9Yjh2OcWL
         WfRRBPx7TAK1FbtGtsvCiBccFMleO78N4wow13PpVEQz9AaIY4aONYLRxsKS+COtncTl
         +Gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783363477; x=1783968277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fZqkJjaKpXhp4TDNIgLLDiBbOKbRzti84NpGMNpZWKU=;
        b=Gg2bvmoZNlmIgqvr5aGJc+dc4H5+HCBGsqOzYtOqizT92vOKe2khjyOp+E1vhRxbVA
         MDcrtgVm3mtYxfr0LRHE7E4M4WuLFymC5KIwqfrogVIqjxj3yiXk/nTzwab9jPeQkR37
         RgebRA1Inu+bz0Wd5Orl65Ba+Ffm4lsAegtCfI+4bJJSCwvxfSiDsU0pONS9TQorLHJn
         jQcslodXHoS3Rf/JKOsWIafDRwk9+pcMFQNflhoOZGfvhK1QNeq9HNT2Onc/MDj0Qdva
         gjL0SR+UdKuAdyxGroGcEwOApokUjILp6k//fLDi4JOxoaawhYCJyZRQqtTnI7uQGQVh
         z2iQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNdMa74zLkgoo9cpjXhdPUtCuIwibOrIQpS9eVkQYXoQVbdVJi9Sy/0Ok63YB2EtAngHvtkFi9oQPe@vger.kernel.org
X-Gm-Message-State: AOJu0YzBWaZY6wuS9PhRCPBB1r/O2xSlrs/5b5Cal7nDMUkImm9ncefg
	tDN2MW+6OPB740hoGZnUefoNSyxU+rXa6YrT9uQYK5c6sFxaEqDT2OzTp9EShza1k60YGl4TUGV
	Vj8udou66DGVyxQmTWqdXEc7u9wFniwWD515+vdQ=
X-Gm-Gg: AfdE7ckFMhoigH0XMPTIEjMTUJa73T5A7+vS2IAu3oQ/cj5KCXcmw+jENYUopyfL1XX
	8nyjfXC0VKk38DIjrPPS/Rta+vu+bxXq6SlC36P9Sb++VOhrxoYeDmHCvKzsYEFJTDdrHF5IMby
	XkPTKhfky39ykbD+zg7Ttq/Tr9Ny0PUJzeo/aPOA7yb2DU/wmfprHq2iHbisTXNUBmIxlxJT4+y
	iQMSYs1WUO3assdQgZDr6SWuHjQEiOw5L7H2rxegz+hV8cCBU0+NGrxGX9ZKWu7pSPCuaUQ3Fmp
	TwABn+/3AwvF6Q77Y0Xv88gi5VEc9cmXWdfSF1zffDmi1ktzjooWNhaH
X-Received: by 2002:a05:690e:11c1:b0:664:c5f8:e342 with SMTP id
 956f58d0204a3-66780d9d9bcmr1088563d50.3.1783362991520; Mon, 06 Jul 2026
 11:36:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com> <20260706-ipq5018-bluetooth-v4-6-350262a30959@outlook.com>
In-Reply-To: <20260706-ipq5018-bluetooth-v4-6-350262a30959@outlook.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 6 Jul 2026 14:36:19 -0400
X-Gm-Features: AVVi8CcGJO8Ch3pCjXKhOWgi95XsZ_kdRoHC9Z0sM3JRFuLLpn2tg0JlAJ13czI
Message-ID: <CABBYNZ+6BYa-CrC08piL++ysOomiWK2gbYAv3ecWwpE+RpsNOw@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] MAINTAINERS: Add entry for Qualcomm IPQ5018
 Bluetooth driver
To: george.moussalem@outlook.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi George,

On Mon, Jul 6, 2026 at 1:27=E2=80=AFPM George Moussalem via B4 Relay
<devnull+george.moussalem.outlook.com@kernel.org> wrote:
>
> From: George Moussalem <george.moussalem@outlook.com>
>
> Add maintainers entry for Qualcomm IPQ5018 Bluetooth driver.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0b9d7c8276ac..60f7251d1a16 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22289,6 +22289,13 @@ S:     Maintained
>  F:     Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulat=
or.yaml
>  F:     drivers/regulator/vqmmc-ipq4019-regulator.c
>
> +QUALCOMM IPQ5018 BLUETOOTH DRIVER
> +M:     George Moussalem <george.moussalem@outlook.com>

Do you work for Qualcomm or have access to their specs?

> +L:     linux-bluetooth@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/net/bluetooth/qcom,ipq5018-bt.y=
aml
> +F:     drivers/bluetooth/btqcomipc.c
> +
>  QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
>  M:     Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>  M:     Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>
> --
> 2.53.0
>
>


--=20
Luiz Augusto von Dentz
