Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C46E3932E4
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783351964; cv=none; b=OAsQYV3DFfBkKFIMG5y5D1rvDz1TfXnA0H3XRvqnac27NMnumMUWG0ur+N6Hm818k0aDLnzLleXSL07LfSaIicS7xIY7KeyhzQGIItFA3YF0itW+8a7Noe74vYVh9Bo91JEZaUl4kUBXD4J3MxdzocKCeQSba8fLdNJ3hwXdqJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783351964; c=relaxed/simple;
	bh=yyiBxvlwdLSbGrrKN0/tOUgUVyg713ORw1xtoORvqbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dYD/QFwYwBRoltTOwcSs+sCcjhTSeC9RBIjTRV6GFr0ZBmCm0UzjlGhgi0ZTlUQ2lrD4kBEJ6ca1OyScWxBoVIL0y1n9i39X7Wc/MLtl2rPczVlCU86EH8s6zyv/IR1tNyCsRNfAYvTtTIMg3mI71deMWlgWntfGeh2IJAt2LKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INEcnOlV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dp+IU9qc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INEcnOlV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dp+IU9qc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF9mD990264
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yyiBxvlwdLSbGrrKN0/tOUgUVyg713ORw1xtoORvqbQ=; b=INEcnOlVF3jXbCaa
	O2J/03KnaQ8Sv3yDn9EyDudqogZRB+L4VS8I9REjx5edDyxi9gCIjT2dfNJMkSy4
	NuRg3MuKjbTDKV2GCzts/KMEz9xjRipIVzPeN2/kJojWykHTrGhiDgom5Qkfieg0
	L8e/Viu3qdZ8rwC3rMEBvR7jfixkCgxTXLwdFVZO+VtqqCDTHCqlVhHMc/uhhYmz
	KBPhNDx96nPdqkSNR3Zu+7Q4LkBoxF4nYmIcCoyzDU/RW6e+iYXfgCUceIARBBu9
	60R3yhtxQQ++El+5biDoulHJgLT/jxaUV6LjklJXWG9GbS8ujGei9IfZTwzkYOez
	h6dsTQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gsgcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:32:42 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-48e5de5a23cso2422009b6e.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783351962; x=1783956762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yyiBxvlwdLSbGrrKN0/tOUgUVyg713ORw1xtoORvqbQ=;
        b=Dp+IU9qcoWj3NLytzZQ3F/3+J84hmS2PlqXzpzJjC68BA7vfZyLAl+n+5Blc5K+AHY
         Yqdl/nelzBzaalmH4ERDbGbcP1ZPYxONjpPhyz4kTb+7rLVTWYVMxnqYotlDcBMvjEg9
         IEmKHqTWv48nekW+6xd3fwPoRG0nU6QcS8F4/obOqnUJ4D0BlMbgahiyF9jLk+kH3VMr
         eZdC8VAEgxoVVNHEm6Y/R53dtP/tPT/7gUpqVreGyXTcOcgCIHcjrmCLJEwOkxYw0TNz
         OicwZxn3RF4otu0hi9vPbt9iTZlXjFtfCoo8dJ3znFTkgrmVI8jTAm3uQcaai07D+Zj7
         /m3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783351962; x=1783956762;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyiBxvlwdLSbGrrKN0/tOUgUVyg713ORw1xtoORvqbQ=;
        b=rBewBPOneB35eBQjLx3wzBXvc07a9vGUlNjzABl1H61c48TguqIjrxCc0s7+NipSOi
         iDrtGX/w3/Vcqf+xtmr6LwfyIN/7zSpU8woXQSl+in1LpdEgv3OKQ12TgEwqEaiIw0B1
         D6o0S6Z0z845V5a5LPz4f7wNfikJ5E3gVo3Bg7zBoiGvJ06jz+ffvRvb+THa9o+mQevV
         ikf7d8Mvyj79clNoVnaCbQVKAi6+p15PqmkEOyiqwgiS9vn5m1DAdBzIw+C6HmT8O+s9
         aLuAmvdp+LQphfuB14xcN09O9/kmp5lxNN/o8ugAHv50xC/LKoRZ+7u1XL8D2KLXBHFX
         mvOA==
