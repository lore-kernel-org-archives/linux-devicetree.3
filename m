Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AEB3BED27
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046620; cv=none; b=nBWt3+GrLKFL4mMrXC4a9W2A10Hw9m1wxhZOgAxTi9e77q3E18pGmDf8+wE+dFiNwfA0uLbQBnjjRc8rUA7RTmv9izWxQI99ZOfNlGnepwkeUD5eGtmsoojjq26kCnpRGzl2aovYw+pxiUasMwSBp9YIyYEEwN0XIHpN815Menc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046620; c=relaxed/simple;
	bh=yKQGwCGb+Y08ygukP6FDC0FdKGY9Z8KzEzx5YkkIu/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HFkehAdJP+dlLIvgWzYqx6RSnsO4V6NmkoiVUGQWr0YDJzfJd+DVrLhBOFgSN/f8aeh+TvugFuouTFeegp9QNzmfYZTarSBDUvypBK9t8w6ahxFddYz0CofGE7kCZ5V/x8JdQMO7JNExzEST6dMlSv+UYvThCe27Bsdx8a+pLk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qw2te0VX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EnSzuIuK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qw2te0VX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EnSzuIuK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6gL3n3252775
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TiepCEetZN+eWue0toAa/fv9fpAuxKXAQs9YKOGi2FI=; b=Qw2te0VXR6O4S1F3
	yYn7Kc3mAPuTJ4gwjM552fM5yR7nwNj235JVGhLHpGzLctX5cUmbSoTTrLHI8I5d
	Ye8q4FsZrciQKNnobtUcxiJwjlcaqDIVcKMt34PBNWGfJTXfF7ybKvpvXbJLj/E4
	SttIlA5C7Sq8Kl/TxN9qEfV5ui46nQ/OAvH8RcLjUNkiXknDEmYvkUCddB6X0hef
	og4AkUrVgILTYRO78yLg2/w1YhSQERZRvI8/tjGMuwzx43rOzO3E1sZG1o5sX8Po
	B3hdTU3oWv1Fu5y6H5XS9q5E4TtS0TZlw3qs+RWu05rnx8evUguDrxe1fr81JCBF
	5s6EXg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eespn3r1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:23:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f9429f49cso18471181b3a.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780046616; x=1780651416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TiepCEetZN+eWue0toAa/fv9fpAuxKXAQs9YKOGi2FI=;
        b=EnSzuIuKCz+nuHWnMi4XQ6pvou3dQsR4iwIYuUUeyBS9N+BGkBde9YYHLkVRrSY9jc
         Uy+9jgql+TiPU0ZeRlqjTmO8SahaLJFSXiKja1CslPZutA3X5euAtNeKxRuyJc3xK0SU
         87hWr1DGZB3RT5CY92+biGUOuMnENLwEIpXhONHadsF956uPKBUg9AvSGvg5180JtNM9
         UpAcg0rlKzaXSzV7/rImGjk/gkEBmY7mWlX2mZGfHojT9ryu3DD8vYlsaxNr2ooJlXSG
         ANnFwr9n/NK+oUr5WrbrPlaB/6bWL1nGgjm/4y4mxAKFtbzDxz188BoErctINIlRvQ67
         eWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046616; x=1780651416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TiepCEetZN+eWue0toAa/fv9fpAuxKXAQs9YKOGi2FI=;
        b=ZEEbOt/b+3wS1RQaRvKh2LVoLmbwTclxRZ5tSkp1ZE52lSw/ymxfWr544CrmTFV6jV
         A3l9sCa/GRvupytra1xQh6HnLB4sgKP4+uGFV99oacQwkOn4i77QmnhCsw/7kXJTyuzM
         sjAqDcC/gsX6LZwh1ojSWdoIOL0CH5SmhJqSBVSyQ5ACr3Kg88SIa+Ery1XuQOD0cPVZ
         ybf9TT13+a9RNHR8ub8jK+C3JNatZ85GYgVVUZtSsVgB+fWshZEYydmcJ40D8D8Hbpwx
         KxlqSYIt0+fbaAf9F/7ucOqT3s9bdRG8eVxZNNOECNPPgrk2ppBruxhWF3+0SdAJ5iby
         /aog==
X-Forwarded-Encrypted: i=1; AFNElJ/EKOJCNrf9WSFh2wEUTA2Pe1y+mK4IvT7m9nNgx1VxY7vFZNkYTBrQK2bwH5875ljCK3hqScXfE9M3@vger.kernel.org
X-Gm-Message-State: AOJu0YxVmtG7vTFkgiwoJqMz2heqKrknY7wsnLOyMQiUQFL0Ebf3dYvC
	GFTlvC1G2Cw/eo+6MTdQxwfvlt0VEjIcNdrPT+TFCIURomBS7IPu2RdwkK08U/MtIfJR2h7MW/e
	nCbTbuyUFYNdWce1vRLIGmOFzG9qj7EOOndtCl1WbHs1+WHXwTf2ZGi11eUHhCiul
