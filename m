Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503843;
	b=FUX5pOcxZ3341slqONnDh+dsepsrRSgxXfLyzRiVH+pbBlx2poFoVFJwmpY6tJPfpYuS
	 /VQC3fpe6ttkAwt+e1wv+7KvyUlpWacoLiyfVUd5n6Jla2DEg08xCBFv6tZzhlIrng8ad
	 FT69kxVdtlNaeqMMhtSi/P1RoU/crZyymFEhd0Burs1a7aeOZZpLXOO0vxZDATdhxLrk9
	 B4/Rz6B27OE3l8kDt+Itv5Lh4TmF0dRv0fMePS8HjiJrdJ1uYZhT3COBNmVZQgKJHuf+/
	 QYRwKYwsViYC4+8vaR5nwzMwK0tqMx/NJA/l+K2xPC0qFuKMjcl7gdmpU9ANPjfLlEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503843;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=90cPQy1RXUCyd0qA/++VQhZjEso+RPuRMyVzvI/5W+4=;
	b=PZRnBLE94wCdf6VkUgxODKCDdl5SgFCNzfAsVMX7ot3ptXtIJT9PmRDxo2n2N6EMV5S8
	 zh0JlL99xAoAPjOe3BmVEiuq6C7E2nzrxiNzvQ5zz/gQM576C6onWlIMMj6dYH4TDeGF3
	 Sge2foB/0X2kZhXL65h/46nK9rPvRGQis3uYZx7QTN0QNyEYxSqL41BjpmVQbQR6WOjXN
	 O8Tl/mGiFiDTBc4OO4HmV+A/td7KoesfUECerrv0qxp62bH0M4rLOPmuA51qtexzGncGL
	 eSO7b45oksUOyHh9V/I8L94fHzOl5DlM4hhL9qtnrsbGCE7+N4TKqq5PplsEzZPybSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JpwEQU38;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvI3hUCR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7274606F46E
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7274606F46E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JpwEQU38;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvI3hUCR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDDp5Y2305717
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90cPQy1RXUCyd0qA/++VQhZjEso+RPuRMyVzvI/5W+4=; b=JpwEQU3882d+dIg8
	ktMu/sJh9xwbtTmoE4Rvhr7dsQ32fpyggNlA//15UwZd19H1RfvQ7BKXHCUMQqGY
	6RbCbtJDFo9gA85KYtsVkYnUvNsNRtwyshYmgvxVvVeSCBT3k3qmQUxHBI0nL5Tn
	zuxT3HThECAQsniXfUqtG2LXHIZADsQNO3siSb2PoPi5KcxBjawbLKwrAF2vZQG1
	lPW0Q7RILtqOuvj+9kWp9oBec4Y1oQS1OVMyQj2cIIeQqdI/FtT6A3GCl5wZjt8t
	bBkD9Fwn8141R+Q0qqR1dICdFKs2fDTZan8BJxpvvfKQtHClJsvXKtMlDNglpfzx
	Nyj9RQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pjqyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:44:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53389750985so5005331cf.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792503840; x=1793108640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90cPQy1RXUCyd0qA/++VQhZjEso+RPuRMyVzvI/5W+4=;
        b=AvI3hUCRr7cAp1J0PdSuCd/SJKlyeWUy58WOZbzwiClL+vLVjBnBUWX7B22qHWPWaj
         tDw6G4CXiLmBZz4IZRHO082ert8T8jAUPTPhuEKdHJ5IiPHvlgEJrjWSHtMzkLGaSbFQ
         PwOTpYDuUGjfU9fXZMAfeNCjhx6rlFTab4Xb4FPXVq9Gv0aYx5rIp5e3uzQda4lCbael
         6gE/IeooyYLmlIkZdfX3wV814sw9s2K4GOF6e+9S8hzQOuSBT6JzsIvGNtIkWsL7zf6y
         dtC0eBZRzwo+kerTbLHUlZCbciyr+hhd2FVUyiKYImrvhq93yag2db1rI+sN4cLmjOcP
         Jdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503840; x=1793108640;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90cPQy1RXUCyd0qA/++VQhZjEso+RPuRMyVzvI/5W+4=;
        b=Mkrh2JOZsdG6TJhcaIpfvyihbEbNvTikD9YjbIwENWMH/0z14CkhiYUY5eVhd124oV
         qvkxs0Pa/jB9AP97lPInnhft5VUwignwxToV4tGhlUSe3GyedEQ0cldsUelFlGo7lJmX
         kwV57ggKB2ekis9nSTUVUY4dquJQ6oVzs8ltSAgjylUYgNjG/RgUpJhmXXN8O9f8Cqxg
         Ifa1FUaLizZbQTSRGJN2xQZqfccpemZArQbqa8YusMfPkLp83aN1eX/a8nNBTkPRyzbL
         wJJGgQE03/qz17z8FW21nGyR0Jz3n1N/OEmN/fEy3zUhFfJ4ogXRjeus44Guy660Npbt
         dPAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLAGcaJ7CB/5N2+AgHHYye3iBP8jAt5U8yEDcj187euiuvO6lkFQvWhfuf4QxW3NUr5N69lvfXQwHK@vger.kernel.org
