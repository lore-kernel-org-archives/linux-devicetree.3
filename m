Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49B2280CD5
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093030; cv=none; b=FRjYDMeOwFGvAWN4d3pAjOsYdUAOFNFODjjZzSle9nMyHyrAb5Qh802rNC+fjlnKF4ZHRs4CY1vlEhWQFuWH8heaAuy2DQ/IMJLIGpuLNr/rdlByVhZCbjjNSpFEpNQTkGbPReHFsLpKshSDDj/j+U45f0yBtO/BtksBS4/Ifwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093030; c=relaxed/simple;
	bh=3Pa5vevgeH9L1GoM3IyUEL/eARRqFWTdTHKPE/pFyV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNfHbgxEPKRtJ3fOmUSO2v9VVFxKZBl36FuH+R85SM5oWFxfxzs+iSD9Wgf9GdStBq523JccpQhKpNhqPL/VQ5GZb25REMYpgux4lIAqsc3CxqrceC8rvT29iJi17mC6B2lELVI+tpbN0r9M3aN6/1E0sr6n1mLIV28uq0T4Ajo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WtkoHJol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IoOYrhhb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtkoHJol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IoOYrhhb"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEiwA21422844
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hxFL5rS+2MxjfqN4yIib08BX
	XXF5VfMlIqKMQUSCXFk=; b=WtkoHJol4v6Y+fXMcQMEi4nUTtD2TlHoP/OzJjv1
	bMLJuOJuXIb7rGt8umdLEsGioXs6MYJJZACd4IF0G7qg/Nb47eNRjNeyLuNSqoUv
	JVeQoWYVFN6MH/RuvHiEZfXP9bEz5zxdUPUv4p/8wQw+8s/x6Qj+MZRe5U9mASq3
	8zleboGb9L+VZUGPmqoiuUZBhFpd6kD0rImToV99vdZngi4xPQd9al3s47z5gHDv
	1L8XzkdEBNuBlZZfFlNfMq++XdVzbVUm/HmSySgid6kmzCw/245ravg2x3Jd5qzL
	IaGrgYnqcBWTx9SOm140FvSuY7dS3jkjz4uif6q5lHGvIw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4sk88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:03:39 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-984fab5187aso10055241.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790093018; x=1790697818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hxFL5rS+2MxjfqN4yIib08BXXXF5VfMlIqKMQUSCXFk=;
        b=IoOYrhhbDSoccGkW4cmbuN6XlU1toUGC/uu7bp5xWmxIWgqSNpr6BixDr0+vof3rsC
         NcO+XWjYGR9P6Bgc+jkjAuctsVJFuU7mUXETL3hCyWUUhsMD0oTa3FDYkD3v4+YiWHpq
         tYIo2nQOh3JmFh1YwPyXEDKgwR72uV8XQdJhIHg+h/rgxN4K7H32tvkoDgW97upZBEVJ
         DqDBzJ+ydr9uAFASf/V7I2PqtyyXdkkp5mr4liHYl37eKvyTMod1szAuqpib+ld6xB1Z
         vmAsoLlzMtKhEQ5hnxsf6kVv7hu5GdtEMWJPms9sKs6g1X2PhkiJrKbGM+erfgFz+aWJ
         t/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093018; x=1790697818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxFL5rS+2MxjfqN4yIib08BXXXF5VfMlIqKMQUSCXFk=;
        b=z/rpK3phM4WQ7TFv8paTrlkpatEasGYjpuG5D7O1EGEascaRKqEJm7tDOnaEM89qu9
         ahcdLjVDKX6TJxw8JEyu5bYqV1Rj2mEGsIsEhvEG8uhe8QH0z7HY/OjfcvwbCrUsfhP+
         xW/piR9jU62stnIU8ZixLd3LI4avFleFHjdd561kLvf1VTghbSEebFcKkha6YBQn2ApX
         qFgqaGebFYt5Uj0OIe9dFyuYA7lTXCmuBTEAjq151f9SFM3ySEAdjMEdxJd8rdI6V7Ml
         UHQhiKsPqUarUqvpyWE3iXLcUifRpLcRT1ZYNhW9vHouLPErJSH2s+Wo8xa5d6g+UsUV
         tnsA==
