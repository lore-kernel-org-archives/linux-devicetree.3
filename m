Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A135836D9EB
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313833; cv=none; b=XjtuJCvK/jsPWBPyL/QQlSMK1ppdrw+r0HSUkQ1JgLVI7zTPFxlBlHrmIYeXEBmG5su0Cs7hPc5Y6cLLC283k98vb/Uvldu1uSBIQauS8iKHbVKF0PvmOohMeQcwk2OWbQL5C6SNR4M7dX84nztvZOkT8I4ope+EI34LZ044icE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313833; c=relaxed/simple;
	bh=NZbzVWaVHiBF3W8uLPaqkX/feD3/s0YkOgd+u/PTLKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsXSnfvuwhl1z+/Y34s7dtqYkYpHJqS3n48p9Wxvr/x5T243ov/gbRC94EShUHX6dMB27Kh+aAxcHMaBRC+fOv8eXzb/mK8BAehlskn8sTN4Ri0MTqLnbS+0uylPLnKiSxCzAT7mpvzaocJbzTeK/m8JLQ56yZr3svhdxzX463Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+FWiXti; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DkzRIEio; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+FWiXti";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DkzRIEio"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651AxDR1334628
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 11:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=55EtMKRRw0JSC7C5W8hcUBkY
	QcZqMU8GZLRoMMfIUyc=; b=E+FWiXtiyEDBNgeuivCmC0MoXDMGmhPHFryw2M6l
	Bnp+oLRv1Gq0W9YYuJi5cvsK47kcAMoWwDGPhwEslHu8dvvy5oVbwrlaxzSne6Gh
	FSNj62jS8ZtSKUPTxM4kDlVHl5GgpfiM4t2Rr/ypZAdt9R3oOk45pMiqLBnNj9cq
	W6vEGdH4Rhomz8nznJhycFt5yfPAYAslH81/LJtW5NcHK+vuChxL5kN3RM4AswCZ
	yvfd1nW3GRIpqVGQSTXzCfxjqOH3u2bC8xApCUDTi/HqfPvvN6rBbT6BoqaAjlYJ
	yZgnX1Wqb/1hz3TjwneCj55SyOfMA6e/U3AaS+Z8UO1djA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh8tfr59p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 11:37:10 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59ebc14be73so626757e0c.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 04:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313830; x=1780918630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=55EtMKRRw0JSC7C5W8hcUBkYQcZqMU8GZLRoMMfIUyc=;
        b=DkzRIEioHQo+emvZ2GYzM1JzevDeKiIVDCV39nSprzy/kAl1ISV1bl/b4QC6ea0H9+
         IHI0terjJjv6Q3M2LzR0MHDdKQW9qM5TaQPosW4E4QOCYho/+AYvxXziId4RqaE/I79A
         hOT6g+hFp4yczZCYLsaS2jkwtvlXUrg0i2Xzfh54v7SVErkcjuzzMah7p7T5zUCT3kwI
         lNpG/1pFou3dnAM5I085QDbcOSozbeDJJAqv6TaoMwzAB/fOpioIPU9o3KNx5WFPiamk
         99IxBRCEGwMSUrGvd4v1uMFklHE5NUIA8dywHNft0CBaxBYPSECYmvgBch85TCzYSBka
         UL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313830; x=1780918630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55EtMKRRw0JSC7C5W8hcUBkYQcZqMU8GZLRoMMfIUyc=;
        b=TqelmHOv+M6HpTP+OnhNYQImjIYI2mgL04jh/mYmynRV+ja6WYSp3FKTfSHBYkK3jE
         wv5GfjKS01J9ZKikwQlh+n7UYAXXLbxULtO0Kt4oVXlhY/SFMlvXGcKGQqDIMaelFJjs
         SxcSDLwKBCGKUHnns8iNYPlZzed3z8sjkbvAbCfcEU5JzTck9GdpZPEI4T+AwD3kwkUJ
         IWMMs6WxK+xHqY9I+9pArAa9mf6qW/lIluY+WlZujZ1bNuv0vc6xdUpxAbXXTyEZmqAl
         oj6ib6CvVD87CzmG85QEALHKMLbIbYRZwOPs55sbZc/yq/qHa/aNwudjNWIJcjytyQA/
         zkMw==
