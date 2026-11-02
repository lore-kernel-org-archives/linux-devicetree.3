Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620710;
	b=mGz8F4FFlVorMfIegq5AE0bryBmQHgGE7ksVYwDNPu63MKp5sHCdM80SupcT3blIWfFe
	 neFC6q1nIAWx4oIJGAEiLq/s5C4NiGWTlzMzNBZjieq9va+52Ef99a9uf3fQN4Sp2caXE
	 YNRuWKakPn4EBbgllZb98fAmuzOcZDAu3+G3se6Fxgq31MMx8sye/ImMpfPJ95YM98Asg
	 jsVeKsj6Aue/Apbn/ld8zh+FobJFhGrnAleZUhwF8EmKyhP5IpDGD8qE2mIm87Ky72pn6
	 dGtD8DwCF/VGtTXYoyIk48RxmCxUA1q/Z+9G6jDNeyPCn7w5zZnFXey+5iJcy2VNinA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620710;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HYqwDlxIzrVgKHvVxNjVgcktbuyT/DDsBjlgMBa52zI=;
	b=Fuz6MOLIk/FUIJn7YGnukfQfnVfaHqAwF7KfMBX2secSKtwSI5++rkCJFKH6WNUgZj6F
	 cSQrFE8nrlfttOIDKPyoO1i6zp3czuKYMliVRT2ftt+O9n6+DAMeQ7Ij/NBPGnz3ElQlZ
	 ydRNGzIYUw1Aw1kN8vWaIW0wS40lxtr8yHFuJ1clpxcWDb/XwogSjNIOSV/exxkBMQzBx
	 QoY4vYv4yjGwzVJSs1eHdyYbKLZAvmXgCdfA/v9sOcJl1/GnhrNU+fm4CK6KSwaRW0RlA
	 nKq6PVbc4hxMQGz+qH3vvi/v8grqM5/6Rt7Ye/XklHRqe3hQv7ulMeVwzOIq3S/0QEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C0M4XKP3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MJRGPqST;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71560606A327
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71560606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C0M4XKP3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MJRGPqST
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMja1821130
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 11:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYqwDlxIzrVgKHvVxNjVgcktbuyT/DDsBjlgMBa52zI=; b=C0M4XKP3WMXlU/3W
	I6Pj1JJOyuu6q8lbDD5FGGJsuqIZAn9QacRYoyujRdBogKQr5PyQq1El44cJhoKR
	ucaxCi8rYv+YXWlHpDzqUmcBpTTZhHgZlgmysX2Y0d8DK1JJiqws1V2GXBnqXibM
	4lAyjxIRZWsCyvf18riHvXJAe/HJe4lKMRDttvtnsZS8j+SYQQXwvs0YF3lWOKH4
	sR26Z47ZrAzBHAJ722VqhS9652ZXxw0SQn/Av1JpYKZaZSkgV+NV0XSEXzii8rC6
	rbeTDTHTJrrwpysUyn2jptg+rNkw3eNqGffeQ22D85iMbErKtFr6IPHaOlthnRQO
	rzgWCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hhb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:58:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2bdebfc5so54965285a.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 03:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620708; x=1794225508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYqwDlxIzrVgKHvVxNjVgcktbuyT/DDsBjlgMBa52zI=;
        b=MJRGPqSToaooX5qXz56yx+/XhNzWc90LAy11B/ZIpkwzI4ea8sKpoPE0G0Dgu/EAAM
         QCMwjv5i7pm0RsKn+Mwvu37NsYJIiTpAmCOwq29I9YNNe3HciKcqivn02ECp1LrZR+1b
         nnM50ANpy1ke6JtREYtMEpQcv0cpAh24QCE1VqjKfsGGQnexWdgtaoynQUxS0Ilki76R
         vdn/lDu6w5TM6QoNF/vSI7CiQMu3w3h9np0KzJNlQ9qzOsO4XCmwxaCeYB9kIOvKBDaN
         9QI5EVHRrvXQ2dSw3IQUg+JIkPhYV/Y7lLeKSBdzZmf4tIaYdcYrrJNtVejZO/f1Mfho
         XCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620708; x=1794225508;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYqwDlxIzrVgKHvVxNjVgcktbuyT/DDsBjlgMBa52zI=;
        b=A1rSnRmPpK3o5ExlV8PGZHYWH8BKQEalFCMzpDXoe/N+N5vxQaWYpwg16ZsXDM+fNX
         B1lAfI5UWuLf0D3ORvtW5hT3oZe11JiJd6FTVweYMKJiAoVjYwVlP8VKV0PcE65hmigQ
         nwrYC9Yr4GxKXTOiHx9Coy595NTGj2dgA0y8CTMtQ+gBl5i9WIfAb9kAFJrEWgbGhesU
         icrEhw+1jl/P58nOxKZq+bKmKaF9vEsQiWtbNeRkpzM600l4RdrDkVQk03sQ4JQ+5vIN
         Ke1hoyDGjP22wwsYPTWj7bvSkPeuyUEDuE2wutFsDGcbIiFU8ZgKmv1R0mUPRA418k/9
         TTyg==
