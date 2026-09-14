Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F273DDDAA
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384097; cv=none; b=OzBA2Ay9QTldZRnNLWbrKyUyG+A5xDtl5CLQyPOPowJZet+g0lK/Bh68/c4/GJlUHSCPMVHqBlNRCVGMZGoic0SE2u7l4DXFCYjpCfQ/0+grkODgm2GJlKuUeAf7GoVn4YhLoxn5Lc1/Et6qKdGc+0aD/xCIxxAcCqcr9vm7LY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384097; c=relaxed/simple;
	bh=H1sQheQGIQzZaf8BGHarv7QlsNW/7jI8aRrywt54u+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lSeTbe/dXV96sL/rSlB1li2SD8P88TN83F24n10m5zrRrkrX0bkwUyQMetNfngZMyA42zVtFFV6BQOyD/74gEU6TI7w4hm3+VzJn5VyIQhhbZcJAzr1vVgheK/RB80olj/NWepgMglJx9pscDluak9ALGnnx+4wJzxs3tFmOgDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NcfdWNwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7V1Ys8e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NcfdWNwA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7V1Ys8e"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm4SV1216201
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GhdbIsYe4869hHdUsFlQG2aFmP9Noc9xne7Hz/Z5Kk0=; b=NcfdWNwA4xEUbFKO
	l0kyYjS19vTngKlA01bJHZwAelQFAinQFV7lzN4ca3xap6D36ZulxBcoIgAUXlLq
	ax42hev1I37yqJYfMPfCVFZQjmmE7QLhekFqPZuw3zJ5/6H+FOj3pl/1NpQ41FWM
	GJXO/EZjPZZu7uCQKQOb1s+7O/rwH3T4SvafYdngkryzUZmrMeqQXlHDWeB+YzOX
	C/hxAY3ziCcxneyUCMGkmiiFVPiw8XUoIw8m6qBuq157hTZ+Dw4vb9XTwDroNzOP
	eihMqLnluSrcli8xnI9eFovIHEe/HWzCbo3AIdQ75UPme2GSbMbiCKiWslxCPRSi
	fa9LbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0a6r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:08:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-938fd633df7so48685185a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789384094; x=1789988894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GhdbIsYe4869hHdUsFlQG2aFmP9Noc9xne7Hz/Z5Kk0=;
        b=V7V1Ys8erBu0XnAkRDFKu8xlAU6reQMuVDwi93agEuGPZUtcyFFcHfmlqwykLgJM8e
         XFyuf6Xdz+Ho4xylWmi2e9DAWvCRB9BuVL3BZ6AEudJRrdnBaNpvrEBnYu1cKKJnhPeK
         tIDj5j9VMQsZ/C9AAYX+vdegaSfnAA5MuMC8iErjt6eXtCoBWyF4eOZLGObYdY29WWzg
         QAl160jUmGxfxZnUxPXEZgQjBgN2gkQSNNa7Eh0DEnGF3ce/h95LMP785JACrF1/xgLO
         GgSslGyaDngrTnN07EoODZEcyoPmTrr90EadWawJmekfJvLA5WQro7zoXhkIYlZ+BFC2
         bvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384094; x=1789988894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GhdbIsYe4869hHdUsFlQG2aFmP9Noc9xne7Hz/Z5Kk0=;
        b=Kbr5HSeR9i2fG6BgcRucuHQO4IXnFhZH+4CEoWcnvK1KloUo4Yw8Vx4WQKQS+D+Psh
         WEs/1gN949lcBgCgl2lBVpm0go5mqIMNQbzBcOXsmh366Y+3Q6iP/pSHcWYUarYdOrwY
         hPaF1H+sgDGbhqHTf7OpHgrYJapwpnJYKUdFcFPcDToqrgLTSrNIyzaFJB45GpYzDrCO
         /Yxyp3e7jarSnlI3pKlj1C3S0Gndv9cCfjFeyQuUnxTvyPdLNAmp+PkmBenf8yVKRh/u
         vyNqOEBpLST11simWz/JlEOfku94ZiBRm7+73yn3EyHjm6WUbyr3UQjNZ3tL7ZnVix/J
         nZwQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2tAR17inzBV/kOzw4xaMi2I3HhJqoc2/Y/wkKdYdDgxZxEy2TgYmSc/xzxJtIoxTrFwaN4G3dhSYp@vger.kernel.org
