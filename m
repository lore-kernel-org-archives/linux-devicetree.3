Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9244FDA59
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900119; cv=none; b=o9Y0+fA+KFxHB+bRvbiTVeDKtj9ARpzn1+KA2W3JF0BPgyeGW4gkBMhx325X+/H+obPhFGkBAWL4epHYndyL4EnWNjbUuJv7iytJfxuUwUT3g+jGeGYlPcR9x+CZeCmDSPi96HJmbJ2LaZnSeYpsTz3OzWPUmdhj28ToDBhJitk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900119; c=relaxed/simple;
	bh=ssqHTpXGgabYsxdvcp1m8bbcmPreD+147iRzWVW6JUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qmlTTXn2Njx+Anejj858oTYH3MJgZnKRxl3zBQMstmdDAvYJkOPM57GH1fF7o3mOhg/w3qqdL3MjZsxDOZy6brnLtqkzQLeyiN0yCIKJrx8WCjRF64Nl0/RBzMITrD/OZvZPg2lag5APxddefysrv/E7ieqOkUaJIupgSesRK0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wpjj8CGK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+qPpj3s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wpjj8CGK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+qPpj3s"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DBRLrl949345
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLsYpGybDcFYL54DVjqRniJMNcGDsEoOwITI4R6fhMQ=; b=Wpjj8CGKvd6syAsW
	wtKuWOEMzXdAwfjyWwU63oFbmTGJfc9gDeAOVjepqzpkkwH2dYSgTtltVa7IPRAA
	75SD+S49d5Ta2NT8UQbJavnB1yms8R04z7KGX9/T2o8WZZYRTbsiDOiYK5+X+fbq
	ADm3eslKt96bcRGzrl58ToWkng3HWPaKp5Kxq102O5hvnQJ96HuQ2ghQThOjYg6/
	D2GT8VtVNImIR797Bb40m6XIzGj3ztNJbUjovqtOLzJMGC16JTJK812OFSw4ofAn
	khHOX9hNckkAnRUnuoA1OKmbr2Jm5WZjW0+wrGX+m7dXsNNhbMOnrxOY5Kx52GUt
	ZFBK/Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f629xym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 14:01:53 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5da613f7588so3450089e0c.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791900113; x=1792504913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLsYpGybDcFYL54DVjqRniJMNcGDsEoOwITI4R6fhMQ=;
        b=O+qPpj3sc3Qsu1ijR5JNfBPshJhgFrbuRtC6V03Hkgxz6wc5tVE1DcXD8KVy0EcHGs
         vX/3FfSTf8DTfpuKMubQwLkVUbJCeKH334VL+CaSarIHRJabGaefXlsTbqkt49yZKnj9
         YxX4BpEBSE76fRwX5TZA5rXiX7E+4y8ZGXaNRUWNujGKwvTKjRcRoShA5W8yrFYN8yfG
         Rk9VkS28qFAnguDFA8EARI+NmxX6ScNyxW2fyUhNOiKt1f/jk1KxCzBiJLtWszJF5eV7
         rQj7k3hdm8q1jXiaNPPLNYJOnUcTiilP4+38ch1ZIm+6gFDH/inbzk59p78KAUvXf+eZ
         0FHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900113; x=1792504913;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLsYpGybDcFYL54DVjqRniJMNcGDsEoOwITI4R6fhMQ=;
        b=vDeqsUCBi73S5OXpTR8eEua1Dw4dnwmy+jKCgULdL2d33QipjZ6S5R47i7qB427ysK
         8L2DkEkRIoT8U4dWpH1dxNNmrWBEWK7ivamihLTwAsvkK2uzVAGkY6Hkf4G8rvgv+/dG
         DIHUw0pcS+9c5s6RJMFDror7aiiHlAYEAmE4Vz+dfq4IXk6F23j4/dtVTYhkn3PciovX
         Zqma6F+FnW5upv6dLC1ZHWVKqeSNdJZQHbkvmlNsnsfZQVEqW3ShnivsBgghiA8DOGDB
         F/egtbjbReLpni+EQSZ+32Q7IxQN7fP57E0WJGfYRh4qbfRbS2xtXakq7eaqBXua7REW
         P37w==
