Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9772ECD1D
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782287976; cv=none; b=lxeL67d0BVENiS1hE2kRcM7tVxHdR1L6BRXHeC40gvHf6N6f7RFjpBB/mxUtXIWt0U05UFr8aKwg3r7flM1yHxxlSnES72OdNeNDRu/AqVmfYVSeOBfIh0hiNkP7FHSkMWEdl+LhOW7bQnpfRLEcJUtBpPh/O++avAVgWZKO5hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782287976; c=relaxed/simple;
	bh=qvJ5lDTQaJZMW5WRgJaL7eHme5b7nd8yOh3zWqHbc/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fh5xSm9Du7xpEvsB20qcmTLYHg+zAXWKKjV2NgEuA87T4MF1AxT74qUlz31yjQiS4e7E/VA5v8t2tB+8p8odB+7QVYl0StH88Fs1+8hsNC+t7wKs5DJjW+nNKtDPdy8PGe9ohJlRbAq4w9QopUOPYh057jfqYcUq9ZM/bGa/2Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQYxvD1L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwRjJfLj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQYxvD1L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwRjJfLj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5u6lS2439047
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twOtasaax+oiBbZUugOt970FN/yZTZVHTjP7+CHD5oI=; b=OQYxvD1LrRMrDzqs
	E/G719eReGK8svK9gtOldcOCXhS4ATjw5+mhbp39TVCYmnwOx0zRIFTLVlrThCEE
	DDSyLNHRP3aFUlZ5ZyaSyWa7/hejDnrN7oOqJqxo7JL46O+0bV6dzdDnN0IgnEvi
	OuzJMbXqCc3kda5phMJkD0alyJ9adEeOp0NdASCcK0yVbLX6oyv7Fk8VE77tHG+/
	cUy4b5ROukraJt4iAkIvHar6YVIjycfwYqeZpXhKx7/btllEWrTIe99WRdtrMU8K
	koAyvanXwNWCdDmCvyCveE3EeQvafn9PSK5er5TwgIxiEb7hKP33s6YZbYwJuaup
	QJSuRQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ar16n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:59:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5198e72249dso815991cf.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782287972; x=1782892772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=twOtasaax+oiBbZUugOt970FN/yZTZVHTjP7+CHD5oI=;
        b=bwRjJfLj5MmQWsXhXVvlQKbBK4gDN9LymUq3/En/7X2U5A9nzrW/StZokiMlXZQp30
         MvZHopY9VPm8oxfhHdvU4da+DSiqfX2vLVpvqc0+y9dM4+JalbQV6cII4u+LDBQ+PvFe
         GMrMwSN0naMnQ1RaJJNrsA7Noay3Tp2T12B7hdpdyNuTEK8QWBKbQ/Ta6nKxI3cpuaeH
         xfFSD+k9Mvtuq7B7hk+nWtSHU/KuHTLFSa5SgAN5sm0iKSMQBQubnSBkhhkXSoVqtqW/
         SjMHwp83gh55r8wmnU66KakV+MpVuFVi2iDYjnlhZNd3SYgjD4ZIqp91HzCKHWqvO3lB
         kFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782287972; x=1782892772;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twOtasaax+oiBbZUugOt970FN/yZTZVHTjP7+CHD5oI=;
        b=UfRrd69IhwU8rBHgpcFBDn8vw/JDN2AO64e8R8FLXu0aq5sWEoe4cI28zKPDf41gF+
         z4wg5hpokY4LeCQjx+961LRn9aaGSZUncFIOe8NUucyhi85c5u+bklcjm28+YZLarqii
         Som0mv3TiGejSpnCSICh98RSU9d5Ytq2/5DjJOhXuwJoSRDz7zQ/PWlnS0CGBTPpE4cG
         EVncDUHUcCKdg8an+k5jLYtMfOAJiEtNegQ/B0zsZIInO83wwyGR4E9pCAMGdmxILUd7
         7ZoVf9tbee/EqPo+tELrplT5ItJIXq2qkkx+Gpz+XuH4YVIt2/ANPMirzA88hG+GJgi4
         kz9w==
X-Forwarded-Encrypted: i=1; AFNElJ821DFV2Hg4UYOesEDoPr1newmcpXKXzti0jJ/nfXjA8jYefm9qcsj/WgoRiCn78L8gNhEUl3ARIr7i@vger.kernel.org
X-Gm-Message-State: AOJu0YwbCqyFaOhyIElbvAtnNmy7oEoKM4KIN0NKY36xIQMcAjlqcAIM
	V/szuLKXMTJj7YNGI+cvnXYv93A73VDJS2Plpnk0QCN+OisnhCkgb7KaafobbCPn2YTs/AO3pVK
	C2AfnlydU24N7Xg7T6+Z5LRj/Lw/d0JmgL01DRvC06pNqmhvoycjSAshppw//iy8+
