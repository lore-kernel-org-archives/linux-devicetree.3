Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898993ACA5F
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395015; cv=none; b=KlGKp+5G9FpdvUAsg2Iu9LpRukRKPdFAevFfa2Ew5vBHm2EUZVEnivl5InjFLZJJHfpbcekp9musvEvxU4U4U6F6BUNS4cEsgqbOrnMAlGh1Gs/u618P3pK/QWDTKFB5hBlzTyy0/CCmtKWr9ozVVufJPnUQqWUd7Jbmp34dt5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395015; c=relaxed/simple;
	bh=G3NamduHy9LjRWPDnNrXLCYeu2wlpG74gsLOfOvCg6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bM9aY3LyqYrd5zMJ8IdFuWuHA/ZGtnarhQ1yHwcek/YoijSIjdXhAL8fBDmr9pZI/HN0u3G/3vwxE66FeeNziGaQo4jlW+5v6YVxao8iSJjW/ighmRyNPburyO+TEH5TBxFQLqIfTAPNb95xtYht39f73gZ4qKoRmMXOMWJd26g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZqk5gYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TafEGr62; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZqk5gYk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TafEGr62"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Yix830691
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0dESWhJtwJ1B8Cji2yPp7F/P3j8Dn+EL1xmVdDBmUgU=; b=SZqk5gYk539fJVBk
	0iuYGl6Hah0hZ3CVAwTO9KhYpoX49iXXrnMm2wW4iT6NPO6iSMCyNyNsjzuVjHjn
	j4W/NA3LG5eZ7TFWuwasSDC+azfxjsvGPn9K5g1Z3nYPwjq6pKWT5atnNfuUf0vp
	zeBwSZI456Yohbi/a1wGm3Qg8UobzGXthbzxBfvenoyM/5uyP88wjVtnqN7OMFsH
	j9WpXyQYgBR+DN73f1V12vnHYbchsyWElwV6CLCd5G8RtxbDZnfxnMq6wkEMIgyn
	wQef/Crp4VsRXJoXRVMHy5yLJTJqfnAgFgQYzu29V8nDePW22+bgkOsc3BzQZWdT
	bvV8jQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstsup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:10:10 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82b8e1ec4so71245e0c.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789395009; x=1789999809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0dESWhJtwJ1B8Cji2yPp7F/P3j8Dn+EL1xmVdDBmUgU=;
        b=TafEGr62lFhkUO7o2mANMLPP1KCUcRCWKbHmpgRDaXPx/q89SePv7xJRjDj1JOviQA
         KsWRnYCXXwf460xB/yyGcHBB4m4mrzsAszqBwjXu5HFFmpytCs2qKpnhxMgWfcMwVw9O
         +Hc2h6Rw9KnyjfTvnMMVXGeBdZDRLAxBbI+DGkzHrvgsuC9EujAo0KBvJWE12zVaDdx0
         4A9VvtzoEGaEiBb7e37UVUvK6nyNAfknAu3tv2/AeRKB3GG+84AJ+ZpDwZiex7R+tbrp
         RaPMC8O+FXH7UUHPeO206LU2S3cQRk+utg5qX9Ti0YGSfQoFR1w9o2NWcyd8AzqJAUGd
         zbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395009; x=1789999809;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0dESWhJtwJ1B8Cji2yPp7F/P3j8Dn+EL1xmVdDBmUgU=;
        b=ggrebxNEQqNZKVh8sIu9iFBAFGJ0ucVba3gjRK7FFtLhieqSaGzPzcxJum8JZrb6s3
         eTYhIcGXgzT9KZKLFUvGSlz/YBP7obCCfgMhGdMteZcrrdNphZNsCoarpgZnVr4XCZk7
         A44vlngRlxMMswYzTOSsi7zbf6gXxqT84J8okCJQ0X3YGc05B9bfLB4237NJde44U5QQ
         1iS3ekPV3HfZ8jkkSQaY8rjUPUDXo0FCGBXbuRBpX9TQuVFRYpFLxjLx3ldqPS4i/yz8
         iQlFkz2ABMa8gMjWqYbQ+L9vCe3+MLoedpqmGCty82vhRJbsan30S5QVYmVQfWPWXAkN
         F14Q==
X-Forwarded-Encrypted: i=1; AKwUvByosRDNdHApUSWFucAjpSzqZBoSXg9lB8drjy1v/4PiDlTZR03iAJ7iAGPILBMXUvgsIpCzA8lDcyaO@vger.kernel.org
X-Gm-Message-State: AFuF++k8mzReAUtmAHy9DTuZj9i2nSNcoL5RkMkn7mXI1UoeSQL0Gw3X
	CkUiEX2HYrVTpOr6DTsd6008XjNX3fusNTNB0m5vuN7JKtkEYeOb+OVvV7hHCvOFlST0t3oS9QA
	1DnRNbwBCQJ67YnQjyiPEgk52/TyIUPMq+IIoO6P69InP4ihPVR583YWUt7o5rWiS
