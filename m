Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501706;
	b=BQU7/fhNPFaLL2WrFXSPst0nlfJ3joJRCfyayqM7sjiDe/h2Ns/xJeQuRLc6GJKBS8Sg
	 2IgGBbBRxVWmjxvDcqv/XnLlAjR0J0Rc+K1b3xZnR7E8CU7nbV4Q5gRXSalOmqj2/HnyM
	 2NsY7W+vszabulVVVaRQDKQv/n200VYdaFAeG6yRQjI+mOQfqywqz3xVbHzc4j4bVMNVB
	 vjkLfxRoKhvPB8kk0CWMjcka37q1FyIzV2gcup+n8eAIzd2UFk93vLZe3KhePjbiDy2A8
	 25n3LQyFxvvurmN39Ia9fRt8K+AkdjKUWTvAn1OdT7Xt212QVE199iZ9QDQwo+LpS+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501706;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2EqJhnJ/Jsj/AwDrzxspTil346yYpeNL4pTvcJZq0tc=;
	b=rP82GSucbMxLztNz2MjYiI5r56sEgnQLSu04Fmh7E/SMDNm350tt8B/LiBTQ/v2LSCM9
	 0Ku3OoEXG7TlzeW3I+onfsfIhU2rdjDokEgjnFeWtKVx3EiKBn4ygylh+jE95kD10vGNX
	 iRDp0ojq9Msa2xwjvfmIxnN+q+BFpzCmWXARmVz9ja/Cskty5Iy0kwC7Rh8i+hiuSfco5
	 w7ifLxk5kmENsNNS6lu9IOq3x6k2UTDXoMlfAvodpBY/K+1ApWRKFXpEhMipArDWkVgP0
	 dp5+h2gKMjgHvJDIqNwTrSEKWOAednrMVvM5W/CqNUcVcQ6m4ojD0STgedSJ44tBk0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b1qd9rTv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WsmNrNzZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FC4606A321
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30FC4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b1qd9rTv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WsmNrNzZ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx8jj2524381
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2EqJhnJ/Jsj/AwDrzxspTil3
	46yYpeNL4pTvcJZq0tc=; b=b1qd9rTv7O/QfbRQuei/An0s4vhxKdwNBYPzRsD+
	PiI+j8KxVbW4rKO5fUxg/Mi6XIlSAzNCNERGqBiBpYFAo0RaVvKSQ10nca6JcEup
	9aBEVfMPGc0oTssp34qxoSC4UuY3fsAJjlvoQuPi1+/1PqyKtP6Ka11EEnOYGT/m
	OQzTpd8vumH+ckh1DqHnE0wkICetIcjyVjR9OdmpylTCqlROZTfVgv2gcOdM2Mov
	nhzK5J6CuHhmqFzt6Z3u61WDeEW/MkVY+6WFqmHZev69uzsPM7mH3bC3fwEcUWiA
	htJpv8WYm3HJS5ceMp2rcFHi6xzru2jH4GmpdbuwoUsDZg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p2kp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:08:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc0418036bso351491137.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501704; x=1793106504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2EqJhnJ/Jsj/AwDrzxspTil346yYpeNL4pTvcJZq0tc=;
        b=WsmNrNzZ26RXSILZOg7NYO7ph/ueERTuszQ+8+Gvk90WTGjEgh8/7PDaXF3R7kgtiO
         FJGCM7fHbw4BWBOIXH+3zY3Na9c7oLaNSRnx190bkZJKNm3AdBIYTIsHhDHB5JqOO1h7
         nGJu+BdbvYksUiMADaake7BHifunitfKTZ2s6nyiMIxF3gtVCm6X2T+8reD5DcAV8fhB
         gKBNoOka8UKjqN2qvRemyVrxei1P7gR1L0JxNTc3xYlZa4qdcCO7YTztEo+xXLcyMjCr
         Qglm4/wQyz5fM/Nc0tsLa0lTE8ojVSXWic1wuz1l2+RXBhxud1stWFxXTsQYTX8Cqhne
         cbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501704; x=1793106504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EqJhnJ/Jsj/AwDrzxspTil346yYpeNL4pTvcJZq0tc=;
        b=Z6h9x8s/whw8AKWaluoW+nP+xAbJM4PCmNRFS87SdDyExEK+vkqWor4flDU2jNKmxd
         Z0bo2xeG6qMRe6MXitA88Dkp7NDsp2vsr5nk1AB1I7+KYetuO5csB3bYY/1urj8Mvwvx
         CON9s+GznXzQ1XqkqZpnRKD0Q5q9HlUpJF5EakuDMpHfIiwLi9NRpGjlZcMRqSd7wsGE
         ABXqqrnCscGCZQnlpYWEF0B+Gd3Yun6x/lEcwWrIctvyu81/3nllYl11HIe1B9Rdwzrm
         OpUjnUlNHfihVPYkP277ueehuyZuuRuUXxHwFQ6rFcr/zCZ0ITKFSFVfxOkTKHlv3Szg
         kJMA==
