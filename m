Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBBF49892B
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160135; cv=none; b=XIDDfX6yFT/M+ChuXpSafjQqXw8tOWDrNCTGxd1xXx8BUMs7n4vRH6RFBsMlUTS/95NOBntHsQvusBIP3ZweGo+nO01EV724m9khSLDJoibtIBoNkBCbWZ/UEQTgLrCZkKUo+PDiGT45N7NtfNwIH6I/nD5fb4BKzM1Ldf+hMTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160135; c=relaxed/simple;
	bh=esAFI4cBO5gZrgs6kcPYz6vVF/4XQ37sisj7UUTHfoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FAcXY/iuxgZUN1nNGScJxAo8Dky2KlehQk7kC/pWQcMGm6SXPHWxNNCEuSTkvWsJiCnuCTG3ZXY3NSG8UZ6IZxCBdbHOLshgitO3oVvSbyb2VMAZ/uia/+CL+3Drr9grUuy33ajFs/Tw6KK44YJ7uUjWwiyAbsVjsSqNHP8Il7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oA8rlAWw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AyrTF35Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oA8rlAWw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AyrTF35Y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2eia2821196
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XRklZaFveois54wgeLU6HrDBAGjajP7PcFqAfsF4MI4=; b=oA8rlAWwaiJ5ELhP
	eap0eC2k1dioRZ/iS5X/0iyvGfepuSAwfv3qPpUmNjDHB26Kb4umOP80Zmu3WPms
	UVLsVlnvWHGKyqNmuQ7m0NYz2nmj1+codE8j+bVmXqhOTecShCVCaKbMWOiI/QS+
	lGEXci7PckEYy5w6MSs+PI15iFd9V5Ed9IHdXjQmcBhzCh6DX9sJvOntk42z25BL
	cXwL7e1YPtoMiOp0RIyFCJ9um/3F2QZFdeXS4/tnBtFfBaloMyDNh+TWGOM9QSCf
	qN7P4rxQmNF+JFGDwMWeV0fk0+xD6+3zKgXjwPe+zyN3wTl23ctRSOTwnwPm8y2l
	ZrKauw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwarck7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:41:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9106a836457so2048906d6.1
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790160118; x=1790764918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRklZaFveois54wgeLU6HrDBAGjajP7PcFqAfsF4MI4=;
        b=AyrTF35YTAkSu+nG4VKnfeIiH9PZ6qGSAbE04E1JxI+nPyiHkTTVU8XHYNlYXfCxFs
         dhlyPJlkGKA87OpQXSgHGA+f2zum+97N7vmk17OGuQbu7/LpQCMKUjYsC3CKgTpGObEx
         vRzugzHF8zijqaEJaqr7lohFeGGmWP+8FY0vS8OgWjgHe9jYyax6VUO4ijfXJLhqOhQR
         qsa8JYwcf/lm6FPK4PUBDgPUtQtQX/CMXbwuZKMthrVvpfSikf2/fVtIyrxA5lNOkANj
         uX0RkdUJqnS+RnugdBVUg6n0oh0me8OnwUcTDzg6j4fAnHXTWDAw8F2LBDGWk4JnWl9c
         dzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160118; x=1790764918;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRklZaFveois54wgeLU6HrDBAGjajP7PcFqAfsF4MI4=;
        b=o3hkOwTPBId+ddB18dKikSfDniCZjh31jSlIEGRc4f3FvBUcl573aX8I6fkfh/aNcE
         S/vbyizXs5T1gz/DQAUCkY6i6zKtcsSp2EzYyTRhEKcOZ1WtP1U3zlWE1mekGqOqxSDV
         mzwwyqZVurntYI5/d4JQPKbgEVSweMS0qCdOieIwqOn6d30dKlJluiyF+x7tj0el6rRk
         PhuQEfM71WMEHHm6/EDkXtdnCV/+2S47KFohTeQh5yPIGgJRJCdCx3PbuOZjRTIhHCbR
         IIvJ2y+a5FU2qBVDFf+ElfjtVuuV99zzm4Px0C6OWhsuAWaM3D9M0+KQ+GNYCI29drxH
         95wg==
X-Gm-Message-State: AFuF++mbzvVkiUJgJj2QegSuDB4F7y1ucKgoxBMb9aqehEduIxsSrDj9
	VxfPyY+8NKQ9Wvd/jxDuGFzy4Uz5KJvcpXuRRHlu17L9A14GF+ij7sNELNiwKY+K9yURBznVlfM
	zsn9Izfj8vycjIGLerxgRB/i/ZEtB7G7T4KKKCxSbY7bZy32cax5uZvJteGpWm8/x
