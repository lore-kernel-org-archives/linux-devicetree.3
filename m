Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2763DA5B6
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177705; cv=none; b=JaMF/EoLhtVHThSURpC3J1NSbEeVgZNCoyjPodvmKVgvc2Ws3aOPmtbiUaAarMAO4GR8s2VIxu+mAEiwEZzW+bmSZllcKLbRyRwXPB65/qoelKzMSS7LDjBBdiq6vfDnaWA18Jcf0nY9a8XVXivSM/I5lY2mz+KGqSn/c+pWqfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177705; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzbvCerPkYosbeSq2rZaOISksxywO5LtbLso/CyE47LgyrdE5w39xmz4iTckGARF64WEKy5GOv/ey/rAp28T47WDFQWa18lZP9PuVGU3FmWB1Pov4ITJj4so0w/vravgV+loiOd1Spo2DL41v+UkXzEF3tW6XaLfVdIiT421/wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOwpVAWa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y0o+dgAV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOwpVAWa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0o+dgAV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xHat267953
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=LOwpVAWaT5qDtsmj
	ouRTr5mhP01dad4X2ha0UfOIp1Q62Sjap8x+GUxtsvEyKQTyCaaNGIHOGx8Di2z5
	Hpqm1lxrTz8gMJkZIE/dBMDLvTOrNBzN7TL6qIL6XLF3th4qD9lElDpQ6evM7Bts
	SgoW+zIG3vAhDGWskME1lVW8QL/smJbZSKCmi+lbvitt/cbnbj4m3CknsTB9KZsL
	VyBvmOkRI0QU3ztr17qxgkDevpdDrr5p80zfxgl63YZeUjuD13IyZ/8BFqSYI3hP
	txbxHa0O1kChAPodqot0nS0Y5M5wyNlpmllVW4ZzESXYgz5ky++ln5BKN41n8cF9
	QiMOnQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u35x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:35:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517647fbff1so25952891cf.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177702; x=1781782502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=Y0o+dgAVLK72T6aBgrDidSv0XzyXeNLX4hNpXdAces0mV8eftHXpKmeq3mpuG7RiJF
         VBMmUxXPkygyg5If0yN6VzarEctHbC6isAkGzpBJgVDaU+OJkSBf9EPc5HRDgF70cITE
         6q6PbCOFNBO0DzR+0EWn17wysm4/3rAs1/VZ3K0Gb7JWX6cgILNNJfinCrnFELezK0sF
         0TOqczQzExQBpR5rolwWMIKt3DvnaG2P5WUTylWDNwEm8/qoIymEx21uDlwi5HLKUjA2
         MtUPIjm0MAQbuWurrozqPAEa2eXWoEp535+Gp7wbsdevUTwnEAq/5JvyH/aFUzHoo/RG
         MVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177702; x=1781782502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=n3m+1mynYMUdNuSzpK5sED9LzJsTf0NqS/cmII4rw+zBu1EnEAEjyP5i3wGLugXmcD
         fTDh3qfAJajPid/ow7xJ7nl6Xx92x7S0GnXz3RrBsFV5J3w6F4U187SxzaiO28sMp1fl
         wKHFMlqTbuLBqvLWt7R9rBVrvFHD0+wOC8R538zW0Z+j2OJlj2VNjsCSysGuhW/tLovK
         ZhjKc11STc9ZKZraEIMUQ0cauuIJN+Pkgz0Ne8BPn4A2yuj9Ph8fYHanXS0dm+waPflu
         lgICoIyXlS1ofKcJ3zRSrfz3P0oIO6cbr+3ehBN+LKYuImsJZo9ry5uABLrPasuqfbQu
         8Zwg==
