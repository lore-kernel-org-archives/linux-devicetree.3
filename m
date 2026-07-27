Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486C841A904
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160789; cv=none; b=u6c4wRko5VIq5datwqQ5Vu5f9DLZjZvzSmMD67CFkqyn89hCn5c6fKjmoi6WTYX7k1xTTZViiHU8PAWqDPU0ec7jh/zS2EG8LAPRyIDIALNF16VJTb45QpV/gzQLVqWQc18toryf9YClBqilrSeQb2UDM2etpdQXifPVOG00QqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160789; c=relaxed/simple;
	bh=esRGRTb8ZG79IogezuYqIV6Kp9GKse/U3um4WLbcgIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNAPHVN1Byd9ip4eK+EUmB5S05ikV8EHjyCk7nAWSAed/2iVgsckVTC3HZ2Q/mjHG3V6aooAJyJVR6q7dox597y7rspbaHxsIjDMaBZesYXEV/hg8C2JT57WWQWrS1eMPjwaGag5pZgBlVzHtfbOwtzw9NBuUBnzDFS443nzZwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RDC78ouC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f7tnRDML; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RDC78ouC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f7tnRDML"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlZ5u4115070
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vraW4gIu1Rib0dQnAHZaMKCf
	cAcoUn73+F+RRFpCjKc=; b=RDC78ouCmrG4LvSwg/YiudSjJrG7PUzN7W8HOY/G
	ylujfJ1IOvidH4Qb0AYieXeTgC0kvL0NTdK5Q15LEE9NOphHMUAZmhOTXTRLPhaB
	8B5BTfUpATMVyw8b7beThT2HVEDrg6yU8ESgSiPYXFUsyAm+JFU2xeFBZMYvR0X8
	l/d1Kz9ixbfSayfNCjauW7nXLY8nt3agi0zsEg/R6PUvB6Q54FrojozdrbverR6q
	cUhE7wYlDU+nUdgCs9LZpAFvdNAMYOcWV1gOLWYw23a8o8lKW5qsuv4RemERSplM
	99q4gJVDYttytHIUiSaS0x1PcIc1SxgUHQvevuKEOgB76w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrs1e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:59:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0e702df8so33547481cf.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 06:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160786; x=1785765586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vraW4gIu1Rib0dQnAHZaMKCfcAcoUn73+F+RRFpCjKc=;
        b=f7tnRDMLgqJcheF5HJjtnwGbCRFOWLzuCbs4czU/cLnGi4nNr/29FWmbsantBB+wn1
         Peuno70+5Fz/JtSkxdB1ZI5v9Gu7v/3jKyaUuCshLjVmgUyQGM2TPR8njKZbDUnAT873
         dqbwS/17NCPK9Dskc1GagEBoA8TqWFcxQrDGRhv2kQzQYdFgGNHRHIEwMORwRefTn1aG
         jx4c4qwxy+8D8uQhBQjIAUY0s5PRP4/FmhINmI+hh+LbsRLTeb3qc5tNVL7lclA0h2Ko
         vd72yYW0FDni/aSLDp9+a4jt1U9bEiuLh8Ls7+GRomrGUfOnTDcd5RB8p18UDWkQBzv5
         3KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160786; x=1785765586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vraW4gIu1Rib0dQnAHZaMKCfcAcoUn73+F+RRFpCjKc=;
        b=PNKEte1FfXq1sfrtAnPufzIfW+lmzA/cymrfR2DlpIeXVg+klZzyqjzaYilrgIIDZ6
         2BRPxK9nI+llp4Xsg6dA7fa5EUeW91q5QUcMtRuzPwzR+x/R28cnISngSb99CZBbYhCB
         qXEKeAeV+khG2T/FgtE/PyIXaldKpaEvmaFilDG7xDLXOW1eOHF1OhjTY8ehrcDZ5cvr
         eRs5e6ArP084twtayswG9U6QZ4nayD1TDyMOj34VsGlB7O68LXk6z2+3prUnfGSR3tvB
         XZCrs/feG12002J/mvxtV4afkcu68RRcRCHuArVh8MfyZx9XVeK7eX9aiWzVz/2lXhOG
         77FA==
