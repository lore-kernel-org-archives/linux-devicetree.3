Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8F43F5BEF
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997009; cv=none; b=c3jW31Y4Ztp5+3XqlrrzLdx/hUIwAYNqXoHLHPvxr7+zcwzHQfqfBYkDWswTqcyey+5EPfF4loVV+U3FE+AFbwRdzA3PDnta9+awmjpF3otyvXlQXK4hff4QX3BA3oEk2sqhzl1W6MF3u6MemhDPGzokRdcSV93c0I0Q5WifD50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997009; c=relaxed/simple;
	bh=lseGHBh0I7O9gxHRu5mCUIVz3TgX9PhEUb+FikegtHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OpohXOD+IG1/Xx83uKysFbIamDIf3Bqf5nqKdApkejaQ15/qU9UonwDhaZhXU7pmBQPf+qriqfLuNoba/vHEV03Fdx/YNLPODGZjsC+67oMkMPHHw6qDSejDGb+Bkg+UQ+2JjqiM2fGlJqbxmakUi9ceSAARGTKjVp/jQLBMv2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iUOmx3Mf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfePEUc2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iUOmx3Mf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfePEUc2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599JqSs1784170
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 09:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UH8OziGrmCPRRzdpQprXp7LS0fI22I+yAftUFQCLcjA=; b=iUOmx3MfLy4v9y2B
	PvG5FnMs6HfoAyu/J514AcOOSV7m9aM/9ooo5aLru6ZNYbufPyR0bKSCbcdPgsw1
	DJ7Ek0SSy+E3WnWL0ucaQjf517FftxqY/TWcTGbbS1AduFZ62fHL01b1H17ZSKGi
	pS5BZwIf6C0esQ5zPZOd9HKCSgDnKvtiaoRsnEIepYI3nYWnD2Zi3vwd7aS4lETb
	V2XP65HDuTshRvoACeTM8vO/qMhEZDWQ8Pn8looGzx7WEJ+NyZZF+U2/lToFW5xP
	LCAhUshkHXpF6tlSEDVym0PvyOPDzruFEjJAN47c7n4vciXYt9wOqowzG+5QcSF0
	AUx6uQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3wg0e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 09:23:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51757324dcdso10898921cf.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 02:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780997006; x=1781601806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UH8OziGrmCPRRzdpQprXp7LS0fI22I+yAftUFQCLcjA=;
        b=gfePEUc2vquc4xVHSpoh0gHOMsYq3Gn6oKmnZqtXVSPkV3pKh0w+y8plOfz0NAuyS4
         g9oKclp35VIwDFduQJh3eYO1R1vybCjR8oxKXsU64vv12VMWeCArTGsAjCPz0Glh571D
         vLlAIM5Nii1CYG2RTfQdNOd0GzRCVhgikBP/jh/K1p5Fh6oWs0mJeriRWAa9Kzep/doJ
         sXZQ2ip/T9vmNkzU5zD+AWzFpJOroTL3AJD1Nod98SqtfFLjwrHpjW53PfSuwUxyZQ5R
         UzvL9TzqVhTj4kbelirz6oStyp+yWbqN4UIfI2jIv4KlYquuH1lM/rbKUuzfENC2WOCw
         VruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997006; x=1781601806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UH8OziGrmCPRRzdpQprXp7LS0fI22I+yAftUFQCLcjA=;
        b=Vnhnrzl4ll6xyZIYVvMNMPgeca/LWuUew6adNVZ9OsHNgDdtYUeEWTmHeyq30lt217
         5TeTTU0x8JiM8f9dx9z+ie2/GXq3YfhO1oqfnBfzPz0gpsqaRRRwZ1X1BVuzLpIZfzKq
         JYNAJuD/MscYd48/5VvpzPi7YyVDxGIbT65tnTDgUlEE1ru6CAw5Yk0zt27RXc3x2xrI
         wUSFGIS1rXEO86z9Kgjarg3xJTB+P5cXH8RgHHkrb6KbXAsTN8p1Se7wHWyieXtn815j
         PdHGKWk/l88xYKQrOYM53YRes17kfr0Xvapz/gYO7ZLwg+Y9onwVM822leRZ33CGOYxp
         TL8A==
