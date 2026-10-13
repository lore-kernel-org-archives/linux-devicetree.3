Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837FE2F7EE6
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881870; cv=none; b=msf4CpgCv/wlwlLO1TplCVVg1nkGcfmid9lNLRT4qaUUV8TyxclgyShh2pTbibTAaxKdp7lMkYDCbGVsPT3xszmSWmKzYObXnjug9d/x305LCOv34NhQH5o8Tpbov3o1Udmk59qlzanKyWvdM3k9cfAw7NM4/ZreD3UUUrenLnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881870; c=relaxed/simple;
	bh=QnXMdDj8LNbLkg/lz2HpZlfGCPVar7BxEAf5wydzd0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MqGOc5prX7HW5oXz6VrY0dwhLap5aKLVAwrl9a5mzcs58lG60sGXxC9fMs8+/7ljSkpU/ucz9s/8FGQDtBQTqqS2LfzBx76b/XC65CrUU9t6qId7wHWw2qjk2gAn5jMxkjnSUhG/ieJ9V3oQ7X7VbKE8qwHigW9fg9fkby9vgP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PqTICYrM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fp7kRU4u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PqTICYrM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fp7kRU4u"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D3xKIO3476152
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ge/JV6VZM4mnb+spmEIfQA7e/XZTfZ5TGiGtpW/m7oo=; b=PqTICYrMjyfSv37G
	zNyPV7zmB5FKKpDnrpcJd3YWtlKcASmC+skV/SQKB+XXQnmpCaXKkJz9eQtECPIw
	+tufG27EN9ADrUHt8kDxwmleT+KoHnDKrEFrrIMOE8yeqM1gKtkIWTbJxDddhQAR
	TJxgHQfKigHndmm/t2oKxGKJUwSEK01qrhIs/uveCRacox4KF5VMo8ljg/p6GVPI
	LyaAX627F1/llVtzxR7++CM7fSq3+RoXJubjjwKVHHA/6BhxdMDYPQAhUMZjvNu9
	ZFdeFixIpOno+JLMDpJRBA8oVgIweRncV2APnNDU7iJQBR/F8ht44eS1loG95nTp
	FpMPwg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j94fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:57:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc19d8e59so23088585a.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 01:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881863; x=1792486663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ge/JV6VZM4mnb+spmEIfQA7e/XZTfZ5TGiGtpW/m7oo=;
        b=Fp7kRU4u8QHGoZBPqi8Uv9GWLS/WIwft+oF+K2NOjKShp7KMn7GXG4z3hfw4gff3DH
         cHnUTh5c3j6sNoA1yRS0TApQGK17woeWTmC1k7YmbyrJu30SRUoPWZSDnMrICbvzeHtN
         Lz/b0/V21t+yFlWn6/ZtXEaczLMpup+j0Z2QKFCWokDamAAjoaaN6jZpEbO40PvJ+xdu
         FuI/aVx4ikFWa5m0mseKgM0amZmGykxk/XtJ455mUGwYehJPE6jT+7hZoT68re3lObBJ
         9bc0ULrehyrxvybEDORv7vg/F0DsdqA4I6GGE6mJi80ci5Em94Ttn6Vq4mLzTXNID57j
         LWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881863; x=1792486663;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ge/JV6VZM4mnb+spmEIfQA7e/XZTfZ5TGiGtpW/m7oo=;
        b=ba3ZNM1eoQDIclC6hV/jKUJqhYOsslalVGztGF3u/tN0pL82kZuVCe1mZN4TWSQmWK
         HHUu4fh+X+sBS7W6qMrPe6FwpNv10Rj6zMxoaPEdPhxnJBIE9mTSgs+PjJ8pVSvrbFvc
         Hz3ZHr/Kmp0ITdAy2xkyUfMceDpXCz/JmV7fOMoZ2jiYyB/KmytdKkBmsm8VKW+68crR
         Kq+LFjHkmFeTEhYgrtQjcjPogDR0lUBgM7GYV8nJ/eaRSPTauqThDAfZzxjpuzHRxUJm
         r56j6Qeigeb+JXsvNGoA3lywnnr4Q7I4Pe23eHYS/7iBQx6tq+EA1LamEuDIQf9/DPGQ
         UYvg==
