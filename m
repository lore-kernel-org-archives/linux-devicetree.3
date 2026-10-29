Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264128;
	b=AJtrEaOla2IfPAxLXT1rfeRZ2U8m7Tw2+UzxaX7w8wP2DtaATg/slTT+yo5EUpwOQc/l
	 LD1ThRkI8TJiuHwvRDDKym/gkSJHLuU9eejfJlQTaVKqLGoPx45mXgEBdCj7hGkTD0ebr
	 G0rPvybNJQWkc+z3vGnZsTyjOIahBFs5eihlSnbIBWAfnhpr/rYGIfPJDoMlqC8Ei312u
	 qOkyhbXSv2pPRRQyE3ljvegAsqEQXE2ugMaXxTvM+sgSXKn1oSHHex1C7lBvqg1J3EVbH
	 p/NjBh59Dke4ql0mwM3o2acEAQ2sJUL5M+k9wMrI/R/txER4iu6SVKG1jueiw56C4bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264128;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=52z90qNXU4fTO2VX++tJFlr+k0DTB2MGrjm0OuMj88k=;
	b=U7HHdTd2G7c2mrUz0MN9TUKh3jmUbssNH2sn7Bg3Rl95AVosQpWLXvQoMBXBE4ayYoBx
	 12CAx0+qTRpHVNLKKL5vbKlsbTSiXa6dBBnIs60nBfcEMNwinDh4DT07k6optaLDPcv3p
	 v9Y3RcbIhLsH/8iuQm6SUz4XxvFls8Bzsu0AMacHSg2v53rK/jYQ+kqHZ3ZEFWaQkDmKP
	 mz8soChpG9ItpobSu+Jb9TgzKLfavPe6lDC7a1LtaNR00FN47PaJZwuffDRiyS3gtmuD8
	 qu+EGBEDw4O32kdNSFrSrq7mgGWfeCO8qOGpU1cBm2wULE8s4alDi744nGb6SXw2sFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="orN/2GPp";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XYDSRqK5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86C6606A31C
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B86C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=orN/2GPp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XYDSRqK5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HEJ63889717
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=52z90qNXU4fTO2VX++tJFlr+
	k0DTB2MGrjm0OuMj88k=; b=orN/2GPpMTDSoklv1RrKjncnRQGMGceGxuLJxmJN
	MrXUBz5S2h6DlIPE5TSi4vK0mt3fKTjwZtLzIdhE6fMzsI695bOUxY1kG1ytKSGq
	hVkKcMguhoYUwE4h030++C9iRBO2n2W5FRWI236ceKlkuKKmh6XRV5aGAm8OfNTh
	Vktks62Ya6RPp3Z5WUDmoZXx95Y4ROsAHwi1M5lBpV/Gp6nrbUxN1JhzKys/V4CV
	v4iGzT2WCHMVJnqBsAUq2lqS0nBmixDBikCkbKbfezxzk5YntR6U+EaCZfYNUOO8
	9hee2CNn+eoOc6K++S7kL6hN/P/Zjf/nG14SX36/T+Kk7Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc2qms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:55:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb93c874bso101405385a.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264126; x=1793868926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=52z90qNXU4fTO2VX++tJFlr+k0DTB2MGrjm0OuMj88k=;
        b=XYDSRqK5KzB0tLzj7IGp7RoE6isFaFO+UC1JrlwzJRWlyTpmb65AAigFfxJAhC96vD
         zWukNgTou1GCz7TwFkIqo8lAaBiYLmIj20q+FzE6Iq5a5gYCM7hAeBulFK8pbUxfqunV
         GofGMcZy4jTwnI+sj7Gp80ckQgoq1QZ/ewq/WQj9y1albk4ThCLURX3hfIRAFv1Z1LuW
         1gkFxnmyO94QQ1xSROIqKiiKgxjZR7w5fIOZpIRdFoy5/e95rp/26PMCP5r+lWmQbC4Q
         l9HHfu72JB9HaCmJ877yGKgiQAg3RYRNHrlVECBDGDYcRZVDRwcQNXtZb9XPC/eY5k4k
         6zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264126; x=1793868926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52z90qNXU4fTO2VX++tJFlr+k0DTB2MGrjm0OuMj88k=;
        b=SSGfMy8QmhB0LlkBsfqVUcMcvgnLMyl1+9bRO1dLeMS4s1iX7yYXXCn4X6PJmBuYf4
         BbtanHGrYhADqLi4fAfIaqNtzlCiHp7ecXX+wzVUXafZcck4U1tbpC/9ng5SaKyngcyb
         ZHe6m8V2CIfT0ZX4CVvIK4CJ2TdcXr/h/H2h+d6bwz9Wrle1hXvifuduabOvSHuc+LbS
         swdVlP991hvJL09EAeOKkbMKX4wu9d7r7IHg/Y0j9Q2DBJjrcHbffcqh8XUbVbaJgoUA
         0ZypnzDDM8EVTmJjciJY658GcBwLu6707kO/ThPoPQIEsVewYdVzuoA50303RuKKT/qE
         Vjkw==
