Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794603755;
	b=5QpkZJNQJrUwA+9Yjx7fcySOlzI04NtdiFy/UPQ5nojx1IAtUiUctwqfqcekT1WaCaCP
	 7faEMlTo07NLYjzKPBoZ0BWFDvpmszyP/S3XbVgjgGz/CdEkWjqwdnJPyxHBi1uZRkLFs
	 hOFiGijYtxexucDGgN+ArK0caPE2trCL+eJuEjtz3VuiMYjlom0Yk+OmqBN4G7EpBwM1y
	 vm7E1SeoPio8m9HdGl6IWErLYevqszqWuop5kH6uYT8Kfah27XdLTLFyheE37xW3w28KL
	 EyhSHQIG1I71hLlmUaNPxKtp939gVPMx+xnpyPmMMlea/DoRiKKaEOgA57QEmQUc0ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=WPkgnC5e+WeNq2AKDa7fMC7l8b9olE8X2nbtjw6g9OA=;
	b=xESS1KBfK34boG9o2YJVc0BqdGkORx4wLUmSlZHjElkD5Iyjik4YxE76h4iSypRVzIWr
	 KKQ6oNw25umZLSUOCrQA7E0Y9Umjv+RjNP4aa5TJ3ey/yBNy/wM/41R1pT8o85AATlH/x
	 GgZFN2O6Q1qw4t1B/VE+Inr2uNSaWDi/KSBAY23lD9VuMG92+Go/S4ZMhe/M4opzI4zFD
	 guS+0+rVSy4WCFz2dvMDsvUXbm2MWTRpP3ZgNuBJ1lt0WZOFMSm4Al0Z36yejmgniXSK6
	 2ZuyCi6zN7HGWg/uMYusFEkwSuKOmvgcMY+wrSdJoYKKGVY/T7v1aGdz9V1DljpzpRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0S20X9Bz;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4A0606A32D
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 21:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C4A0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0S20X9Bz
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso12326115e9.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794603754; x=1795208554; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WPkgnC5e+WeNq2AKDa7fMC7l8b9olE8X2nbtjw6g9OA=;
        b=0S20X9Bzah2+Tfz2ZQZw1RqrYJZoCU9ymtgMPp6uzL8ErAT7IJhcPcjTW62UYeCDR2
         tKfBYXayDMZmeIzcu001CRANf/r0KwcFunyPz9WusvFx7EBIlRSQMGj6LM1BgqCUguO2
         SAVSd0/U8H4U0XTIVhOwG2aiq8jNrQ70Vj5HtxtBJ0YqXz7q9qGQN5oeqnAfnNAvZVhg
         TR0MsIdEueeVx97MS/+trojKIKAnvpsn6deSKdRtUqiR2TEPre+hN5cRvp4oFdGnTyZr
         e0028uedLhvG271P78vpW2+1KWYpsNLpWtKC67NWDeUSCewzmQsCnB5dx5rOzn5rQiBn
         hIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794603754; x=1795208554;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WPkgnC5e+WeNq2AKDa7fMC7l8b9olE8X2nbtjw6g9OA=;
        b=yMyhyr1p//NNJTWSGbar8G5Urnhbqdt5fYez2CLZa/uy/g7YA9mRkmVWioSdt2AhgR
         KFdSfXBQ80zZwG+M68mPzLim7HPe0UvC2hAMgBKkE0EclQuS7j46KGx5Cl4Hwz5erbk2
         uIFdwwUHqrxe922nKPJhA5wRWLuUFVkP1XOli8hYvH80TJLft2rqz+lCt0wJVnfQiftJ
         EWkBdoKgaj7xAe5XFoqcbknxPNCmXtGyH3NohIGJu3uXHsmlQRWGJKYIfKbs6dJs6ci2
         hcaKvSbKdn/NBGN+Zq7wYby1Xq2twM1l2mTzsY4+7u/cuUHCOEh1jv3ymMmVldNw4OM2
         Epww==
X-Forwarded-Encrypted: i=1; AL+hErEaKks6JIOO30zh9VyE8BHUzGs2OBSKxLVHsPy5VpnfVVEpRv70iQ6nA+H9ivOkAMA0t9F1aouE1hHb@vger.kernel.org
X-Gm-Message-State: APuU4Z85Rt8a3sXLKM2VNnntW+WPzg5H3+ksPnJN6WN36/ndGMANg48W
	6BLF9EF/FcamkossuZipp7okAdwWOGcnQ1btZt7RbtUHHcH4Z/SlPPnMvavrng==
X-Gm-Gg: AYBFou1rrk4QwrlMFHgAWjCu1lE7nrPhIkg6xT1PoG9o+tGj6WOlFYk4gAAtLw/RNOs
	sClR8+iWYAFgqM0nJygnIcP7uPkSdLTUln/AjFmG+ISv485yjvF6JCTAaAN01nWdRKRMx9pmbCz
	PFcA5CnQvYhZLcLim35mXvEiwH4j5Gpye9UYHVBFLDQ59adGmfVRMhchwu5p2K2BlsA4KQBBw60
	F9TgS6ohHtI3UYvGbDVvrZR1fjjNaR5mBhU7n9M89nRtUyGwCE4OrZI6AlR5pbepLuUO1/E4vvf
	NAmGl6bD37iaPQ9O1yJ2HyDU/Ir5A4YE3a2Gkwoez3dV17pUAIQsrujdOnpyzdLuq6P9lP0q//0
	u/H3GII5N9GlkCd9nsvFk4CEe98vVAdmZf0sh5R5ie5MKu3l2ThEEKaUfiqb/nEP9ETs2is1wTU
	DJUEc0ZZ2NhT5kExJ4N+A9hY03Oa6zoIdro5UnZiYlIQ4B0jIhBbGTYSOA+bXrUFs1+rHNGeJpV
	qLTVf3giAVUd4qjMOdSOEKYQLHxL20udiw7Jbyp4RWPC4m8/HFe