X-Gm-Gg: AYBFou03fsR5iNNUqpR9fyXgMFZKJ9Teh0qvRgSZGjf78miJNATYsC1xGrUGDfAUpRr
	EwXt7iHkQbdYpBKkEKvK9g563wgbg8KRHg7GiNhxqbs2WOlwq+vFSY2fByynJRvRw8n2ssVl/da
	VR3Za/BSMyAEQU87OdMWkP/e4NPHHWZw0C5oZoSHax/pCWhzsQf0+uZFq0C54WYXQ77vTJLoy4j
	9murxQuh0qJlDgwbjyypxAViA7Ue/DoVDv8H2Rnif4bdmw8ammCZnJqCo+/48k9N7W9FjOC3VWz
	WqY7IRODVOy4aaCocNb/+9VZ14elipfWSB+unkOqmVzlNbE4nCQ4XQJq9PK83g+hnP82iN354ku
	tGpI+pIzqjsEMTDelv+KlGA==
X-Received: by 2002:a05:6122:6b8a:10b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c981880ad0mr550785e0c.0.1789395009359;
        Mon, 14 Sep 2026 07:10:09 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8a:10b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c981880ad0mr550685e0c.0.1789395008214;
        Mon, 14 Sep 2026 07:10:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5960c17sm4318072a12.27.2026.09.14.07.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 07:10:06 -0700 (PDT)
Message-ID: <1e303381-9f3f-481d-bd4b-9424942b5932@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 16:10:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: glymur: Add CAMSS and CSIPHY nodes
 for Glymur
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
 <20260907-glymur_camss_dts-v1-1-6c2ced5ea5f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss_dts-v1-1-6c2ced5ea5f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwMyBTYWx0ZWRfX9NZhg08vtasl
 lmMCL55jVcYiLmyflbDr1yGrRFC1q1d0onBOwbphcbTq1664pyLSJ58lq31Mq8dqUX7McIqWqEa
 7Tv5R+cHM9hGm0gbl933DO87ra4Bi9fBwHhqsG5KkC3/hOYWwB3dYu+CrPYttUwrYkllw3UFzv1
 gYFYcLGkCFrRN7V4AxVLBxYoki9SBSQnhxoPMoX2Ie/sVQGV4uPTO6g+1iCkyLgSOKbmn+V9lPe
 Kn7a/XcbANmXJZ5WzaiDMdq/bC5zpGlrukH9W1U03W1DN4oePi9x+H1er5y6m0ypKAZl4It4Pqa
 CJlGc9Jlvnp+C9Xitb2T3tEVHyMkkHf0sY8k2cRzf0EQT3nWU7JTbK0YxWqXkri3+6JKPE0Uf8F
 KW5aNvskHzp5fsfF0deVsPrhyN5tjPBwJLSKDDBITfw6xWy8wMMK22sZGsdxODuRTJ8f1eCpN1i
 MIpZfquDAz8Toz3Uw5g==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa80042 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TmAJPP8FuOU3jFEyuIoA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: ZFqr3nIQ3M0NRFK02hZ913tTi7KA8-ZH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwMyBTYWx0ZWRfXyMG2Z/f4dh5w
 9Hjxrz+J9yoQntmMPw0toh2oFPat0GFiiKFWmVgbwGHsTGLUFPjWtFjcGkgZuFZWmxrjoydhrcv
 4N7EDNc/fuiRa0mBgZsAWocg5gBdEIw=
X-Proofpoint-ORIG-GUID: ZFqr3nIQ3M0NRFK02hZ913tTi7KA8-ZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140203

On 9/7/26 12:07 PM, Nihal Kumar Gupta wrote:
> Glymur shares the same IP as X1E80100, with three CSIPHYs that use
> the new standalone PHY API. Compared to X1E80100, csiphy2 is absent
> on Glymur.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

[...]

> +	csiphy_mxc_opp_table: opp-table-mxc {
> +		compatible = "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
> +			required-opps = <&rpmhpd_opp_low_svs_d1>,
> +					<&rpmhpd_opp_low_svs_d1>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-480000000 {
> +			opp-hz = /bits/ 64 <480000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +		};
> +	};
> +
> +	csiphy_mxa_opp_table: opp-table-mxa {

Nodes without a unit address should be sorted alphabetically

[...]

> +		camss: isp@acb6000 {

This needs to be sorted based on the address (it currently seems
sorted, but is off by a zero)

[...]

> +		csiphy0: phy@ace4000 {
> +			compatible = "qcom,glymur-csi2-phy", "qcom,x1e80100-csi2-phy";
> +			reg = <0x0 0x0ace4000 0x0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			operating-points-v2 = <&csiphy_mxc_opp_table>;

nit: please move operating-points-v2 to before status

otherwise

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Zenbook A16

Konrad
