Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678829;
	b=fjHRNW5v4TDAYH/aaYTW+/O8YH/ecuS7k/7ugi93teBrXX8Ap2f6AkTnKGlMjwR8c3B0
	 tbomr/UwtEQBMfCQ/7EmiIQ3eyZyqdmIiJQ/nGGcMJPRLzRI6Ffnp/YogmyUrro7xc0HS
	 F62zCi19sudiAFfCs9BenvhoPAZIFJEzVgDaHGt0yyVQn1F+rHF+hF2T36zR977Wielw6
	 NpZlaeYV3GHIHB0kto+4gOvK/01EhXKpYewdcUaxEGP7ZQ3Q0pyrEMuzVArg4Zp9O7+aJ
	 /JmplJdmK66poRc+ANqY95lgNu4briETgZA2kYKkVDzTtRAKIfWTdoy6Y9iWGcDfN3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678829;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sXWlGCRC9JQkumWInitkE8i9IQlzJPF9vbX50igGRpE=;
	b=RQNyoKPjQbkbJ4u9UQW3YF/AjpRRdiLZiofQ1Qm26HECX2zgQ8Ac3xjRnTzls0WBUVPo
	 aUnR8YqDewfdKpaOB9VNw+s0WGmTYUY38wYN9uMwcMdMJSfhVOUz1tlFmqbE0ByCvna2M
	 sY1WWQH6/56YmIGqmqFnwM3Py0Zbxb77l4KRl6yGIOux9krsNM1w5OK49KlnLuhS7bbSr
	 xuCa4FVFKL9WT7VdQ1HgJ1HlxLCRuWfjfGeJ42pa8xFdmklVW7FgOt+PhMBhPUdfpP6VL
	 8YUAhUYCu7Pa4pC7XCP6kIM/pmWYMMrXWY3BlBYClL7RowVxWkEaFk5Xnsy+4Hq6PWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3r9h3Eo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbhqQaTt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52114606A696
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52114606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3r9h3Eo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbhqQaTt
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7D3P9062464
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sXWlGCRC9JQkumWInitkE8i9
	IQlzJPF9vbX50igGRpE=; b=O3r9h3EosuF9La/6Gk7uOPkO4ocLiXnApEIAq0JS
	iwKgxZwIGDvt9pNdEIF4kg6QTVy+0uGoQUvInBreDTq5wxmPe4raq10qjgEDx7gw
	XRsbdE3bKZGT/zOH3xJpEzKRQZQBjwQnwI5VSPfaH3B+TNCEtOKrl0u63w8vDNGU
	SfG3Aq76yZ0r1PbEdj+aG8j5TTkpP9GuDPuHfZ23RdwzcTuSs0sY/twBfH8v2fwO
	xoaK+fDgSNB2OxS5b+AtTecoTxS88YFn2klbbOfsaBQmEc5swCkiiMztSbSLeYDR
	eeI6dTBfmkxJ2C+Dna+XftGJ3zlNETyh1RVjYs+/K0RVSA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ark8qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:40:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so9225747eec.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795678826; x=1796283626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXWlGCRC9JQkumWInitkE8i9IQlzJPF9vbX50igGRpE=;
        b=HbhqQaTtUpIVHEYSZ/lBnCTkaiQmQU9BVp4ByHYxoHK7iB5Se6gMVgigWKa2RsKXqp
         ajWpl3lojcKhFfRrNdMSIaE0yEUrjhOf/WPSaumhIs4RtgsFoYRD8y2GdrwZc5Yd7jFF
         4R4V684rPRqQzBf6sGySOFgQMKWEVK3FBMC90QVU4ITpgNzxcaNrn5eU9lxcouzo9iYW
         ok/Pc5mKmuY/sx+3IjOcON6exSgQkxe9W07ldnmYwx0qmR1UwrZ+o2yurcZOTRxeiACf
         v/9M4YPVAQTwOKp0jFeuPYPxoK+oHHi0XNFRDtaBF+3f42hXUFmUuNPKQtZdYj/YH6xb
         pQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678826; x=1796283626;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXWlGCRC9JQkumWInitkE8i9IQlzJPF9vbX50igGRpE=;
        b=tZkeeM89aRNGY3b7PoxwkSoyBZiJh5EhtDwMJ6Kiqb0HNI/YDzAOEg3EM57hHENhFn
         HwaqD0rsdWPsUVAxcEssFgXj2QhbGcMo77Eni/VOldcYSorweVQFo650BV7FIe1EXfGv
         hO0E6/uf5Hw3bZINSRqyoDJR3p/CIqCCcErbGGFL79OEIocL0H8TTa1Q2s7Oi5EBQGId
         SQLvF8joC2lUTWwhDfGpwQuJzi06mBHwy/u6ezDWi+ADZdKZkDUlfjEdwR+zvyJiwgy+
         WobPyb0/0menFXC7bJsVrzZ5YDDClEMXO39TZeagvZ0GjOtGIUtmC91ildeZTjWuDsN7
         b+nA==
