Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480580;
	b=bSwOE4Wl/UPIzyqQRCBMsME8cA7XReYndYJB6SeqD6/vCrh+k/zCU+XZLnBiwu/itGbI
	 ndFy90RDTfeaJqVuU2i7V3ERrSPHtzdAFIiJ/d5JzPwwCLgte1Qrp4cUihDlf7o8Y5yIs
	 ayNQAIYDviNWEOymq8kLcu1F2SQy0VJJi0NbG/giGg6TKKcUsuAVwcvZVYxQED1PwGbH+
	 oq5wFTRnXoP0DBlk6O1v20qm6Qwf78rYM1iT61/pbdJb+3cUNFjjtca82ebdmTqUzcZKf
	 0fhKKa1jI7mR9nSyI5ySWvU3tO8BxGVE0H8h9L6ByrRJp+wa50C0IV9OZWSV5vM93Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480580;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TS9vB8FLk0MX03vHuui6sa0P8Af+Zt25Qlv0IPb3C6Y=;
	b=kRgK0buDxW8MloyZAf7vPWpFVOR/aTkcr8YbT4tXs3pLSyTxrK+MWK1vDMyjMe4P4Vdu
	 PlaBkdE5IF65s7YymAp+h/LS69s/hF1G7O9+FbT2OimzLEj5jTdKTGl7N7rvhscMeqCai
	 cE7v3aoAsgdMqXWCGj1FBV+ZyI+wFboFgyB+4oYEOa2iLqsxRMWWzjz/xGJkyTU7UHUxe
	 AXow7Z/OnvFuhEhisI/7xP/QCIYxGSB7zE3jtJEj+vawWe5nO+7uNY6w0n/g2IS1AeLiw
	 vKUlCbMpwMgLjZumiHCN3MbjqdUlYLgcWu5VQSm1sWX5A+JHWhFSZL1I/OckHmHmAeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M0AtttzR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7tEs+M5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E7D606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30E7D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M0AtttzR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7tEs+M5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tE2v4031699
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TS9vB8FLk0MX03vHuui6sa0P8Af+Zt25Qlv0IPb3C6Y=; b=M0AtttzRXOO1ivfx
	P54emTh0eMhl4KmvPdkYFzNqyXijoRTDcUeSu+ngkx8qXmnJ8lct3xywB2NAkQN0
	oBu+obGrXburVFGq6psNnsw5orgmtMMMRkZlU2vCL12somGkZtjr52kLvB0W2kha
	a/WGPetwm/kk4EfpfnRdL0747MqveEigzgFvLp02ZTKdvCOmDVWphrAUSIUTbCD5
	cMN9fPtrmmsDodnrXJlXP+CEAEgxOfVtf+BVRJkUliHevJCpVGxjxUGPD7/GzbY7
	mwy1yNt5pGzpecmUG3w6vFHSACYpdwEYwsglREW3LyGE3y+DkOFZrWxhXUnI93iA
	lBdXAA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5q9a4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:16:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5360b8cf8f5so4693601cf.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792480578; x=1793085378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TS9vB8FLk0MX03vHuui6sa0P8Af+Zt25Qlv0IPb3C6Y=;
        b=R7tEs+M581LwNazc4JENz8ncY4wktrXLRdY18caE9dHTr0AZc671LdEv4cOjgJvPyi
         FbE443yzy7DmGYDoETxQ/ah4o7CzLwVU0J3aCTj7cljjypLUQ9T2Rc7hiycYQx58/UZv
         PyQOAitiKVI0i/qPDMjZJZI2S7L0gyebIOk4GR9+4qve0Exuw+UHlyNAcvbpw01RWfkq
         2/wXQyo8dgM19eauVLBjWF8cy+J0nJcql3OWBDHBlhPGoE6o/8+cobTs/MVoBZySunGg
         RoYpeyTPJl+G1Siw+aBVG53DKQuMQh87ZuqASebKx27//z1MC6Ue53w/XPlmKucMYzWR
         nOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480578; x=1793085378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TS9vB8FLk0MX03vHuui6sa0P8Af+Zt25Qlv0IPb3C6Y=;
        b=mVnkx00Sijqk02ZYnIwfvGlz+R0GXQhSgI6g5WAOopKg0V2//TaWo89xQCWNdYaQNs
         jMsZbVTYVSenVFqIayYhX0pm+G6fc8hgZgfsOjpkP30QTFI69MnohjKEIAWG9H805G9D
         J6z9Lz4MEJuB1VEj44J+X/dqkmvLfDqPXS7CJjJ94PdcONAxik5Mf8ggNe9SxqDhrsOi
         NUft0bChHAtuxqtskVPlW6nc7UCS1iCWkRwDrFOxuzmH25LYtLv+4p2mUqZ58Pb3bv8o
         8axMByiCiRoau8GZ5X+ygAKdMcF8o+UKT+RU81TCFOy54JK1Gd2UU+1wjae5COKj4hS8
         LwFw==
X-Forwarded-Encrypted: i=1; AKwUvBwT5oR5s6n7Okn1jbLIQyC9Ywa+uLLhfus6BziVXG6cH72xgNk5HiYyp2MzexQs74+ONBtgSgIBU/qd@vger.kernel.org
X-Gm-Message-State: AFq9FYL4RVOMxI6HJxFHyJarCP5tssTB1B5qv9DhdjNQTrPVYnvoJj7M
	I1n33ePmtluqfSkPdC0jMl2R2cKxrNk05y9UwWMVC72o7rcDDXKwexWaod5O9yI1jn6YzwOnCFa
	actqNoZ9rJoKpLnMHU2dyf8FZX4RFJWgUolfDG7LFlYldELfZowRai7fKoa1Dub/c
