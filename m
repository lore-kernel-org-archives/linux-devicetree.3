Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED0641443B
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376423; cv=none; b=jmNGw4Ds4GIJ8VvnN8Im0mPlQ8pZa7hupjlzs44Gr18ujhE9Jnw2sVvStq+rDzM9VZk4kpb2L27gAjjX/xKr0GXBV7xpK44TlpXKLu/RiLjNFp18QkOMln8vRWVOCPET27VKUFYSUJq2Ye/wf/JGD2ePXtXHrezYGe+t6kLBR7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376423; c=relaxed/simple;
	bh=HfYWMsh73JSum1E9ZEMttJhbkhJMHsC4TIgPRRw0ArA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mbEP0VM2m+CZo+r3o1GMTuOvXxt8dbhAAS9jJTk/xKIuGdVv1SakhV3urCQ2y1Z+K9V/FBAAZDV8P+HNLlhc356pGvWf+VYfpNgNYTDwMlPgUoLGfMXr+ZBdFGixwd4YItR+Bkzp0R/Vu23y96AF+mc5nhH5xZ7JTD2dqNsRNRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYsjriPY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j869+nt+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYsjriPY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j869+nt+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8SiVf594729
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2kwaoRL5rVYo97WnK2mb3Z4axjuihRbr+REjUuDnt8=; b=kYsjriPYaxGJCaH5
	FL9ldMSdA0OecdkhiEF1wlTQWGZAr1ocSCDec0qLn2++lW5cFZwSc+Pw4CUXkITk
	IY7+xH4+ivz/rmB6XUMgAzNDZvMFNxhqqO4P1NVXJ+2ot2azOXME7yw2GDR491e4
	ly6YLMuS2YEj/EvoHPDEGaS7nGkGjflCEJ0dUmazOhnBQ4I47FbrXELySnuT9ltz
	wkm1pGLo4X+7nk7z8mzwe/QD14rGBJbhLohlQHCV2/xIzh/ljj4LbEk0Fq4CUKzV
	kDLFhp+R4NWjFSUwtpXqMV5P3SsAAJR7Mp1PQ39Nm6z+rsNasLo/AUWL8PFyGcRp
	ckxA6A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevr3gy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:00:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93495488976so52991185a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376415; x=1789981215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H2kwaoRL5rVYo97WnK2mb3Z4axjuihRbr+REjUuDnt8=;
        b=j869+nt+itXomH+E3WT3NCG2rvjy5WkhRFvL9fBTA94CYEXfzQ7SMl4GKDqTVQpiha
         hMw7bmrQpOMoWlqo9fM3YhmiqahUcB/JdkOH/fW8DvjZOy4E48tZiL48i05tE0YC1PmB
         Rz9NXLhVumzbAFf+sJFEph+2OnomSXkfVs4bg+e4ks/POIN6/NLfn+mjxyxZ1nplEQba
         Y6QSvb+esZtKZ7sshR2dn0M7ui94eG1SoTEP5j8jc1/K4Ak4KTDafnnD9zTF4KxB3SP0
         ecKwNT7ersv4wdVwwKqj/NzpH1Vk+hJyT2sg1ZK2NPuW11G0C6RRtgBN2aW5g0o69yi+
         he0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376415; x=1789981215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2kwaoRL5rVYo97WnK2mb3Z4axjuihRbr+REjUuDnt8=;
        b=KVNE6YAUTNQtRfx3jnoFPmbooFZP2tBHsYlTu+69B5D+agSXXYXfYo4FthHlhTD6g/
         y0yiCPcAUWYPG4NYq5c8wgVFtGuzXovFHwkEzrcShuFWO5waynxo3GWwwef8DVWJz+L4
         8Dls7UF6YPJMFuG9vkhy6hMTvV5bCfNWwjLf0UIc+GBgX4E5HurrzknM8ee2pGzbVm/u
         r2uxV+1zD57sjE8iQq5aBrdI9X3DPCeYOGIlox4OnbaFgUI7X9hJ0g8AKui7UDCZllNo
         2T/IZIn6qoj1DAonSz46w6SdJNqUFtK08gar/mm73vE6go6ZkIxhiZXEyGa6eW9lEEw2
         6N6A==
X-Forwarded-Encrypted: i=1; AKwUvBxKj3ftlATMaFqZHHPr32tFpcdFLSiSeHgLBYPfIN9d0y4cuDI29+JpnITey+okYe654u2jFpKkFkW9@vger.kernel.org
X-Gm-Message-State: AFuF++lQkviP165wHgORz1TYmSQpVwdvgO3GC3wTo2vWeklqzxPmLwOH
	QUqhgCVwZ5kN4xyUOz6zX3unQdBoiWthG+wm5iKUV4AfjL6z8pYCFeifICf8tHOLLjVKau+sVKw
	HMVYy7Y5lfta5dLnqpHT4UGQokqdl1Zn9xaLQGea4TYLLVJgJAg3nt5ZKHKnVQrsZ
