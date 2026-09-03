Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5731634D4CE
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 07:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421525; cv=none; b=K1gTU1155NCmJE6GPK/QLtJE1rW7PhMuqYbD766o/psN60/inE+VseATzF9Du11JhDvRP9oTTUxEMBHvvSnntMWBoDxsmgKfBdEr4KZlu9Uh6r7XegJ8G856AJh3gWtQ3W8G6O3aoWmodjBO2VDFvYbyCQ8po/LYrszN20cMqmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421525; c=relaxed/simple;
	bh=ZpH0V3BiX1xeS5UP5XkVFneyRdbxvPFWZs3TtaJJwL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/hVWHo31tmng87dW2upsSLNUcn+jf86/crgp+9mv0kBcz92ZJAB3dxIS405WAbO1w+pg+9JNKbHEsjNTAQ4Zoa14EZVtejJC9XZArlEvTgWZywtQNPpBTcn5FEomPPSsWobhFZ0ljB7d0M3nWylApnAXAuk+8+q7A8Lq8QtlUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOq7cMxI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OkA5Xj7S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOq7cMxI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OkA5Xj7S"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lg554023736
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 07:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7CSoZYq3KBXVxdgrzwHcBQJR
	+p1brH+pLBCnK12LtNQ=; b=EOq7cMxIfefwSGLvo7J5uYpH0oNc58JxoM6BMyuZ
	7SZwqLFNR+zcC/4rC73OVoyhN+r5KNn38gMc/rESMzrO6yWNuaYVnWsPiX3498aH
	7I4qcsyPgVptaeM+pv20/ynqTdClOCtzp5YQ59bEPJBoovY6QuYP0UFOiOIwr3aS
	16ZTd1282+fK1ddFs7dd2h8gbS+cKr++9oK1lLhgWqhBESUm0CWJR4hkM9bPI/6j
	yeLFWCiDRcAN1wb2fmEJqC7nTY4rOZXwOx9lsQZhEotrbOg7oS7ZD4hNhJTs37KE
	z6vP4xZZA73xixI4s4hteZWmRwBVWObSUvkpuiZHtVMmdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhc1th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 07:45:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f946461so428601885a.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 00:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421522; x=1789026322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7CSoZYq3KBXVxdgrzwHcBQJR+p1brH+pLBCnK12LtNQ=;
        b=OkA5Xj7SkbR91yd4NhVDs/iF6DN4VTIeyfGkBtGlgtfNKfJ/LxEXc7rLA1YgPG4NbW
         2DwRXsApQPLvnyfewGbm8lkQD6uqGTBrt0mKRx+cjbAJ2f2gyEOqBa3qnRFxb2AodP4H
         0RMtQGX4xuh+Mc0WICTEerzkF4jzoCNt4ZlCRf4EmWxUZtZKI8hjhd18s1abjp3aXBdj
         QHGQZqk/+i2fmsgXvkBR9cn5TDYziirAlvGzql/euGsUWa1hBSpQOb83jC02Vhk2PVAP
         Jhu15NIAaRrFR82d6pH6I/b2lVFN2qzNjwAgOrQOnEIi0ekiRSJ/QXqDVzIvwLHhgYrb
         Liog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421522; x=1789026322;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CSoZYq3KBXVxdgrzwHcBQJR+p1brH+pLBCnK12LtNQ=;
        b=Si420twhg0zGq7/dItsvhIHKroIIUtve8VXpKWjXjc2Wd4VwUtK4jE32q0i8G9JR8o
         k/47hNuNd+EBqSPzHdNo0Mb1q9opQYqsekmnbisYgkIxEeMY3MvP+YG+3CgNn1XjZpF/
         veIuQPpWMgyRt9IBdLhROP9RslOvxYoxRmMnS/uR4eGnVGt0uQPptEdYa/w+mRZ6RPGo
         aW+AqG++Ywgik6yUIoMlUqrWxUdv4Ca/ebWuJKj1MBWsDQTi3g0MFfM3qU9tK0OV9C5E
         Zw2B9xB/4RuyuT3nMxcp6XgWMCXu+bRxdccq6h7gWFUgAuVgprDtCLFa5NaXJ/9e+5GE
         ZBSg==
X-Forwarded-Encrypted: i=1; AKwUvBxiIjYAN39XwxVfXeFXziHpkEzG6jRI+ZdesKMRK4LuiprhC22+BKTnlh6R/zDVGKavq7fPaf/rKl0E@vger.kernel.org
X-Gm-Message-State: AFuF++nZcBI2xhvHgkEY+gQXmCs/sD1yozQgPEa5G01HRuqOxCTKcOO8
	QZauU4LZNLTBy+3JAz98dy8F/wnh/T1axhBCDEBIPKCsj647GyMiDLAFC2+n3mMUKFoZkJK2XPi
	l+ok5yhGAPwtO/JbARDcqMGJCtE8MuuFVdu022Bw0n6v9CRCKdP3GnGfZ1NwQijhv
