Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7970E3E0C75
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009258; cv=none; b=YHdr1+S73AHmGGPzX9UtyTaGAZsS66DmRLasM4RGH/GLAoitRZa+pv76J+G5GjvgB7z4WrNqojjcB7bP0Xw363H49CsFprM41jNrpYAMpoONLpUR2cDOowVpTGtBJ0fwne41z83D8+713ML9BCWzuF4jcJlFfutD3WeuOUJKsjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009258; c=relaxed/simple;
	bh=2+IIh+YaaI3upzK6XxNu/VDC3LcxkPF1DIyILN9NP78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nK55nlDbg44ZGL40rSFI4BNoaDpKBy/g4BCGJ52cWrp6NhyU/EwcRkD6HmaFdT6uFfXQikiHYYgPRjX7y/WlVS9bZ/8JNGb2DVhDa5EK2XY8BL/9HFc+AVh85SSD2Dieau2NXRSrOhB7CvQK9OXMDdJqCSbilurCf/lo821Z0Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckim+fKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y03AQI8t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckim+fKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y03AQI8t"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769esNW1855976
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 09:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IOdzPcc7b2tKDYHUhaw2Emyx0bsIqZcJysJmH0I7aws=; b=ckim+fKtyU2JD5la
	hbrb5ve1fhfwHtQY85GvBbgkw4e5ICFDRbPfuVQJpIogiOPPTWCIqpRSalXQHpiB
	AzvfozVd0byq/xzCJqJidIL9fFzQCt5uoFmmWFwUgWXuiVFzGHLE2Lj1NsIukCB7
	vGxYIVjtYensxX9fwkRA7n7gexpiH+5eqGFUZ6JQ3vRnsOFLHoOemeXpAVOZxias
	Pi+OGs7n5UIk02aekV9NyPFnGkopBs26/EFWedOnEp7/iiK0Cw5anNGhv/qaMJqq
	VFiB+Bd3K+ghmnxDzGukyXfns46i5KWxU8vrz9QRnYnBna0ZaAQq2R/rpmxibDcM
	XbgFgQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuchc13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 09:40:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso21136231cf.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786009254; x=1786614054; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IOdzPcc7b2tKDYHUhaw2Emyx0bsIqZcJysJmH0I7aws=;
        b=Y03AQI8tmQj0SpKlY7xSOcjuRCFyUrA6UcqeDl4mRghYxUgDp8CoIgBzVmgYs6dNEe
         sDytqZ2CVvUUV4ANPgK74XPgG97Eo9j6if6Z8abbmj653HR1va3j/FcDpLq/VEc1bSCq
         oda3eQDXqdf7lbWj7izgwwVT24YDJr2sMufpLVfK1urpgSLiGF+8vEGRlb1qtOVaRQq/
         uPvhbjxsuOAcPvj8TSX6h8NA9f9z63FHaMf2zNysq6GUMektvUO1UezejXmTSulP4yBU
         n54klGUhih4Mr0E/ZkfIugTXJ/mWfbZdzvthjNmFfl4mzgt5YW3616BqMHCpW2xl4bCH
         XQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009254; x=1786614054;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IOdzPcc7b2tKDYHUhaw2Emyx0bsIqZcJysJmH0I7aws=;
        b=cBcp59tpYT5dCbx8+703OCsfnSq8kcGjx6bGPdrMnvgvcomSH8f3+fgOI1FZ0aJCQX
         hm4HpLjPYkERW84uk7/3We3sawYIDcHgN3vpWbTF9jqnxXDpThk6OODFDOmVlds2xM/9
         Ewb35jIRgP/zO8aZE0nUnYpDyHOXqlQhWCFr4xd8jf4cYzNfzmS2Ile6rH88QDG2sQpS
         3DIQZIxq5y0dQu4dazB/es2o3ISNVDvO2eyoiIe4rPETigqQUY681KhsTmZyVqr3UfWu
         6xk/IWmqqeQ2bKpp5RsnjXUmSO8xileXKBr6trhnmxqrU90I9t6dYdu8ctjDgY+DASyv
         fxnQ==
X-Forwarded-Encrypted: i=1; AHgh+RoP9tGKMzF3rzjayiB9sRtBIYTnSWihToY7GLNcaM1C60GCjX5rZzGUA9vRLdG40YdBcu08rB3mRbWD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb4Z3ct30kcCcNCIEXE4Q8bu2jpdy6qkdpPxWvX0D42xnb4RcP
	yQZozIWpag9KAlioeGes1+zYIoEwF5S3jyiLnXUQTHnhH7SLaE1t/bVF9Upzw0is0U9FafeRjOr
	q3TrG9JpS9ecWybvgTfiPmA7X0ErdQ8URacWrwLLY+aFDkOo1Q/thd1NTem74kwLX
