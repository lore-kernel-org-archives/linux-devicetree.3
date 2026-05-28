Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADE530C632
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779965955; cv=none; b=YfonNe9HXAt+8N3IoXMIAp0VwPBDr2DmqyNqS0xeBEmh0KUcRBqfVOdggjtEKOJqbWWSTsOcPoWANceTduIJYg7oKSLXi4iLrCrsFHz7iOF7uCXb+J655BbXa/WMnl1lyqH6QjOz+l+/hhFI2gy+D5TUYaR9grKGR4TxwvUQeAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779965955; c=relaxed/simple;
	bh=JDEi2oo0P4BLqlVpKWL2iOe4Zq/zpTK5W3KPcRGwS2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqHPLVcugXlxJbtFM9uACrxjuphbvPAUUqwbWNNWKxTnSy5m4MEl6Gv463BiyrbjWwstoVZJA3l2t5cMkXpHXriaGW+tBJzItD/A6jRL8JeuiOvdv1tDXD9VW7GlUHXc1TuurZ5keaN8stG1r9048PO7hVwVWOI4x8UrUxljCnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZKfb0qan; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vadu6lC6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZKfb0qan";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vadu6lC6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vN6o3545339
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OQykVN7zbGGObjLJasSgT0TV
	owil6BekcefmkEti1dk=; b=ZKfb0qan8ATcNGiJGr0uXfXU+nEvhd+XoDg0UFlw
	+46xOzRax0PcRFNWfdG0a3XtM8x5o8UVZPDruu27v1uV7uvdfsi9H+iBQ1aILszE
	PyDg/e92h0d43X6iQVaiARMxQ7dyhil4deXO/37DROU7Hv/tnRoT0PrPDJ7QXEMZ
	6KAgcoA34OWqncCiwPAR14KjAuVdm7r5NAg9A7T+WalvcY8fcfA1k8daFQsrQfvH
	fRSdKIFV8FsDKf4WTZB9KFEYVJWfgA93jc3IFFfUZo4XgE/U/hZr+oqQ8rVaZ3pu
	DPz1IPqPDq4sE9OmpolUAosQT0ae2i/qh3//Lqke+/JghQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3teyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 10:59:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516ceea1984so134493861cf.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 03:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779965952; x=1780570752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OQykVN7zbGGObjLJasSgT0TVowil6BekcefmkEti1dk=;
        b=Vadu6lC6MLXDvWGHVUaY8zXTykil/v7/qQSm3Nc9842rOaQHc6BrC9xHRkdnIc+eVw
         VbapuI9P97vVmFZ5er1XtzkfBzWpeB+orYMyYonJfI9+TSsk17czqoi1VejbwbjktVzY
         UNJptnKdLiSWRT45F0k6tMQ6XRjRKy5Xw+uaYaICuo1IcnRj+dGelVEciXXuiZWmtW04
         cRKkqsNYu5AM6+ARcXI3DZqIRQDkXHHKhJI+nwZS2JcIE+m/I3Kd51DPjW/3gFfQhWkn
         vULZ0Z3Ywlpym5cB6Si3orxhtYJOvXSB2GXK9sNiizszeBlh1PqnAf+v16MxQwnJRJmV
         8vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779965952; x=1780570752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQykVN7zbGGObjLJasSgT0TVowil6BekcefmkEti1dk=;
        b=LarNyXM1GuC3Y11LApoj7yeWvDeaRqf+doAiwMbSY5tLX3b2gC/sFpbASrSLjKasIf
         barhdKGCSMlrnQZ5ouFJwOdpKp5NN777AGKoCkLjmNeOKJGs3HvnwqdTQ6MTuAfKS5l1
         Wyn6C2j8c/qoBOpzOgaX9i8mEhTmmRVjo51N/jmB/tluEJcAEhECWnzTLu6ZwqbdCCQ8
         7KhFpn7Qd6//naSrSe4ndIOpmrxS2ibiAfzbm2olxvX2i5BFKkd3dA2va9S2F5R8QvSF
         6Z+IzNxnwgEaCE0GqHYANORPahYk+Mbi0EYsBVBeUJHBVEccdsGPBhGd1oWSaBrBGYOh
         TeaQ==
X-Forwarded-Encrypted: i=1; AFNElJ8288j9ujDnF27B0aBjwxqfI1uw0d1DehoDF1PwTBkUEkqGI/vPFhCB0aHbVmAFOFIxIhBzmtlloakZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxwtOAsKnPgT3Hq9p9aP0xwyhJ9KySD/nQlKxXnJs/D16tUJSLW
	WXxVM+FU6Bi/YnmfvUSBLWZV4Nx1qYTBDJJlmRnP3kz1yC0RmNumqBAUTXGoxOGtXrxFO6sOf6x
	IsVUUFkIugJEou1OAAKiMtRYEVcsH8p45XjZbnunyJC3RI2dw9SRyHnS4KVqhVjzu
