Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792636361;
	b=cxpojFaVj6YRsIsM/XnEA4bIPvgQVP5Jl/dnPfqLqH3mPcQGwLw/J4SnyPzMw1BOWZFb
	 KOz3QwTOkWMTs7FRWdw6ATRdUxdMyZmVZdqS8/s7pXf39iM2bJKau8Eb/CRbeRTZP2zMS
	 IcGcuNmU0t0N9dzZE9q8Djt3yrn4qNvI4cJfN38hvYtdp9y841IpOWg5RogiUbi1FR6DE
	 DRPUfxUnygKhfMjtYjxO1PZZeueVA8P0FKtQjsErsLAPGL2uUXgKO42vcfMf1HBaJZnLO
	 HMMPkndU3XFT5olingSOnELhNdUW3LQLoCoeZf38Biqua1NqorzC2EpHDoGQjwF5NdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Q+uH7LfbW9ctIqeI5N5cYZFPbAGWdBnqHFnNZQRtHCo=;
	b=kgaLK0JKdsMDHLpHq4I7kMZD4pdfIA7XY/kSml0dn0JtOVwMR2np7e3Ht3q4/5Ukq6D0
	 Aq+NO1TfSBavIZDMQc85MTtAjRWn5cLxEdYvFPV7Pq+Ssz4+fvzGBcyMYKxb265IGkfaj
	 JgJdaC1wbrV/ag226CxfKIxT3ONKRB8/aYp+M6VVJ/kWnpRbttT0DV4wSpnjBBYi6Pb0s
	 Dizfh675CgMSIWJVAtm1gE/Qjwy1PiZV7fvOZYX0KS+bGO+kSAZmvtaKVQT+RUICEG8KO
	 w9RDukFufoKVeQ0DlcZMivudvt/QODr/XOK/2DEiV0CqnytJo6n4j90DxkeOrM72gMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SWchPIps;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.131
Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287DD606A31A
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 287DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SWchPIps
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c3e0e38c8c2so44067566b.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 19:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792636359; cv=none;
        d=google.com; s=arc-20260327;
        b=a8Nv5XvCyako55BE3rbV0B6n+MwKhyBQQy3V1nMdE4UJ/Dg/b4OqWDcCk8X4F3IE/8
         7grNkKnu89WO4ds0WnlHDLfdylhML+f171zIyE87kfpcQzQjW/SMaC+uUaaMF2iGJxjn
         7iSWKzrooTy7PxR1MPThys16l3OCNWB1XzDYlw8dRcxZRb5js6ukvbjomXNCcUufyAqb
         hRiAcjozOX3g061DDo5BY7/sWLEBMRdrfp7iBdTE/XzuohKLd+3W5bpfhYDjnF+ZCK3W
         C8tNR5fFZF5XlIj9y+Y4oppbi168DJWRe6D1NL0QLdUJpHUt7WPhbpoxjireKGptjuC0
         M87w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q+uH7LfbW9ctIqeI5N5cYZFPbAGWdBnqHFnNZQRtHCo=;
        fh=wQ3/h0bLOuSZTCFpzFm44ZEesr1PupKN4LBw3UGKyOE=;
        b=r2/cfr0iKYzjhHkEoAwAZQI5pWeSza36QQnI79ewgEFTkA/sTQg6QgNXHOiHRqkltS
         2Ndd6q177xzZdvcAiL93PVBSotJ5qz2SNT7nHJCG5gyWr993ukurVPar16DJzw5cQIbK
         Z5EWCsP+DOPQDn9CwhQPlxBuh4XMN/g/2kJ/+h/KuWIW/jgboSEb8UvtZqP1mevQUjB8
         fbnI4I8PhYME9P94/UIRTtMfAdpBO6vJzuIRFUaQS4le6tPrvDomtmhUjjc9YNxEEDKp
         ClNjhBuKlH8/g2lw5SOqkHGF5AwBEyn7Q9iRw1vAHv5bcfQ+Mq6BchSakFwCQIgoOhxc
         U9MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792636359; x=1793241159; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+uH7LfbW9ctIqeI5N5cYZFPbAGWdBnqHFnNZQRtHCo=;
        b=SWchPIps0wF0LZgoDv8tkc2AmwPfkcYTGLPWl8UCwAj0a0efCcc/cmlHa8cLTYNrVm
         SIXuGF4slC7PXMR98oP+hxhoSX4497KLNSaLLLMyzaYZBmG87dAl9lPtw+KxRuo1zgq+
         XRcOoRJQSaM+lBduwVlI+j97aMMUkeiWA3rJafjnwfzyCXxpN/f9pPjCkLbYZU1Qq3T6
         4L1gsefHE3/yPALC/pN4A5hPGTozNUv3846ve/vtmT/lLlwucIpa0wHEovmA/EHTPM1U
         CkGbiYb0yY6Pde9BmNqqfcakOiGJucv9p1NvAwU44drWj9/onQIQ6IEfdFdtKG+uOPM5
         ucLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636359; x=1793241159;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q+uH7LfbW9ctIqeI5N5cYZFPbAGWdBnqHFnNZQRtHCo=;
        b=JGx9r6Sk9FO3ek4m5BbxNX5diKDuA2rd1OG4bF66nOEPV0MdGO7HJ3gDpDX5++TUOc
         C+N7FQDbVQmComljGgE+PbzWS70yaeYT9/LuCxp2qgnaYsbAtFHcAmJCkeOtVcthx3d3
         HDBJf39pKOgGo9T6p3Glas04BIfk1FC1XDz1LwNpd1YazWFgar8ftzHXvKdudqYW+6r9
         srlGH90QUOk/mVgcVokuZ65BUUfoV4nNOlOLCg+P+4Jp24cnRrOCj1ZyCarD4ROT+2wI
         Z6WrwiANbNmh8qgSanJuFUfoC0d7BjTug3ZqieF25t0VD9bXdOAPWE+BKxf9yaA9siEO
         S+9Q==
