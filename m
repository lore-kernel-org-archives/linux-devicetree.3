Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AAE475342
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052522; cv=none; b=rzAc/iyVIk8ZQSVZu2W31pLsWvNCshXVSaHac/T/ltHpgKTDcizoJ5rOZ7qU3RMqdk+V7RN9YM5PKhuP51LcphCueivHW9JKsbCb0DzN/Znqnk4S4KejCXzDBUpg6EDI+JrILxvwp4E1x4e2nqoLNlQN4IfEOIJjz9ZQKKrwcAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052522; c=relaxed/simple;
	bh=7uEynTHh5kd50El0ba0u4JRcjs1jGd2df8aBiCtB2oA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGKxFTTgFRg1q3IPWh/o76Qr5HFPAOmWOTSf1adpt5SKybtfEPJ2UBac5L42kiCT86m0r+t0IbuXKTKp8jx+1my6/qC2enSi2GknBMDwNF8Reee6tlI4TmsaH44Jp7DcrvyM/RFhv1IfBJER3YCmNUyQCVJpRlsDTtrXTyH4xT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQXW1ak1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kgboVFQT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQXW1ak1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kgboVFQT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7hZp244653
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	udDd8gjgttXwwVqj0RuEd1JWfiIRwWYnEstfTeLzu7w=; b=QQXW1ak1Nyh5vOib
	yOdnL8KIJo0IKs5cJS/zUQMgExlQ6DrYOU85JcN7SH2dHhsA02JMcBJadxaySmHn
	hFBOusd8cCCT0kI4UVVXsAhdCJ4amN4J2xWAgvfDI3K83kyhd+ZNCRfdq0PBrHQS
	imH8oDkq5c4HDxgSZpXlfvVRKFLZZFfUW9sA9BSAIDJIg1xxn2WKWjSxs93V4o3P
	LCdDPxR3weR6KuKAqARtpwxSwAIVw4xVpr9Sef8rrd23E+ILJv+XY7A2YvJAai8f
	FuGMKaMNrFuM72job16VBKsMn26wqJxhg9NodhW82VQD2PXk7twAAlTEXdw4gVR5
	AzYtTw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfmp93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:01:59 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28deb7ee3so9077884b6e.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052518; x=1789657318; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=udDd8gjgttXwwVqj0RuEd1JWfiIRwWYnEstfTeLzu7w=;
        b=kgboVFQTszap1fGB+TJ+VN2fHLW+1xGL66oE/Bmdq+T4WHquWkVuhUwymnmR80Mtjg
         vf/7ZLPH50nDP9G28XmbbBQgsef/F65sc3M8PYkxjX+Zm+4FY0XDzXjYoRmx6auRsJJI
         5qsaaoRJXM3hlErXAxHqVwtDQaN80zOgwsZVU30rGxYt4HN6cpbfl8cHiFNYuzXYgVI8
         A2RlSp+9qbH61n9Tmwy/0hArXNWdDO5UjISCIOMDYPMebdDmo8N8J1wOSGQ5XX6rMPA1
         Nu1SrmX3Bti38OpUfh7zcaCWHeuakTBcpeiQamfbyoY4ppotdL7GlmOJMdZRSQBQV6SC
         PPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052518; x=1789657318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=udDd8gjgttXwwVqj0RuEd1JWfiIRwWYnEstfTeLzu7w=;
        b=bI5Uof5ZO5DyXfDa/NCALETEEk0Iu7N1OJsy4QbYCgaPj9WLBMUX3fLJNycIfk2FgX
         GDwQoJAhaRSJEtE0HSvbO0w18wToHJeMIHOhyiq2bOHDFZ0/Eo7dZxVT6mIlA3EdYE1+
         WtGbnbQiEeh+vzHUefHHbDnwWku9GsPTcf/lVqAL6r8o5ypOadq0EfdomfYYEvH5ET1s
         JzhEhjXv9W2WvN+VYLdPKoHs+ZkFdDC6Bw2VPZT7XRsExC0CdU6O330nOZTwz1S7I+Ql
         WVqbILZjPdK/QpNzvi37GGM2IFIQxRz0C20hDgMtzcR7ce+Vu5/Z8dQI0MNEkLnAia5l
         fPZA==