X-Received: by 2002:a05:600c:4313:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb55a83305mr53419345e9.34.1794603753909;
        Fri, 13 Nov 2026 13:02:33 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm4635295e9.15.2026.11.13.13.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:02:32 -0800 (PST)
Date: Fri, 13 Nov 2026 13:02:32 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: add device tree for Asus
 Vivobook 16 X1607QA - v3 series
Message-ID: <0a29235e23b24698adc59fd117e0a222@gmail.com>
In-Reply-To: <9032798812284dd2842cbf003c75cc0b@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

SGkgS3J6eXN6dG9mLCBoaSBhbGwsCgp2MyBvZiB0aGUgc2VyaWVzLCBhZGRyZXNzaW5nIHRoZSBT
YXNoaWtvIHJldmlldyBvZiB2MjoKCi0gYXJtNjQvZHRzOiBhZGQgL2RlbGV0ZS1ub2RlLyBmb3Ig
cG1jODM4MF82LCBwbWM4MzgwXzZfdGhlcm1hbCBhbmQKICBwbWM4MzgwXzZfZGllX3RlbXAsIHdo
aWNoIGFyZSB1bnBvcHVsYXRlZCBvbiB0aGUgWDFQLTQyLTEwMAogIChtYXRjaGluZyB0aGUgVml2
b2Jvb2sgUzE1IGRldmljZSB0cmVlKS4KLSBhcm02NC9kdHM6IGFkZCB0aGUgbWlzc2luZyBxY29t
LGRtaWMtc2FtcGxlLXJhdGUgYW5kCiAgdmRkLW1pY2Itc3VwcGx5IHByb3BlcnRpZXMgb24gbHBh
c3NfdmFtYWNyby4KLSBhcm02NC9kdHM6IGFkZCB0aGUgLWVsMiBjb21wb3NpdGUgZGV2aWNlIHRy
ZWUgYmxvYiB0YXJnZXQgYW5kIGZpeAogIHRoZSBNYWtlZmlsZSBhbHBoYWJldGljYWwgb3JkZXJp
bmcuCi0gYXJtNjQvZHRzOiBjb3NtZXRpYyBjbGVhbnVwcyAoc2luZ2xlIHJvb3Qgbm9kZSwgZ3B1
X3phcF9zaGFkZXIgdXNlZAogIGRpcmVjdGx5LCBzb3J0ZWQgbGFiZWwgb3ZlcnJpZGVzKS4KLSBB
U29DL3NvdW5kd2lyZTogbWFyayB0aGUgTFBBU1MgbWFjcm8gYW5kIFF1YWxjb21tIFNvdW5kV2ly
ZSBkcml2ZXJzCiAgUFJPQkVfUFJFRkVSX0FTWU5DSFJPTk9VUyBzbyB0aGUgYm91bmRlZCBjbG9j
ay1hY3F1aXNpdGlvbiByZXRyeQogIGRvZXMgbm90IGJsb2NrIHRoZSBwcm9iZSBvZiB0aGUgY2xv
Y2sgc3VwcGxpZXIgb24gdGhlIHNpbmdsZQogIHNlcXVlbnRpYWwgcHJvYmUgdGhyZWFkLCBhbmQg
c2hhcmUgdGhlIHJldHJ5IGhlbHBlcnMgdGhyb3VnaAogIGxwYXNzLW1hY3JvLWNvbW1vbi5oIGlu
c3RlYWQgb2YgZHVwbGljYXRpbmcgdGhlbSBwZXIgZHJpdmVyLgotIHNvdW5kd2lyZTogY2hlY2sg
Y2xrX3ByZXBhcmVfZW5hYmxlKCkgcmV0dXJuIHZhbHVlcyAoc2VwYXJhdGUKICBwYXRjaDsgcHJl
LWV4aXN0aW5nIGlzc3VlIGluIHRoZSBkcml2ZXIpLgoKU2VyaWVzOgpbMS80XSBkdC1iaW5kaW5n
czogcWNvbTogZG9jdW1lbnQgQXN1cyBWaXZvYm9vayAxNiBYMTYwN1FBClsyLzRdIGFybTY0OiBk
dHM6IHFjb206IGFkZCBkZXZpY2UgdHJlZSBmb3IgQXN1cyBWaXZvYm9vayAxNiBYMTYwN1FBClsz
LzRdIEFTb0M6IHFjb206IGxwYXNzIG1hY3JvIC8gc291bmR3aXJlOiBhc3luY2hyb25vdXMgcHJv
YmUgd2l0aCBjbG9jayByZXRyeQpbNC80XSBzb3VuZHdpcmU6IHFjb206IGNoZWNrIGNsa19wcmVw
YXJlX2VuYWJsZSgpIHJldHVybiB2YWx1ZXMKCkFsc28gb3BlbiBhcyBwdWxsIHJlcXVlc3QgMTQz
OSBhdCBnaXRodWIuY29tL3F1YWxjb21tLWxpbnV4L2tlcm5lbC4KCkJlc3QgcmVnYXJkcywKRGFu
aWVsIENhcnRlcgo=
