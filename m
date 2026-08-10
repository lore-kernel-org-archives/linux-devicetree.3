Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BE1397933
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345719; cv=none; b=IjkNah+x3LjvG6js9vVdqJ+f2d0NpHl1Fufj3BNp3HPdp9u42HvJEnaxI8IjfbJT1JITU5PAm8kTqKsgs3mRh0Ue5Rg7Y6yyliU1a0hFPUpc2+9WWc3re9XzY54smC9kR13hzEbbzZBC/NO7Q0Fl7pg1KF/YORT3hoCJ4I27tLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345719; c=relaxed/simple;
	bh=rfaqo35UnAQbSuq5negAPuaIjHmCU+E7jJcajSKLFPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhQCnOBUUKTiZ3pGU5W7QSgt3a9RW2WNLckXifbfkL/vg6k6r52mkKm+SHbrLUeMfI8yk0laaL55A+TeyXLM1whRmlr/OzzPjfmXs2yKl7kGZUcp6TxU4bOZOXCgmxgtuEAjnrUZvkc3ItPVzHELybScdm/n4VyiY1NfIOo9N/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ept3EH9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rx14iRE3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ept3EH9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rx14iRE3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5Heml923835
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yYsHAZ961X2PVc3jLn/xzL3P
	CbmTI61pM3ayjaylxrA=; b=ept3EH9dESBFg4pMsxqwWCJMiiibHBPYDePxnKKA
	Kco8cwZJP6lDxPPK6vE3uEyExlllaAqVgrWXvF1jotglgzAZ9Pk5nhejcz//OoSs
	gS1lvr6c+dDzJYb4HTYtCZUw2hI98eFMt0qySfSsnnumlQdhAuxjaNX7zRsZwr2h
	Ke58Hxtrltpl81Bi3aHBVHBt3iVthPsSp1Os00ywMlRWh0zZMOERyQGWfjXqkM25
	m07tB3ogsWdnlQCE43j5MGkBSV1t0SInYY2HhFuLHpabdTWmOwZIlPCUKU3aoxWe
	brumCSBWzgV5/lIGSRsCHP/9uBQdb3XFrrJ/zQLMYWwolQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xs8wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:08:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8b0a08d2so10338991cf.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 00:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786345716; x=1786950516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yYsHAZ961X2PVc3jLn/xzL3PCbmTI61pM3ayjaylxrA=;
        b=Rx14iRE3JGtMGnu6kC3cFO3Z4o/RLPxOPgx2iy/Zm9IfD8EW/beokWE/BJn+By+6CN
         mdO+5Pacghxb7CaT8r+MGgf0++BcHrY4kcb3N2A6lF4zDzj0hiDlkhy8t6Lw/2/hg93a
         B5vZ03Hgq/ROj4tBapn5aiF6zADzET1D2PKw57Gk5eMnp2PhtwG/XAIQInUHz9Q7mSWV
         pG8syJiNMriPMxDf4Pl6kFIoQ2+HthrFl/5RY7dxIyUOi1YLVLzs5pwChed+f/1wyvkp
         XSzAsQfOVbkYWNoVdD4kvM25BbliBHwZ+bKUuvoboFx8lITzrWYksAU/m3kYjrXc2y4L
         gX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345716; x=1786950516;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yYsHAZ961X2PVc3jLn/xzL3PCbmTI61pM3ayjaylxrA=;
        b=KcMRsA4JAwourYCwQQD8lhmAl2bjlIs3cYAJjPrsecv+zSPL+mKwuaEVtS/qKqqlyX
         V27GMZAKMc4hpyrKxElz5Z7HN/M18qeT19aiaNk4F/7vCT50e3m0g3Kapr6JcoXAZ6pz
         Xy+79X1snj2s4UQfR3sBaPdEnvaKfDd+JMKaeXsRtIptkgeQCFxsNv8YOaJb+/+P5WZH
         K8dc0Fk+/NYPWn5DrlnDYeaYJWc7F5cx+EQfWz7rPnGm1nxqPfbl2eu+0wxYuvHUfDjX
         Deh+umt7krdikyYavmUJc9OpHV8UhH0auu47N4nSaXnuif2eQgH81UT7Ik1umn/sHpsK
         7fEA==
X-Forwarded-Encrypted: i=1; AHgh+RrH8OASEuXxhTbfNELjGeBqK/SyOqwIlANHNAJ1uBH604sythrUt9ZMojCu9ldfJccAAxR9nLo1+n8i@vger.kernel.org
X-Gm-Message-State: AOJu0YyDzr4okGApgPmQcTV7VG971fG/oc8Dkfo2lEJu6p3DMH1qZIyW
	qwgTookiPZQjhd9bBlyo6X2y1URfc74H5SkGWuEU5PXguS25elsFmkEg2T4FxHD7pg6qMEViLjz
	OHcB9fLv91r8UKt17ZRTACK069WqZgDpveGlzB+d6tqRv4AQi1wJ8xOgFy0rBzbO6
