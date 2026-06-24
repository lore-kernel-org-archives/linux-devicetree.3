Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4664D3B5314
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307506; cv=none; b=iWfQaJ3xXr/oRYH4tnjaJ3hgFH8r6t20Zc0HsdfX5cbU9u9geigUi50V4okk15n0pUvqO1GjeXNizdqoA4a4LsLX/FqMAJMOYgDYTggtaYOaO6V3Zl9T/A7NXaaRJfIneWCS+aN6ZOW6c/OPBODK/voc+DWMYdcX4q0SxWamrMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307506; c=relaxed/simple;
	bh=kDhyzIRUSFY4DaoQod9y772gfD8arw+oLPaldgVNaxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSXUjmo7A14d/mPpiMjRpDaTQWgRDVX/pH2LXsnr6V/p2sg/fn0RZeNPedaGLrxlBB0Eo5hxVHw2NbTnHCk7ZERaPwpxi+DSZzwnqwJEgJ+JlTIOkTFyI4VwXpbSGr+KMhEC5d7Im9m5a4oocqva7mkih5TTaxdZxFi9ZG8v60Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d2mAbR1X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XN6b3dcg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d2mAbR1X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XN6b3dcg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANdmM3134892
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jcb1svJI3NBPH8EE+KZbtpFM7FrNUN4sf06BtjB1g94=; b=d2mAbR1XGCpRFcrQ
	K/++46i9yRqy56WlEFmEddZOdTp1EnhOD27snfQNx8Ti4zXVYcRm2C1C0QNTfRJ5
	+YUGZ1FbYLjmG9Nknd+WXemnt6G4OrH94+kBZnsMOAmm1PcDrpAdwTw/czOf6bdu
	Yqts3S0VCH8FBiozXh4Zh0QzQojjFmZmLKPpu8Nz6tyXt9er34Mkqa15Ibap+5Py
	WVS4jeNuzl7aw9YFlV4YIQt/mj488azZ4/0YfsuFxckrLUVXhWlcNmIWOlbRk1yb
	4B6KIKwqM/+9BwkKZlEvtiSpQWV40+Gm4TxykvE53l7sO90lDoe2gMl1UHpxuefG
	Ik316g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ajjfrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:25:03 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-966ca0f25a4so22222241.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 06:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782307502; x=1782912302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jcb1svJI3NBPH8EE+KZbtpFM7FrNUN4sf06BtjB1g94=;
        b=XN6b3dcgvyAytuW4VUomD0+ICF06GT3nfAIp7NxFv9tKRkvV3UmokglbW0nOZASlaL
         zPfa3vEWKWwt7ocNnZNSHbX5kaL0pAevlvVg14i8fXFW9qxGTGGPADxj0tlLEKdlVctl
         BZzMNtw2LMoBX/O5LXj4rNyHl9JsrV8wI4tCVApE5NRBe3/gntkhtDfs7YVVJjFVYtPv
         2LKt2ktarKqQhpe9ydw5/HqjaeAOL0jBOgDL3Ksc6Nh1sC/fM+0lx4b/e4tkVWf9FKqP
         fvcM/dcMjpyoKfU5TqR93W/hxA7XT9pNiDj5HwkwAwITqC8gSkgS0/h9xDCWsaO95q4C
         nb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307502; x=1782912302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcb1svJI3NBPH8EE+KZbtpFM7FrNUN4sf06BtjB1g94=;
        b=eu4Ozfbqm50s7+4ym3EZtadjtuhlgFUBx1D6qSK43nPrCOsrtUaOqnUEJxfiBQddY/
         Y3asWHh+o1gjqTsnkzBW9Zo4m0IsIV5HVtJwfHnmnqoF+1hp27Y6zF9adkkfqlY3F0LD
         JwpTCQs2XMT4S5D5KmBz0lotSwNmH08kSPkVbmGFnz91BKX2CKqH/8HTs3bL89999UB0
         KPWFzBZ4fTH4DgkblXuKuM+kYPg1RZAMJK6+TgAiAyTUjfTD/1sZ3vem82gB24W/XFTE
         WwYEimGpDROM34yL+oss92roj8QRGS3/zQDkpv5brOh5sL+p6Yu6ORjDKMrmOc5m8SH4
         uNrQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtfxnI4o/LftmVZtOWs0lrU+ItoOuCfNOrojX3TlzIJsVsYf0eyZJwg+gguCTwY99tu981E9iLQz3N@vger.kernel.org