X-Gm-Message-State: AFuF++nIoj8xfLfRUgHfyq6oDSiqo/MIql9/wwbsllBHUj1gfDhmj0Ke
	N9siVXEwameQx/CzrlYMV1yrVj6mECPBLKL6WsmATIApOGnv9tPKzYMBAyX+WiJYmm5Uka64MfM
	GViXJzi27Cn4fXnuhqehKv+qSsZYu8J7jQP/KDjtn3rpR4x6oEzCgseGQ7SE6VJdX
X-Gm-Gg: AYBFou05/F9xYpI/24cOpylIpTpQLieUJo8jwonx2Vj73i7XJWIARIF/9iSKfkn3gP9
	LOq/mJeWSyHqap3ygADfuOZT78QkMGa+Zlr4bWXQvm2VPa32yQgZPfpKTPAheuHRDzgb8oq1U5i
	ropVGFo+rPIIFpQmwGdl/I5nt1nXJs94hcIynpFMbVkarB4/805htUM0RbHnqctwN8KOUCUCgUe
	CAlk8JmwgXj4eaB07cl1Q7niDsDDDcVZQNS7A8NYOrObfd3p9jnchRxfSy6xh/uy0P3UYffqO7I
	cXCJKIHmct+DhBHU7ecIfP7d4CC9yhxoJg7G+J5GC7pZX3xihzTL+k51g2EtSovWnRq5OhQZkYV
	RzVVmH0uRtcqqO47qce4obA==
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr206572085a.5.1789384093827;
        Mon, 14 Sep 2026 04:08:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr206569085a.5.1789384093412;
        Mon, 14 Sep 2026 04:08:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608ef30sm415014166b.42.2026.09.14.04.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:08:12 -0700 (PDT)
Message-ID: <9e81308c-6d9c-451d-94a6-c4d860a8cfa0@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:08:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to
 PS8830 retimer
To: Xin Liu <xin.liu@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, guodong.xu@oss.qualcomm.com
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
 <20260914101233.981643-4-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914101233.981643-4-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX3bQjZC8+SmnE
 HOFa58mzjoMxX/nstaX543wV1cQWNq9YS/ygEipifGlnt8nnBERSJ2EA6ZmIMKJ//7e9cFiMB5E
 Z1gpCgr5oWuej0/f1JHzKUBk4RMmfYM=
X-Proofpoint-GUID: -Mzrk5JPNCfyP47lz4yydGoa_3RtWzEw
X-Proofpoint-ORIG-GUID: -Mzrk5JPNCfyP47lz4yydGoa_3RtWzEw
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7d59e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1vdBnAqgM-xrE5tMc9oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NyBTYWx0ZWRfX27ibhP/gv4Xj
 ThA9YpyflWUHhXxHeFZ1DpaJcDie345On746I0YL1qgfCNYN5WiUbVaf+TCtO2am6CAFMCnXd40
 CSfB1NxLq1WsorEldRKi6E9nqj1busDLwpG1wVNNivVMkmOpTngxt1fM60+bImCMmPEXJjKTCa1
 IFZ5ya9ESEXhG2MeUPNEL7bbPRky2fvcxkoXv36N5zUmwXJ5EQFQLDziNHRjFVwWtzoAsTBOy/H
 /2sD03TQAAjL59WkYbSN+KUurVyD8v67oIgE4QF1nRC3KbEqoe98JmiqSCrSQ3rvy7W1fwJHiQ8
 R+5oVXLSkOn/oX1wwMH+sUAn/9eYR5IBofFaUImJ3K+XNnwIRgE/oKeFjkkOAShaehlB/uDMuR2
 6TDvbhazY1832vDpC3DwWOQAR6ovG8Bk0DBc5t87qaqU/t6oonYfisMH7HR8IfGToQwZKSQd0lc
 q8ofvlqNksGz4XIQx0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140157

On 9/14/26 12:12 PM, Xin Liu wrote:
> The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
> I2C3 for USB Type-C port 0. Describe the retimer and route typec0
> through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.
> 
> Supply the PS8830 from the existing vreg_rtmr0_* rails and remove
> their stale "Left unused" annotation.
> 
> The FSUSB42 SBU mux chip is present on the PCB but with all signal
> lines unconnected (NC), so remove the fsusb42 node and its pinctrl
> group. The chip is retained as a hardware fallback: should the PS8830's
> SBU path encounter issues, the FSUSB42 can be activated with a simple
> rework, avoiding a full board respin.
> 
> Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +&i2c3 {
> +	clock-frequency = <400000>;
> +	status = "okay";

In case you need to resend, please add a \n before 'status'

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