X-Forwarded-Encrypted: i=1; AKwUvBwexROf0nT98PFkcXGkINsaYIpUdXRS5EvcjtP7zWl6Mf8rdq9oCImyj442SKfbmUg7LJ6SFVJN7Aqc@vger.kernel.org
X-Gm-Message-State: AFuF++mFBZRzE0d2rA/JPx+QOcYHGhdY/RLFe2xcia3E+30J/ZYiiXuS
	zKGGlUN1BBQnPOc6I1gQJfmURBNPTbm1tefJ/LqTThpYwAt6yJLssbbl5OoT7MRwfnQtsSUxHeP
	KwTYeGkakcjMEs4RB0H7p7nd8LE+QAVh1Y+NHQ9iYpODc41knA7ilJC5jrn50kTjp
X-Gm-Gg: AYBFou3TdxkR8bQBcd6u+sAu6AnyGm/Rb5qAwib0GcA+nbvQ5E/XnLtg3OcXtqBdnie
	3YcRbKlcxLUr/HPz4WmjVzb9IxmM7y2ADAo7Kfaf5x11JBuY3uR45+Dni6Fx7wYyX274xfDkS/q
	5E382OAHASLVTsKG7lXJ/ceJlJXk43mYDWDjZByBF3oBm+RhfYxIeprlI2oZwAndcaKAXxrE0Ta
	oGNPyZziG4taOtJZ+hQZ4qKKcZ0Dypm8Lhk5F0w5VWn6/u8LJQ50RjpLEGUN1zPhECC+RIqsSQk
	MdNMkfZsHcvP05RHyWdmQoolkHZoanjYR5+66WDavwRCdjqrgkTunTKUVsJeiicjR6HgZc3Jdpg
	oINLnsqE+p2OSSB4+3eg7IT7Sgk8=
X-Received: by 2002:a05:6820:16a8:b0:6b3:5478:1a13 with SMTP id 006d021491bc7-6bee715a825mr4673552eaf.32.1789052518059;
        Thu, 10 Sep 2026 08:01:58 -0700 (PDT)
X-Received: by 2002:a05:6820:16a8:b0:6b3:5478:1a13 with SMTP id 006d021491bc7-6bee715a825mr4673344eaf.32.1789052516130;
        Thu, 10 Sep 2026 08:01:56 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm54086798eec.26.2026.09.10.08.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:01:55 -0700 (PDT)
Date: Thu, 10 Sep 2026 20:31:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] remoteproc: qcom_q6v5_pas: propagate
 dev_pm_genpd_set_performance_state() errors
Message-ID: <20260910150150.y4liiiig65azpd37@hu-mojha-hyd.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
 <20260909105049.1317985-2-mukesh.ojha@oss.qualcomm.com>
 <20260909110839.D79451F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909110839.D79451F00A3D@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX51Omx9yY5jyP
 dx14Fe01LN/+5u37d1NVFwC6YH371AeQNPBPeBql7S0Ka1yTU/lmfjNKA3TudnwBWOLMLwPDDs8
 hfCWGAy9XLX/2fvVrzjwqzQnmYh9+yR4KnjS9cXCQqzhgpaAD28Ffp6DX/hzDE1iouRY88oBv/Y
 PKDTRQGjo2+M2z6hxHrcIoJ50q4fjHHQ3zbUNCndZ28HIOOXZ37Az2mOp8mn145dediArpRBgSt
 QZP01ooVaVE8aUk6KtOJXqFNGcCSIOGo6D72pHKeCC84OfAa+xPlwyDdp8m9JwckVKtyRJF4L80
 US8LDYf1unEKgeogooLKCVA7mtMoMuMFLccVRr4fHOyQM/r1mUaWMUY2W+qzAK1fRbRzY95Oli0
 vCBraStPGQePGwAkaZMQU/XKonxezA==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa2c667 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_XHDsKmZH_2k6JMHfpYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX1uNNBPVQ6F2H
 tmM5AkudazfCt1CrUIvzvRazkbPee9EG9Wo4ysudv+RM+ArGODu/RVc7sI3YVaOGgBnu5+3PqkL
 SJdYVKjuryptPl87s3ASN9dPN4DwEeU=