X-Gm-Gg: AYBFou0rMMn2Wt2PsHYgVKHbdMol9WlCDLv0657K8TGtDFqqV4SmzzAxL1GKx4DZetW
	JIiE7YX6N20tHI1mdMNdADKSwKX8ZU2EDvW9oi47dWrnlEeLwvXZgAqoQH9OVR8JzO6CgQPBfjm
	8U6j6Emq/af5NXpMaO8CcyXz8IA9w+fn/fVFiZYM2NdSRoUykzeURuwC3maJeLkILbeN8uZecgx
	gzbw1DR7zTuvI/YGcGs5kXugHTuAdjxq4Czjt235NplDM2R/9mljVc/MCxF3LsSwWaKvdU1UxRM
	qlC4jPXcXj9IE1PIxhk/MnsjfMix80qF72EOR1P8R+AGTT8WMFJA4GIjazyjVlwN5rG1pwJzVGi
	GaL7uCH3FuyBu6IbutoK3HA==
X-Received: by 2002:ad4:4eaf:0:b0:912:1f0f:b204 with SMTP id 6a1803df08f44-9140c30c392mr36584876d6.1.1790160117882;
        Wed, 23 Sep 2026 03:41:57 -0700 (PDT)
X-Received: by 2002:ad4:4eaf:0:b0:912:1f0f:b204 with SMTP id 6a1803df08f44-9140c30c392mr36584556d6.1.1790160117437;
        Wed, 23 Sep 2026 03:41:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c5524sm93803866b.21.2026.09.23.03.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:41:56 -0700 (PDT)
Message-ID: <17ea3f77-5480-419e-90ef-9c51c2c21da7@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:41:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Introduce Hawi SoC
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
 <20260923-hawi-dt-post-v1-3-e41473b6298b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-dt-post-v1-3-e41473b6298b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MiBTYWx0ZWRfX6P1iY/WVWhk+
 NYWCaCsH66OxoTTd5PYCLrSbhKywj9QL7P23lJDDHAncka7L/cHORvPEIHiY8+Exejit5/gqJ7h
 LCosrM4V4MX0WiYdNKPs9Ynw7jzh7HD2muivk2BBbuExjXaVybUujuYxSUPdjxnesimJtyI/wMX
 lRMDNSUe+8DyGh2EZeRJbhpBTDoAUyVSkentjkYZ6EN8ZO5+0CUh5xAQctN6y8+JrKlJSmDh3LO
 hLc3GsLeLJprRQr1DSEq0f62OWc32wMIn0XlFzNRgDQhUO/VhWZUJpVeLfBZTk+q5i2h7ciDfiU
 0o9HMizkqAW8B3jlVq0MPHAeOLhIodERDaxT8LXa32/jP/UaxkgZQ8K5N6xMeBkG5o/TkEpTbtg
 nRUczXvfsgK0rG+zHaO6XQytORfYs/yyF320dgbEdoCpbQRpIRcnCeri2JXr/r2rZINf9m/gcJB
 kQFCKqq1YschLtbOXEA==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3acf6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0j8QO1Iwqel7qtPues0A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: nrIU9VlIXHNt0nfvS5dj0bjT6fT2hD9I
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MiBTYWx0ZWRfX4js6yz+lViTb
 s6EeYGGsgPGPtktWEa8uz9e2uXhCtWQri+wyARSQxi8bEn1pmwH5ggZbpqafedZgbEsSUbrQ7o4
 81+AMmHqBDg5/B8I5yfhtphYUgc43LE=
X-Proofpoint-ORIG-GUID: nrIU9VlIXHNt0nfvS5dj0bjT6fT2hD9I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230042

On 9/22/26 10:18 PM, Mukesh Ojha wrote:
> Hawi is Snapdragon SoC from Qualcomm.

[...]

> +			qcom,smem-states = <&soccp_smp2p_out 0>,
> +					   <&soccp_smp2p_out 8>;
> +			qcom,smem-state-names = "stop",
> +						"ping";
> +
> +			status = "disabled";

SoCCP should be enabled by default

[...]


> +			sdhc2_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;
> +					opp-peak-kBps = <160000 100000>;
> +					opp-avg-kBps = <50000 0>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-202000000 {
> +					opp-hz = /bits/ 64 <202000000>;
> +					opp-peak-kBps = <200000 120000>;
> +					opp-avg-kBps = <104000 0>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +			};
> +
> +		};

nit: stray \n above

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
