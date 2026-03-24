Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622893DA7E3
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345112; cv=pass; b=jU6++Fj186Anctqd1rHsgnUXJPhXPKQiEWE10eT+F9Oc+Jxg/CjLM+tmkSvfR6g8n0Dw2/FPrC12I8NayKhwFkcfLyKnL4PmoBtSAtSZjLVhkRVJw58GJknUcqOfXl198CeKerY/4assVVfgXykZWuZH1erMt0r+dJ/LWqON/5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345112; c=relaxed/simple;
	bh=3Q0KzI00K144CqDTO+0RAb/kjbKqPjwYNPdpwhqd4oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eyRntnVB4h/lH5rXY4UNVnVZroWslEAdm+9VS95l12YKyYJvlMBOf2vWsV6wseo2Nk5jPJ46FyTXCKXFPr4nK1bLyWeid5pnIckK7CTWqSt9A/3PIfhmFRLteU9gWSRiKM82lOfP/1oh/eYm7Cp67AOEjG9LAXpAZavh7bPZvh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o1JKTDhH; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o1JKTDhH"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-794719afcd4so44341527b3.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774345108; cv=none;
        d=google.com; s=arc-20240605;
        b=YzoDeEiPR+16KYsvnPNzwummK79paCuOq+TEmw6pIvYPGo9kQegk8put2COb/uRu7e
         mpGcLTOQx+AN3Pv77fUOjr233BAizylRTx8szi3ZVa1B1WoVvYhSsHg7RqV0i0qqvnUL
         ZYL6ZyzK3W5Cw6jaDqdWKp5gKJ0Smp2/BbS7k0BlKZ6+iX0wMJSoZejM8YG0PCyf3M9+
         xlAbX7y4+1qcJA6w8sk/Hsae8dlFwmhYd0eJV9bPNW62xsXKLeUCu4Xq23iI2IvkWt8D
         dliu/c4a/XNzVWzkvhREZnFZlVK+XLvB8MZFuHx0DSt+yS3MFfA4JyfKKUdRdR8TrJvv
         NpLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3Q0KzI00K144CqDTO+0RAb/kjbKqPjwYNPdpwhqd4oo=;
        fh=OVI/dZyVx+WdE9RtgMBLsvDyOvr7JJ4FRhpOfmzVhik=;
        b=k4W2zQ07ceMGz7HwiSH9Cy8/8h/0aC/Nr2n+2Hpd0vHl19A7fqi5fkBKXXUz32AWwg
         NEO0xq2R7fXUDzUfsP/6sTJ5w5q1aN/9WWZPKRxGH3/uE02mAam+NnOKUrynHaTaueR9
         0MM9nB7n1qHx5ui14tx7qJg7GtgwOnHBUIgrNsF9/FZJBvYl96oveVBOurw1H/vwWGpb
         46tJkGg3HYn2u9AWGpF4uaj1nHwQg9i02KyWIW9BqxHOf0pVgroJv8bW11fLfUIw6V2e
         EytmmtOFcLQsQpQdahG3TR1ztcZENIRV1P5XG+R08pknfxWCOuist7gppQlbd5yu3Cu1
         v9Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774345108; x=1774949908; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Q0KzI00K144CqDTO+0RAb/kjbKqPjwYNPdpwhqd4oo=;
        b=o1JKTDhHPtN7tL07wm4vrn29NRTuK3kYVbh/VIbK+qOOpHmgGRnExEtbPbpqXwHkiX
         ug54uDXc54IRxaGvhPRGNb+NtRSq8rUrJOLhFJo6UW+lSs7T6NYIudT0zpq5eKMlibd6
         i4EDUfyWyz+USg/Jat3zif1iuM9rWzhwjQ6m9wQHIz54R/dAnKFVoXxUnFsFGV/eOTnY
         e0jn9eMEgGofImmbWoI8D3PMPxR2fjDosX2A8L7QaSizYoBaM8zwV8H0wh+aADfQXS4X
         nsPIYnamXDfEtPlwnK690R0Wj2OZmf4NZX6xcVnTCdxgMjz83YL5if/0gqnF96ckb9qO
         84Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345108; x=1774949908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Q0KzI00K144CqDTO+0RAb/kjbKqPjwYNPdpwhqd4oo=;
        b=r7RSQAlHPtiZX1+PoKi7vL/aFvQgizv6Ho8nfSxjekTeToEiRoGab3tCGOazpG+cKL
         SqJqrMxP43xXZidsSAb7Re+PPx60kz3bLAKCNao7kaMrV6HjgE5nRXIj2jHywsnsJneH
         IH+FRYdbgg6zOdVsvqZHPKwVPHq6fTRWEa97q70ArGoDRFgv+FQFFAhKTmTY1ZdQfgKb
         Wop3BaRa6WSYCiQO35aUo0YMzUUX3XZnneGFf9pQCdlpKYRz0tLfvS8GFMPj7LpH8u4k
         VsrkVOwuIb2fEQ9utAFoESA+wMvdO+pCchgce0KwnRdBf7cKMVE1J70ucIG2xy5gAbWi
         f5OQ==
