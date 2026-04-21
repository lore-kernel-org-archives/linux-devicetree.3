Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0D037E31E
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 06:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776751574; cv=none; b=LuPp44mf3vDWIgR7zRAZHjOdtY3EJJyV5N3gmfETqmM5PblTmpTVuTBL3Tf91MiY4zZug/IgMNn07gA6KtgjElSn/5thpF7d9S8vn/AUsJjxUxrt4imW/jN9dFV5w4gU1LTaioiFcXRNxJtK55GjYCB55oqL4IVS6oMFp/NHDs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776751574; c=relaxed/simple;
	bh=0ChHJjneCdtwjKLIkSPHeSzmtX7Fdl0q36FnIQ9gTXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+6SaRrbOUm7yjaa1HXw3BKrdgn2ilcpjriMOpNzHXLhCZvC6TF4Q4Oaby/2/YWK+fKkBWuGZ48wSG8QH5ykyNtTLtQ4gbvdVfmLsgCSOP6e65v2bgJsV30cf9ceWIo1vmintQWwIRWc14hFH8neFcKaKdlyH6e20TNw/sQZqCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EhQzvH9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gYwoqFl2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EhQzvH9B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gYwoqFl2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L30aGq046227
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 06:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x73AA1IG6HcWfqgG+vCPoGL693vFztSF6NnjQyhqMhA=; b=EhQzvH9BLXCA+sro
	HE7OMfeuv3edT7f+p3PdC9vw23JDqfmM22U2ayM/Pzlyj3LUkipwWTabhn2Sy5IQ
	MQYfs8sEl6+yg1jcRlXr2IxY8g2cXrK2eFgeKboztrDn7eT8BlpAt9r2pp9Qm3qv
	7drDyAVAJlyQlLyxnAC/E4eAjkEGQuCx9s6Fiq6l69VeK3ntvXp9/O0q1BR2o7jc
	OsWmyAcXMxK7r7rZYSb4NehRKayE7pTAlrg0xHVoUs0HK+QkMDQHlNJv5g02r+lf
	OjnWoDCANF0AjO/svREY+KVv6d3k35jDzSbUM7HZGeOHK+o73HwsqjtjHzKmw+w6
	Y/g9xA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp0y1rjn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 06:06:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so3479172b3a.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 23:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776751572; x=1777356372; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x73AA1IG6HcWfqgG+vCPoGL693vFztSF6NnjQyhqMhA=;
        b=gYwoqFl2MKC0iJru9WAD2ccLYYTctl8QIq/ULAEieLWeiT3fNcwDAVwhXNL6FFUGAm
         Wbh5TB5jiJz4fpqqN8oJYWttV4G+tQjJOSY4j07FIZwUaZmNt+jCiezifqM7rS4WiRW+
         REsjHBDASzO+KtyVlj5yci0W+6DzlwqTEzI5oRDSmqNFh76o7I0NYHqxkvDAy7HOEC/5
         0E64yLBNEs13BNCDjrTJovolgOR9YV2pNOB3mgnV/cQC8TDiSjXg6mLvlmH45fZJnGUJ
         n+JXw477B369vWpJHofPRZkvObwsJnIaMIgxnhdYIqOMHv5eKclvsT7edRS7ATveKplz
         zRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776751572; x=1777356372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x73AA1IG6HcWfqgG+vCPoGL693vFztSF6NnjQyhqMhA=;
        b=TaELauQt8RtznMC4yv0qc7zzkmlmEwnRbGPTf7f3Lr4wyWDwKl4FkoZP1klKSJWegf
         rWuRcGJJtHuzaeUvn3tObw7zz/EZ1DJeKcCnmqsPOv8xm/hGpAlXbqDMQwJ6xEZ1sWzG
         tGUFEmxxfUSBU4lZOqI21oKg/vT0ZqvQ/lLeJA5CniZJwWHoq1P6+SDCKVPryhvcQg9P
         OpVNT5gUToDCCJjEDN6UVX2r/nwVMhaG2QmuH+VEHS6om/FUlRMKqQdk3xb8dko30JrI
         4Fa0ncwA4SG/Ivwx9zvQv5vVT08Bua70uVxvdOUj0Ulpgy5ss+OMzCMtIJgJJQLPwp9T
         Dcng==
