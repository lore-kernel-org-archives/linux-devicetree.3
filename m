Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13144657F2
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157882; cv=none; b=pm/hvobR0lnw4qtUTO5KTUDhhIYLJ9fA5PShnqL7Qym9yICFB/tp/WxMYMEGldmwEqb48RniO8pnqO7PBWoW77GAYAXJqZcTA0Mu3XreTbw8Tx7y0Qmw/OYDLh3gFkv3cA4BAX/pp79Ao6DvNDNCX8jKRt1B4HhxMfdIL6yHjQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157882; c=relaxed/simple;
	bh=SS5aXk6Z+00260HWjb2yBKL0EsvuOVsfTLIH1GHielI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TU+Z55KoYKX4snlkQkfIUGoSVfUiTJx7kwKwFzJsba4amWaH1mtOq+C3556s6yYciGxjo8O95Vye6cbKzWdMM7nbdOuy94XhCVzBkzvis/OqXAO1RnCG0OQo4x1XBGv3bjsiz9+BFih233aH8iBUsxX3+wIaVdOpOEXEocFNmd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O14M54xF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmIlZKij; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O14M54xF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmIlZKij"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAvRno1504112
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 13:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	667sVv21vomSzpQOQqSJ5fi3RYqtg8PWcQDYf2XqiPI=; b=O14M54xFQmjisn3I
	egdfMsm2hE43GxzhnmQ+X+SQca5uEgstY+NyEiDtdB9UmCYqi4fPfVHXjR8Pr5sM
	a55crih+/B/gwX8JiSVTqYqsFDyG8sqBafOO/tIXy+/xCaEEdTm546WeDFUPjHe/
	QcVsQ6vLEuX13rqObdj5qeT71wDBTYZv/58cgJ5R6KGHqlC0qAntAWej3fgtgR1b
	ffo7R1dBUZNDOSw9yzIQbhqOXGVBm1RX2NPKjgIrzdbg3Lddh5qCXQZsucnluQqh
	M7TiWd/rcg1inM+F87xEQVE21x/iQ24i3fBAYDqPMbif2xLLA5iE92BJ5xyiqR7J
	seJTVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf8j1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 13:38:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e629c7b16so104509685a.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 06:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792157880; x=1792762680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=667sVv21vomSzpQOQqSJ5fi3RYqtg8PWcQDYf2XqiPI=;
        b=UmIlZKijOppkVzNnOlJ8YilN1MRI8XzFKd5RGTFpaWPXObRThRbOS7eSpjGC0RAAlQ
         vob7c12F+yrlqcnx3V6JpFKsaTHfsbuSEiGCDxLWGojpD3slS7DoYfLkWnj27CFwaG44
         Q/eNfT9ZFcNPm9OBSS6UrFxL7sshDVdLP6vAtA4lG79Hjaw4RUegfbfKKmBoUGfXp/dp
         Ev3zZ0HaHFw0/7YHoiqA83gjDdMKcxz4XDXq5JrED7+YQZW9syBAWklDxAMKPo8U3uDI
         mMXwwxf8VnMd9ckjHaFxZjMJP5AsJzE3u9YDJktgFsCx9nObnEJ68u1sFGiCt3E3SiMs
         Yiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157880; x=1792762680;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=667sVv21vomSzpQOQqSJ5fi3RYqtg8PWcQDYf2XqiPI=;
        b=Q9pjkPb+yS+RMqMGr8Vq9M/+QxJphvB8pSNLzBbE6PTiEXsmu+i+blLDCbqUuBzMRq
         hV9PQec9wzr3N9xhOiEPD2BqGnBKIfckxlXdOhgpM4CZdavhKRjVoilM2n8qBe3rkhzp
         43yjPuRyeAWE6lsU71WURB8N/GiLezCsSYF8nM/oRUzDwNhjvkHNpiMXM/8KR5WKVYxT
         oAA38VRbb+OtDbgVfwaQNZSiTrhxEsjK1i4g5V3nMgZBGyZHOC2m1dqHEZoq21RM0GIF
         Aud0pY6Em1sURnQp+8SRwJ7KcRCJKNNOww/7LMqLfdUDqJzeGbNCVaxfx5MnN4n0XB+C
         7iPg==
