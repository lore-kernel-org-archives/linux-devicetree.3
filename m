Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F90A443AAF
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060117; cv=none; b=uACRWRt7bXZw13Qxgln1Okq7Gb0FVrSGXx2ra/TjTusXbW6vtPMrHlpO6c2FtwEfKr/alRSQZM9VvaxgD6Qxlaw2tduVNvPAsVWjwonuSLODK1mb+ffdSZpBEx0v5g2b44IELRiDOGW0W3ScAQAzZZMVCiBGeETNauETeuZedW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060117; c=relaxed/simple;
	bh=klD+1bPn20FdCCR9QyFVYkMKWskBuEhyCL4qVmKbDxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DWPzViVIRoInpl3FHHsFDvzvj3aZYyJOwmF62qX2mrlfpAfTitXHhL1a5igAIQEUz+ZrjvxXvIy67QoHypM9M75BRVcItabZIobf4p6r/cta/LzRDRDaZgWh0rHtx4mrayhfyk6DgaFNuqcmZ4sreY9fQG1ykcYslAeJwCJX+NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YySU0glg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBfcQfe7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YySU0glg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBfcQfe7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPugW1596362
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KB6+lnNaJsEI2ADF2CB3BJtwA+u6Lxdf78IIw1N1pAo=; b=YySU0glgRC8JsDv1
	ObjaIUGQzJmCNQ0xXHn8KEaWKbePL9VJqztNgKFyByDdqaO4majLo9MIALAWcGle
	ow+FykKhNmyiPMK+WHz/ed4/XQuYgWlM7Zk7HkSQiCQlux5vD+k/jFVAmKGZ0btq
	p/aB7Rh2HaFARg+wzp8DAlcqsFHaa4KVp0TMC9DBGMqBwOSjNaD1/debgm4oYF36
	tp8Zq0UlmRNke8BA+Z9fhTJmyXhwQytexA22/otoSO9PQD63FmFdoFgDLP0FDjSh
	llCgEYwfF2nStJ1/vgHAr8q2zjbufaxmszVvOzpQbpOpImk7mKht4RHJ0Yhhr0q1
	X9AiLQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v809v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 10:28:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so99030085a.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792060114; x=1792664914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KB6+lnNaJsEI2ADF2CB3BJtwA+u6Lxdf78IIw1N1pAo=;
        b=BBfcQfe7u9xWmkFl8ArrK2UWFgesUYrcQvadBD8EiempiOVq7ouaKh86bIfUg1bHBR
         CVYBVKxSkBaqDqj8yP4Ey4toQhgPcBkrd7JnjEt1/6FGOn0Wuw1JZqFISFwnwlH1NlRw
         PjlUbVbct9Cz3ALUdNKzF2kEql5ubYczqDC96u8RieCe3m/tMkCC9Q2qClUuQ8lgcANT
         t08DmpNnTX7el+EUMIUgzWfoGn5+k7LX5G+/uGSYfhAHm9Dt2SvmwcPgNrpox0UJ6pt7
         FC79mqBWGFnk2+ZPe7G67FiK9AjvaSx7w4oKEanN7Nvr5rXEtzJM+td/xYbCrFRc+zKM
         1LyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792060114; x=1792664914;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KB6+lnNaJsEI2ADF2CB3BJtwA+u6Lxdf78IIw1N1pAo=;
        b=OR297fKjtxPDjuIRrrBuziMfR8Hzs4OvN53bMXIwojejU3pmW67cy4LgiTVnwPbpBt
         jKvnZ0NiacHRyC5vujtWcZ6EUjymwEvYqd64qiqojy8qKIXRlcXJgFgnaclfP/P62Bcq
         8OfcIYrtITLt9zgfD13aKCxr/7fAmutoGaK+yPIV9PSfAlxLQaHUOOyMBhhsL0KELL3b
         1PmRAMclssrtH3FQI152fWLMeHDlWZB/R1J4nmRMx3Viy+2gjtiI531Wzn/NgHEMbRQ3
         FmICCerKR2OuItMj+3zs9OqR1kzgboRemQ3rRTYTIBCX9rRKOqJsoSrFMAk6Q8VVlKe2
         eTKg==
X-Forwarded-Encrypted: i=1; AKwUvBwDSgq4Cpn4f1OktQ+KwXiC5eras9633jgeZIqtMy/T57jsjZNxJLN27UrctOoG3V7GLetNoeMSUdw3@vger.kernel.org
X-Gm-Message-State: AFq9FYKXKdR0PPzj5MhzIOJNLWQcOlQ5fPjQMWmypvVjHiJGgi9JBQFg
	a78tHny5s505zYm1OzwsZJ5LvFdwosgSOSSAGKDleXkvldqhaN80haud/0j/DF5CqnZsJKQUtHR
	3DL3YOLCbbU65x7Yf1a3wrNeA6a4OdbIP0cGxmtZ65PZ/A1SyJ3EDfrwmjtTDJoyEuLkn64PC