X-Forwarded-Encrypted: i=1; AFNElJ/QQtiDrfykWWXBfu+uL++LTkVQk2+XI1xVJwvxJLzLnFcFwI6Dv3a3q/fhXqfIMGIx7gYx7UpqLQ3s@vger.kernel.org
X-Gm-Message-State: AOJu0YxGM5XEUI3do6KaOyTMAxnfM1mstACMKfdvpvMxK92qpNnkFwaY
	gie5vZU+Qk7r5LAXidEyZFWTnrcOpNO9707heF7oUqhAdq0COP/sNky7ytyKTq770JAoC93VzOt
	I7ht8Kj2kNWvZ7ZsyoOW1VaN2XddKGZHSki9EKu3MvVE4oR4U8NnbXrEzPelTi/FNKqo8R7qJ
X-Gm-Gg: Acq92OFYdaxrRIuGAaVTtzUko1feWV0VH/DifSR8U4hg21AwwGXHg/H1dwcEw/R7bzk
	WCXCkGXvkbhsW8WB6L0lI4QXiGkQE+zPLQ0FMyjQ4amoNzhX62NIpztnkoPGwNKMj2N4rMPevPH
	Ep4rcROCf3IP5P8OHveSVkkd7SXUCSJMGW0PQcWS+0l60eBFIZpDCdMi0KReeO7YmiVL8vbhfjC
	4Aj5LWxtvz6OG9+V6GHmD42DWtWQl9k6cFmH4qVruJJR2GXdbfSr7X3mNS1NLo5KV2E0TjgEoxy
	cgsppnK6hXqaKIytS+2yC3Tz0YQVx6cfmW0vAT2YyDI0gyLAsMO55Zp2T+bL2VyhFKGeX/8fdJm
	f5aZUzGpLHK/ZfRaE8W2OdPtw2iv/69eox9QLCZA2/EfkzOgEKxk0b7LP
X-Received: by 2002:a05:620a:2729:b0:915:769d:56e with SMTP id af79cd13be357-9160ab58852mr212224685a.1.1781177702482;
        Thu, 11 Jun 2026 04:35:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2729:b0:915:769d:56e with SMTP id af79cd13be357-9160ab58852mr212220785a.1.1781177702002;
        Thu, 11 Jun 2026 04:35:02 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb160916esm53023766b.22.2026.06.11.04.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:35:01 -0700 (PDT)
Message-ID: <48f6e27b-f1f0-4eed-b599-c7fa56b10022@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:34:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/18] arm64: dts: qcom: sdm845: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-19-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-19-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0nbYqL9UOAnLtBUCoIc2c8gwY_7gYjuZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX1mxjidgWENaw
 zUkJkcOgSGM5XD2smsJnTjaJsx9luX9kQx2XFW2kRITmp2l5kXeKV0t4cwGF93F5SU2RwDRjYoQ
 9J8x7nxXcdBXO1JX9t2h15ylqYcTbMw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfXxeEMS8pN3Rm6
 acDk5bsI1RQ1uwZmbcg63pnOwniRIRVMrLJT8qMWaQaoINn68+VkmDpePqu/8frDXguinVSSlJr
 wdTRDwN0wAdpeF/6p3xGVQ72EN6K+Md22AJ6CEu1GoZp/jk5Wv6TM1NxO0Yp9z9bEZ39a0kKvNV
 LK2GxZNWVsV9pqNWriyo1PKwBuy7hb5sghy5RrwfndHQCX4HC0bWNhSWf73WFETRfmUaaVsroqc
 b5qiPXbNdZfryhWRcXSBJBdjcEalLtPrRRcbRlcSP7aGRTATaBWIIsZo9p08bBm5NNdbp54EiVr
 nH50JANRTOoL2ssS1Ei0hBNMlwLLAIrYbUZ2sR3C1nGC6W0ebEdj7ZluQ0FIAsI+nlAcj3VhioG
 fokr5J0QrmzefNdgnpBZqrFwh0nQhXdhngsQMNEtPs9OUxkyWCQH/PaI4434qvHpfIWQmxwrIX7
 /JvRPaWNbirINryUxVA==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a9d67 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 0nbYqL9UOAnLtBUCoIc2c8gwY_7gYjuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110116

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
