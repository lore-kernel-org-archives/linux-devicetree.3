Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624801;
	b=R+gXtNlghGMIbEQuxw8SbeTfmxIYuvNnHXXheBxNS41kKBjFw+Awbc4CclA/AAFzLgRA
	 eeloybm0tDlNn/p7pCmMHCrs2XHQ8IpucBLdKD6Javvl5m4uKYg+mOOQ2w0MQcc3xmSNm
	 0BxqetQNDY1Vy9vaWGnj9U79EGYSSp8NLB9XLLJi5TEN6ueT2uOeFRzh0yc/jqRCAa8Bw
	 NM389tPvd8nj1LUsMBhXljwOhAxfhUno8UpNm0rrAaNQ+uifW78DcvvZt//ILMm7iPODh
	 Zk6jve5e5+0DT6IRn8v7APefOw3iVNO0q6uBD8nzpKs0RF7wwaT1t460ftV0j/+p8mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624801;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3o0VXu9bpIpJX5ZkWtYZhlfu7R1IyftxP8YGHOrZtfk=;
	b=H2GB3I/cxZXXmrmMSn6PFmQFmrGp2LWtOumeQ3zmdSyFmgpWNkkthGXIR/PdCez5f75c
	 VfFGuHzqaAan+r/jJbSioVBp0MghRzspHjO72sA3omK6msN16ruORCG8Fa5Hr4/XjVKhX
	 hg+CPYpBLDoDJFfDukI8c/mU3gv2iZjcr9oVzpdJbSDx/tzhMvZMl5mcAqelXTRn+DjpW
	 1h5funBgL5hBvtwBp8YJDOVDqlU3YtgYJE9wUQ5F/gGVruf+pKkAFToW+FjRNnjenCzb2
	 r+x/04ejdnPrLzg1BG0c2zZV+XOD8h+05nOHN4upUPpHas8MGcU2razeF1menhq9Dkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NDsGjcbM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SoLL5IEP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52545606A337
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 13:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52545606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NDsGjcbM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SoLL5IEP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2D0VuX2991679
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 13:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3o0VXu9bpIpJX5ZkWtYZhlfu7R1IyftxP8YGHOrZtfk=; b=NDsGjcbMTbk37MeD
	3eYr8+mo7g5GMNTPToIaxFw2Hy5u4l39seDueMZLJadr/3jcK5nlP5foqSXQa6uc
	vQtXJvr8HNGX0AwyFlixB86APMLmugNthXbAJkme8YuE9CfRKZMGu6VtyCXWAGU5
	lKhkyYDeYiC0H0vcGCrRVzAnhXyxtPaZcqeXylcHO/H/sAVriOrlwB2s82B5Gucj
	JUnKQeaM+MhcSjBfBXYvtIfPwnLF5kyQFI6T4zjEBeDn1y+6AqpacCnypG45rNNa
	nVtQpyPAd/vmTum6JBd/GTslQtsM95EMSvcaheO7t/TGlhhIj6nyWTSB2ftEIyU2
	mbCyuA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhx08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:06:39 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9906ce36960so102039241.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 05:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793624798; x=1794229598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3o0VXu9bpIpJX5ZkWtYZhlfu7R1IyftxP8YGHOrZtfk=;
        b=SoLL5IEPUnLwrzpTDYY04f+MyhLMlp/r4mn34xGwENGK25YpO/E/lj+8LWHVwfT/Ly
         mh8ipOa1pmi5HEYrwP5TQyYbRCEWnMGqj9cV5mzl03p+36zpJk2xlofNaM3KRGlne13p
         BPOgZiO3NvvUv+ApyVClYhXWEv/vlxZaMehqVOac7rTJ/KMS3TqBmFXlfdz7fnNF75F5
         d4E72zOvUC+gYlxNs+htXdHrfaicqaV+3UkSTWkrUBOfXX1p9xjhS+FBHKgckyhyGSzN
         rn8J7edw8ejc74B6vPNIAIkOuVRmHL+IEBAXmctoB6ATyQfYKnOiQppxsWALaBAAX0Tg
         2xpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624798; x=1794229598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3o0VXu9bpIpJX5ZkWtYZhlfu7R1IyftxP8YGHOrZtfk=;
        b=FeoPAzAVz+lDRxsEV6eolMJg0U5esXsWsnmHzKvnMcARlFYqsn2K1Zk7AT/bvpQl/U
         GrjsAOOHrkHoEVHU8tcf6dW5wxwvz+wAICBBy2PkcwXCSRadAywQcrLQh7rbObTrKJg9
         iuVTwATq5L8Ig4KWK1wodrrrc+GTUybRcdt/fmCR9BJAsDMpYwH/ayRtdUe1AEKVA3Ga
         PT5Gwscq0y4n4d38GpO/bHAsIGjPVuFoaCD9sUb37GCFKwQi2qipGbdnk7eJV/u9svIE
         fHlmnxM4h9p7inyUPEdnOnFdgJcCybpZeGSS5fjvXZbMWVZP7f6lGLZ0ICSVxgMnSjJk
         dVew==