X-Forwarded-Encrypted: i=1; AFNElJ/e5QBUV7/6eOm8olrZDXEpITFHyTPUeIuZBxiaKOIOe6wUGMDLLAfQHC3B2jzYlDaMN84AIhYwcJ0S@vger.kernel.org
X-Gm-Message-State: AOJu0YwIpkJduA3BTPng5J6aDw0oSb5AzrSrv2gy6EWdulFt3B7ATJih
	acdaU30Mzg1SFY9ileUqu3Vpcfbvs1Cnelx8ImqAhXlEBskUx1ilODNyL4msbnncewW245npMPb
	Q14CrDkhmWmSa3z3A8BHCEakiBlEtM8yPS7BYuc8dfojEb9d3ulORpAzL6oE+vccb
X-Gm-Gg: Acq92OFpwfcttzVp+IThzZheomFSQ/SjgpDiJfsg5GnZBnGOyqruwyj7AHo8/gRHNQ7
	DY4u1rPdGI8NhG5B2vW2srT4D7KeM/4X3y9+ivAVPGbb0nqHs2QBcaQkMxTtustRvUA1Z7SszTs
	D6K3sDIFNorx9TVSXtCWempHbhHB/ZCmcN9J0NRTycrZGR90KN6Xu5Vz3bDGsoQTbv7+xVjlqj7
	wsPWcIaN9xDGiULNNFHFhe863cp+xqUj3nkW5U2ZoH5IQtx+jOLQdGc06r3pCz+VW5AfSoAuu54
	BHLie11/32+IBL0nP2BoHm5uuPdAyWKj0Ak9PEPSCjqbM52SNQlhq4acHp+nLbam26zdh6bldkQ
	hhCmCSbHu+1YB6txoz5z6FG+QQ8rshaLVz65HO665TefPYxM8q7POuuef4W6kaFbhSnR8KyejC0
	l7rITgbPjJXJrpN2Sah1WVhztfhvQjg8YQ+pRMy0FXC8Ko+Q==
X-Received: by 2002:a05:6122:d82:b0:588:c9a6:2807 with SMTP id 71dfb90a1353d-59bf46458d3mr3866831e0c.10.1780313829796;
        Mon, 01 Jun 2026 04:37:09 -0700 (PDT)
X-Received: by 2002:a05:6122:d82:b0:588:c9a6:2807 with SMTP id 71dfb90a1353d-59bf46458d3mr3866783e0c.10.1780313829350;
        Mon, 01 Jun 2026 04:37:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa631c7e9bsm1494523e87.16.2026.06.01.04.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:37:08 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:37:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v3 04/10] clk: qcom: clk-rpm: add msm8960 compatible
Message-ID: <ckxvmbz2rmel6etaqyzdt7mt4ijdbehqp2sg3pggcdo3hf5qcb@z3vkzqaby2rt>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
X-Proofpoint-GUID: VZLXHS7-Otilbjpx7BOS6ulTluTnI-Ge
X-Proofpoint-ORIG-GUID: VZLXHS7-Otilbjpx7BOS6ulTluTnI-Ge
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNyBTYWx0ZWRfXy5reqYjmzQ3L
 5X8fYJfzyqAb0ElPGltiWNNsMpj8fI7jojF+LTY4qdZFRidjt8xaAgZhP9KzjowCWwZcVu6kWTh
 xeEvu1scY+GyzJNwDMGDE06YdQVMFsdJwQs5RD8d+eyvMM+5YMGJfGueEPM3SF1CaWOAGFszAAM
 5Gf9jVlY+WHwvAI2+/OEjRw6lgjRSf2LZ94sgMGX/128NJRryJzHWkXk4J02sAXgZ42Wu7B8Skv
 55bAGQbTihliu+NMgosWJWfUAzWPDqxQocpSEc8QrH73IC7i0lZYVUpxyFg1EITwL6BhjVlrFEL
 9FrNMC7A2BZXdKLFC/j6G/aluKQpMlu0FpUmUjkdMbv3EPAAigwbfak5VFtrLGONd8U9kv676nh
 QT/Ei1rumRcIMUeuOR5NDHkkHY5pJMxtC/HXcU1lV30NcEQQZd9sdMsaPzPDmozliOyqy6I6O9W
 tK/FILAMH3S/RkmmTQA==
X-Authority-Analysis: v=2.4 cv=P4YKQCAu c=1 sm=1 tr=0 ts=6a1d6ee6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=5PoCL-xiRuW4qANWJgcA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010117

On Mon, Jun 01, 2026 at 03:51:17PM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add support for the "qcom,rpmcc-msm8960" compatible string to the
> RPM clock driver.
> 
> msm8960 uses the same RPM clock descriptions as apq8064, so reuse
> rpm_clk_apq8064 for this compatible.

Nit: if the series will be resent, please consider adding something
like:

Although the platforms might need SoC specific quirks or features.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/clk/qcom/clk-rpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry
