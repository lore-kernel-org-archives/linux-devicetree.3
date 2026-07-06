Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2983F383C86
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348259; cv=none; b=MMf2e9Zyl4iq8exe2lYm1dpFJYrLdeJnQ7sW+wGCnbfuqE0aiLc4TaQe5FJLE/vPRQUonRmyJSzC8TgN5/kBX47y3HUZvY+ogH56FnfIpGBrS7M49EGDZxIt6cvm0i2MLaUQyd+7MkCP9ck+B+FRKQ5EISYMHwPn9aPKYvKdB/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348259; c=relaxed/simple;
	bh=fGRZgfyktIZa6nrYdXwMCIRk9/GC2qvnAOqfTU1xNHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TblbGWOYQHu3No4Fx1nsSOcTAv31P/eEI/ZjhSB3+SqOs6f2+AVL6EJahcqG5E4eAl3qb5tlquamfOMpFQyo1XvbFvZorPakYbPmtvbp+pVLj6dEcMlta+YOk+TqDArSwH95IKwyCDz6/MYmR6d73fjqUtfKTW286JdDvUDvDw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEa4xGkT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Az03moNA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEa4xGkT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Az03moNA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EE4Gl688013
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 14:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JpepJLkzvQaByyLi6MquWEF5
	0NdS/L+HXTIG51Tw96U=; b=NEa4xGkT6mSsqJwhQ9wLqgGYqP1vW16YD8GPj3pO
	h3iNRSc9B99d6b3jwLn14x0Gqd0gLGskcr5CJCP0JREJtH+SNEk4yLny8OhTNZES
	jo9FHROizhB55urhSGEoBgdFBLyTNw+EWJUY9XLOFQ0Ddbf0qqXF812RXTOtgWT5
	TkBbfwoNBBWM1tWDqfq9KHaMs8ATVg8/yCK+/4Qr08fE07CGp8ORscUuq8P3fIbx
	cAO+W00EbmCFSPku4oOZGVxrq+f0zBZf4lDkrmRy1hxUhVLbWfkeOu4QaI27Xblt
	qU6MQzQtdaBBw/fiHetv/eKW/fGYw9vefKag1gSFXKqhzw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98h39x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:30:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f39a46efd9so46439066d6.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783348256; x=1783953056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JpepJLkzvQaByyLi6MquWEF50NdS/L+HXTIG51Tw96U=;
        b=Az03moNAmwWIHXmUQhWPYxkjU8jAvNLC63hiv6noQrfeGrNBd//wfkvNnC58QykEzO
         BW4+tuRLvWE/V2xOVs8HFkAK6aXvgDuMlVlISaRAGEkd+oqjNTU41+mxcL0f86tYr73l
         Ry0CQM7q88av/Htune+dxhbuEku6d2xORn8PlEoqQG6cYR6cL75xkpuafM/I9qzM/T1g
         Dp2/FSUZH8ZrN2do6VryxLzfct9G3JyDekFYRqV4j10aH9RdA2plFBlJWNXhKryxgoZx
         1MOvO74Wsxt4vyDLzkatgF5FvbJNolcf2EEFRmz4waxrPoo0CKyUuapfiazfT1S9trYv
         XvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348256; x=1783953056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpepJLkzvQaByyLi6MquWEF50NdS/L+HXTIG51Tw96U=;
        b=PlJpLwUjSmbzETKLY/QFBzbxfgGuROUmYRTSi6GAsXZlAyBW8GiKGP/+3xcwJ2KNGc
         YPb6dvQOtGILk/0iF89WZkQIaovWt5DiNQJqPBkoTCHChwr0tp2E/MZNWmQ6L+YX+68L
         1I97CmR/zpJNPyf/VludaUZIUo3ft+2e8VKC6M9FLZFKQeNY6UJ3pIfEFqUyGhVKDvG7
         Z4Fal8uRLalgZ/5O03aiqvMsrmYnCngr7J1ZCBhl1HuAN9t68TOwzHlay4EIrbrxtsgo
         go19pPTKFp48wfR9KIMTYkcbw3+ET61xgCxq71xTfizgGd5EK1eINgHaSK8UcMDabX9z
         I/QQ==
X-Forwarded-Encrypted: i=1; AHgh+RooFfYiSeNRgTuDEmBTxSuRUTCPTtCEEHKvA18KsnIvHFKZ9h10lmK0ITJ7j8j9ikrChzlmcQfn4cOc@vger.kernel.org
X-Gm-Message-State: AOJu0YxZYItCIr8Oysz7Y5RdDQAIjkTaDkmB0R0BWx9gWHDlHxwXb0XT
	ovSySTamuemFbIl9euqxTodVeKT59+OJqzCAKBPzqFawf62ReeXfFwUTWAAt7WBX83HLlftagID
	VxdOkzYXS9zq7t7npoU+XxKNsbEElejqvr305SYvac0bqRpPV5gdEp0hTVHt0V77Q