X-Forwarded-Encrypted: i=1; AL+hErG3ANkmtRTxgZny6ELkOAGNW3Y0vrb3TxJKioJnUR2myqa9fzscKfyT8OTXUaR64f1QxeFdstEnxYkt@vger.kernel.org
X-Gm-Message-State: APuU4Z8a8+O3K4ptgnhkb10Xuj2g8wiLRnGjLGDor8OyoYVskddM+QsA
	q6ID5u9w8/nTIJFSxQmwWGQQqLiKGi/7RRDPB42OmbL0zfaUhhZfgMqbQGlRr0E/Fv9P5Eb4+0Y
	y1fSTB7OrJ7tUo4qb/1+PwRny83gGXyeubCdeKH8Nr5ucTzIOfXYpAhiZ5UyVxJyX
X-Gm-Gg: AZFdTZfas0uXgpbNogev4dZkstl74p40AyTM2ygHl8fR/BOy/yR1vADr2oFW2g6Woln
	f98+gvo9URcouF5XBQMq8+XuBF678Ru5YhUp3X3/AfS99uiajp+q3QUKacabe0nhhq0TzklYDX6
	dGtj6rTTnmhKBnr2HGlpc9WOo/Z78NRPeU4xikn9f3CsOBqC6dWYYtxWDcYbxXGlACdY7R2PIYI
	4kSRv1vqkOKm0Q4S4GTqTTTwMJmbiDnISRqmtyFqN4sfEyUl8HK6rU7g1ztsb7H/z1eKy61SCd7
	I7Y+Cf18D8CYsAZVfHum6D1O1987cyA+O5792cEBPoTlFauOAFbW/fS9WFkKOjRyiugz11jYWL9
	yjhUBhIF58a4qlz2lNCZM97QdKdJG4gwafJMD2yWStPtNxZICy8rgwuWq5GrgJAUTrdlFeEGkWJ
	6/AZ1ljgcP/e1hT+PZ2wTMB2g=
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id 5a478bee46e88-3860b999354mr18107023eec.40.1795678825957;
        Wed, 25 Nov 2026 23:40:25 -0800 (PST)
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id 5a478bee46e88-3860b999354mr18106995eec.40.1795678825418;
        Wed, 25 Nov 2026 23:40:25 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm47180909eec.1.2026.11.25.23.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:40:25 -0800 (PST)
Date: Wed, 25 Nov 2026 23:40:23 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: Re: [PATCH v5 01/11] usb: dwc3: qcom: Distinguish PM and runtime
 suspend/resume paths