X-Forwarded-Encrypted: i=1; AFNElJ8XY6Sy7RkQz0zRbSWJYhKPX8KB48qMbPW24GdQtYgjlvN39XYphqhO4ZQan4MRLn5OoHAP4vzb5vfd@vger.kernel.org
X-Gm-Message-State: AOJu0YxkkIZ+JRvQH0YncIR7sARHjUy14pQ/YsQ+RnLM2ZUOsUt+9nxA
	R2kzku/Ncv++Ehu0fg/9xXDiJr1AaHUuZa4/quYneObQrx6irGA5NAn4kJv4A630cs3bvAUJMZy
	lYJeEZvQzTXbT4bCHL+fnakDHdFt+RP8MAmUQubIHNQ9lklCZid10FCPNy7ey8P6n
X-Gm-Gg: AfdE7cnE6Pt/IgWaFeCLkOS6nUQ+vmC7KaQ5XSG5F7TC+QKMo8KXxs9pD+s6IGqtgZW
	1xCx7BnOEIsEKtfR2uhPWhlkH4OmjhgXRAwdFL402/JzZgNsgZCV1Xe58rfKShUuC15kfnfafXO
	/PHl+LPp2k2EynFeSdxMyTjPtIaTYCdS0QjbEDm3wHChSgwf6YYclXiDdnFyyZHquUW/tK/yyFs
	Nwj8jtj4/3wAzLhdFhamjhHXYLPVKp38poUXhdBgFGYr28Dp/9rzsdHZd/HMPZxUO8bi+DwYI5X
	LycaaOZvEEleb5P7HUQvbyJqfEQvs93Qc+Hb9MreVGCACHhHbvqm32z0t6ZNxYYvh/A+NvolRdr
	Qku70H4GdREuikDf8E35gLc/ESY4oPU9DoNEGBe4X
X-Received: by 2002:a05:6820:2008:b0:68d:dfd2:8da9 with SMTP id 006d021491bc7-6a3553a1edemr552098eaf.1.1783351961662;
        Mon, 06 Jul 2026 08:32:41 -0700 (PDT)
X-Received: by 2002:a05:6820:2008:b0:68d:dfd2:8da9 with SMTP id 006d021491bc7-6a3553a1edemr552085eaf.1.1783351961208;
        Mon, 06 Jul 2026 08:32:41 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493df7010aasm10635e9.0.2026.07.06.08.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:32:40 -0700 (PDT)
Message-ID: <674128dd-632e-4473-9763-706d5c0432f3@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:32:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dtc: dt-check-style: Allow space-aligning
 indentation in DTS
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260706102421.343639-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706102421.343639-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260706103110.31D891F00A3D@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706103110.31D891F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wGedZnTV0fr1KupUr4EFOcb-2LTaDz-H
X-Proofpoint-ORIG-GUID: wGedZnTV0fr1KupUr4EFOcb-2LTaDz-H
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bca9a cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=dMVfIYNq6ILUI3pARTsA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1NyBTYWx0ZWRfX4BiYcK1ffixd
 CfJ140YpHhcH0KR6lhKSJ9hQEovWBzuS53NfTm/GUYy8qmS47XGI1NlLEFvKzDIYR9Wb+Fk3mA3
 XKJgxtg7FNJTM51Kh1i5RgJXgzpab/yDacUAggaRDSKOiRd6UMSEjKZ3nsx/shWOSKx/SrXFRlV
 hzwX7LZ+3TRDJ4vVNVNzKntSuvWzfZ+jCuTdw21m1eE2oVMQgwXPD6pHIpfAkclPls0H0UkASaB
 vp9cNgNeFSaAjRak9AhEM8+0kc5K8/7T4V0v94OTSLA1vipurz+FN6rgam4eyCJme+MaYUm2vto
 uiRFbFF3vW+u6iF1nonfjdoAXlvcb6QKAxmvAPMmQM+lExuqCIsgh855p1txATxSQAfYH9Jc04v
 zPHLSut0emmDQiu/oq4zFPCQ9/K2FAkWZ6J/tF6jWB6Zmi6qzcHFfACHptx4rWnKwMRBi9648LJ
 d/NyAEqy5RHbUVCsj5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1NyBTYWx0ZWRfX99xB/AOAj1JP
 tVlV+HJWgv6we46fvf25nKiLkyOHFGJmvU0BwOb7jFoPugpP9xuD+goHrSYjWiVQBsvkzoOPhwr
 wdrQFeN4bTVVumDYlS8hi4sPzobMzo0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060157

On 06/07/2026 12:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The use of `re.match()` instead of `re.search()` or the `in` operator causes the script to only detect a space followed by a tab if it occurs at the very beginning of the indentation string.
> --

Ack. I have also few more fixes, so v3.

Best regards,
Krzysztof
