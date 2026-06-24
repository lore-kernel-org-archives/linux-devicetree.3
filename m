Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B41B38C2A0
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782291375; cv=none; b=STgEXr3wBoV4FoJ0pRe8xpWoUcsiRfZa+7pCujbzeCsSx4mSDUeBXSEUHFjtTuTV2W7DIAFyOlUnxW/NsmB0yt+ACZXU1n/J/RP7BewuHueoXzfGIKWvVC/L5XuuiOYIGr2qEH1wyt0TZv2coxoNjT0gmx4MbPZYSSzObdMVqXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782291375; c=relaxed/simple;
	bh=kzRaG/RRyGBVsG2H1tOF4iz0tZn7GqpRc8s9MXBBagQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIInvO4DwPCV1I/Ge1Vxjgz44AnFc6s/pvmKzKc13vqoMD8CWd3uBc9YplTqw4FKV4iH3a6qapMy0WPvLycquFHyDQob9so1so9Br4XcJwCdS0kWF2Y4djwcJs97HTP+LgyS4uT/vlZHZUYoVgyjvK/xa9pDzpxHN30fOz+iD5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjD8+yYv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UNNQmDGl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjD8+yYv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNNQmDGl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5uDZj2238474
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fc0eXLhpiinXLl8s0MS2fMQzPNFm340Gafy1Dq+1FSo=; b=NjD8+yYvKd5MtcjE
	50+ggzeorF8RTyv0rCMNmkAlqXzp3XoufilYYEB77YlmGgs5fRaFsF6KvWqv3x44
	GAd6pIucxa03WnUAzkkwq5MX3iz4TcbIv0x2FLWS2dPz8amcQJakd+SuIf2OWgDb
	q0iAN+Wq8HCESO5PQmNXlj4GGOpxKMX+ZcdRyOS2VfamIu2kDoKfqrNjuAaTQFbJ
	v8UP8UX4h0i7DXJrbA+/fEmyV7MWfaGg9k5mYKUvOGwXSBfC+LOyi7qtvzyfr0Zj
	wrXgPVxDsHHAV1R42HsYiJYONtv90PdK4ulwBGmt0ou5PGAMqmKZIXjNfZLkYhsT
	Km6OKw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p2ar0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 08:56:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0bf6904a6so11572125ad.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 01:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782291372; x=1782896172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fc0eXLhpiinXLl8s0MS2fMQzPNFm340Gafy1Dq+1FSo=;
        b=UNNQmDGl0sGXApFRNpvnxP5LoQLr5jgZXhYz0fg1hK4l8GH6kQgKRV32u7e+14c+cG
         9Ve6yw5CNwY1g9tS8WG2joYKFJAd+Fd15aBlNPDI+kA8Nh5LmGhLDLWPs988Zai47P3+
         MFaZWouW7nuIaYpOkpof3q6wqTADzylpyzwLNJgvyZNvyJN7Kk/Z4VTHvvDXWL7yuO9m
         qpuNmrMxrGZSow3p9VOfzKZTNtkY3S81A6VkJ2oBJDgaZthWkKwnqTNJ4F3U7slNSf6b
         JgkXlXE4QS6oCfIvabtgosZc0hmxkZ1qvPVI6jZ6lWTB5VrrTgvRsLtwy6P+VVXu51pM
         S1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782291372; x=1782896172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fc0eXLhpiinXLl8s0MS2fMQzPNFm340Gafy1Dq+1FSo=;
        b=s5p/Eq9KV6h9mFIALKQ8bemptdH+oRYdTW3UERWfNfyMMspuYHjVlDcbjNmsKkD+vl
         Ye8TcdUHgYIJS1GtTRJaCSyf5cnUWMieegvb3rZjHIyKjhJeIkJIIeRqQos0aPZJXS7y
         xSFm+2BeLwRQ/6FKvhQmGrrbZQChKP1YvBalmq9QDlfW9scOUdXDqwE+mRK6mYZ8SX6O
         FcEz+HckyHm5ntl8crMF0USJ1Vn5+3YiH1tScuq6FN7IYaFkJsWmu1E8FWeWuSlhv8A0
         Fj9CbxnaZAxVmLnuUZem9naWGlRikIs0zHCeM6afVqV853L/E5AT2xYhob8ALuYoIip8
         w2TQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRrx4/ls17gCSxQkl7/Bn50WthsucTyw8Cym/MWqnHYAycvrVqDxHKwGDV3gCvGkQ+NkFk4GCL3P6O@vger.kernel.org
X-Gm-Message-State: AOJu0YyMk34XabDlMW2NzG+qt7GGGXPymfUylWIZg4m4Gef9SOHw+dr0
	GoUdTZsYlr+Dr6900yXuoocbCp3P7m0uduBvYvF0US2f1hRqecwX2xA0wixdVOBgpG6v+vqcqah
	bnvhuBzaCQ8arkTY9sDgtQXE0lBDQUJt2hgAHM0OTOQzz5U0s13eAvCe4TcClFoFv
