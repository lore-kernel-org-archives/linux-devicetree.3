Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF09340293
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776824718; cv=none; b=upnzwgQje6TaDs7mrYZmBRwlAfxjNXTyu4hemUz3+ucWMX1+XqfKryTCzp3Ysr03+eWBUBqCg7rzxituVXdLpmjdLU5d8vcM4FMVniubddZGsyOHHoJ2/1VhKid/nxBxsHBO1VO/oJ2gpJMSD7M/p447tkTJ+1tigRKBxkcNkbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776824718; c=relaxed/simple;
	bh=vxvUnp6NUYUAW3Nvyx17vcJF3c6FCDDzqctMBoOPfwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URUHtyc+BnIIQ4R9KZOpaL5DR80uRZp3essRFRnhMVFR9LPlnXTMhsfxdb0q+5d9XJ7p+igmh2awCs0ha9CErqCluxmkK+1vpjICuhM8inAWuRNetzXlLWadfOl3wyhpAspFYpK9Pa2+7YP9MRIWVjeG+gzPWuixOmtBmlk00s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpEQTx/s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Br1lHTot; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpEQTx/s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Br1lHTot"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LIaKvr165301
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:25:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t6onLGBT5Y19GIecCruwVrTD
	w4sZhZvJCOdzHqpw2Nk=; b=ZpEQTx/shxB/ORFYPVqHmq3LYqinhCtnE8uMxVeI
	a66TIx2936NYduAsqQ7Mgupm5HECbn+HgSjO0OYUOjhHYz2vhl7DgzN0wk15sQgg
	gqS5EwAvRQ1SmTRi5fAbD42zFUle8gWJJiu75YzzjYrXds74AuYV5AHk+KHWTXEK
	iRbjad8dvJv68r2Q+wkLOpO8qgc2qDY1cOumAQqtDBLrMRdLfLcq7tgYR/teCiJx
	3U5iyLhkC0ijhLKfLXrT4fb4eWj6zBIGRX6kAz7rgOLuTQ5VI9F1GGgSzkWWBN+v
	dG6U6eg1xcsGV+I5o8pzcj9prHtQj/bcDE1A+2tPaqVddQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenhh7eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 02:25:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2d8c521be48so3942261eec.1
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 19:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776824710; x=1777429510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t6onLGBT5Y19GIecCruwVrTDw4sZhZvJCOdzHqpw2Nk=;
        b=Br1lHTotaAi9HiU3S/AEGj1sv1SZ0DnKqECY44anUe+/oHWYOGt8nMuH6rQxu89QOL
         qPx/jKC11aN7dmeAJokWFvm4lrrfP0dQMEUVc3+e1tKIA1z0du8unQ1O4QgwLfAEyssk
         DcORrEtAy1m0Oq6P/J9dFz/UcWMe2/AkbiFCLTRU3mKV8PG8ocw9yDCsEXAG0v68Ahfi
         dR8Z/asn+F7Ep80kX1YPs2J8sEz3YIgQmxUmG9blMHqS+T7wW2RDQDoQte2zb1Zqwzkl
         XpAlU0Z0GkMcOIdcM7EKkSHqseeXwciiX5QYVLy+ukEfpY64+TmbeScsJawfVNYYwsbE
         KlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776824710; x=1777429510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6onLGBT5Y19GIecCruwVrTDw4sZhZvJCOdzHqpw2Nk=;
        b=kIDEdCEoRd3hkNqvZe6AXka3oRL8kkcBkYbAfvz+wQHTj+Px5/x9W5Wu1fL9Efx1gC
         6esUVaNGEIsIzB8kDbSNo+mj3y6hN3zAnq9jHbL0584mLm3axcyaq/mRjgStIMVAuSvE
         AysEyuI1AxhRdVCWkEnfYcVLRHWXYfqyTgv8HHUijg6KGbV4tGd0qbBMeXgYWc3kSOpn
         /x65gxCaLScS7uyEkWh/ELlV7oOuwBELCHSj/TAgE4yOYXrE4R9cmJTK7NJgJ4t5TtZN
         Eao4zmMnJEa2NV/VC+VSRNlaKtOhUpd3S4vC3aBHTX2tooR/xyb6BwB7WTWvwuZ5mD/P
         7OLw==
X-Forwarded-Encrypted: i=1; AFNElJ9GM3xJc1u+FmO+o+Mb8bPHlVrqpab2Q0MUz/yWKdkveZseeuoqKEPhEjvNXWxx03I3/y8HkzvEJtkY@vger.kernel.org
X-Gm-Message-State: AOJu0YzQAMLQGOWegAvlBEQn4S00jR2t408uOeduqlIWfRbLDlyu9HJH
	X8Y0VpTxPeLsYXsT5tnwHxNzPdyrg7JLHtDWPVxRhenpruEAb4f1daYSCmTpVTC626DW5v0xmpI
	VGMe/VrKWWYvJo1jJIwuhjTkly/kzqSYN3bOF3eWL79lX6lPf9flfoxDRRfdPXXOM