X-Forwarded-Encrypted: i=1; AKwUvBwe2C8xW75bujQxWoGL664iSMCtreSSgG9Gsq8rL7UH1q9Tkrpsmaq8CHdTIqQTp1pk2l+uaqBnIwkm@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0ijXFWuYGr68AwlgrXh8KzAXytxuk1heFb80ohu6Wpaa+fpUf
	9zgfvE8Ss2luQ4oO3Q6qVXggVwWX+ooDZ3oXSITUYY3MlU2KxIbiOT7iB948yYHEGCAZnWqPcdf
	S0OzFMDndQa9u4lHjuAiFqCsV7ENNAiPa7GVzpDR5DSfejeciNomVbc9aYmAGZF/Z
X-Gm-Gg: AYBFou2I2Q1AO2DD8Fn/3yjDr4K1u/wfZmERRKcMCJA//x/5y8irssOb5am4kaQW9HU
	GSdj47FNSm7H8nXvwvZxHoc4EikmmEI3YhGFJs2YIzHpbViIkFZqUyQcWZgovo38qbtyQmSIwzI
	wouZghRn9Sg7SexpjMHMtP3Yg0mjhf53XJAv1X0+n581Nf96shHEtmcrego8wCfMb2jpW5phR9s
	rRKhWtklHZVJMrHu9XgIZGh3jiNfUY7yL3BOl/liRpjJCzq7JNKLLYt5DpjxaiS/enZVGthRswu
	1NgE6DkhU8jk8nBsarKG2Vf4BQGfq/wuo9yPhu2AA8BS/YKUEB/32ZGUT8+BUOWV3z6AEHq+QWk
	RsyXXCuZLHpRGz/p9zsKKzw==
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr2009746585a.5.1791881862788;
        Tue, 13 Oct 2026 01:57:42 -0700 (PDT)
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr2009743385a.5.1791881862288;
        Tue, 13 Oct 2026 01:57:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1c1d9fc0esm2420488a12.4.2026.10.13.01.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:57:41 -0700 (PDT)
Message-ID: <77e47222-e633-4d38-b598-8a02921a5d17@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:57:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support for
 SOCCP on Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-soccp_driver_dtbinding-v1-2-40862f7fc58b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fWRuj3OG2styeqfeL6LdmyjURHv-Rjk5
X-Proofpoint-ORIG-GUID: fWRuj3OG2styeqfeL6LdmyjURHv-Rjk5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX3IGx6wSXocQX
 txDOTi2b4W0p1zABMsZAYj6/vcOBQkPLPF+6j5SEslxkQZwYGB6LX4B9TLp/mjW3aK7JNeI6vgi
 F+ivGrdr5gelau0CUYiq9uaBG2Mnc60=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX0WhPZdzXm7bp
 WSqHHBJxGz0oY9y6H+lFWMK7DPrs5DHMvaI4TTHAXqW6pP3Az5ben9vLcsuio4JlegmzrJuANqG
 6AOzqGD7aha8imR84upxOIoWGXB2swSwh91c6Ug5g4Cb0VygGlXmVZSh5fZGgaj8nmNBSlvl1fn
 qdCQ3W0OySuBbLFPARM+2svNuvvVSBw2wx8t/UPBR2OnfVr7PofWBPWfr8pN50FgRb6KsLZ/lHG
 /ZcWy8w/fowTk8E6GMqoEUa3AJU+QP2ycP/FQA4XeN+YVOH4icNhXwVigbI4G9ka6hEujxNfzSM
 bXZsWVtBk+8N5AfPI5BbSV8J3jg45AkxDdSlWsihGYUN8PMfyDBqq73SUjm3VmQ7khqZ3qtCH0G
 DTc7qKxR5qFeu6wTEXpscBDjiDbzrOiSMwAjLLWqIKcimZPrORqzxpzv81XHzq+zQRkrXbYIgtt
 +6j9Nq0DOmzexHdxqxQ==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6acdf28c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pQmoqa-UAMS7fspmYOgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130035

On 10/9/26 9:35 AM, Anurag Pateriya wrote:
> The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
> USB Type-C, battery charging and various other functions on Qualcomm SoCs.

But that's not what it does on this SoC.

> It provides a solution for control-plane processing, reducing per-subsystem
> microcontroller reinvention. Add support for SoCCP PAS loader on Nord
> platform
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index a005546c265d..6fa958044218 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1545,6 +1545,20 @@ static const struct qcom_pas_data nord_cdsp3_resource = {
>  	.smem_host_id = 197,
>  };
>  
> +static const struct qcom_pas_data nord_soccp_resource = {
> +	.crash_reason_smem = 656,
> +	.firmware_name = "soccp.mbn",
> +	.pas_id = 51,
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name = "soccp",
> +	.sysmon_name = "soccp",
> +	.auto_boot = true,

No DTB?

Konrad
