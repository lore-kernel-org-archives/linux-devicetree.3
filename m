Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFD71AA1F4
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369851; cv=none; b=Jd9GWo7qZqenJS31YoLY4R3XTu4Q3kyWZi+asheosyEpV1DCIT7F4lkl1GXYQdDX1YJhClCMGMjporAvxBCK1qurgeo0VvXFzsOgGvXU2P+Lu8ma/ROyGlN+y62SPldwYDb9b+pkjma4kKlMDLgO0OK+a3eOg3YVWfCVESiGENY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369851; c=relaxed/simple;
	bh=CULxo/gDTB8XGUt6p9aAxOcLZGPLwy/zLwkql1jD2gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQqyW7bbNKsfeGRcdV8CNXCqyhl3qY0NFJzoOiimVgX7EiUsQYXz3jn4yeBAx+hpZI4zeripN0mkjqWYJkr9/wUQtzL7YEe4OBPj4QYtSCsV3Z3kSC5JNFomjsrsQcQ+pIDDoSVLdyaJMFvySo5QXjpG3BsnI3+Q/qBsxQRRIcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqCY2NKe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8dCy1PX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqCY2NKe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8dCy1PX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OG1aUg890620
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y5NJUYdtBmfzETbQtHkB1dh2
	zk3LqAbCqpHCY/q1gHs=; b=LqCY2NKe+5zyH1YbxAtksWK7EKax5PG6A+O3YW8H
	QTsfzXs7Sylews7P1HIBkDrmc2R9yG3AA8kL4rVgBx/GrAhYdkvGBWvWVS0C1KGa
	UaK6XyO+wDdeEqoYeM+qQlnfDlinEN22MPNNx3FbWSQ6tdwwirRwGAkf+oCJ2GK8
	j1f02arzJGDDgoKszLpQkYFbjbhS/iFQ0AJedWCFrjM4D7CzZ7yf9m5DdqO+jyoZ
	c1yHlpL9scVPtaoxTi5ezYktkAcbLzqRCZdzRxYUqepekUWginNGrYkkZZw+mL9i
	CpQ41TH8tj72pyBomSZJQYniLv4B0nSd0G3fEthdjP6QRQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3k1xat8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:30:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094ba09affso92777911cf.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774369847; x=1774974647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5NJUYdtBmfzETbQtHkB1dh2zk3LqAbCqpHCY/q1gHs=;
        b=X8dCy1PXt57/7pS4c4+TGjPqLbCI1XhdYwWhP9cJN7w2XFEkiCHjRceMWpfyH/UFgE
         zKc7ea6vb7L7zyiEpMAu5wuPxRrlbFcbGCF+eQmFnvfGeRdKc4tAOjM5ZKojEHGlvzHS
         5YzDRIUrHVy0kQiEiP4Tg+9WHyp5upsQIND0eE62YgCZSRi5ChL59sIcSr1FtanviWj/
         ZL+CM/9TlQKE7QDNseHmHQqFb9v1uyLYireE4YGDvUoRIC/Mo//yNLcw/sww7vaJqbrB
         g5NfymmD+V5oDQZ0gliAAk5ksIc7Zy/bKsQQBebep7pmB5GjNPrLVmUEvhaAYq6lDfUU
         fDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369847; x=1774974647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y5NJUYdtBmfzETbQtHkB1dh2zk3LqAbCqpHCY/q1gHs=;
        b=GOqbwLP/lxg95b1DgnUtprBlqKdpRLHtBw2FHRfr1RVU+8BOOUl2y/RqW98l7wSjl/
         elcvmMubPLbv6O+vdUWoPP7uH8K/XjIuVzFB8BR6uaAiBjKVHKeryQDQ1gugf7BFVO2r
         UcFhzIDxt6qauorWmYn0mQKlOl/NlFuULngRl/gcVM1AxWVJBOaURdfyjT5N/MRXDv2x
         nPiFhKkUK4Rza76f2KXOMYzLjMZRU6Q2hNPffUI4QRbjEZEK2E2rNx4iSxV6yH+D+RJk
         6fMFg6YIamNtYvzWCkI2dMROKe/vX9pMELLFb6Qasov3Ywd8KPTEyi+X97UbnoE6ZeYQ
         DxWw==
X-Forwarded-Encrypted: i=1; AJvYcCUifId7yTUJyxa8wL10EBTVRkoEHxfkuIv9++0Xoe2jpKcfsQtRtx3xHBxKzO8P9GAn39/fOME/pFHm@vger.kernel.org
X-Gm-Message-State: AOJu0YzD4Ep9jP4CcN1aHwIYPDUcuf2SspMtK4oNQsV5A5ZIO1Rbx3do
	7UC60WBkgKB7m1fczkBa+MOCMUU4QZIUdV1jMmLOi6MxNfw+g6BjtGtsF/05zQa23lggFboUDO8
	aO8IEVCE2ijVPYZqg0ZzoMc+HDjbHQix84s48aMu+Ed379POOOcPiQYeZ19ZlZ4N0
