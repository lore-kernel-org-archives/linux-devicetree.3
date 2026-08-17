Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD2C3FA5D2
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972717; cv=none; b=bnlyPnk9JKaJf6LIUAjM7Fhd7VQXlC4XzViz9deLO/qqSwVfcQUDe2cFSjIGaSOcoy3RrgQSRIBnHpJytM3K8VLTUyRonLGsizmIz/uyfDqRSD1dxtYD+lPNnOas6pNlukQZ1r0qHt5CAHp9KcWGx2fM20Ew6IgdsSCZZxdzZrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972717; c=relaxed/simple;
	bh=qejeP/r57cvletlIzDeWAbeLmrbPTopJbzkBUcACoYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mGsIaPm4/nRp6ilBpTCgMMEhc5crhgn6TtRS7k23T598p24C6uUNcgHz01E4Ut0dCbiRteRxsIgT6NcoAoXtEmH5fmQRLvouxfnn28jl9SmgDnIma1Q58ximO/QKG0MRZgT8xyY/3d6OnVenJzWclPQYh0NpnoZvEcCw54oVNrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EguILw35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6W/tyBo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EguILw35";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6W/tyBo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD63lo2748615
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBFGnWLgMO8eZ+0Z/52KWb51GR+gHGM9bS7GzZnkurI=; b=EguILw35rLZoqupx
	6Tc15m0hiVAGGdBqekjWQ3k1U0wjZZxCvPkmOql6Uz/jPokv85oq21t4WUBWMB6i
	c3A/mQDcNf8t1WNOJN9c36wazrkEI/BYLJZjtLAkhU0QARJQ0KNjNKsfse4ihEcc
	4S/rTcX/yo53yehyzOUA4VT9uQBFG576csJEb8ftf8QQl27lIPyq8GinNuE8vc2q
	HDverSzaRiKumEk3VGgNGzpZ3H2KgKcOXGjL69gOfck0JRWh0RHe3gYyzIU6wQ7U
	m4qMgn//AGqJvpxtf0FRmZiLKefGrJSwH+kOCT3avVjPw4N/xvjuIWCIhzWTxVkr
	zm8Obw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y779094-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:18:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e777a15so9279981cf.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 06:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786972714; x=1787577514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBFGnWLgMO8eZ+0Z/52KWb51GR+gHGM9bS7GzZnkurI=;
        b=C6W/tyBoUWAFnFurNkRD25q9d+qZ7JbLf/wYJvL8RNaWyOYoPNRHuWuYHOkYt1zzFN
         +pgetfXCxUtCxXzI1xKPN3pLIRWo6dUo1AsWy7po2C+2T2cUN5ujfJpv14lIBm9USBmZ
         YGDvSF/f7AXpRn+E1snHjvoHwZU752HRPnxAx2WHWq5a51hz4JtLTV5FRAOoN0K3nDv+
         MZjvUj1vVJu4DNRlsELhxwj/cscMJkHl6KKF1wGxNN8WHa40uf6x++bW/Yda+mkuihqO
         QFxpsxzwjFMOzlx3XUJ04VsQvh0FVfs8GYabNulxWMJ8OHECsgy8ISluSNlioDqxxuuc
         ubfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972714; x=1787577514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBFGnWLgMO8eZ+0Z/52KWb51GR+gHGM9bS7GzZnkurI=;
        b=p/YyR8NxPYQjxU3ycR9ocZc2TpJ/pDSiBrxVzOHCPP3WfvVp5ov9o9hJDMkuwBLoKU
         Z57v+sv0UWSulJ0n0Up5r+8KUQv07cydpLvwRfLB0mwTvLp88KxWVV+o8BxicJ2VH+M3
         81I9WnIWboUcjpoTe0Oq1leDYV4melVYRykGikk9ZUUULdg4Bu0rIekvQf9tTVkD+nBm
         g9fQNLUBORima2naLvcPIuLomoCBiNIOIFjsd0I21IykvR/AgTDjICsrrjz8lO92Xn9B
         qGmjOwXr+oUWHJpEv8YUFV+GLU+eoBkkLOafwjT4P7KdWgHfXsGO3ZBRKMjvmAnpcVv/
         fjKg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9IbnUzB1pt4olnUJArHjezXHJHCJl+DUACAY7bW9yL0lBw3R59XZsiVFwAzImANqyy7ob3RebEj70@vger.kernel.org
X-Gm-Message-State: AOJu0YzMpflxqmXwZo1IvVnqeBYt7oZLI/fSPVwK6BBO1BBMpan6QbdQ
	gOtDBmQrb/yPjOXjASFzosx2/lae214ibinqD/Jhg+e1x1moNhTLcSo+wUFVKeJvzJJE4eJ/6JD
	jWwi9LrvVdb7xrleOe9ULhauNm1oLbClv3Df9YNzV9iBLl6AUTqMxO+KR0nZ54R8A
