Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0363DD522
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283679; cv=pass; b=E+jKQOB56VPO/M6KL9MXfaWPtpp8jobofhixJn+qmXW6mSChai5VtwLj1ftmUoy3ezksDQOctsmi9julw0TV2Xw0MUmRXo/tYcLxFFlXD+aLEi//B1Unb6qGtfmNiRjSlfRaV3g7Lb1Zlh8s/47p2Pm2l7Sd1tSm1mmCEiVl8ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283679; c=relaxed/simple;
	bh=e/UFUu1HfFn6538kphTVwWa5FV2s/YJlDCcIhCs7g5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kfO3gvi9zNtzjUjmPBu+u8d/j3vo1qQBI07AbYeHeGxvJNvdqc+JMIsZ4d9mXz5/4rny/xCjfw3J2/ZJZyfk3cgI9/IKnHACMOfYGZHIzTrg0L4/IuAFeCELb0fgp3oPXEoSw49qkSUAuinBCQDT8JEgwelp0XV6nokmtq/Pzr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1kklJ8Q; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1kklJ8Q"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-917bab38b14so31596886d6.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 03:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791283677; cv=none;
        d=google.com; s=arc-20260327;
        b=sgsj7xLFuG1JCXmqQuVqTriItnIsd8D7fT7v5VcxRx85fyvHXXu2pnABz8ghwtwBv+
         hYj7Feac4rxeXlht9pdCVQM3sBlubqezk4cEhU5mK2FzU/ixLfXkKaQ773HAXoSgtsG1
         SHVXAeue9miWUDUU3u7I+308M+FieTmrt/MHe3RAvCuT8F1eVCCB1OGb14IwZV/0qR1A
         vQw7WSlYspjIh09xWNpATF0twNZVMIpEfo/VUWS65D38qqsJqwKLjNNGLomqbXxEp6pU
         G+4s6eHt79GB5LQehbRQeAfgDRi2IGUGdjWFjpdpCYTOo6ha5NaOdzXyFjUi24+yRyb9
         qlsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SYZusaEHeQJp9+PNNGappmpwDZuJKs0VI2BXqV5hxv4=;
        fh=6qOcBvqzyLgRfLi0ZWdGIq0x48T4tXpf0dC3E7U7zYU=;
        b=B6T+ONh0ZqoihzhcaDchLefIa7Vq8UjcD2nPqegRDhNClTXeYKhdrJFNpQ1Wuhq7nb
         xzxiT6+BCxsV65L1rVeMsPteM5rKnVE4pv8s4NIMZ6DnfAQ9P+PrBUZkIsPVYgnr2t1G
         GunLGr2jjU3Eb2vF7qPM0epWmBcZRjACZSeayOK+9pxp3PT+OJMC0VQEplMYRbSEiGc0
         6qMefFNgw0i648p3wOEbLPquSz4NTBnHaKx7Mphx8LQImEnwNltNi49nNPykZzDBaBw4
         KUVYSkHrmjcYAOvEGMZ5kNjWGN6TgfwR/Dc+JRArL3KjfRddyceg/ymsq5c970ZjftUF
         vlfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791283677; x=1791888477; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYZusaEHeQJp9+PNNGappmpwDZuJKs0VI2BXqV5hxv4=;
        b=a1kklJ8QXYoIGi8lOlZsRO9VraF/W//BIFsd966H1Bj7WVBE79q3p+MOh3/Cq3rtPn
         efHncnYAyQwhVVLjyDJBGc4At7S2q1wU9nGH90Pd84kxixRkYGsQGLpSuNbeJP6CdxiS
         /x+WHdhXXi/vKTQN6cFFGphbo/TWu6eek1PEA5oQ3mBY9gnu2po6RVl8ctUNlNUT9rXs
         Mq0Gq3djU69YqAZuauI4rdv0XviL0YNEfPbDO3imnSkjvZRyU22Frx6fcOcxuaSYGRO6
         K/q6mG6ewNrU25RPub0hkE+EB9ALROElmYOCgv8T4mUB72e374CDNi7XQHqmGOTe+h7S
         sr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791283677; x=1791888477;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SYZusaEHeQJp9+PNNGappmpwDZuJKs0VI2BXqV5hxv4=;
        b=XJp8FrmLHpneLHs/rrAs/A1bWpJGxghwM/VazcGI15bncXrg5+npUMiUiNk3kEMsQP
         HdmJQDppCdlrKb/DfY6thJbjvLC38cClyxoLpbPpzjcNnNMYb/4N2i9S6IywEv4FeUGL
         xGbZfPmcXlHCJfHH309RPtHUcOtW6VPLQAIo7PLJcDiTEgcCW0Yes9XnLQiMyzTQ8rL1
         IXwbmANGVbvjKO5aeIrQDKqyqrh0K9xmr+sTYeCzUhYlnk9Bo22iUhRVLhPOtLyt5bZT
         LhMtQtBPxAwLl1y1W70kHTJS18vewPaatAw/8IyRDO/IvppVfel5mpBy4DMnFJNkp1gV
         WZmQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0QqkhEZkRtWQ07u/208uwOsYvDZwG1DNdk2nhzHbFh1KUCPTDIl+XCYS/Wm83FHD9y48KBHSd9JBF@vger.kernel.org
