Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47CE32B981
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035790; cv=none; b=vBPSiKS62dpeTOcxQdIDOwbuLWgoNWo/rNDij1zcC64uYZ7t1IM1Ln6hCuEKm9fV8saoWpaRa6Eb/kiE/FMGIxKh+8Tl8GFEhLYkKR5mS5PBZYW1u8YvF7uNEnhZw8D44bwCxTzhBNvYhcEPHqG7oas2/sj46YldSVLv3jC/pAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035790; c=relaxed/simple;
	bh=ddXIwzcq69bke5xNa9ihXe5S9Fqz3ubWOFlTMrMw3WI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lCtdt9RHIVpQ1ZkNm9APAmGaZKwZUONt1d5BTOOJaNiHqPx3SiZtnoHPqpf51OUpIDsJWmdkCsje46s/ONdU4vKgJsMscuVu0K/D0Z5M1rhRlRt6QLJkHeGrksCIl0lB/VmdQTYa8L62vgS1IdSHbxyB9zpaV9J7u2OIFFT/rvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1gx0cTZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dYNh78iI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1gx0cTZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dYNh78iI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBoseg263511
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00Q7YH6eDQ6ptYXmSdMzfh3T8Q4kbHubaB7GwVpuRik=; b=K1gx0cTZoZ4ghvyq
	xdu1uKleqnvXartFRKkAxxsjNdTJy3e1tUpfdArTxn6GRzoQzk3hm4Ro2znKexll
	Dcz80Pos7mjoQvbjyRhf+qJZagMKJV/8uQx1B2Rd2TRGh98/jkzyEUrXqc7SVp8L
	QO+9xRqvyhv5MJSjTjDqw1zINRz/PdYkHId8T1UlVmsiO6E4FOCGgszMhwFkGCcj
	Qs1UqQsZSpVgNTzF3B7/2vHvBPu9OUB+U7aOi9e694LHlhzazuKPa3v1JgvbEmWJ
	z1jtgEZDUPLXkjjXdtbMFAA/8kMTy2/hZudsBD7rNVQiLcdNEklG0UAJu4KBCNf7
	dcjorw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk0e59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:29:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92efd2ca21aso543899685a.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784035788; x=1784640588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=00Q7YH6eDQ6ptYXmSdMzfh3T8Q4kbHubaB7GwVpuRik=;
        b=dYNh78iItAKRBl4WHDJwVt+Dp15zu+OREFrfTru3T4WyMivzmxePU2nd4HG+aOePFG
         ONXXyOLdQFpFebbD9OuP/Mq8SvLwSl69oW5JZ8ugYj0BELTa+rAq2Vz2RwPF9+/IOxof
         1DsXK3wZEOa4+QjL/zio5DKICQ1s05QmQCTLEuEMIIzVro6JNYqLQ1PwAmOuvQYvjelo
         rV7/mVe7o5c8gbT7KVNzFeEbgG1/buTlO1UlHiYCWGGq8nxJuXoFiaSXq0ncDjleRLDg
         ommznaMSNtDOq+3S7GsZJjoag0qcEiam4U7g6f568Nczn+Esf3JD9bDLGTJfv3yXesbg
         zRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035788; x=1784640588;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00Q7YH6eDQ6ptYXmSdMzfh3T8Q4kbHubaB7GwVpuRik=;
        b=rdhPZHOCWfjmiUOaVuxOFmFoPgZ0Sd2C/Bm3Todl6HeDI8uc8hMWxIGx6+t3ru1xK1
         ZmbN9QmaWjvEzJn8RWm3cbOBx8WWcQN3CsuHbUBPaqXtqxl7OI9G1hTDoviVQtT8glDu
         2hzIkrOMuFOMR9cYO5nF+WJ39+9LLmaXX5n+NOArJv8hwWRsGTBP/M128l5pRiL3/uk5
         XzeKDuva3tn0dSPLct0APZqJBArQjBefsZo3AHhlErMN5jhL9YfelCNsN2M9R7ravM/R
         cTBTQevpgVUZ0dyccRWRH43kitKjK6PBdZfw7RVPZQbLncLbi8lyYyw1wkvbh8HtrQX8
         MuZg==
X-Forwarded-Encrypted: i=1; AHgh+RoF6niMiZuBobuEONw8UmGzB2dcDDsTDSKR2J3aY1F6XFrPDE7mYcB+CJyopCPdg8Gt9rnZY+/Resqc@vger.kernel.org
X-Gm-Message-State: AOJu0YwBWcKvy0TZpS64oF1qHdiU962t329MMRutT1ZyUbSTE3PimG9N
	g+FBgzH/REr2FKW25P5F6jLHYLarMWqbQl/gJqN3U6Ed7k3pW14VoxDudg9abZfuj1wStwYT8Xo
	yjbGqqoP5YYbEGQgJepMMga3FqkWpxYlOKH3WKF3E8oLzyiXfkRFl5tF1cU3c+bSD8QqUYeuS
