Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629A552D2C1
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690107; cv=none; b=GfY7ka9xor5ldVXOC+VQ9ya47jTgpblGVZwoEJHQR1AqlcykIe+NqEuJbpeQErn4dj7WdqGu327W/RaD837kOYG6BOmY/jA3LKn15XIxOwNpV9IkhIvTxY4fr76Qs3Zgx7naS3xpG9qmwQ20vsyjwQZfexxeQKYOC3kWTmENsHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690107; c=relaxed/simple;
	bh=E6VXpq+qZYhv8tNTG9AR+0gEd0oGtsHCFPhCgKyyYsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aj3SNu/plJ1UfccNiESUDNtL4lkBHd5xwZIupRnM5SOpCEH3Q5wzwmB8REWe9dyBTfPNnvrRV4lnCagMbnSoZwhzcO9NKw6BU+vVAzrObUBqDuF6DdO0Nal8lPXaV5dtZ1LG2ZJOtVtkJy7h9rtPHmrzAqzXqxNoq1v1zCsiCkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2X3ibjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XP0wovkA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2X3ibjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XP0wovkA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCw20h3300964
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBpZuxpAB/NHE21T+jwIIT0IiDN/7w0EffTqxQ3ZtAQ=; b=F2X3ibjpwHeKsvqR
	QnZpDC274JVHIHnuDE77d/hub77UkWSpJBxKivaemAs0oRjH4AHwkmZR5J2Yrx1N
	Q02efD1KBucNc7QMwPftugSkQ+MjpWIA4lL7/TZtk94QBKHSUC4BTaXaDKYpkfj8
	kly/ktqpcAehUdEoRU3AUlQVOOtoP9IskBv9KqbOYkwl5kkH6XNJ1LWvi+JfqPby
	4ANR7PqoC/wH2q1ZsvZyzO7YVuT/TEm1ghgwKTBwE3xJSknTICd6Cy8W5H9i8onU
	TQLO6jyLOY3/1MeYCjoJd11TF7lTr6A58UuvUOwkq1Iui5IXb8JvvBy9iIBZgh1q
	iIb4Hw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx0943-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:55:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349ba88188so98594085a.2
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790690103; x=1791294903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBpZuxpAB/NHE21T+jwIIT0IiDN/7w0EffTqxQ3ZtAQ=;
        b=XP0wovkAHwywF4w+5A6bn8nD88vzEYlHfaqAdxHxA2soCSXwggLRy3xWRQeT/+gLRm
         dcgKmQqtkqGb5f1n4wFvbtZq/DNTpubMJDVGCxbfmA0eTQbNNzve4oI/EDtYoS9lqYe5
         J12BMb19+2/Y8mMibM2ebE6xG+14IrGRkLhhpnCwNvARihoRzzaLaHvqpqNJHwlvHKLU
         u2upSKzRFMJBdRliTGqi9eBarTYpHWqynvBm81rJ11fci8FUVZ5MAwvpDFNItMmT38DT
         Mu0a+2TlON6RKnQGaSN8LHgXOM7KkLxjmnr6oyj+kazvTURX7QogzY/KlZpwfuIbYxvQ
         vZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690103; x=1791294903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBpZuxpAB/NHE21T+jwIIT0IiDN/7w0EffTqxQ3ZtAQ=;
        b=Sh/4J2xi+qC4V8COVayR4SAuq+kE0MxTJBJOfKHexak1c2RULrFSOL6YF2Oh1dDS4Z
         9Ui4vCj8Zt0eP2kAOJcXFFT7HpfJ1imR6eLrFMXFk6BFrDNr+2vSwXUtUw4MVyF9D8Ta
         Wl/HBcc8r7M/2GfGOGH0T6GIOj1d/0srchUsQt2iERjfoBcFLMsLystMj/gXmUuay+0P
         LFvuAlurOzWcRqE61EEjZJCsLr0BzCTKYDKHT8+w5O59NfCf4R5jldjlDmmi+GX0Dmh6
         fQ0Hv5F01/jAv0D2L+qealo8oaIh16PDrg0OVATGiTyEIXhH+YWy3j14sAkaDDi3RPH2
         k17g==
X-Forwarded-Encrypted: i=1; AKwUvByhv6gIl1j+x7R9UgXx74mE5l5tNK/JbjohuYTft69djE+SzPmLA836/Sh3dY4Hnj4N8NWLcXuis7qZ@vger.kernel.org
X-Gm-Message-State: AFuF++kWzsq3BEtaMXUVUq8U8lbIkqzdyRdTyaZkAxZEuu3lofadxRVV
	nnK45/2GBMZJZckf/27yTijpAt+0DkErJAVKlKnrL7LxqYWpv5lHCLVhMY6YBZSDy3n7lWyXVNP
	MmQIsp6NXnHxlQBlbPIy+bPihUCxiAZBPfo+1Vn/YMNg+sIuLfRJS+/uBZS8VOKKU