X-Gm-Gg: ATEYQzxdduo37ohHQKX+8OMKc3RSqYct8ngOKgSkqK3w3PbdKIGYwJo2naJ43fsBzzT
	H6ya6Wz3rHPSoD8yOQwG8mxahqhAC8lgHtbwL0X6PIbHoXMNFxZtIuMu/HfrfnBeVjdatR6qLXG
	dn5kLvHcJEHc03h1PuorrxdAgKRn6oX+SDcjclKgCOagCrUk0bTTymLvEKKKCOTCwIxB7LXVJCP
	zsNXZq8hmfIfHRHakWVd2cSDvzUYUoyKEdlhwSHoZBVLyUx1GwexN3Ik7pYrEsq4/+YIT+WwCvd
	ck0yLejmIgaazptqFuPCcqbgBsY46l2Kpz2C9w05ZUplEwzTncitelXCqg0wSiYC0uW2zt498ua
	HQIWmj8e82x2jqpnPFmyd+0P2W5EslpU+vA==
X-Received: by 2002:a05:622a:4109:b0:509:61:b22 with SMTP id d75a77b69052e-50b80e8cc5emr3728861cf.57.1774369847258;
        Tue, 24 Mar 2026 09:30:47 -0700 (PDT)
X-Received: by 2002:a05:622a:4109:b0:509:61:b22 with SMTP id d75a77b69052e-50b80e8cc5emr3724311cf.57.1774369844400;
        Tue, 24 Mar 2026 09:30:44 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b87f80976sm1206728f8f.4.2026.03.24.09.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:30:42 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:30:41 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sudeep.holla@kernel.org,
        angelogioacchino.delregno@collabora.com, viresh.kumar@linaro.org,
        neil.armstrong@linaro.org, festevam@gmail.com, Frank.Li@nxp.com,
        danila@jiaxyga.com, lpieralisi@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, tengfei.fan@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V2 2/2] arm64: dts: qcom: glymur: Fix deprecated cpu
 compatibles
Message-ID: <cavflftjyzqiiajds73slhq3qucwmv43rdg7uqgwhan7yujuxn@hoy7kbgqwz5b>
References: <20260313103439.1255247-1-sibi.sankar@oss.qualcomm.com>
 <20260313103439.1255247-3-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313103439.1255247-3-sibi.sankar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyOCBTYWx0ZWRfXyJ5SsX6EqHfI
 A5ywCtXaY0RC5grJiF9imYMvOxh2/0idRJ8Hsgne3qOe+288mi6xO0oJAdk1Ea7bqZFOzIgerui
 WJuZiP2loDqhUuLkT7E1SvSnHtsdY68vTl2XRfI1JUN667zAAAOnQchdVUMFi2Aj45tpo+uNwc1
 9MCr4mVqYpMD1Pmkw5DPGYpYztQaGKyMADER05F8dnaAFzq6qo9Jxu/fKhUS9vzltpD60ml5D15
 Xc0SOPIYDcJ+jz1Bh20gljC915MyjBqUCvJ34MMqjIPEvqHmfVnzff2w5wWgj2xv44bSp8lnItz
 314Q0cVZZ/uyLVW91oV3qlUK6mQZ4Z6tIkxPsj2eRwAEDF4/VkUYSZOjrg4TFAMgCsS/mT+mfxs
 qNRgxhCm8PTVW35woFmuP0uk42Gt4TQ9XITBEgBZCRdCQysZbXM0CPdOHOduPuHltMWZbX6SZ/o
 sUcRODLyPC4W4IgZRIg==
X-Proofpoint-ORIG-GUID: NqhOTd0OE6SV5w4E3MEQUDNco1Nur3qa
X-Authority-Analysis: v=2.4 cv=O880fR9W c=1 sm=1 tr=0 ts=69c2bc38 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ElVf3PSpgwV20Ma6fAUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: NqhOTd0OE6SV5w4E3MEQUDNco1Nur3qa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240128

On 26-03-13 16:04:39, Sibi Sankar wrote:
> The generic Qualcomm Oryon CPU compatible used by the Glymur
> SoC is deprecated and incorrect since it uses a single compatible
> to describe two different core variants. It is now replaced with
> two different core-specific compatibles based on MIDR part and
> variant number.
> 
> CPUS 0-5:
> MIDR_EL1[PART_NUM] - 0x2
> MIDR_EL1[VARIANT] - 0x2
> 
> CPUS 6-17:
> MIDR_EL1[PART_NUM] - 0x2
> MIDR_EL1[VARIANT] - 0x1
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
