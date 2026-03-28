Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CA5337699
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 01:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774661974; cv=none; b=c2/yiH2CZQt98KuBJI5xU1apTOXR71BYMQW91tYW7pQ+vFd5vbIiREmnw0coVOTidDArNFWNhpPsGXy6GN/tY6sbQQumTyLf/DpPfJ0omhEzXy5Ea544Z/qJOKnOvLQvwSwHtGZI9q4k5v/M7X2ZhWGLkgnKwWkQbsXSKIYi2b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774661974; c=relaxed/simple;
	bh=eTTj+5EPZCMy6+zcM4jnUzxX/L65C8rc1ct+Ub6oV3M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fYpeDXx2O5Vkm4kJuvRDKVNJ5fQsq/VXEiZe9NVbbex1VSbfIxVLjeIehf+f1O6/5rNmvyPi5cMzY98GLyg8b0/7rFdBvx/7yfJWw8riDTG3g/Gk8OH6yowrz5mKOkCqNjRZfO7uWRVRLl82toMUJG8yiwjnN4G20uwxvhhnSTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DAV1895k; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DAV1895k"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b983bb07eso1208899f8f.0
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 18:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774661971; x=1775266771; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eTTj+5EPZCMy6+zcM4jnUzxX/L65C8rc1ct+Ub6oV3M=;
        b=DAV1895kL/WNRuDb68BX4Z0OhLFqXiyxrfpIevemYUXUgQGB36zlItSU+zPGSW0xDI
         +pjIN9RHfyWMQH67Atc65Yv3AATJRmW2h2anBfUmf06X/+7ZrIbH+j9ypS7lkh9zwb5q
         sr8uFTJV/yttmuDXEMAND77fEh3wTSbgi9zp5TZPpQxdPRJvV61k0lxQlGis2C5AJ/LL
         zBXNaCYDYWHa9HEKFKj2P5zGILOH+0DZsjVEBOD/leiVYPKjSzKRZzoJXpoLy1KYEgjd
         AR2yPHv/wOH22PIlD2j8CeitsIrVUH5ettItstRpTOU/gdt1JVaRbIAG7rPtKUVyKiEV
         5Ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774661971; x=1775266771;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTTj+5EPZCMy6+zcM4jnUzxX/L65C8rc1ct+Ub6oV3M=;
        b=DBo/mgrMoPuEznbVdEd9vtij43rfpyYhTjEQiyfnHRc7tjOMowH6Aoh+4V/SB4nAE/
         D7y2w0K5JhlEPN0p7EzpQpshED6X0WrEEJkfb7NMJ29EONEZrGjCt2jd7CqJQpFqtmBQ
         azCHQK8LMDNdHt4lIjiINiaL8+TgNZJVtgWlFyPoSGKsLe8b0i8pW71NqP/P7LbAqHvh
         JuQqmb1q/fMpVwtpaKahBqWeNbFGgApnTc5AxTPWRTkcyVIE5aLWc3KZCut34IV82mIY
         QHjHOUVEtQKEfIib55/w7s+NmJGlpxWHSnZYYXczGBh0WZEUZMMolZCVxNGluHfl1jct
         haKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjS2zy+v8VX9Gn7LiXZrISxYs+rr9/wPFq6ii7Ez6CFHfSshSRYqhd9FmojqkKqXKnFOxvbrSsSkSg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz95ayp3Qg4oMVWDw7VE4+HGh94WRdGdYjViWPLaxFHB15pd6QH
	s59OrM+5Br2guXiSuUf2evTrg1/DbVrC1Zwoe46REWhownUyCNNN29Zts5hTQinmPQY=
X-Gm-Gg: ATEYQzztboRCNtxEATJB5thFVjf3FpjXhvXigfF2ZpOB7tyt82/YCCy4serVcJQJ1HF
	d3CN4Wnq0CWejr+28+UOY3dGyQRKgU0V/N4sPZB8NR/1sqEZN8UiFi5yr7zIlV0AAWzxvm4mKw2
	u9W89q2ywJg8Z3dEbR3A/HFvPmN3QoZfR88Cs+HEuAu5HO861Y7vKGc/vHafhutt0Hr7NuOqn3u
	CReDNkOCnYew/O+gYzfS+f2obract5PBDLhtS+fO1EV6QVKYM8jtmHFuZfTUZKAQBFwpc8XVAsP
	G/2p2qxs0/ILIkuiIn7O4rjXKia12WV32aSGtQ2I8R87980miFztZQtGJUZrWFC1+Fv93t2uKEy
	FQ2DWOsXJx7LRy1HiySgytadfg/NVtCFU6o8eN9x1gUXgA6zBwHqBA6aDAoMsW/u3RaRviO1IAB
	7n5tCri5FVsWCaAKezX2PFW6mW1A4ptwGZ4Bg1sZh++nl8dlqk5+1w4ActE5ild1M4rbuXcd+CU
	AUcqtsdYOEFZyomCKpqrA==
X-Received: by 2002:a05:6000:3102:b0:43b:4983:5d2e with SMTP id ffacd0b85a97d-43b9e9f9e8emr7373216f8f.24.1774661971415;
        Fri, 27 Mar 2026 18:39:31 -0700 (PDT)
Received: from [192.168.16.142] (host86-170-11-80.range86-170.btcentralplus.com. [86.170.11.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf247102dsm2438310f8f.27.2026.03.27.18.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 18:39:31 -0700 (PDT)
Message-ID: <de4664dfda9bd0d48cfa7a576e0f78788c8856cc.camel@linaro.org>
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: x1e80100-t14s: Add on
 ov02c10 RGB sensor on CSIPHY4
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson	
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sat, 28 Mar 2026 01:39:30 +0000
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-7-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
	 <20260326-x1e-camss-csi2-phy-dtsi-v3-7-1d5a9306116a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Bryan,

On Thu, 2026-03-26 at 10:27 +0000, Bryan O'Donoghue wrote:
> Switch on the ov02c10 RGB sensor on CSIPHY4.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>


Cheers!

Chris
