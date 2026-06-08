Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277C83E1691
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 18:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780943660; cv=none; b=VygcA0pfJvolC+U+iDxCh8Jg2tqaf1Voys+l2oLKDwSXxn9eZZy/ciWeAPyI2SPNniRSGHQJ5CiDW+PWx1jAnKx95zf/64WMfiBcvE60ICr8WruA4rx9qfau3ZA2moWiLHBfCJWDwleFXzqqqFGHsNICKl7arX94ikMK2fbwAkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780943660; c=relaxed/simple;
	bh=cszapqqMzVR8qQzqB4p1slVbfHkfNBq0dwgcvnu7A/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alZEq+JI2cK1n+M8QVnPANd8H3u4R4GmCkmLS2gukowfbezxqbrTAaE4V4wFRHl31KQkZGeb6guiRlVEp4i7mx5yv+xpdmNfqGKBIZcyAS9u5SgKT15hqT9KqJPsShbteOw8mQduH7gmks1Eiz5jC+uGWo1hIKzeFUUzwjhMmLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pi1s6WYU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OCKIRF3P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pi1s6WYU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OCKIRF3P"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFWXd3479132
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 18:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y6lHqDrILk6ZwFJEJhfYqYQU
	sLI6VPS4IzZmvPLMpNY=; b=pi1s6WYUFJuy40kVzbe7ItAz3WzN4C7UDEXXKdXf
	gHb76uYtbBrAemhMM9t6bna6AHCEMKkYqdi0c3EyImISeDMhFG7QvhnQdqhFtNyf
	0YtM/9qeZYpJcrESDatooJXyDwxDFxa1lvkT6uaO2PPrpuASKwKBndWWQ08zgIBk
	K+LSs9SVqr3mo7Iq73Cv0OJRqIZBNhQMwhUNmbDuio6EFQaLsTAirsp1fWULlYcl
	kYe2s5N+g64NbAPkTzXu2h7Sst9/JeqXxcW5fgJ4K0qQ0NVOzB0SJaowP2WfDsJK
	IPZdS9WnQvLK3kapXQOTeeqFkrhF1XErNEr7RVoWYzgcLA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx41e83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 18:34:18 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59eb5407c95so3048712e0c.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 11:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780943657; x=1781548457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y6lHqDrILk6ZwFJEJhfYqYQUsLI6VPS4IzZmvPLMpNY=;
        b=OCKIRF3PUO6DeZNE5gyXb5k6T+roWktK3B/OZKZWKtQs7iYyMfzEdikdEBY052f0ia
         UcF1l/hAhCiZ5D2e5Sk5fNkMrF5zYm7lJONldb6jFyl5CkpVEtdA2HiiZijGi1fTJt9G
         eDM+2xvwziext1z8h7jkVCz9e+k2yLfH9LD5uOTh4tQwbqOtbjUUlEVmYTdd6tnD1DJI
         eetsdgAMB0qfSuYnxWb1oAJqpKTkTIi4eDLcc7hxu9gTp4BNaGyksM+VWebmaTq2NLqh
         xshkqNA18/zYFL0YrC3+wXhV9qyNGzRKVd+qzOnPCMUZrAxxXxipbnaJZAXLu2O9pkMq
         BQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780943657; x=1781548457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6lHqDrILk6ZwFJEJhfYqYQUsLI6VPS4IzZmvPLMpNY=;
        b=ZvCKaj6J0CBDNrq9MpVnan7+Y1l7ZitUeOqm1ZjYMUqlrVIqH4xilJ6fstaDTeJvaY
         BtcmB8d5BDkfkT3TRbJQzcjx5m2GQJnS7zoviBQOp4OoHRSfXXfscIX/9OD1pxDIzRRt
         fAY7Tsgl8KyBPXfFC51WWdcjofYcXDGxA84sI5GR6AAFE3qFOxzF1HsWw+n7LHwasGpr
         OU24FZtCLwAYPoVDnR5DurgChvFRhBL9I9/4siBSAY6G5KF2vhL29nDCX2FcXzBaJ/Nj
         jiVrw4CWi0SQImjtQ3yH1JBcqAmMJzclaqr4bd+vB3bfFwy94E34j2jOd4hdNNb4Oy5u
         uThg==
X-Forwarded-Encrypted: i=1; AFNElJ93SgFmLm49ZnxOtAzluuZE7EKH64NCr7yU9+HsMiGSUPfm69KvIoOZ8pBANaQ9qjZe4hzdi1qLUule@vger.kernel.org
X-Gm-Message-State: AOJu0YwPo8fvqHk+eICMO+pl+EMkYVl0Se82dAENzD6CPiacmo2CqCdP
	KlnURy7mEN8DFI/CCi8K+gAV9J3gsTx+DVjDJQWmcyhx0VNGXVxxWFP+FHvRiQAD7n60BhoLNtS
	3YlxgUZKlJ6A5YLNcARBH7zMzRDq3m05j6QOi9EtHkSN744ecnpjOsX8QTtHUhrLg
