Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70F83D4122
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840964; cv=none; b=Yr7hQPqFLls8mAKz8xqHjxxu/Np5Jktw5yK7IBFZmALZ/XFuMf2yqfK1mlwK46vBnOZTV7e8rpEoyiePFDpHWukhED8oX0bRRcZhviikNTLyKdaPCpSmu9TdlHTadF+Aed9XG/P1HQ+jC36xsua9veidyrY/mSVycWEOmnGvGoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840964; c=relaxed/simple;
	bh=Q0SmKSe/0P9VzRddq50L0e5HM3amO+Is5Tvoi6qvD7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmZf9IxP67kSuPc9e27cR5soQf4br04G5Ym4pKbYoa6QKpSQ2IIDU7dcCuibVUSEqh9kg8Hz1/DZ1s8bpreEtDkbZWH9NXBDvFOa70Q+qnxpY2Tc4fuaU+Ax3/gJMq7JkX8XS6YZBhm/PJqFUOzKvf4iepcCu/VfUmVIa4pEOi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=Z/g+upg2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="Z/g+upg2"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488d2079582so90689695e9.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778840961; x=1779445761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0SmKSe/0P9VzRddq50L0e5HM3amO+Is5Tvoi6qvD7Y=;
        b=Z/g+upg2PhgFsMKTFmb3cKXtV3OS+JGESFIbYHJN92MH8jyW0xTFFYcyQYpevH9/qE
         AlXMjppQr1FBtNC+3B8N6Cm0nW80iH2hxl50XHEVnCfoGpa4fjz/66SryeuQFMfHtyuB
         p+Z2uI8mHv90zwI0RAd7hixy4L2SwK8f0PQjsmwjf4T456t6bmyOj+sM0tLvFCKZGKpL
         rkcSDeFQyGZVg1j5iNe4+HYTMKfqASWdRsMIIYjEDKjO6jYpLntogNmS5IgcW7jfvKmS
         k1G5CUc00jkOrl5TNL2kHet2ieq5KrpSSmZJXdqBxa6Pmd44W6Jm8crMzHQjO1P9wGup
         ClpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840961; x=1779445761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0SmKSe/0P9VzRddq50L0e5HM3amO+Is5Tvoi6qvD7Y=;
        b=T94HS8sl1c4XRsf+hxtkA7bmoqz8NK4ouSgcF3MRiKzKKaZYeR1Wvwmpidlt1HIMYR
         pW7nQOXiVSFsWQ0OTO56b+ARHlpEorIEQRecEiU9hYhfWKgO+6WTlg7KFzyFWuwB+MrA
         YyGKHzldX0dGUUDd/vwMRYPu8FP1R7ugW9+cU/6pzKDoi5IFc5wYp3/Ic1J0ZawSfKGF
         EpJO5f9AYjgqqMeKwxDJXw+Q+TbUqgR7f9EeX4vnRhw3dX0VZvYf8c5G1cA0/ymaGdtk
         u420bGANSbNtY2yqH50Y40Vh637zBy4t/urUdmFfbs9asf6C7VACHUihYuXUDWiUfWr8
         Qvig==
X-Gm-Message-State: AOJu0YzyvDGbjw8eHDfbkMNhGtf31jnArR8UhSH0lQ0kA/9S92rMHdL7
	xqNi9NSIDejnxb6N1DDHquENAMoF7C2XggFCKQOW4rSuhJhfFJu5JQSwUoeCHPU5+IM=
X-Gm-Gg: Acq92OHrpi/gwwXaNDFm8fMSb6S3GDKtdPNUp5syYLnuVYpeoCoztHmoEqOrF5XlvqD
	ml0Ya0EiQ8B1tJj7ISXX8R5ani/onGOdAoaez34KWK4dbruWPuigsXojHJIMeSf82PFO+t/rMhm
	Fd2HxA3pmU+wA/UsJiQGJM8VrOBhT/GHBSHKqOZquYTzfsaojHeKfpfkoyNEOMikBL9dvYBflDw
	vq/x894D0DKDUn9WKqOLY9pUiUfYdLbhe+xdWod3r20ZpKE3ms+wQ+3MoLnsiHQq4o1R9NF6evX
	eMS+mjDJqPQ0hcEd8K2FE9VtofYBa/nzEdRlL1DJIy/+Vg4f0FynmRol9Zpm5Liy6T3iL7buweR
	/LLRnCq5EJcVgm5SHlyId2OzkjNEHs0fbvPl2lwkbpHT8jcqMnLkMiX7s4s44Pr8dLKn97Ua0Ms
	DUdx6FuQHF/GcITQZEPwgq1vNRP0gwjghFj1gP+ncY+iN2tIDroW/OKsk0UfuZXh55AXd4nVzqo
	5HpQWO+tUFjS0HMzde1o/Uy2H5gio0Ejpw/a9UyIvE=
X-Received: by 2002:a05:600c:83cd:b0:488:ae6c:42c6 with SMTP id 5b1f17b1804b1-48feea99e02mr17119805e9.14.1778840961340;
        Fri, 15 May 2026 03:29:21 -0700 (PDT)
Received: from will-Legion-Slim-5-16APH8 ([2a00:23c6:2736:8e01:7be0:318b:35be:abd6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab52a6sm49759555e9.10.2026.05.15.03.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:29:20 -0700 (PDT)
Date: Fri, 15 May 2026 11:29:19 +0100
From: William Bright <william.bright@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 0/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Message-ID: <agb1f1VZMvOE24B-@will-Legion-Slim-5-16APH8>
References: <20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com>

 Hi all,

 Thanks for the acks Rob.
 Gentle ping.

 Thanks,
 Will
