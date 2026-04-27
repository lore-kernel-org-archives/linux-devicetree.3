Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C013093DB
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285168; cv=none; b=M5YsWR5OUf+T/QYBbvWG3WHeZySunqhcwiI+cJHShrBdWwX2EkIOVTvzhCQMkKuN5jpNPQwXPQGMpnwfCGyiSUOIdPbLlh3/XyAXehDe2An94WrzGpT3uTo65RpWadDvijmxFzma/N8S0Sr3cK3tU4sRCU3sTsFCnywSDpXjCXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285168; c=relaxed/simple;
	bh=q+PN25Yvg4Ok8USmVhfqsDHkq7AJ6+ao8HG4QYjNvvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pmjUnxkrTO4bG1BjgNfzjkWPH0cmo4RUOTX+JICT6vFGvJm9cBtb6U71Y1Fci6R8Oo6rC2ini8L6KgyTIEAtoM9x0aDLni7MJLq0H9fkk4biLbCaLjUd2IE/6irGTEGTeYX9qQTNcXC4Eugyh2efKVg5mxCN9Q+ar/4yN2Iw+ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iE5EtpGL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T1QB3bgv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iE5EtpGL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T1QB3bgv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TDLb861375
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	geeJ1PgRAUITajyl5+KfQOhgNzb0SKv4DzQGaAN/Ny4=; b=iE5EtpGLry0peiWr
	vO+bGTkpXwRb6jmdZsZNiqGCqRlRsRR/wf4CuGR2yNok296j+tzHPqfeIupvCvjL
	qzo+wbGTisfMaP1G/WuSsoOj0exkIBFwcj0lKotP4NnbOWvwjTl695jhpVMAF0yp
	5G9rfz5hsNqj0foTKpws4r3o4vAqxDbsGlakNyASCY8bpTzFHWW+CV6XhKKQJ78N
	kIC1UDrk/w21YWmsXFZWiUTZUWg8nLWyKiZrB8hpNfLBsTYVoAliMG35xLyeVWWF
	yvNNi/yCTk/nLT3cB1B/HZhpfKQwXqrRPtXo2ZYZ5zHNXlyCZWR+3+irpBQaix0n
	y+pMaA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw5n7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:19:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e576143baso20671841cf.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 03:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777285166; x=1777889966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=geeJ1PgRAUITajyl5+KfQOhgNzb0SKv4DzQGaAN/Ny4=;
        b=T1QB3bgvHvzGhApTjA9xlJU4uSYAaTNwFCLQsDhFYFpBwOCKfavl8U821LpSguhhC3
         z5JSdESgLf2hOCep4dTmAmxtG+yUG7kxdMcEsQJcvhpFzKQ38iBigl/MTPql5BZEoUK4
         10GCfMLTu3IM3XaVh7vPNARuhpr6qrm9tUr6GTjM0KEEzRYwnmWoL11qitfW/nwiILfl
         dUeXSlCUtHGF++EOTKcoZ4j3nq7r5ROS5/youJXBEUtpgswBtmLhes+IQ/67TBBQmUvv
         ts+xX6KhpJyTo/XRYDvS9d4fgGGw1GFTh4/TpV3lcW6hPQKvPvA+rt3dVbKg2DpPP+kX
         vt+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777285166; x=1777889966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geeJ1PgRAUITajyl5+KfQOhgNzb0SKv4DzQGaAN/Ny4=;
        b=V4hDVLM9NM1t/z+B3N1wwJGHgcEIn2u20sOZ5cqE3r4uoRByH2vkslnj9UNLVbt/4K
         /olruDG20GyZ7FTCP2nunUUZM63JBT0EYtHU6+Dp5miC3n34EYWWF6RCbotSWVSWgtId
         3bVi649h1vFzFEVhWJtKkhOwhQTlcGVcBLXrhBd7JMYLiBQRwi0ooe3+IdfF5wilpxas
         CVdxcRenK6zfQHmShN/PJP0maP2qI9vKIc66mLuzc3oFptdjlDlRiWMiCqz27ac6wP72
         P/zxv8uDUziDaYx0QCjnlNimMDgAC98jjLKPmrDIaq5O4pbNUpDw0b8ED9Hi2bocHdpl
         6IZA==