X-Forwarded-Encrypted: i=1; AKwUvBz1hyswHdNCKJ4AMhJkHI23XRgY0WIqXNe4mGZN7d/sO+Co71a08K7SMhmVPJu5MaCLLkiBWUjl+76U@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0OgFUzV3qalEdcikgk7cAMATmtQ/upCcxAxxn9wC7U5j1imb9
	Qm/c/+WKF3QJrHPOxZL9YpAFRuL1orym6xDLWkt+3PWjelU7vGZJGjMmO7nye4HCYWx7zsYd8Sw
	bXJ4WNd5Tn3UCLv4DaklnXBDs2QAN1xSx4jZjj1sixUS3yrCI4sh0pNi2yOyGVH9C
X-Gm-Gg: AYBFou2Lz1iUbJdzqFuinU6tYmJhS6FXvDSfkZN7JO/wNgcSLVgiBfJhc3pu59/u0U/
	4+KfLtKNGCSl1yx/mTHKVlyo3vbZ7uUoCUxRCqDCyDeeUCAxg+7a2mZzDsTJrlR1nBCoAdTlkCX
	Irn/jWWYOSUPSBnND/jmjtmtBfk4dm/feU0Gp0BbTphK+tYLz4fi80UPsdTvHIOTlSeshfiM3Hk
	iHH0ay9/c6SiWCN+LzRT07OxTP/yT0BzZX/8kFlv8yTbEQdrtnNqHKG2gtBiR47NubJoORGg8IZ
	AcWRFE9BPu1yItAQkad5aSBjuqw0/YKF0g3eMhF7yLqkilvGHQ78Bmeg/osWWecZohwctGNXxai
	qkw16OpHy8wE4JoIlyjU7/Q==
X-Received: by 2002:a05:620a:a43:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f211f7e97mr162053385a.5.1792157879899;
        Fri, 16 Oct 2026 06:37:59 -0700 (PDT)
X-Received: by 2002:a05:620a:a43:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f211f7e97mr162048185a.5.1792157879272;
        Fri, 16 Oct 2026 06:37:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c633asm894616a12.16.2026.10.16.06.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:37:57 -0700 (PDT)
Message-ID: <20fa5e7d-89f2-4c72-be6e-2b6a802d2530@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:37:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO
 clocks as critical
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2OkhSIF7mpKXPgYJDShHL8WMHi28peAd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX1Qk02tEGJGA/
 XFyzWwttWHl4nTb2zTB6dO1QRl+Ek/WvV/DABbqHv0exA7CaK/KRLSCs2QnQeNqrPcSzfKbucY/
 hfJohWbWfUphPdt+Bj+Db2zpW1SxgB4=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad228b9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=erN5cKggTshIPlD3kWUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 2OkhSIF7mpKXPgYJDShHL8WMHi28peAd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX8YBpbXNLzVS6
 WZVBPifniQOAI9Sb4DUkExFnAopFWEqy3UtZSek/kv/wsQ6Ruc9HXbGAPvFw89t4+VuInrZZ6b3
 HTlEv8dM8CK9FJFePlLOZRu18XzM2H7PvBFTjPWAQPJpu6CVIcUxZcmvQLybTkcSfTLJF/y/CNQ
 pP/SFqB1AXXN+tsBTPMRN3JlzAIn220PfHvpIuZ80jJEVSu1fZuUEILidCAociZqphdTAwNakN/
 NbnZEpsTIDmJ8qsC5CPOatabT8wx3dD8gBZvtjk5k3s5fXYREF0KqAEuscpRInsev2o1NZYNO7o
 RNSIe421MUunUVK8n1jRqiWcMCNdTdxtSlP47AZUiMS+vhJprrIZNtWRhk2GLZXbL6Bro/3CbiH
 SC74Oe//bdti7Y7KSNLRSVZt6dVKc+Zkk1q7XiZ3E9M7UaUuix+hYHml7ZrpUK/1sza7zN5026f
 2ib2YCsWUZUHYwysRrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160054

On 10/15/26 3:35 PM, Jagadeesh Kona wrote:
> The GCC AV1E AHB and XO clocks are required for AV1ECC register access.
> Hence remove their clock modelling and add them to the GCC critical
> clock list.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