X-Gm-Gg: AR+sD10z5FY8kBG0pVPN5qs/jk2Vt/zedlFX7JPxjwqyVPIDV+7w4i6DWM1lsDdgeYD
	lgWXtNiWF4V/HuZz708+Ld3pfRMOSqlI2thWFlMBNXb6eo4MpoIbtU36jss+v0H0oGQeJekI6eW
	I/rnt6Kvs5CI4JEiBeYvSJyVn5QsTbP2lROSACoRRtM6ust7c1xCNrC4OveFMFp54voAxWJF50y
	53Gt2RDoYEQpZBwewGlFzEExTzShHPdYKCSfD6he+qUNUk5i1z31jdd1M29ww4OtP8vyq9P1SGk
	1KenXwA5KQo6D1JW2M5OyEdyELiPSdQrpI+txcoOPGbQzNnZtr3HjEOegUEL8zHW0ihsqk+q75w
	f6Tkhur+xiqzxcxgUlKEKon/TDzcXxpwCJhYHaF/zOVX9OTqdUyac/TkFQE/G5B1RnPXLK32G1s
	3AKlqwMz85zwK6Tg==
X-Received: by 2002:a05:622a:60a:b0:52c:e0bf:dd79 with SMTP id d75a77b69052e-52ce5f7f999mr135415151cf.16.1786009254527;
        Thu, 06 Aug 2026 02:40:54 -0700 (PDT)
X-Received: by 2002:a05:622a:60a:b0:52c:e0bf:dd79 with SMTP id d75a77b69052e-52ce5f7f999mr135414831cf.16.1786009254035;
        Thu, 06 Aug 2026 02:40:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f6235db6sm615847e87.4.2026.08.06.02.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:40:52 -0700 (PDT)
Date: Thu, 6 Aug 2026 12:40:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev, linux-arm-msm@vger.kernel.org
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, devicetree@vger.kernel.org,
        conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v7 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
Message-ID: <7ptv24tcqk6ym3pkiuo5y5klhv52nycwhg2zl5usxme47cmflw@pg3lays6zpas>
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
 <20260731-b4-qmi-tmd-v7-2-3befd44403d5@oss.qualcomm.com>
 <20260731105316.BDBA51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731105316.BDBA51F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3NSBTYWx0ZWRfX0W664zzYwgB8
 4DSTdUqT3t/xo+rxvLwyYNxFixEut6JZxdDD/lcJfi9PP4dacQNriJrjGGDvz7oDBnGPv4bZkmZ
 H1N1jG2NbBVWQi3bt8ipl71/4fd3V8w=
X-Proofpoint-GUID: TY06PGbjRbA3l7PvS-A6yf-_qQzn1i-p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3NSBTYWx0ZWRfXxH/jA4mVM0qc
 tti4OPIOy2Qrh9kDHE/ixQ1CBnxmT3uUjaQb2okqeKaEOHDNWtockivOKDpAsMXj7LLReJOei0V
 Bf8kFKeUct3yT7vMvffF1BxGphpuN8xyuMEPQQSN2gxt+lvxdByEC1EtvC3jTEyiyVAhjW0jbRS
 cZh0eDHJxv46rOGCYMylX1j1X9rkzLBsKtn5cBaRNW5iw7dtUx0t9MNNpWPXlYCGire72FzadXq
 Y6sJubWFMu/fWvEwGUQ0oHBj83ld8e7W0H7EG7YhzvlWrAQUMQ1s75Pm0tuTGOsuzyhmMAF7pH9
 iZ2SP8iXPHPgQ7Kd3joD1939cj8YBtzfJg+rUU1UNpZQXECSLZkfX01758Z88fn3v2ZvA27kyxN
 LBJvIsEr5N95QuXLDNLh7N53E1pxiy+S/AxP0TL+ukprsrFv5c7IoGFX+Tj8nFAp9JGToSaFeOG
 Dbg/Gzsq9jqrurW8+Cg==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a7456a7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=fmFFBQzJVm4u-eB6PWwA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: TY06PGbjRbA3l7PvS-A6yf-_qQzn1i-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060075