X-Forwarded-Encrypted: i=1; AKwUvBxfcVjqD998q8FwnE4gu5/4+iW4CSjZ0TL9MZjA3UPp1J6zq4aNQz+1kF+N/OUowKlygE6O1fQEtaZX@vger.kernel.org
X-Gm-Message-State: AFuF++kbcD60ZyPTxwF8j75dXayCSRto2ZFyDEKayUU8gKdgcYOi9kHz
	xBN5TcI3EYnK8+POA62N7DXe7vdU9pDjQeAacpo9cubNRK0hrQzyWud2h2m3SEl9Y88mMlTuXQz
	RR/a47XOpxvJt89TOw+6r0PfKZuwOJ8PHSb69LICr+6mJDrUcI3OYVyggzHT9MLiw
X-Gm-Gg: AYBFou34y9jqDQGz7g7nJCia85Cg4rCwrkW4tbv1WctdZWXlitjWmoI5SFWygo+b6NQ
	ifoh+t3KdhUqnvxpbvhWuphM+r0Oyvkzb8s2zoOGvw1V7maorGMZKwqd+sNCB2rG9YsY1YHSmnZ
	QRhis8a4RmP1sb6PUXoqwCK6IiCK9bV8e/PaD6ApyIefE0nPp1Kpgd9WO2u7AL/PiIDTIbLqqQf
	BlWdR+tJ4BNiD8iUD0R+e26ksrTivgDy/K+l7ncLy7t8bltwTB02yqWehsfnKIZQ+uXxUjhWycv
	YFZ1wsthkWGvuUDSuOI+UtYvwnbBRyeU6Hh70RCnOdzFbCqjxdu5J/wSQi4Ku+iyY+Vswt1Fz7G
	FhkrJwzlbRWr1ZpOJ+vRcab0JkXdYA3hDInIh455qzKWkXLbRiNs5d418dg4gqF5Dc4qpnMvB8r
	8kKI7sqNVMgHiu
X-Received: by 2002:a05:6102:8605:20b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-7aa9ec93f8bmr2537028137.15.1790093017870;
        Tue, 22 Sep 2026 09:03:37 -0700 (PDT)
X-Received: by 2002:a05:6102:8605:20b0:78a:4dff:7b3e with SMTP id ada2fe7eead31-7aa9ec93f8bmr2536990137.15.1790093017426;
        Tue, 22 Sep 2026 09:03:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a62f47162bsm341071fa.4.2026.09.22.09.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:03:36 -0700 (PDT)
Date: Tue, 22 Sep 2026 19:03:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: defconfig: Enable ILI7807S DSI panel driver
Message-ID: <4jjdn4tvuq66yutjqpuwxrlruw6lrjuwaf5jvpatpkvdroanet@64dipmovgw7i>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-4-d5d5c3ffe070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-shikra-dt-changes-v4-4-d5d5c3ffe070@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX9DarphK4evzP
 RkIVDAIFkIx51HE0alKS0SurlJjx4YbjQadEH2I9ksuKaTyeA05lfLhJp139CNXn3eF2L76RsFU
 7xnnvvs0/QgCYInt4UkOdKkBhiB+AgdBUtVJd04uwPAOpMYCzpWytoWVsBT1dlqUNin13mxazBv
 OK88cJZpVbr7iMgVWJmyXvcZqA2jTVKTElSi1j8iUVQwonjvzkcvPdSjNFVRs/xW7c6UY83Lxkv
 oGouomItYKvzOft9ZD5B+odejRWX1QZ11PhMAlQGfrFo5/57rqijG/D20q6WIoA1wCOYg/KBDBA
 bSovWqZZ1RpVqYO/AjjCtTGdfYuwU0aaAmQFbTSAflOA9ZIK+llhjRqmshkBkmaE4RmcmyG5HPs
 Y11fV0UZN88koqlMVv8feIA7Ls2U03VW8uBzJh9qHY7eJ6UJATzgDNgNJMpbdETX0qyZG5L5S1d
 3Jf7Jdlae9KXbdFyGWQ==
X-Proofpoint-GUID: XYbn1hx3L5JEXEOa2oeA9KLYDO5lfQ_8
X-Proofpoint-ORIG-GUID: XYbn1hx3L5JEXEOa2oeA9KLYDO5lfQ_8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX1+ip/Eoo8AeQ
 KJxWp5v0AjuRNkYTPKGTGN4kUZeXDYxxFsmfoqXxbrLwiEKNMqW19WoLpGyByCTDjGGhwp9dXTZ
 HTis41AZFMdeAA9Zb//nnqFef/kQG7k=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab2a6db cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=oNl6jLlcSFQHEdJXP8oA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220234

On Wed, Sep 16, 2026 at 02:41:21PM +0530, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
> used on the Shikra CQM EVK board and CQS EVK board.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
