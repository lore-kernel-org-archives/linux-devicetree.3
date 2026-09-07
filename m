Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ABA4A8A39
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785856; cv=none; b=c8tmBbND5uqS8DssMjlkJRumrMlcsNQibLXMNo3Mh1fQVU0DuzrAz8Mgd4eqwFAIghP8ob2rsXoaxLPPZ8I091M0sei45usw76msJyG0AVr7DtX548rF8wsyI0ZoUEgPLqxpH6i45N11dIWMe5Y63WOxy6RAv3Iz3EzAReS84wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785856; c=relaxed/simple;
	bh=ikOeO/tWibSC6iQA7mD6jXYuV0kQJtjOsGaYG7zTij8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2rZNkUOIDNRbGygNTJBqGtc02SyZw8jnCC+iJgpXOXcAQFRGmHlPb//7W4++DUu6RNzbmuEhBKWEp1AuAVVlMoGvGP1ZS6yfJUMPzvfzxss3tTAWMTDS6clVx3J6+EN6M0ZXydMzvUoFESuhRpNyCsCuVyBPg7Qw+NH61TiLLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cswsJG+z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IT9AY/ne; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cswsJG+z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IT9AY/ne"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmvDU3349040
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 12:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kg29QPdhTI8NHpjy2epN8WVYhTronX+r6+kH71sWj04=; b=cswsJG+ztxu80V1X
	AufJmu+uZQIDXqjTm0wYgchxoEqga3lk9IT22i1b8lYDGAzM0r7rsfRJ66SKl/dk
	NQIfAYmYNrPu1ugDQKjQS1ADhQuKUabGuvWGi2pRvgaajKoJPppm/FwEVFHyxaX/
	286AK4L8I/7aCppG5iGK5IVBzALfaBtlZ4iSPc1l21Gu8kiPSU8F3xQ+x01fyejb
	VLrZa3oAJJuTWAike9EhoUiucg0MNMvlN8ptcAP3+Aiy+az2G1iceV6t46vXsi91
	l/VJA1tL/FtbY6a33IYcfSbq8SsVMuDrLvpKD2gy2l2L0aoYZvRtJNkD7eVtBjlg
	7rVVag==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0uf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 12:57:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91045c83dbaso8955936d6.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788785846; x=1789390646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kg29QPdhTI8NHpjy2epN8WVYhTronX+r6+kH71sWj04=;
        b=IT9AY/neVxIE8NuQ8cr0E1rKAZGZYk4sil+ggYe0cYz2U7siIwj9a4IU+XPSUA5oF2
         1u0N1u3s5V9HSh5w7VVVJtBHUnq+jPa2OvutbFDvv0uR2JODtBGpeeuVkK/p2CCShcgT
         EIqFGiiIyBvDMW/TtFNn0ejy6u9YunmlcUAL8WRnBTqhO+UbEUOuIP+145eYFhsxPN8z
         AVkxizbho8FgCjbXR3c73fLXsqO+kFUH6HkUUPiGQeMjTumzFaxesOqohzIqNDXqfYP8
         m/Obupl63oc+gMjABOc831V/KaHmRNQpzoGQVCagFJkyzX8cmUnZ2C9HdP4neE/fxk4H
         OYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785846; x=1789390646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kg29QPdhTI8NHpjy2epN8WVYhTronX+r6+kH71sWj04=;
        b=amxD4PR3QsNkM5Kz4n482xe8l5lVav6GyB99Hwle+GyYrrQguZhVmfN/oifWKhvyrk
         pP+4zaf3JYcievDCtcTzbCZdeSSL848eb+yPannMa8hAIXyg8tICNVghrq98d8866NmS
         zwtO8HOD+ltm4BYDCmlUYqNDEkfvuHnhK7Jah6JepFGuu9CPdlNtGCgj8sH66vmMEo6S
         JU78RrzCI9/7Sd024sTpDNbx23EzEvXyvkWThDD4E/pjIagqhq92S+Hgm02w7Jy4HqW0
         tr0Zg4jtxSK70YNxHs3SvYgDNTGc7hFtaerpJGA5jYluZRsxPKwlioyx1aWjY5vXX0si
         M0JQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmBfj9nVJ+xRi7zszB8Rt8vcFSpSdZKr/ijWnXyQnA68uFPPFfYMQz4ztExeSw5ErGnKVud/sI6kNT@vger.kernel.org
