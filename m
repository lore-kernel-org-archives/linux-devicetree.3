Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB3B4183C0
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012921; cv=none; b=Yr/YnthewX0KE2uYfz0xprSHXsXb063c821j40uvEnKTh2sajVkFmDGvsCKmFu8bTZZsgKkiOSbZsJFGxGNvnry3GHJc3fQBDsKGKD4XVlbtv8gbakmtJFbB7OqDcr3isgZ6iyxLr9S7LYJKNK6eXnrnNI7pGoxWmrNjODhyCwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012921; c=relaxed/simple;
	bh=QLTukfq8tB6NdhVZj38LzdPBdu9w7A6hXB64MHrlJIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDTi3vLLS5TdWlY1oM3BtOPHrvI1wUC/qaGRs2KVP/byxlhI0fRLqFP8kDhSsCjMLxK4wbqQJ5V1+uklnwCgwIeF8G9pQAEzQL8NCfN6lc5nBGGRKOyLDQC5lZG6M7Noo/JUOJy56m1HklDLkOo85hD06h4Na0EsptYQCK7uy8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SKtC9HCr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RJjb4FOj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SKtC9HCr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RJjb4FOj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmQ6I2625087
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 13:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	evslsdU9NHDAqMtO0VHfpNewdxcF2fUkpvL0SD3UiIA=; b=SKtC9HCrHe5jhBwZ
	hhPoP/3JWA8tEQFsCo/NXGxVcqr4eydavVpBR4p6TmF/p4b+7xIiZlJiOyYJsrDw
	bBTDGWNHWXrZOjFGfmV+O/CMkDZ+330gBPkIJ1WvaT9B+wGZaV/Ghj2qCMWJlupI
	ljKYPGU2eo0ytvIVJgjUw+nEJqABlghz/Y+QLZEw6CDTMLi5KjcOgXRbqrZcCvqC
	kcT85oh2GPVrk9C7n9ZgV3p23mvMyxnh3StmhtXVauA5GpqBMz5waeBLpuT7FDv2
	8wp9WE5G6smUSddkCoMT9qYr8ZnWpKXBE9OIK2+h7KIztrm4MWD2ghW56r5q51Uh
	F2M/ng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds9yem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 13:48:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51759082206so16622531cf.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781012918; x=1781617718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=evslsdU9NHDAqMtO0VHfpNewdxcF2fUkpvL0SD3UiIA=;
        b=RJjb4FOj7RbGJc7pYtKynhftZmBpBJ4clqw7ws0soLE3iZ1xtOeBh7RxLA+l/F1Ui5
         BMiOvo3joYry0oIG50yu8Moz+L7cpNSwQEAGnAMM0TjvJq5cJNAarXv96MpwAD5mb1w2
         Gshgu1iorhsW037My1WgXiGjiSu1OFQV+RrRLQgfBflvaD/5+YLiolLIpISkNEr0V6fg
         WIiqktWlzYp6ec31xwD27W5n9fzlHhye5zPa2AnhhCItj9Z9qrh9lZoxt8oUXlCdToTi
         sR8Tn6ewoqyM1oZXx8LOF7/E+F8Cdwb1dmAfe9/fo8C0/9qCFB1Gq2hqt/A0sk0I2lHR
         4HMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012918; x=1781617718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evslsdU9NHDAqMtO0VHfpNewdxcF2fUkpvL0SD3UiIA=;
        b=IIeqwNz0afand1FdeaJqgezo/A9wGadeh5gOimtxtK8BZ310MV5WF2NfouzkhYiROm
         N5+J8vlY6p3yhPqQVHONlaLzNzLTUK9qKFUIKWRYbKyUX/CHHogI5FjZFEKekqRq0nyd
         hmGtyvT5o7TDq/r1hmwu/cty7/W96QEGK3q+tEonrj0+0IvsG/UImmGk9vfuBqtnQMqg
         CTwUAvWQLilA91+3encOM+uLdBvnxAuGuw5i60E9Bb3RfSIyb+TNz1HlJl7NoeUXtD9r
         eLqWrCFThUt1nneZylOEed+NB6v7eOW5yGjgkHA6OeUPtErBzd6FT+BxPTBeXsZ5BI2/
         j2/A==