X-Gm-Gg: AYBFou1cyFR3Pck/5r0U0n/tCmWvQti8myI/uYYkbm5ZUM0AIYWc8sj5/mGWM1V9nW/
	8BS7oGyHuKCJersJq9sW89lYQPkeuO6ifOZLLiS1FJd51C8PBH4tM8++mD7lbflutFMesHOiRLu
	t0fpxV5Mx6/qXVeBXmPGX/LHlrPNRcO77S3+HwCBV6BBbgCJ7uDx4jIxzhQQaVUthHcdGjxYIg0
	THi6QOZKwSLrWPFTjPvtuZslybUiePtm6h/Ou8hKoVTHm3Rw1VTgTp44QdL1tAqlYTRUvhbU/4+
	7Q1Nd8sXmY8C/o2u17QUiqa/E5O41NG1Z7agxMgeTmCwJG68BYMeZst+t8A/cwkS5PfakHD44ot
	SBG6nOFCfqjmAqkY3DxZqTEX2Uxof2dKUByy8AmDCr6jZKMiSAHkkwZTBTUX3QGrinWyCcjracV
	GTg97/De+ME2TI
X-Received: by 2002:a05:620a:468c:b0:92e:745c:6c5a with SMTP id af79cd13be357-93960dd6fa7mr1181065885a.14.1788421522334;
        Thu, 03 Sep 2026 00:45:22 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:92e:745c:6c5a with SMTP id af79cd13be357-93960dd6fa7mr1181062185a.14.1788421521913;
        Thu, 03 Sep 2026 00:45:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b0f173sm1111969e87.7.2026.09.03.00.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:45:20 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:45:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] remoteproc: qcom_q6v5_pas: propagate
 dev_pm_genpd_set_performance_state() errors
Message-ID: <kaad7btqyhq2puyjjnm2lp5e75hjizhpnaiyaol74icpkcfjlm@7yzadtvizm2e>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
 <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902204334.2061226-2-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: ZLtmiMU6UB2xYaRVpODOHzsd-o2imH07
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2NyBTYWx0ZWRfX5Pm6uqRk8F+q
 QaQz5HofKtSDtaFe3lgJ9F35DqRb++4dmEVRh7Nn8WqBewPyiu7NuVuhNwCuvQxLaQmpLR8U7xr
 NOsdc8NsGdqe+gqAH8AVqkdCz5lNqnLm5dROSzvGwKog9Sdv7W3o6cuoXmIJ3j4T0zM9/srAv3/
 FNHaedlrBbRm3jrqbtIX5Agu8pK1RTZq7sIlbZBr8Hv8CvBN8DWzKBB45ry818StWPqq4kVvzmW
 ciu4PwK5SeM3Fc07phB7eUerrdgF90hf2H/0TrvaSTb4IdybUY2i/r5IHqPe+ZXTxBcZJZFHBxY
 1aGOG2W5nKx4hrIfs96llTafcBVtRr43S7F6bhIn0YwO0cLxqvYQ/ll/1ueBLkOfbhBEt9+3Yr3
 F+Y0DAYdPBQEnNh9APexo2xpowpPA3TtMfCsABn/L0C0maex0u6k/UZgPqNQ/0SJL2P/YUu+KE3
 WHIQRy/80emfc1++dxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2NyBTYWx0ZWRfX2wi+Cl3VVZxD
 SF/V3vDAJJeTXzEVvlDo5wO9JKRwk1V0oSilr69iYzxVdv6ZufaulpQr4WRYGyQMHbipQAcWKhw
 1XUWHChXs3iAva7CHnW1I0J6UEXgtbU=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a992592 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=h89225zfqaSm5xtrkw8A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ZLtmiMU6UB2xYaRVpODOHzsd-o2imH07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030067

On Thu, Sep 03, 2026 at 02:13:32AM +0530, Mukesh Ojha wrote:
> The proxy power domain enable path discards the return value of
> dev_pm_genpd_set_performance_state(), masking failures silently.
> When the call fails the performance state is not applied, yet
> firmware load proceeds without any indication of the problem.
> 
> Capture the return value and emit a warning on failure. Firmware
> load continues regardless a performance state failure is non-fatal
> but the warning provides a visible signal for debugging.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a005546c265d..01dc0194e130 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -167,7 +167,11 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
>  	int i;
>  
>  	for (i = 0; i < pd_count; i++) {
> -		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> +		ret = dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> +		if (ret)
> +			dev_warn(pas->dev,
> +				 "failed to set proxy PD %d state %u: %d\n",
> +				 i, INT_MAX, ret);

Should it be turned into an error?

>  		ret = pm_runtime_get_sync(pds[i]);
>  		if (ret < 0) {
>  			pm_runtime_put_noidle(pds[i]);
> -- 
> 2.55.0
> 

-- 
With best wishes
Dmitry