X-Gm-Message-State: AOJu0YzTVZ6uZ41Y8KXSGsR2cZuBETjR71xPv0CKAlLik7mZdGMmHh84
	Firdw4FXDFRRPgLt7gG77aoD1+9XdIZALEbnqVbUQIk3Sa1W5B2nxQgj0zRfmd5ThjgKLc1yY1U
	7TbyX4PGLZ4dCRUCwfAdj/wisEyL83ZrBBIGz4k1iBIwqUsBjdO9HodU9xOCMUnwJ66pSs+tS
X-Gm-Gg: AfdE7cm1Kdgc1DSt5PzB3lhm5ypg/KkG859a6rHRNxvDevpKr4vu1RnP51ICOQwv4Vq
	wkb6n0B73Em394ZNZA2beKont/o3yH6bakIfnxOxXxNWyn1HzgCMJr45IPDj7xq1s5Lhn/Jzoha
	ipOcIMkFLspSq//1ZRKwfsI/HJ6QPy0ABjoHAogY4U7Mbmj9j3x2Bh+QGtgvd/XGtLQzxauMd0W
	l/YY9RI8RWUx3YPwFtdoNHfpwzHoNsGBDHKA3wPB9VRiGlsK5LClCGFWPJDtasi7cnyEq/Qsmm+
	vWeki+uc3dVSCK6AQDBlITd6pQ92bUOzXFAmsAfRsC+BslevS7VF43Mmk0WB1zGID+eTu+EDbWJ
	EIdY2gjAo4tH8qSYOZTCZTWXUf4KsVzpXGtQ=
X-Received: by 2002:a05:6102:5801:b0:60f:77ad:4bed with SMTP id ada2fe7eead31-72f3ac9a4b6mr2035026137.7.1782307502693;
        Wed, 24 Jun 2026 06:25:02 -0700 (PDT)
X-Received: by 2002:a05:6102:5801:b0:60f:77ad:4bed with SMTP id ada2fe7eead31-72f3ac9a4b6mr2034948137.7.1782307498715;
        Wed, 24 Jun 2026 06:24:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b182a84sm35757741fa.32.2026.06.24.06.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:24:57 -0700 (PDT)
Message-ID: <160afe5e-f85a-46cb-9ed4-195bd267a46c@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 15:24:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
To: Ajit Singh <blfizzyy@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260624125443.18729-1-blfizzyy@gmail.com>
 <20260624125443.18729-4-blfizzyy@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624125443.18729-4-blfizzyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfXy3wQywPYSy7A
 RsiDwOglVFfU8xv8+zPM1xiHSVau6Wl+JDWf5dcDBndulxIQmEzvISxbNKEDGRFvIeeA/WtjjpF
 JmVpBUKbAmcxgVVYG+SAh9gCsF2Smfs=
X-Proofpoint-GUID: FQ98KD9719_jfK1VAp1iao1566_rXaST
X-Proofpoint-ORIG-GUID: FQ98KD9719_jfK1VAp1iao1566_rXaST
X-Authority-Analysis: v=2.4 cv=DbUnbPtW c=1 sm=1 tr=0 ts=6a3bdaaf cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=K_x56oIxuJ97mMCJ5C4A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfX8L4AonO5NtKH
 X2148jCjrNXAglww2ylpgYJrVKpIRm7z61/VBMwPzFn5CGIGqip2R78fucQIDBrBtyWQW684+oD
 DTcIg+Y1UZnzT8kRc3uFk77qkqh00BksepyzeEiBFia7X16mLZ87SavdUxMQZ6wdW2kwPMmNf6y
 WOCt5lHjt+WWZ2iDyvkS+Ok4Pg1fXB8O9lN1EBAIxzW6Gkbom01wUxY2bZPyb2dA2tDHf04FBXf
 Y8sabf2xe60YIQgeb1ZCORHll7WW4x886ZbJhDfnHkrP5dTnpljQYnOy6RXHoL9AGhdjLwMQZIq
 43G/MVuTg8f37foI5327CZ0Ow78+umJpD9SU4iE9VP3/AT2WjsFHAmv3c8DT0TsDhSVJnXmSuqq
 QXecoM8uvJ+Ox3Rgjq5JWLEXf8FKSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240111

On 6/24/26 2:54 PM, Ajit Singh wrote:
> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> QCS6490 SoC.
> 
> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> support along with regulators.
> 
> The UFS ICE block is kept disabled because enabling it currently causes
> an SError during qcom_ice_create() on this board. UFS works without ICE.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

