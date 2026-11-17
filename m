Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930740;
	b=We7ZbL8Cbh4SFJ8rCKqWh3R76f6XmbK8oT0hO9FgTjE3O/eYsfrWdpDaaBgQBiZQI1oz
	 yGOCdv0iuborN0jCcSjyNDJbHmON8FnF/VAkOV2VRIenKl5hTLxIByuRfnXJa7tS394ss
	 WDqX8w62IeteV7tA+UaTUfqAWsk/suHwj7HXVMBe+gYz5lP9v2QGuSqv3SOUKWw74JbZP
	 ceKdYvMFKp88uJ88EWlTOgp97toOqhvkbCQRllC+XkR7UL3OqNakCpVIJMoWshc871CRr
	 TmHCklKOOdfyoOb+yValCi9UCH93bLkDGWq3oBzZCRkyolm1IHjd5ilGKrl5OC8op9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FmGrMIbX3U/GmFll4bp4B4R9IonCrAbCABRwgK+nqKg=;
	b=nevUm4EwcUCUuqRN5CphJdNoBnLswgMLmxg2QzzF+ah2zX9fW7l2TfhxwP04zcBQUdkr
	 fyxeTOWduV0ZH/OMG6Z0eoPMvfZx2rlUwN8Hqk4BauwC11hEmg0wbZd7sGa8xjIv1D5NX
	 yY/L42jEfIysHzzOrMmpTjuF7jFg+OYxs6tgdkOsOrXbW4vS8tcs53pQyPLQn/saR48ZW
	 9eBkZWVvrPvxZEVFyFrov7WVgl5hi4aOfymgcO5Etocal1sA/5zIfkrAJn+cRUF32MP3G
	 etuYjmdYaan3aNGMJc6pkWoph8yHCRmjlZHXAYHGFfBPvF4JXDqTJOX0QIkBojVSi4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LCJy97CK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ff2/wjmY";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E330D606A331
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 15:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E330D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LCJy97CK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ff2/wjmY
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQeGa1916200
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 15:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FmGrMIbX3U/GmFll4bp4B4R9
	IonCrAbCABRwgK+nqKg=; b=LCJy97CKcfTS8s7rGAMfk7tN762TIevSlxFaIfrK
	0kSHf/kxSmhdDdZZTSArEA6HsJDigvKdLDhk/QhLwLeoPy+yvUh36qCdQR1QV4o/
	p/sWxIrR9Pi6Mp6gFsuHwe9u25AxRpRrlAhFA5y4H7nBZnGAPKmd0k+aqirvSAjH
	MYEgQU1V7HEBByT+6agp84N1MVrRXssFbtwW/SF0GwFJcQvF8g32N52ZGwb5uEkQ
	K/MnfrFuhJ4Ydm2lFbZU1UIoMn4rNva3BX5EzYqYmGKsIIWlkW+tHf0DxpSr+MsU
	WPc5t8Oqyn2WjO2YAZ1QPBlkhNrkGrw8ouWpYlLXigb8Fg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0nc81bac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 15:52:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so5391442a91.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 07:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794930738; x=1795535538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FmGrMIbX3U/GmFll4bp4B4R9IonCrAbCABRwgK+nqKg=;
        b=Ff2/wjmY7nbtXRCYKKjVD+UReHwpw5C/ZDgnqbX60guWJgvZf+fOKaSZRiJS2NIpXm
         Sff0sKMrrqnzX3rUkS2pzlLQF6MZM1Hqg5B3NmXgaJUMrdk+KNj/lV77uk0oYktxpua7
         yeTSvtLOkI8RzIdN+zSZoY3uctv2pU4OwZH1wmkGb6XSojrpF9WI38K1h+5zwID7UDu/
         NIHX1H6DZKCoLzQ7WvVdnJ17diNc1F4P7fxzhFfMt6NSms+uqOYOwLIDTomMuDlmQ9kQ
         MH0IjLhtAKNVyxQT/d3YBBwLGVqr6/tl/mZpPVbB3iYpHA5S0bwdiX3hKGKbQHvR+JuV
         O7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930738; x=1795535538;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmGrMIbX3U/GmFll4bp4B4R9IonCrAbCABRwgK+nqKg=;
        b=S0T0NvZFKtbD+VqdL1IyrJWuEOwVFuKp4Lh3BquWnjA28mFO/3GypSsjSho46O+WPq
         wXyUFLCpwzipPLJmG+HKywndGY4KSFwbLDfVMer2k4uo0/oUbi+/NTF2Bf/c7bYHwwNu
         1+yOnqw7x9QuDyyFeYjZbEqjJlBnP4WHdkUc7/8mT1YS/JAv8uD3KMM9keWzsoLQgz8C
         /YwPGSXKLILcMHOjy1GLUgsB5Nx+PP00FW656cMDXKD/3X16CTb/M98/QL9J5OA5ynGO
         /FXfZ1OI5HF1R2U4xSKyecga/4mb+sDT2cZs8o80g0LelnQ631i4RpNh8Dkig84sJYqT
         piDg==
X-Forwarded-Encrypted: i=1; AL+hErH9ZMAudxYnuDc7EfyCgEGPZTVns7RA+QvBwa4DUJD4d1gPTR29oVN6e7brFdBXYXc0LqWPKrwzdqKW@vger.kernel.org
X-Gm-Message-State: APuU4Z8/YA/ksLDxNwUV/8Y5EyFJw7BkecRbY2gOAu7PYizuur6Oaggl
	+7dyJrsGv4rocRYYhvVr/YKbBNd9qb/K1Xg/i2M04L2w6n6+nJN6mw+HwoHhnzaognQBPIjKZDH
	f0+kf/d2MOSmQnlTTEZu70u34vz+n13V76m6Shp+KH2tkJ58zWaPw8OBfunLu8bjt