X-Gm-Gg: AfdE7cmT3E1hASFURH0cQUgr1arz8u8lXfm0sgjhNMAhbVEX0ufpKCXdUCfNWZ9YefS
	Pe/gq8OXElJaUEkbDxp9O+Z7G7KWuIw3V5kAnKnlkHOqpM38K1G8znnC523frMARrmjz+RINMRn
	I9kfnhmaAg0tFeC4dpc/qj0cGEgx2eem5nxYB0zSJQmbNO+szAFA3RvBTrNkXK1fzmrP8+VSNHT
	L6niEudwR/XzfvlxFS3hg0FQUh0cvXolQEz+WZe/FZA4uO4AzPFdz+PZil9vANk5EROb8cnm02p
	hieyz5bioYBRMbHUm9273iIzq1fyzCCHmkbFEFi2jy+nLB3cgkwJ8pEn9M9BW/BBpQXtR0H41Rj
	7B1S3ttFTYcC+CFokzJgRGbzpfpp2cwv2liB6VSwv
X-Received: by 2002:a05:620a:469e:b0:92e:c117:9ea9 with SMTP id af79cd13be357-92ef2e303aamr1315625485a.87.1784035787633;
        Tue, 14 Jul 2026 06:29:47 -0700 (PDT)
X-Received: by 2002:a05:620a:469e:b0:92e:c117:9ea9 with SMTP id af79cd13be357-92ef2e303aamr1315621985a.87.1784035787277;
        Tue, 14 Jul 2026 06:29:47 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d6c28bsm1503753785a.46.2026.07.14.06.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:29:46 -0700 (PDT)
Message-ID: <e83dffd9-e54f-45a8-b997-e84b5beead71@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 18:59:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm2290: Hook up MPM
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
References: <20231215-topic-mpm_dt-v1-0-c6636fc75ce3@linaro.org>
 <CGME20260709114143eucas1p18463122323bdeae8e63b1d13cd626b55@eucas1p1.samsung.com>
 <20231215-topic-mpm_dt-v1-3-c6636fc75ce3@linaro.org>
 <dadff7a9-bf04-49fb-8c55-5605e99be7fc@samsung.com>
 <CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qmEPe7zLtbHdVyRr6uAtTEqqN0G4NJ2u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzOSBTYWx0ZWRfX54v9hjQI5f1g
 GJx0pE1yyO7gepsYOtGweVYvMV12+RXpCgaI6K4Q4FE3TWVlNn7EFO+d72bk3jpLbdTSuIGxWC1
 twJE3yNk4SAVy3e8toOYQrv/R20jd2GKdseEwO6Bgm1lyStvqD5+9tgWLkp4NuG7TgjDeXCBDGJ
 p2WJsdMJ8Gzctg16ZcCocB+xPQBzf+4Tf/Lwx+hAU9GzkqRR+ywiKEm9ds2NBaggwCLOFQYTnu7
 y/PIlhGA2aDneZEqt09cCAY14LDmlnumLs+hierhEVmbzR2GVbx01FFFf3+dnmpf5A5WK664T91
 ZY9RKukwMDDFlu7E47wHBlj+xKU8du9JwE3qgTbrcM//eL6NoFXtLmwhUmPnl0NNSooQOpGocbu
 Q1VbRtmUZgknElZOUuc85t4S5NOV7OcHjcod20pTa7AOEwEEUnlInKgUibKMt8QaUQusfrjPOap
 mluhYFU7Im2/FFlXqiw==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a5639cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hD80L64hAAAA:8 a=LIVxzhUnV8PAbWL9GmcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: qmEPe7zLtbHdVyRr6uAtTEqqN0G4NJ2u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzOSBTYWx0ZWRfX31izcbkcPuY8
 KCwGVvsg3BZ9W+9tu0ijLsuyQQ7Ioi0LRdqzt3TbKPqATaRT67JpelVt1urNeHFyWT7o7cO2cW3
 IpV85ZW9faQnE+770eQjIZw7EdpcIVA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140139



On 7/14/2026 6:34 PM, Ulf Hansson wrote:
> On Thu, Jul 9, 2026 at 1:41 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:

[...]

> Without detailed HW expertise (still learning about the UnoQ), it
> looks to me that the HW may have been modelled upside down.
> 
> The power-domain-cpu-cluster should probably *not* be the consumer of
> the mpm, but rather the opposite. This is how qcom,rpmh-rsc works, for
> example.

Agree, There is a series [1] sent out to fix modeling similar to how rpmh-rsc works.

[1] https://lore.kernel.org/lkml/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com/

Thanks,
Maulik