X-Forwarded-Encrypted: i=1; AKwUvByDAWJpLmYr1XPbwJmwR0C6Im20+tGRmm625Ke5I/L3WKys8pBw5e2/UVQKK5F8BAYEm3z89AOi/4wf@vger.kernel.org
X-Gm-Message-State: AFq9FYLbCsvkm5DT1SVsC4tX9wwLt83HS0FO7wgIA+cSBi/4Xm9KGr0H
	BwmOCPkR+oSbjNm72nhDzZKd3emOSNprqXtxjxQ9w5ffFXzXTR30NqQbDnMvn5xXFI5q3oT8xf5
	CWM4xJlM7PglbAZi0SlI/ITc6qtzzFkclQDMnXbdVlWHkSQGCQTR4/+ABy5EYgeq/
X-Gm-Gg: AYBFou14DsjbW+0J/7TIoxSE/KqtvbsYjx2TY1dfVzNN48xrXxr2Oa8kpENfB/9jUDc
	BopqFe3nrXhVhfoaAq3mde48CWjIl5aTKkHEjJBsLV3rJxieWu3jqzWqUm4ifGc3BlEYayoZamk
	J6oNB1dXFqr82tMwAHMW1At+KXPBp5Qn7V62UHUEpFhPbfnbloFSLnFMPvJGFRM2w65jjdlQWUP
	VBaHiuIsfJjRmBbHFjoBw+tyjkVEx0qgZUO/Qcs4tJzeJEYlF2LRRSnpetdDNTPKHFVsaJHhiEm
	cKsrKC3AKnlIknyhw0zE63Pm7xnMxVrp4vurjOMhrsO8NSJvaYnrjOdsR00obIqpJYRgNEf3Lnr
	2qL+Sj1gRxverNHwSbNd9cglB9TMI18K4fEFzpvlqJvbU63WOVghl9uPGeNRoyvVeNxXTj+M=
X-Received: by 2002:a05:620a:6f96:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94421878c51mr1514683285a.5.1793620708497;
        Mon, 02 Nov 2026 03:58:28 -0800 (PST)
X-Received: by 2002:a05:620a:6f96:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94421878c51mr1514678885a.5.1793620708014;
        Mon, 02 Nov 2026 03:58:28 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca211ddsm3086049a12.34.2026.11.02.03.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:58:27 -0800 (PST)
Message-ID: <4f1ec92b-0ef1-4139-856d-e9077cd7d4bb@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:58:24 +0100
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
Subject: Re: [PATCH v3 03/12] arm64: dts: qcom: sm6350-lena: Add
 qcom,rmtfs-mem node
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-3-cdc3be96d257@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pdx213-upstream-3-v3-3-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fs15PJXFh1v6Z8RKZhU0KP7lcGjTE0Zh
X-Proofpoint-GUID: fs15PJXFh1v6Z8RKZhU0KP7lcGjTE0Zh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX6rKouv+rW8SA
 VHK89bDrfYmWETLkrq4OABUevvlhICDPSOcrtEt2eVy+8CqFyBruwJsFOz14PnHQmGsaoGq+Mhr
 Ybm2ynrsePAe0VuIOrm0ie3ReKD4xHQ=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae87ae5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=RC7kgf61jvLRIQ5xqpwA:9
 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=Soq9LBFxuPC4vsCAQt-j:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfXxjM+MvZfJVrW
 kOLuC4+K2cS/LLZYIqdOAVva+YKBy/nSygxeAb2bpM/tdQ8dPuv7VpEaydOqgncbX2BA3nZTZmf
 ql4sra3vt27Qp98PcTd9/iznArtl+rviwzeP1MuImCKm2O6kDjIn3XfO1IqXE215JNpPhxU38Ih
 pIewjb/uU3P0faI5sly9fXzjzYKHp0kvJ0M6m/weLdh4YI34ncOHverYAsxHFLCPIieEbu1wiwp
 Za7rAJTFdf8RVWg8VBenm5aBK7+mogCRKhoediydZ6JCStsAPtiuJqTiLOWS/myG30JD7J+iVki
 p6+nmeS/yRsovtsvXfXvC8UmqwQns+2mtfppdk3O64IFybm5fjbFsjsUO1/SBYUVeR7Ijvxj4N8
 8QQHyEpPBo+kZiICgbWDjvzK4WPqY4UKNjjXmRR5KKMnFHBQ/Dj5d+o8K/ZImK1RXxRe5h//5Lt
 D0sRgh9sHedzgelvNRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

On 11/2/26 12:32 AM, erebion wrote:
> Adds the qcom,rmtfs-mem node required for the modem
> 
> Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