X-Forwarded-Encrypted: i=1; AKwUvBz17APCQFlx+9cbunjVfzvHvqLsBfApcfejTyYAQQyr+NFY3179I2KHmzgP6UAMnt1w8PRerwEfTLh1@vger.kernel.org
X-Gm-Message-State: AFq9FYJFPLmmRbk9jG17+gaETE4Ha9hT2G+SwWf7p4yA7awzy5EJx2ls
	Fk/L6JaD402eZvQWpvZpcREu6bQIo6AzylkHsEYVHHasANZQ3BVe6I4hrMSl28C2l7+GFq/XHeD
	gyifQc+PbohsipUNlUKHyeZ0jh2zkUt0=
X-Gm-Gg: AYBFou15IqC9WsR1R4tEFp7ZnPrD7XlIW7NOrOV2gaib36Rl96+MxFm2wcwEuwH/zbK
	VDUk1rTFL1aicds2Fe34aehl71t5YlTqJHES2CQ8HB6f30Zj6iDTb9zdN182Qaoi5VPH1XsUTff
	6MrgUSGx2G6lODQSlf4gFMNXEHMtRsfRumO0WaY+M5Rdi3Vn5pAZ69ro/RjiS+2O9HjIABhNpOD
	4BTZz0jq/gTWH/nLexS5s+Gp4i9TpttGyAFKPW1hEYNkkBbvuXsvh9PaaPpWAv8uC9ZiGbdf86/
	AgTjvUdVh8jRqOztZugXGD/gN//nv1HcaSNEQTf9cweHFjOtdmdt2NBGWanKigXtHeTaIAgIxhD
	B07qnYBMd93cMqiDmKqW17F2doEiiN3VAGlwh42R+qSAJCIV3U540bXqxZvUB
X-Received: by 2002:a17:907:9347:b0:c2e:4f16:fbf with SMTP id
 a640c23a62f3a-c4679797086mr354694766b.31.1792636359268; Wed, 21 Oct 2026
 19:32:39 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261006162807.2843858-1-coiaprant@gmail.com> <20261006162807.2843858-3-coiaprant@gmail.com>
 <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com> <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com>
 <CALj3r0hSyVpn4Upbun4DOk5hdOH+fzEFG2E3LpfvS2YUXH8twA@mail.gmail.com>
In-Reply-To: <CALj3r0hSyVpn4Upbun4DOk5hdOH+fzEFG2E3LpfvS2YUXH8twA@mail.gmail.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 22 Oct 2026 10:32:27 +0800
X-Gm-Features: AclHuK9kgEi-QHylQHY7HMeWPzlEQ4T2NynHaEv25TGkNX-ohXQB3EsA_FVqaQo
Message-ID: <CALj3r0jg5Ht9UUJGryuNdJdegBkPQgSTPSE6amjCr0g0PE7i6Q@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Vinod Koul <vkoul@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vinod,

Gentle ping on this series.

The net-next parts (XPCS glue, dwmac-rk SGMII) are now in linux-next:
https://git.kernel.org/netdev/net-next/c/5e91edfb0e45

The DTS changes are waiting on this PHY binding and driver to land before
they can be sent. Is there anything you'd like changed, or is it just
queued?

Thanks,
Coia
