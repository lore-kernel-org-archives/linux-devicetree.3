Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC4C49B46C
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591005; cv=none; b=rSdyneptd/6sAzh7/6L+PU2jkMa4C3jy3VPH3Vzh220sXQljjFhvI4l5N9YSp4NJ1Zg96lhLoedTFC/sC2oo7QoohVEeP5DGhfoMcwHUk1gBeD3PQnsMRyCX0KCngRMVCL3lqXGMxKRJgoteJrq7hKDwnYEPxMBvAjZSy+PHh9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591005; c=relaxed/simple;
	bh=Zfuo4MY7PIOTujR94JDa5G6M8PRZiDvEWeZJmTK8f5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWi2S2G/r9vnGX/tGNT7MEDSNfhjxw36yWf0Ga8ULPGDsmIoTZ3Qtgs9MWRJ/bbo5uM9s7fujuk974SJN7ORW9HoCDWl6YzZ/P5nl6C+TNmkpc22D6vhGd9cQ0qsqsXF9uqpyOOPWuzokONhe09yRCCr4phOqA52mAHfIlNBqLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=U9uEngRt; arc=none smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="U9uEngRt"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aaea178c96so3213036a12.3
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1790591002; x=1791195802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zfuo4MY7PIOTujR94JDa5G6M8PRZiDvEWeZJmTK8f5A=;
        b=U9uEngRtKkY7mvafN702Hdxj/4YmhjXHyIa9/ozX8gTOUxadhNawGBBGt7439H4q0C
         Pdano1VUy0D8dwIUBF64yO/J8SKR/agU3awPsNd23uf/BOAGVQLppqwJOFbTIwVVYkZr
         8BbOKItVRuNjXPCZHyJDWltVBjrf2gs5OuFrMqLKZTxQn0plfbFTNzOiT/1JuVCpKHJL
         poU1C2dI6TMlzywDaBUdXvFTRvqXZhMuZmoPphDKQStpHxbcYJHInMRY2ueR/84prwf0
         p4iz/NIZEzEAvRSnFj8B20y5tcJrSucZhH/gyyOIOb2OEJ8ki1L89NMCK0asBnZwXdla
         IlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591002; x=1791195802;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zfuo4MY7PIOTujR94JDa5G6M8PRZiDvEWeZJmTK8f5A=;
        b=MzUCszdAzGWQH7bn840/EFpIGY7A7BZeZqCUviZe0sdAH4eZTt7AwIq+tMYXc+mO7G
         Di1ShPq03WqYYN0E16pfw4hzQt8coU8SPq+czhRpCD3lKRnXUOQkXDyMCuJpGQbUbCtI
         0Xysrpm2Uz1VKo1E/0IblNZJimgQW9hUsQE9F2VL7+gglBu+nHpKvnSwcga0BW0Bgr/k
         9wQLifia1srqUuYTIoaTjr7RExGoAafSq2WJvcpvh15bQ85oBAyTEu/odnnWjbBpYJcw
         nEqJDX9+WRE9II8m/QOENf+74WnpSkpQ6sZGU4atkw/FSvgrf8QRqO44bgZrmHHyPwwR
         Olag==
X-Gm-Message-State: AFuF++l4qAnnh3im5eSFBB7cjsL+UuuAgOaRpmBrFNjqxQGbQX0ABdZE
	Y0rENUqVmPWrRa8QO7vlxvDUudoBJ+gf8ckjDmtLAtCCPQqiBs3e4kl8pDYejkr/GT0=
X-Gm-Gg: AYBFou2/iNfaO/iy96uPzs/zblwfYySgYxbmUGwh9gPA5s/iIiz/dDCoa2T1jUKBhyX
	XhYlB29C5AfuOOdgO1epNDsltJKyxcdTdN04dYIbETIr7ENMBaCm3DvlvYlRl3ISrx/lX4eDziu
	lMdRtdSpHu/twnqKRu41FFaOqMW4pECCnPlUPrf1tuK6iS4ZwPAl8FSfUEsG+LlAe54uqchLLwR
	omyGL7On6pQ63qG/d8Io4vvhzcNzVNPN8hI84ljg0x0H1KCrIKcBJalBK2bjqQsApTxIz2xEoJv
	hTHymjkoLlMfjpp32LJlqytIzh2DRYXTQjJO+3oLJ3NxO7MUsSnMtg2V0wKP1NiWCm73bCvRww5
	UB5XHo66ugQxKbrggzZUdURj9LBLJkCB9mb5jKyKug1NZEwClK2yWE3APXvTjitddPOHtwhcRmz
	Ek664cESWtmE7pPn+JAs+zQlYr3QzaSzakh9IH6oEA25J5G9Xak3EjxocjZr0t16qIv/hytEFt+
	dNaDZLmqqjMH7C/p8gpP9kJGHqqKXULz9KhNvyQ8+c83sitVGd5H/R+EvT5UubOu0ac7NMtLb3A
	LhIZtkphZeR60ifV737XEoAsJW0Fuxqkl+CTGLr1
X-Received: by 2002:a17:907:3895:b0:c26:1649:47a5 with SMTP id a640c23a62f3a-c2ac53964cemr968869466b.27.1790591002152;
        Mon, 28 Sep 2026 03:23:22 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757ade3sm450982266b.29.2026.09.28.03.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:23:21 -0700 (PDT)
Date: Mon, 28 Sep 2026 11:23:19 +0100
From: William Bright <william.bright@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 0/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Message-ID: <arpAF3tYlxKw9hjj@will-Legion-Slim-5-16APH8>
References: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-imdt-qcs8550-sbc-rfc-v5-0-2fb988854623@imd-tec.com>

Gentle ping,

Can patches 3 & 4 also be applied?

Regards,

Will
