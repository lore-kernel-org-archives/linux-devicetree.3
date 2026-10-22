Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665310;
	b=fkKUrCn5oru7YJ++EXJauRMmz2zgN1uqIaU9dFtMrU3OCwKl5dFfJryxLwN/KQ/pt9DL
	 fhvr4CTiAJixLk1oUAPdHYlIb9ix6/PkdJ9XB7Ki3T7cPZFNX4uzTjb3sbjpb0L1qKAA2
	 79N+++qXfbOh9nA1/+XEPThPuwr9MAnjT2NJys4OTyB493gsnm7vn8txg2Er+moF+RIp4
	 KMsNRuafW+xRKIjIUGzasCBFfLdE/Aif+KIJyD/3x4TPesTxNN7PSjLUXB+IhTFSjEqt7
	 7E34tnRdpXysXpmhXzIIoPGXEXNOhL7IjWaDtSxn3YXRciaBx39mY4rEKI5A91SWAmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jvNhtW+cE5LosWrzD/zgIZovg0BXl55ZhyoehTHQpSo=;
	b=0ju0DE5ui46aaZFj0mflUqxlij1XyvDKfBGTV/fFt531wzwH7Rh/ChtVWjHNYdwIvzVu
	 E1NhYoMr5Xhy/voh3z4s5gXDbHsMKudkjrtX+4QD/zf9wORijK2F7F0t0VLDSwdrVFVG7
	 N4b0CDtDedvG4QyMJbTCJzoBrBrxP/kR07vIz3L6+vcm6Lo+1AlTy4osXgECEbhZq4iFr
	 2oLVWDqe0VkPxnMkCs8Go28xSea6xLqsDt8zTyF8RbLQGgO5xfCSMphgmcqg/nZRmKf7B
	 5rRjRXLNaU356Ia5vwk3mXMn/ZH0d7wMNIuRsgOH3XuyVwc3vpH3u0Pb6y35/PWpUxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQxmwBng;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zk2VW3p1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A4E606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24A4E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MQxmwBng;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zk2VW3p1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA06um3115544
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jvNhtW+cE5LosWrzD/zgIZov
	g0BXl55ZhyoehTHQpSo=; b=MQxmwBngqVbTJYlLbdUvA90EhU1KKM79Cd2glIXe
	QMQiRS4x39EmrguyvaR0esBDoSMGL2TfQ7LZgkW3zypA3KE27auAEN9J7Y7uLKZX
	zQLlVHHkzh4ewGKwhWsarL5JGM1TUeuPQD9Z1hAzUzaTcwPBeyHCVMKWKGZsc+zI
	sn0MeBmP9QTJHFKKxLCAqkqPHrsaba4zLvl4UIH1IkQuXQdF0pJWh4LQuFOhdseY
	ixK4sDi7S6vuOei2pGHpE3DYM4RsThz1MbnhBCfS/8gweaJga9TCbsAyxfuBLQCd
	YSibpRFb57K3bAMALFIvVf7fx6ErOiaH/lHQxoZUIeGBRw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bt2rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:35:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so550916285a.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 03:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665308; x=1793270108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jvNhtW+cE5LosWrzD/zgIZovg0BXl55ZhyoehTHQpSo=;
        b=Zk2VW3p1BeNTWhPd6BhapNRXYoixh8johClC3tUHaJGuyT6pSwHX/vIQHIeoYYhwxf
         QDrM/g+tAtt/o7eRk4Bb8dl7DxMTx0XJ3SSJyvsFEsxvCwfNTX7YHb53k4Xkd9PDEHz9
         ee5zhB4nB6x+Eo/Y1CvLsm/73GJ14GYpdyENYoqgVUVF/SSRWMX9Zb3VvKqGm9N8mauK
         icMRSP25jZZUeebH0i8W9CWOjHV5LW94Lru6zZk1+jo+RycRx77jqDHtSehA19zlgypL
         MkZCd4dfMhXOS4QvB0uUrXvp2RE2ZrYU4su4wBqlwdab7Il+ZuN09daKXNghtsJkw/6O
         XO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665308; x=1793270108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jvNhtW+cE5LosWrzD/zgIZovg0BXl55ZhyoehTHQpSo=;
        b=I9Qo/GvW544CJDR9PmJuoP50SSIc2mi9tMCy4xAW28AKE/lzGkffQMl1St+iT3Ky20
         FulLM5V9jWxeTwAE2j0w++c7me1MF2uL7enF+OFY/2RqVj4b5VyBZbcTwLzGXbQcr/K+
         oRF5BcxHj68ia7+XnxM0v/iG0+htgccleM9HzrE5pYPBkeYLF166h6eCKoCpkZxR0QQd
         aaFa/qAA0jIbj2H+aayxzAOrs33ttGmyae9KQhl4oCmW+Z4NjvkxmoBEA88Qna/H4woJ
         pjqZu/QDwldLSf3clN4hYguD770Md+SQnMNytCcPTZhB8Q/nmzlC/zXjFGHSj91p9dGu
         Da6w==