X-Forwarded-Encrypted: i=1; AKwUvBxsJYOv03E9jtCscCWwRBANzx+mwp2xT5PNTOTvGV7KlpvdN4sr2tr+mBZIs3mWfZrS3n1I87AFxaTS@vger.kernel.org
X-Gm-Message-State: AFq9FYIrrWaSSw+yl9G86yM3X5waX5CpQ9YrnM9dh6NdhPFsT1qzcYSS
	lfAS4ci3h4dUeSHmqk5+pnTZ5MbK7FETAxYy04h+jCZp7+f2AHg+7PyzPZXn63TpCP/sHFI2gIC
	xMyhPcpHt6dRAaNBKpX6nA7akl7oHzDIQLzQW/al7ov1M/SiSULb+UgFZqUNIk+Qv
X-Gm-Gg: AYBFou2gkAgaxivpsaSKsbqCyEmOD8R6lo5drvFwQQM58U8E6/EGteUJPTnf0xBV1xY
	rIxqSUCncT08/bEn3ekXvKOGYM/dfy7zlNzMRsQDjMESsY8uiTg1lvPzoW4VIolUugNxmfa3dTB
	X4soY72tWk2ymfuXsZWnHq3zD7V49eykEqDDHIlxZIqPNzjxlRpg2gSUJPAO4GAyNM3sDvzHP84
	EtawTCItbCXVZ6KCqqxnd0QxEppE218UJpOYqVmwvrx6WPngo55JO9xyMvYETkSKt+BBDiCbFLD
	sOh/UR3bkQflfkgOcrrfAElpF/ok/x1SQW1NcFgXywjB3jUuHqSnsn6UiYh7+givthFeVVJ3aYC
	Ij1trpHvshyNBgMek
X-Received: by 2002:a05:6102:5488:b0:7cc:2086:34cc with SMTP id ada2fe7eead31-7cc369c0cd8mr2444403137.16.1792501703996;
        Tue, 20 Oct 2026 06:08:23 -0700 (PDT)
X-Received: by 2002:a05:6102:5488:b0:7cc:2086:34cc with SMTP id ada2fe7eead31-7cc369c0cd8mr2444369137.16.1792501701989;
        Tue, 20 Oct 2026 06:08:21 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6db78csm6193709f8f.2.2026.10.20.06.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:08:21 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:08:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8250: Set active-only tags for
 CPU interconnects
Message-ID: <gmiurdyvbr2zbkbzy2bi2telpxab6irchpfnzsv6gy2gxpb4gr@m4424rx2pbej>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
 <20261020-topic-icc_defines_ao-v1-7-cae8d22649ac@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-topic-icc_defines_ao-v1-7-cae8d22649ac@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: G8RmFPAkl9gYeiAyW2Vceb7vBa4-lq3A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfX5OMcJqajxGvQ
 TjW/Q7QLbX5wOpWdNj+67nPXXa6Bt+XkTGgGY2YiCAR9/GmvJZ+wRgF+/tMyplcYdAwdkMPQomI
 IHERF7+SIINDfWni+n2toeuORyuLI1g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MiBTYWx0ZWRfXzq1axFeu5U8S
 iQh3Md41FaW9Dy1mxCQajj+d19U8Qo9kBojNTkZIo0Wmggdq9K/t5yomNZOF3aTncjCfcsgCh5G
 CwYBdwruRhP93vao9HkekjVnjsfxCeTdBL7ddE56mn4rAXVx/7DfF/AYvjZHB8d2WNi5oAV2/BX
 EYPHvDz1/LxmgWRy9mjCWL5awCg9OQtNVyywYoc/kegYDOUykshBRZgsYDO/kUruBZDGmjxBmt1
 KRqXZhBzYd8gORtF+JUWIEF5Ehge0iJ8nh0LcOdWwrOP/zoJUGQKqWSP3yrXBrLdF2SXTBBq2cD
 uXD7v9MoS3zQRUlmlipp1d0a+VZKtgx0KOSQnQ5Y5/jOA9G8plK38aMAvkpMdHAvSRNujurIrtg
 /oxcHU9DFO/dpfUmVs8PlcpDAzy1lzLB3LobSQu2pyLsGu0JWbtDtiFSk8P12iEPLr/T61vzIwf
 GvQRnTQneqtNCqW3vgg==
X-Proofpoint-GUID: G8RmFPAkl9gYeiAyW2Vceb7vBa4-lq3A
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad767c9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PhDoQi8S-v1mXI6LFy8A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200052

On 26-10-20 14:42:11, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> RPMH lets some votes only stay active so long as the CPU subsystem is.
> Take advantage of that and make the CPU frequency-bound votes behave as
> such.
> 
> Fixes: 8e0e8016cb79 ("arm64: dts: qcom: sm8250: Add CPU opp tables")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
