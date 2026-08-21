Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D113947ACE7
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308486; cv=none; b=XnFNdl+n7D7+hGHxGX8xiT/dHWm9JTcReovfMW6+53BChT75BZL7B+Tj92hbAAgld+di4yegyIdQOW0c+pZ+XCO5znVHpp9TbiJ0bedJNPZj1s5QLLDyHR/Q/4ar0OprOB605uxzuT+E3ahXsxVFHnJCIt7RaHewJKoGhZbo7sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308486; c=relaxed/simple;
	bh=5zMdoPmIoLyyM0dKvIT55YTmQvzQmNq41lcYOrJS61k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VG/wt3mDyOJMQf1doTocS7+0cwadEQUUHTKcLT4hn4el3j+n5W1HW7IBLdAfxIdSbc61Jj3X++AQu87TSp4Q6ScZXvTk7kBOAesIyQuJs0aAyG5l6aGqoB/F5OMs2F0adRvzApsFIoPsYKBAIgtZ6cheWc0PGo0ZjKaEz0KQZWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIL73qzp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGqjeVDZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIL73qzp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGqjeVDZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9MC1f1550743
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOjHPgH/1h78uGEI85ecUIBarzFNIpLpo5cgkB5sGqs=; b=nIL73qzpgMjL3Fbm
	Vvug8kPON1rFtGhYYtMsDLx2TIYe3eLV/GLvhFwh06koXcVOfzYiHqFXttycE0hC
	f/Dk6+w5d6y/HjGbXBzBJNWRwSnsBZQEViTH6cer9GQOmmPfWBJ0Q9bjdvxnN+dK
	zBhVOKHHGeQVZxYZl97q27YrQWAd4n4jjf0XrEVtIDu93CCcrkQDuvPnLzN29621
	AjEU+Nv4qbZ4j7xitpYt1RxWTOW04rvedqn8gh52NKOPJLsADiTf52xffWiPMica
	ezWFzW/mP3NkwH1CDEB8lVYCj4/8PkV/GvbEbBr0/aYkw3QDlReknlcZni03ZBRU
	SeMtww==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6d069s99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:34:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848860def2cso925910b3a.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 03:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787308471; x=1787913271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOjHPgH/1h78uGEI85ecUIBarzFNIpLpo5cgkB5sGqs=;
        b=BGqjeVDZegI6hr3qUFRsrUC8zbwE0wa34PiBm4ZdtZ7pdnymxSeS8BHJRUoPuSnTRL
         4HDJ1KT4aHltRIxGVGUBzzvmGC6mKAPVVOcj8KUYqfYqGIt7zSbFGcD29YRG1YiFQnjb
         B2ehQ6FatZzvRCxZbcZihKxpoGnwulobA+sG5D5YLRsegm3OMr6TzovkTsNx/gW3izUn
         6ZYxy4Q5k2q2oMsqhqSvq75dkMNXCADiZ9C5FpGIRsSBZR0Q+yKzfTHg2crZ3cagkTJ4
         PEhKh3HsbB0nn7F5yxBXnvC1JaGGmddYg/wvYM1lWpYpzucDq2d7iOm0WBE2s8/UZP0K
         ccMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787308471; x=1787913271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOjHPgH/1h78uGEI85ecUIBarzFNIpLpo5cgkB5sGqs=;
        b=RfTcy3WZOmbBQPjVcHkLmBumGkCQcN5AVAPx6sbGAve0d76ohvVDXS2RHXqbgylEIE
         tpFSRvFiNme6O17pBo9aqWdzSoADiDqnhP84NozYdSXnUTIkQtR0YBn3YlKuPMfkEIs4
         Nos1B5BkL5V4jPtumLn9+LLYMNe7iyxcyD+DFgjoIzwNQrJqwN/HOU3X+6hZ3UK6VDof
         p9QxvV+CtDbjLxJLEEqiSLFtgTwwVWjYNwJ8F/l0DiZtGGeC9PCF2vYF40X4z8RlC23/
         nbsrwLO7naKoElA+JIhHOKyB1L+ds/bAGokAZF7mrv+9mCsX7TRvjpJw30sJD/NFxFgH
         vwLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrcSoJCzsVHaDpRnmGbUsoyVXVzWwePPw9yC4HnImLzM5+OodVbkw7yYFAqVOQzcuYFbvXkKa1Rwaq2@vger.kernel.org
X-Gm-Message-State: AFuF++l5/j0zflxukLamDiCW/OSKAtKJQF5ViXf21O7aqEiCQALEaKXi
	UaX2McSDP2mI/avYqMSh8cVOj6uTWkXw7ausIf6ppB7mEjoxtJ73rDvP/8GLz/4CcOHUv/KQNCC
	SbPInFlqtDfZL60myqz/rb28prfL4PY/WBEWmxNYS6mNbzLOrfMIBYh8razRc0baOvM2x+N+k