X-Gm-Message-State: AFuF++lN6LAZ2Wyrmd5HsEHgaQ7bbBMdkZGxRzF4QAIBYBipEI1DX4LC
	4fvt3WwqdqiVfcGz7u7+NKjQBzWdFm/SAlcc5w/miBfq82QxeAu2nCTpL0uVmtzi2+7aOHDV4nx
	f2iOXDoqe6NSsqkFaJbsumfxvDHC7x7M2JpCZ9JnIioO8iRdVp0farmCXVv9GY50a
X-Gm-Gg: AYBFou2Z/EuaoSeBFawxDTxiYQ5stuCwYpO8so0KVkXm8aVyL6tn1sz+SZzZHzv9INY
	n3lJSrH04g+N1lTN4gJucb+IY87h4K4YtSA3ZiQokTpMf5FuVg92o2urLnRo77XC33WQst3THHm
	nscAlezT8FuqcOqgBYKpxUJzgHoKfzknnb1NJhztj1IJsenZUM8WR4sqhFT9VHAflh8Qs1Z2HQM
	ndOt8erPqcXkBdKg8rykFBmf2bG8fXIiMzOWkzKrQWaeaHORBUjod3zr0qFeIjqOx6l+1ulRLBp
	HilRAecYu7ZlpuCJ1KKYryyJK+kPBl/Nvl7G3MA4RKZQ5Bq0qfioqUZPfryBZt+rC3hkr8qe85u
	15Vn4XO7xIkB/D8xVxKyGDQ==
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr808267785a.6.1788785845737;
        Mon, 07 Sep 2026 05:57:25 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr808263685a.6.1788785845319;
        Mon, 07 Sep 2026 05:57:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm361995266b.9.2026.09.07.05.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:57:24 -0700 (PDT)
Message-ID: <615579df-d37a-4917-b2f4-2ddf0d595f9e@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:57:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: ipq8074: move DR mode to board
 DTS
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-8-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-8-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9eb4b6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=3QQp2-qM9dL-h2NKckwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 1HF0TINAa3-F7QDTFDmYzM4B0wq_FHgb
X-Proofpoint-ORIG-GUID: 1HF0TINAa3-F7QDTFDmYzM4B0wq_FHgb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX1hsPlWh3/r5r
 n9zCttE0lztYaoafJ4vD0w78YGNi8bKcZ8HNPGRfN5N18cF3MkO6mWWtXP69yQ+EIPZJ4lVP2dV
 15JoRS/f1J80hXVHhph4sHDuxG8N250=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX8yvfZGZ72cTq
 ABsQoBzjrVktXGszFFeMgNPFQ021Kw9Da+8rAxizmSJASihiLxLLs7aijg0EoWUukcTM8F0GHKA
 ooAiYBdp6msQA2v9ioNUauDE4Ypl94HQH11fQZ89SZs86/2uOtXg5kY6WGfHaLuNbJ3Rl7DSCQS
 Yn3pGFCgBotULS2BUyF8WXx0gQ66+hzwbljs30Mo2QqmPp8AdvI6Jdt0LbIXiQTUiJoGcA5o51P
 /+tg8BzFqfL0hTlS7nBieHBxdQxyQgn5IZnrmqySkaFay+tehM4pGnPuuPT9yhvbl+kbK63AeY5
 SUas+sGljoWCnLH72JtvnasxckZyT4QNl3yNolYdZ1GB6yqjPokXE+SMF1sHIUGPXQY3zN9tl1P
 kiq9G1Pdtzbf22QukUxeL91i0XJCuVka3AjdIsbOjvAv/ziwv/eWtXFSo66q4Qzr2zjGGfa4AEs
 /DkvmwGjT5rpeik2lAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Both controllers are DRD capable, but DR mode currently set to host mode
> in the SoC dtsi. Unset it in the SoC dtsi and set it as host mode in the
> hk01 board DTS file.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
