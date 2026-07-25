Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59EC2D8795
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784984608; cv=pass; b=ODvMmHdJhR769UybxymPqidZ9v1LqalGlmma5gcCGyeq9gm0UK43XdKju8+BYcVbbdMmu5mG+kOvJdA4lniK3wGfQIm2Bx8PGEfXpYBHPYN03mHVZs2MO30K1eR4SkUcSHwjku534aON+EWTgX6YgVOE9DugEHbJpSA0MNzPNKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784984608; c=relaxed/simple;
	bh=dbu6UYmI3kvfiQA2rZZsMgSOUK8VMN5tArWIhMkxvRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aoGs96Q8jnYvG+ThH4w932QwbnZADQbudMRbHgywFpmKNQqEv3tjfn+2p3en+vOTB3Uux+IVDGzVk2udsHdP1TQZwcHO6ajqW8h28jaj1yH+vpa/eQGOo75tohItfDwimhAnEvHdJGui288+yZveCJ7+MBFopoZz5W6uAGVDf7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=KRpMXh7t; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="KRpMXh7t"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca80d708489so893131a12.1
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 06:03:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784984606; cv=none;
        d=google.com; s=arc-20260327;
        b=E4o8E3BRbc9VbuQ0GARqWdKY6/FbSFe4vOEjHJAQ/Zh3TjDCmPJJHLggsEo5DmWBaP
         fmJ883/M0yYOwze6fzXXisofFiBI84B0rE8FyZNgz4Aasu0HKuctslLGrZK4On4PHZvr
         KWVL6lhVL1t+zYlgFmttkNBHyEpn9KIcLMlsLVxvzDhage+Ne1nKTKrHdkA4PSHY60MR
         YOHIW0H1i/BeObe8BOjm3vU8kX1xx1Lto0tD7oEbW4n51xYHYNJewoIuZHlPHqJvad+n
         FoXn4wA+dzzJZOviF55s3jVTOJrtQmL8rTukYW1qw/jtdpPwn1m4g8/vEvNOYXQvLh1h
         wU6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6s4tv0lqxlKjKfIg1m/4hOF+FjqSFcDxkpdQkfgs7fs=;
        fh=fZEH7IML/qJ4i9FiAOQA3W0x7GeZwCW8brg+FJM+Jt4=;
        b=i7G3f9Wj3ZvW93H9GMg2FzC6WKsdcYgEb2txaQJq4MyAVzgXIMu//svBR33K2NNFhc
         6r5THkMssS7ISKnjFe4n6pvMZNn7wTEVdaoOZXSq1fszxPjE9MPFt/uteEZVmZPtOJck
         v7UQZ4sKCHCIODJsD/1qGtT7cVACUwApwy3E4jrIVQ8fILHZhDcvCgiVLhw1FDOP0EMF
         5PmxTY7GabAxWE8Xn2qyGPQ+XIQn1LU5JnxOSK+Mp2Me1RFR+tvkVmRzMuziLPHFWe9N
         PQATeatQt0MFaC5NRBBfiDzqsrKzSBs++WWGWQzz0+cXwf/PP0pPts/jn3FHuQJaC3W9
         SJDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1784984606; x=1785589406; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6s4tv0lqxlKjKfIg1m/4hOF+FjqSFcDxkpdQkfgs7fs=;
        b=KRpMXh7th20yizvygWpJlFeu3UDDGc5ldEanRGSYzpNTV3yhIEZiVZE7AuGdmu6h7F
         M0/xZfNof1X81amviqBdzQ1htRxPIuqNIb+O/jWGWR7bajvPd20280O/Ca2AWREVkyEf
         0VDX9WbwROTNDwsSKj6258ih837ILc7vm6rOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784984606; x=1785589406;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6s4tv0lqxlKjKfIg1m/4hOF+FjqSFcDxkpdQkfgs7fs=;
        b=RukLUNpq+eX3ambNvPKzE+DHOV9sspYNxyj5TOutAS2ydVuADq8/LYdA16ste5wMji
         v42AnwLjmPLK3SdGudi4lMiWngeBPaO7pzN4u2e4QxIvltUL5dZKrY67xovpafVXsXmV
         1VsmFmeb4LMp2cb5yeYi7MEtT2XlZi5Ad3QnaokUK1buau41BF6GJjmaWaMh5Z8rlWoV
         06BrBEdEuMPoVsFHLN05ry/3O5tD2rUBe9W8CgDbT+K7MjNofVbN9K7huzTlURzx+2CN
         vEJDkrl650+O19UNnUgF+X8MJ1OC+8+/4xAn2/0glVvLtIICbwZ/7/4IO+zm1vaMUdBl
         oPEg==