X-Forwarded-Encrypted: i=1; AKwUvBwFBPvUrtPphm2HXfFeqYB7Hx/qOW/6HoQgalj2qHs5ScjJajZwnGiUnRhD8KRKIwe1vIJ0BTvRKxIX@vger.kernel.org
X-Gm-Message-State: AFq9FYIx5IZWKlpzR/CC1FcddcndsREB2hUpJnu/qWyD8AKQmx+p/S0R
	UFMzFm91cyiSYOBVQEhigr9NZnkByRDG/9w6qxzuvtwJxyXIg6SAGdnuq/cXUXI+ymvrZozDFac
	pDYHvCpffcOdN8hz6JIRNUBaTH4WPOVVOsh2Bt2O+Gzx99iucEjpP8AtY0VjGERA/
X-Gm-Gg: AYBFou0YPR2r7Isq7L+rNjhMbL9kNAQTV3dIX19MH9devoXS0QuP3TmzHinJnUnERTN
	8oLDpMsfjMJ5PQYslz2nkrIVNyJMf38ALLurvYyfspdOQE2+/eJpOZbLJq4BpXZyDm10q5AJ9pH
	db1sATqCuyfbI2Q+bPJEZEbS6SsFCMlkzK9He348ktGdUf88gVx0RCmjdALXKWDx86SUFyLiDvD
	AUYIIqMAqv6XCcokwZEQ+xJgV8HdUKVomig0Fa1Uhy+yFtyHEMnYFYdeZZ/tDlMEO01hircd8Gl
	5MmbB7NvSNsVrnCauMF9Y2UA1BwXe8Rrw9JJ0ngD5rFoMUrfetolO19sJZ4BsNn7tz4iWkgNFPe
	zG51gGjB0laTe0prNkCGrPVcoKLRB
X-Received: by 2002:a05:6122:d1b:b0:5e7:8bd1:731f with SMTP id 71dfb90a1353d-5e91f4815a8mr4193255e0c.10.1791900112785;
        Tue, 13 Oct 2026 07:01:52 -0700 (PDT)
X-Received: by 2002:a05:6122:d1b:b0:5e7:8bd1:731f with SMTP id 71dfb90a1353d-5e91f4815a8mr4193151e0c.10.1791900111802;
        Tue, 13 Oct 2026 07:01:51 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a195002123sm377260985e9.1.2026.10.13.07.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:01:50 -0700 (PDT)
Message-ID: <8796cfa1-5ae0-41fd-b3f2-c6b588157b12@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:01:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace39d1 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=xpaw9_Cwbs5_s0yaehoA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NSBTYWx0ZWRfX3Vjoopgc9K0G
 4GDfDQGutm9bKnrixIplS4Dc2N/kARhcOUmUQ6zQABosAJMviPck7hVqZG1kMW0nwzw+XQyd2AP
 ZU81IgioqsNgUhNgBbwmaSn9JcTiPzU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NSBTYWx0ZWRfX+q5l794gfy5l
 ++Pn+gkpWvNtklZ0ddGn+PKTiaKCcJtNizruVCDlTC3n7XMZ7fi/EATFx3j9jlEblIsD+vrb+rp
 6cnsVEuhPro8d8w/0jyfb2bskSintpC/v4o0F+xaYXKpM7w9jV36mz4dhw+YF+jBmnefRxZhFcL
 4I4jpWn3FaxaaJ67S80vRX539tQXqy/S5Vh0OvcaF9YLLPES7jcfdOGCBIolKkpejBJG1IWH8Tl
 InXGYWhlaUitiy9CJTFIvR+D9vNxLb0ENFRRfOyNA1D8lkLMNu1C9h1svDJVpUf/tBVQQlEmD9L
 TZKDuKlX02CJiRr4UwTUnT3VCaD3p/ItUjF0d7WGab9EgqgnWAHB4ql6uSNM8w90f+EYugr7bxc
 Z3PTv+Vu3XRj4UpK/AKqd1TASiWwYnmNgqJjRohAS+4Dc1hhPuSZi2396bean+MfB+3OC7/7/I+
 D38364A6v6pwad5x8yw==
X-Proofpoint-GUID: ZTi_wyZCyENMdDqRLMYaH2yTz85RWYUk
X-Proofpoint-ORIG-GUID: ZTi_wyZCyENMdDqRLMYaH2yTz85RWYUk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130055

On 13/10/2026 15:33, Daniel Lezcano wrote:
> Hi Tudor,
> 
> I noticed I picked up your series without notifying you
> 
> However, I did not pay attention but picked also the dts files.
> 
> Shall I drop them ? (AFAICS there is one comment) and let you handle 
> them separately ?

Were they reviewed? I think no, so that's another reason not to take
DTS. Anyway, it must not go via driver subsystem, so please drop.

Best regards,
Krzysztof
