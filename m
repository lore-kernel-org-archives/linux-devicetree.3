Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F82238C16
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726276; cv=none; b=Xdb+SyRxPKvx0Cfpofst2H67JFbo73m9PtU1RyHeNWzfcziVHoZgkTjmkpNe63Cch37U7nuCzg5SjBHvEBhqTMBDmxMm2sQO4qWhr8TdcdQCLWkDILtGbu1AOXQ31n1WLxf0PIZ3cF58sJYi5SvFGEdSwUEePcJymuVYqiDGL1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726276; c=relaxed/simple;
	bh=sh9ZU5Ncc8RUC8V42Rp9x8UPi3xY/aC/ruJVJxi2z8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LC2uGILGJFaWgdIPG3Tcf9vyt+OXH745vPPbD2m7vbyM4yrta8wxq+yHbZXVvKqcSUyU8glAXqWmBl1oS2yWKNjtVDUkvYs3cwtpAM0MYLsXEOtilc9kujaf0+Xvmpx1m6WfsmFlWzEMLJBcT6+wRB0AXcw0rQ0dVMwVYVFHIoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqU5K5hl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CtCxttDY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqU5K5hl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CtCxttDY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD1Yb6573980
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f/z7Vf0CFs4vDGQLLJUD618C
	7Uy9T9x3H6mGeOakJz4=; b=kqU5K5hl5hqAHl193dF9LYbBD1n6i+hH+eRENipq
	F/kc+RwlgKLOjraw99yyeEPx/Nq5GbVaQfgg8WeWn/Ug+vXer9jq11xaazD8fMh9
	KrbQGTT9vu8Vpfmjx9VnoC+6ESAjtY4YpZJIuUYUrvIYXk0Z1+zFuGhkOd0NIaTT
	WxWXV+VmVxDCfvsbEjAshb4wjZyK6K5wIGIDRH00cRJDVQHrOnCtD2qHkXcx+xZf
	UyAj/k//BodvU8oJUteC+8qGT2cQlXBv1zpZMmMnnsyL38ic7qZZ/RQe+bY+ra7W
	1iVTlDKlrnF4vZKO+LJA6E/WgpzS4ULLZ73Ya4csiZdYWw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju228ys0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:17:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso256460091cf.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784726272; x=1785331072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f/z7Vf0CFs4vDGQLLJUD618C7Uy9T9x3H6mGeOakJz4=;
        b=CtCxttDYStBA3OJevCcBGryx2izzuqPxm+j1jOvrDWv+1+hbua45pFuJt0NJu+aKWz
         Oy7XauuGmVI9M7UPeYz8yf2gu56+rGr3v/ssXMhQhv1kZfz1lH0QFQP2klNjnk7OTcmW
         2ORlNhoR4RzljcAS/Y+xs7BYsO1EiqG5Q/4MQyKnr6DkEQKIyLjD39ZGrZKTpL39vFhE
         lXW1uUdw9krwPZQ6ug5VAfiS7IFeTtAYHiBAmjyPsvw6YTjCUq2ZU1DWNPx1RYD/1f9v
         7D5V8W3Cs7fOLWPRf7Zw1TXSKeUV4SEHO3rIav7b5Zw8sGSIcxi/NQagVJvSerq9TyHK
         q17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726272; x=1785331072;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/z7Vf0CFs4vDGQLLJUD618C7Uy9T9x3H6mGeOakJz4=;
        b=cLRxqpLuU6LyfbwpRYc9FPu9khWNfcVTvy+5BQqPoMJQGA3Rd/k9pMwH1GiPaCdzhI
         FS7Xc08taqMBQJgY502XX6AqolVMgyFd9iHFQuovJ/nR9Wu5oI/WjwEeo4DU+cJ5/HLu
         bx5EvUMmU312pj74B70u1rY23fU3hfBq7o7DwtD3J1cZc/cttgozkdetGEceRY3eQCmb
         3NrEwA99V55L2DqBd7nt4JrCHuDR1cnKw1dlxPt1KNnvNg0wXu1JPeEYIMcybK3LmpEQ
         RBVOUBJN/tQ68IbtdDcLtm0dGBNUdLn4dC28hkA9agLzrUEhlDnwV8cJdTYsHaPtE0HW
         nL7w==
X-Forwarded-Encrypted: i=1; AHgh+RrQQCZT22FS/8iKvmHwpu7DV9QcAaBwxp7I0Nr034RNmh7ozh1tF0T3hf6Nl6SeneSt+Pyxdne9Do08@vger.kernel.org
X-Gm-Message-State: AOJu0YwQMCpEBD8W/Hj/6dTQKxJoKYz9VhbSqrUFvd8+/3hZqpsad36P
	DyiByIueIbipoXck9D5203ax/EYNFDDZHOX8f+XkG3ag6qsvQZF7lK9RenBfcJYg2l4rFMsxvKS
	DUA0hsH1jsxb9zwOYvixlCND4B6deazh8IiJHyAd79sBGTtoNzNLtR1nUzhdlP5i8
