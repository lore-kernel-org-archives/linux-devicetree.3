Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6137F36C9D7
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 22:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774392678; cv=none; b=qfpiof+gGR3XpDO5UcRLrE2uMqalhEi2/5ZBx1v1QdzrVWnTqGfE8HDzFw/DIqUO/UBsW4J8YLkI5PPngt4f9atpz1/jFkmZNO7B9dTfBywbyUDcDOpC8Pr0HYN8o9wM1ncXqGkpgRZqAnKW1nsMpRNjuo/rs/6KBc21GlMkGgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774392678; c=relaxed/simple;
	bh=jfo8OB3h3iXt3h+nZR0znNzllKjX6tOd0BY0feLB0vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NeZjCoOehTx/z7nwuDIdSg2U5DFihasVndONd9ovkBf+uDjT2XNArZ0X9/HQwVbZ9oCWSyMfPYd27EnsiDQYtOOn50ieklhnNzrKjcXj5TncNr8e+OcS2FMbYU1jqsIcZXYMa4zoyWk2IkZze4OwbQ5ofMQhshUyQJbiTdbmi4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g62vyGwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFZnHrEY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g62vyGwf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFZnHrEY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJOiBA1862825
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 22:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0u8uB6GNrhdJsmH1ConLZooY
	IPLJEAZiTZjJQILyV7g=; b=g62vyGwf4+VBUvoexOz56S/vSMc/YFMB3YxqzwXx
	a8JfOUSR6YZCiIx6p9lg7MMvPXdHXU8eEQ9J26239/cwvnGfizUv5Y6Q1/rtsRvI
	dSkDV8DRbUjaScAvEFpSHMukjWNkk8EzgjuhAPvHl+CiEYx4MBNcpdvbQrSU/lCY
	FbnCgPnlQz5NkC605RPzhABqfIi0QXjiw8pp16t83zPlRUMBnP5iAKVL2rIwueHO
	Hotn8rIRZRo9kWxiA0/U9D/8Mgs1fI8g4mJBm9z40h3Q2eRgncZzUji033O7jbHP
	a1SJ2S4x7+zc8un6PW+d8Efo14wqnUzkeY0aqKPE8TkNIg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40rarh18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 22:51:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090bc4823cso71271cf.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774392676; x=1774997476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0u8uB6GNrhdJsmH1ConLZooYIPLJEAZiTZjJQILyV7g=;
        b=jFZnHrEYOqxLwIR73hU229UmcfgqcV7CmY+uMovusSQdEcP0f+xZ0fvuXyJ8oia996
         x0qh0hhznN/T5BndVduBZybCjC+l+OfQGpoX5YCh6P5G//VyPY0lofCUJI+5U+7u2qY6
         2o9zV1YjzE+EEgisIMdjbow1cNL5pe7dHJs/6q2SJHf4W5uQSN+TPlWSrGTX6687AhtT
         Jg0Cox5EJxka56/tKh6QFmoroD/0AFuCLRHTbIwtKc1++wTqtEBXawHAUSSG5vSx9tuW
         F1p2A4h5tCz4i5Eod6CAVLT83Sps6fIDBegsGOEwIzsEj1rnIgzwLQPyXaIHhxMDOiLw
         idaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774392676; x=1774997476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0u8uB6GNrhdJsmH1ConLZooYIPLJEAZiTZjJQILyV7g=;
        b=d7mKtf3w3CVXFUm9092Yi9Mw7fhJQFGe8Ja9MCFVZSzp5snz9jNcMP1ivL5EJwIBxv
         cu9XyQYD68v8ZrQWwOtZ31Pf5iwZ09x4eV1p+16ylEQvNr8kO8SgVfA9uAmJyzJ1etbA
         UQFdsnGF7k4gurN5ixRh/J/1kffUltOhowLyM3nKRoTT2O5ROKWcrzcnV+ih7IdpxmpO
         1ELVB91TxpE+l4hFDC3s5U4VIFBjJNUNUAL91g9m8IKou6J6ymSH8TijhsjHrODlRfN7
         LITAGVzfkhmSls0DOW8Rc5UMiCI0oAGYPOVKrPIYz+csSPk1qokyhTRtmrYCTSimLPzT
         GNsw==
X-Forwarded-Encrypted: i=1; AJvYcCWeNYPy7jFCx/gycwjilB7bPt4z0/6OVU/Iutstmk7nynZxYgUBMaLepAaNkbw9Z3nKNv2nuWLRmGxG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf610drNDzYFhY4NabGi6x1+bQOi/H/2TMSf/UYL/seO0UZye6
	fjbh3IBKEf+XPjJA1eW2ie+t5kIEHjRLwd60ln0C3CGV3jH6dG8epvfRbm3HDObHm1b21L3wX2h
	zYbwANI7ZXrLd0ZN248uGqCIT1zILU7MtC79lyqg7HM9tPdFpLOuq3CQ/67eLBiqR