X-Forwarded-Encrypted: i=1; AFNElJ9Uxvv66CpkJIaxPDFmAnKb5xFwRZwgCR5mRguVvYTE3Rh4QdBwFhfWo7yF2Y8NGEt2inUzD9hDsLaQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzysfOzGREeqIx1aSn4IWoxU+5apJhrJJWod6Oz+lFWN/ijV5lF
	fKNYbOY/PZN/dllT/KO8ooj3gSl+1RYnVGZ3neLbLlSX8WovcklFJCRgTEGD3XWIMPU1AjrDwlS
	JhJLwfAchW2ExtCtMBd8snOnnCAw/p+O1Z2WF8uLzXcMppLa0xBaLhfSoA/fDZ7XX
X-Gm-Gg: AeBDiet8s1zUZBczdq8LXd5WnaWPjSc3onak0Ymoq2DRYw9NiEULl1tb2BrV6H0djY0
	1q9Pz1Rr/ft2jGXofJucGg32ewrvO4YYnbX/k+ulZ/36KB6d0U8i5T+D0drSGSGK+XbGccD2aqs
	Se5iuaHLDEtW+nKJE4OljLkMy8n6gnAQH8ZDbbMpWEMZQy3hVXuSwlZfYq/P9ZmvDA51A/lnF6y
	7Lf5HvDGYJx+XS144BUyadGUO9V9DfRzWNn0RH5xIp8Vj7y9bzwP9pS0Wg+Nvq/SSmEeK+tJxiY
	ixkDZuySHtK2CBa3hm4HJJq5es7PzbOLf2s7H1YZJ0k8afLL32sSGqYa6a2EdyK5sNXajN1dqmg
	rUNWJT+OxuNDa0BC0o0x1AAsCmr5BwhvAhGtd8cq/VL4g7Zb5UxsMqEs71bP1ybGU5JuxDg==
X-Received: by 2002:a05:6a00:4511:b0:82f:7762:3eb2 with SMTP id d2e1a72fcca58-82f8b507fdamr12071091b3a.17.1776751571725;
        Mon, 20 Apr 2026 23:06:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:4511:b0:82f:7762:3eb2 with SMTP id d2e1a72fcca58-82f8b507fdamr12071065b3a.17.1776751571216;
        Mon, 20 Apr 2026 23:06:11 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f932dac13sm12018462b3a.35.2026.04.20.23.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 23:06:10 -0700 (PDT)
Date: Tue, 21 Apr 2026 11:36:02 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 1/5] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <aecTykgnudQGRILA@hu-arakshit-hyd.qualcomm.com>
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
 <20260409-enable-ice-clock-scaling-v8-1-ca1129798606@oss.qualcomm.com>
 <4528374d-8175-4a1c-859f-23ddf2bbef52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4528374d-8175-4a1c-859f-23ddf2bbef52@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VNLtWdPX c=1 sm=1 tr=0 ts=69e713d4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XGHNUSocF6D1puBBiEoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA1NyBTYWx0ZWRfX+B+Mhe1Tcipb
 I2m92xv6zc2iNOHrmhDAuSYeNabcLjFLfCX8If53f8crvLEjdvolIT5bsBpOC3eoy27qFUhvGBL
 VSX/6mTiUg+okvN0+q0tVlQ8z/sXoCpEaqkjCBKwNlmD8/Y03KdPIhroh87dwMKe1+oQRwb0Y3C
 394u3/LsCLHSNQlIgui2MHMEpHr7nDOdtfwyJKsLItlu/oVq9UXhjzNWqUxfAhFIgvK5d3HROIh
 uB/qLdqamWos4FHoM1+iu0jG4kckboh6uDWBr0hzw2sjStZs4FZAqZljelQ86x3qT06snVWSokx
 j1GgfKqlklofcNA4dJ2b6/KavnGnrDxuJ8snndp1/iN3SLVycK1wjPLSZXbgLluVtp5hDmFVL99
 +QmJg4qGvjRBNh1mjH1i4vwoui9ev+/eX3BS61PIXZveaHLoTqG2LLeJhFYyXOkoa8t4w72zZk5
 mLIrAfH7LGy/qDXEaCw==
X-Proofpoint-ORIG-GUID: 95_9Mc2bKzYv90RGbbKCtdYOcshzdm74
X-Proofpoint-GUID: 95_9Mc2bKzYv90RGbbKCtdYOcshzdm74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210057

