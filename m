Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EDB31AF07
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 18:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779386689; cv=none; b=Ea+N03K8F9/DFVH61PrQt1ZsNtSoRaKb1dJlk2v926UiUrAlXNH5llVo91OrG1N79st6nHXiUnrQvNIe6fZmuL4uxb3jCS3etR0/vF1cfmUAxuarCCNF0soN2W/RExgMdDcpcoCn0N5PnXVp9Hba9WitwiRkUET5YMizORZumLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779386689; c=relaxed/simple;
	bh=+LRQsUGBCwVJ+vDWBObuNQvwZ3dtCcXP86Lyw5hOAnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9Ftx6XYrokVuL8oMR2CJ7wGhI6WFChdSCa49RhKZsQpQ7ODk5fVG3H61DDBGls7tjoNO97edxBUQjgF6sg7KjOqrEGK17OukNAvVDXNiaxrfXVl52lmHOxi6S54/sJIZFZ41tmNzlEKQ2JCcXEuzQnMR5/dS+kAzLtw58C2PEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6FN46RZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6FN46RZ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so31525365e9.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 11:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779386685; x=1779991485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0YT7TiQIY/LxcCw1ik30ZVCCkxlu7cirUrNio/yKO3s=;
        b=D6FN46RZ28Z3W+IbbVeRLATQt71/3t419IK0R6DLEUpSzRImEf1kASu4pKCAN27eDj
         gEZy9Fp2g73b3vXObE4uSatRgF4qKCp6pi8BjXz80AM9WYrhOx7aDip8QVrDdV94b7up
         FwKKcN00+/5hYHUWSteOaGawv2JBjAlYv0nLCgXZMVpcuuPX7CXACVhOb7fkynQFhM3O
         bGSHcAJHnvktnYqaOETrPeNDJJ+ON/4XW+ItFxQKuyT58vLDQ6INnQHEEzCUeINpwlFl
         QikRxPBJKdvt5/7qtF760EW5F7D5rK7NwDVQhCkABR8UBx8PYPoPTKBBi6ZP9QzSSytx
         ixSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779386685; x=1779991485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YT7TiQIY/LxcCw1ik30ZVCCkxlu7cirUrNio/yKO3s=;
        b=pkT5WAwQj4IHnkhUpTNtcGindIyu03QY2utEHT4gGEqhfmhio6g1u4W5MQKK9Akz2M
         w64LC6EiNZhjdYdnF9Mc7Ub2cBBlvvuq/UNZvidYtbs5xb5FwsQSUobKXGrP/9Xk2wFu
         zXDNC3L0STuepw1JOjna/gYM+Ge4qPDF9ugcao8HaImEu6OEn22RlAxlJSNijI17LjuL
         urNfwAkCdq8P4BsccgyEOGT3xk7XiXtq2d5j9imoDaU+j07fX92CaO9ZBmaUJ6tPXUTt
         RzkZbVqN284SdEUeEiQ2a1q/IgzjV7YLYevNDBo87qQGQSM5wPFwqktSFYkC0/aRqwZt
         7P3g==
X-Forwarded-Encrypted: i=1; AFNElJ+yYFgZD9wwikrsqIHkB2gaSqfy9KnVS7Ungzq8Am6DmCPjmNDlpQmQq5H3xZhyQV78Pm6Psy1aqhf/@vger.kernel.org
X-Gm-Message-State: AOJu0YyFNpdoXuRT3BG2RsOEOKlYIgp7lPITt152YAbHpG9PnocgXrY9
	Dr1/In7SJc4PetOwCry7mipjGNm9KNZyY6UUMjkASce5AYrrNWosBgc=
X-Gm-Gg: Acq92OGvnAC1IVTX6ONT7KzSJTotUX/AWtxBFEVCgKw8753YYbD47iOvzyHxpcX9qY4
	r3PlNpn3qzCHb+D22ar0Xt9powkB+yFjNmCU6ZyFSRxa6Ytgn50EDpbP48E85eMIutmtC1BPBa5
	Hd5OC2dKznmvdlPc4N7QmiDexhiw2MCemwbnLg5jTvmDkp9GsCfmD/zGLxcJLz1rHB5rbmv7g8I
	EZUz1wlyfH55K38V0vL9EkAwhf9gsICMZUGa9V/fVF78u++ccowvCno+F3zETo31dNp4BLM7XVg
	UuUM6N3+nlvKHOFYRcDD5zuWW/Fgh4GBmRLxeSaaeI4qulq5u9u6DoOfLrvaOJTTSVtA9cDbkxK
	+XqMzcfbGSsjP9W8Ny14r88nPLfsuSZzrqjTRlxhnWw5oJNSbllsHbBxFpukPJ1u3VdzloRYHBr
	fkKt8zBCMfsf//ITUiaWKKYEN/wGGyCwf1GUeGz/JWWRe564wOqzfBuG5ED+JJAEh7q9gL4jtri
	qGl0pRdgoS4GjHqk28gAGkJeachpR//A11NBrsLrBhz3dmV7nrN2huPnWq/abeYd2ZJ9g==
X-Received: by 2002:a05:600c:1c06:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-4903604823emr65479145e9.10.1779386684493;
        Thu, 21 May 2026 11:04:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:52d:7400:bbd7:ca83:de4a:f625? (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903c9445d0sm45599865e9.0.2026.05.21.11.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 11:04:44 -0700 (PDT)
Message-ID: <8347b792-1c18-458e-9c2f-e34de156d78c@gmail.com>
Date: Thu, 21 May 2026 20:04:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] arm64: dts: qcom: sc8280xp-arcata: add USB-C
 orientation GPIOs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-4-9df52552bf87@gmail.com>
 <418efc2a-d7de-4c1d-98e1-634f08bc3a85@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
In-Reply-To: <418efc2a-d7de-4c1d-98e1-634f08bc3a85@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/21/26 10:52, Konrad Dybcio wrote:
> On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
>> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>>
>> Define the USB-C orientation GPIOs so that the USB-C ports orientation
>> is known without having to resort to the alt mode notifications.
>>
>> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
>> ---
> 
> The commit message is slightly misleading - there is no orientation
> data otherwise

I will update it in v2.

Jérôme
