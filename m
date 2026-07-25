Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC7423AE62
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784983634; cv=pass; b=TVSXfD7QbI3+y/aVgGDlqkUEcluY9l1f/YkDBqDhl3KOwrQKJeuVy06kELQ37+tPM2AeOtM68X/O/+Ti/1L+kPmLl9DZwx7nvz1nucji2C3wVSKOcYtnZCgWFJRGO1Yoayw7pxFoeOpQCWGoEwjxloVDarNxWKo5ODzOrKx1nZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784983634; c=relaxed/simple;
	bh=nbfEHiFg3ujAMDl8T5Sowr96/ZasmMbVmzrGHikYY2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+6kLtOk8oAW+bqbrAghTcv4X3hsGW3Ir93DidnDE81SX/e+UYvfCH4saRfz9VSuTbr2H9QUEktPcerbzsVmBsCbU4M09PNFkC2+Q5J/oiNTMHtbQRaMOGsejQXmlomHZ3yfVuTojTH8PJONpcCPOaR3K5CmtVbNUNhgzBCWxG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=hzTnJ1kZ; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="hzTnJ1kZ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ce7d2adef4so16616245ad.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 05:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784983632; cv=none;
        d=google.com; s=arc-20260327;
        b=C5Z4OHXnNkoEwFIPgAW06M+1W5jSgVP9uXTdj7AXUIn7B7HqJ+iKXYEEzLUYJJvsvr
         lL4npgiKoqJzBWLqR8hTJlgsRZVlbiXuc2K1ealoRrkGZdBIjgea50W2akcV3qQZ4aoF
         tjSHTqpoRR+JQlBCGghbwdHCksePp+xEQMmHUgQzxpHJihoVJOIjP3bA8V3eJJtRLmQU
         uccUarPiBCO4nMbx8AXfT4nbrKQKhopFyJabhvEkquDr8wU6P0toB48rr0EbaaLBcoqd
         5mcFBRnFa9jfHVhIFBfopQTE/sHcazxAErq4ZWNHyNuyERRgix3x6nD7OiVfRSLWa9kX
         wJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NFb3xFmMVZz4nbO4NmTzoVtr612rRjtqaPgKgbVu0P4=;
        fh=BtwGsAsrhHI4Mss6S/TrTNGlHBtMs7o7FMdjQQtRvyg=;
        b=ToAXfnSkaS5wRXSrLzIZBjrp3CB/ydzFgQ9AVnH14PT1B+ExBKQw7kxBdRXNQ5Tbub
         lpupF/YYAzjcHIEefnx5XZP5wNKndAmRdR6Ml7IJKKCCWL8EHsnS+t3IdSQFiLi8KZoL
         IAdJofVh3khLGkYGSA54qflncEO76nSfDaVny8132DXJzxIKu6ZRzfUC0uIO8aY16xPx
         z+16qm82SlkTkdMmsDmCIoCK3TdqrWMgY3BT97yfpqv/o3g4Lkr6Twut2tPd5yhujOLl
         dQSwbSNlISmqjloQ7H2bQn4rist4yRXODs+Vl3hCD18Yp1y69l1wjXSXyjc/s7ECYTxy
         WHow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1784983632; x=1785588432; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFb3xFmMVZz4nbO4NmTzoVtr612rRjtqaPgKgbVu0P4=;
        b=hzTnJ1kZ8VTPX2spDgxKSesmfIj1g9m2IqHc8k+xpgUndOW6+Jz0Knq6axDOrDSES0
         QyWZtsKv1WXuOS5NsC/qsqVOud+XECSiynAMq8yDBGnwOG364hXikPmLhcIVxbMuU+b9
         cksvPr90Bwm2pExw1Xbz2yowaCUyCF/tOS80s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784983632; x=1785588432;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NFb3xFmMVZz4nbO4NmTzoVtr612rRjtqaPgKgbVu0P4=;
        b=ez1B6j07JKCYjYA/zu94Dri2ubz3qiPJGSWDtIFQAbkh4ZzE8Bz9Az8utyMP57OiDC
         lgR+MyrIjpFJJOv2+NW2v6DRq/4xZPWUcc5Yi1CRAW8SerIHHtEAtnFaLqLPhL5zaDBk
         KZB9OKgO8yNauBES+2biM/U0wysI9oMU4UrtiBPZReZ2vFV7tInGLnWZGeSVQAwdVLtr
         Hj31OMT8TpULrPCdkTghcm1VPvJ0/KjTR03SMidnyR2JPQIR5W9fcDJNjmCZNBP3kaXN
         3kvM1nOYnPH4B+4BZNjL4zvwgsHYWa6FD+EcJ5nG+BZGuMG/GgIZeSX+FiOztpU0GTJT
         ej1g==