X-Gm-Gg: Acq92OF4kzXzSE9I8xnosTHk50oCbjv34DsHJsR7FtDIE2YlYDIDbfh2a6zUqc1nhIr
	eT5BLRi/nfwTX/y91pipMC2+XcpbHAtCqLC+bYL6ER1IR1tWWJzSMI65ARw5C0t58ktPP5+J3+f
	f4N2pAGRjkPP0RNKVAOlI66Gd4qUlBarCGN+ei8f4qvnYUbaagSrELs+eILDhVQ3aU9xcmwwWxM
	diD+HAkClp1WJkZnQCuWslnjek1fWLsaWYPFiCDZYYIJl703zFBnym4MFrRLCYOmrxH9r+6ifAg
	4/Byh3MbDiKjtmzUoq6sN4F5V71XyGM3JUyzXObVo32oHSqJve7DVdnFUFOzdSaURZWndvoBSER
	ebaVG0QV45xZsHkZV7I/+4lZ+nYkyrmWE0ZslvgYv2iwfjSKhdewivkhZdIQsEUUHAwaLdcHrna
	QboCJYV0dCJPGIY7hJRy4Nfd1aoroz2INVC0eMs6FRyDXWFg==
X-Received: by 2002:a05:622a:684c:10b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-516d440e798mr181630771cf.59.1779965952186;
        Thu, 28 May 2026 03:59:12 -0700 (PDT)
X-Received: by 2002:a05:622a:684c:10b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-516d440e798mr181630531cf.59.1779965951660;
        Thu, 28 May 2026 03:59:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4bae942csm1105133e87.36.2026.05.28.03.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:59:10 -0700 (PDT)
Date: Thu, 28 May 2026 13:59:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 06/14] media: iris: Add context bank hooks for
 platform specific initialization
Message-ID: <6gbdp4zycx72y5dpbhsvxrv22khetqaovylmazusp3qanqp62x@o334xpoh7gkt>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-6-f6a99cb43a24@oss.qualcomm.com>
 <sqjbcmcy3wohzdiftb36i7ztfyt2k7mnxkrzxk5yuocpe7kfy6@ev2ouxxnf6cc>
 <b1888f5c-2613-99ca-ee12-fb4717a40731@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1888f5c-2613-99ca-ee12-fb4717a40731@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: qVnxFu7DfT7y8Vy4Y-lX6gRuLowZvzHR
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a182001 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=5AEaNukWL0ruuHmld-sA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: qVnxFu7DfT7y8Vy4Y-lX6gRuLowZvzHR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDExMSBTYWx0ZWRfX604HkiC9sEsA
 zcrvqHq/OyolrFN8wYLJBRm7VFa0u30SWHwi3kpRZzc0Gm6RLjKevFslXjYd1jgc7bsN7SGD+Lp
 BK98ofh+M3zfJttBafAYojZvIJNcA4MKsarpcW8oeFrtSordvzzAacfHrTygS+9FKRD88dned2A
 dhYkwdchDLvEkj8I851z612j8/DE0CM+iERZBLIkMJUAX8lUq9BEmC2Bx6XUeU32yhdVSBrUI0M
 1Wf4ANk8F9VjBOsaAIx/nUq6sGyAjmWEc6Yb0FurvebJAysllBOii2KAe2Ib2LaoeTdfmjDfYr6
 tnj+KPqMERllC1mV3cOICwzcEaYTYkDmsIwaD01B+NtpmGTPsfwWLXLbQcSaibB1mkGyCgKph9e
 u7TEY+QU6N87VqwU8r+8KqYKZzty1hDeesKkklE3skqXnycJzmHcGTNNYZpzzUYvtlQ7/v2Nbgv
 9HBj1RqhhflxmNfYZAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280111

On Tue, May 26, 2026 at 04:51:52PM +0530, Vishnu Reddy wrote:
> 
> On 5/17/2026 11:05 PM, Dmitry Baryshkov wrote:
> > On Fri, May 15, 2026 at 04:51:21PM +0530, Vishnu Reddy wrote:
> >> The Glymur platform requires a dedicated firmware context bank device
> >> which is mapped to the firmware stream ID to load the firmware.
> > Why is it required on Glymur? Is it _only_ on Glymur?
> 
> It is required for firmware booting on platforms where Linux runs as the
> hypervisor (KVM/EL2), where the driver needs to manually manage the firmware
> IOMMU mapping via a dedicated context bank device. This is currently specific
> to Glymur.

Is it explained in the commit message? Usually, reviewer's 'why'
questions mean only one thing: there is no good enough problem
description in the commit message.

> 
> >> Add init and deinit hooks in the platform data for context bank setup.
> >> These hooks allow platform specific code to initialize and tear down
> >> context banks.
> >>
> >> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >> ---
> >>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
> >>  drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
> >>  2 files changed, 24 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> index 6a108173be35..84fc68128c70 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >> @@ -263,6 +263,8 @@ struct iris_platform_data {
> >>  	 */
> >>  	const struct iris_firmware_desc *firmware_desc;
> >>  
> >> +	int (*init_cb_devs)(struct iris_core *core);
> >> +	void (*deinit_cb_devs)(struct iris_core *core);
> > Why are they being added directly to iris_platform_data? Why not the
> > vpu_ops?
> 
> Some vpu_ops are shared across more than one platform because of same
> power sequence.

That's still fine, it's better to have vpu_ops with same callbacks
(except for this one) rather than having a one-off callback not matching
anything else in struct.

> 
> >>  	const struct vpu_ops *vpu_ops;
> >>  	const struct icc_info *icc_tbl;
> >>  	unsigned int icc_tbl_size;

-- 
With best wishes
Dmitry
