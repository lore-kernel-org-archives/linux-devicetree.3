Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486569;
	b=JesseUrArmZAVZqDM67hFeAHhkIKxA/f1D+b2uBJ0Qn+Som4aDEcmQiCfmP2mFJ5XxFs
	 /FWLClhMx+eDmz7/2TccREHmXVhBbuLdW7J///8VbrwoIdtoK/KtjO1e9vrgwesPMAcL5
	 hnxM1I8HXaQqC9ytdGSYADT8gzf+jlm2gdmpeCGDkNTC924SuiPRjZ+fNEy0t6Nx6wpWc
	 mTRMjiKpq9uJ989MSKJM3DoGL308xTQYRAQdtaLLyVjHLd59QA6JK6lwsgdqy7IjC4Jss
	 MZb5MOOAvQhvEKQ9dNLkP3w4906TVz/G7dtsxFGQyunc7F7Pbm/tKvrkjVlgashMHNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BR1IwiAnPDQuLNombG0qRfBEZEt9D0S3/JVBy9369T0=;
	b=skQrAwcjSkDXBXmisvJxAOnNECg5jGxAacTSBQ3+SFxD0oYX55nWzxDPbxIN62PHVvgA
	 cXTlDJANeGjYG6QmD1DDtC0So+uvetTJrIKp7mr5NoiOE2C3Y7uLNIaW9tI4BXrVJQPas
	 tlPwDW0v4AJ+zopqQ7/cm//qql8tZw/eCDA10VwDZHmByABoyEABs3NbX0A7vEujDEbh1
	 E04oEh3rY0BlPsQ7fDgaDl02Sw3JZZtQuooYzygCN5tkyizq0gJrf+MAHWP2pqmxkA0Us
	 uLakJejNENIuc6n/HGg1cAk6cQRZsPVC/EgO9JNZqkaunyMxy7fiKyiBck/PctMEiUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lo5VQHS7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R+PcTHbT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9B7606A328
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E9B7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lo5VQHS7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R+PcTHbT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8E5ms1211293
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BR1IwiAnPDQuLNombG0qRfBEZEt9D0S3/JVBy9369T0=; b=Lo5VQHS70Mh5HY8s
	Y/wjJAyjJOogyBWSRcFAyz6KvtlqhUbvg+LBH9HXG1blFEMCv8OWoOpQwMbBnQLP
	x7BBD4x8SSucQtiQHkTDnmm849QqM2M72XhOiymGaCzOHnQHyztCFNzUjGprdRMi
	lB9TDDI34c+jdpCsV5vvbqDSnSQe6Gf/aLjbibe5Crn77SqqPvn4i3gyw3QJXqP3
	/iTIsbIUeDOjGA9hZgjU7nI0kHHhtvF5bMicu2CzGn9AlZXAUWw+kdA/orai2QZS
	tgvwDZL/yac0PVSJA99MxQkhSaNzC+B3sBV8wjxNRncGKJryOk768qdy9R4Qsn/f
	TxVX2Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1qua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:56:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a04d1cb2so8443126d6.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792486568; x=1793091368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BR1IwiAnPDQuLNombG0qRfBEZEt9D0S3/JVBy9369T0=;
        b=R+PcTHbTxTNLUxec47Sld5QsqUInnIjF2D+RmI7IYZDYlSWnXdrt/pTdq8RA9WEYJM
         jSqPidYaipzfsx9eZTNAHHvEU4zcETNmW80fXRAdMp79bibOcblJUGE3ociqKip29+/T
         6UgvbBhFYYqvRvqn9xqw6N8OyrGJxxUBrws3gQ55ZnuuHH7cCbXs5R/X/BdbqnG3/LtZ
         y/Ze45Ed5DQY/KkNz6CMMp4L4vOm9FL2oTaNwNd+pxqRJfWTUFD691FVYhhay0WBHNOH
         n/9e69qBqKn+36U+ec64J5/85k7/4vzQbXKDWlQQA5/mIQMptchD+sCYjG1li5QdDvz+
         4nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486568; x=1793091368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BR1IwiAnPDQuLNombG0qRfBEZEt9D0S3/JVBy9369T0=;
        b=gATqrGFrJKtL2RDuZOrfMFpBUJgoIXRkqe4HSqKoL7oWY1Ghr/D1WvQrN25ojqe9K3
         3VtfcSjbsJYgKqKHuI1gG4YY/vSMPR6h/uQ5ir/gakMNa/1yaABk3Tr5eCkvX1FjHBEo
         2lDAz4fEasFRVtSH9J+9xgrR0p5tURJOpkAF3eomd7ocQCiK5Aq/IhkwCgTK1FSYu1aI
         1oD2B7cWRhMj3RnHt++e0cuxTxv8uUgvSTNL/kBZWPFH2BpTXX/VyrJvUjderabdCg/b
         PZoos2IHMhbMgOKjnB7o5kZ7s0UfM4qCpW5F4x0XatTdiJGv5d3vDDO9cIfqVVMnDG8u
         zIqA==
