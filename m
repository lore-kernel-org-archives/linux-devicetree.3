Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D724F473D
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894235; cv=none; b=APnJAMJTaQ7hwVrYsv3l7i6+spqo9JHB21k6yASxZQ/9/cpegXkI40Ta03y7l2rBmvNl08B4874UraaBzTMKZBmGoaS4CQNQUomI8OarRa6exl0tm8hFIY53T5JRVjLN8feIYPmRjU2fHCsyvvuD9sP032cnhHNwg7F5xyDWvss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894235; c=relaxed/simple;
	bh=lDUZrXI4ageL/14i3JPc+1VGuvQ85xf8ByPYGgCshwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwKX9FEI8L1JHgidmvRZMtoJ1APub2oosEk/MYPzk+191+GdUWVphtQ47hv+eyZp00JIuHu5OZz+adUJbugE4+Bn/DdbUusAfoY+iZNMJhfXCuLdeuvjTg9BEg1ABMumkc4VVR1Oj5tnlCWsAcRAzXg74XAFiV9ab53Yy66vuuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gX+0sRyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSWT74YE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gX+0sRyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JSWT74YE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DBlpG73208403
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CrlcQxNH4MH9uiduBnmx2EX5npg4ih1ZTI8/FTCX8UY=; b=gX+0sRywB6y2e78U
	E7iydsJL2KE2BYhKpEIouUPpyNNTmUa+Mf2yjwCmZjOjyXXILhALwtfpk089wHax
	EGaVSgvNB+uLzk42s5SNMj9ED5Afq54yVvu8Z8uIA/mM/cUNz7456KpDHTF3lkpa
	QoYUUvQbdGOXbq3HxB/u4fYNG96KA7U6XUt2Is21TpsTTmk5iE4GRGDsXsPeWQMa
	kfjuA1yH19bFRCfvrxCPyoTq95aIdm1EXnjx9ysSDxwh2ztE8Bcam4Ftmt0pM2t/
	h3Z2CBUJ75nzPYIvqKRG9llnCJH69bG2DxtckffaowMk7wrWWf/aLxTiwMGHT13y
	r86lAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjhe89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 12:23:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338d5d0509so6504881cf.2
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791894233; x=1792499033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrlcQxNH4MH9uiduBnmx2EX5npg4ih1ZTI8/FTCX8UY=;
        b=JSWT74YEBc80Z6hqemDgfVjIH9tHdo0E8tq3hqjFqWcQTS4QqMXs67JnragmV5UxT/
         mpexCXSVXjlP64NzleWmabSGlTxp1mMgdYuCX7TbUVCn8P07mJp3tQdkvWrBZuOPR+FD
         RKT/EzmB3NuEcqS0njU3NnMVGJD/wVHvGFbxAnAohNB3rzJQqX5SPhjR8VFSjld8kkcl
         HU2z5Olo2zxgK1LXMcTsp/48Wu2tSvIUQGu3sGbm1cqG70NrhJ1glJKr4MfRw80o3Yvl
         WaJljtP2aHdXw8THD6OtuBSJxu6DYWpVEmEcx3YAkGz8dGIxuWfCuKJ76Mj7wiIlZlob
         DzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894233; x=1792499033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrlcQxNH4MH9uiduBnmx2EX5npg4ih1ZTI8/FTCX8UY=;
        b=xdlDTmZ8JIiL6xtWQ57G3DM6tGhnOIbgXf+Zt47Dsp6VhTE/V8YXAERHhAJtfwEyLL
         kCSXJ3wQW4TXbzPD64Z9exizIFT/d52kb4+XIhIRrRlwhopvgcx7yl3IkDOcvVSIbyE+
         KFkVabZbNWMNT/bc95gPDuxp1o6fWBtBBBPhzYmhXzkIUgb4njdwJq6YPT7Zq0Spelmq
         GgBLyj/Mnoaza07qJlBctIFVF531kJkBKq5n6ibehIS2x5oZhBgylOcciORs6++QHGkW
         p6XWtTbxBGzqtKCtu7KL4qqBaczZKCnnlHl09IcICsVC63ihCfeVcnSIk91CWGDR2ktT
         ScDg==
