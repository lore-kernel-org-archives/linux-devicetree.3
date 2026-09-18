Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DE7343D8A
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736528; cv=none; b=dkGZTm2SopDpcZ6Z8MsNIWa3P71Jn6MH/ek4P3bH8DfTbSGjmnpDHcuELiz53Z8vfBGVyD/rSZ1PjeqJJdxOZZhvSwG9hueCGX06/X9LjRdaHgTuuh5blH3Dor3ElTgQo8kwVuyRGCWW241GauZgcmN46e4iA9e7tPLRXCQq8t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736528; c=relaxed/simple;
	bh=y1bPt6F5nrd5HOptM2+x7SSdZZR6HwyHNglhGdwATAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WoIK26vT51wMcYuAxx8jIIwfHe/fErUt71yeD85Oked9Cuoj61BFdDyJkEX5nw9NxYiRvyg1vxH2/4PhoXB0Z6miEN7OOcUFnpavp8va6Mm/Msl4ZICzNY9x3R4ppGO0hFNcXCt/7C81wqZJq53l1rDsMn7xVC45zo8d84Z6BcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gh5dBrNY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBC9XPDi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gh5dBrNY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBC9XPDi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICu16V819718
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKF+BfwHstfALzVlcYgGwDp+dczQ45u3j4MVRIZQmGY=; b=Gh5dBrNYIsC2hxXS
	6O8pqGCerH9URA9GezaB2NtNLgDy7tT81mqkbu+ZxArfztMFmlACeacbi6lnSU8J
	vJWjze88rAH9ZHt8vRcLhdH4kmbexlGUG2P5HIvCIWH5sr0F5hZYDAFUZ0Yqmony
	uelO/RAu+aZthmFXFS1GYiNvsF0H1fie0tqOIY4YKOxXrQlLTBQHjg9cVxHpdYCV
	JD3A5r8KSgZHxkCT/smqduSH5sKnXaDogP932RMBvEXymmdwwwwVgG0akofCdLS4
	XikZljYonIzJvn2vbQgZMFozQO3FYuRnwTycd69dc/bE3ywZBKFAz5su7fBgYm9G
	vvH0rg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrt0xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 13:02:02 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-451b3cca625so197167fac.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789736522; x=1790341322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKF+BfwHstfALzVlcYgGwDp+dczQ45u3j4MVRIZQmGY=;
        b=YBC9XPDiPaCtsUBLt++1v7Y3OfiXdLweYOKXh4luKUe5l0mArUiMgnsynHMyE5pRf/
         7f50Oi7U2fBoUWLWOlOF96uPeoFz/ZacpCk/m0JHtGbb2SjPVkFyQT6LqH6sicAHRAXR
         OAQqWxqWjhjjGXfKAnQtozcfgyJC/SQjj6c83T3Bt894odFt6Uy3Fu2mUZwe18RuHFIQ
         QsZgMJTM8n+Y6RB9E0F2B0yqMbmMt5/phqy/klzPXez0vZ8JTD1vpr0bA2mqUvOkb3o4
         iss6nuaxBKYSuHi2hbZYfEe7bpedqgtkHP9+I3cKK7Lrhhr/iBo86ff/Te1B89voH6NU
         1tkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736522; x=1790341322;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKF+BfwHstfALzVlcYgGwDp+dczQ45u3j4MVRIZQmGY=;
        b=R+q1ir3bsDy/TUWhwCzRM3HVc+CLHjdOQB8H72h3EAilk+vwp3Bt/1fCVCrMpB0Bt5
         TWMAn9hhfPVc75zs4Ui8+gzh8JQ/9fsUqGe58qa5hfTCXmfftDfI575FdKJhDI8kIf7Z
         2dP0VbzVYQelXxEVH19bgeBLv1G04rbYkDzUTm3QRqe9HYzeU8Wkp+5RLlhrmpvpqgUP
         27LVblTKZ1gYz/AcLUf4M8fhP9+50St3jnbunxAljaQ4DLXDRWpom43xFnXfbhBzKs8C
         EnQD8u2hKKDbuJuf39K1a1lzTW6RAbhLHGAlzJ2ub7mwC0wpF69mfamCNFplrQbuaukk
         JHew==