X-Gm-Gg: AR+sD118bRffLZDhqEC4jKOwC1/b8TKXWvQ8GhsT0Nf5hDw+68JvBBLKhToJd7g4in+
	pAwEJlfEaOuaS/JPC87GkUuNpC6HZoJrRn61Nzu2HvxWqPePpgwH1PEWfADfyPKqjsgtsl+iPon
	6+GzLbASqCfA0lgY0WOM47b91Hq54erdg7OBRQGnMMJCLhFzQdXeIxEX243lktinudZYk15lCDB
	GlJlW45ceaKz8sBjPTfR893FRRd3ihoJJswjcyJ6CyrhCjVkqefyAhA/wGW42NVw9HoM89/sXG/
	HAepGLDIdd/fLAmzmTwZvscuzTQbTeTcrgJMcrcP/9LFxWwSYdHfuPIAywWIwC86mWpB/zTO8uG
	kqIn4w3eiQIixM7x/ZJFPtNn/JRFRS0ZtECtT201z/XOeBtakqhMTaOXV+VSrS1exDZtZ2MoCN6
	YVZhFENHCpoia5Xg==
X-Received: by 2002:a05:622a:614:b0:51c:164b:b240 with SMTP id d75a77b69052e-52ce5f61c7fmr410327121cf.4.1786345716150;
        Mon, 10 Aug 2026 00:08:36 -0700 (PDT)
X-Received: by 2002:a05:622a:614:b0:51c:164b:b240 with SMTP id d75a77b69052e-52ce5f61c7fmr410326731cf.4.1786345715771;
        Mon, 10 Aug 2026 00:08:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055dec76sm1805559e87.50.2026.08.10.00.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 00:08:34 -0700 (PDT)
Date: Mon, 10 Aug 2026 10:08:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: kyufie <imkyufie@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Add notification LED, vibrator, and
 UART support for Xiaomi Redmi 5A (riva)
Message-ID: <7jkbomybaykrwzikmnvuy67y3dmabzqkuwjm2djtsnt7qdwkpo@tueelmvqam4f>
References: <20260810062611.735673-2-imkyufie@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810062611.735673-2-imkyufie@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA1OSBTYWx0ZWRfX1F7buKw1seFB
 yykabybGxWm8wa3ldRRrY8ecvI5UDNGxbN6PG34EQvnjQUMlOipuHLsd6Hk+aPKlH64D8DBygIv
 e5K01LEeZC8wkAUxsFjSuj/ofAt70SE=
X-Proofpoint-ORIG-GUID: LOxyRfZP0stbu86MIVkz_Aolo8SEmFN0
X-Proofpoint-GUID: LOxyRfZP0stbu86MIVkz_Aolo8SEmFN0
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a7978f4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=7Ty-B7y6rTR56lQ-UMcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA1OSBTYWx0ZWRfX1fHPI9DSTaxS
 UT6yQ0ICGL84u3NEpNjwmMnFa2ToAUIOP3KtaEs+uOEw0hFTh0Qpwb6aVmoBEosgMiUPhYk60EW
 eKqOLTJ0uK8Xbn0f5h8IiqtxFiqNggaFXLyS9nQdTIcilI7ryuBQX8W2+koinVGiQgweXgHLU7p
 95MTaydQdVNGQ14eKkpvk6p0iiu9/vFOIBRclebUh1w4trgbpwsjAT5HhaAVYPyb1PjHZWAkiKB
 Mr2CsQvbFdsIaKmsHuDwkAA1pJw0fHoGFPh9Dcf1uKSFtqvIvC29ICctZ1iVHJFc/UyOgUFUecx
 RscEkm4FWv+0iqk3BoDlgwO5D5WrYA/yOz9BtTAbNmZdZtt7qm1EJK83R3rAsfl8s5bsOG8M2E3
 OR/YH/ZLahqqxKP/DHJo7ZYip3YaMu5R8wl0SZMfq4r4jHsb/lm6aO/g2zUKMz7ubCrdrn7uXhe
 0YbMufC1mU3E6KDwB0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100059

On Mon, Aug 10, 2026 at 01:26:12PM +0700, kyufie wrote:
> This patch adds support for:
> - Controlling the notification LED.
> - Controlling the haptic vibrator.
> - Communicating through serial port exposed as test points at the front and
>   rear side of the phone's PCB.
> 
> Signed-off-by: kyufie <imkyufie@gmail.com>

This should contain your name.

The patch itself LGTM.

> ---
>  .../boot/dts/qcom/msm8917-xiaomi-riva.dts     | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
-- 
With best wishes
Dmitry
