Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD59C3A3E73
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 11:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775562100; cv=none; b=gEqY81LVhJmYAgFsFnteOmFeqrmfHaVj2jWefT9KMBt4CMH02O0z6lOeJSVJwx9b48UKlzXdiCFobNqQU5ersYQCKQZvfrwuyXP2APUrw//bH/7AGAgrEUpDH5N4p4he4MQwnnkq+VG6+IjF4hU5wMrQvw3FU3eS2FiCVoFT5Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775562100; c=relaxed/simple;
	bh=KfFwVmD/+DRHV1yhUV++VONoQQRwDN/eMXQTswkMROs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pqrTAc8ZNdBzUZXQGHE0nZOxwIAq+gAgamcpqMHK65Cja+kGP5+HQmaPK6j7Pea1pD2lheKilcY8PEGWSgOVNMAu7SzfB5vLAOKl6I4eO7puNxybxN6SqoJ/MRYws6ElsbWFppHxXyk4PCQBxrbf27/40Q94YD7GltxvBOox1yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmNvdwTM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SMh8jYDE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmNvdwTM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SMh8jYDE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376vWYk1403540
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 11:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lf+Ywg2srIxXPZ7iig9OairiEFnv9txmyLal9ilQAMM=; b=cmNvdwTMOSIVsA6V
	AxiQ7nYXlwyBNSpRUfWA27tWi3OGOsezsSp6BsQmbSyQF8cyAAM71EaGSWtqXzEf
	7gZmzf8YplIZBV7XDejCHyCHZRsNdQTd6bNnf6n/CUy8DZcojILbfd5AbyW8yRx6
	QnKPZ30lLoym+hOdN+O9GnplYZKq1R4x9KhihnDE7d6h9bMBSQ40crITy56hEcX/
	rfrbQEtzHbOmcsebbvd7aa4mG3KGDEsyZNWMlznDD4l0IPElud7Ln/6VDbHjexHm
	H25neNLhRhbJ98mzabS+Q9iZaiHF25bOBKoN1DuuXzwidQVd7F8GxodM/22hXBEv
	/cDiiA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8ahkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 11:41:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a016b99579so21878236d6.0
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 04:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775562097; x=1776166897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lf+Ywg2srIxXPZ7iig9OairiEFnv9txmyLal9ilQAMM=;
        b=SMh8jYDESsWx7IVFYJMq4FXrUS5/TgKODghahNFPPe329vsv7dJlnLlSkx1hSykf+I
         yhm878GCqAbx13/hhMh735BcwVj//nfc186pIyS46LefEhLtW2ya5xHJlr5icnqVCtbE
         p97frNhMD2heGLuOD9PpH9UeAYELQFwFY94CU6XnPpNmg7hNft396u72lOAdeDWxcWna
         ZFlEC26XlpiU/E8p9tgBbKDnHuzT4YvxihyHBxAZk2IFDqytB+tHFzTGJ7yY9vOoRCf6
         iG984HcXkpnEg/afabRoFuj/G2mPXS3N+SRvmoo6rJcUpDydt1ovIQHJstW7rRw3EmGL
         lj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775562097; x=1776166897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lf+Ywg2srIxXPZ7iig9OairiEFnv9txmyLal9ilQAMM=;
        b=X0lGfvfOAoFB4aZu1CEbzgTDwpqjPiiosLOEtf+UsT3IsUd3tbY2KoL/fJKu0e9ZYN
         n8qgHqhzoPGrEKD7tTBY3/rfGi3ECLc8bfQ8LacC2W5GQr7ld1JOyIdBzwaUvX3V+VPr
         HlJ9FjpQLSNzKd76g2nScCXp9gZBST3WdyqXH4+AkRmSPdLNdRAEKCR2shK1CfDwf4Vb
         9nmoRgatM3+3a0tqbmTeooysqQew1y4SouzzKybL7ed+BrtQFqsMYrQZBBifc1UsnKxa
         /K0Lgty30Mi2kFEMC4SWDR5fMLRBgEX7ha4rt0VjIgQfGTrnMrsG6lZacTr1D2e7Tdg9
         nsMw==
X-Forwarded-Encrypted: i=1; AJvYcCVKhrF679gaj0zM14PXcaujm5s6bQBnf2nWUaw7KA6Pj920o6IZ1/WL0yWQXho0dlkC2YNJN4RR3ut3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz22QKWPp9aZ79ShR4T5AFXx4eMgEQVYH7VWYavYkkStMJF/CMP
	iKstu4mZt3sJKF7S6q43alV+htx1/rf+Ay7Uq99Ko6e4Wr2bUSjl0EOokICYM0dMeXXxKaLhPaM
	uAkhgbNL3hmCGkVhF8rK7KrUFAdm3XGoq+kqdN/B+dCCdaja+GeQtAk24hpSaQBz8
