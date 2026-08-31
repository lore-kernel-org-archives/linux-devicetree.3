Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09773AC0D9
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 04:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788150605; cv=none; b=JJV/qUO0xKp08SFcfmRpzgnSSwxSiNMe2DLtnNH7298YyHmooJrUAoaZzcKpkSUJ3ZDOZsv4im6MYiB+Flwe8wQLuUKnxawKCZNTgQzYb/Juq3U0qtby+Nuj/hQYowIXR8ASZ7jscie3crW7jU8/Y87O6ldp6km392RgiUZkbkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788150605; c=relaxed/simple;
	bh=G47t1WaiZyuxFvj5UD6cxbPfeaZsmxcFBeayYkSs0dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ek1TxxbpsMhb3xwQX9xEkgPsowmSOwBelEhaYW+qtdnlnWf8dhIb56yugbSc6IJIgzaL9vNaRz/+hMNWL45SZ5S8/l0NTnlbxAmrHgHWRjO5tKwlO/J0eH7FFs8f8J/P2S81B5gIdZeD2k2/8yZrNAgj7pROuJ+1H490n07H3uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdFGgYk7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EcFAs19r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdFGgYk7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EcFAs19r"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1baZC2587007
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 04:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YPc6BHHIqrzDqrM+olKgR158+qFYNt8PhUYmPCgHuXs=; b=RdFGgYk7tlYg43GI
	tzqP8l6MzG7drd1R+bdSfCFCsjDWjxQxSCCOosSqsaE89awZ7LquOXQoFela2pV/
	3GGXTJ1IWBbTjvY6gWYq9KRvQml8cXK2VybJZOGrLebjV0DJZaPzNU48YXF2SHa8
	OwnQl5poxsMJx6h0hcsOUkBLYvIqBW073kWY3rdVP8OWzZDXy8mC8dP8cWNbVH/a
	LTo92+IJX0UuMR7HIZzbJ6FoV4mL0c4sbVHMkp9MlOjfeD5NnV/iUerfyjc48Ywq
	D/khoJT+DEJKLm/xkewZl+RZeVdlU+F+arl7RSmyZVsyaSGTXKVCODvCpJMMmELS
	LOyTIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdvmh8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 04:30:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so4509532a91.0
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788150600; x=1788755400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YPc6BHHIqrzDqrM+olKgR158+qFYNt8PhUYmPCgHuXs=;
        b=EcFAs19rWhrjyRWOfgz15CgAK/BSambO1J2xZf/Mrc9UuGxKJKQt7Zy1gQV/tDB0in
         a6Q4AgguvIva65vuRO00t1ZEPJsjz4XzXFeFQfbOxblRNyq08mk5xsnnFhe6kka12cos
         UaI9Vt5x3ZcHgSP2DbesJLkFjcz4d+93tLx++uW7Y662Q4hpp8RK/wWdXSuGOFsTMEnr
         D2+LVbv98kLnF81BRgaalzo0H3OcsrukXqhd4JE6znSScDeUxtM1w/Cxrkj3b5N12a4O
         3fg2qUaL0TH1s2HIjHQ23gtip/fkl3OPQYmOLBKAQF8CD9cQlWnEAZTdz/6z4K7+6L7D
         7YMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788150600; x=1788755400;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPc6BHHIqrzDqrM+olKgR158+qFYNt8PhUYmPCgHuXs=;
        b=kCGuS/a3pVCqYrZqXq3T8DDCmqnRsUqxw3EXer2tOjqZ3OXw8B3rCx2+rKiWcY50ET
         8CkTohpIIg0k1TsE9d53FhhgfyRYByvGypeEvbJnYVDhFfFcTxxkFtPM7fJ10Rw8wM6B
         E+8GYTDi7sKXyXJaAn8gjCe3B0w86dJ8vLcnbB8QfJ5yy9Fn0uAyP0vAAIHKu7s1rGp/
         vWxW5usZpA+p7Y9cMHWy/2wKXHCegn984S9zapk7sjLsgj2ExKBlQ8Evuywx8Z8hxnvS
         VJRvTfDKbkhSZKnBJAzxwqLBXZYZMR2N5YIrpnsRp7+QCdH/oSFDiLCQ5pkyrmkKrtvb
         ldtg==