X-Gm-Message-State: AFq9FYJAC6OYcNEbHI8jWU6MVGLHWuTGRIAX9GdxZc2yx0b5/b/tVhid
	9pBzOkXMgvI5SzmXtjCBFsEVpNY3qo1xX8GNL63lnpWIpiNtH5i8q/83eEWvOp/lqwZvh+YvNG8
	fBjXISrMrr3nmcmPo4EO86UkfqY4iyWY=
X-Gm-Gg: AYBFou2cjpsRl33B+HV3TEFPUpYWGfa7Nd8Mo+v8Zj6e3mHc+yNEz59SC2d7srxcJqH
	xCwRWlWhc0yP8w5SsydmVeP8yVJdcVPWgmjXM7m/7G5ftQLQ7nJAuLM5leLGv+Rmeq0qmj1GQpL
	Pwq1Sy5bYEhg3v59KC8eGWzJTg/uwnMT8J+qpS4XjX9DJxYx5h5MmcyqgItUrj3d0iazl2Pxgg4
	Muoe0OiHYKa7u81rfLpK1O18Qi0DKEcVoXtbOCC3mzRXcPL2zTZCxlsODnWmUA7vHNa9oRQmuRl
	DqS3l/deCLzxIlx8chuO+bS72S2rYX1k293iPajzuh2oOQx/pGu7kOFr10Lhxo+1Wu7GsBxnbXo
	LzINlv8LY
X-Received: by 2002:ad4:5fc9:0:b0:912:435f:1a8b with SMTP id
 6a1803df08f44-9198b7a05f0mr16247936d6.22.1791283676856; Tue, 06 Oct 2026
 03:47:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006102937.10972-1-ansuelsmth@gmail.com> <asTRQ6d0-NYOeHqX@parshuram>
In-Reply-To: <asTRQ6d0-NYOeHqX@parshuram>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 6 Oct 2026 12:47:44 +0200
X-Gm-Features: AclHuK9fa-eKez1qMwGkLA8zpyrdQxMIu76X1IlFgkWsR3UIRNVxdiubkFU4NSU
Message-ID: <CA+_ehUw8fQHGef_L7YPQEf-wwuzP9km=G64Ty3+AkvM=fkNJ4Q@mail.gmail.com>
Subject: Re: [PATCH v14 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 6 ott 2026 alle ore 12:45 Vinod Koul <vkoul@kernel.org>
ha scritto:
>
> On 06-10-26, 12:29, Christian Marangi wrote:
> > This is a major rework of the old v2 series.
> >
> > The SoC always support USB 2.0 but for USB 3.0 it needs additional
> > configuration for the Serdes port. Such port can be either configured
> > for USB usage or for PCIe lines or HSGMII and these are configured
> > in the SCU space.
> >
> > The previous implementation of a dedicated SSR driver was too
> > complex and fragile for the simple task of configuring a register
> > hence it was dropped and the handling is entirely in the PHY driver.
> >
> > Everything was reducted to the dt-bindings to describe the Serdes line.
> >
> > Also the property for the PHY are renamed to a more suitable name and
> > everything is now mandatory to simplify the implementation.
> > (the PHY are always present and active on the SoC)
>
> I get build failure:
>
> drivers/phy/airoha/phy-an7581-usb.c:7:10: fatal error: dt-bindings/soc/airoha,scu-ssr.h: No such file or directory
>     7 | #include <dt-bindings/soc/airoha,scu-ssr.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>

This header is present in linux-next

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/soc/airoha,scu-ssr.h
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/dt-bindings/soc/airoha,scu-ssr.h?id=11952173d8a180ac05641775f80bd6946327478f

Introduced by a clk series.