X-Gm-Gg: AYBFou3i9xhmZ17CZSyTh51vFF3cudfVWsnxZ7Q9oXzQzQD/9q1gDEmetfZ8F8VW3o2
	STeUkZgneaBbEZldLG3FbiNmQAZ3oPtQnSJMHMorCWXulI5wXUsPOFA8LJ2ELg77bXRgpMtHPmY
	3Bqv8fHUibVJNwJ72AbDGDGtrcYldDVfsxVVboqDZcWnIhgEqhHVDfevH75rGrxPUMMeXM+SlVi
	T07iRWiVoInNkm0yGRx9aqcs9EX6/Pwuqd4tvaKOKz3EGaQiBhDG3AfJ7Szy7uFAQneZOXQDOPF
	2SRKNxm3LvqMVBv8AVDUlg+As23VndDlTecvQuZh8PAGznGWSxQw0Fnqn98ic5pzJ++vA764Hm6
	RLhHQTjOyJ4M52en4m4ETQQ==
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr179416085a.5.1789376415159;
        Mon, 14 Sep 2026 02:00:15 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:94c4:b799 with SMTP id af79cd13be357-93a29cc315fmr179409185a.5.1789376414497;
        Mon, 14 Sep 2026 02:00:14 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966066b75sm397728866b.29.2026.09.14.02.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 02:00:13 -0700 (PDT)
Message-ID: <376996a2-358e-439f-8461-1981c43df671@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:00:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: nord: Add gpr node
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914024003.120931-1-shengchao.guo@oss.qualcomm.com>
 <20260914024003.120931-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914024003.120931-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CsKskECxEILp6HpG_9gpIz5oqRPmnZ9M
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyOCBTYWx0ZWRfX5bOG+X4LQtvB
 58e4hZRX+67EYy58JZZ7e5n0aADCdw4/nPlZekSUwYwZUnrOyOkmc6dM2d8VwtlLwyzFgHjVi6j
 8ba2gX4HmI9DOYF9V7BS7rX8enmLxFU=
X-Proofpoint-GUID: CsKskECxEILp6HpG_9gpIz5oqRPmnZ9M
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7b79f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=CE-yOWVe1Lv3fcLDAawA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyOCBTYWx0ZWRfX16MwjnE9yD2G
 NoBS8Ih/cqTSjmL9DCUCsV6oY3E+13PBcFKBHCGZcRV2NlfiQrB7Y6ambTkJnhTp7CShILpi9xG
 bWdElFAH6NR07J6nZbM0m/NSxIYMMaXCgQ8GQe7SMpBbkmCEkfT3Z9f6AKuFh2+aDB+nq0i/BaK
 apmkVmP2pf3uB+fOfvIZAzYr7UwqnNh0WBvax9Ag/ASnpwcRIUzKqQ9MXzNyWnr8ps6hT9npsYJ
 hIU/dw4RlFe1/vwgQYjaI5k5BQQBJt/IACRhFIT/PEf2B+03aqp93W7tHGjtsXZdz9mmU+WeZu8
 kpdbOcak4BZkj8LwB3sqZoWyEnELnra37LFPynHMnHqs/m4WU3xta3ncD0NTYgVJZxhDZZAaB0l
 Nd1OfIG47fKS0f1RtzUNezEXHbjbAYEIOAkaS0oDJV/rtsQJ1puk4HvsLHBgGjVguDgkh9ujURU
 lvrSNjFEAA2+AeHb90Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140128

On 9/14/26 4:40 AM, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add the GPR (Generic Packet Router) node to the nord SoC DTSI along
> with the APM (Audio Process Manager) and PRM (Proxy Resource Manager)
> audio services. These nodes are required by the Q6APM audio stack to
> route audio packets between the application processor and the DSP.

[...]

> +				gpr {
> +					compatible = "qcom,gpr";
> +					qcom,glink-channels = "adsp_apps";
> +					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> +					qcom,intents = <512 20>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					q6apm: service@1 {
> +						compatible = "qcom,q6apm";
> +						reg = <GPR_APM_MODULE_IID>;
> +						#sound-dai-cells = <0>;
> +
> +						q6apmbedai: bedais {
> +							compatible = "qcom,q6apm-lpass-dais";
> +							#sound-dai-cells = <1>;
> +						};
> +
> +						q6apmdai: dais {
> +							compatible = "qcom,q6apm-dais";
> +							iommus = <&apps_smmu_0 0x09E1 0x0400>;

Please consistently use lowercase hex

Konrad