X-Gm-Gg: AfdE7ckWgk2p1X1uZNB2Z45YT+nWVWH9I7G05CCa2jO7xQCjmJhrKRMQ0rnI5KhijeZ
	iXi3q7k9eCLSO4DT9xf7Gr8KQI48K2MCVt1l8P5BaubGvc/PyFUc0e+2ihbZ4AEbUYN99KowiX8
	Bb9gXLNLpNkbUFR8wMS5mKJ+f4e0BWHo92+i4lMXKY31mSNyp9WqcY7mG7F5m79ML52EDPg5ffS
	UNqAgDfw58LVI2wvTsL8FQB5HjBlAxYwFSG50FSVAN4zG3vDF6oesxn8Ov66WbYiU9FqZ1JOaiH
	u/AiN8telUkPCpJXo6qSLeGNArpbK2zlouR6DY/5Mc6xNSd/1Kl7o2fB5IMcPYfaUHUVcttrgZs
	i9wnWnX5yyrB1dIxaWlEtdXQDw6aEZz4A33s3qVn4gkpiiMCc/qhwiMpouBLHPr10plYsaEi3rc
	wR9PwrfG+NeS+AVJgsqY4cij/4
X-Received: by 2002:a05:620a:6082:b0:92e:61f7:5687 with SMTP id af79cd13be357-92e8b539407mr1781232485a.29.1783348256088;
        Mon, 06 Jul 2026 07:30:56 -0700 (PDT)
X-Received: by 2002:a05:620a:6082:b0:92e:61f7:5687 with SMTP id af79cd13be357-92e8b539407mr1781219485a.29.1783348255265;
        Mon, 06 Jul 2026 07:30:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ae640cbsm21084991fa.36.2026.07.06.07.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:30:53 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:30:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Fix pm4125 vbus regulator
 compatible and constraints
Message-ID: <vruo2ekiffrvxhx663fryuvdot3gnixacjrw3gxt3pviqobzqc@llnjkakx65gw>
References: <20260706-add_pm4125-vbus-reg-v3-0-999d78a87b81@oss.qualcomm.com>
 <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-add_pm4125-vbus-reg-v3-4-999d78a87b81@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4bbc21 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=5eIueRZCLR0BMlXBp3gA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NyBTYWx0ZWRfX7SdSWkd9E/gD
 rsAyWOuu1IiFUg4ZijzjjWiVgkhZAL5HrftBCvWeNZWONUF4pzws0GuC0pO5OANytbUX7TYOCxO
 hr6tG3QKeUCCS4jLZakYl8bRU5Z1p1ONrdfnKvk1EW1asnMMQR2+6eHW7MwR1kU2xZb7XeyFJKB
 c1mof5QAT9a91wwowVNXLnkoq6vIDGrdhHuv8nujAt/a4GhXOsqAGadREjjbnZfxqPB3Cpv57sQ
 Eqvp1dDq6H0yyLGSnR9PQrrMQjrFA0amdg+cPNSWDdzbA+JcZvBiKWJLqJFf2lrqQoq9jei9Uj9
 LXerUPwrlq6l/geFsnm0lzZtosKLaCxILZvKj4ifP4nP4shsR3nvpR8EpfVBH/23/Q4n2589jj8
 FksviTXnW9r0nOjqtX6Sty3YuPrQ4NlrGQ8mTjxdD4gQh+KjZLMItYMxH23bnM1cH4cWpzMhvVo
 yXJ7Lg9BoxQN2b5S4pQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NyBTYWx0ZWRfX53IH/89MA2G3
 mD7SIJ4Xy9f6SLu1VYMr/NBQEFWHSivDHIBGo/52uBA8828CJVqwEZsqM+SqN+pkeCF8lYfZQXU
 qtUar8ugFrWlGkKCiMyBgWJEqAWjVq8=
X-Proofpoint-GUID: IDwGBYwoskv0HDS3P_I13HSGvPhnZDnJ
X-Proofpoint-ORIG-GUID: IDwGBYwoskv0HDS3P_I13HSGvPhnZDnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060147

On Mon, Jul 06, 2026 at 06:01:08PM +0530, Rakesh Kota wrote:
> Remove pm8150b fallback compatible from pm4125_vbus and fix regulator
> constraints in qrb2210 DTS files to use microvolt instead of
> microamp.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm4125.dtsi               | 2 +-
>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++--
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
With or without the break:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