X-Forwarded-Encrypted: i=1; AHgh+RqSIy11/OXdY5VuTPmkOF6bfEtjrRhr8MStP8tDwm1vd1EhL0P5TqpdHjlloQlkgktK+rPdXHidJUrD@vger.kernel.org
X-Gm-Message-State: AOJu0YzJFkpDt6St4hgAykv4MauySSabdQwe7GdxKSuchFrs1C28jj//
	sChJ04RSCrgQ00wqDxtLavMT3TpxXfP/joIAuX0LDZ/dWNkQAn5T9HYiUL+1dSYLjY4l7/VeLrT
	/HVZhMo4I4gZ3D01vzyiSWXpel7XCjMPR9pKA/l3I9w==
X-Gm-Gg: AR+sD13w1LMtOU1mvV9YUSCQCvcUinaH3SeNXZlMbKk7MzJAUIX4yW8G7U4X+9bNFc3
	YaDder6T0+F8Mq9Vd3cD5+5OQgdKbXq1+14kywY1/TODwTCcW91aK+yxYF88UZPBAqZ5No4C5nR
	AJZ2DyloaAPSgdWO+EkvR+ZSrlhvesfv0vgi7bEIxbHuXUTVpysm8R4AdXCES7Y/G6SaDHaLJe6
	hvjR3CxGdwV5HV9RiwUCHeVFMmQriB4gTVwBw+ZQDjDw6+N3quX2Y0b+9r+iEzNGB9kUuYHwdgk
	U+Zo8n9+EbbFTghMbCYYPSL6/Ev50eTquoRf1u9Ui9z4eCqIL6nwSdJ9g62PmIbOLiy5oeQg6rB
	VRrCxfYfcQ6qlSoJIZcWDPrkwASPqgNEX3s9THDNQrZTSxA4CTH0bP/aLSVUd2YoaEVaKIbZAKx
	hdHzkQHs+9aHZDU3SxQQlHGs/9Wg+czfZVrC5eeJFf6sJkyZ6+EFlnAKWB7o1mb7N6OcIT5g==
X-Received: by 2002:a17:90b:224e:b0:38e:c232:9d2c with SMTP id
 98e67ed59e1d1-38f2a90f031mr1691512a91.2.1784984606019; Sat, 25 Jul 2026
 06:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
In-Reply-To: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Sat, 25 Jul 2026 21:03:14 +0800
X-Gm-Features: AUfX_mz8NhtAru7ACt0Z-tRBKmj_hK1Y1jnq_iZl2mP2Qxsq6jEVKI3kIp6vQW0
Message-ID: <CAMVG2ssrwmWVApoYBKeWt=th1Pq7tj-t1jxCndsyZCmubS7cHg@mail.gmail.com>
Subject: Re: [PATCH v9 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 07:39, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Vinod, Kishon what do you need to take this for 7.2 ?
>
> Key advantages of implementing this logic as drivers/phy:
>
>   a) Per-PHY power rails become declarable and enforceable on a per-PHY
>      basis.
>   b) With future adaptations of CAMSS routing the PHY output to something
>      other than the CSI Decoders becomes possible.
>   c) Standard framework contract. phy_configure(mipi_dphy opts) / power_on / of_xlate.
>   d) Introduction of CPHY in this driver will elaborate CPHY for Linux in
>      general as there is currently no mipi_cphy_opts structure.
[...]
> This driver is tested and working on x1e/Hamoa and has been tested as not
> breaking sc8280xp/Makena and sm8250/Kona.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Superb work Bryan! This works for me on 7.2.0-rc4 with 'qcam'. I
support integrating this dependency for 7.2-rc to reduce complexity
later.

Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100

Dan
-- 
Daniel J Blueman