X-Forwarded-Encrypted: i=1; AFNElJ9sWqfmRKxhdp+uIH6j9cOTw3Xge3k/ReI+VkGFlAGlJs6z4j+OVFLajZKumaaniO0/feyBAyMBgClF@vger.kernel.org
X-Gm-Message-State: AOJu0YyschrkpMOTjn9IC9veaa+KkfUelX5YKontYntJ9lcuGDKgCmaT
	8qMaznnWXEd1DZGIr+6nLavedFQDx9zUK1Le9h5LDbl/+m2U/wBiGWf4/Pogvkd59I1hfMQ0VJK
	pIZEH5cokhMjZQxfOYd8yidmMRMXIBjUNA4p8+IkQPYv6F71FXu2akVnl2V4HJEgH
X-Gm-Gg: Acq92OGKv9BFrhOo7xXYNWRauo2Ci5fwoY57onHp5GcyX2F/V9q8JxYgKakwFcUOUYV
	UGvyT6Vag+LNjFmUwyN8QVhGnJTVV87iuzDz8f4kvDjicVSuKexHa6WHnRIuJRUPgs6pO5tEu1q
	J+KWUfTDql0uUb3co65bWmYRg6+dGhcPiOwM/DBPbSR1/E7FSXbnozSff7Y0dUeVOIi7uAi7D8J
	kEbvf2vv6NgKWWLzj6i40NQCkfSrmxvpAkExxaJVGOp2EhYhGQSf0mx2iwglIU7WaotWaODXbII
	VOJjs6LSMktUQFE6iAEOqBXhyzFtnZzv3f8/XpAS7KdV5sOeih+bInHjcETRl5cXgzy+4vhentT
	o0TN4R/vJ98PkyKcODF19hxPln3O0H56GjRtfdAKbl2gNZAWOYy7v1ynZ
X-Received: by 2002:a05:622a:4c06:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51795b3af28mr176324061cf.3.1781012917992;
        Tue, 09 Jun 2026 06:48:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4c06:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51795b3af28mr176323611cf.3.1781012917342;
        Tue, 09 Jun 2026 06:48:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176fd07sm1058537566b.1.2026.06.09.06.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:48:36 -0700 (PDT)
Message-ID: <b7c5441c-de69-4a1b-9121-3d15bc24612e@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:48:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: qcom-refgen: add support for the IPQ9650
 SoC
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
 <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602-ipq9650_refgen-v1-2-55e2afa5ff64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wtrZcd8AQzZF-5gfgfGZ-hXuw5l1Fw5F
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a2819b6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yEnem_Jrty2UgpzKiIgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: wtrZcd8AQzZF-5gfgfGZ-hXuw5l1Fw5F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzMSBTYWx0ZWRfXyRsT5q8G7KCj
 1buVBvccp19yhUJhJvGCONulAUVJlSgAf3Ik7CgSCxdC2yq4c9aFx5i3dCJzd1gzXM4WFL4G9Cf
 bdoFfLAbXUyV8TfyBqBxqAaWBYTe9s7bGiIHbiH1KVCNTGmDlt0j4RboGVQyWSNwyv5OWzRfGfk
 kYUkgzeTukj8lVgc+YPPdjNIVUJE8vza2MayUDT/Z1UhyzuDddJHRdwxr1e0UXp0cZOWqsyLdxS
 cXE80LhvIZS3xtI0esCuDHcRoT+HQZ/alQ8HHolggLCiGwxTbHpQ2DsNnfKEDBmOAVPg5zZa3Pj
 +0hif9e7/PlAIdlxWF9Flm7iSc6UmLc9B7177bUqDE0+o4/1+FNCutVX+PUjd+WhHOknqDj//8S
 evnBy9MfoMsdJTzhwUhsqVlFYUykbqIOKIjfMFZlAHnoYUt3yb9uUd2uzFwB+eSWfa3yC1BG05m
 6/dHhjXj5JlvFFegfHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090131

On 6/2/26 11:22 AM, Kathiravan Thirumoorthy wrote:
> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
> PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
> enabled on power up but that's not the case for IPQ9650 and we have to
> enable those clocks explicitly to bring up the PHYs properly.
> 
> As per the design team, REFGEN block provides the reference current.
> Hence marked the regulator type as REGULATOR_CURRENT.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

I'm slightly confused. Is there no register programming needed?
Can we at least retrieve the running state in .is_enabled() by reading
some value?

Konrad
