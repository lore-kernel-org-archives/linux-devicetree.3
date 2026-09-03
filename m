Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A3B4C77C8
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447758; cv=none; b=atnq819DYS8K4NEyG/7fJjc9YEedVLNXcR8tFxjli1b3Q/MyfL2S3GU5wyvg2tZpB4glpA1Siq9rps7yB/hEnPwK7BLdAfOvv4uUu10/jmViarV3e7XCKLvV9ieiXNVTcooT7i8RwdcucFVbJevEo1f8hqEHMFUXoAAjbTAORXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447758; c=relaxed/simple;
	bh=AxPbjgW5hIJNKEht6e/FfDCQU+F6mgJwY4mRccMHmDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGIJ4ZVO3+vVExbvEzLdcdJe6ymXrCEwYIcT5NYqekVNLX5oEuVJ63fsLe8AtYnARniowIBz6fa2KEHvBDpClVhB35uscpi+2aJZRzi/+bHFRT22whjvDG7hGtyiP/r16XxRtrxantJkNLm6kosoEu5qFNYIVJUIDWF7TWaLxbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niV6h4q+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLqlOHxT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niV6h4q+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLqlOHxT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DARU7035598
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 15:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VsBOWHIG/eoT3H41FqfAd1L5ODyMGMsTY1eqI83neLY=; b=niV6h4q+H+Q5VhBi
	LYH7QygpAFEOOnqS7RB3wub2fEBMJ3oFOE2NaC+urEeb+PEz9mmn+i+eZNPSjbQ4
	WEisdzwGLR3JnZWoXSH8Y/I3e12kJnT72p/GNgzzw1g+GmX0WOFEL6OutZXdRDRK
	jQvaUCUrtJYGmWdJf1P4CRdihYJcOt15o8l2pTEStifUe26xRfV5u886s2HxbktA
	FjNZtJtlRXg3OOBopv8r0PPps3iy0dti525To8MyBpcJxjaPynNXp7cJiqYoA35K
	qFeJhLbBP+Z3Er9CqjO9jeV+40mXbGWR+ZOY7ZLDz1I0+Jfhv2kmZHf+mpTzcUds
	5EFBHg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m1q7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 15:02:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso16124a12.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788447755; x=1789052555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsBOWHIG/eoT3H41FqfAd1L5ODyMGMsTY1eqI83neLY=;
        b=dLqlOHxTR0YK01ByLDvTGGrhTkTyuIBP+6CP1phTVZAnkXSkmnwQWYXCmcwbSK7cZU
         8Tk+b54kLtsdljknR0dk9hC/GHj8F5kMmyRjl9JlVurLvF7BvEMDTAQrO9CZnRP77NkG
         76ufwCC0dO8pUB7NVCVKwQO1rN2lPSyvu5vY4rNEcd8vfoK7EjvNe+gh1El5Ycp19nO4
         LE6wOBOKoYsK3PQqzHUw0ZATVHEx2ym90AmE7hia3VyRQs6bq25KYU3AcMslEpwC7IQ+
         BcTCijM94Zng7NYA2zh31H/LyMIj061PlXaNaSi1SOeShtaQ0kI/Vb0MibLyVX3m2pT0
         1oHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447755; x=1789052555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VsBOWHIG/eoT3H41FqfAd1L5ODyMGMsTY1eqI83neLY=;
        b=FfaEdQY7Mpv+MgacJ6HcZyAiWKiL4WxIX6Fxb1usuchVmw29mUeyBkAq2+7r+8gDmz
         VXjgyxaDNPfmdpxtBMqgFTcP75uqPO2QoyDAN3bbolTEYboiaDhGw1ct7NmjbrJ71orA
         aPKpKGe0qHd/LjnvrfRnFmfnDKi8jRy5vJ0iH+H9vPy3ALmxC3smHSBlyGPBSRnRRw6T
         lQiVU5QmtMvB1bdkvaIzxmpN6vz7p0rxPN3OMFJ8+FkcZqedMvKQcm4VHniQmzsYTEUe
         /QrSzCvVD390B1crGBkSf2SIM+3UIrLgipj95SqREW9gZ+S3LH39h6axzMFv+2US6HbB
         6yQg==
X-Forwarded-Encrypted: i=1; AKwUvBzNzdr8vZa2oNxO+/f8YXcBoYHDmRjSXmoKuev7YGJmW+cLQAh4h5BM7UDibxUVS/pQgvEV1nMi0viw@vger.kernel.org
X-Gm-Message-State: AFuF++mIXMeF+hwR75mp8C5QyGM1T5Z6zvP0EZn8Rurl3C0V33i3SpLe
	ZJyv3hWVtrPndD3SV3G5CdFHuH2DsZl2814Tq7a1h5W9YtCa0o9usZjM0S1HWFJVO03fj3D2Vh0
	N+FqO61R2Mv7NVFdyeuLegEWDS/eilnZd+wSDidb9TpCmU5NqsOzJaz/fEhAvYc/g
