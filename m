Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDA73A1A3F
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 08:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783155529; cv=none; b=h8kqEsdlgGwleOBTcI8kKu5+fGMtqJWcfbdy28cKbwl9MeqdW7DffspB5YtO+r5WZQJASW0gdrCMb0f9BnKLk2TljDgXVPh9AQl0agoDSYdalmHkP2+sz27sEdqSC1Afr5+1YK6ZKX4G7sP9MGf1HdglH9jV2iQHxvYPVUQW5hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783155529; c=relaxed/simple;
	bh=GO0cPmRaJ+HhoODbOUmJooxCNjwQwnK9RN6Sj23Fxbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HEKNq5xGpZqqyxT975JFvYW+xZTR1jQpnasfznJpp+s51GCLGCAOs7UrUPKDTlPMO++LnG6CGKATfP6oZJ4gtQKyOua4kNOffoimxn3yD7D6WRn+b7OFcipUkWo5RyUd7mCTEnp5BRMqjEkvOtsv7LSGIryARRk63xeY4quisBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iurhp0ka; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iurhp0ka"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-80bab6cf5ebso31026847b3.1
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 01:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783155527; x=1783760327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=th9Jzp5gWYXL8UheexAgAZq9F8KzRdESqUqY/zvS74c=;
        b=iurhp0ka4+sQspOkzfmtRxfaXR20joktFvOY3+SR6BFKoQabAEUVIlCKI7D5Pt4uf5
         atZD9ghwssTpRBIwI1xv5QHKZdMbMfSf2Jjn/lq72rADXBUV7G3nsEVYe8kEG2r6pyKv
         TRVS3RuI6Pl5CWouNgycCky0e2lJP+EDtgnWGbgNEcSVKFVVt5lBnmN/1s+l5/WqDWgI
         B5iv/1BSsDtLVnJUOuTahAxiETFOThbYYQn/8jsIUb8pAM72fTSeIOFVzFu5l1oZlh/T
         QfJl6+ymRokEBl1AbF6oK+SI8sfraGtThwIf2MEdEELRMVRuHNw2Rkw/R6Pb1XBK4pfX
         Bhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783155527; x=1783760327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=th9Jzp5gWYXL8UheexAgAZq9F8KzRdESqUqY/zvS74c=;
        b=k0LFpi3gZUggAhO5nrc4fvZi1FjRHTJe1qA0sntWKzzbwK24syBswivSBmqterSV3t
         z+JS5VzSxIKfCaignaz4ECFNXHGiriimrU+6esmyHRw5dCAK7I7NjPrjdiBEVE6REcgs
         pJhRdBVV+ZJEc2ou8W9yq6oRxLOaHLZ6o4fyit9XXLFfeydmL5zfJs1FQWoOAA2IZJ0M
         GdLr5FFvXe8/duCswArVLOHFwxsIELmOU/SX/Vlcktj+zw456v3XnCbumSMFnCXTJDBA
         p4b1YeYQuJJjn3mNH1JmrcdO2b9rRp1H6xttmt9ikROnmnWcK3AwKxW1KRBVzOdS4KS/
         EAtA==
X-Forwarded-Encrypted: i=1; AHgh+RpbjcU31EzL63UmSQTI7IygtK7UA/PrFlIL+wks8tJboe+BuvxALurMd3yDJ/x3osRx6FXCd2ZX/Kj4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4nhON/aK0+4Unmk561hW7YvAoIJX+kqRa5UadkJdnIJzVumoH
	FVP1JXu7oyYXOhggwUcvQh31YzjSAEo+NjpIyD8vT6DXJEdfL68omqnb
X-Gm-Gg: AfdE7cn6akrQrrHkkwadlb3VoXsA9OhDyFPYNB2iJv5jgm4GPUFdIgbwE4Y8Se8JoWS
	0mqW6ZYR2Lv4SYGIEGdqusbUyF2XQN8n1l172CsyWe2vHE7OHuhZjowu2Uli0iXnL/qE/8qF6QC
	P1BmyPIsvjsNKqoAE5UGzPFgGTBzikK531rjmZZ957bJIn5uGulmdSvB/NgMc6xrNBe1QFkpbME
	UrAX2aruzC0jqlD1UK8huC+wm+YO+CY/qz346ZbHoXS6oZDf6QIryVM/bkLs9uLTBpK5MSPUdb8
	tbZFTI7ZQRMeaLZuM92A6a8AD3h98ALirjoZAvLucraI92pQEng7Z7RV18FtVmjf1M5TsbcxY+d
	8diyOEliTP2zWb4RP+1qgE08EpiezYAfg8RnQNsrJoc8DDeGLW5VYz18uKxe25RYVeIB9wbVMAa
	E1WQRuIqZ+i4tD2tQ=
X-Received: by 2002:a05:690c:6088:b0:80c:9e87:8108 with SMTP id 00721157ae682-817423a4278mr24400637b3.15.1783155527356;
        Sat, 04 Jul 2026 01:58:47 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144b73221dsm33341637b3.39.2026.07.04.01.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2026 01:58:46 -0700 (PDT)
Message-ID: <2dd8c0a0-7443-4d43-972f-979b7ae4b666@gmail.com>
Date: Sat, 4 Jul 2026 11:58:40 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
 <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>> +&usb_1_dwc3 {
>> +	dr_mode = "peripheral";
>> +	maximum-speed = "high-speed";
> 
> Does super-speed not work (if you also remove the qcom,select... above)?
> 
> Konrad

I can make a file transfer over scp, but the speed is inconsistent and
slower than with high-speed. It must be because this device does not
support USB 3.0 (super-speed).
