Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6193FB055
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003125; cv=none; b=V2ObJd74EO9GiJ7GXRdLWXY5OiiEfplaKgarIjS1NWu86UM8OAmhY8SN2iib+UfwGMO2pX/GuO+rxf9AldF4/ZzO4u+8wsCV4Eg9ukv1K2wftMJW8Stv+ikfogH4xlX2R2Hcz7n2j0R+PILSYAO2lnwx/Fu/oJGa3YM7xID3hBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003125; c=relaxed/simple;
	bh=sdfJoX3weu/5bb4kZAE6iE0eMYM9msScYhHFBxigZbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8R8a+MWSNd9IgjpYnvuCrVg283/ht55u6jvzCT5LoH5XnsulwVNs4I1iXTXoPwoAKsIg7A6AY2mdLJRqAwdli6L3zT2ppFi47ltW7CVgxO2ZkEemdj2Fq4qrD8GCwZlXGggW1f8a/RWJlkjlYQHu8ReJzcCkS2pTwR/LXr2NgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEOHiqKK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NoW6rB67; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEOHiqKK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NoW6rB67"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vBV81907230
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 11:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rx28RGAmnnvmqWkKqwEakAwX
	zmzhLrzlkZYWSnJi9t8=; b=gEOHiqKKDVWAY2aHe/EcQnF4WPWtVZMw52z1/r0q
	kI7EJIsgunUKy8/08l4rWR4bSeFImrMm2cZM590FsuTIbEI1c3zVt8WYnTwfYvu7
	IPtDSVLWM6/p4NKvhqKUFKH1GgfI3xsMTb9p8QEY4ZLZRNxsEYQqyM4mk92CYIhC
	nU8+JPr19/wF7QENwWL8lqzl5WwRHat5satyF6T+pwrfQrfcDT5Aif9j1lHU7ryk
	gghfTJ2aDKHUxa0FeqtoSO5SGfBqvKJ3JU8baAnXhFDpEs3/QV3jPOunEKcOMPWF
	Nzuhfxgi6iBwBVBMAhEcr5+X1+TJFsnmAdfc5SrSLRn4eg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jrd8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 11:05:23 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c7b5cf8bceso2218743137.0
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 04:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781003122; x=1781607922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rx28RGAmnnvmqWkKqwEakAwXzmzhLrzlkZYWSnJi9t8=;
        b=NoW6rB67iEhKaQj/Qi7ICcmw7ChM6QZOaiafk8XQBq7CQwJW4/ABkBmgqiZYhG+R0q
         laD9PATUo2H9fetJnHvDdR//Go7uOW/Kr8jv1elMmmh8UqRUPjbIxaMtMR/JkcP8nU00
         kjJ5R/zzl1R+c3z3v6RkFA+yz6x5Uqk6Q6ziT5rl/hG6jrTl4j+roejBltZ3yvBG3+ew
         rUIy0VVAAGU7eCxgjheTQvn463iflBfXmIiF+xGRc7PQB+gaxZ5YOeyk+NQ8jxcpEfRi
         MmM/lC7uujlvBEPUyLAhFzTg+1WOA28ODCyhWIoM329jaqyBQXpunv8virWfTjZpkUnF
         EPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781003122; x=1781607922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rx28RGAmnnvmqWkKqwEakAwXzmzhLrzlkZYWSnJi9t8=;
        b=TG6/AIlTBPJ+7TTQHiBZanoBSilc1js/90cjk0u4EYG8UnxytZpVxki0L49SVkLIC9
         71l5R0zrruBHHmN5HChZOFQzd1910Ibxt+ICH3ME8VEwQ+VT7M7lWQxBh/NZIvz8AtN4
         P3/eXA6fbTUIITJXr2BT8zHii7A+Gi0UfSGp3NJ6QPYYTRAdBTlnD0mc8QqHDJe8y/C4
         zCbgH3vzRIPXLWG0sNHj6Tzd3hZWLbriI39Xy33+iBzx4IT5JaSo3nKaEJxWe9injoW8
         fgZoN0JZ3w1jht9U1ZfjwJBu+r6glfVGTZf4otGACIb6CC2b61wTDcm7eSSDN96Qdogc
         yvNA==
X-Forwarded-Encrypted: i=1; AFNElJ85RE07jRzKqkgRucmwd8ON7Br/3bY/2isuuv+WxAZhL7i6J5WCKO6NSl5Pz5X2firiiwWa2Z+Fu++J@vger.kernel.org
X-Gm-Message-State: AOJu0YyvmEAjI7RDGxA2u7Olyorj8Bb95mhtJJMlyNV7f7wpRA37IcnQ
	T+g+2Zltca0myiPSYqZxeArnYAWb2hCzqqlUnIL/XVsxReLa1jrW08xaSbCu4OHiZj54JP3is3T
	3GLd4OIU4U7CeBDQUVkgcEBkD7RdGgDpfWEoklIPi/zaXfzCxTAEixcm9TCzkJm10