X-Forwarded-Encrypted: i=1; AFNElJ9kUJNDrBelgWrFGrfB3/KjLLpibapmViE09JLL14V9cwEekgm6wAuzKp4i88pJIsRHdqZWpIDiQLSU@vger.kernel.org
X-Gm-Message-State: AOJu0YzNeONpwF6V7ZqkqeO/oJrkEyIjxUUhEiZt3bP/WOYJOYbqHrQ8
	E18nT6YjTKmJ7ikWaNSYYBkoKrCtps1XzlcBGZJ+vOh0byvnc413Mzjx6mWfBTAWj/VbiSXvfxV
	HS4J+nUlnHmPMtLrWutavHYESGsy1vJ5/XlLcl9kFKC9Pry03aZaxWhwM8pVT3TgH
X-Gm-Gg: Acq92OFuAd3i0SrH3vqqgbGYvXVVpXL3/034SHN9WHnw0e16/v6LmoLQm61pP6YTciy
	0406PiFysOIM4WdOdiUXieF5llgIN0Rf3MPjlPX2nouT+rb9GgUF+FHnkqoxtkw9QhX35NTcVNO
	FrV62O8pT/XFCkUhzCFHijO7lAdseCyYAYRd28R63FTTOnWMRslnyzp8b+KL0sGJP8mVGQygWnz
	vR1N4TKYyZ+Ihq6a1jn4PN76yPU9FVk8o/pXyhkOuAfywZetZlpugpMYVfAzmg+qHkWoFw/qT7f
	imF4JzjCZ1nojs7xhEWFBeiYrRSKoe3SCFwAsIx/ORLgm61ynFK2Vz8HPQJJMaNamMX6G3BAnEs
	uZvkLkqmrYCchTML9Z/gh7xaCxz4OICNqql5s7b7WCfxYgh8jJhhXd1Zl
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr146701791cf.6.1780997006020;
        Tue, 09 Jun 2026 02:23:26 -0700 (PDT)
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr146701521cf.6.1780997005512;
        Tue, 09 Jun 2026 02:23:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517714c5sm1017739966b.2.2026.06.09.02.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:23:24 -0700 (PDT)
Message-ID: <887d4258-3202-448b-afba-7ea864bb48ad@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:23:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] arm64: dts: qcom: sc8280xp-arcata: Enable
 backlight
To: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
 <20260604-surface-sp9-5g-for-next-v3-1-6aa6f6612c10@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-surface-sp9-5g-for-next-v3-1-6aa6f6612c10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NyBTYWx0ZWRfXxzluo4ENFP6Q
 f54Nq9lenaXgJvehOariCD1qUT9jlHHhLXRsB6YLbjDVBkPEscvP+5dqVJMp/Bt0PQV3rzO70ju
 XlJIX1iSnFkW09KDJpCHKeY+RBVAGD7OWE+laPb+7fmbVYts7i3dkz3lRI+S5WhG3weZPSMpcJr
 11hgrbjEAbNKUGjJMF3zwQ1cSo7tJBURVOTBght+dG+znrcfSGflrbnfBgaXSNynCMYmdaGDYVE
 iSjdJbkFGodbVmdUF7zrMyLDorTFxSO9fDYfC/0/45syaqmDi5jIPteRY46b2MV/Z1WbEJan/7d
 bZ3NcK5oraeB2TckDA7VXtm/+8z73+TmcKVucu90zejdqujK88HbRWXjEgmhE9DL/PieGAANMPZ
 P2gemGVW2ZtooBpUBPT/FFkE/K46HJnQbcFYp62uobXgbnvUtWZ0NYRlILDT93VdaXzgIRGHmJP
 HThKE6sLVN3o5Tz47Iw==
X-Authority-Analysis: v=2.4 cv=csWrVV4i c=1 sm=1 tr=0 ts=6a27db8f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0_OxBV2uU7IM-TJZnuwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: -1_jttnYKG3J5RbVmMQ1AirvnVll-fna
X-Proofpoint-ORIG-GUID: -1_jttnYKG3J5RbVmMQ1AirvnVll-fna
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090087

On 6/4/26 6:18 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Add backlight nodes and enable backlight so that it can be controlled
> with the corresponding buttons found on Surface Pro Type Cover keyboards.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