X-Forwarded-Encrypted: i=1; AKwUvByZYab9ccridsHjw1BKOiPwqDpxgVqobBmJsDBT/3z2yILUjDfL9bbyG8DD/pCiA3YHZuMyxsLiuvLr@vger.kernel.org
X-Gm-Message-State: APuU4Z/LvZPvOoLcBUTcy0f9ASRs9xyX31WCYIgopRh2Xt93JDNcM3dP
	BhRAtu2tIZAULS7TtdaE5+timsQuWVX6dGq7vms0GyBcp0sdyZlXHCz50BjAZSfA5vedFeFI1AN
	MqWcvcg7euaPKMExgxqccZ0wUdE8klDG5rH9jSrS7RQbZIwREJHAHnxHUJPRE/4Qu
X-Gm-Gg: AYBFou3wiWfp/3t0R2cUA+ORwb81i25lZtNbauA4FHxBwRq0bG26xvMhPHB+h3sZcAy
	sU21UzHmwEEqFG47sx66kzYmINuHl2yS6O2DxPDvQ1jAQ6wX8INp+993JZMRkVEj1BBoCtZ6F4s
	Z/mF7Fx6GQfEhN3Fw0CWVyGoiSXrItHucK3XRUkR9sQayKPg7dcDi4slnVfFeQZfv1ceAA6ntRy
	69PISVDEjwquMJrxXgHa1nZT/zMPpqQmDcXzyE/2M8ur9g3dNgYiVwmT8lC34qdHyPcm9hx1Mi/
	4fbQtV9akiAMqkD2ixjjtGmFLmZ4sINLVwxYoyKvvxof3zgiYcxHqt8aoChKuwqMgcnMz6fb54F
	igGzTMBsXzSowDw7yARIQWC2h8PKpbsNXqnH43jPw5mCmnWjOn5exzx59083MAaH0DA8Ub3k=
X-Received: by 2002:ac5:cdf2:0:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec6896c00bmr3914155e0c.5.1793624798453;
        Mon, 02 Nov 2026 05:06:38 -0800 (PST)
X-Received: by 2002:ac5:cdf2:0:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec6896c00bmr3914116e0c.5.1793624797996;
        Mon, 02 Nov 2026 05:06:37 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe2d6700fsm1540121e87.29.2026.11.02.05.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:06:30 -0800 (PST)
Message-ID: <8ddb1fcb-5d16-4a58-8279-a8f574021626@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:06:27 +0100
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
Subject: Re: [PATCH v2] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
To: Raj Aryan <raj.aryan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-pm4125-adc-thermal-v2-1-8f405d9dac96@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-pm4125-adc-thermal-v2-1-8f405d9dac96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6IcwtdayuMlb4hRjtV-QJ9-r9TdLcpSK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfXxRXr069SLHSC
 BVIMvTmXhmhdSJdaJsS6H4OYmoBz2isV9TB3I/Tlevx42r66wCbLRfvg8tOmzVq3B2kbHZeGmTh
 IEoOovqzN7MfGi2Z3Hsw14nsF8mRSkAb0O3pUc7nMz5ypcS0Q/G6rbWip+HM5AM7pOeciBB83wD
 SVUI7+riIjBpXxqdvcPrAFFdcYDkcwy/v0lgetoIyVSOp8n96bpf6ZWJFtxQdz1e3YBs4HzVB9a
 VngJ1SiACEX25L5qIsXx+W/64U6cYTa5pxySn/mG5Gvt49OTPVtcTCT1vFDb0o4cUeMtjyUTWxW
 0Hofz7nSN0PVOXtwHA/1JFP6oWyn/VhIDGWktmD59lL5T/DsfrQvD8U/cTXydOOU0vLlB5kUJio
 zZJjykMP5bl7oBiIBUnqq2ztOcNNAcTXGUVgKXzknFzESRJqJmrSkHqku4iRUQwOvkSl9kBTMmg
 8ZhjB2z2aiqFikADTsA==
X-Proofpoint-GUID: 6IcwtdayuMlb4hRjtV-QJ9-r9TdLcpSK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfXwkeB1shP0cZi
 lAtXeNEhVg986JyJXRMZNyGnvF05Z7XO0bSNKMqhL7vFlZvxaOOhUYfm3tInntkyrkUGoXw5OC3
 p9f9L/SP6r6Ms74FwbbhAuWzNXeM434=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae88adf cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7vQ31RHkpAPUYO8WQUEA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020052

On 10/29/26 2:47 PM, Raj Aryan wrote:
> Add ADC channels for msm, quiet and xo thermistors along with
> their ADC thermal bridge nodes and thermal zones for PMIC
> thermal mitigation.
> 
> Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> ---
> Changes in v2:
> - Moved XO channel into pmic DTSI file. 

You only moved the channel, not the associated nodes, please
complete that.

Konrad