X-Gm-Gg: AfdE7cn74+ajyZlmvrdqw62u69xPG+h5N4BZ8j0mONaqrqhaSU914MEtq1zNB4M+7iy
	bYwQZ9RounVIvNvWkatvGPpkUJdPSkqGTmzdcQ+BVXRZod+qyEuxpWS/mMCd+tsBCWdIdL+y2va
	SFwTMuMwBZbvZ9VxQJH/5xoFGb8mhSTVpBPUalWKuaQQJBYj4BSVrT3V14j1Sq8bRNOFetVmLpE
	cgPYa3a6qmrxZcPcc7eB2UMnkopfwtoGpFPOUWr9nQ4SWM6RLNOwxsqiBfEdLd7KjItlqWH26x1
	/f8fl2o/wePnNVrSdl05MjxdIVslKWgaW37Wn4CX14fDnggX//6ADtu5JHs/PWFF5E96P3LTSPT
	Ih+yc8cLT0n0fHTCUnVpH9opr8BpAOR/sueLD5yFC+KIUsg/edcMQ/3bmdrI7VUQmVuTG0upi/p
	t1
X-Received: by 2002:a17:903:1b2e:b0:2bf:2015:5b93 with SMTP id d9443c01a7336-2c7e142d0a2mr30176515ad.11.1782291371883;
        Wed, 24 Jun 2026 01:56:11 -0700 (PDT)
X-Received: by 2002:a17:903:1b2e:b0:2bf:2015:5b93 with SMTP id d9443c01a7336-2c7e142d0a2mr30176285ad.11.1782291371464;
        Wed, 24 Jun 2026 01:56:11 -0700 (PDT)
Received: from [10.133.33.218] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af590sm151284575ad.17.2026.06.24.01.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 01:56:10 -0700 (PDT)
Message-ID: <858ce69d-1d3d-47a5-9c1c-d7608e8dad76@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 16:56:06 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: fix traceNoC probe issue
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA3MyBTYWx0ZWRfXy2DkyTxc9VDb
 0HvNs1fDHjaebONf/Irm7f5RMv9l22aduY4LvmbNr4kgWmLVngH33FxaiZ+jn6ncSQ2tfSsYDGD
 fAQUJaiS3Iu53bTjf2CpcJP0fpfBE/Y=
X-Proofpoint-ORIG-GUID: MfHyaJ79_jW2C2EsQZVMYYnrItZfuJLN
X-Proofpoint-GUID: MfHyaJ79_jW2C2EsQZVMYYnrItZfuJLN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA3MyBTYWx0ZWRfX2WHzjw4Hizw8
 DcgwlJ+fP/ZqlJOXWyfCqWo+wm2nhUQmFjSgVHLgEZMVdStAFJ8eboTtBBEsO0askBzBhWyMtFy
 68+0GVxRXKDhdUk5GPiiz2aRHGGkFQ+ioTUCPqiZtGI47psnlSD/tVmRlVKfSBw3yrpAKagcNQo
 PtQulF9U7rgrzj+5gxFoSsm9zy26jk6N7Ew3o46BeL/a4IqaRWPw5ID9ujxK+UY+VuaP8WGGWcd
 VNdzYJzTjaTcfQcBlK8AZI+XVm33d5NXSoP4qXT8UqAL5son/TIum4Gbz8ejjkoeeyizNE8yRta
 bSVVPIfGNcJx/PbBiTyMEiUPmegd1NvssvJfbXHOqWHg2ApAekoqnUNwwkwhwY57HGZw2/b3R1v
 bdAPUXpiDMFUMHexH1Gtoo9pxlJkpactLPG4vsZt9F87p6ZsOjCegBml7crGbvlPnXon2WboMUV
 2CKg0/zRd7iGnFfRX/A==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3b9bac cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kGvFbencCR2aym9GMV4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240073



On 6/24/2026 2:33 PM, Jie Gan wrote:
> Fix probing of the traceNoC device by switching from the AMBA bus to
> the platform itnoc driver.
> 
> Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 7aa9653bd456..84561b5faf81 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -5003,12 +5003,12 @@ tpdm_pcie_rscc_out: endpoint {
>   			};
>   		};
>   
> -		tn@111b8000 {
> -			compatible = "qcom,coresight-tnoc", "arm,primecell";
> +		itnoc@111b8000 {
> +			compatible = "qcom,coresight-itnoc";

Sashiko mentioned an ATID assignment issue for the itnoc device. I have 
checked and confirmed the issue is real.

I will try to fix the probe issue by adding arm,primecell-periphid, 
thereby bypassing the AMBA check in amba_match.

Thanks,
Jie

>   			reg = <0x0 0x111b8000 0x0 0x4200>;
>   
>   			clocks = <&aoss_qmp>;
> -			clock-names = "apb_pclk";
> +			clock-names = "apb";
>   
>   			in-ports {
>   				#address-cells = <1>;
> 
> ---
> base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
> change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4
> 
> Best regards,