X-Gm-Gg: AfdE7cm9UGJlupaQ3rHDryBDWyxRpz6kh/O/UNcaLiB0hS9Rh2Eaykw07A7rJcm8g4w
	POf1/SjsXyC1FbXeuOsLSe6h5mwtq8qP4y5N3c4D2aSqoDrKLp7vU6uAouxV0xu8hCdUEmbczW6
	RaGKMaL+z3GF5F0FA9BBXXJwU2cD81TDzTzIgruQqNRRA/9GnBY7aQdg4O0pLHGedANdX12S6Gj
	rJP6bgFtd78/BsxYNAnEnIxU8Fn6Bvy39epMHjOBA7rJFXHZCgCOcgT1dg5oHXGDV3PqrqPG6x8
	6WWmwtAQGCgpaHIXQd0NGAyCmD8VyeD/El0n5AtdpdC9KRKNL4I4l38qV5wdGEbYimciIQE+DiD
	3kNcSLejGSTU3OVyzPkWdl0AW+1Pb2WgdqPk=
X-Received: by 2002:a05:620a:414f:b0:916:1a60:ee05 with SMTP id af79cd13be357-925c335da65mr912239185a.0.1782287972567;
        Wed, 24 Jun 2026 00:59:32 -0700 (PDT)
X-Received: by 2002:a05:620a:414f:b0:916:1a60:ee05 with SMTP id af79cd13be357-925c335da65mr912237585a.0.1782287972149;
        Wed, 24 Jun 2026 00:59:32 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99e1aasm602084766b.25.2026.06.24.00.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:59:31 -0700 (PDT)
Message-ID: <f1fc8b08-721c-44e0-b7c0-e94d47a69158@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 09:59:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: lemans-evk: Describe the PCIe
 M.2 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
References: <20260622-v3-lemans-split-v3-0-d26bb22594e3@oss.qualcomm.com>
 <20260622-v3-lemans-split-v3-2-d26bb22594e3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-v3-lemans-split-v3-2-d26bb22594e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S2A8_69O5hxijS6MExlvF2cIH_YD5D2P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2NSBTYWx0ZWRfXyNiL+8rIR3tu
 KxcItawfbgr2cC82XtkddScWFbXwg++1M49nbiDambQysIO/krqk8jdcPgnuE0fXtVQcHFQiJVT
 j+RIdr9Jd1D5y5oaTtm5zKGhBl7kGSc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2NSBTYWx0ZWRfX/7V9l3o/bh+3
 OwRGRx4khwVSmXHsT34UV8X6hcultYhxQCiicaPC6rCY/U5C7URsUJ6KPVzgQ75sVNesX/YNk/U
 AawrtWvsPQ4WhuKs61Q6ST5T1F2HzqS2ynllSzjVMS82mq4BFWLLFd8LMGm/UgA1JZIF7+pPDZj
 BSusfXxwvianO5sAxNMYvZijLU709Sk3apAYTPJ4kAaSytP5WwrqlzAAPAJeNCJos3RsBBfiozb
 EOVNxR3Vfbl1kcppwAOZlnXh8/+c9ehYIFPHKJsliBZCjoUXHu4DqxTQ2vHM5KpuXFfzi4dVR7Q
 GdKpR+HwToASPy6ALDR1pjTA2Kkxj1RIzziH0m8fGbu7loJqUeg4Rs3K4zD3Vw5EkZNiuk/MMdz
 ttspGf24emBf7Bw3UuuWFWT2+TUEFg==
X-Proofpoint-GUID: S2A8_69O5hxijS6MExlvF2cIH_YD5D2P
X-Authority-Analysis: v=2.4 cv=EuLiaycA c=1 sm=1 tr=0 ts=6a3b8e65 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=RHkSvrZ_EfxGpr5bUSgA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240065

On 6/22/26 8:41 AM, Wei Deng wrote:
> The lemans EVK has the PCIe M.2 Mechanical Key E connector to connect
> wireless connectivity cards over PCIe and UART interfaces. Hence,
> describe the connector node and link it with the PCIe 0 Root Port and
> UART17 nodes through graph port/endpoint.
> 
> The M.2 Key E connector is powered by a 3.3V fixed regulator
> (vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
> (vreg_dcin_12v). Both regulators are always-on and are required by the
> pcie-m2-e-connector binding.
> 
> Also add the serial1 = &uart17 alias, which is required for the
> Bluetooth serdev device to be enumerated on the UART17 interface.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
