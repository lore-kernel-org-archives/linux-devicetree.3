Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67435463B80
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924539; cv=none; b=LV5JyhbvYhIDu7C5EOX3+4Gqs9qdrrR39jq9hfXRY37BOpDx1txtEMZ64gro3aDOXiUoQ9hT+Cx0gIcmKYHgN4ueXWLKPJlpR35bPYjzpUQKaEZPf5uJqdlzpQxzTxic2KdQC9cfWSPEJ5j+XGyD6e8SPE8QlzjKZFX1Jf5JauM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924539; c=relaxed/simple;
	bh=P9sorK3EnMx+N0zFoDx2cEg7M+adcYf81VKFyiOOUD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UfCA//8FNZMPvz7vmN+FetU4O0gOOI8EUvnBe+35rJ496NQt45W8HxLK7DPaldkoi3J6m4VBeexw1a6riPjhQoK8C33UdtuZqdZ4LfvHfOlOaZDnhtnYF/fZ0eGxYxTydxC8pQsOkU8O26ihG/GuGrtmxJ3660o87qaZBgn9k5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bjIR71BW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IADM//rv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjIR71BW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IADM//rv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDRpEX3747205
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XjGRFZVnlfyLY74MHaSAHoyZFlwEBuWlJGFGGTbqtQc=; b=bjIR71BWu2jN0L1Q
	2i1gfAGclNEsmVZpWx+0aiEhHYb9x/QB5EWLrbxWoFON+2lCOntlsTL/rSliU5yu
	x+Korga1ywAKdsrK8/zcWWS3oqiTJnOG9Fxt89CsBUFH2AHI28RuU94b2lmmqwRr
	nyI/HQ7VfSAcUrmi1utj+zZPy48ylesDJganpz+8VulcjavQZXiN8SBeDjG1Rnre
	sS20ww6ZH7cHmhdrl8pHlvSnrDSqlWRwcOiq9xJlt9vK1kzM0PNMYDTPZwS5jesX
	RBREj9ovoo2DAzAghwSwF0RJ5GlUZRRUM8zH9Tl4CRReb4UgCZf3Cty533TqPbIb
	GSvtrQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42p9tmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:42:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d7ef17031so1103431cf.1
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787924536; x=1788529336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjGRFZVnlfyLY74MHaSAHoyZFlwEBuWlJGFGGTbqtQc=;
        b=IADM//rvKfcRaoNn2sfe+8vB471X/+EVnQrwV+HHlGffb93wlMhD5j3oSmFI2jwzQq
         H/b3Ju+6H4YhTHq8NyGanpq1VzXKKFlgB+/kVoz+qMSsbB2Rq8k1H3PC6lYzjIY3scfo
         bnb1JmH1vBUQDQuyz6P08rBjViy5EdfIARUEpGuYnbwwsR67xtB3hJ1YpClB/KVh9IT8
         1GVQcUZbP8Eg69ZgiDZepE6bb3BIPoUyn2X/NaI9eRG+fy+6yMClprjIjsXK7kQIu/tS
         ymvm+FqsipFeLdDfNZSXf69RudXhJPo9Jp/TNk4ojtHQU+ou5d86M1i9f3szj1kpNGZZ
         PmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924536; x=1788529336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XjGRFZVnlfyLY74MHaSAHoyZFlwEBuWlJGFGGTbqtQc=;
        b=ichmIk+6FjVzlMra/1Fw5YD07Aiifbj6E4CXgA1o5EeC57BhZz64ITb8w7GdZ0aq73
         pSX6XsNjjljqoSTDdsjIhLenQjV0hkQYnQzNcM4jJF6XIwjPpdVY8j4oeFH8sL8FJ0Yc
         DGzjcssgRKn/ai3ED/8akZ25pXQCj9gvvW8Ok9HNmGrBlkLf8+qKGHeq8sJzwIWIlBp6
         yp7Y2U0HxhkGLMgee8Baq9ZtXs0kHsqCWPQpmq6O18l1+6Z+dW6l82l+HGr04cB21t9t
         9iqUmMq9GVxEB+aaS/w9TkCicuAtjQamqZkIHpEpjajuAHYKgh0F3pnV7mD2gV6ae1Yu
         upig==
