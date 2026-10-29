Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266664;
	b=Y7DLvpqwXwJWLXZqHLwc5yqDUV8QbysxiTw+SqEqyom/azwnNtjXsPCHgCboK/zMNmCu
	 ++7Jy/ErvTVpLqPT7WV9R327Kkklf3eGsk13wccsVgplEHLPlm7UFNSXWLPkNyjwcloNk
	 9HtaSyC0PQ8dnHuMh4pIJ9p7v6waA9rAHs6GXuH1Hq4kCkdONL/ymHFVZbCx041XTDi+f
	 n9nLN9L6kzqSwKDmESVgjVjRon6pYsXCc0hmpsfftjQnouRMVkGoQeEgYntuAuqPxdZ1L
	 /n/WruieVksIWfRvGgDTRk6M3AzMgsaDLO27IR2n0hBUIiTPqeumHj/+PjJ8mgFmutg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=DM2Q/kSYWYqLMCbF8lnJCCCQdVX+uPwPiquxROWwhc0=;
	b=S5h1Gow4qWzwKzwBChph/0AX4s9U+FhxW62BEBqtbEXwsXq5GYYEZZbjF8PpvY/FObPJ
	 bkRTKE57ib6DC1aP7fTL9a4ldCeH56BagY0T4lOXZrh1EgbQNrAwgMCoa0SvA5OgNIZbo
	 7lBFvHH4HEh5x6CCEvSbHjeHSwTtlO0nk+/1j37T/4GdQu5pq4LMsr9P7yt7ncttYLv1S
	 AS3nWRSgLzs6Nr+5Oypx/kWlsFJqtlxlPhjqIm/MNT9JtZ4MimB9D6KdeMvMrFM4XeOFD
	 FyDYdD02brvjnZ1lyWAug2XuG44Ss5eh7/kxgMZyZbQQ6tCnn7Kz03o6MNjlfNBFTpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Tvlfi9kk;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A4A606A321
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31A4A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Tvlfi9kk
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so16894285e9.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 02:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793266662; x=1793871462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DM2Q/kSYWYqLMCbF8lnJCCCQdVX+uPwPiquxROWwhc0=;
        b=Tvlfi9kkVZdSPhIzlLydhHuDpvCbtkpigMXcPJSx/VgUJ3csemwFPH3EtWdV6Etp+P
         NbA66dOQOQlfNFxvQLgA9rBK2HoBeYyqhpjO0SbDlVPDOrALYrUSrno76UJXo9pW1MtN
         GXMHERCWzFSHDCvPpVUfyp11hY5p9q9zI8gWDawSaayo1Q6ztGlGglgWXUN6gbuF2xa4
         Bfh8q3hoAvJ8jPs7HKaplnHqDmF5d+EdmhP0mzlcJdQ+/ddbPkZoNoxdb28lC7EeIBoU
         /xjeUhZnu9Sq8QYLDi9HwKGYgp7EqJfa8ogCGSD01XRIv1RxASB9WH2WSeJht6btVfxT
         TPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266662; x=1793871462;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DM2Q/kSYWYqLMCbF8lnJCCCQdVX+uPwPiquxROWwhc0=;
        b=OEX9DsQYaqkGF/4T7q2wP7uj6ZU0GnA+IheikYGlBodmtV/REE7QuBpzeO9TrBj2zU
         Ns16zrVSrXEsxLabmKegnmQIoRMQh1gyRYz2Kea9a/XzFNmQVp8gXFAXvv0ahTWgoskF
         gygS83ZDZ/IHxOwUkdwEoDtJfkFaQq/Ji8fXSV1V+LXzFE6j7l/zeff1L/YxbGzfhh81
         SikvvpGVQXdzdt8g/Jzvk4c0zBjDUSpM/3DerrP3I9RyAN7bcZ+TzVB0i28dguqeIr86
         ts2D48E1irY/7Eu5I2kUYhLoUVCYWyuorUp80SOBQK5XBKGpgVT1tT/RLkE+HsJ5CckT
         9L4Q==
X-Forwarded-Encrypted: i=1; AKwUvByXx+8aHY1jEonRjVbYxzxrEEAY1clGuglvIVwPw7Kt01FlfN+JYZ1dCMAub1/5PImHGxpU7GiSIRbo@vger.kernel.org
X-Gm-Message-State: AFq9FYJbI2icx1q/9GzzASOmklDcjch0axpZkXyk5y4udqPEFxx0BRwB
	qNClifa45AqXRMBB2UFwgHJnyUlX2qK2jEr+NFF7o7GQ6miwVL+5h279f9lp0vF54Lk=
X-Gm-Gg: AYBFou0wiNzDQSIqiska2/r4HwM6GjQZMTc8CAauFsD+s0VQ04IhEaLRkCt9/uqFvMS
	6ZGl67ipuNyOlSRwfFTfwpc7gkNLhJoGtEN56begHz1SKq1e1DoPcAPUR4+x1e1WZKtwN1ZcKtR
	DkLXFKR7jiZttbwFPMDfj09c7weo3uH0zCiLoDSXC0kYinPpi6ZhwKhKvyc4npXR+9iHBm/jBKH
	4iFChe8oa10iCoELWpaTRWLzSd/k4Uz333Hr/oFB+//Eew1Pn9WVtiJp0ArgKDebByppo+RxKAF
	wR/FUd0etowv/rVfjSgiOvlrq5HvufoOZ6FLw6AIFPKPrbNAfaWiYHSDTshJ47m9kt5TiCNhs+y
	fMwS42/yR8VOxz3gkQ7K//7LxGXWvv/LviLCprksm3KiDmcqNZO5uy7ObkJic/X23ZezSrSV3Ul
	WXK6hsYG4kLwTZUCIp0nMRmj3PM47XXFEhM85d9eYrvtY4ZZh/utatCyx5U5hF9aTUrJ4fB4YHw
	djjMlmyHTRPhXTzBfb1G8A95DixnMxrq2Fw4dXC85xpWbaF7ItnSCSDdICT9ahUnvYc+4rVlYey
	nYr5M0sikaND0aCRTHntCT/cMLyz7gbrFTBCc5BO
X-Received: by 2002:a05:600c:4455:b0:4a3:59c7:f226 with SMTP id 5b1f17b1804b1-4a965ec950amr104208525e9.6.1793266662424;
        Thu, 29 Oct 2026 02:37:42 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f4cdbsm59460365e9.7.2026.10.29.02.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 02:37:41 -0700 (PDT)
Message-ID: <f3a1ad00-5c74-4922-9c65-dd7a56c72582@linaro.org>
Date: Thu, 29 Oct 2026 09:37:40 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] media: camss: add SM8750 support
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi.

Thanks for your series but, I'd like to proceed with Hanxiang's 
contribution.

If there are further fixes you'd like to submit on top of that enabling 
series, please feel free to do so.

---
bod
