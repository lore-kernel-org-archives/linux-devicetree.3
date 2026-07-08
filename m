Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED1E4A33
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469789; cv=none; b=X742wefm3uv4k5Lef3AIwPYBOK++J2466VkyF+8P4H7WMrnzLfOxHu0779W1h4f/XuORGyD2atQ9Ln/rRPBuFnqQ0bEGcq2mSWbBdFgJxo9BVaiI7kVRFqwOwl2j8GQTD9XVebznQSR6gGqfVC7cWz6FRtDwE6zKptl1bNZQYWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469789; c=relaxed/simple;
	bh=+IxhJHxFXE6at0Deeog7yecfD2Aqe4PUDDvFgfAOp/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYpzKmB9pScFs7cEf8DV2HgZ5YjramdAiNMLj7Ay9B6wjpSus2CGhV5LfvYgRhSIVZ8+DwbFss/m4IUpxlGvZnlrJI65S0YuW2un0jD9l5TxTTv+2a9IiH38NKPYaZBHhiy/19q5buycnxtFVtgTmTQUhMKiL9dDLlDk08TSBEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d2HeJpHE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d2HeJpHE"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-475417f010dso32412f8f.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 17:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469787; x=1784074587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GThHvAe0hdwvlCEgL70hqx2pL+WPU/NSDc7oJChD5/k=;
        b=d2HeJpHEFYtO3kpXo6FA395/B33v41wBklooQ7Yp08VT5iJXXo0n5B7E7QNiT0Ikxm
         yexoZlveptshQ1ajHajA2xP4TwfFImT+sp7dG6Q9SwSNFMk4Y84axPJfon+NxmBaeZQF
         FiW/QRtwPCpr+WAK6y3idRXzfKIXP8pHU63PZNwoHhaaaqv/FIEY+3SjC05fjGYFEt2R
         Lkr59WESjUQtyyi8v5jcfoZKrRPQw0iLVJZOJnn3IQglcbOCoi2ZfTHyAGFsx1iMypz6
         ORzVrbse9O/OiNc+dnMPh6OKwil502+W11D7UbYrEMKLgPt/4920f8zxOFJFwZXDQAsd
         pUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469787; x=1784074587;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GThHvAe0hdwvlCEgL70hqx2pL+WPU/NSDc7oJChD5/k=;
        b=Y9wtfGnMTPEyz0s6ivQCUhMjRVbzlpmVYcNEvbzn5M0aspu7nBf/9AgpqK5BGtcjOh
         bgNVE+CtC50K1HLGA+4fHcKUPVB24Q7DA8ZyPythLqCJV4xYGMVVcV65mjZpb+jdONsU
         vjH1NA1pDpY0686x75BPBSzogwzCB/Wb13eJIsHVE4COl3Z0kt93YUxGQq22E2p1dE9I
         yXehWg+Ol1011/QTR2SZVYBtdNxD6jgbru87DwFeISgiWqUH5o05X1yg43qWYkUNe//C
         RDdlmyW+kdTd6JUv5cEqVcIqzImA0tP7zl+aAuTLKQQHwx9Yh0tTh7QuYrt+tiszfZKW
         0/Pg==
X-Forwarded-Encrypted: i=1; AHgh+Rrcrdm1gCOjq4Gq1cnEl5OB2HCNqwNVc8Ihjild5jiv7csiYc7YquD3swahuIyBHVZdi6HgvkN+yc99@vger.kernel.org
X-Gm-Message-State: AOJu0YzAN4f8y0tWpapxiulcAVRgy3kLhc8exp74pPDvE6/Y8HoJQq3T
	22UvblycmkdENxno04yQaMPYt5ONtg3+/VDiptwsLfstJ3oLHHIiEOQkJTU3AFUZJxy9nEMThlB
	U0GgxO4Q=
X-Gm-Gg: AfdE7ckfMabTEGFD2rRoxrh4quZSGZyIjgIqxGx8sqlEl/2hUx8Fz+MvwM2lKjwlyWd
	xmfkALSSFWJpJ6rnJsuYxvpHibxFyw5VZ7n87/vZnqyJPZQ3SKMJka6hh+v4tMZ/dPNrbqs+Jit
	Y/I6ILfRh0lz7GGGMCH9SXXNMUlPCmzC8dums79pL9h3AmnQCg/E3orHt2AYFt4pcNbYrd4KD8C
	ok1l9ffDyww7qn/R2TPrFAVInI8vkNGJlqrZX1+IFTIwby70b2oXWqZ5lNmO2uopgW3AKKOcNPn
	rBxwY4QzWaBEBOW2S5xTJy8+J13v38FZE526SoFkD2THBdrhDRt1F/eFXeA3EV56MxzNw9clhUx
	bthVX4lPaVDWyXlnQkV6Boptt3yUNVLCXg0aUFyVBeMeffu/joZbtbWYm5s7P9ng+H7ZFLsvt3U
	/QLpz7povtPYdUqLFGAu3CkI0=
X-Received: by 2002:a5d:56c2:0:b0:470:80f7:9ef with SMTP id ffacd0b85a97d-47de667f8cdmr6466930f8f.19.1783469786684;
        Tue, 07 Jul 2026 17:16:26 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6da9sm36974417f8f.12.2026.07.07.17.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 17:16:26 -0700 (PDT)
Message-ID: <dfb874e9-8367-4a63-89d8-5ca6e7ebec38@linaro.org>
Date: Wed, 8 Jul 2026 01:16:24 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/6] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-4-f8588da41f16@linaro.org>
 <20260708001445.B4E5E1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260708001445.B4E5E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2026 01:14, sashiko-bot@kernel.org wrote:
> };
> 
> Will this cause SM6350 to incorrectly fall into the non-legacy path when
> the PHY bringup logic is updated to rely on this flag?

Yes. I missed this one.

I will fix this on application.

---
bod