On Fri, Apr 17, 2026 at 06:55:14PM +0530, Harshal Dev wrote:
> 
> 
> On 4/9/2026 5:14 PM, Abhinaba Rakshit wrote:
> > Register optional operation-points-v2 table for ICE device
> > during device probe. Attach the OPP-table with only the ICE
> > core clock. Since, dtbinding is on a trasition phase to include
> > iface clock and clock-names, attaching the opp-table to core clock
> > remains options such that it does not cause probe failures.
> > 
> > Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> > core clock based on the target frequency provided and if a valid
> > OPP-table is registered. Use round_ceil passed to decide on the
> > rounding of the clock freq against OPP-table. Clock scaling is
> > disabled when a valid OPP-table is not registered.
> > 
> > This ensures when an ICE-device specific OPP table is available,
> > use the PM OPP framework to manage frequency scaling and maintain
> > proper power-domain constraints.
> > 
> > Also, ensure to drop the votes in suspend to prevent power/thermal
> > retention. Subsequently restore the frequency in resume from
> > core_clk_freq which stores the last ICE core clock operating frequency.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/ice.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  include/soc/qcom/ice.h |  2 ++
> >  2 files changed, 94 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > index bf4ab2d9e5c0360d8fe6135cc35f93b6b09e7a0e..9e869e6abc6300c7608b4d9a18e7f3e80c93f5e7 100644
> > --- a/drivers/soc/qcom/ice.c
> > +++ b/drivers/soc/qcom/ice.c
> > @@ -16,6 +16,7 @@
> 
> [..]
> 
> > @@ -742,6 +800,40 @@ static int qcom_ice_probe(struct platform_device *pdev)
> >  	if (IS_ERR(engine))
> >  		return PTR_ERR(engine);
> >  
> > +	/* qcom_ice_create() may return NULL if scm calls are not available */
> > +	if (!engine)
> > +		return -EOPNOTSUPP;
> > +
> > +	err = devm_pm_opp_set_clkname(&pdev->dev, "core");
> > +	if (err && err != -ENOENT) {
> > +		dev_err(&pdev->dev, "Unable to set core clkname to OPP-table\n");
> > +		return err;
> > +	}
> > +
> > +	/* OPP table is optional */
> > +	err = devm_pm_opp_of_add_table(&pdev->dev);
> > +	if (err && err != -ENODEV) {
> > +		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
> > +		return err;
> > +	}
> > +
> > +	/*
> > +	 * The OPP table is optional. devm_pm_opp_of_add_table() returns
> > +	 * -ENODEV when no OPP table is present in DT, which is not treated
> > +	 * as an error. Therefore, track successful OPP registration only
> > +	 * when the return value is 0.
> > +	 */
> > +	engine->has_opp = (err == 0);
> > +	if (!engine->has_opp)
> > +		dev_info(&pdev->dev, "ICE OPP table is not registered, please update your DT\n");
> > +
> > +	/*
> > +	 * Store the core clock rate for suspend resume cycles,
> > +	 * against OPP aware DVFS operations. core_clk_freq will
> > +	 * have a valid value only for non-legacy bindings.
> > +	 */
> > +	engine->core_clk_freq = clk_get_rate(engine->core_clk);
> > +
> 
> When you are calling 4-5 functions in a function, it's probably time to define another
> function to keep things simple. Maybe qcom_ice_attach_opp_table().
> 
> Also, I still have issues with engine->has_opp = (err == 0), mostly because I don't
> see this style used at other placed in the kernel. I would still suggest that you
> make it simpler, but I won't hard-request it.
> 
> /* The same explanatory comment as before */
> if (err == -ENODEV)
> 	engine->has_opp = false;
>         dev_info(...);
> else
> 	engine->has_opp = true;
> 
> With these optional suggestions, feel free to add:
> 
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Thanks for the review.

Regarding the points you mentioned:
At the moment, not much is happening here beyond registering the OPP table and
caching the core clock rate. This is executed once per device probe, and the logic
is fairly localized to the ICE probe path. Because of that, it didn’t feel like its
reusable or demands its own helper.
That said, I do see your point about modularity. If this logic grows further, or if
we end up needing the same sequence elsewhere, I agree it would make sense to factor
it out into a separate function at that time.

Regarding engine->has_opp = (err == 0), I understand your concern.
However, I intend to keep it this way, as it keeps the flow consise avoiding much of
if-else branching and also serves the purpose.

Abhinaba Rakshit
