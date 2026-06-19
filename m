Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5925831D72E
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 07:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781855335; cv=none; b=TgE9TYV8/tXoMMR6RIfrgh/yxo+fyE3MpIJ/ASGA7ICWt+pCZ9vTWzqWOvACqq+2T4qSq12qD5/jjHD9eiwUN73mazL5/AVvFp9A0n6JBd/VnOvZXdNUEgg3EMByfnDhJJyQq4XWii1zyQU+MDEU+rcwZkHZUtJWmVmFMZ5wFuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781855335; c=relaxed/simple;
	bh=I6R+gu+o5IzsxtPriiBLelNCO8cHEeri4kwg6Cqk+r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZtomxyN9IWJLPFwKNmHVXTDMJLZ/9IZ1OSK2vnBAVt6lMhy7Akd1vWPBWUrjSwtq5vptYlDr9uzvg1aQspnbZMtnFty5Eao1FwQNDS1P3o8c5rWm9n63tlutBeoiS9k/8fhRj3JD4Ls98lYhK20Rt7UzQvdKsaURhz5MBDmmEl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5DyzJW1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5DyzJW1"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef29c5561so1061611f8f.0
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 00:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781855333; x=1782460133; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=I6R+gu+o5IzsxtPriiBLelNCO8cHEeri4kwg6Cqk+r4=;
        b=f5DyzJW1W++gq7Cf0wPJ8EzCE1pZDqtufGQ0PFDP6tRysKkZL7c3dxSCGCbv9+cqQh
         M+NSQ7ou2IoW+Pe5TNvysDAzxAcHnBnZSP+anC69edTtBPQ/6TauDtFfdeedmve1n/WR
         RyCavh9NWRerpu0dJ+zq/PF8fOk04wn7fukzrrfiqwRvBZSOVocGrb2ySNFi8mmCN49D
         NC2Fa+6jYNaGiJU5hmKnj/okSUDq8KZBQN2Jb8zFA26QVFSczL+1vu0CwpHAw//63a8R
         agbshO363ATuqA+CZFGRMErM4+Y9ylM31hfIm8d9kzubSvKzlKrhE8e36/heeEUsbEtX
         Sjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781855333; x=1782460133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6R+gu+o5IzsxtPriiBLelNCO8cHEeri4kwg6Cqk+r4=;
        b=OJWbWSQs4XA/ZjA3GZ1DbrqWIJUW/xeu13nqsgFEskJ10nykDRT/OA/YLw5esTL2CP
         H+Fvk/ztN3n9xhzcMiAVz/rnxaV9/MB2EM3u4uUYQX+0/lcNaBjpEYh8L1vH2M1GdZha
         2OJKpVI7QlBLBWGh9rhyKh+srI2k1bK+s3EtH8dTT6pLcIWh+4oWHMjGUvGHAHGXBYEv
         2lnhXOMvL8FfBM4/nQfmwxFG1/z0Bt9ucGL1rEBlOiEIBN5wBMLQ0X92qOjIVLBK08It
         utJtvqXBniOx8dh1HAfqGgf7MhxsspVMUHLJNKAvswSiytx8IFd1v+TQ5NAKic14axIQ
         dJVw==
X-Forwarded-Encrypted: i=1; AFNElJ8B5I4yjBWLD2RqGbadN5Lnrhre55RDhaTziAh6LpbIGSBBrMxmy4Np2om3/vCt536UV6NlO3mKrOqn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6d6xH0O3Ptu0Zl3iytymGgzgQ/suGSojIEDQ+FUEusp8DsAH5
	yBaCG+pJSfhgUayDVopgGQtRxvdsgK/hRm9qQDQGWRZiubOVxKK5VaP/
X-Gm-Gg: AfdE7clwH77bq7nnTR97BaywNt872qc/IEboyWAaRXvzy8peF/mNOmwPE8qfL6Jjeky
	VZRaH52VjFMp09O1GVZOgGxDnDHvPxZv+yTSyP/WsDGPBsb3FzVquqnUNv3H5Uk0wrJ9MIAvvfO
	NAFujRTxIPdbhy223Jkrf+yCGjnCdxNRyw2XExGjw38sYcnBzl7VvPrZnfL6z2njaynefa3AQ/Y
	q6HE5TaiQ16oPeoRrdeVvc7TvCGhI7N5jzk4TfLwZH5JaY+mH3b5AetwZ/VgqdRKrm2NlvXt2Rb
	hsTPOqcYSp4Jeha3TOc2CyKDSP7EVxMnvN9yEK3d77UhieVauQqNAPF91ajGOcnDgMw4IpJ91/F
	dW6szBPQ2+Um9qpZ6OfiUug5FkLx1RGOjM0p1IWrEYhN8CWDxPDwBBLaUHCNbaeRYNXIr30NNsL
	CMwZTnIMnYJlpPdsXhmd5BSlS/6ZMMsVc9qxaaJoug04gd0bkzibKAk/FQxrcaYVlH3BYGbbe9D
	4kA8KtUnTIHvHXRLnrv++s=
X-Received: by 2002:a5d:6684:0:b0:43c:fc5c:a9fe with SMTP id ffacd0b85a97d-46502bb15a1mr3018694f8f.20.1781855332519;
        Fri, 19 Jun 2026 00:48:52 -0700 (PDT)
Received: from ?IPV6:2001:8a0:e962:d100:f83d:6b5c:de84:5311? ([2001:8a0:e962:d100:f83d:6b5c:de84:5311])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc41d01sm5719051f8f.25.2026.06.19.00.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 00:48:52 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <5af78bca-7c49-48b1-af8a-cfbe55ae26ba@gmail.com>
Date: Fri, 19 Jun 2026 08:48:49 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: jian.hu@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
 <20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
 <79b1a519-5723-4e0c-904c-b7fdf9564ee1@gmail.com>
 <1jbjd7c7ip.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <1jbjd7c7ip.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jerome,

On 6/19/26 08:29, Jerome Brunet wrote:
> No, regmap clock are directly used so this is necessary.
> Relying on other module dependencies is not enough

What do you mean it's "not enough"?

Functionally, any user of COMMON_CLK_MESON_DUALDIV can also use
COMMON_CLK_MESON_REGMAP.

Unless you mean for documentation purposes?

- Julian Braha