X-Gm-Message-State: AOJu0YxHvzBKXAyCpSeN1EDeixc4E00kY/3rhjR3FHvOwSKvyqe9Gr7c
	7ajR4HAPlTqcRxofsLU8aKbxqCP06YQy5j9B9z0P8zZKNcNI2OjyYZjxs6YfpwsokXjdgzC5bVO
	A4I3Rm7rEgaVvFMXGuPTDcKPrAvmS4omUmayJlyf46g==
X-Gm-Gg: ATEYQzyO4kyjKtVsi73DWzmVE5HEU7RfNzCjJnWbh+/w7leFS95S05432+sOjWL8Itu
	DYoJft/hTrquQh7QU8I+ZtGSXg9ruZlTac3J4AsOUwvz9Q4vV073DbI5+YVh30MPtMXk2l2o60j
	Zt60cGgoK+LLdZKEwt4Fr6g3YNvXwrBM4A+xWpcornIfvmgk8G4zQyU8xFPufMz80Ry3RCbsZtV
	V710gupIb1Ickf42h+J0JpPHPYEIjFbC3fR4WN8N7dpvE/0HxSxPsaiuf1vOAA9xXE0rIKTPUdv
	NMs8NlDssY76iLUtlPHdTy8yR90/VECk0dR5FO5B
X-Received: by 2002:a05:690c:7644:b0:798:83e4:277f with SMTP id
 00721157ae682-79a90b351ebmr138576757b3.27.1774345107831; Tue, 24 Mar 2026
 02:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323194400.22886-1-rougueprince47@gmail.com>
In-Reply-To: <20260323194400.22886-1-rougueprince47@gmail.com>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Tue, 24 Mar 2026 17:38:16 +0800
X-Gm-Features: AaiRm51UGtrLd6_TOxXtMshZQx1vDpI_Zl-99r1LkNoHkpUs8Cc0m2THVB2Qi1k
Message-ID: <CABQgh9HV-DcChd1WLFAUGmZoVQ++Kekxr5gj7SU0zhqttqn_Jw@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: hisilicon: Convert dw-mshc bindings and fix dtbs
To: Bhargav Joshi <rougueprince47@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	xuwei5@hisilicon.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, ulf.hansson@linaro.org, linux-mmc@vger.kernel.org, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 03:44, Bhargav Joshi <rougueprince47@gmail.com> wrote:
>
> This series converts the Hisilicon dw-mshc text bindings to DT schema
> format and cleans up legacy node names in Hisilicon board files.
>
> While testing the new YAML schema, dtbs_check flagged the hi3660,
> hi3670, and hi6220 SoC files for using the non-standard 'dwmmc' node
> name prefix. resulting in warnings.
>
> Patch 1 Convert to DT schema
> Patch 2 updates the Hisilicon dtsi files to use standard 'mmc'
> node name.
>
> Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>

Thanks Bhargav

Acked-by: Zhangfei Gao <zhangfei.gao@linaro.org>
