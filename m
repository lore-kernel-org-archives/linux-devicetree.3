Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DF330E84D
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 15:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774710941; cv=none; b=bhZjOxtRNLeU44OS6fRn3U6wbYiVybxqVGGpwo2Y2hbOd0kL3jB8eAuhL7DbVTdU0RljWkTpm+eK+T2TzAUeWO+/KfEGw0Wxhvi48kXPb0pWPiHkn+bq1mlUXgHpmB5AOdkAZv6ue/KNaTix2hJHZx1s6ljXOm2SoCQa3uvWmSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774710941; c=relaxed/simple;
	bh=ICqzzqLxaQ0oD8cZsvkZ1Auyp2BNEN+4P7TyZ9353cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwQE7+h//oeRFD9aImSLuEOFJDR7bC2fP81taNhUXbM3mbm1/UqsgTbOKQBCw+pP1VCGLTw1FiL6kN+hkVGyYLZHMhQQlnYqXusNSaVVBy4hScAIhOYjGihGih9ffl/cQoQkTtdbDF48lP9lOPHL8lOeZ5ziZD02GY03ppFbsH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dA+R35wl; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dA+R35wl"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cb4136d865so389752385a.1
        for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 08:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774710939; x=1775315739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/kDUry0xFE9vHvVj18ny7RFWBuEEHB+W5Lxw16DJs+g=;
        b=dA+R35wlUXZthVYGFUmdvTh3S5roPveh3Y/N6QKO297DQmVZkjvhRagCSqIcVWYsfA
         Jf2DdqM0E9BzSrjkYKH/SiUvBSVtlCIyzbs2YsmjOJcby4VyB3/YLft/0BVno25gdlg+
         HuDDa/S4epzZ9or/feRGuInInpPyldD7dUI9yEpDk94OEoE4g1AWrJIjWSMq86K3ZHco
         CFM2AHFPLB/3OInhMbyxiXzyVyUWocSA5Lk853bSg9YgKzKj/9IJhRg4kCT6Iufua3Vd
         A+SLJM3IO/8VBNdN19oB4ybvAIpCymqHbuQ8z04WUjxOm+UI7Z7DPOmeCFOMLPVid0bJ
         Pzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774710939; x=1775315739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kDUry0xFE9vHvVj18ny7RFWBuEEHB+W5Lxw16DJs+g=;
        b=ZIUF6QZp2O7l78wwSYsTJRDu+9YKqSVS1G72gyTQG1JE/pZuVs4XO6jxbAX/jGFLFh
         XwAmlrGQVYrGTsiclLSDWIxyAZ+/c0sQ5ipTjhCuVUdWQMFZAiydPa/dwuLtgiR8MQYG
         vDzk1kn0hl8vV99CGNXSgpAtMDu7rUgrImGv4uCbKLHOEBas71yKzkEtfPbycPYeJaah
         9EMcY0m58ezoEbW/25n9dAH7oXl52slhBgja0dGnwQ6WVD5ZLDJ0LYSfRjdBrBLC3bY3
         49U8MKf/AJf4xqNgcHKPHuib2Wi7IkBrZzJneu6SRcAnqsJRsnIow1DOj57dNcg8mb3t
         +jzg==
X-Forwarded-Encrypted: i=1; AJvYcCXj7LKpUuv9v3dsoRtQyfKQRSclEjm2mIqzG49Q+GmA7G9aNFGmsn0qhGI0rHcjgOANpKZp6DXVj2jX@vger.kernel.org
X-Gm-Message-State: AOJu0YxZfFD34cN5Tgq2pQlhFpYJORUJW7MzSQ3t0u/dIa95ohCPkPiT
	nO37Fc0puxUXexxIbVKLDAJ308QqyJUYUkqA8GCRUv2t6YEqgEYZZQm9
X-Gm-Gg: ATEYQzzfMk0yeFbtPepWDflQrBcpGjbGgcPs3HOO3ytdG/0Qxk66Js2/QPrCuiQB1Au
	lyWoOW6kMGDGgTVIEbW4mQ29TyxTLx29ihArZEwePtHaUw5dWA+AhL8WsGaibIdF0xgxd00iPON
	2xfg5M43KkseQDsn60d0W+qQZzdVr7WePzrksiLU1fZvZfvwAW3ZV0jQbIecDoSDr+LsJFxYy2u
	un8ol2rYeW1hRZCLfqG6ibvDQPff3qyv3XJkLhELbztl3P4SGPswQgZcgWt9ESf9tNInQasJ3PW
	4xieNSuQfhejGFoMcVc+1vKVFeFLETh+UMOjVq3Hadvv8yoDtevM5HGvab46XspPKH50QSapwZJ
	uJ3Syjr3ZKyemMWnb+7b6WcQRS6yob4CLSRT9oPEF8wUdOaoZYCELxTXb9+Xg2ZptoS8NIwGDLL
	VONG4+cqzQ3ggZEidff9fLayHILQ==
X-Received: by 2002:a05:620a:4446:b0:8cf:e0fe:f217 with SMTP id af79cd13be357-8d01c60d34cmr849118585a.20.1774710938926;
        Sat, 28 Mar 2026 08:15:38 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d02808677dsm181603085a.42.2026.03.28.08.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 08:15:38 -0700 (PDT)
Date: Sat, 28 Mar 2026 11:16:14 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: thermal: lmh: Add SDM670 compatible
Message-ID: <acfwvk8ptnBrGmVx@rdacayan>
References: <20260328014041.83777-1-mailingradian@gmail.com>
 <20260328014041.83777-3-mailingradian@gmail.com>
 <20260328-resilient-smilodon-of-improvement-a8619f@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328-resilient-smilodon-of-improvement-a8619f@quoll>

On Sat, Mar 28, 2026 at 01:20:43PM +0100, Krzysztof Kozlowski wrote:
> On Fri, Mar 27, 2026 at 09:40:39PM -0400, Richard Acayan wrote:
> > Document the SDM670 LMh.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> 
> Why are you sending patches already applied 18 days ago?

This one in particular was applied with the assumption that there were
no driver changes to support SDM670, so I re-sent it in case the
different CPU clusters change the suitability of the fallback
compatible.

I'll drop them next time, and patch over this if necessary.
