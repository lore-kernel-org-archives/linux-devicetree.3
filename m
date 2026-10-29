Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793265235;
	b=M1uslPKYYz3zJ76huY1OyB96LtSf4mI1GQi44pvdFTyoRxNuvbW+jrcsp7uN/ka2lmx7
	 BSF5kqr0n8v0sIttdGV+Fscf2rfH+n5s2g/A6DKundSBQVFGARfPn8SgSpFWNEQGFpBzm
	 xlx7Z/MSkzV4iSvI8PNzn43hJwuQNjidIOXOKOfZF+wzA10u1wec+v1fv64blzqjz+dH8
	 yqr/U3cV4SCxQUjCHzfK0sFX5yw5bdLPD7IQXS5Es8Uv9xbYcAmrSniRWxIihhwSBlVoE
	 g4jNdiA6nZGgSvJz6/pwqXebInCxCV7mozgvxQPGuKiyEvnV2ugEZaDUCGjCZ9PMFmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793265235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NFI2tWyPhBr82xP3dv2G8dPBOkHd5ea1/Lyuc2i+joM=;
	b=aoTmwWkgQ3+VRvy+rOLOCJYphJS3Zqd65OK28S9nxWLEnyekT/fDDXXE0zl4DvdF3aQg
	 aKKLMXEV7Rbcez10jpkArQdqTgiPHPJvytf8HjKPc5Hy/z1cBni1w0I6YTWJplKCfrFtc
	 8i2lp0Rk2YkfHdGCfBU7a8yhTrZf+xTUV3gaTvf6pLDmcPGr5uZVbMi1esyDTuJBCcrOl
	 jWKY6wiA8Evp/ty/5pQNEr2IX1Hc78uoTl4a6R9gQmCyB0u4WVDT5XPqZGn5VqM/RoUNA
	 rgM2QhhvsjLzy3/ApFRklJ5E1XS/k6zNJD9s5A17OgQOl2aa1kbehRlqM2b/fUi9ZCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXnCYEPe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpXeVObf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81CD606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C81CD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXnCYEPe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpXeVObf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vtrg3279782
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NFI2tWyPhBr82xP3dv2G8dPB
	OkHd5ea1/Lyuc2i+joM=; b=VXnCYEPe9YSbImLRUGuQKMURvR1ySaRCMl+Lj18Q
	Zx/ZHn2zb2QOwDwsXCgHFMW/SK60JzeWnBTtmK6+GNxO0FDtv7NtFJxr3VvymlQ9
	QK86BjfqS28+DXntQgb2c3MaBrg+E6hqyyG+psQ7bCDTvUlg97ijl0j3xJD6i6D2
	ns2qANRayGrXABo0yj8EdBJj4/ogpvM/MapqjgZ68YKzo2W+PJjfgkh4NV+tj9um
	WJ/tLxnCiMuegvo6nIyRBYbJz0/BocifMlD7qY53iiVoK0Hi4OT3g3SSypWYg+C6
	rbfJE/HHMumMA9vntiYt3UsIA8d6azj2jORsw/g6zubMNw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3na8ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:13:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so668473a91.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 02:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793265233; x=1793870033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NFI2tWyPhBr82xP3dv2G8dPBOkHd5ea1/Lyuc2i+joM=;
        b=KpXeVObfHXYpbSCWBX6V1TXXfFuXWVoTDA7RWHMjzHFp2hLDxR9OM72umo7I7Tds8X
         wcx6f6s6YnTRfk7KrfM75cLEyjs+17UCN07PYU5+TdilELBigSsTCUJAvsMygVyNQtvb
         xRbtn9pymIbU1EvnfVeds+Shj7x9GVbKWDmKyPh1Ua0RXvXVp+tVvJpRgrQzFiKImU2Q
         hzZWveNAS5Cy2QX2EykxvKpxep5FfRsKn3Z+jX22a7f7yF0/QjMkWYy6QPGlllzMn8Vu
         AbG066+3wGf+LSxZmSeNOPyUYgpKSBC6LXioX2p6VlDtw9wMUygVIQxZ4HdqpsCVMiUQ
         6g7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793265233; x=1793870033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFI2tWyPhBr82xP3dv2G8dPBOkHd5ea1/Lyuc2i+joM=;
        b=y3Qt3WmdBapSXi6vf3/o7470RALrPrjUmLO/w5XxjR96BI6kL1tbT1hoiglfjbdxPP
         aGk+cL8rkPjvwFfek76kBK+5JMmTUXio5QqtOhz7GM4wNgbSLzRJvY+lunQF4M3R+oLX
         9oAsEXLdZi6tt89EJ78bFHH9JTxx5HFk2JEbS2yWcCrwjEcqJbomXAH7I9MqnJUHcO+j
         hfAX7VuzWnJz6IRR8b5xyc++RvNmm0+Iq6JyF3bHx3zSM0VPIv5QItoxAQbgxH2LpJ5X
         yCjOdjTsxO/VzsvS+2Q/jPRXsXbp4+R+OhqGT1DQEyQFW26sduyQZRZyQrimA3SQv7Ee
         TTLg==