X-Gm-Gg: Acq92OHrQdZlhRbIf+ef20xwVkDxeuWBUUMOjz5C0PSCJO4Kv1wHHp9VGoMKlNENJGd
	HJW4OdHEukyXFYzlzeYjMJlS9putVbEccMiH4SONIApbskYG0CU8st83ld/tOJIfl7OZjWDJAnV
	vXGNsWw+vrRR6KouOgcJ3JwI68XmxEZ9Hj2ZJDr2vxXGeuA6vWLpRQnAUcfoL6Hx/+4Ehwz2Lbf
	pgG2JXN+5F17JImceQBTolv3/G45BviiAzQwcJxq02HYaSa5duvYaaUVXMy1L0iU1LSZUEdPBvF
	mFFzAOm/HmxmAOxYwjYpRztAEsBCE0rwzTb4iuP58OQp03/fhTGzKWti+lHlGfNGP3IH5kfUdSJ
	D+b9G+nkMjldXKditSgq81bi1IrPDlZ0unv2KNA9ixTDOyRwvd+8XVBdsELVAVA==
X-Received: by 2002:a05:6a00:4f8e:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-84212b83c1cmr2358715b3a.25.1780046616121;
        Fri, 29 May 2026 02:23:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f8e:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-84212b83c1cmr2358688b3a.25.1780046615661;
        Fri, 29 May 2026 02:23:35 -0700 (PDT)
Received: from [192.168.1.2] ([117.192.250.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214affe29sm1240298b3a.3.2026.05.29.02.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:23:34 -0700 (PDT)
Message-ID: <6d5fa33f-449e-4f22-b0d1-60a3a21a9907@oss.qualcomm.com>
Date: Fri, 29 May 2026 14:53:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: clock: qcom: Add Qualcomm Shikra
 Display clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-2-953f246a0fbb@oss.qualcomm.com>
 <5nghgd3lt6vyewd3a7l4kahlxiidxdhgtu42tuyb7xeq62ztvu@tvclo336xtpi>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <5nghgd3lt6vyewd3a7l4kahlxiidxdhgtu42tuyb7xeq62ztvu@tvclo336xtpi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n88lA0aC62Ju-sYPWaIbzeO1hfhjH_Xd
X-Proofpoint-ORIG-GUID: n88lA0aC62Ju-sYPWaIbzeO1hfhjH_Xd
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a195b18 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=MYhr4v4WboA43l5+MyccHQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Wv3FfvtsC9jmBwEqIE8A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA5MiBTYWx0ZWRfXwrGTcE77PHcz
 Q3ugtD3xdf2jEGobjDcuI7fIBMPA43+El28VnHVd32+zqPsXeZQ3SsIHXSE5fjq7usuNVzK/fOC
 CoJO6Nt56V9v3fOQZT85FbhN+Qk38jh5LvvrGdcn7E44tUQpEB+ouCQkrZPqPkVynPgex5DEStH
 innHT8isat9Gehk6SaQ1FDdiCdbC6J7uvGZ52Ao7OrFuqiEkLoois0RtcvsSKmQRMw/hrY3ffTa
 usl2jYaMBa+MukjqNrtymUXBeRUvTJuWFTODi4VRx4Mxo29tfJkWRb2OB9E0yTxcWE04UP2+YCt
 ip56GkhI8w+yGSE6vKY+XyFICZ1Tt5j8fgSwDB3V73A9WAX1ZFMi1q4H+9t22z298KhdIzKLsyn
 M6FR5SC+hpoTVL9dSCp26yksDdF7RhRtLMi1f8ePne7sZRa8DEBaZG69D2K27ZW5OyGj1OEXald
 Rp1OaBo0/8nJxgLRPkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290092



On 28-05-2026 07:14 pm, Dmitry Baryshkov wrote:
> On Thu, May 28, 2026 at 03:37:03PM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
>> but has minor differences with the number of input clocks. Update the
>> existing QCM2290 DISPCC bindings using conditional schema so that the
>> QCM2290 requirements remain unchanged while accommodating the additional
>> clocks required for Shikra.
> 
> According to the IPcat, display clock controller also has (unused)
> inputs for the DSI1. Please extend the ABI for Agatti, then extend add
> Shikra.
> 

Sure, will add the DSI1 to Agatti as well. Since we are extending the 
ABI for Agatti, I will remove the clock-names from the bindings and 
update the DISPCC driver to use the indices-based approach instead.

With these updates, the bindings, driver, and Agatti DT must be picked 
together to avoid any functional issues or ABI breakage. I will 
explicitly document these details in the commit message in the next series.

Thanks,
Imran
