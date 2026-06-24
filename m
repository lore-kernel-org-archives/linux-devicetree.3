Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAAA3B8920
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782308089; cv=none; b=iTpIeWZh+ll+RSzw5EbxvW3mGCdueUEcARd36DXN9A+lfyC4hrh5h7LPnxVKNW9TSYaA0LqyIqCmhFvmr63WPmrACBBXH46nMXSempNlSWjBXN2SvW/XC2eAXOYrXTWWFw35DWRl4+pYRm4NUm8Q2sFFwQ75GLy5OiT2nCbdPis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782308089; c=relaxed/simple;
	bh=BAH58CY4vjGeZRifmYGQaG5pH8ZzV2za/AljJybMMRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJ+MyIWReoTYNemrd03ixGUJja/FQNBhx2KBXm09TjziVU689+2N48A8YDAt9snv4HgY5+lC06A5Kb9NcFIfdX8jbBob2J638y9E+vAQWi4odXZYmL3EmKH+YxizEvzy9r2b9A2txXFDn3OxCfwKBOvt+iuVsrvX26WWXnjCINw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=N3+JC6UX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="N3+JC6UX"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-46caaa805b2so335712f8f.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 06:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1782308083; x=1782912883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BAH58CY4vjGeZRifmYGQaG5pH8ZzV2za/AljJybMMRI=;
        b=N3+JC6UX1Spx1NQPlIDV8EA4OMQ04tZYqyq+0+PAoMY7abg08703O1H7mTSQMG+mrQ
         LOGPCGKztysVErW6+EJWxmpVCCkLbCtdGSStQDMf/38eBRecjcLFfbysExv3flQeb5lI
         0ApKSR8RuoeTVczJENQIWoS5zXaBlpSJSCHrwLPJip+uiy/jmATipBovKsQgPxDFwKgs
         2T1ebIQx8wzwiHpV3I1Qv1laNkKQRI0gXPmkJgVZhuuVFtfZgbmc+gXXm3kGWN6EF62K
         dWMVP85vAC+YWm+I63h7wsLImJUKxXfbJbINeikitRaNWloppo/XSMYkfxNwM+/uZeQQ
         OFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782308083; x=1782912883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAH58CY4vjGeZRifmYGQaG5pH8ZzV2za/AljJybMMRI=;
        b=VwbMhoTtfplcgqmLxW4dFWVavmc9u46kMDcjVuion/2YqIcnPR2JhTXn8V60UHuN8b
         nAf76jn/tjMUYjmG6tkFRvDR/8odSjf+g2uhNhn2tWoMfqpveYFy9CVwcVHtZVZmGTcj
         8o9PpdMkgzTri2LhCGclyR77m8APyuIDlcSDE1UuTN/8dZVkOAJa3XnUWOlIwfZ1/f2u
         W3ILAaVzemi9oNeo/Sk5HJBjNRgOv8iyifrvBRWltYxmJnNCK4p2PC5tbEpf6FN3CcOm
         CDvqQGuJT9juv4+DcK8FeuMWGTvWyy9Ny6sGHplHaUIE/yLDzAyHafDg9DcC2WVQ+axk
         2WPw==
X-Gm-Message-State: AOJu0Yyynj9IlaQE2+XWQ4z7Wh/wLA4ckTu0CpnN1Dxhm053nIFihnjW
	0unWsEYjBT9psyJrwq8FetxBIx1r4KSxzrGUtWBVI9AEl8xnIkrmxCqtJXz9VtkMgtI=
X-Gm-Gg: AfdE7cmSauUQrI4erd6RVTXtDHtVPvutupRCE4B4qTNGRuGA9k0AbsIHx+UBUTmwy9e
	sbiwIt6J/yVc/jtGGJfR5VkdHOWGtCWdc3mXDz9BUahMxdYmKyqgltdE2slISf3uFSFiQIs9L8+
	6fHGSAUpFvnTxQlbeblJSLxWPWzXpit2Igd8woZakuUikY4i5CLLgQptGmuY5Mv57NSqCi1fJ1a
	9nzelI6FUXvibOIfDijJP2TKBygWzljmeCJCpv2QURY6lBIRZnE8y8drM+CPq7OXUMUn1P7Fgxq
	7Dj+3wXs64Z2h9UFqcPjRD5qhfYMsyxSaeHKwbn6wgq8Y3/9FtOnpPRWL1J1Ax8tsytiqeB9r5A
	/SdyRHh7C93QEM5RWX2PQ09MLQoaxW6N4cJkquzPDg0EyRKTYs6tULKu6WZpKN6vFrapIGaW3vi
	YhkVN7ckVWq/XNoxNglNYwb3CweaFqDpT/iHP9rQEmnVuAQ/GjQF8qQzd1TrK9rQnOUV95XMmip
	MFke1njdCpCE9v9TGf5APGQK9+/Udeg
X-Received: by 2002:a05:6000:2501:b0:460:67b0:7544 with SMTP id ffacd0b85a97d-46c09ec6eeemr5604498f8f.7.1782308082698;
        Wed, 24 Jun 2026 06:34:42 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([2a00:23c6:272d:c801:11d6:c1dc:e7ba:7e85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c225b2988sm6548339f8f.25.2026.06.24.06.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:34:42 -0700 (PDT)
Date: Wed, 24 Jun 2026 14:34:40 +0100
From: William Bright <william.bright@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 0/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Message-ID: <ajvc8CTYAZe3T29Q@will-Legion-Slim-5-16APH8>
References: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>

Hi all,

Another gentle ping on this patch series.

Many thanks,
Will