X-Gm-Message-State: AFq9FYKY1oRIgBzhmXD4v2NjHAMwGJbgzcmSqvWpH4VhVSj9pn6eE4vb
	wpl7O2ASQQx+SCe8dEVVxZtxl0fsbA67QglFAnwJCYvjRmYOZbBWGjAUgYGJwsaaHVjP9cH/u9g
	AFNqXzKjUZ9kZUpO4JOal8MocOclb2uUc0582tBodiGn3GCyidA03egOASIg9KglA
X-Gm-Gg: AYBFou1aR7tjgWOKtRUvA49OH4mOUmmkd6FpghGlsLp9RQG9cfOotGOx5Qm03vAAVfX
	qBaDUM4cOREJtheGc0ZiZoYMeDVfZvg0vT1mNenFichRfy4gI8+BhqMt0uUwQUMEe9ObIOnfMqg
	N1XKvzEYHR8+BJAGieREGc2EKEvVegplQiaNIN4pnFOzwxK/+yUY2r0nTml7zHeJ8qi79sVRty1
	v1GFssRBiUwFQGregLXd8IEcBjlthZl2P6Ot3u40CJdlTspqKKmbVDQFItJ739Cgo4KdysSo/gf
	YS7XZWRvmjL9nSWizL8c7QDPBPfkpzZy0NkCL02twuKAc2VMvEdYRDBrNFVuEvjaHz6v4hk8i/R
	EUpwhYsPEyzx1WTQwZTM/2A==
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2180700885a.3.1792503840101;
        Tue, 20 Oct 2026 06:44:00 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2180695485a.3.1792503839596;
        Tue, 20 Oct 2026 06:43:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1337d2sm5441811a12.1.2026.10.20.06.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:43:58 -0700 (PDT)
Message-ID: <11891012-6a4e-4d7c-8155-cd8266e00bc8@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:43:56 +0200
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
Subject: Re: [PATCH v1] arm64: dts: qcom: kaanapali: Split cluster power
 domains
To: Xin Liu <xin.liu@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
References: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad77020 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0piBkx7tkWQQxamy7twA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: MPgsQkj_TvqiuzIOR15acoTd21L6-t18
X-Proofpoint-GUID: MPgsQkj_TvqiuzIOR15acoTd21L6-t18
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfX3FyTeWYhVVbh
 3Ikjs6NhP6uD5GahnffAYFTFQJmWffYBLmujiz5kD3EG8X++c/TuaKmyNkQYTF+1JIx0nM3mRqR
 VSZeIqP9JVh0wMhNmVAg/iPsGC9HSxMVJ9FQhOskE3grXuChc23KPnLYlEq1ayDbpxwggxchP23
 43tzVfNueW2+PN2vt+fvrpu0gFxyn9Mglvx4fFxZnk1jr6ONE3XoEwWjfwMFwFmuOARkMpaVP26
 UN25lryTVQ6WLcDM9+9KqFQyXUXZx5GYDjVVIGOUWmjNOeadXglVdEUp5ysqto5m7PP+qNgZh85
 SY9iwTbQQTaWQFAJk5wUrmDFAfeayQ3CoxS04D5Ern66Tv0m0vrg4HM8UIh4l8E5DlcmJd4hf4J
 PDEoGNtLYPVLiiQDO6One2mMmGitKmOkVKBPj+LDkNP5rW8Rcat8osgGbA4ZQAmmjRnYy2DKb/1
 vgM8Jx1a2XWyeU5ebQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfX065pkwRjswpc
 omyX9RClMfhbHe95cTGPb2qX2kJ+7EElV6B2esPPaau6BRma//0y0OeGMbtVXks2l+CMPHYV0xY
 xVO8ajWtSsnQeCNdkgy0f9y9aRGPhKA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200054

On 10/20/26 8:37 AM, Xin Liu wrote:
> KNP has two CPU clusters (cluster0: cpu0-cpu5, cluster1: cpu6-cpu7),
> but both share a single cluster_pd. Even though their domain-idle-state
> configurations are identical, sharing one power-domain node means the
> kernel's PSCI domain idle refcounting merges both clusters together,
> preventing either cluster from entering idle independently.
> 
> Split cluster_pd into cluster0_pd and cluster1_pd so each cluster is
> tracked separately by the PSCI domain idle logic.
> 
> Link: https://lore.kernel.org/linux-arm-msm/1ee9b624-4580-4650-8e48-d517ce9eee3d@oss.qualcomm.com/
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