X-Forwarded-Encrypted: i=1; AKwUvBwnaLcnRFjha2jMn48lAU0SDROCaAkkN4wFlPRO23WtZzCcwvdLwkzUkgosjtmCHHFjimcvN5DzTyDH@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7O1XhHHSAJHJVgOnAnrVSfNlf/YOyJrMeQDn+oiJUgQESpOMD
	W1tnl6LHC0gBeN6ctGXzSPv/+OqT6+TjTp5ahO7noHo8RTcZxES7MqAUm+hkrhDO2Y+++Y9F7YC
	VJToouUOisqqY6W7WYISBGbT5el3kjjOofqoTXevZIiGrV4LMOBwvTFKjfpvEkMYB
X-Gm-Gg: AYBFou10/rUlc/SfgNPHLuXsTiXrXfpCkXJDrqSftqTHbx0Co65nKf5ir2v3IkoV1sX
	BpIyEpVhp6TDuE/5ccT6XUPwHEj9JYb/VaW+JwC3C3DwYxvC3qHRyrW6HQ3QzzDeAIvaT+A/TAW
	Xp6y3BX2/I3FvPfMVlL7OQ4KgKZD3JFSZS++9I8AKmZpdUt0ARzgwG6wnL0QPxNLoVqXHMFK9NJ
	NjrP2pS5mfBTbHM5gXkGKsj1bNaJPWe51Y5x5zjfXFTjYDOViIoBt8YBZwYfKREqJaHRWjPAmI3
	ttKu+RWHW1keat99Ni57sOsQajRMhMJ22XBRk7kG+VQxg0Ev0muFsL+DfRowFc30AybKH+e1lt/
	taYY26wD67S4qiUumxOCw6hDJJwPoo/s2Vd4sj2HQA1idncQBAeQOpKQoibPv+F4/
X-Received: by 2002:a05:620a:2815:b0:944:6ad:1b7f with SMTP id af79cd13be357-944133c303emr256648585a.32.1793264125877;
        Thu, 29 Oct 2026 01:55:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2815:b0:944:6ad:1b7f with SMTP id af79cd13be357-944133c303emr256646485a.32.1793264125336;
        Thu, 29 Oct 2026 01:55:25 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2950sm48686055e9.8.2026.10.29.01.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:55:24 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:55:23 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 2/3] arm64: dts: qcom: nord-ride-embedded: Enable
 eDP0-3 display output
Message-ID: <g42dgla5pdrswflwlfnddejk3kkoasdooecbiwq7zkdwxzfkbv@c3zanmmdyzat>
References: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
 <20261029034728.633495-3-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261029034728.633495-3-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae309fe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=N2KePwhmbMOsMYKRcNoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: V4jZx46zANGocQJZcxdxlb9NjXST1u1f
X-Proofpoint-ORIG-GUID: V4jZx46zANGocQJZcxdxlb9NjXST1u1f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX1KZJgdud1ww9
 z5n9QAEc5BD8iEe4atdqr2LN2iX/hrFo1gVZ12XXBdXM8+JTg9ppCnyYzLW41P4To2u5CHd/qDh
 7noDl8qHKJWEfEvwj9V1wW14cvDw8D9gB+u2LWchgCKUDLwB5NlkzF6ps4HTahr/SRfdaJl07au
 0Px5OVziM1XwwELLSTPkv+PwqRKTz5cGFQpjXTHlDcGQrr2eXKv1nqiz7gTHxZZRt3ZXDjzoSnB
 wj0sG44iFEhx2A0c7OUy/GtgU3obUlOuhB98i6fBHxlth5D7omMWYV5LBm8SKxtkxRYnJP4lBS1
 PhHtCrbdoz1DGyO4Z4+P7sQJVJHE9ClIMhU5AceyNlNR69TCmD0Iyka+jwg0sM7JoW7ZUEyTm7g
 7jXkYRy7iri5Qr/y+2ReePDGEi/I86eYYkRCqHM+Nb7wyfxOoP+2NHHjrr4jGoMjc1r/kgYcXPb
 l2GTc4/ZsunNtoQcxbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX7ZdcTP8mFsyJ
 UM9HdqlZkLdCbK/cXtCSquvAvVEOJEhehyOjqhY1dZNEnRfOjoSXyPGUkuXyUTTY+1xeJz1ONbU
 7cu+wmQBLJ+hdForF1Hza/NgqqhG7eI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

On 26-10-29 11:47:27, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Enable both MDSS instances, the four DP controllers and the eDP0-3 PHYs
> on the Nord Ride Embedded board and describe the eDP0-3 connectors,
> their 4 data lanes and supported link frequencies.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