X-Gm-Gg: AR+sD12jMJWrkp7i/3188QVwpdCsggtc8H0fH6/zH/d0iovfUka6rvxAdW7N63ue9qH
	W3JYVYXV2NrcAshNMRRBGiWpzamfF8wLcY5sCaJIYnVLXNVT0fNO3q1Eehm9pGJrGcWy275SgiT
	bJGFhNpS7vBe+JbMT1R721JAnV5AKHklLrVVMrTYC4L+YBcHeQ4lVgbm5UA+wg3kTzSGcyWyAjO
	0PMgoOQtoS3WIn2tuhk6K1pRm/YK2v18nYOAyk9pucUuThmHwEK9qQh9LON/tjvlWemhF6RMxTO
	Gqx32HU2RJW+7aTF8+P0f9cMXDzFmiKcwgUk8IGcIQSmNcka47LNjHxg6a0DKTupgQ/wSaf5WO9
	zWmDe08w9NLbkFmsWpq29a9Zcm+DRYSS6Jx3I
X-Received: by 2002:a05:6a00:2305:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-851f9f42680mr7475527b3a.8.1787308467355;
        Fri, 21 Aug 2026 03:34:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:2305:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-851f9f42680mr7475452b3a.8.1787308466823;
        Fri, 21 Aug 2026 03:34:26 -0700 (PDT)
Received: from [192.168.31.188] ([152.56.14.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3362860sm2688575b3a.8.2026.08.21.03.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 03:34:26 -0700 (PDT)
Message-ID: <812d71fe-40e2-47c8-ac4c-ddb8a45f582d@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 16:04:14 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
 <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX2oRBo7CpN6Wp
 QLkbWqCvxZkse8GAsF8JyBHc28LWptqGAWFL2rDAiLjIm5wyL9e152hf3154IQ9RLPWawlrTsID
 +nSJZhdbPIx41JdU1hLrSsq9hND26wEDiiPYZE5ZTIZRk5A8f3fx0QCzs05XvYDUhgoQqaMs0Zj
 rzO+j2Ga8oRUZNQHu1nz437IA47Q1NBt0NTIo3jp6ce7KrVhxhLYAxbbJH3enuLxFKZE7WBanTA
 xVM/yQ2vFa4tRtqfqWQ5A/LQPd/inHsKGs6tlB+5/3ph/DNiWQBF0Rd79rofH/f0bCIdWS4+42L
 2fvewczv40TKcLOja32RDVP3Z/mc6cJ/c3Ku1QHldzVbe0wpGqeeiXGhklmjXpEoIgR7qDtdA/g
 Ow79dJVTGafdNg4LNskKSVCHxidgnSL5VJ/ottRFzOTWiCnd7TtY+ay52Bw3PmS+Xxc+XuvJZgO
 yomE/V7GbhDzsd24xxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX8dMoJ6NS9Yns
 Df2oIahVzgpJosSQni8SPlA4+cjcvcr/L2EYWX/ujmS5FLC7LBiUd9An6vQdtMWwsfBzKVLgOvf
 J8Gvt+76TCy1yLvQQZGPv2oecJd3ZDM=
X-Authority-Analysis: v=2.4 cv=DdQnbPtW c=1 sm=1 tr=0 ts=6a8829b7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=UgjVaFD1vmiot8dKuSzQiw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F55jpGqvRUC9acNfLbcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 6mn0-FNykfqQeJSfXTWSa6LAX18ZSn2l
X-Proofpoint-GUID: 6mn0-FNykfqQeJSfXTWSa6LAX18ZSn2l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210078

On 8/17/2026 3:40 PM, Konrad Dybcio wrote:
> On 8/14/26 8:30 AM, Pankaj Patil wrote:
>> On 7/15/2026 6:59 PM, Abel Vesa wrote:
>>> The suggestion of having the CX power domain tied up to the GCC
>>> controller started here:
>>>
>>> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
>>>
>>> and then, for Glymur, it has been brought up here as well:
>>>
>>> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
>>>
>>> These plus a discussion off-list led to this patchset being done.
>>>
>>
>> This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
>> Reproducible on latest tag next-20260813 as well
> 
> Yes and the ""fix"" is to disable the GPU nodes because the custom
> runtime pm dance done in the gxclkctl driver keeps a vote online
> 
> That should be fixed instead
> 
> FWIW ath12k is causing some issues for me in this regard too..
> 
> Konrad

There's no need to disable gpu nodes for cx collapse on s2idle, I can reach cx 
collapse after disabling crypto, camcc and evacc nodes along with reverting
this series, Specifically arm64: dts: qcom: glymur: Add CX power domain to GCC
Can you share the steps to reproduce? Are you running additional steps before
triggering suspend?