X-Forwarded-Encrypted: i=1; AKwUvByqh5yFbyRrsmUe+3iiDc51NKQ7zj/Ueq0l82LH3jzcA1XPH9N0e+VSxHAHlo6/q+SEcG22bq/0pP9A@vger.kernel.org
X-Gm-Message-State: AFuF++lkZTpxhcDApaepVKkDNwXqyjWA2jWiNeg+Ue8O0O9rZuISpOs0
	7g1oEDxF9yCJu5l7yMMAw30goU9MQ/SjzFaECQDnqgWxQGz1QkLxNsZu+RfQ9gsIgCX00exA3fg
	aphgYap3RUEvP3vwZYj9jeiIPANa7LC/LLneaLB93ur2UeQg+HQFUG3a1HiFY33gp
X-Gm-Gg: AYBFou0al1eeCOYgHFp2588KFjVqFDCPhQFrUga+ik+0NQx16mq32rNkOWkbQOQwJIB
	2oxG47Z4CZL0qO8glPH0WgLR1wA/BSWYPAjynZC+KY/YqVpWKqxOjxv9h8r1PrOp2ZXbYlVbPor
	4UiZOcEtcXcxgMs3zGbKzMXGR2dCGe1D5HTWj/GK5Wr72312zWu+v1msPHYYmw9Dv8Ri84dsOGE
	7EN3wXKtb5lvWWBmSyS4hTEt6RlgCRBfgC0kMIV54HYzKS0fytsauZc3SPdF/83D7coFi8s8Oip
	LxHswtJO8S73vMQ8xyJwk2IuJ8mBXVfRA6MykgNDzNkW3PBR6ccLQlRzoOS1tq8YEeigcltjnWU
	9oQgHDbPRbjF03rfbRaauaQ==
X-Received: by 2002:a4a:d857:0:b0:6bc:dd88:2782 with SMTP id 006d021491bc7-6cb1f3eb6camr1100929eaf.0.1789736521963;
        Fri, 18 Sep 2026 06:02:01 -0700 (PDT)
X-Received: by 2002:a4a:d857:0:b0:6bc:dd88:2782 with SMTP id 006d021491bc7-6cb1f3eb6camr1100874eaf.0.1789736521490;
        Fri, 18 Sep 2026 06:02:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58f3236esm815027a12.9.2026.09.18.06.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 06:02:00 -0700 (PDT)
Message-ID: <1229ea97-9972-4cd3-9697-ab03c64c3fe1@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 15:01:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: glymur-qcb: Enable UFS
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
 <20260918-glymur_ufs_qcb_enablement-v2-4-16619f7e36a6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918-glymur_ufs_qcb_enablement-v2-4-16619f7e36a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad364a cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=BBNwevgwxSeHGHzN-EcA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4NCBTYWx0ZWRfX7ok/nuMOc59T
 SXcv6rELbbFyRQiGO7c5J6AalPcC2FFhHnWkVIWqr5SqPv81OLGVWcIrklhpRu3gNssIF3vs2xx
 HI60ZNPCJOdInF6iDPUVYLxqZ/6LBh3qWi88V4g7Ni6fIsIZ0IzhIk4HraxnW98HdUQEu92pg2x
 688f7HBkjG7nG2/2P4ngggWAp+9sIQYMh554Tj5FBMtf8nUCo5mgMbmMCe22WWjRC6Whe6KGrR/
 cMVbDxlmtM3PBlVlAVJxu5NHG5RVaDr+YbMkxLeKWHE6q0wC/6nOkqFRrsD1urAbxokdNd/NyfN
 RiXFBOdNw2fXsldGNjYFTkb7yf3z1tYcwwBDJu1EqX1TpXkN+AQmvEnOjLPn92g9cpwDUJmFmpb
 PhvWHbQ3pgEOUDE+5N2kg2v8+DsH2A==
X-Proofpoint-ORIG-GUID: 7nsTCRxfH1iJQtbCQnN2mn7xLe0p-nyi
X-Proofpoint-GUID: 7nsTCRxfH1iJQtbCQnN2mn7xLe0p-nyi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4NCBTYWx0ZWRfXypHwKNkMDwrM
 LacSR3ZED2GZAMuZEIWu3aqACOkMnnvdNHlkkp3ooiE1ESg5VKTCNraeuiypq+LQ/ZtjMsSGpLN
 1Hp/qT5WcEn9NqKr5CkggY1cVZqcRBs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609180184

On 9/18/26 12:39 PM, Pradeep P V K wrote:
> Enable UFS for glymur-qcb board.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
