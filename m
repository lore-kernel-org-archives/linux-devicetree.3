Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDE83AE198
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371600; cv=none; b=WbYWti4UwhXiHw3Ghj5cgIndxaz2miaDHqKDR1S4IVSD154BGjPMkaktQEtvr2q6rYrly0TcPeCS5mW7F++CBujXQFU0zjEYzse+U8hcK2Fe/RCsFHKT2zBsEyMaJs3SBiTYQru+pXb6hXClqScthDxvxECQ+Ye/1xl8hVw808c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371600; c=relaxed/simple;
	bh=PA9QxTqfPI5AOn0ULq7Lt/rNPfbVB4JxJUnXxTA46ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d374H818yh7QKFWIDuCqURRHN87jjb4ff92mDMUIAF6n3nfkzGn25tc617+E99VooYd2OFm6s5Bwknc0FtqHLbVureLqbQSubdtv7buAhQMVEIhYKsvta+XEDU3Kam+v1/28afy5PBvf0oN39w324PCPAhUGLiGfZK/ojiFnt1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/P4zDaB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNSUq3qF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R/P4zDaB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNSUq3qF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7S25w3351624
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K+YUuIr5Tzjda3UhHIE2zWes
	LU//5JK3mNvRXp9NpTk=; b=R/P4zDaBwH8QGg9osDirvquVJXoevo204Bgg5Lk+
	m+s18Pfni1VtZi6DLQocuavb5u2mx3goX55jzziUvu3Fb/lPA2AW4P1dgWdRTZ40
	cGjN8V1LINmcka7fsw2UjlZhL4/vlmY5+CAi3DH0DnEuC2TodhkIxe3FdD3do5iW
	FiMyODkLsFasU7X3EnbGJZezq35i52s8nfI2AnMqR3wOW4nQM9xk5D72SAzJvnRu
	6ZVH3HuKZnpjuaflmJ7ENxMut6Y4W21QT4T5gc1BBdrnYFxpdJFsgvGOPdRJjgY5
	cg7M260F+buqqj1C/kFqE8L+M/L24fRLPui4FIviXsBD4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg01ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:39:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0050a554so471212085a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371598; x=1789976398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+YUuIr5Tzjda3UhHIE2zWesLU//5JK3mNvRXp9NpTk=;
        b=CNSUq3qFv5hqKHwmExD/rd+8muG0G7UaXBD8zKRTz6oABpz4AvRvzBC4aQAJT0F5ha
         6kAxhWXeXTz2pY0fxXchCduUnEva3I5tjilOXrG+ACiqcg2S4RZB1OkhyRxXWU8dYLMq
         QxL1m3d5UezvrCTx7bT3mNMxBP9GqZN90asX4MfH9FsGL/nXIFvESKMI4+qAUVjO4XsS
         dX70LCaQSJpK1kO9GzcUfp8MYmxrFHKzM6lF3NTejdtb83z8vt54v9ygvHlXBnN9AroY
         r95P2ccECc+P0vwAngCfUq2BLchF3lap0qSvupBv6wPXMz9aDWTO3JoKmAylb1UZGwPn
         ul1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371598; x=1789976398;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+YUuIr5Tzjda3UhHIE2zWesLU//5JK3mNvRXp9NpTk=;
        b=Z9YFBTH8fiVOEFm285JKL3VhSSVIwhE8m1gKxygoCf/bh+XO1f/0eoh4cQJ3LouwAg
         zuy/zeMqGyHqkaTlWXQDeQLQNXLkFwRsA1Qvt5XrKZzc4ATL+qK0dQOA6eEx8sfeCQri
         LHsD/HY3zw4oDft7lIyLs8dgWa4Tgoe8zE2oAZlGe8cdMKqH5uC2XPXa+SKhPOv95WsA
         kUlHuaJFkyJpkk3G0Uo/O0T8M6NSq4qD24fUEgdz908VRaYgI+kfKmJn/vwWhG4bi4BQ
         cfAYMluOHsArjIB9NRbZ+KcEQset3BK29Ts+8Gh1stb75qxgnC9Vg+9asff7Q5pBo3S4
         RnNg==
