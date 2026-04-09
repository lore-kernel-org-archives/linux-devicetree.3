Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9793806A3
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 07:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720798; cv=none; b=IGK8UyLcqKYzuy02epbyWsxXJDN9rUAakroX1X3D8zjZakmE6+tgTEsJ5wbyUPLoy7VVHCmXmhGM79HA941RHJfjjNR1aX77pMd5F8j+1Cy3eTUaPHN7cAnzOGPYL2EDx2Qrdq1+Suu9Zu+i0jy/MkePnaxYxXE2Bzmrw9WA3II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720798; c=relaxed/simple;
	bh=BP2KcMnRF0zVH5NvOgOE63eTVnN+q88HxTx49+dIyR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqZTqG4tzcpVcFzzCdo2FHbyZ4O8PCKoDdpzkDVvbxyubFwGGyEpO38vYssrs4t3z21lx8JXLU7uTxvDqnf6HDDisht5Xb4XVjsRjONhpT/D933vqcDPlHRBG209o3DFmdnf6nijkgC2YGr3+XOxBBkT6zSxjT+4IxU6IqjuaSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q3K5vVVf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hnOxYRZ+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q3K5vVVf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hnOxYRZ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775720796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vzq2GXPPGMC+IRIbq9cbXuo6a7PNhvIxJFbGIOX7fT4=;
	b=Q3K5vVVft4/c4bNW4s3mMgTwYUuwLw+i0o0fcJEARyhx+fZXeFSJavg7LEtMclQVC6BHXs
	bGC2In8MqTKkhbzl4/bkmjaS+89R+QCIPGj+VhpXCjvc/X6/dvTSeQbDKbgI/YvhiDsChk
	BHTpKGNtxy2D1D+OG9kaDqT5zvWAm/8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-VMKCflOkPgqLALDoGrAguQ-1; Thu, 09 Apr 2026 03:46:35 -0400
X-MC-Unique: VMKCflOkPgqLALDoGrAguQ-1
X-Mimecast-MFC-AGG-ID: VMKCflOkPgqLALDoGrAguQ_1775720794
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43d00dd913cso537244f8f.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 00:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775720794; x=1776325594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vzq2GXPPGMC+IRIbq9cbXuo6a7PNhvIxJFbGIOX7fT4=;
        b=hnOxYRZ+m6YxaRY0rSfneJ36lhvq6tpIm463nFzQcI+9YWfpqQuFKk0A7ZoQ2owB0X
         FPPkE0OizlwYbxzCqvz0A5ad++fU10ZRVRWEM+NdSmeVZW9OByBnw9sFab02rD5Os6fT
         9oOjuY/0Umh005Q5vZ5e5sGMgwvGb05rwDZHtYgLMwtPwO1NK8flFlr6q1JRWPXFnaas
         RiJs7lasAsoMFJ0c9S/jBXl4RmACXjGOdCBI5GDYSvHaHnDfP0FWR12H6uh/PkLKOgB3
         Zc7hAalI9OKIhh4q1Bh3szDPonqpZsHQtGVz194KcZfak71IaR5pzCAoOzMqoQAo4gUj
         Ul0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720794; x=1776325594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzq2GXPPGMC+IRIbq9cbXuo6a7PNhvIxJFbGIOX7fT4=;
        b=RtP03cDfkGSiJzoSL4FthS1jjJa2SoZaThC3y58WhJV63VZy8OTVWVeKqEd9I8dIhT
         UnhS7RDd6TaLO4W3NCmpsBhVXdYOhswyVuI9nkP7lkcigTEYJ6EB80k9ShoV1bM8S3aH
         oyYIEdD/k4cS4EHa+qSp486pbUeYQhfCALzzlQajLGYTxFBydsigrCEgnBkSE+9MD48w
         75vlWSEJMqjMqCrv2bJV2ZPXXYNLvylbTBoqz7ooNprBZ8MBM3mUGBttjWlIH1xmdMkh
         qWKTeyGaQWMKDlzgt5fpdU8e6AzXQnu5m9ybvVhoTcYQlGKbtcytMbxD7qbK5YqsrDNC
         6ZNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB7Obfbpw+oHk1dxHAG5Efo4/t0g/TgCfwSBsGZIPgaZJp51co8QXg7c1qfi6ANC7aU4Dpslb2rmeG@vger.kernel.org
X-Gm-Message-State: AOJu0YxSjTbdSHAmJa2tyzirqgHAA9mO1MAtKEOYBk451bCKR1QwuwZF
	K9K4Ac5UFpuk7CGTa8FWCdz/gBx/SRFStUo1B2ajBNZengf17wjtk61YwpEiMG6+v2RxfNKtIpN
	qG44YDTLS6gNNV2VUTQjJE942/ka82o8T8LhlTI3o0xky93gbm0CFd/Ll3HyUMNM=
X-Gm-Gg: AeBDietz5AFA0OjAuwAqy53eb1nLvh9JzrGfLoWC+fIOhu7l2rnRF+I6ScZCW/WSzKa
	tMANhHAwcW/g7NqnDSA0CCy8AUOrMp/wVTdPwFJs6PFfDDB5iaEqkXKOqT8DlQqoAmAGx9M4qg2
	S2KIkLGWK0fNCqT2pBntEJLXQg43zTwI6nUr2SzOqlvMXuDHgdJ9v4GJ87YJP8kimoCdwxNSk7u
	WOm3utE8U1f2n5AU6CzM1uXi24pzhFiTfZgJJqaoMrSKlmDdLNU97HWGkaTwIoHo+H4QEYc3QNM
	8vhjSPsGEc7luY5bkXkGPqBiDFtnzKuZcs+FiaNWPevVRrLwMpFSC11onupkEHGzaKCG/luYdKK
	eJb7omuqw8mu4FHiauLwRO+VrlciMRWTun0+zfAgOpN/f/ZuNoM3Z9LhT
X-Received: by 2002:a05:600c:3b23:b0:488:869c:edaf with SMTP id 5b1f17b1804b1-488996df052mr297307765e9.8.1775720793998;
        Thu, 09 Apr 2026 00:46:33 -0700 (PDT)
X-Received: by 2002:a05:600c:3b23:b0:488:869c:edaf with SMTP id 5b1f17b1804b1-488996df052mr297307315e9.8.1775720793542;
        Thu, 09 Apr 2026 00:46:33 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd2181f7sm58355485e9.9.2026.04.09.00.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 00:46:33 -0700 (PDT)
Message-ID: <48464d44-1fac-47a2-839a-c963e9421615@redhat.com>
Date: Thu, 9 Apr 2026 09:46:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] IPA v5.2 support for Milos and Fairphone (Gen. 6)
To: Luca Weiss <luca.weiss@fairphone.com>, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/3/26 6:43 PM, Luca Weiss wrote:
> First, two fixes that unbreak IPA v5.0+, which can be applied
> independently.
> 
> Then add support for IPA v5.2 which can be found in the Milos SoC. And
> finally enable it on Fairphone (Gen. 6) so that mobile data (4G/5G/..)
> starts working.

You should have probably split the series in 2, with patches 1 & 2
targeting net and the following ones targeting net-next. It looks like
patch 5 needs some adjustment. I'm applying the first 2.

/P