X-Forwarded-Encrypted: i=1; AKwUvBwLH1QgbzHzFdQ3aubRh0Iqm5nQiXojex17Imtzgn/T0mY2XrdOdILtKuvyYuRdSbPRrSr+KovAAIni@vger.kernel.org
X-Gm-Message-State: AFq9FYIDLoRlXfdQFqCSAYbKCSE3dl5gs96SdCy1dPjLtp3Wq2ww2TZC
	/OwLG0MKwhr0WhZvR3c15zW7mCFS/03T3bP/rNAUIe3k2Nq7Rz54QI9enbMlbTNco/k/n66rvZM
	FlXlAXX0p+2Efrx0meaWnJOA8Pkj6+LIzvHhg0mpHgqjaMT1+o3Z2OARyWUqIuPJk2WxBcu1p
X-Gm-Gg: AYBFou0wOvO75xNztMCoBXi9Irg4jECvLjuN2tC8j41SfvzOWvNm1nJHRZgtWj8FiDt
	brLysLoYZQwY87vJ1S5wI3wMRBYZ5aMXpPATVq8m/wsnV8v5Z8l0nuhMte3zaKQQibMorywLQVp
	78IujC3P+ekuMO2bE37spFrs75PXK0k5nWRSKtlnjvC0Q+BKr0NqPdhDqG2z6gjQFVLVagrNqFH
	sPCN4PXUM2eQ3QTVZaVSB8TxKxj2m631MqYej6zXSi6Yi/4y7xDyHXDGdtTfvSQh7vA89aGAdI/
	T4XE4ZJbpnF3KGKV+JTr8ZGMuvArV5ymdmnbB/GAIl3zG+9YqRrjjBGF7UroAjucu4dhvSH9hjY
	UCDLuV19wYo6el3NE+ZlGTA==
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr2307008985a.4.1791894232731;
        Tue, 13 Oct 2026 05:23:52 -0700 (PDT)
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr2307001985a.4.1791894232143;
        Tue, 13 Oct 2026 05:23:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm598078566b.74.2026.10.13.05.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 05:23:51 -0700 (PDT)
Message-ID: <4b630483-4699-4802-b036-fa4968c7032c@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:23:49 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: Enable DMIC4 and DMIC5
 on CRD
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922101550.2216689-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922101550.2216689-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Iu0_oldQU9wq3Qlz6K5AuzgAW4DLQ4Xd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX84B2lRPaL41P
 g/hmZc5b7Qanvwg54kQBcqp7fXCliPeMDRjjESidO5MUmP3qlB1Wh/WuM+6szQrpM6EeEDe7n4Y
 pYnU3aCY5JEZcCUA49QyRGa1sriwF53FfskdLXseknyKP5pEJrA56+GO7JRjzr8onk9vzMKy5gq
 t3cSLbo4W3fLh58MrqPzNlIhkqmzdIDob5DLssZGxQoiDFpeWgeSox+H9XO7nI+/DF5nT2oxZxM
 ECOKnj45bVvnP4qciy/583UWO31VTw1wRwybxgqJzBQVhu9b5Puvl0Sq4Dzge+uuRGYmzKMbvEZ
 ZYvNtf2D57luAR4pyu3puf8DgEuPG8pyyfb2Gk+Ma51OkxyWkxpz//dg6qRWjiMPhCxutQvcHPb
 33r5B5xg9LwrXxTKnm1l0oRZqXVRYwLlu3NAn3f+dC8bPBaBOXemrlqFaG2jCDdjDEFT3gByNmM
 xonsVLEmd2ifnd1FXlQ==
X-Proofpoint-ORIG-GUID: Iu0_oldQU9wq3Qlz6K5AuzgAW4DLQ4Xd
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace22d9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KGhTxkWfJfEZ3ort4-QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX1Ei81GuHfabg
 Ao3Bj+K5kH7X5e5JsgxoPpgIazo0Cex+WVbWCWZXh0I73rzGw2NVeTpy6DqWpuM6KlpHKVCuFRU
 V0aQU1HKbWAA4eZkvIBLgcmiUZuuRKg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130049

On 9/22/26 12:15 PM, Mohammad Rafi Shaik wrote:
> Add the LPASS LPI pinctrl state for the third DMIC clock line, which
> drives DMIC4 and DMIC5.
> 
> CRD has additional digital microphones connected to this clock line, so
> reference the new pinctrl state from the VA macro and route the
> microphone bias supply to DMIC4 and DMIC5 to make them usable.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