X-Forwarded-Encrypted: i=1; AHgh+RroQesRgxSArz0FU8d+2ia3ctBPG2ifwgHK930jV5wbzRsTnHCL98C+zzLcxVRUa/JD3/m1PqLA44Sy@vger.kernel.org
X-Gm-Message-State: AFuF++lgO+3ZhwMqzDvjRIbOTjKKp6Y1wQC7n+CyA8zk8eJKkHq+7nI+
	W51+hflmMWD3uvPX1mpYmLj2xYPaL5ZVg+nzdIPY1zgekEM8lytzwN65PYKuNesihmCYbsjssWd
	vctyragGIIMHfcGemaiak0AOs1FSnyhZMctgXn/kVjdSV3/DzJZzDYQ17shuFxruq
X-Gm-Gg: AR+sD11bsGrnyg64vHdQ7Uyj3YWFq4HB9zNXgGWTcNDslDS1yCepU8pLrRzbWKoSOmp
	VIYxbBrQAG6eWf8Py+wb0kQxWO/KNZflJuEAViSW9bao0QqRxoG780zJuzFrDJNGnPfZ/Y/P5st
	q6+TCXyRT/kt/x7vpis0Jo00feTNEqrxNrf6bKPfyBilHO8qfNTm469r5MWz5/L0E85T+h3UDCt
	IRaaOv66HBfdOzd7W6GFYe5flVFt6KWf+pfpzoLvNa10yYmLKV9/9JlhF9BciE4T62FGhd+wgB9
	dv/irVjnckeq/iZG1XyB5rFATS5rxYt1/gnqOd5IyXUiESpIgVwRUWXoF10/kvvsa63RDnWjzKJ
	2CIGCZig0O3dCGIJz/2hyGqE=
X-Received: by 2002:a05:622a:1348:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52fb961b8a4mr52111581cf.3.1787924536484;
        Fri, 28 Aug 2026 06:42:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1348:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52fb961b8a4mr52110911cf.3.1787924535956;
        Fri, 28 Aug 2026 06:42:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c572sm555948a12.4.2026.08.28.06.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:42:14 -0700 (PDT)
Message-ID: <b76cbc5f-fa84-4eef-a4de-c95ded152cc9@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:42:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-9-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-9-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ql_L3HJJOwPhBE-muqCZD63ELaRkwjnb
X-Authority-Analysis: v=2.4 cv=ToDWQjXh c=1 sm=1 tr=0 ts=6a919039 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Ql_L3HJJOwPhBE-muqCZD63ELaRkwjnb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfXwNyAZTKQ3Sfn
 bjk3Qph3LRC3YFHQMKATEngihDkUy2+fdQFmh7J0LUovinh80zcRogLbuhYPQ4Ohe1Bzlpfx506
 2gdvvi6HW6jSd0Mwd8xjkW7BFosOMcY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfXy+0EyIRUTsbQ
 fRmrasGRJEkcmeubei0E8XMkG9kjApp2BTv+fKPSUfE5HhBlcrMVUTEf0NUunmwxiso8/cZL3LZ
 6Ay4IRGSgLxCZNN5SK09NgO15Byq+kK9NuRLl/N+ixkcrxZv3C9p8TRhxhcrynIFOKkAtPt+VV1
 wOUkZ8GKlRM1TfcYON4ApNtILJV0bq9MiPbAg653XcbKxt2i9oYqbqe2uqEHwvDQ5yPu1gGVsC4
 9iIrLIfviDU6YCHRxLxPvlzbz+RYa3jGo7fy6yBqv0bS2j7vLmZu4Rij0eMWFABkLwCxRaTMKi/
 WB7QsqUSI1k5J/+BctANhUxa71TUqu9SKBSjEJqkXLdzr3uMxh8mkvaBBR/pia4cCOEW4J6uGFe
 GSjvLFYqgDdAkskNSGDHDXIAqIg+uxKypULGFwBNQGfiUTkGaOyY0bvjhzjESYv7/iW3wJaZSoX
 OYov+vGr+x25mBW/w9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280118

On 8/9/26 2:29 PM, Gaurav Kohli wrote:
> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> 
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in hamoa.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 95°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Update the NSP passive trip thresholds to 105°C to align with the
> higher temperature specification for Hamoa IOT.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
