Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613528;
	b=OejRjlO8ocFGIXsi9J1kRwDkCDlx/Npizzw9JGxdaHzqOkozWYVQtgPJqLLrxoH+jU0k
	 kZp/vJd9JykIQe+KOknwF3XCxwMHTKIZ0J87DpsxRVF3u5nRMrCT7r4Anrz9TAZLwtJK1
	 Mef8s8CbJFGKf4BGGrwWiqvyz5WvadJOfYSBSsJ4wZ7YbSRCCMPag1dJePBEaHDwTgwW4
	 X5/PNu5oTOk+dcdoBEwO3sxUEoZoxNR//AAiJDd43lK759/4dif52WJEUjfXDtPRTAv3n
	 mkTBFVm/CNu+ABlGg0VCZOOucJLvorJrY/EDyHjGl/ZqTkDcigmV4ppd2rvsR4zUPKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jzIkZr3x3Xp86Z0mA98bwB9IrYK6czMaDjUmIisQr7k=;
	b=f/Fh1jtwMfr6m7MPnF+I2L9C39YCX0rJIEW2wAdafx8LSuKkjPhj8jrRgOj7Xn3bjRIa
	 9M8jUN6llqh65R0m5nXSiyOUJMUtOvhvhzk9wekxLwmqCiPSnDeb7HlGSx4q1+UJ2DGqR
	 yAgr9TXN/3D+UZDpjE8JOxRFmknyQlmmBMgK5uDywCd6Xsnr5NdtNRQc0ksyoiFJfSkDz
	 TCs8O6yp9T6Dx5BIzjQAztLKlXd84x5thYA1FiJnvvkpFM505VqO2z6d1/mvCFAQSNPkC
	 q7d2ohUJH8+qauL4Ihu5SZRIZI2xAJqoeoWTkrjFEcGcJviG5befnKYwTH6xFXWFKeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DDYU+IvQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="D59iB/J4";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48024606A32D
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48024606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DDYU+IvQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D59iB/J4
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AImr4039587
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 09:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jzIkZr3x3Xp86Z0mA98bwB9IrYK6czMaDjUmIisQr7k=; b=DDYU+IvQRYoSsgfY
	xxuhpLvMBKfk8QDJxkkquXf0u2tNrUP3w6sywVqWAJ/vgf/GhWmwHJ11HdBX9L2+
	XPySOuGi0kQOsvmb8zaDHROIEMJSf4xWYOErtSQ3nJkIyIf9M3oY/ruEf5JJcbx/
	Ct1BjNTmZFc98EhAYZtvJmVC3C/IzfaeS6CRdetp7/4wyfcvnfanWS5t87ikBL9+
	RlG2ebhU4xLxO1msW+9hlrgd8Fg79S3OBm8eqoKXJJHMVekGIVdmIhGOwt6Sfqw7
	YYRUIRKKADAI6m/I3tyLlCEe+5hjPUNJ17euSIVJ29Fs4j1MD7D3QEKTX8Bn9fud
	hW7t8w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18hsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:58:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c7fe5576bso20034226d6.2
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793613525; x=1794218325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jzIkZr3x3Xp86Z0mA98bwB9IrYK6czMaDjUmIisQr7k=;
        b=D59iB/J4WBanpS234LJvwRPWBCLA/EQVcMDCCgrlI8g2NICiad8Px3CKBrFoHo7Cx4
         TlSopvbQ/cK4FpUwOiQInPPM1IljqvR4tgdZX6eNo8paDKA2MEGN/z+e+8DEc7L2ILHI
         H/0IG8g5WJAjHH4V1qb4v2Ejo1dTCLSL5M9862+CXB7AGKtnX1W4KGrvIgMlAx3eIML0
         dIdAK7R9P7OjsO/e0jGR/TvLb20QuJHguOTKpWrghRJyopAmpCRabWk63d2B0oT2064I
         xo9A/xbIQZOKX+9lpzQuBs0giL0A875vctfsNcgT8Hr440M8+ihVsdRiH9CJL5Mg5Mtn
         5d7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613525; x=1794218325;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzIkZr3x3Xp86Z0mA98bwB9IrYK6czMaDjUmIisQr7k=;
        b=VD7xR0wgt33rNwsYpkZGD9+FK7R6lhwpfQu7GM8MAGIateS7rk9NN0enDrvPrfa3jj
         afhTKWVdc4bSYMxQWimtUUKf/HDV+g6NrJNxn4l+G85/dNJcAHdU5ieDYZId7KgH8EMd
         6yrrzQQnliNx/dGyHqeTQGdCMmSCQ46DN2a1heZu1+8xOtZVnPmbP7NN8iQN7bq6fc+z
         jtSIzBNwLK49odqeAxXe3/ic/g13qsDmZmQ+qXn37WXtv8wctPMNjKIl6ZTF7RGzu1y1
         By+tdtUU04ErXGIOcCoXM7No5EUvE2wa07uEYf+oXPYt1MNiEmXTuEHtIIQ2EBr3xNlR
         hLJw==