X-Forwarded-Encrypted: i=1; AKwUvBzLUyd/lA2YO0OV8ahagPBXIzhjfhTbM2P5OAibRBOFCxEC4l3Nk5F8UjBAJ367LnnE11RI3JLgzQcI@vger.kernel.org
X-Gm-Message-State: AFuF++nO8yi7DLG3/hAXMpZ4KV3and3nkacQWKfUr1hRNg0SrGZ8qi+O
	ptzSCLfpxEmZco7K+VV7GjW2mQHX2P/1wXiJbloXTXWHVYxoqwHMRFjCn/FikBVEwdrsE48XZyj
	86Eb9woLNeRpPqOd8PxWxwev78Pnop6OFJ5TP6ziuCKDxlsXHErSgMQGsdXYdKKRO
X-Gm-Gg: AYBFou3esyps9tlJ/yq54PBvQk9JZL4HydNfw38TYLiDu8oLKAXEgulPWYi0znA5TUv
	yKDEswBQo1E5Z035REnEb+FRWVyTn/zOHfmDss5StgF4GGb/IX0tZhYBxvw2h+YfaAUdPE8adp5
	ztpD2vdPd3Es4vutgg+VIUXd8YOCmVDKxioM6Lni07kqGQyS5t6s1gwsO2YMCuMrPd0ByEYGrfj
	GG2H3X/JHauarG3fg69LpFOqJl4ExgcCEKylYFrYjrUXEnNI1HNY1E0jXCsb0dISIU7F+e5tEVc
	zmnD2UwCQuWZu4qVPxVKpKT6bk7CH/wEGtjY305gR+euLrmdqA0tYva8SpxovUeqvJRI+Av5iwv
	QftkKheE0bIKrMA==
X-Received: by 2002:a05:620a:4620:b0:93a:1101:a21c with SMTP id af79cd13be357-93a299f084bmr186909285a.25.1789371597483;
        Mon, 14 Sep 2026 00:39:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4620:b0:93a:1101:a21c with SMTP id af79cd13be357-93a299f084bmr186905485a.25.1789371597010;
        Mon, 14 Sep 2026 00:39:57 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e74esm25016368f8f.25.2026.09.14.00.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:39:56 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:39:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 16/31] arm64: dts: qcom: sm8450: Add domain idle state
 names
Message-ID: <6pm2ghtt4bfjq7js3bsgjwuer4syforkpvbs3ajtn2josua4r6@3znsj5olp5tf>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-16-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-16-660c31187819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7a4ce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 6r7zyyI9WjN-DQIa4tU0KAsD_uz0eUWd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX+qdq8MAFpMFx
 nnz/6c/MLSUvAfWGHKe6XMLuSX5mbUqi4JtT7aQ4h4320N/YiYyhOZnxVCkrwEZRDHXBU7D7Z2o
 U0Y1RmvgwuxbwRyl6F5DLpUsolucjBc=
X-Proofpoint-GUID: 6r7zyyI9WjN-DQIa4tU0KAsD_uz0eUWd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX2W42e0xqfoVO
 mZKjvcU33e1kC7UKz474tuJtNwHR5pLEkKwsKnKPXanSAaF2L7nc8w3ksW/59Mdi+orhy0MIw3+
 uTuk6vCokJNhPRt0jXNsNfV5CYDw0FwtN/WgLXr9akXZk8nD+WxAVcUOQe4O9/51dUMbRHSKiEg
 rIYTNlejruYfRcCPX/MhfL47KXYtR+nZzaKKSh4kO4dxtAUfIwIsOUwaLub6S/c16NfcBLhXwex
 0e+Da7uBEcG0rT6M1Q3L/0KhXZm/JTP1VntujPp5UTDbbVRKSrqM8UrPjNnYM0O8vAf7zK9saXp
 445bELEK4F6/i7STcBu49PwWf57NutMzI9Sx8kGuHaqf9ewaD6LbEL5NbuxwOzTAFW0aQyKYFQp
 WosxQZJv5QdawxDSlmq18Wr6kcorNeKnfE2/BHitGjPYtzuZiQpcuF+9xe8QcgdfOJ0YCaxGwn2
 W3RmfRBiOGQJI0zp6CA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:48, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