X-Gm-Gg: Acq92OFJ2qxECZ69O2+h2jcQggNHMiLSHdsSaZjSjpLV7O0I8XI7+pkmez/P5PDAZVA
	jyzm61OQb8GmOf8w+yvddzwHSddW5Er2ToC8iUZfUBlXj2vEjxCdDzxYhHSxmdWscigTPWbzByY
	t7fqkqjxK9rE7KI9vdwlhFP/nCPzzi9xZGRpVTiPkLK+8HpFRP48MTIS3m0gVvcJ+YBeY9O9/of
	b+O3uM6wSRqsji92wVpxKm/Ujk+4TqJ0zvENCN+swK28DaYmjtB8X0jANbMonoOV4y7UqIbDS9n
	10fC6t0Ebmuel6DKwxALdrF2v5ppOOvT1y0oCHOkKjHS3taqsM6ndw1yWpymD1GypgR49bGEpPk
	3WlVjxpwTSjMU8/1WL8Vi2CMZR0dEtM9AL0LA7hOvPqoH+iJfuh01KtStecUWM96Idpx2wB3Ymq
	mPgERCAi8BLrGRp4OJxu8SvrcPhT5eARnQtTBD3vq3yiJgrA==
X-Received: by 2002:a05:6102:848b:10b0:62f:406b:1baf with SMTP id ada2fe7eead31-719367e1560mr450026137.20.1781003122142;
        Tue, 09 Jun 2026 04:05:22 -0700 (PDT)
X-Received: by 2002:a05:6102:848b:10b0:62f:406b:1baf with SMTP id ada2fe7eead31-719367e1560mr450006137.20.1781003121692;
        Tue, 09 Jun 2026 04:05:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed901sm4515726e87.10.2026.06.09.04.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:05:20 -0700 (PDT)
Date: Tue, 9 Jun 2026 14:05:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] remoteproc: qcom: pas: register TMD thermal
 cooling devices
Message-ID: <h6cat45sxkn3l5ispdtuf6dd5co5t335sp57ry4cbarwwzms6w@whokz3vvm5ap>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
X-Proofpoint-GUID: 77CH81Yvolm0pezP8B06APo8xWKSPZHH
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a27f373 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=MAJYu3_Ptnbw-qWrP8kA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEwNCBTYWx0ZWRfX/UgR9RDjPZfp
 nyVhshFfq4wZXzm5h+RsH/sZxSh8E+5NDr+8MHMVqkN3NZe1BrnI1sMcAxtB/d/OEW7haMkVRI1
 aeeGPtUDrnXyLBqyFH6YFrHriKlqefWrt1bLo0MPvk5UJ2tSOyLaZmKR4MlAapQT3oU3YWi9JjH
 i6qr5CXObbkmhYQAWQWP13dvWprdtU+gxIU+CJQ1pYTOVWD7Ie1pI2iKwl/TO4UyxIgq59JCzNz
 mVxaT3aZ57JkP2e9cYn+Q/Nk+ESQNXd267vIK+E7usThJHi2Afxm4CHkzdEuyfkOq4mvw+jE/vZ
 F5IGWiWi9Nu9thqyWPj+uFyU5wYCfpVj2deqfAOAoHnNOomhr7uGUlQx3ksyWQlRF98Pl+TXh9F
 ojix74SDDkYWq9KyLrWfTaIBFWAVyOqlQgSMvpB4RCCtd8zejX6nbgjfSVgAD13Suk71rHwO0wc
 XE/dtZKElTKJtWOqBoA==
X-Proofpoint-ORIG-GUID: 77CH81Yvolm0pezP8B06APo8xWKSPZHH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090104

On Tue, Jun 09, 2026 at 03:52:58PM +0530, Gaurav Kohli wrote:
> Add support for Thermal Mitigation Devices (TMDs) to enable
> thermal throttling of remote processors through QMI.
> 
> This enables the thermal framework to request mitigation when remote
> subsystems (modem, CDSP) contribute to thermal issues.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Wrong SoB chain. Yours should be the last one.

> ---
>  drivers/remoteproc/Kconfig         |  1 +
>  drivers/remoteproc/qcom_q6v5_pas.c | 61 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 61 insertions(+), 1 deletion(-)
> 
> @@ -733,6 +737,49 @@ static void qcom_pas_unassign_memory_region(struct qcom_pas *pas)
>  	}
>  }
>  
> +static int qcom_pas_setup_tmd(struct qcom_pas *pas)
> +{
> +	struct device *dev = pas->dev;
> +	struct device_node *np = dev->of_node;
> +	const char **tmd_names;
> +	int num_tmds, ret, i;
> +
> +	if (!of_find_property(np, "tmd-names", NULL))
> +		return 0;
> +
> +	/* Get the TMD names array */
> +	num_tmds = of_property_count_strings(np, "tmd-names");
> +	if (num_tmds <= 0)
> +		return 0;

Propagate the error?

> +
> +	tmd_names = devm_kcalloc(dev, num_tmds, sizeof(*tmd_names), GFP_KERNEL);
> +	if (!tmd_names)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_tmds; i++) {
> +		ret = of_property_read_string_index(np, "tmd-names", i,
> +						    &tmd_names[i]);
> +		if (ret) {
> +			dev_err(dev, "Failed to read tmd-names[%d]: %d\n", i, ret);
> +			return ret;
> +		}
> +	}
> +
> +	pas->tmd_inst = qmi_tmd_init(dev, pas->info_name, tmd_names, num_tmds);
> +	if (IS_ERR(pas->tmd_inst)) {
> +		dev_err(dev, "Failed to register '%s'\n", pas->info_name);
> +
> +		ret = PTR_ERR(pas->tmd_inst);
> +		if (ret == -ENODEV) {
> +			pas->tmd_inst = NULL;
> +			return 0;
> +		}
> +		return ret;
> +	}

Assing to a temporal variable, check the result, assign afterwards.
Saves you from the nested ifs.

> +
> +	return 0;
> +}
> +
>  static int qcom_pas_probe(struct platform_device *pdev)
>  {
>  	const struct qcom_pas_data *desc;

-- 
With best wishes
Dmitry
