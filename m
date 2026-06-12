Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24F13E5A22
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 12:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268184; cv=none; b=nhCsSlnVeyGeu8LoLlM81dHlTH2FY0/0cb6nSGhSvEgL0KcW7EWMqjGkyTh6eX1FXxWoOuYZATUTni+HgIlFexX/aIgDjDwXvTqLQ6gZtRovHgdfH4JVpgR71hHRgGKngAbUSRDe5xYRpQwXy7lt9gmFSLjwjgCms32Jjgk2oFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268184; c=relaxed/simple;
	bh=Iiq1PXcGNwUHd7cbL073bR+pauELfqNbr8btOS6HBIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nxc7jna91kyVPuxiQSnemqpnPpb4Ivc8A+AUYPs2Tx9ny5S+bU8g047inXPQkEN0DNGLNKGn1Dx/WahqzI+tjtCIKD2GS6/iA9tewoNySFPK5cTRFQ6+F+8s7BHdTjf71TGuwS3vofISHlWm3PlchiN1iotHGCQ185XB4qxE1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jSKuNNrN; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jSKuNNrN"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa60c7be57so89115e87.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781268180; x=1781872980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MRB2sfzn7yah8ACPsk/oICHejeL/fVpNie2rMekDVA=;
        b=jSKuNNrNJtPCFWhT1W2dDDkGnD7E/him2kxkB2Yt/pxr2PgeVoDpQl9W7MECZeuRGy
         lcGsl4h0zt9tvGI8LHK8vL8NPC8Bsm37Id+jlPoj+aYUEgzh+Mqq14m+1hE1ExdCoKD6
         8xr1BnQaDIzUimU6OzeN9skHl3vTeA+q9RcvOb5TiTnQsTWtKS1RAREGp6tMT7AAjUqq
         EXRS05ZEYyouBLXTgy5CsFy+Dcpckt6zfCeWMmYTe36rrqdfyarMkt7AGh/wsDtwXBzm
         VyeNM5bHLamQuZOkNi6dRAKobxEtwrnsdEAejkrKcBGdfRPylPd6Y5Vg7G57U+ouvM+z
         JB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781268180; x=1781872980;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1MRB2sfzn7yah8ACPsk/oICHejeL/fVpNie2rMekDVA=;
        b=T2NzcDpFi9XL13odOiUt8YSuQj0j9l9x8/no5aqWydTjl0ZRHctW1LZ61mt1NaHc24
         5tV6o0aw2XR7zsONDq+yTFoDt8axtaM18kujlNIF5jBOQP/sjaBwp1PUdqq/Iu1MKUst
         7s866hhQozHgFuQqO0e8EmOvTE8QzRv5AoWFhStk6pxW86RIOAGmZyorTJkGo2znx1ZU
         PXiN+rzzNRv1SrMI+TMo4aHnmxkZQhrAhTXkrxSQXeZ3CxT4UOm56MRohc5BOWmIIUfA
         o//SiWcstzG1w8hwNFbgmbGmjk+QxL68KNpKOKazscKggLeKiOE/IxasablO1IRMC3RH
         4ehw==
X-Forwarded-Encrypted: i=1; AFNElJ8r5v5eP2F2OZIVGbmQ0tDs7KExU+/c50mP4qWLk4bolQW58cmOKvBx2kxlErZj/LU7r7oMmP0/qmg5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr5uuRxiTSv+/Caa3zMwsll0KA9kJp6lXP4AnrK86aGE5jCuI9
	YBTmaFZwWDHAboAZl8+mnZjDH/0/ePqpKEb21RindgvxbuwCmbfws3rqvaH1PPXKDLY=
X-Gm-Gg: Acq92OEwJX4Lb+294H5IEzSSsjyMilRPogmpnoDXGZS9owWO4/PLzW7sArLjW2uQqsf
	AarzUkqasKIwOpHXUqSV7VV26CVJX33oLTkVamEuMerfwHQQzUhehfGA5mFHTlh75Ro+GXdx6lD
	TQgou/j2ly9Z7bWxokWuC3MVAzPWmUd19s7FehUmeRXyh+Wv81OA2Cex1aOn6dzF7Ol+GU/YeEo
	vOqZIVZDznOuqrhOx+Psvxi9mY20a52iCyQf1vNZvg9oja+edaU2pw0DJ0fSgZDzBHfL1gQ+an8
	lcRNnGRVo35bQUaG1YYWm+1IwsMVrD2r40CJ4GoBnCAtoNYw0BpQGup+lkAnvFMOI636mcgXze2
	a7eNXUbuiY9u62d4wYkDvMdi4aYJ5Nhy6FP/i6s66hc2VuiJf4Lls3c2cBoBsH2sourolnaoo9p
	6b7w+KV5SOz7r3D1YphDjk3CHxooJru7PQEBfQYOYgBogqL9el8jcih0vliCwCI2sDU6fX3y6ge
	KUzCw==
X-Received: by 2002:a05:6512:3e2a:b0:5ad:2e00:c596 with SMTP id 2adb3069b0e04-5ad2e00c659mr414206e87.0.1781268179989;
        Fri, 12 Jun 2026 05:42:59 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a733fsm519093e87.47.2026.06.12.05.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 05:42:59 -0700 (PDT)
Message-ID: <67bf6da8-bc31-4519-804f-63cf0dca3911@linaro.org>
Date: Fri, 12 Jun 2026 15:42:58 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: glymur: Add camera clock
 controller support
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-3-9d00acffdbf7@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260517-glymur_camcc-v4-3-9d00acffdbf7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/26 20:33, Jagadeesh Kona wrote:
> Add support for camera clock controller for camera clients to
> be able to request for camera clocks on Glymur SoC's.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