Message-ID: <awfiZ8IE4UMuiO7P@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-2-faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <20261123104727.1539149-2-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-GUID: 3wQg6oHnI5M4YmPFfZYfM21JlYFeRIl7
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b07e26b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=Y18rF2VYFuf4IdEaWfYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 3wQg6oHnI5M4YmPFfZYfM21JlYFeRIl7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfXybQWIntoYVkd
 RgWSs5bXFsEE/jGjhjyjrOKTWM35SW8GYqScWydlqUG3pGlN4UGIFNZOqmIgQUoE4KL2UxQJorf
 b0KmVtpKs8i1CFfwbgZBiaFgVgqjv9E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX2Pm+5cCA6GZB
 NA2jMqXa+Lm1xUzSZgLo4IuReBzZlsai0e8uvQKmaCr2sL9Z08s4/5mNo+CTW1Qo2FCzQ/pA5oW
 HALlR53hbFiTvVZZQLyfcLjW1wISefUXl8oYfvETHCWpMyktkPJXid1zzeztofn4IbqnYv1tkiv
 ZdldSbRdlMyO3vRw4RL5g/KrAdbM93XKeXKPO0DRrYO0DtAgZ7fh8BH9qK75Hh1E1GWR3SaPMuK
 6v1OHp8qGKYV2QHu2gZD0NZNp6lG7JpHKktdlU2sn23QEk+xyFRhqdwBDt2MVzelavWVlyIam9d
 715uB7/sYuFY0F0kn5qiCanSAhxXLsC+SuaeGU9W+EjWdUOQCpjc/HJY6fsZOjsBkTRl2jS2zGM
 humWq9aa5ZFcvnLUmTo47ZJhPwGQAbCadHRA+GU5nC8H4LLhLf0MT1/+mbOal6FWEbYzEyVtFK+
 LqYyInC/uUWyO+xXBrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260029

On 26-11-23 16:17:16, Faisal Hassan wrote:
> The dwc3_qcom_suspend() and dwc3_qcom_resume() functions
> handle both system PM and runtime PM paths but cannot
> differentiate between them, preventing distinct power
> management strategies.
> 
> Refactor suspend/resume functions to accept pm_message_t
> instead of boolean wakeup flags. Use PMSG_IS_AUTO()
> to identify runtime PM (PMSG_AUTO_SUSPEND/RESUME) versus
> system PM (PMSG_SUSPEND/RESUME) paths.
> 
> Preserve existing wakeup behavior: always enable wakeup
> for runtime suspend, check device_may_wakeup() for system
> suspend.
> 
> Follow dwc3/core.c pattern to enable future per-path
> strategies like differentiated power states.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index d44f093ac243..7a7225b900b3 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -335,8 +335,18 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
>  }
>  
> -static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> +/*
> + * For runtime PM, always enable wakeup.
> + * For system PM, check device wakeup capability.
> + */
> +static bool dwc3_qcom_wakeup_enabled(struct dwc3_qcom *qcom, pm_message_t msg)
> +{
> +	return PMSG_IS_AUTO(msg) || device_may_wakeup(qcom->dev);
> +}
> +
> +static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>  {
> +	bool wakeup = dwc3_qcom_wakeup_enabled(qcom, msg);
>  	u32 val;
>  	int i, ret;
>  
> @@ -369,8 +379,9 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>  	return 0;
>  }
>  
> -static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
> +static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>  {
> +	bool wakeup = dwc3_qcom_wakeup_enabled(qcom, msg);
>  	int ret;
>  	int i;
>  
> @@ -750,14 +761,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
>  {
>  	struct dwc3 *dwc = dev_get_drvdata(dev);
>  	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> -	bool wakeup = device_may_wakeup(dev);
>  	int ret;
>  
>  	ret = dwc3_pm_suspend(&qcom->dwc);
>  	if (ret)
>  		return ret;
>  
> -	ret = dwc3_qcom_suspend(qcom, wakeup);
> +	ret = dwc3_qcom_suspend(qcom, PMSG_SUSPEND);
>  	if (ret)
>  		return ret;
>  
> @@ -770,10 +780,9 @@ static int dwc3_qcom_pm_resume(struct device *dev)
>  {
>  	struct dwc3 *dwc = dev_get_drvdata(dev);
>  	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> -	bool wakeup = device_may_wakeup(dev);
>  	int ret;
>  
> -	ret = dwc3_qcom_resume(qcom, wakeup);
> +	ret = dwc3_qcom_resume(qcom, PMSG_RESUME);
>  	if (ret)
>  		return ret;
>  
> @@ -810,7 +819,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	return dwc3_qcom_suspend(qcom, true);
> +	return dwc3_qcom_suspend(qcom, PMSG_AUTO_SUSPEND);
>  }
>  
>  static int dwc3_qcom_runtime_resume(struct device *dev)
> @@ -819,7 +828,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
>  	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>  	int ret;
>  
> -	ret = dwc3_qcom_resume(qcom, true);
> +	ret = dwc3_qcom_resume(qcom, PMSG_AUTO_RESUME);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