X-Forwarded-Encrypted: i=1; AKwUvByGsOmBMt4YJ3PJA13YkidQPblX/24dnP85UngKqYizmB3xstomI5HqIZwBDq/Ac0y4ac3aiRgYTiYN@vger.kernel.org
X-Gm-Message-State: AFq9FYIfsunVfJudqdGkg1rMOY+MLtQWY/uDd3Uxw0fbXwMngaH2ZljL
	cLV1YnmDiFzPMHobXUYp4WDpHAxyI4e9fXMeatpjxWQsUeqkBKeLkfiBL52Ac/REOvGrB0TEL9n
	RGBLJeBXr+HoGBzVpqV0HYY6BHm78mnm14+hU3Bsjs84HcfCqV8hEwPrCNB3DAxzz
X-Gm-Gg: AYBFou0g/5VBhaOdKtnTM4M8US5iD9ByIasvHlmLSme+9AsGTWtCcnGwH8/2jSiEGhW
	49tgEmgXIK1etPZJ76oiR4/bFlL/UU++HVASBL6NSFodNoo6dEinrJc0Ml1iib5AAdPXU149ERW
	kokLBya3TdWz8WE6tZM3Um/TcmqH9Gxw/RjrgcgTWn3zDaGVpqUT++Lzw8a1MHDNxxhB81oZyVr
	bNAzmzW/ErNE1sslKx1/klbdLm4lEM0s1qd6RtJ553AY9c0dBY5gIT0j4vHEVcivFYPYPGEqZUc
	dQBChDqxW1mK1zjF46hxniOF2bebiSDtrPUxiVNgMdLMijeBACwNsvz8CEVzZt5JMCLyW/P10Kk
	8sK9f84sdKdKHn7BEIkybY+3XGLn04NokmEt+0RWfWyxegfAljhvF7wfbSn4ClwXUJZqczuY=
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1551974685a.2.1793613525358;
        Mon, 02 Nov 2026 01:58:45 -0800 (PST)
X-Received: by 2002:a05:620a:2246:20b0:93f:1fc5:f07b with SMTP id af79cd13be357-9442151da69mr1551971885a.2.1793613524919;
        Mon, 02 Nov 2026 01:58:44 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fc668sm3100901a12.15.2026.11.02.01.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:58:44 -0800 (PST)
Message-ID: <8433ec2e-0f0e-4816-b3a5-6cdd7a6d1040@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:58:40 +0100
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
Subject: Re: [PATCH 03/11] dt-bindings: regulator: qcom,usb-vbus-regulator:
 Add pmi8998 and pm660
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Robin Snyders <robin@snyders.xyz>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261031-pmi8998-vbus-v1-0-4d805e5a0f27@ixit.cz>
 <20261031-pmi8998-vbus-v1-3-4d805e5a0f27@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261031-pmi8998-vbus-v1-3-4d805e5a0f27@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -0P7TFBzd6gsDmjpEFXq4eG-TwjqaYR9
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae85ed5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=nHuvgkJ7WHa1mimDmQUA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: -0P7TFBzd6gsDmjpEFXq4eG-TwjqaYR9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX7IJD4uausQKQ
 CLw7XEkQ+OBx27pQ0CIq0r3pSWMaw8d9HUID2Ffhybaeu18EHtx7yAG16WuhhBszy18GP2hTsF/
 g8r5vfdEaHBXc1CDZzRvv2Oj/ltX4oNtc3yWW0B+On9/To8vVw23nzFsT6mKzX6N58O1ckCfEBK
 fzYjQL5pjnUqW/XcI9XpycNhUUTkV5Ev3f3/bAU9E8s1So0IDTkWDfvWM2btdkkFJRDKPXOiTvd
 aEhplSLGRO2vDSEAFY1B96g/NE9/Pe2UgYPrf8Tykhv9Ie7B4n/xLMHFg9IWEa64lHmHoiuUdfN
 JlpW3MUB3Ra75xelGjwUb/IbImLCjVQv4S0ZQ9S3pcWbryXsqus6rL4YWS6ml5sCCT3yaGPGYlY
 4rVHd7qvSC/nc6wopLrD+c8ekuo8Jddukb1KmQVm8BRYsH+P88wblh28uLJYGhXDLtbZoT1Q/Jy
 k/JRWXBs/YqkxlqfFBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX6C6QFAjICJ1R
 vXvK+lP2KWkVOaNGp6OCuVFDuepGiVU9EGnE2eR3hNrfaTFYSPnzoWr/c6iJ6KT5ROwKlwI0jfQ
 4iXCfmAEpDMaLIKqmo/gu7jH7ucoDBM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020039

On 10/31/26 4:05 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The VBUS register block on the PMI8998 and PM660 PMIC shares the design
> with the PM8150B one. Define corresponding compatible string, having the
> qcom,pm8150b-vbus-reg as a fallback.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

This is absolutely not true. They both have a similar CMD_OTG
register at +0x40 which makes the driver seem like it's working
for you, but otherwise the register layout diverges a lot.

Konrad