X-Forwarded-Encrypted: i=1; AKwUvBwc+DJ2m/swui9FYFtPQsqMepvcks3Iryt+Q5byxIQFgv6XAR7LZ13KXv7bJJFVzMmXU9TjctYNde6l@vger.kernel.org
X-Gm-Message-State: AFq9FYLJHoEkP9VjvaALRJHVeb9hpiSsWum8NWg7mfFgTnwP5Og98TD3
	85f92vzCRTbE70/oP8onjrfzJZf0EBzOZDrqHOJ2wLuHhOC8VcZfaHf00Ni3/7EuZ99xt61SCWU
	o5EuFH4BIkS0uRrxWIlSSK9AQVOsDewPIy2rL/QFjK6u0/EBJBWfF7Lb1WC+ydnGG
X-Gm-Gg: AYBFou1HgHm7Vrgz1n9BG2Zpv0S8YblMstgdS3Z4tNXjwwVHCRkfLiKKW1x71vAsBtd
	4JAwov3dKgXnTVCI+dzsUm2colyTyJuHRFPbt/f4l5lKYwrOSn3Us+ZVQdiw7XAOmvorOepPzR7
	i2OoU4PfDFqHgqee1BGvV3D82f6fImsas9YzOYNXoShE7lJrLfsek6Fst+hSgqPUtDJoEeYOuse
	1NelCh7Go+wBZf/DJErOjlM25tOdbQ80RiQ3RALZrVQmb56Fh/iCN6EN+vouQ/sbbrgoDJd7ui4
	lro/mJUyZ5KtnlbZnQ9v0+PrpiwueXdAxkTLV4rXRXL++6sBXIzo4UvIvTlBwhWxt5AxK72QxKN
	MKCFKrIMz/3kRsv1Uy/XvVg==
X-Received: by 2002:ac8:598d:0:b0:536:79aa:de1b with SMTP id d75a77b69052e-53679aae196mr67975901cf.4.1792486567660;
        Tue, 20 Oct 2026 01:56:07 -0700 (PDT)
X-Received: by 2002:ac8:598d:0:b0:536:79aa:de1b with SMTP id d75a77b69052e-53679aae196mr67975511cf.4.1792486567117;
        Tue, 20 Oct 2026 01:56:07 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bd6besm458394566b.56.2026.10.20.01.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:56:06 -0700 (PDT)
Message-ID: <58297c07-c94a-4a02-aecb-e0807c432a51@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:56:04 +0200
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
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sda660-inforce-ifc6560: fix
 ADV7535 interrupt parent
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
 <20261020-ifc6560-adv-v3-1-5da1a33fdcbd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-ifc6560-adv-v3-1-5da1a33fdcbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0GULeWpaiByhTxQGpN-IzCugfVYNXurk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfXx4x1KwklC6Pq
 raEjU971wd9lMxzMogLH0M7wgYZrmJaNoJML4bB59vX/fZo9TtD1xbXIYeKvf8hVxdhZQKY4C2T
 ly5nGfRurLsC+jZQ005xn5FfnTUfRqo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfXzlRBkBFmwz6j
 uj8Bis0FE+YqLabDWchNvMY2zhk1fYtL3DyQ41ih8lmgrcWcx5DneysRm75R2SAqRyI5U4C5nRQ
 ZzknXhh8fKB4dKxnU8u5fJZw473WvZZXkbILTgx1q08IAZ40c+QVd1K6UzLHME9tL4grXwRXStW
 9XSfInjdXuak4oajOSb2xcW4UsT32X4WdiFVZKWlnEKdFeCBGm9eUcdMuOaBMzSwRDtLAhHgf8X
 g1+tACM6pOr7geYSJlE0HIdTYRdi8y1ygX4RAxnsfkzAoHevXMKLXJsYe69NVZzg/qB0HgSqfsF
 Jdo2wiqdTAUna3HidtzkOytkbXNPhgjBZF6nZUuRPL/kerc7m7La4P1pM3zNBwaJCebVjALTCMx
 pz4VwmkTNm6TS4umrcNg1Tds1FX7+UnX5iRVHArtGinpKR1ir/5T5hjldvQRqvyRPdv+9sEqh6H
 1MHdGihnMKhCaxpkN6w==
X-Proofpoint-GUID: 0GULeWpaiByhTxQGpN-IzCugfVYNXurk
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad72ca8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gQ1mbmYKsGZDk89HBR4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200035

On 10/20/26 10:44 AM, Dmitry Baryshkov wrote:
> Probing the ADV7535 HDMI bridge fails on the IFC6560:
> 
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ
> 
> The bridge's interrupt line, HDMI_INT_N, is wired to GPIO11 of the PM660,
> not of the PM660L. PM660L GPIO11 is LPKs_CTRL, an output which the
> bootloader drives high, so gpiochip_lock_as_irq() refuses to turn it
> into an interrupt and requesting the interrupt fails.
> 
> Point the interrupt at the PM660 GPIO.
> 
> Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