X-Gm-Gg: AeBDiesGPVaLJIM8moaiWwttMrV76CcO/EPzTKKbUpJdgfsZ7zARnQsyttuLGEz9oy+
	ZFWaBtBdKZaoAfFqCotGIXnkHlUbN4X8kMk6EpccxiBSI+2FXj5fogO5PKoxZMPgtX7DKpL8zj3
	HLoXrAfyBHlJWtOikxVdjo5ew0/NdpNfoO6wSfb0Nl7lROKdFN/KRAYIB8arV5iIyZsoFmeDoHf
	JzUy6xMu6HP3zOJ9V1eekZ5cf06cMmTEwYKLQsaNncHkKZuOnT2JIBdm4RlMIy+DGBrMOSu8NvW
	6qMBNOzdmIIZVyo1MNaSBatIPVtizw9MuQ/Qh5+wGRFRMVChVgJpxbrJd6Xu3ouyMjmIQdrX7yr
	J74uO/ENsJv2fekFpZ+RkFmT3LrCPGcDHISlML8Uedn/gc4WEQShqUu4186xOCu1G0LoPNG/cJW
	g=
X-Received: by 2002:a05:7022:688b:b0:12c:81b:c74b with SMTP id a92af1059eb24-12c73ae93c1mr8837256c88.1.1776824709822;
        Tue, 21 Apr 2026 19:25:09 -0700 (PDT)
X-Received: by 2002:a05:7022:688b:b0:12c:81b:c74b with SMTP id a92af1059eb24-12c73ae93c1mr8837242c88.1.1776824709277;
        Tue, 21 Apr 2026 19:25:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c831d5b29sm21142754c88.8.2026.04.21.19.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 19:25:08 -0700 (PDT)
Date: Wed, 22 Apr 2026 10:25:03 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: rpmh-regulator: Add RPMH regulator
 support for Nord
Message-ID: <aegxfxPKE0CGnwqU@QCOM-aGQu4IUr3Y>
References: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
 <20260420072639.1249984-3-shengchao.guo@oss.qualcomm.com>
 <77a87de7-3c66-44b5-9900-df8798d3074f@oss.qualcomm.com>
 <aedzbg6sg2t12gCJ@QCOM-aGQu4IUr3Y>
 <pakludkmnvnvywmnn4dzl5j6euba3yjgy4zcmpmtmuxjvpg3so@arobndaolbpw>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pakludkmnvnvywmnn4dzl5j6euba3yjgy4zcmpmtmuxjvpg3so@arobndaolbpw>
X-Proofpoint-ORIG-GUID: UkI2xVp0To0fGwRjC0lBsUSbe1Om2nHr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDAyMSBTYWx0ZWRfXwYJygnf1q8k7
 KDPE59psgVlfMkEjRqoTjqTAUtNWatCvA8r/US65Z5SOqzpUcM4h8nrIecLSIxR3MfETcbqDJ2j
 PF46QrODHbHGkjtlA2vdNAg2IT1syspo/uf2hrD7zSugibcPa6Ck+BwwfEPAGVZxTz0XLRq02Yw
 12pyikCDibaTmXRn7AMuX915dzdwWBE5n/RnoQqPnoWFSzBZgSITS1ojRM3j+PfUBQUFSoclaxE
 jgxEv04uTXY7xqNgUjZu3MN6qetoeuYeLsvSHH2+50vpniwOgiKfcV/9lBWwnxUkXxQjDSpgWok
 8vQ5pNnhwzTfm1sIPM1+6dw7p9iK2Bna68w+8NVI3OL02eNH5v/ccRSf5HENVbOyCYEahkXxIlR
 Noj1brkcGBBDzwYEtYeSjt7QWr36XrI/2RUYTzGhoZc5Y4A9O0Qd+6bSpCiwDcxVeQ3l3ZBlSwH
 oBQ5s/kLtdP7NRr3WuA==
X-Authority-Analysis: v=2.4 cv=WKJPmHsR c=1 sm=1 tr=0 ts=69e83186 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=J9CYmNFF5y-jpvcVHycA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: UkI2xVp0To0fGwRjC0lBsUSbe1Om2nHr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220021

On Wed, Apr 22, 2026 at 03:56:20AM +0300, Dmitry Baryshkov wrote:
> On Tue, Apr 21, 2026 at 08:54:06PM +0800, Shawn Guo wrote:
...
> > We thought it's fine to not model LDO supplies, as they may not always
> > follow PMIC.  But that might be even a good reason for modeling, so that
> > we can have a better DT description for the supplies.  I will change it
> > to:
> > 
> > 	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,    "vdd-l1"),
> > 	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo515,    "vdd-l2"),
> > 	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo515_mv, "vdd-l3"),
> 
> Are those the actual supply pins?

From what I can see from schematics, yes, those are supply pins.

Shawn