X-Forwarded-Encrypted: i=1; AKwUvBxuTExFUc4WTWrWIwBteTy+6XVVnKkKKhVweI+fcyDC27FYbPX3floXu0vhoFlFVYYVvYsZoTR/PKoI@vger.kernel.org
X-Gm-Message-State: AFuF++ktIzdDQflOlnGrW65DgAhBtHp2uhYILJgggk7bG0jnHIuBDiWW
	nPjgxPDTgc8s4I/pmuKTjW9tSIJN5o5SbgCDeus5gdM4ecGbSBpBB3QsiN8jQEBVvgvGit/Wy60
	JBEuTNs0z+3RxlbGwJzcvhmq38Po3TabKGvfnD4OOOi4G8Y0Z7SrXZvb49by9Qf4g
X-Gm-Gg: AYBFou1TyIZuXWPFkGrc29A83GeQAAzBUIvXsiHmGww+fjfUhBc2tY+Apg4lgjFjoi9
	thrG9PZ+kpvYBr7zdQGDpa6NOVo02TEQLbQv9sv9j29+0PC6vItzl7xp/zbvivr2e8xIeVrhvBe
	fNOjxp+WIF8IMPhmOesccZoPHPR0snhmnzeaj2gDOqhHsZBD32u9qNdxhKRNur1kUKqfcbbpgsR
	junN3xckunfP3jJQrlXAJ23FcPPELVx95izjefgXSPgtX4mPG7uiX/eoajXteMG7MHMmB4EsZBc
	dTvqSNweaUgbNSYn/7r7lqPXoUtnhonxm+5Nxdkjajs+5jSs//NXQ3RP0E+rX90U6k5b/QzVHdg
	v4z0+iGxv2keBxJTOR/xx+fKx4SAb
X-Received: by 2002:a17:90b:5804:b0:398:9bd5:490f with SMTP id 98e67ed59e1d1-3989bd54c38mr22484425a91.22.1788150600389;
        Sun, 30 Aug 2026 21:30:00 -0700 (PDT)
X-Received: by 2002:a17:90b:5804:b0:398:9bd5:490f with SMTP id 98e67ed59e1d1-3989bd54c38mr22484364a91.22.1788150599959;
        Sun, 30 Aug 2026 21:29:59 -0700 (PDT)
Received: from [10.217.217.192] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm31624353eec.16.2026.08.30.21.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 21:29:59 -0700 (PDT)
Message-ID: <43c19b48-78d1-4426-8f25-d4b75c14e40a@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:59:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock
 to GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260826-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v2-1-bf6746a849ba@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260826-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v2-1-bf6746a849ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GKuaLbVlAJmfmvbxcFFeQWp9HdpflDcj
X-Authority-Analysis: v=2.4 cv=P6EKQCAu c=1 sm=1 tr=0 ts=6a950349 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2CJPG24AF_AVZppijzwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAzNiBTYWx0ZWRfX8K3vkf/n62m5
 okGgtMT15V9knuK2iNxuzkhumktjXs2GX0XTsRaXCXUYPBPxVYuJVDllHvir7mBytQJ2Rgy0QMM
 Ywo1fx1JYbBm9JV6hi5VeuUFWdBm2ae4nYbUWGx60MKDinOSKXYZzrRyW6FpOTvJoy6CDsjBs47
 /qetKikNvOAV540ZcujCMEfhT+P/mPoXrjUBraEJx7SA9HNif4Juit4a+VNrbLsFowwNEMCUYjv
 aFtxT50wN3bcObCnrUAQQ4IfzeM4N/RvZgyl+q6TJOp+IOBR+IZIP8BKhV0AfCJYk2FBt4u9IuL
 rWh2JbQDpXHqn2hscE1FzGEnlSQwfkfs8LJIFDD4eG67Fj5nTAQHxwqaZUQM+gODA7mQP3FvNNa
 RifQt3wzqPEanVqSkWuw90xeoT97SMKZ21ZKWk+Gjhqv/uQ0SSHTKLIbpI4dTDxkwCxpBer+rvS
 3WuzfXHRF5R0eko6F7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAzNiBTYWx0ZWRfXw3M1N0SHHJGr
 egUKZwUY0zkjHThduc8U9v/Zr5DVFnJNfmk+3N2pdhyvFGXJkDwAjDX3Eogd6m5s0MUgjC8BD28
 c7SP7QUKPW0g7nFcnpGtF8vPnI69wBs=
X-Proofpoint-ORIG-GUID: GKuaLbVlAJmfmvbxcFFeQWp9HdpflDcj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310036



On 8/26/2026 2:05 PM, Abel Vesa wrote:
> The GCC USB3 primary PHY pipe clock is sourced by the USB3 pipe output of
> the USB/DP QMP PHY. The corresponding GCC clock input was left as an
> empty clock specifier when the USB nodes were added.
> 
> Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock can
> propagate to the USB controller.
> 
> Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
-- 
Thanks,
Taniya Das