X-Gm-Gg: ATEYQzwys1tGXFOmwlws8ELQU+XKdCfhwoal5QhPE73KBHQ2XMt7k/gfYmK7tdXrTh/
	d5ipwevpgbY/7I2Gs5oFJbVeBgDd3yLQqGeQB8ck77HxvbGhLt68utmpftU9HSd33bbkAQ5eyPT
	6RUuqin31LzxnqfUZPvsxy2ZVYgrRgF994Fjy8I1Hu7/kPF40eVagAN6j665VG2qLepl7C/JQlR
	pJ/Riph/Hw+yyFlh2s6gKiPpeBGZRMzCuIhgNKaf6iY+5wqoyU4tPw+229SPXoDEv4/CUzSZzAb
	JlgyqftiMdbBEmouWvKM0Ew/EisGG5ZqSQVkSO+zhEGAVobqe5eyh1bLgHCTAl9zDdUMf2DaS01
	7mH4OFwMEe4E2ErCIbob350FMWtWJjUSwyyWknRb+JYOdmgxv5eh9910qGUKmwJ0woszZwAPm/x
	TLFWJ274s+/KCE/hOuSxZXmPCRTJrdkzHl8S4=
X-Received: by 2002:a05:622a:305:b0:50b:6cc1:38c6 with SMTP id d75a77b69052e-50b80e45d7amr21331891cf.55.1774392675770;
        Tue, 24 Mar 2026 15:51:15 -0700 (PDT)
X-Received: by 2002:a05:622a:305:b0:50b:6cc1:38c6 with SMTP id d75a77b69052e-50b80e45d7amr21331501cf.55.1774392675338;
        Tue, 24 Mar 2026 15:51:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a298511b9csm704111e87.58.2026.03.24.15.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:51:13 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:51:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] interconnect: qcom: icc-rpm: allow overwriting
 get_bw callback
Message-ID: <2453s5yfmk2xrgyuabyhahge2cl2uykdlpcxlmwe35uf44sjpg@pbc3a6fxtlya>
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-4-7892b8d5f2ea@oss.qualcomm.com>
 <abb14718-3d94-426a-a0f0-d101470951ad@oss.qualcomm.com>
 <75zgkrwvjsmnvjeyosl326vcudklj6yhhyskdrsm23kbzhgve3@64nezs6c54kz>
 <1376fad4-efc3-4b7d-bff8-9510ab0d3800@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376fad4-efc3-4b7d-bff8-9510ab0d3800@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c31564 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=PuShR9hzWyKW_qgfHhoA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: U0l5qWGJutfS61CDtvJJkfOeoBcIeCLm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3NiBTYWx0ZWRfXzkTqPDYAUoU+
 dAZywLHZA3ruC2x2nVnNXtmrVmNKN6hrQ+GRSIKow3gLBzNLn45G9sHXZoG1bfy9JqXs+DGPzLg
 EXJh8tx0ze9G+Beb+TXcoRj5/SizwlLbtoPJIhyZF/IEvIuQX8SMzaBmHvbj8LcgCFCnuaOpooY
 QNxsizBCANKZDaSJ2ONhHTOau1Z8LliNBuxSfhyumdZZw4JtINvYgj6oYhy7biido/gfgmSUIaO
 U59Sx3ovTcrp8EbkNaNEtaJ/bpuh5hSn2q0V2RlXsQeXzAqCBY5w9BPV4yc1ZqgNsBLEp9ov0kS
 MXnvxl/Nb7mcaYzUvETXyu5Y8K8hV6DL3Tokj8YJimCbeYdjAJxOuScTWOUEkQI2AmXbqbhROQh
 ynK2PWVbqjzwANt1xYTVJqiWZDKNWHWrFYQZFN9lIGa1ML6M3T2QPJ+pbXM9SuBIwsyDPDr20ue
 Bd2mmCA6W0G1Z5Jj0Ag==
X-Proofpoint-GUID: U0l5qWGJutfS61CDtvJJkfOeoBcIeCLm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240176

On Tue, Mar 24, 2026 at 12:34:35PM +0100, Konrad Dybcio wrote:
> On 3/24/26 12:14 AM, Dmitry Baryshkov wrote:
> > On Mon, Mar 23, 2026 at 11:32:33AM +0100, Konrad Dybcio wrote:
> >> On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
> >>> MSM8974 requires a separate get_bw callback, since on that platform
> >>> increasing the clock rate for some of the NoCs during boot may lead to
> >>> hangs. For the details see commit 9caf2d956cfa ("interconnect: qcom:
> >>> msm8974: Don't boost the NoC rate during boot").
> >>
> >> Is there a single specific bus where this causes an issue, or is
> >> setting *any* resource to INT_MAX problematic?
> > 
> > I'd refer this to Luca. I didn't experiment that much (and also note,
> > this behaviour might be firmware-specific).
> 
> In case anyone's interested, it _seems like_ it's
> 
> (RPM_KEY_BW + RPM_BUS_MASTER_REQ/RPM_BUS_SLAVE_REQ) failing with certain
> nodes

Yes. And if you check, these nodes have QoS settings in the DT. Later
kernels have added a guard check (.qos.ap_owned) and dropped mas/slv IDs
for similar nodes.

> > My goal for this patchset was to port as close as possible. We can drop
> > the get_bw later, after enabling more interconnects, writing the QoS,
> > etc.
> 
> That's fine

Rb?

-- 
With best wishes
Dmitry