X-Gm-Gg: AeBDieu427KhtayYVkmC4pO+Bdn+p9lnSezaS1TCiT2LwNN+3e0ig3HBm+4SULBy9Wb
	N+UrBa3Cu9XO93IHc4tDqf9pGm/u1oYlmd7mLropnhZ2mAGnCkBhEusfSrvge1E1ARJJkuHwDmy
	LBTJVlSdN9TcWsV9kGa/paDT7cpps443DFBofjcFlm0dXsQGQS84UsDJu/wDzEDE8jX7vbOk6r6
	E8/fcYlCkn0yyp9/Y55WbXTPj5o0eILihbQEycx6IDs/D/VUywwGszHjey+Rh9ZTP0RWbCKS/Z2
	cRIz+ns6teWanOgC0mp7uNIuaJhYMtBH93Qfn5UcAEMaf5VC36W+jHpF6g7HEPrZI27IhFcYhzr
	MEmW6Io0M0Tf+xYk50wJELiR9gxZiQjRNrDql4d72uUyNjSngHdlZ5DTvkmPptCwKlhq/0oF3TF
	O+Db8=
X-Received: by 2002:a05:6214:d4a:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-8a7023b5ce4mr195898046d6.1.1775562097282;
        Tue, 07 Apr 2026 04:41:37 -0700 (PDT)
X-Received: by 2002:a05:6214:d4a:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-8a7023b5ce4mr195897746d6.1.1775562096834;
        Tue, 07 Apr 2026 04:41:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff17basm549986366b.50.2026.04.07.04.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:41:35 -0700 (PDT)
Message-ID: <238b23bf-a180-4dfc-a896-955b1559bee7@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:41:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Add remoteproc PAS loader for SoCCP on Glymur DT
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-glymur-soccp-v3-1-f0e8d57f11ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 048hBOphT3QbDjoZDYZZzEv_ewrPGoee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwOSBTYWx0ZWRfXwA/kbjJ8WUud
 c0YF97ZE/K4KaVwruO4h0522/GQPt+TZOdHfmBpPFEkxrZ/yOiBlCQWk6/DZyT/dyW78GtUtpMe
 //xoLKTwDXFl6K16zpcpETxaWkFSs+LrPYuQ9zzLy4p5Poe7q0E/NwJvxSZUVZwncgxH+AZI22J
 TByb40ui3OY1UsasYLtXrRxyEvVb4kIK2EuHWxRK1ODIrntSVW22QzYVINPBQzlhDCBcuaO68jb
 QBWws7HkZIJdNZiGhI6y+4PEUiiCXMXipWUxGEel3rOB2iwk13/ksPtETOdnjZadKX/efvj0ej4
 El55adTYeO1/HmJunvQhwjxmufLPX8gGgVGxMpW1F5wyow3GtqServiDPWh4n8xu3Xw95gut88U
 CtVnBbzCoDt3iixwVM0XGSODtU/8RHNKWinYjo4odAg7iGS9qQUM309YZNz9MNUgXu5s8rfXo4z
 poj6Vpp46VgLx1hjmTg==
X-Proofpoint-GUID: 048hBOphT3QbDjoZDYZZzEv_ewrPGoee
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d4ed71 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5n-PmyvWcR_NXkHpHqYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070109

On 4/3/26 1:39 PM, Ananthu C V wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---

[...]

> +		remoteproc_soccp: remoteproc-soccp@d00000 {

remoteproc-soccp@ ->remoteproc@

> +			compatible = "qcom,glymur-soccp-pas", "qcom,kaanapali-soccp-pas";
> +			reg = <0x0 0x00d00000 0x0 0x200000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
> +					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> +					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog",
> +					  "fatal",
> +					  "ready",
> +					  "handover",
> +					  "stop-ack",
> +					  "pong";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "xo";
> +
> +			power-domains = <&rpmhpd RPMHPD_CX>,
> +					<&rpmhpd RPMHPD_MX>;
> +			power-domain-names = "cx",
> +					     "mx";
> +
> +			memory-region = <&soccp_mem>,
> +					<&soccpdtb_mem>;
> +
> +			qcom,smem-states = <&soccp_smp2p_out 0>,
> +					   <&soccp_smp2p_out 8>;
> +			qcom,smem-state-names = "stop",
> +						"ping";
> +
> +			status = "disabled";

Let's drop this line, no one should desire to run a system without SoCCP

> +
> +			glink-edge {
> +				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
> +							     IPCC_MPROC_SIGNAL_GLINK_QMP
> +							     IRQ_TYPE_EDGE_RISING>;
> +				mboxes = <&ipcc IPCC_MPROC_SOCCP
> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +				qcom,remote-pid = <19>;
> +				label = "soccp";
> +
> +			};

Stray \n above

Konrad