X-Gm-Gg: AYBFou3aVZQosl6wlE1NRCqQbFSMy/OUi2BeIzm2VsYBFoGEN4clLOvXGrB0n20pTkh
	AG7wrwiVBfWZab9xeh//Ghh9l2+Ix0ekajAfbzFA1HEIQlu/HQMwPxKCRs8n+Qfhi3hyQxqgw06
	kwjIPWlvWidSh0LyI5GYK9BEwTt2xKtOS2mfja7N0RYD7cnPwUe1Eo7onM1ZbhwsnUcuaZW41LW
	TpTKjJ7JfnVWrCqx0FoFyLGPQsb+3TkkfwvGNyIPoh8UwdgLorEPJcoAWA292SEkNh52JBwajw3
	gtc11OuvYerWmUfn9/17o7jYLU1Y8C7xA3Drd59o/kyPdQNar9KRq8BjNIBmda1G2mkLqHcgPeJ
	tKPTu2UZt/vN9oRgEYfjqbg==
X-Received: by 2002:a05:622a:134f:b0:536:91cc:465b with SMTP id d75a77b69052e-53691cc4bb3mr1516121cf.3.1792480578334;
        Tue, 20 Oct 2026 00:16:18 -0700 (PDT)
X-Received: by 2002:a05:622a:134f:b0:536:91cc:465b with SMTP id d75a77b69052e-53691cc4bb3mr1515851cf.3.1792480577861;
        Tue, 20 Oct 2026 00:16:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb164fsm447640066b.70.2026.10.20.00.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:16:17 -0700 (PDT)
Message-ID: <aee928e2-909a-456a-8ab4-66d8b5aaeaf5@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:16:15 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: msm8998: wire up interconnect paths
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
 <20261019-msm8998-icc-v1-8-c2da3934b6c8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-icc-v1-8-c2da3934b6c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BNvj-kYQPAnDeutPSCMC-c_mnv-_t0XJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfXxE/PSqQtSCmD
 xFAupHNVwXeTTJ8xu4dQacau1cBQJheYgzo5TSiHygvnco5jRxzgCRxL4+Cg5FIWETRkPSdAEYh
 YLOFfKE+/N7weMDupE9MWrbeoWJye8BrlpkJN0NgEZrYbRhTKiKBvgsLUql7ra9SHBiLCoNaWM0
 +1MTDcglUXguNF3XXqyX18Y+Mi/gb8qYTMOyTw1Tr0Xi9QvFxxaMi+VSMVcnkMWFU9SywH7OY/W
 rF8MHeS8meGv36MnbS2WeEZjwXhpgyys4vC4DygMJrRejQ1x01OSIWadUBp5Yew4IEF3rTffqbr
 QGYVgjHC6fFgESRj8kl2H/8hyj7d5xO6Ty+GDiYw26oTjlSWoIynLxhUdbSxj5lMQ/Clf8TsB+1
 moC51C/WAWYdiInjux/bUEG0+M4HG58LkzPEivRXoHEh0RyAJ1CplR5oqlypSC8Gsw+ZpdlHEiP
 8AUCGNvjsGAGbNR8UXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfX2xxax2L9vzN+
 Utrr1s6qfVV/8RMqDvWTivTy3hVSWxP+43i2BlyZlD89wdSb9CP7kd9CF4DTbTtCkpfxsOY7nUf
 XDWaNC69tpUzvnvHshxLg11bqOjOLaM=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad71543 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=JzhSTXaIO3PCq1I_VtQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: BNvj-kYQPAnDeutPSCMC-c_mnv-_t0XJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200028

On 10/19/26 4:12 PM, Dmitry Baryshkov wrote:
> With the NoC providers described but no consumer referencing them, the
> NoC bus clocks stay at their boot rates: nothing votes for DDR or
> config bandwidth, so masters such as MDSS or UFS run on whatever the
> bootloader left behind.
> 
> Add the interconnect paths for the GPU, MDSS, Venus, UFS, USB and SDHC2.
> PCIe is deliberately left out: MSM8998 has no route from the CPU to the
> PCIe config slave, and requesting one only makes the PCIe driver fail
> to probe.

On upstream, sm8450 is the first one to have one wired up in DT
(intriguing), sdm845 is the first one to have one in the icc driver

Downstream, 8450 and earlier do not have a path defined on the PCIe
node but clearly that relies on lucky ordering

I threw the LLM at msm8998-bus.dtsi and it said:

The only edges into slv_pcie_0 come from three masters:
- mas_bimc_snoc_1 (line 669), reachable only from slv_bimc_snoc_1,
  which is fed by mas_oxili and mas_mnoc_bimc. Neither is reachable from
  the apps master.
- mas_a1noc_snoc (line 679), reachable only from slv_a1noc_snoc, which
  is fed by PCIe, USB3, UFS, and BLSP2 masters.
- mas_a2noc_snoc (line 692), reachable only from slv_a2noc_snoc, which
  is fed by mas_cnoc_a2noc, IPA, SDCC2/4, TSIF, BLSP1, and
  mas_cr_virt_a2noc. The last two come from slv_cnoc_a2noc (fed only by
  mas_qdss_dap) and slv_cr_virt_a2noc (fed only by mas_crypto_c0). Neither
  of those is reachable from the apps master.

But I wonder if it's some sort of an oversight. Can we try to
regenerate the paths internally?

Konrad