X-Gm-Gg: AZFdTZfg3zXK+9ALj2lTVGd3UFTJLcfKYeFplKQqvYNd+CBZ+Xw2xI7YT92qMVVSxPr
	RZ9kyuHtqJjMeD2NXAdUUAWMQVGCQjpMoiHtpljJr0DKOug5hDhJe/rylK9Lkd3JmfyOsmZQtZL
	n7MgrKhGQrKW+8PAmGYMN+4evCN6G8Cbbkbxo/nL209saA90Kp7Sk5tse7FxjbskwgFHy//SMyL
	jrgYLDxfNKcOILhK/rnL4ONpR18nSgvkg0ukjqlrYJVPMVeRwcuWT0ndavIeGww2hDYvaOWecUq
	iXUDLbgC3drUu0+CDTYmIHva29MPCLa4UwtBc/2M4mLt5H2qTsvk0o60TTeEsjLhbbULFitJ8Bg
	H8wZ937HPJBVgZBmEGrh7mzgaiFuaIROwBCSGjItS/aSdl/Un2tiAHcl1EYIuxxJJgkV3cWxrcl
	Rs
X-Received: by 2002:a17:90b:5343:b0:3b3:cae0:2b6c with SMTP id 98e67ed59e1d1-3b3cae02e34mr710842a91.34.1794930738193;
        Tue, 17 Nov 2026 07:52:18 -0800 (PST)
X-Received: by 2002:a17:90b:5343:b0:3b3:cae0:2b6c with SMTP id 98e67ed59e1d1-3b3cae02e34mr710809a91.34.1794930737651;
        Tue, 17 Nov 2026 07:52:17 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac292c53sm4601441a91.7.2026.11.17.07.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:52:17 -0800 (PST)
Date: Tue, 17 Nov 2026 21:22:08 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: remoteproc: Move iommus constraint
 to SoC-specific bindings
Message-ID: <20261117155208.wbnm2hldjrfomryh@hu-mojha-hyd.qualcomm.com>
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
 <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>
 <20261116-boisterous-ancient-macaw-8cc00e@quoll>
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
In-Reply-To: <20261116-boisterous-ancient-macaw-8cc00e@quoll>
X-Authority-Analysis: v=2.4 cv=LaipeTfi c=1 sm=1 tr=0 ts=6afc7833 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=mipXywydoeeVaK3_k7YA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MyBTYWx0ZWRfX+f67mLVlKRPC
 nys7N17EiE7Suptg9gFYgLBiXv3bigHSjPK1btZ5DkjZaBGEFE3Dq9qB7S8rB0w/E2WnfRczdIs
 xyAa+lSQoS5tATTClWn/Zy2K6f8ZL4o=
X-Proofpoint-GUID: cHvFwceHKh87yz7aDoCmO0_Q0u46pLOX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MyBTYWx0ZWRfXwhsGYC8uxj3s
 WZJLxyCKhdbT3A6uB5jPSYijpWjpo2Wml52ziNxPDrMc/bWkTMqryiHgzHQ0Q4xV3nJFTA6AW4O
 IxrtU+X+7Mk12t6NZh02dOHlGPrLgepQOeOkzJsj/0KIdU5oI7v/1jDjmmfxbt8LtPFRwY3RqPB
 mrceQGsZA563eEorB09fxqrDQPmFdYzTx+NFqe2obzGVNLSg6BpNjn6y8B4nJP8YEkjsguwCXIC
 erl7wej+T1Nt3pP6R4s+ghmRXYcgXxIcog68mFDsIfnnBFPsmEuw/7mjszTjjG80bvyLGPBQxH9
 BCd0KJdaxwO2m1bT6vQ3tt+yZgElP9et17plvqJJxcboytOIDslrMti69UwhZZUx4lLJ4MG29UV
 7wURfN+PsAvgfU+HwE1oQMGw0gk+csDjd929xZw6sc0LHLDOdpka9eeieUQHUjNjYxH9vVssa2p
 /6qPl7HYWaHDb73sDfw==
X-Proofpoint-ORIG-GUID: cHvFwceHKh87yz7aDoCmO0_Q0u46pLOX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170063

On Mon, Nov 16, 2026 at 11:58:20AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 13, 2026 at 08:02:20PM +0530, Komal Bajaj wrote:
> > qcom,pas-common.yaml limits iommus to a single entry for every PAS
> > remoteproc, which is too restrictive for SoCs whose firmware uses
> > multiple IOMMU streams.
> > 
> > Drop iommus from common binding and let each SoC-specific binding declare
> > it with its own limits. These bindings set unevaluatedProperties: false,
> > so a compatible that does not declare iommus rejects it. Declare it for
> 
> I do not understand this sentence. Compatible cannot declare iommus, but
> anyway the bindings do not reject it.

@Komal,

Yeah, this patch should prepare for the 2nd patch, so ideally this should
be a no functional change patch. Any constraints change should be a
separate change. So, ideally, this should be removing from the common PAS
and adding it to every SoC PAS YAML that inherits qcom,pas-common.yaml.


-Mukesh

-- 
-Mukesh Ojha