X-Gm-Gg: AR+sD11MO8GcfwXf4BMVGuICnBg5OE1q8LfbtGXmQ4u7yuJqHYS3udyGbF7xTgfYbwP
	VZL/S42mMxcKTVqd6MC5ErGq65G72m/kTlg0q9CnRAk9TjqueIATpBzUgHtReOJ5yq7JyN5zf8X
	KMHZQGL7e9CqDaHpQPXlSQtZda5LiZnTQBeY7xkoHAdCHYfPs9f6M8ydp0ooWeTzdBHmqgLxzVA
	bYLzc4/gyINpY49oKPqHJjek9oTTq/Gp8KDM3M+L46iynmiSx7fXv3biaXmkQjroIgxQKj+/GTc
	wh4aEs7hPQ3XiBJqL1EiXST9gTtiAmW4Av9MuAEJtY0raiJxaLX/b3bro8tz9cFPQM02VAlvgsy
	FtTflSqtZlxXk1RBaUDTfC5W/
X-Received: by 2002:a05:622a:c2:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-52d852f49f4mr195411651cf.2.1786972714143;
        Mon, 17 Aug 2026 06:18:34 -0700 (PDT)
X-Received: by 2002:a05:622a:c2:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-52d852f49f4mr195410991cf.2.1786972713616;
        Mon, 17 Aug 2026 06:18:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b99f78sm27821266b.50.2026.08.17.06.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:18:32 -0700 (PDT)
Message-ID: <1699019c-510c-4658-843d-e1ecd7364c5b@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:18:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] remoteproc: qcom: pas: Track HPASS ADSP cluster
 membership
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
 <20260815132541.1575121-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260815132541.1575121-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfX3AU7NIpbaqBo
 YOoarN1NYLBo7e25+8GzkRlvKzs1fsQiyYsMY40GX0vhxtmevpr5h8BX3yS35dtEQxUkXrC70WB
 grY6uAa04i28ncKgbnUN8TA0ioGOnbKBYtVtl1ZOYKhCPnPCfl9hwyJlqkmZMU5u45Irm4QvX2U
 /jvk3vEVX0dIKZaMT8HlzneF6Bk2fvn56waE5i2b2/xamhjmkPJbocL1iUtBCLMdJn4YH7ETviq
 NEHOheloxAqDWagGEiH6KmoYzldkI2ixxHuyFmbjdrq7vtcb/MAIym+gMmTW1j7U1d/32hla68Y
 SaqVa4EfGiiYOHMEXR7FVBBtPEs4xgl6ONzlXXDq1jRv48KzFrNxUgWV8qDMnJgFkDxmMuhYiye
 bs0U8mwf6ZTkFeAA2YH6BLT3ghBKgNWGFLO0WkwDRYeJafpzipTK0lLT40jePcoQ63wYWpuvOqI
 qVAfPoF6gZDEl+Oa/RA==
X-Proofpoint-ORIG-GUID: vV-sPvRxUgoaVf0ugWc2oOcQC0bu4coT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfX6katMYyUgBnv
 bQ18k87oJ0BRLXbJNiJcZp+/VnTLlJ8JPrn6Ha2kyw4zBt1FUjzXf1ijsLDgX8BaGsDdizVtzpm
 XNduovsyCOqdRW+I7t/gsg2VoHWtP3M=
X-Proofpoint-GUID: vV-sPvRxUgoaVf0ugWc2oOcQC0bu4coT
X-Authority-Analysis: v=2.4 cv=WNhPmHsR c=1 sm=1 tr=0 ts=6a830a2a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=8sEQECd3dATjYAwM8-8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170101

On 8/15/26 3:25 PM, Shawn Guo wrote:
> On Nord, ADSP0/1/2 share HPASS-domain resources (PLLs, AG_NOC, RSCp,
> CESTA, THROTTLE, QTMR) owned by ADSP0, and their firmware cannot
> tolerate one member being started or stopped independently of the
> others. Modeling that requires each PAS instance to know which other
> instances it is grouped with.

[...]

> +static struct qcom_pas_cluster *qcom_pas_cluster_get(struct device_node *node)
> +{
> +	struct qcom_pas_cluster *cluster;
> +
> +	mutex_lock(&qcom_pas_cluster_list_lock);

Use scoped mutex guards

[...]

> +static int qcom_pas_cluster_init(struct qcom_pas *pas, struct device_node *np)
> +{
> +	struct device_node *root_node;
> +	bool is_root;
> +
> +	root_node = of_parse_phandle(np, "qcom,cluster-root", 0);
> +	if (!root_node)
> +		return 0;
> +
> +	is_root = root_node == np;
> +
> +	/*
> +	 * A non-root member is useless without its root: it can never be
> +	 * booted, since its boot has to be sequenced after the root's. Reject
> +	 * it here rather than at first boot, so that a DT enabling a dependent
> +	 * DSP but not the one owning the shared resources fails loudly and
> +	 * early.
> +	 */
> +	if (!is_root && !of_device_is_available(root_node)) {

Let's use fwnode_device_is_available() instead, even though there's
megatons of OF-specific calls across the framework

Konrad