X-Gm-Gg: AYBFou3IzKKMcWlI5lD4mHrXBzrY2S7pTBoU5lAnYT4r9zhQG88NEBmdibGn/GZJKW/
	vm1u9ZZLxZCJq/19UoqWQSIaSt9AbZncXqPxGVE4XK3l+tcMm5haKGrGu4cS9j8p2aZG84Wn5VP
	VZ6bcf/8ny3FCItmWnFKRTN0Q11AFFBp/IOWmOsb98uxR77xZnyJAQ3c9h8xQCtgb82+JGsCy9Y
	lTF1bkWhOtRg7HzYEcXGO2lkERoUkN4ukA2QdVh95ngfpxJM4m/aN5cTGM/B5eDfh1cfVC6poZ2
	s7azydt1yPAPwuiU+sQlw9AYD2EtsCrovbVTha533qCnfyhF5F6p6PIEIFfn/dVvMbWUVvsl+WH
	MzMwN0UdPBSKaDuO2ukcT02KeSCvNfzeD8Kb5VV13nBGhkLSc6bjHKLlhD08h6DGM
X-Received: by 2002:a05:6a21:1509:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3da35d58df3mr922426637.3.1788447754666;
        Thu, 03 Sep 2026 08:02:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:1509:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3da35d58df3mr922230637.3.1788447753951;
        Thu, 03 Sep 2026 08:02:33 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d3a08fesm1113532a12.6.2026.09.03.08.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:02:33 -0700 (PDT)
Message-ID: <a032745b-e4d1-409d-865c-49e7cd408906@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 23:02:26 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] clk: qcom: ipq-cmn-pll: Register CMN PLL /2
 clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-4-21c3db378611@oss.qualcomm.com>
 <219ad037-ff37-40fa-babd-21276ff23f50@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <219ad037-ff37-40fa-babd-21276ff23f50@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oIzrK3yTQhAsW-QMl4F-ShG69MzHva7W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfXzSoipkorSvTS
 SN8yaCsoRERWvSbJayfyLSt0FL69BbZ+ViysYU02HG/5osLsQRcI7lDkixlo3Wl7s8NydeUQFGr
 nj6H18U6gkR/riUzFX4RSDg4AREUGEJ1UQkUGfjQ3Ojni5KuYSmA+bCejwKVFLqQec2MTmiYaww
 kg5wIg2rCyonsZUU2gqlIVaKhl7dsL4eIXPnkXAm3PfzSw4+ajp6P8cFxT6QmJ1DNbrm7R9oHM6
 j5DIVfOeeLqjSwmuYUWIaDtiwppRurxseWkm6CfPIvJrnoGx49hNsLqRf8JjQgm+wTFb7UnoRoL
 Ib+6Xd7XdJ8c6OnWgB3ieeV+oQuHh3HCa0/Fsdnihnq1ewNpYL4uUxPzAHGYT9RiZF5KWj7FT7z
 Ktp0oxZh/rWXQg3FLyIQdLrAHzULGt0vhRyaVcWqb2GghkpyHZf7MQ5ZRnNdpQoFno5rCTOx1x2
 OemiPqMGkKF+zQ6gDzg==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a998c0b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=tiEyg7sXe0Pth-w7ixUA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfXyi0LjeRfDuQQ
 hzvaOaDztKYrV1MaqYqd+vclg7KcKXYcxTyubrIm7GLezqIU3Ncvcyw4B3wVwlrw2Gc1OD7NHnz
 f/kkohqpYQnD4f9N+Pn4+V3CAflm/bs=
X-Proofpoint-ORIG-GUID: oIzrK3yTQhAsW-QMl4F-ShG69MzHva7W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030130



On 9/3/2026 7:55 PM, Konrad Dybcio wrote:
> On 8/14/26 2:48 PM, Luo Jie wrote:
>> Most CMN PLL output clocks are derived from the 12 GHz PLL output
>> through a shared, physical /2 stage, ahead of any further per-clock
>> processing: a gated fixed rate (PCS/ETH0/ETH1/ETH2/EPHY/ETH), a
>> configurable divider (NSS/PPE/PON), or a rate-select bit (EPHY-RAW).
>> This /2 stage is present in the CMN PLL block on every SoC supported
>> by this driver, not just IPQ5210.
> 
> I'm not sure how the mention of IPQ5210 here is significant
> 
> Konrad

The /2 stage is common to all SoCs supported by this driver. I will
remove the platform-specific mention and keep the explanation generic.

