Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59C642A96
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 02:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788835888; cv=none; b=XMsLl12UHK9LZFSvzOiBxR9597/PzhNgMbpnWdxNOOARKVCNouQ+W+n1f1DO3UgtyBdkDtGWoU+Otv51dQI7M8xf/+ZxlooizpVxVw7BHGLNvr7i0DCtUpdgWOiBUdDBhyudMxj4ypghcGKg0rS10mWrntgdYtTX2uSuSAKm7lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788835888; c=relaxed/simple;
	bh=VjVgSIEHErlpVkc7eq+UEEYEg/iQEcRtAbhlLZ5+dpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JGIKzcu/mE8fxJMmQFWzWV20dsChMiSuNYFww9Tx17e8cPxncoX8GW1FYKGU2P68gH6P/o/aDoKUbFHXJTIF9sCJHqq/c6XS4q5Az6n4jRD5Ry8FvqL4TSExbHuM1JpBiFgaXWb89sHlEy8RDmbi+AFqy5X4Yf4iZ9rgaIx99Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bzdc7Ao7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOLFY3nx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bzdc7Ao7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOLFY3nx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NlkPh1231660
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 02:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXX73wHDy3wDhoXCZ7H3cw2yZLyFvFtSWJ5lStmdwDM=; b=Bzdc7Ao7GOAstmBH
	S7HFlU1yWBfnLbEY4k/ZaL+NvsGTCKgkzEZE37B8HrHk8jF7kjsFkOgUAt9Mxk64
	sI6Yh2mkHqYzuSomdl3Ha38vgSNUjtdB2wmjKYLuH9OKIfYPLB2LQUN+dDJZfKz8
	MDdJh7h3Q4gDy1d/VJsabaaqhQqd4YoLL9CKJlpH9qbUz64gisueNnVIxLU7pOlj
	ccWhCi608AC1BkgsIx+9CpkQYGTsvqB8o9JYkE4iFgUY4BISXQeLWDvwtfm5vc4P
	9cibFlMdPABs1Iv3w1YLhmbkY53GaE2+QaCJlk4hEMwEG2AWQ2Eikemov2pcsUm3
	HkF2Fw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfykdjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 02:51:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d959904658so70170005ad.2
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 19:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788835885; x=1789440685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SXX73wHDy3wDhoXCZ7H3cw2yZLyFvFtSWJ5lStmdwDM=;
        b=WOLFY3nxeaz03Wiz+L6Jo6OH0fITHngZU6Vy+wxnOPGmBMddKAdybM49epSflyM2up
         YwEpMokkuKYqbrrDqtUaehbr0ZZZXlHodVvL52Aqr44fQxWGRFHaLp3hjFNPhtoUiWlz
         MHFsIBaZ7a1vMGgdG6ifgkeGi6wo5Z1prpO6hMtpaSbt8kKutl9YJrrYtD0L8dPtXbTf
         VrpcaohyZQWngTKPBpQzVYTtEtM+TXHJ0i7ehgTnYm/S73yV4xwcAXjQ/Ve7FQJNfJBp
         lHOclsQG2l3uBNtzHQUHXJvClS1gd2Y5qwcZMU8J5M+nc05elc4TMn0tdXKTnWY2M5uV
         t9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788835885; x=1789440685;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SXX73wHDy3wDhoXCZ7H3cw2yZLyFvFtSWJ5lStmdwDM=;
        b=SwXKRIHVcawqHYHA6IwCIUoGYdQlYWQ5A0sKOK5NCmnWiaX1cU6t4npyI3XDQLmL5t
         XnYUNs/cnndzYclj8eodVGihkcpeiq9mdRCTY8DyXYUtmVSN2wx+j6AxNr5E3YFOUtke
         xYXeuiy6hckn5z9QDb0RDwGpsmo4uF1c4rFqub2nzvPVAGatT0vD0zbGTpKjUb+Oo5QE
         cOlXWvMI/Dsv+Vgh6nDSZrspcuVaTzDjpGd1Pl+qVl1GzMOqlY7tBPaqPR2LxmjvxqSm
         WLbCIwodHyBK6g3hmPeulgKNiH2Tva2gKTttKWE4hB4u6VPJi8t5hxB5scuYO6GFt0NP
         vilg==
X-Forwarded-Encrypted: i=1; AKwUvBztyS83WcE+e94iLZcBiHklU8kGN5u6bzotdp9GbfijPf+tdh9Ir/BZzqOWhYnpsp6OJMXhv8O07G1n@vger.kernel.org
X-Gm-Message-State: AFuF++keVE7TZ3XnQUa9RZWS0ye4GUSjjIHkuO7m4Ebj2W20LXCsOe/6
	hsvslFu6z0qgTDvfa+oYmM33s+2DXRVhu7FnzFi46UXAg6nhT9nkp/0bzhph5GfBTcw5TzOqdC4
	7ZtQII/W7Ap9/7NAHQ4muV7eXAx9qbuRWKWTgGfIZJbFLC2GVMRjylE0DM0puvCDo