X-Forwarded-Encrypted: i=1; AKwUvByHHY1VC0qNGG9RFp9CYrcfa5+XKYuf7w+ljOlGst+aMe6OZaLULtr+6/byxWKEqR3spWgO8Ivsk4H1@vger.kernel.org
X-Gm-Message-State: AFq9FYJBdbIvP0zxVU+YLSQlvlR5f5lQq1cYbAdO5lOMHldWDi+irje0
	s0X+grLLMn0KcH1Azpuv2Wk3CQDGYxPuB1yupbCO9A6SkC8iWUWV8mtlS5BQbQ4T2Ze6mcNzFBN
	Ch8BIbAvjRHx8momah/PMAVhlbNlCXZDufc/BuCEzT9u9mv3qgtFNQEHu/Ai+N6X5
X-Gm-Gg: AYBFou308E4CoQTQyoLi+rTVHBGRHZuQAt1806vL0opm39Io5uH6YbSlxw4mMjS7SBZ
	9Ng+otNeCSvvVz0lGOM02wn3hfnI/WYfw5YGDoMAwumCN8PbYII482ir0DMPbfl/esZEo19zrXI
	QwV58NGpQGGJaai8vACzbrjkU8BM62ZDlc8cOks3+P2Y8KCpFxRhzaf8c02zBe5WUvGZ/MgAPsA
	YCKWUKd+FKKgtpehycwjdgshZXNS5R7VUE7SzLX7g5C7osIYy52RlNa1NQApH2qhKmvbf7igaHJ
	K0R24kV7gnxdrMHFwEkZLWEox4bC8dlggnN+QMC8w1SQ1bAe7jeSAkwRwDkTk6vqmLcQT8Rc7nB
	tthglEmdECN3X7q61Pu9HRtNNJRDuX1ErAYmzm1f/oaySd0yCHU1vnVqYofSIPd3lILp5UNpDX0
	Y5m/TNK/+nHrBSTX4=
X-Received: by 2002:a17:90b:1c82:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3ae57df557emr4015073a91.8.1793265233219;
        Thu, 29 Oct 2026 02:13:53 -0700 (PDT)
X-Received: by 2002:a17:90b:1c82:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3ae57df557emr4015054a91.8.1793265232701;
        Thu, 29 Oct 2026 02:13:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8401casm3428556a91.11.2026.10.29.02.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:13:52 -0700 (PDT)
Date: Thu, 29 Oct 2026 17:13:46 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/5] soc: qcom: pd-mapper: Add support for Nord
Message-ID: <auMOSm_roh5S-DTY@QCOM-aGQu4IUr3Y>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
 <d4349c3b-f6c7-41c1-963c-ca0e21e2f436@oss.qualcomm.com>
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
In-Reply-To: <d4349c3b-f6c7-41c1-963c-ca0e21e2f436@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: MYvMovGTVZ5Vj7dmVdYagZXoE43-PuLy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNSBTYWx0ZWRfX/zG1W4/zOr+7
 +meMBnX9Rm91z3pTTUjXWiKciAlWz2V+cRf0G41AUKof/EAhwG/e1zooN2TjFjS9pF0/z392yCD
 cpUqHaY6kghs2TklAjIUUtMx5WL7Y+NRBJ0Cepafh99TAUsazzB9wG3Ib49Z5HEL2PUwz9K07U9
 /IiEMstWY5Mhl2U8zObzUteoOcjU5CkvzCDB4hglK+I5lA0Qk74IEgX9t0veKmBM6JlhRmVcY4n
 zC/xYL6GgAy+2usTKxUgbfIMEL2vm14V0MW7hfbarOtxF+5MNId4eUkqn0dUIAulUYi8wD5AHob
 jjIvbGTVzQfzXxzLLNosJ/3ZjcmW02s+5Ol/XIIwbGIBXoFgemHIlK2XC2SmR0i7pME8rlGqtEG
 yiZX3tPKRZ/XnCPYqbIkZLPBg6cfnWfeyjfs2cYXsm5SkhLulOs5U3HQlEATVHh6gD4mcLK/ADq
 +sWoK9hScYONckP8EPw==
X-Proofpoint-GUID: MYvMovGTVZ5Vj7dmVdYagZXoE43-PuLy
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae30e51 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RyhwSFVHSLl6ccd3bA0A:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNSBTYWx0ZWRfX9n/+OSGibxGM
 8ezl5Jc+d4EqSKPWuy+o/qdTJbIGzq2pwjbhTiWBYoOpf7NDdRsFYQ0e4rIl1zJChGh/i2T8I2K
 hpfRsJ/5BijxvQGRa5WH094uyCuuKiE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290035

On Wed, Oct 21, 2026 at 11:56:55AM +0200, Konrad Dybcio wrote:
> On 10/21/26 9:36 AM, Shawn Guo wrote:
> > From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > 
> > Add support for the Qualcomm Nord SoC to the protection domain mapper.
> > 
> > Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static const struct qcom_pdm_domain_data *nord_domains[] = {
> > +	&adsp_audio_pd,
> > +	&adsp_root_pd,
> > +	&adsp1_root_pd,
> > +	&cdsp_root_pd,
> 
> I see 3 more CDSPs:
> 
> https://lore.kernel.org/linux-arm-msm/20260929155152.1898666-3-shengchao.guo@oss.qualcomm.com/

Yes, we have 4 CDSPs on Nord, and they share the same instance ID and root
domain. I will add the info to commit message.

Shawn