X-Forwarded-Encrypted: i=1; AFNElJ+aTy8WaXk80QV5q6FMMZ28F23wkHzGKHesDWk9IcsAlsV/HyokJJ8nHDdE2aG1d91A/BjicacmYwb4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3UKrturJSXoHRis+GMDMD1PV/rArR49siaF/u85MkL6Tu+Lz8
	ltE5x5S2H3sauA5vJCMuKquz3Zuw7RNvWfW2MBFrLVPhVHx9SzaqMqDAp4+zg4ULxQ1CIpXUWZi
	1P57AG+PKcKkd4dGhLJQJIxK8BcaojpHmkZDPzbZONaJkopZvyM4q8pp96O8nUcJc
X-Gm-Gg: AeBDieuiGrV9+ld0us9oSsO1QP3F3PY6XlRgkt3HsWmZLYK08p4ltSfS8ZE+8HKVmVM
	bPzSLwin7x6Pm8pO7teoZWxPbjRybuYvUw8vSutlu4LoyROdMNK/ORHTTy5nhVxbcCqGe/JIEHk
	mRBeLVv7BZz5dKh48SspwC4F+I6pkCqUeCvFNaT8w3eGk5OMWCLTp6nwbLrxtlMqBx/bhZzSqjF
	d305q8TPndBu6TzddhYOYkNiikau5EzchD74SMp2anP8kwAgXyKmqwfcf7P9iBUqBXp0ufMtDS+
	ooqP1OykTP8AYix+LfeOs5xzNoPmYfTkY1NRqaeRdVQ2zZeoWyu3XA+CjGB5euWnAWZwWuLfvnn
	cQ9jOvOk8FIJryR4d2L+FMBsL1wYbNaMhv4jxBlzTCc0KZ0cNk60H761askG780dSSJDapKe/CR
	BZQFAYRO52LrkWIg==
X-Received: by 2002:a05:622a:598e:b0:50f:e5a1:29c4 with SMTP id d75a77b69052e-50fe5a12b4dmr98356601cf.4.1777285165583;
        Mon, 27 Apr 2026 03:19:25 -0700 (PDT)
X-Received: by 2002:a05:622a:598e:b0:50f:e5a1:29c4 with SMTP id d75a77b69052e-50fe5a12b4dmr98356271cf.4.1777285165235;
        Mon, 27 Apr 2026 03:19:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e3dsm1092021566b.2.2026.04.27.03.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:19:24 -0700 (PDT)
Message-ID: <547f620e-905f-4090-8ebd-eb9f010d67c5@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:19:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8650: Add missing CX power domain
 to GCC
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-6-4b6e09d532ce@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-6-4b6e09d532ce@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOSBTYWx0ZWRfX3UpeSgWbErfj
 OAANgZMjPtJg5o3Dt6aJawNIi9X38RFcb0Vl70NgfbGdQwVpygJ4v4YpTu2igTKPidtCJJ54NJu
 Qc8KJvMi/zdozSlmjsTHv7qEkOfOG6ehYDUrITyFGKS/Of4O0TmjNZdsLdkVmyt3R4A0TDPVZP4
 QsBl2Wnit3Lm41zMqBYsZdUWrIDB3wLTC45N/qBO2LbrNI6T28NsDM+0UXs93+XKn24eoMsSGHT
 y9/2SkPcO+GEwOxIwQO06KO1C8RyO1xE8doxGfTYFLWT0+MW2hEijhRpoXMvUrgNmYYwUkFur5i
 44W+PlseMa99btiFezuJ2L9T79w32VcIVQOeMHnlyr5+4MjWdAycQYa0OumuaP3LA80Yj4bQ/Pd
 ihzkQNsCHaP7ZHj1Hjqw9gXO8IreKGBah6AxfWpyEQU5xPNteScT2UJ0ch3kIVPxtPBVWIDKO5L
 l/2CDK4m7UWC/w+8ddQ==
X-Proofpoint-ORIG-GUID: IAwwVOOI5lrsB8zGVJTT3AINhqICKEDL
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69ef382e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fkf1F6wwXAJK7cocUXQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: IAwwVOOI5lrsB8zGVJTT3AINhqICKEDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270109

On 4/24/26 11:08 AM, Neil Armstrong wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