X-Gm-Gg: AYBFou0TA6A3TLGG8kTPaRk800HafqKciPSVN9UqYk1h1it2h4tYTqVzi13I6jC051l
	hJVi1gTF8IW3gEf5ONFrqOTE3vcAZCbII6Z1f273mfbg0muaX+fRd6BmTR9yBJsAX2b3EyhaiQ+
	rh6wR2TlrzjPbdIUMAYvvxSjJy4cmTmSvAypGWAgvU3Lz1SWhv87iWx1iH373Ac1OdZ3nfhoMWA
	E8tsoTLBUDnMsOoZdoYJQ1XVT/sOmxClTVoMLAYlQ7wIFTDG3wX7sYtLhG7quoosSi0K0h5ZFVV
	93FYVvcnNEbRSgSQfHZUdrg5UGoNO3UJk+SJmrNMMuCQt3OXwV7NxbAm1Ju3g1juK3U30+g5ebH
	9yhpFcOq/ZEm/pctxHZFYsszuRQDgcEctDnOipNQpDIpLnLlykB0Rxt5mMmym0sJmUQ4Jans=
X-Received: by 2002:a17:90b:39ab:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39b261da75cmr40560628a91.21.1788835884811;
        Mon, 07 Sep 2026 19:51:24 -0700 (PDT)
X-Received: by 2002:a17:90b:39ab:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39b261da75cmr40560573a91.21.1788835884354;
        Mon, 07 Sep 2026 19:51:24 -0700 (PDT)
Received: from [10.133.33.68] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f88475sm23459473a91.1.2026.09.07.19.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 19:51:23 -0700 (PDT)
Message-ID: <062ea84e-07ee-41be-82a5-20600693a219@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 10:51:18 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
 <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
In-Reply-To: <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: m_6oBfR9XAlO0-pzGADTDfjaNCmroV16
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAyOSBTYWx0ZWRfXyq2PsFguC0yh
 T8eeHxuYtMJGwA8/wO7yFbaiCKfZvrAjskb5/P1qnNnd38coyLi8LuJ38iM6vb3Zyuv4gJewOf8
 unxIOSZEC+e5mwIqRbq4qbBa84dtJJQeaMZ6iDOKfsd9O0iITqCCReReldCC8jKZjezpiJVyXFA
 Pa3OdOTd4ywKDJgKJW95Ex0FEqJ+ohD1lRwv62G0tTQTLtqe3hIr4YL3acni93LIRPVNs9A6kUv
 IwULcCOFtwpRPVlecXG9rgYmfSYlamit3t97lapOqK7cEr6USlm8RlZF1sj2oG+xN+TZW1XM9tj
 CaL7BulfY8AF/5x5Vn2Q81fu7tQtJivZn0BwQh/ash0yH0iE6vrs820mG4Gd53V3LycrscYdXIh
 UMWCoOZiCILQEQsTlCB/cIj6r4H+dJ/UkjtU0gWkt/pFyS3pcpfsQoN6fTCvlt0WzEkcolDhWh9
 aHSfb0fkPG4pKvgZ8tQ==
X-Proofpoint-GUID: m_6oBfR9XAlO0-pzGADTDfjaNCmroV16
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAyOSBTYWx0ZWRfX78Gz8hDEGeN7
 KD33wIgKiyyXSkKlXNMb1qJLw4gT53WJoc7dDt9G7SoelytZo4+j4OcfyWKGMiNOHIlAkWt0siq
 GYr0hzXIEXGjhb9bczApVX1GeZ5i2Io=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9f782d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JBeEZWaBV44c9fYEBTwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080029


On 9/7/2026 8:03 PM, Kuldeep Singh wrote:
> Shikra is derived from Agatti and uses the same QCE integration.
> Update the QCE node to match the underlying hardware implementation by
> adjusting the fallback compatible and related properties, including
> clocks and clock-names.
>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index c1f06f692f66..30c7cabc058a 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -1075,10 +1075,12 @@ cryptobam: dma-controller@1b04000 {
>   			qcom,controlled-remotely;
>   			num-channels = <16>;
>   			qcom,num-ees = <4>;
> +			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
> +			clock-names = "bam_clk";
>   		};
>   
>   		crypto: crypto@1b3a000 {
> -			compatible = "qcom,shikra-qce", "qcom,sm8150-qce", "qcom,qce";
> +			compatible = "qcom,shikra-qce", "qcom,ipq4019-qce", "qcom,qce";
>   			reg = <0x0 0x01b3a000 0x0 0x6000>;
>   			dmas = <&cryptobam 4>, <&cryptobam 5>;
>   			dma-names = "rx", "tx";
> @@ -1089,9 +1091,8 @@ crypto: crypto@1b3a000 {
>   				 <&apps_smmu 0x96 0x0011>,
>   				 <&apps_smmu 0x98 0x0001>,
>   				 <&apps_smmu 0x9f 0x0>;
> -			interconnects = <&system_noc MASTER_CRYPTO_CORE0 0
> -					 &mc_virt SLAVE_EBI_CH0 0>;
> -			interconnect-names = "memory";
> +			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
> +			clock-names = "core";
>   		};
>   
>   		qfprom: efuse@1b44000 {
Tested-by: Wanjia Zhang <wenjia.zhang@oss.qualcomm.com> #on shikra device