X-Gm-Gg: Acq92OEYnnAmGTCOdS3BzxmIH4VHZF271YH6/tKxVNjSBEHH1MyV8+rY9CN2yigqv6l
	CtC+iLuU4Qr/GIqu1TIWEsHs5qn7eizwokokXUKDOBxVXYDxPgwZpUIdFlquSNvt+ixI/prsvID
	YlbcnYeabxbw6tKPr7PydZpPq3vNwmngZ/+WgD/XhK4AY7pqFL8fnPsF1VCy+JyZp+wcENo+2qP
	UzO6VUWzIDky0jC0iEnCSN4wTnmycNmT2PRcRUdBdqLhQsp8rG/8pVNTmTwd8Ff5GjgIno6cnFT
	CwsAPpNJv+M8IlvwQ/ikkCpZqg5pciTigEzMy9wzTFuF4doZMb+GgvZeMDo3+7OAgaUZi2GDMf+
	AwVNq5w9nC7VXy3OsblR5N/0KKAWbtKppxyZzMqouSt2RnJvZifa/IiftA6UKIBLmXpGX6RNO3Y
	GRlkDlwlMNQnN3ZNM9pT87iA0LubL9DFAkELDAhGuHETEeaQ==
X-Received: by 2002:a05:6102:f98:b0:6a2:cf9a:9221 with SMTP id ada2fe7eead31-6ff04530fdfmr8933008137.20.1780943657195;
        Mon, 08 Jun 2026 11:34:17 -0700 (PDT)
X-Received: by 2002:a05:6102:f98:b0:6a2:cf9a:9221 with SMTP id ada2fe7eead31-6ff04530fdfmr8932995137.20.1780943656825;
        Mon, 08 Jun 2026 11:34:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be038sm50752961fa.22.2026.06.08.11.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 11:34:15 -0700 (PDT)
Date: Mon, 8 Jun 2026 21:34:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8996: add blsp2_spi5 node
Message-ID: <5p2n4anii7nwrywh33did7rjedbzbum26bf45vigw6ilqyyfv6@jza2ja3fsg54>
References: <20260508-wip-obbardc-msm8996-blsp2_spi4-v2-1-8b81a95b1ed7@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-wip-obbardc-msm8996-blsp2_spi4-v2-1-8b81a95b1ed7@linaro.org>
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a270b2a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PIJ3xH_xa6AsNK1UVp4A:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XcGXOJ-pa5GO-fobqMvOAcg8UszcQ9JR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE3NCBTYWx0ZWRfXweakkQoddQGI
 unxfqOGyTmd1h3ISmBnY9q4DTTK3g/C/tXBnpssq0DJME10i+3r+1Msg+EReLP2SpLH85+0webg
 lkMXEPCPxudV0Cy7HkfuqW6epHTruBPguB73KX6Z8vfsNQ2YCD8/b5N6JdH8hjudyh87f63a3i9
 RF/Gb41REfgXbVXhoMyOQ7nHTf2vyi8x+QpmGFmfXiKkkkT2Gl/6mKy+q6D8IeNgTbqCdjNgzfO
 d9i54/+DJP1nSC2ev9pH6A7q8Bbkyh9j1107f/A5v+ChiYmIfVifTWv0HfkQjP1W2j2O+hXX0Mo
 ZEuAWEJ90doqFHmGr5hL5Ko4Z2v5rgd9gQAYh+hYboSrE1SV4lZ79+Skm9n+pFGZqil1fVUHk05
 8S56cK9U/SdLgwIvIiar2hgzrHr1vHZzZ3w1X16fT4vDvPZ0sidO9c7amb+zxDIm8wTI8NhmuKN
 DnbNuMEaXRpMNTxeuAw==
X-Proofpoint-GUID: XcGXOJ-pa5GO-fobqMvOAcg8UszcQ9JR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080174

On Fri, May 08, 2026 at 03:30:06AM +0100, Christopher Obbard wrote:
> Add the blsp2_spi5 SPI controller node together with its default and sleep
> pinctrl states.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
> Changes in v2:
> - Rebase onto qcom/for-next.
> - Rename node to blsp2_spi5 (Dmitry).
> - Move blsp2_spi5 node in alphabetical order after blsp2_i2c5 (Dmitry).
> - Rename pinctrl nodes for blsp2_spi5.
> - Move pinctrl nodes in alphabetical order after blsp2_i2c5_default.
> - Remove superfluous register property from blsp2_spi5.
> - Remove superfluous interrupt property from blsp2_spi5.
> - Add dmas & dma-names properties to blsp2_spi5.
> - Change blsp2_spi5_default cs-pins function to blsp_spi11.
> - Link to v1: https://lore.kernel.org/r/20260329-wip-obbardc-msm8996-blsp2_spi4-v1-1-5d9270235e92@linaro.org
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 41 +++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