X-Gm-Gg: AYBFou3FXX+Bk2NS2Xwd20etK3TW7DszuTLcE/LPcVJnPMfZjsDqfs1yM1+L46hLoCY
	MWO9mAh9Nw6JTksvEqRg4lQKrHYWr7q9ens16z/qHjBRyVJb7pRLJa6S1XABx0g10x4ZNzynWxY
	gMbTlmcS5KRDXd8vYgPo1ZeRuxpi8FHRMX0u0g8ONgmdo8pvsyfw6R/CB0e4OaUneiRtbdG+t56
	aU0EqHch7r+IuJyOEX+mIzQEAaUrH/edC1H5ybpl5/OSB1KStlRJgXd9s84jtVW1OdRST5Qqcpq
	ZnVq7zoTpwTA009kPGAYXn38MHDcCVarlHdLYAilvz2bmKlG06WFsQb5aw/gUk6AFfwo9NMLYQg
	ciGUM7kaYtqn29yTMaqDpJA==
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr3512979085a.5.1792060114423;
        Thu, 15 Oct 2026 03:28:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr3512975285a.5.1792060113895;
        Thu, 15 Oct 2026 03:28:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203762b6fsm2277016a12.5.2026.10.15.03.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:28:32 -0700 (PDT)
Message-ID: <a87613ea-5f6c-4697-af4d-1110c12f799d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:28:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-videocc: Fix clock
 inputs for Glymur
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-2-shengchao.guo@oss.qualcomm.com>
 <20260929-visionary-hospitable-beaver-e2c1a5@quoll>
 <arvGQKBY9DZlS2EJ@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <arvGQKBY9DZlS2EJ@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX+y6S9nonOvDg
 6ShsDV4lXeuUV8W5U23jbO49ImJaHVIkfvwHU3t0NJbK0mqE5bpTYJYDH2SQdENFFTDtJ+J5xkJ
 CIMXvws1GyDrImJCwgnoSbfjuxbbM43WirMWkJrcC2tEC+aa/SgGAiX1p12JdzxbAEeDeTBEPaT
 ofNn7tZ7S/WUGAHyZJXFtCKgvYEmB6vlmQyHYa1wfrpIddFqiHCWvv5En335VcNqayH1Q/Gu1kg
 tFFk9s8zV/lv2DpoaGl3rjkhvtIOQ1ZWwMH4JJJKRyFUeu40TXpm5+GwVBqdeJhoj9dInQqez+N
 F0n0qPcvWFmLlDsIGSd6QLwcPvEbDPiMnbdZXTUqe+pqFPnOuHUWql+l5HhHGMkiZZ8N6rpmMvO
 nXdH75uZeivCBXcQNiOhEIHwXZjW8buj77YKw1oS23efokXQVBY2vG9Vx36vzrjET/6eXn9+zCo
 6+4l2C70p41W/MWw0uA==
X-Proofpoint-ORIG-GUID: qprKFYyO_a3oFv5TZWpmY1uznAw87HGc
X-Proofpoint-GUID: qprKFYyO_a3oFv5TZWpmY1uznAw87HGc
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0aad3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=AByBbePJZrCWKXECz8gA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfXxSxne0Ie3Kar
 juxi08QrSTfTEWdoxBk7135v+3LFeoFVb1qBQmPhN+IQE3mtYWaKIXBm7CO09eEHlydpkFpOLWI
 2navORf32MQqcvPtJUe1vS3/9le7y4M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041

On 9/29/26 4:08 PM, Shawn Guo wrote:
> On Tue, Sep 29, 2026 at 09:57:40AM +0200, Krzysztof Kozlowski wrote:
>> On Fri, Sep 25, 2026 at 12:11:50AM +0800, Shawn Guo wrote:
>>> The schema describes exactly two clock inputs for every compatible it
>>> covers, a board XO and a video AHB clock from GCC. That is only true
>>> for part of the drivers bound to these compatibles. videocc-glymur.c,
>>> which handles qcom,glymur-videocc and qcom,nord-videocc, and
>>> videocc-sm8750.c both declare their DT inputs as DT_BI_TCXO,
>>> DT_BI_TCXO_AO and DT_SLEEP_CLK, and parent video_cc_sleep_clk_src on
>>> DT_SLEEP_CLK.
>>
>> I don't understand what you are saying here. You are mixing drivers and
>> compatibles.
> 
> You are right! The argument was the wrong way round. What I should have
> written for a schema is the hardware, not the Linux driver.  Sorry about
> that.
> 
> Per the hardware documentation, the video clock controller on Glymur,
> Nord and SM8750 has three clock inputs: the board XO, the always-on board
> XO that feeds its PLL reference, and the 32 kHz chip sleep clock that
> sources its sleep clock generator. There is no AHB clock input
> on the block; the AHB clock the controller uses for itself is generated
> internally from the XO input.

I'm staring at the document and my interpretation of it is that the
AHB clock provides bus access to the controller (via the AHB2AHB
bridge).

Konrad