X-Forwarded-Encrypted: i=1; AHgh+RoBSld+D7TCzPsIxbLMQeNu1FnTa0KDOnlQI3KwMOiSKn6kD3RnAxw8qKL5+Q0DiG95EFCRNGJH9FBR@vger.kernel.org
X-Gm-Message-State: AOJu0YwUgQ818UfC0UKLR97Djeb2SmW3X7ZjlAAwUxdr7o9zg3jak1nR
	R5EO9J2vAKFQQvj1gtSm5sRzgawhV+Ys7F18r/sj9yLXw68jb+QXIVjQ7lGRVqvgsJHoglM39rE
	Tfr+uavgupI5oL6/ZO/eh3++9uBiPMn2YUz3l3vkxOmcTLOKPu0oys5C+vRCCeZIo
X-Gm-Gg: AR+sD12qpkQ1AWoMXwvRF8vOz7xPzGT8+n9m58liAgj+o6Y5DgkRlaY2jUnLPTTQVv7
	8NF7xKPuLNI3SmDdq9n4rj/mqsTht96sj5AbllBc9iBTyeLzItjnnmSo8S/+CG8iNnv4cqX0LKT
	Tztus8xacnsIS1RAWu2aEGixxTFc8SQZhVm9FTWDyzZuf+Yj1ApvGz/EyzGK0j2p6dXfPJKbzVM
	FHBRJuyh6boHVX5TUG5PJwn+HFHugwu72xhhji2f460bbHi4EZtoscQuspp6b5M89SFD3J8mMG5
	XHcWPNxd93t9MTQ6LcfAufQKo9wegApE/xeUI0eUGSiWN7gk/4cXbDrnHVdpM3rvrq8te2WA9vH
	zQto3e5qZalAGUzo=
X-Received: by 2002:a05:622a:60c:b0:51c:7b12:5fe4 with SMTP id d75a77b69052e-529a8870affmr76633471cf.80.1785160786438;
        Mon, 27 Jul 2026 06:59:46 -0700 (PDT)
X-Received: by 2002:a05:622a:60c:b0:51c:7b12:5fe4 with SMTP id d75a77b69052e-529a8870affmr76633091cf.80.1785160785879;
        Mon, 27 Jul 2026 06:59:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bffc501sm199217045e9.4.2026.07.27.06.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:59:43 -0700 (PDT)
Date: Mon, 27 Jul 2026 16:59:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: hamoa: Add ICE node for UFS
 inline encryption
Message-ID: <rlsjzz55hshfy5zrc2wyqfrjdqd7ekbxlrdbnpbhzuvhy6lq7s@bh5gn6yfmt56>
References: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
 <20260722-devtool-v2-2-d7e609ef7388@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-devtool-v2-2-d7e609ef7388@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfX+QRNhbygvI98
 75sGmir6cMALs6dT7KEsfDCWfrKqncFMdBsLwtFT+9gjECjz0ETTuR7HbENwgPGTGhU3MM70dBz
 FReYKlincn/qRv3ku3wrZyp6iKksbuI=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a676453 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=SooqmcQUKh5i17ny3PUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: vSX3nC-v_gSIGesJk3mR_8EWES_g-3_U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfX9x0uDL6mqmaL
 wLYDZMrO0A2++b/WD+YbneJaVQuobPJR5Trj6ZnyMWfOMMhYKRVOb+0AiQujmwztrB0yyKZOXgc
 IR0Jwn1G7wBudzmzYTzHmyp2SqKXDx/lvXhSzLQ2uKQ2eSvOt1wLmV0kqN5EmfNfdLoRlT3cfmG
 JhpP6yTVe7lGH5GSYe8+8UgUxG39fqedIyAP7W89A2k11id29W6TLmjIKeCqpzGemvHbkGeADqb
 33DIYZHBcY3q/pwaldmhgzMXZTYqzshWNxKE5g5V2L/6YzF+7xtKYRHBUp9JRpziqRGymG9w2L4
 AzwvM/jQ55ZlCwD0XUKsrFtww1LPTResRAFrg4qwY/Cl84jVDTTbHcNs75W9Ckf6ewL34RG1QQw
 Q6u4spk/xOJqAjKbHz9Lm8AjTBOPPdvohvCBMk/eovJkxwJw9zgo8uobddB+VRRKb+lCvPsv8Sj
 RA8ofrCiDdNOdT5e1eQ==
X-Proofpoint-ORIG-GUID: vSX3nC-v_gSIGesJk3mR_8EWES_g-3_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270133

On 26-07-22 17:26:29, Wenjia Zhang wrote:
> Add the Inline Crypto Engine (ICE) device node to describe the
> hardware-accelerated inline encryption for UFS storage on the
> Hamoa IoT EVK board (Qualcomm X1E80100 SoC).
> 
> Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