X-Gm-Gg: AYBFou03TwWeCbLg3jk9HpibFNRApj+YPTTkPGZRY6HVslPPnsCPlES/j/LCVwGfLC9
	WNXatZL8M1i5wBkOEBaYE/JSO01F8iO3rPGqwoJNxN6S9LEhzfoXRo8y2xouBFx8xk8vCczoT8g
	bM4vAwn1t4bGSUcLC/GTMo4Mb+XyS0quC03zCDSRSONrKyfA71Ki+1p8H3pJsRuxO7bydWZN3ML
	CJhsudp2ilPu88e3I8RYJKg1rktUstH5jSt/wTXKt3suBeWV4Yx1UwtgqYV5hr1qzrdPB0KEGZ+
	BTrNCNRaUke72ZI/Fu/a0i6tIfkuMfbbkzxe+vjd1S/L2DiM5Z68P0E5yzgiTXlRTh+48JiZ2Hn
	uHYoo9KL5sRVJYeh6lq+esQ==
X-Received: by 2002:a05:620a:4503:b0:939:8148:1e3d with SMTP id af79cd13be357-93c43bd1bb0mr2533927485a.2.1790690102990;
        Tue, 29 Sep 2026 06:55:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4503:b0:939:8148:1e3d with SMTP id af79cd13be357-93c43bd1bb0mr2533924285a.2.1790690102568;
        Tue, 29 Sep 2026 06:55:02 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64c2fa412sm41413991fa.22.2026.09.29.06.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 06:55:01 -0700 (PDT)
Message-ID: <9a1e7a4c-3a9b-4233-ab4e-93a9878dfa34@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:54:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra-iqs-som: Correct PM8150 L10
 voltage range
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
References: <20260929-fix_l10_max-v2-1-2fccd87115e7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929-fix_l10_max-v2-1-2fccd87115e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NSBTYWx0ZWRfX955suTwfQi0N
 y6R3vHZupbfueO5dGTjrFvzivUYcMDYDV26xxuK06hpJw8k+2qWr7Ma8G90qXyAQw3om0kNyaL3
 yDHIwzLPG0HqIPLhfrhzkeS4/G3dWzUcIQxLvZJrL3mB2gfmYRx7MS/wAp1hVyoNOr1eV9t/1wr
 j4F023guYit3Kjz9ivl0NsscWok46+Z/N3eEncC8xd2GG887vLZT0JcLt5ZUw2MzEdxfM3D8Z6+
 Odvf7sGlmxq8T65THnB2VbDFm4kRf3DEJcH6RZonU4JTt7anzsAqVwexnyo4c62xcah7r72CxPd
 Sf/ZM965cUfBfvIOWXFYxoRvW8uPNRbZg/fgZcE0BRu9wbMRSwmwu28TX0AHvdYyUcEMcLOFzg2
 fuJ2fwmP+rdji1/zQAIHeaEaT00zlZydHbgCIj5hgs5m6NroarMegAHqE15CfwQ4qsZ/kNAQ0GV
 cePK0XCbBfy57YAM33Q==
X-Proofpoint-ORIG-GUID: kTuijhVBJFYd_Z-rMy8aJnEqTrqqynxd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NSBTYWx0ZWRfX+RV/3+Qiu0+J
 xxKtClFLS3TzaPS29TDnI+tjnN63fguNu5hJUt0/Km++WnlI61x6hClIvZXGfD/KMS7Gvk/XKJb
 PWA2JEMbqM+qh7dTr29UZXYc71IZbf0=
X-Proofpoint-GUID: kTuijhVBJFYd_Z-rMy8aJnEqTrqqynxd
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbc338 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NkAsgdMbsgjDGuKY8CEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290055

On 9/29/26 10:35 AM, Rakesh Kota wrote:
> On Shikra IQS, the L10 rail supplies the SD card's VMMC. Its maximum
> voltage must be limited to 3.3 V because the derived VQMMC voltage on
> L2 supports up to approximately 3.3 V. Allowing VMMC to reach 3.544 V
> can drive VQMMC beyond its supported range, potentially causing SD
> bus bit errors and resulting in the voltage negotiation failure:
> 
> l2: unsupportable voltage range: 3500000-3296000uV
> 
> Reducing L10's maximum voltage to 3.3 V keeps both rails within their
> supported operating ranges.
> 
> Co-developed-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
