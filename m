Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE9341B8F9
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163231; cv=none; b=ge2LkUu3JKmw9VvwqJIqHf12Zd7W3tFE4YuQVM9rtV9wfkGZDPgGz+nPWkxEHHEihYQHuJs0531cKHIb5rkLdJ6m+Lv4PuVe4XkY2h+HY/fqyg6mHyflJeSjCSo0E6UoKcSExna5VZGeWZRXm1pZmXIxHgNK1s8WFXLtgk+Yt7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163231; c=relaxed/simple;
	bh=GkGLWRBVPs/nmA3hEmanxLkmBU7gAjvtEPfAEMBLiQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPUYkunqI+1GSARKYYlzawIn7Sp/HxBjUhodRJ0QNT5tcrJBMzrm5Ztcz871VRsLMKvltApcdP3/hJOVTT27R+fvYtrG2FOLGeFVgL3Q0WuQrH0ktbWVZo8dpEvFiKtHm9FWoCwYUkok8xXXLkfQEP/vsWb3c1W+yuDppUtY+DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d69dyCDv; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d69dyCDv"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca957432c7fso2008343a12.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163226; x=1785768026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y7GYu6iHHA83MEJE5lfFciA6n+k6vBppJrk9mCjfmqk=;
        b=d69dyCDvoPYBpcDdffOzicZIx9W0PFkQ/thfF/v1KosfF6/FoYt1oW8cX3/FLaHN76
         aIRaWl9l/y4qheTUZWQVI+trlrEiqn30+thsQAsD+1ca2BE7AuWHc15LjYk+U3kKG/he
         og47HS4eVufjcu1wl4ohKMTbJp6M9qKpharYbahpHAUTsFABzDgx7f1ZxFOda2yRk5gA
         VBnUmS+nfGoTInd/F39i/mRwJC+1BaQcQbvvn7cQTPcF3mIlyug6pF2hH5Wtu33Otdi8
         fD+jGmiKq34cRZhTLdfNPRnRpAUvWzF7fhI6xFClcK+XQf3dYGmPkugD40fdMTkbjqe7
         t8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163226; x=1785768026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7GYu6iHHA83MEJE5lfFciA6n+k6vBppJrk9mCjfmqk=;
        b=n/15/f6wB14snj7L2/f3J3mqidjmkAO8J9IN2MrE7X6D5aK2h12P4b7xu/DJ9KELnv
         pQutVH0/lHCoVBwEDbt7+kzS7ej4A235dCNbstO/felkXnQX5bbjW84rORaJXlnIkC7N
         LlU4j7mxIiX1xHu0kCrTy7Wjzn1sGhMeF+wW7Hi3IER4PVdmECvrVcJnmP6q9eXwuZO+
         PH3l7LI8spbl2i5DMxdfWG3v59KL1lIuVg0MNHPiESBUHSPGmosezDRqmzOZAPNSKNiG
         c3Jz9TJGy+N4tbNuzQpMOq4Vn7W4fg3kokopFZcei6ru4QaRPpfc/BwvzBqys3NUoCX0
         jV/g==
X-Forwarded-Encrypted: i=1; AHgh+RrposaWf3v3zqZN6paWAKcBkh2NHt8H95iFlNgYFv5b99gCS17z4aW6YVaR/XxuePQgMYe1ypjnXMJF@vger.kernel.org
X-Gm-Message-State: AOJu0YzeKa3BTJCB50pG9weCN3OoSg8QQC/oNB0uobhNsF3hqZqHoU8I
	q48vevt7OqnzL6vbJFKRRPjo4TpUVxp1cdrZcV0fGs1oYYJQRCVaZ+I9
X-Gm-Gg: AR+sD10LARGxQ17yNZQFBn9dzE0Ozn9LTqdiP5kI9raK8rC5owPBRE2pR4oHtAPMh08
	PKBf0areYTV5l1e04Y1rrni+Mem5Wn7pnE7JktkrD5Y8uEaR68hn7uo4h07XwLYYXfdwEoBwpLM
	q8tLM5qLHRIlG2iVTqyKEv2w1lsv6m4Z08pffAEbnKznGbTGvg7sBhh9QgvqTnFT+7axn8cj15G
	mEdn9xAsz+iK9R/5DsHNmgTdfTTqX7aCUJfb4C1/eN9RX+55KhD0OoVYrJjI0j69HandT91LMOH
	adfQGSOBigbvpMeic1tfE2xr/RTXl3m0MAm3tLaehg+h4rltMWiTBVQLBmr6f2qpPlYYZGKrm0p
	MKrIphfCRRnJ+UDK9l1MDqNDoGiEvV/2KJBJ8VUgUvCpOZ+20+P8oGXpJk1G9BlrCkxZsdFmZd3
	rhYsuOJif+P6TERRM=
X-Received: by 2002:a05:6a20:c98d:b0:3bf:6f30:1ccd with SMTP id adf61e73a8af0-3c67e071b78mr8053339637.42.1785163226131;
        Mon, 27 Jul 2026 07:40:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59cfb4sm32413945eec.26.2026.07.27.07.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:40:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 07:40:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: Add vendor prefix for Kandou
Message-ID: <39ede8d1-751b-442b-bdec-b62368e79784@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-1-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-1-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:37PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> Kandou AI is the vendor of the KB9002 PCIe retimer.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