X-Forwarded-Encrypted: i=1; AHgh+RpuZU6BPmP0nPf4G9eacNlM2ej6+XcLNB81L7jDozonm/IU3m69QGVJEgIKvJEl55k1Psg/5IDKX/sh@vger.kernel.org
X-Gm-Message-State: AOJu0YyhyN9mlTouJxfV7zACZXTyuRu815mhV976JPN0FgwAxf+pc5wF
	Io8pxs74Ce6fgjSufuxEEvtWtsdv8PV2ud6c7pzksTgH7n2jQ3boB13bUjB+aeeAzukvptjeuyd
	cWar5CskAqD0wVPd4hQjbBhCsuNnzybZlcTvS9D+5yg==
X-Gm-Gg: AR+sD12yDXVGh1M+4r7hGoVxpYZNfEm4cz89PFJbcZ1QHP2IwoNlWrwfHpw6nQtXlny
	26/snrhTQJ+bXBIa20fHDuiCzhRjWBVA+Nm4F05gstX6vdx5jgERoIwbF6IRqVTPsDli0zBKGCw
	5rykDO4W8Id6bzkOoOiM4/GzBuDiVXtEx2HuXccPoAL1qKRclpZYYuFDAiSfwJ15cMaVSb48/0O
	RnmE0QSjj7Ia5CIpm35xPTj3dWxX9z4a1ycRFy3raQpQZB+92eNve3fcXIQKETKuzXa5fQj/pLE
	1eaxL3hLd38jt6DF5UCPSQnb+TBYQcRiYjIK9WkXYsU7CFJMC1jtsD1wZNdAyL3COpivNkwJ/3q
	qkNNHd79L2gBBVjdsbxepjuduvGHdvqhX95dnSZMKRHEtcWd8+1YDLZ27n7WoAYEnx6DLGpE3Nf
	dilJC6HevGiWzqZ8E638dJa1H+/+n9YP9jmNh/Mk/2kGoz/2OQ8VarXWLlECX93ZiAp8GzWg==
X-Received: by 2002:a17:903:26cf:b0:2c9:97a9:2098 with SMTP id
 d9443c01a7336-2cfde895b4bmr22242195ad.44.1784983632412; Sat, 25 Jul 2026
 05:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Sat, 25 Jul 2026 20:47:00 +0800
X-Gm-Features: AUfX_mwTJNR7-hRaq1ZTUYAiX7Ud5gZGyBy8PdA42w9wDa17cNUs0zXUmHoUAFI
Message-ID: <CAMVG2stKmNxe-mdqbqO4MDLDrJCiNXw9kt8SA8egYAmByf9fKw@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] Add dt-bindings and PHY updates for CAMSS on
 x1e80100 silicon
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 08:06, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
> Changes in v12:
> - Updates camss sensor find method to find the sensor in the CSIPHY port. -
>   Neil, Vlad, Bryan
> - Drops dependency on passing polarities and positions. Moved into CSIPHY
>   port as agreed. Neil, Vlad, Bryan
> - Omitted mux to CSID as discussed this will be done when splitting CSID
>   out as its own individual node. Neil, Bryan
> - Updated Reviewed-by: - Loic
> - Link to v11: https://lore.kernel.org/r/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org
[...]
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Works for me on 7.2.0-rc4 with 'qcam'.

Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100

Thanks and fine work!
  Dan
-- 
Daniel J Blueman