X-Gm-Gg: AR+sD10+7BFjWYyDNy3o4nvA6Z2ietLUrPqFbQxuPuufxntwWzvrCz6bK0rp3WR1YyT
	GRhM//PhRpFZrFqtRoLo13KErI7bjJx+YwuADYx3IshrG6mSGY81LegbZFyL5RweRtbx0n4BTQI
	X4O/KgT3U1HMFT82WURB5dIkQfPW6oU9GWLBcuRjeUJ691Kn0OuBvGN0c/hdG3+msiu8c0VatMr
	J4mYIFnatViAtHUCK5PnmzC8zJOaZ6OWXBwW9f0EMcb7S5Qf2XigxoPEpv2epBuBUK7izbZgLM5
	YhUwP1LAbkcS4N2u/Ud/xaIywJZN0yl3xtSDSbXb0NhO3dR7tlb/bm8dEwW9aDmi1q5QYCesJOT
	7BJUe+BAfhmivPe4CC0UwvbJxsDhnXtT8WB+crphPArQcjzlovXVuTENrP6qB/ZZW/YakHAgmfK
	QHrIT/fr5dl02y1w==
X-Received: by 2002:a05:622a:351:b0:517:6b31:8058 with SMTP id d75a77b69052e-5213e0821f6mr207212681cf.40.1784726272579;
        Wed, 22 Jul 2026 06:17:52 -0700 (PDT)
X-Received: by 2002:a05:622a:351:b0:517:6b31:8058 with SMTP id d75a77b69052e-5213e0821f6mr207212221cf.40.1784726272083;
        Wed, 22 Jul 2026 06:17:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e4313fsm463602e87.60.2026.07.22.06.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:17:50 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:17:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v5 05/11] power: sequencing: qcom-wcn: Report power
 controllability
Message-ID: <6lxktlm5suakzub7gvlhianc65yeiqjbbodimsikvcicciag3q@ugcdr2gbg4ok>
References: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
 <20260720-monza-wireless-v5-5-69ec6743543c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-monza-wireless-v5-5-69ec6743543c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60c301 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=dA91eB7zeV-DSUTtgBcA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: uxHCPBirr5pi-KST_Mkq8GDSYEkrQZal
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX0hA3Yn7r/MeG
 kmMkhPoO/OKZQc6cRtj9KB9ktApLzzRbga0OCxw4BwdMzpR9O9fb/IMq5wFJgNRgMBbiE7i+E+T
 rl/DSxzO76YsUh+WQpZNnRtGI7iP7Rg=
X-Proofpoint-ORIG-GUID: uxHCPBirr5pi-KST_Mkq8GDSYEkrQZal
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfXwojt43CVs6aA
 UihimFUzZfsRujoyu14wokyi5z4+3Cn9usgVx1uS7fsnaYx8juPTXCkH9hAsr0PvqAazfPxQDVz
 dYg7Vcq0IUk3TmHtX5iPBKivvBA9MqDQdWHT0CkJPn9ETlEbeIbP1GamZQ1glCpQwHeA5XSaanA
 TmIREhatIP38HgLsTOZqzUA/NJ4Hepi53/2tj/+Bjg5zmISExJZpIIgTtJdHc8m/+OMMh27Kfoi
 TJ1/sKsQGBDluA2aVd/6LA+ts5ZFRcp2vAKFqrEiOansdbClWhOYzELrd5unVN+dPT168sKU2fz
 bSyYZAOOQJisCPNBldsCKilRdaCFqIVXma6jvHYrIsKBrfUsZhB0oOQ07UHHNO/3dQmKcBa3QII
 pEkmqDocDbT0l//CL2EiPXkQ0FHFbsft2PKEKASplUFH/59EX1VqQQ33lVAszEiZHawqRNWDSfH
 MVQkdpNj6LyeCFZ/FoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220130

On Mon, Jul 20, 2026 at 10:04:07AM +0200, Loic Poulain wrote:
> The "bluetooth" and "wlan" targets drive the BT_EN and WLAN_EN GPIOs to
> gate the respective functions. These GPIOs are optional, on some boards
> they are hardwired to an always-on pull-up and not routed to a host GPIO.
> In that case the corresponding enable/disable callbacks are no-ops, so the
> consumer cannot gate or reset that function on its own.
> 
> Implement the .is_controllable() callback on the "bluetooth" and "wlan"
> targets so that consumers can query this via the pwrseq API.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/power/sequencing/pwrseq-qcom-wcn.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