X-Forwarded-Encrypted: i=1; AKwUvBx4qg5FZgUbN8jsFEpgA/6hWvt/NGwoydMzvi5Q9CFIjw1CJpkeQ54ZMqC+RICwYtDLP31R5DkJYAPg@vger.kernel.org
X-Gm-Message-State: AFq9FYIc1frdlF7DI/RR770dP1BeRhAVVc/vLCf1i8FinEI1mzxAxJAC
	Xz/JPSdU8ax7EremQAeb0lZKLk6CHE772HlRAQ0QbessaRzHDnSm/GB3SPNVhsX/87kemdas/ti
	m5lN9v6Rk+9oc3CcDXvb0RdOdOdbIj6ZT3euMTM+vTkFFow9WTCQ7xzBdSAw+AcaE
X-Gm-Gg: AYBFou24y3Lzn+I/YCmQRM9E/j/iJUwnhP/aTOmzadNvgIRjLybH1HKqv44sZiplTet
	1/opYDj7J4axetsrVAPLzzkX3GSXqPf9DYYNMfXU0LR1SSZBHXjKcOyQi3/OIo8T4To8VRXNvwS
	8rZDCtH8zLP3JqisJOZx3BJxBTVBRnFk14WpORyxs+sB1XA3Kv9t14og95s4Q2rgOjvSLi4Th62
	GDqj0BwtYSiLxKRfeaygtdxpu3V6k0Oh9UivdMIwPLfnz0pb4oQhsC8g5oOcQfTqi5vadSt7fvd
	IKmcorOcVhnjqwIJTp+Tey5DRyxcthIrJF9pl1FOQ+ESB1H0SsJVlU9Yt6ZUb76fPyOOsGpnrzA
	oZndxhsCR4qyp1Ims2ycKSqpe/wN3hYRHCRMXiXCBsH2pLRH1n6bNfNcp0rYVZJbrBa+t3Mbqi6
	PT8DZ6SK7bmDnf
X-Received: by 2002:a05:620a:454e:b0:93e:c6fc:7f50 with SMTP id af79cd13be357-93f57e52bc1mr858528285a.5.1792665308289;
        Thu, 22 Oct 2026 03:35:08 -0700 (PDT)
X-Received: by 2002:a05:620a:454e:b0:93e:c6fc:7f50 with SMTP id af79cd13be357-93f57e52bc1mr858524685a.5.1792665307784;
        Thu, 22 Oct 2026 03:35:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa11f5f30sm1036059e87.19.2026.10.22.03.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:35:05 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:35:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm8650-hdk: add DisplayPort audio
 playback support
Message-ID: <teczcryolqo3rgo2jzeafrcd7iktpzx2johlvphb4cyvdd5dml@awmlmvzqm34u>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-4-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-4-8a189c71938c@linaro.org>
X-Proofpoint-GUID: 8Z2xIjtcILAlbEhDyvfWkHf8RPfS1Gev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX/hlmHlXrYCMj
 7xAOZAdmudyvIC21ak1AUoLEfGOXZxmEtGtuoJ5+WPgkEdi5gJOZmEN9ekCE1rRoggOQGRiNN8d
 xYW+kBBzTRk7eK0l6oojD+5JQ87lH5rQaTMA/t25SlVSGZG9WJMsrkfC8Wsh7aC+FE3Gh4/sgu8
 zVt+rUnnKdbatISTVrTL14K6dh29TNwDn49w6YLSBGG+A/sm/DDB/BLUsbfY+a1LJzWHFNtGCAi
 OpM2MQMx1BMGJrar8L4MUViF4xAUEYQ/haTOaImQ+1pNBwau36xK9Zcah8idke4u+lyiR37AgZf
 4qPlwgEFtmzsDkUo7xkM/mffHz+IH9VR3+4d0Xezi6YZniuu9qcUnlJvSnm1EU6RMjV1tIb4xD0
 83Z8bFW1i9H5yK/u4fIaDn3Y37cfEOnd3aSG2fJ2413Ua25X5LBOB9sUqKcSgArP5tyJ6n6rjvB
 KbRpoBvpTQC/asMus2g==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9e6dd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX93HCeCwe+Eul
 byZWPWBZjdzMX7xyezUFIhONzIlVgylh307a1Nj1XSNoiWMhaVNlVSSMuvuDl9lsv9KWlux//pW
 73ecUVqFSjj0IsKH0TY5NIkzHhW6a5I=
X-Proofpoint-ORIG-GUID: 8Z2xIjtcILAlbEhDyvfWkHf8RPfS1Gev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

On Thu, Oct 22, 2026 at 11:36:24AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