X-Proofpoint-GUID: widMhOfAUq50_u2s3wMqng06N5yJ-Yyi
X-Proofpoint-ORIG-GUID: widMhOfAUq50_u2s3wMqng06N5yJ-Yyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609100181

On Wed, Sep 09, 2026 at 11:08:39AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] The added error check for dev_pm_genpd_set_performance_state() is dead code and completely fails to fix the silent failure masking.
> 
> Pre-existing issues:
> - [High] Pre-existing identical sequence flaw in sister remoteproc drivers silently masks performance state errors.
> --
> 
> commit 79e5a0b96d1b1d35117390df652884f8c2c16c71
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> remoteproc: qcom_q6v5_pas: propagate dev_pm_genpd_set_performance_state() errors
> 
> This commit attempts to capture and handle errors from
> dev_pm_genpd_set_performance_state() in qcom_pas_pds_enable() to avoid
> silently masking performance state failures.
> 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index ca8e61254c449..42bcbe72f95bd 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -167,7 +167,13 @@ static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
> >  	int i;
> >  
> >  	for (i = 0; i < pd_count; i++) {
> > -		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> > +		ret = dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> > +		if (ret) {
> > +			dev_err(pas->dev,
> > +				"failed to set proxy PD %d state %u: %d\n",
> > +				i, INT_MAX, ret);
> > +			goto unroll_pd_votes;
> > +		}
> >  		ret = pm_runtime_get_sync(pds[i]);
> 
> [Severity: High]
> Is this newly added error check able to catch performance state errors?
> 
> Because dev_pm_genpd_set_performance_state() is called before
> pm_runtime_get_sync(), the proxy PD device is still in the RPM_SUSPENDED
> state when this executes.
> 
> When called on an RPM_SUSPENDED device, genpd_dev_pm_set_performance_state()
> merely caches the request in rpm_pstate and unconditionally returns 0.
> 
> As a result, this check will never evaluate to true. The actual application
> of the state is deferred to pm_runtime_get_sync(), which calls
> genpd_runtime_resume() and genpd_restore_performance_state().
> 
> Because genpd_restore_performance_state() returns void, it drops any errors
> from the underlying provider.
> 
> Does this mean the failure remains silently masked despite this patch?

I should drop this patch as it seems not checking error value was
intentional.

> 
> [Severity: High]
> This isn't a bug introduced by this patch, but this identical sequence flaw
> exists in several sister remoteproc drivers.
> 
> In qcom_q6v5_mss.c:q6v5_pds_enable(),
> qcom_q6v5_adsp.c:qcom_rproc_pds_enable(), and qcom_wcnss.c:wcnss_start(),
> the drivers also call dev_pm_genpd_set_performance_state() while the proxy
> PDs are in the RPM_SUSPENDED state (prior to calling pm_runtime_get_sync()).
> 
> Since they are suspended, the genpd framework defers execution to the resume
> path where errors are discarded, silently masking performance state failures.
> 
> Should the initialization sequence be adjusted across all these drivers so
> the devices are resumed before setting the performance state?

No  need to fix this; this seems intentional across remoteproc
driver.

> 
> >  		if (ret < 0) {
> >  			pm_runtime_put_noidle(pds[i]);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com?part=1

-- 
-Mukesh Ojha