On Fri, Jul 31, 2026 at 10:53:16AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Returning success without saving the requested mitigation state when QMI is disconnected permanently loses thermal mitigation updates.
> - [Medium] TOCTOU race condition when reading `tmd->cur_state` during service reconnection causes permanent thermal state desynchronization.
> --
> 
> --- Patch [2]: [PATCH v7 2/9] soc: qcom: Add QMI TMD support for remote thermal mitigation ---
> commit 02c2244c0a2cebd6be4e1bf4e41d51362be19b5f
> Author: Casey Connolly <casey.connolly@linaro.org>
> 
> soc: qcom: Add QMI TMD support for remote thermal mitigation
> 
> This commit adds support for Qualcomm Messaging Interface (QMI) based
> Thermal Mitigation Device (TMD) cooling devices provided by remote subsystems.
> It allows client drivers to discover the service and forward cooling state
> updates to remote processors.
> 
> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
> new file mode 100644
> index 0000000000000..37e6ef19a0b34
> --- /dev/null
> +++ b/drivers/soc/qcom/qmi_tmd.c
> [ ... ]
> @@ -236,25 +236,54 @@
> > +/* Notify the remote subsystem of the requested cooling state */
> > +static int qmi_tmd_send_state_request(struct qmi_tmd *tmd, int state)
> > +{
> > +	struct tmd_set_level_resp resp = { 0 };
> > +	struct tmd_set_level_req req = { 0 };
> > +	struct qmi_tmd_client *qmi_tmd_cli = tmd->qmi_tmd_cli;
> > +	struct qmi_txn txn;
> > +	int ret = 0;
> > +
> > +	guard(mutex)(&qmi_tmd_cli->mutex);
> > +
> > +	if (!qmi_tmd_cli->connection_active)
> > +		return 0;
> 
> [Severity: High]
> Will returning 0 here without saving the new state to tmd->cur_state cause
> thermal mitigation updates to be permanently lost?
> 
> If the thermal core requests a new state while the remote QMI service is
> down, this returns success but drops the state update. When the service
> reconnects, qmi_tmd_register() will re-send the old tmd->cur_state to the
> hardware. 
> 
> Could this leave the hardware running unmitigated while the thermal framework
> believes it is actively mitigating?

Please address at these comments.

> 
> [ ... ]
> @@ -298,34 +327,33 @@
> > +static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
> > +			    const char *label, u8 max_state)
> > +{
> > +	struct device *dev = qmi_tmd_cli->dev;
> > +	struct qmi_tmd *tmd;
> > +	int index;
> > +
> > +	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
> > +		tmd = &qmi_tmd_cli->tmds[index];
> > +
> > +		if (!strncasecmp(tmd->name, label,
> > +				 QMI_TMD_DEV_ID_LEN_MAX + 1))
> > +			goto found;
> > +	}
> > +
> > +	dev_dbg(qmi_tmd_cli->dev,
> > +		"TMD '%s' available in firmware but not specified in DT\n",
> > +		label);
> > +	return 0;
> > +
> > +found:
> > +	tmd->max_state = max_state;
> > +
> > +	/*
> > +	 * If the cooling device already exists then the QMI service went away and
> > +	 * came back. So just make sure the current cooling device state is
> > +	 * reflected on the remote side and then return.
> > +	 */
> > +	if (tmd->cdev)
> > +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
> 
> [Severity: Medium]
> Is there a race condition between reading tmd->cur_state here and concurrent 
> updates from the thermal core?
> 
> When the QMI service reconnects, tmd->cur_state is read outside of the 
> qmi_tmd_cli->mutex. If a thermal trip point is crossed concurrently, could
> the following sequence occur:
> 
> CPU1: qmi_tmd_register()
>   reads tmd->cur_state (e.g., state A) locklessly
>   
> CPU2: qmi_tmd_set_cur_state()
>   acquires qmi_tmd_cli->mutex inside qmi_tmd_send_state_request()
>   sends state B to hardware
>   updates tmd->cur_state = B
>   releases mutex
>   
> CPU1: qmi_tmd_send_state_request(tmd, state A)
>   acquires qmi_tmd_cli->mutex
>   sends stale state A to hardware
>   reverts tmd->cur_state = A
> 
> Will this overwrite the new state on the hardware and cause the thermal
> framework's view of the mitigation state to become desynchronized?
> 
> > +
> > +	tmd->cdev = thermal_of_cooling_device_register(dev->of_node, index,
> > +						       label, tmd, &qmi_tmd_cooling_ops);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com?part=2

-- 
With best wishes
Dmitry
