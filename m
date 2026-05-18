Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C0C3F23D3
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103813; cv=none; b=BT/ZTAoaIPwsiEq1DlnqmPL7yLOCIHHtXvwbp0q0BVvpSlIILnDTJnp46dwE+cDJIx6T8RPgUzNo0F/5L9zkkMmVlUMPcNlEQuytP/2WTdgFw6abQ6oSxpDfSJ33hOChSVwZrA6FaQTf5Upu9+9t9QZSU1EhjNRVSy0ZELhEJic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103813; c=relaxed/simple;
	bh=UHZ0whw83+z9VXkW6TAErZNmADE39pTiQfjcBIXSbTk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ltOOoUSgvSxAHDlgGXD82/xRXeK7e2sAFKtgtQ+gUAP21InsJPI/biEuIk9Are7Sk0lPC+mhav4piZLUS4K1q3XDtdTt4+Nxy7Z8V1OxdIvUOmD7g8uJBK7YtqV91lYN/NywGrcyMhXnSl6ixK6rM59iAIUGDzBf/oDeYYNTQr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oCySTja4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oCySTja4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso12510365e9.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 04:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779103807; x=1779708607; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHZ0whw83+z9VXkW6TAErZNmADE39pTiQfjcBIXSbTk=;
        b=oCySTja4zyv/ptvGJvGnYt5M7a7pLXwB478QS9Iqz+4FeHGxDdotlEBY6LilD/IVlf
         UXI8lzBhq7Upw0s2LEMtjXuouB8JFAb0VWi9kDWoe8xeRYMS+ohy12eyQASe6P2y8roA
         5nSkTFGfPatN1oF5tAPgNKRs9pTiJCOZOZ3Sh1vgebe7tQLy+3MD1dgvvAgqUiYLmINg
         CoI1BviPSFv5R0dFUCErT3scs8VTNv3kqq7jM4DhCGq57QDDZSH0AlyCBKzFpo4zlZJl
         9dGJT703sVMoKjUmoXpWe9qHOdzOb94X6Ax31QVY4Dk0ygtKDo2NGmBuM7UBvos6l16i
         BzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779103807; x=1779708607;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UHZ0whw83+z9VXkW6TAErZNmADE39pTiQfjcBIXSbTk=;
        b=BRsIVyrqgwLSnxwFTOQYZoamTSHJ3l9v+2odoCkN78UgzJenqZqeXMzCqG0pVR8YmB
         KL78AotwxEgNNq5EjoLnjR07Q0n2OeeCtAZpXFMinpXqS5hyZqwu+7EreiEuGdUcN7q6
         XaeXZB/5PxypDn9LyluVGmwxc9OJEDlFGaP5dtFdth8MZEDiR4fCJgJBpKyCzPWEp2HA
         kJCW6VTIVpgdBZgiMHx8/jWs1AiGInn07oRyEmINQDJsolyIrI3VKNwXcUjlfKG/+oEP
         jVDY0UR1obGjkG82q2yUC7UqTyj3f+OPcZujXiCcVgXDPnmDraFqo6fBQ1AGwxhAiITh
         25Ew==
X-Forwarded-Encrypted: i=1; AFNElJ+ZEVTnlcHdMhW3T3XNfdaDZeBwNmVpSwy7SwzNqPgXAPEhdf+MRvmbNF/J7JYrvcSKFrmMVBNkAWL8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy30bL9NJspiZCsiHLHqqGV5raXwIE/hpn/DT7iv2aPuPQvcBbW
	n8GHdZXDKIVOA7wU9Ox++IN73Lrl30i1svm3o9Kd7cwZn4SYlJkj8cvwBeMEU73AmqA=
X-Gm-Gg: Acq92OFYW9FIKTz+E+2DOL/aTtn/m+ksCJ63RIax/by6/+8UHJgHhI116nOXcejUjJG
	kICdwUAJ6J+XznorkUHTwveJOCW8LVY6v5kB2K3KBRyL2MzF/Tj6biEmkTHhPsVHRrFewAWj6bU
	IIDQtGjJ3XxXf0y05DpxA+tSOonr3OD/6p+Cwf3K0HD2mYMYlvB568e7CHWqfKLlWpxhV1Ys35j
	uosLl/Cv8kbQtMSO7EgxlC2Azkcl4/nd/7x4vGkHTLApGpqMZjkj7VPeoyeBzfRXUROBbzRw5Li
	JkAZ9Ld3PNHDpsWf3BkA1kC8Aq94LpvniKR+IZpHZFXtRT2536mgqLEm5OL2YQ0hEU4dH5UlIYT
	lWsnR7AwH0r8eyYozA7hn/Yxc368cDd4xtVMKLTkYE6u0OoZjT9ynfb+Gmp8meAaVKeGo/0MB/4
	csnynPxP1qTYa57oKVMpdpbl9wiKVhOE7QWVqFXhg/Cbxei0cUhBmWBTdVSLM75YJ2V8cbJF6h+
	/N1FHig9cuF6Zd0ug==
X-Received: by 2002:a05:600c:8209:b0:48a:58ae:993b with SMTP id 5b1f17b1804b1-48fe61f2a2fmr233190475e9.16.1779103807097;
        Mon, 18 May 2026 04:30:07 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:33b7:a835:bc95:259f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c885d5sm228471045e9.5.2026.05.18.04.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:30:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 12:30:05 +0100
Message-Id: <DILRNXCXCO25.B3SAYAFHBU69@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
Cc: "Peter Griffin" <peter.griffin@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org> <20260513-exynos850-acpm-firmware-support-v1-1-3858d097e433@linaro.org> <e91496f2-3b7a-4982-992a-91e8326367be@linaro.org>
In-Reply-To: <e91496f2-3b7a-4982-992a-91e8326367be@linaro.org>

On Thu May 14, 2026 at 3:46 PM BST, Tudor Ambarus wrote:
> Hi, Alexey,
>
> Please check sashiko's review from:
> https://sashiko.dev/#/patchset/20260513-exynos850-acpm-firmware-support-v=
1-0-3858d097e433%40linaro.org
>
> does the gs101 pmic constraints apply to e850?

Thanks for the heads-up! Yes, sashiko-bot@kernel.org sends reports and
I received it. The "To:" field there includes lesser email addresses and
only device tree mail list.

I need to check pmic thingy for e850 but probably yes. Obviously, it
needs updating.

Thanks,
Alexey

