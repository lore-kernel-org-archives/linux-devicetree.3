Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2B9360EE1
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783922029; cv=none; b=faVhN9WoVgvjCFXdgzHdO13kTB0nWXqFfWBsTxN1LdWsK0QptWpgZcHQuCBaFniuENgvEm36qcrscomJRdcjkWg/5vA+/TXlqLyorV5nMKErqxbzaDjDu1t0asBZ8IaFYXterCkkXT5N64s8Iwoms6frwPbTotZspflxnBC1/QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783922029; c=relaxed/simple;
	bh=CBNzd4b4CuEfF2oBe8C69ZGM92jDCQh/5ebA7XMBxt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTN6yUunq9/q+aYMuEteiTCCFUwiWJHpj2T5JWNf8LN7tOg3jOKZu0R91W7sk4JhXe+fP19xZhpuGh5o2EHPGcaJarG6khAU87OfL7mwkfGfihtbKL+kofVi6dD4xXU6vQ7jzpV7wJD6lvzEWcSNEg2Zn58tQ5pCDPjBh0d9WiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EkBfB4zj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnJBtS8+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EkBfB4zj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnJBtS8+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3AXn3137039
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xxYALtCRQn2rR6VAzJLApMBLItQAsRmuuR+Ks9gEj2Q=; b=EkBfB4zjYtqoVFRi
	hvVB8K+pZU4XsQmsMV4drnJZWywKygyXXUVGURFDQWOp9ZsVIL0SPGWnOmwfvqZr
	BxYgBzrQtnVpQPzB4+0kDS/AXag3ppHsSeSW5IYKj/3thaLGMGd4Df8L3lHk6eOQ
	m0m1w6mGjn1PCel7d7BNcwI6/4Q5thsL6e1SXUMmh4CUPSGkUBGkILtBQIPCG1OJ
	EYCmVC0a+A/HeFqNWW6cMELFg7mz5b5phJoDNyrqAhSD3Cldi7I71T1bAyrkVIde
	9EJ4jrW+QCLSbUQQDVcAnyN++qrN/QEeCDgQRAAWCC+Plgrh1XBsBKZQByvXVRvS
	UZfjbg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe914hg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:53:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso2466650a12.0
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 22:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783922026; x=1784526826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xxYALtCRQn2rR6VAzJLApMBLItQAsRmuuR+Ks9gEj2Q=;
        b=VnJBtS8+GkAOMNadEmLEgcl3yJSWk18ILbHWMhcRrrCSOv5ZdVjbJ74ufkuwRXOEp+
         KeD8tbSyUnftfHbdKtjwk+OhvCR4GHQofAfXOngOFHm36Zgyb1m3AetcXThMC6bSgDGz
         2GjLDXpxl5tpCNuf8g8idPbjnKXTaBAQTIFtyYRLaAqFN0/Zt5Q+iEyzlv7+KOb3YUcr
         BvNWV/OSE6ucuoXJn8EoVnYI1y/msri32qL273qRV92M6icDuDlMoY1+k62i/CktYZyx
         Vt0jCSqi/5zoUGOZ0wuDgpothxZbEhLJ9A7DnDPjP65BSB1inPsgS7Co43mmQLtYNsdr
         lp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922026; x=1784526826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxYALtCRQn2rR6VAzJLApMBLItQAsRmuuR+Ks9gEj2Q=;
        b=QF33gVeaKHOFhxTsdiV0771IcnLGEbE8x5+W1Ixhv9H8i0syvyS+NSmWDeMzEy3Ofm
         x8CO7aWGKZyvvI8EJNQnWzybx0p6uj7eZg/zvJ1AxKJexqql4oKRhO0BYKZDykuZTRFa
         uQ7JEiGEGPxFM+nXo1LOjY/oU+Fl5Cjy+XgaE6nhtrIM9CJwTjB+2Nc66UlL99iSTgp6
         M4jI2OlIvNghYDZaPOBGG+qhsHEeS8xe2xuFy02Puind4Y6mXvca26raQ+RP5yVGyw8U
         tvuPxGFDXkYEPegkaYrcpGpS9bXgGPTnTq4X6Yh35NRkGURU9ojOGf1aJJroNqRJEcfK
         NYVA==
X-Forwarded-Encrypted: i=1; AHgh+Rrt6SfzwlpJXpWWx5Mcec/iaB6N8Ov8wHNnQjlCo5r7e6poW570rF7dRfzaaqDVajATP6dmaIohg/EW@vger.kernel.org
X-Gm-Message-State: AOJu0YwzGZ1cRQVgQerlQccRSEIRSCpN6jw5vJlfhhag/lbAzuyU6p8p
	Fz4aV376b9VbAW+G+0LUa15AUanIM+vrOuRPWg1oTs6YrLelvQHWyiLM+pPx/+RytGztrDtH+4S
	WUp/2gMRfhxH6NAJYL6aJfOEqkW0YlL7EquQJmTYkRFz8h+kbDeDi7CDn61SqFDzr
X-Gm-Gg: AfdE7ck0Ut3kwqi0dwNErWQwpo5FlLBXFfok7WM9UXliMte7/+hn3Uh2Nti+oSx61ZD
	jGMS6KQK+QtbOwrysDh0jF3m4t+lEKH7109j6Oap6hSH8p4bL3GClCfR618/L81jE1wrHMGWdkV
	IvPH0jB3Qe5R5LpZB81exMH8YtlStq/ECtNOd2yuxqJmXoxMvAM4dl9Q9hgIS5qlMxXRByQ92e7
	O9k8hElscWhvFcjugVNoi0b/0DKHUrXyvdAv7YXhlB1OndBWhJEKdW5+pbAQWcnMmeXwO4cSCqA
	Y08MnWz4ATPuCevqIZEBhkS14qdoLMTlemBdiO+eT9YNfcx6w6ifJDZVmCv8tajLv4z2n0mj4po
	VIENNdi0nGFA6iG+uvBDRbkGeboE6g2EW1vfYmhdYtn0i
X-Received: by 2002:a05:6a20:3d11:b0:3bd:4698:e7c4 with SMTP id adf61e73a8af0-3c110b166e1mr8007170637.42.1783922026057;
        Sun, 12 Jul 2026 22:53:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d11:b0:3bd:4698:e7c4 with SMTP id adf61e73a8af0-3c110b166e1mr8007156637.42.1783922025614;
        Sun, 12 Jul 2026 22:53:45 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm66569596eec.10.2026.07.12.22.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 22:53:45 -0700 (PDT)
Message-ID: <d2c537cd-081a-4a89-b74a-76b8424ae84a@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:23:38 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/11] : media: iris: Migrate iommus to iris sub nodes
To: Daniel J Blueman <daniel@quora.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <CAMVG2stqOscN2CB5Uq4qVvb3vXOze35-JzqH4GpS8z4R2dr+Mw@mail.gmail.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <CAMVG2stqOscN2CB5Uq4qVvb3vXOze35-JzqH4GpS8z4R2dr+Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a547d6b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=KFtyBvXnAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8
 a=CFlqIJIDefiTY8DqsWkA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1OSBTYWx0ZWRfX862gqS1P+sQU
 sOdURavV952VeBrX64pDN61kBriT/yH49p2wHeVjU4Oh8k+tzkxFP2zgZqcVhkmERDhO4LXQxXe
 bPUJdZx6c6sWnR6a6stomponYh6GpSQ=
X-Proofpoint-GUID: 2o0Wy7wAQMAlXY-IB2QE5-S_nXXjTe24
X-Proofpoint-ORIG-GUID: 2o0Wy7wAQMAlXY-IB2QE5-S_nXXjTe24
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1OSBTYWx0ZWRfX+H9LgvgH90aB
 uvfmh9p/8OfIkI6QZFvUcUljd77aqxPcaugyy7LM5j+DWWv/Ow0NMKwSh/TIbPrylL+Xuqho60Z
 mHyE5Mq+I69QSgD/JsOuosmYiGaVh38cfmGhejOTIVmZA7JdES7IbYwvTbXmyG26MqdRii5ppit
 yoewO45YMBtpA2fraMWxd/uYR8DAv+7/r6HuAgBlLOQEXSfHTjfhMh4h5UWEIWacqthtP0jj4m9
 wnCa27NfAMPClxjWJqsXI+sVjG88y+CGR/1xvQ+EMUBpMHGFyXv3zOQLPaETSFPLZtHtp0raMcc
 3zO2AdvsYlp3lq3lCgCvi0/S/K8YdboFtwUG69qiPNj5o/YmoQy/sAtJwmtEulR6NRDfkbnt3dQ
 xyGxY/hP8u4S2NrXUR39qCPgwTciGjl1wUA097JLiB0nAMlHRQbdDYwtyVakwWsmgVDT7/oGEW3
 bPHJ/qWir9sj9zPDbnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130059


On 7/12/2026 5:21 PM, Daniel J Blueman wrote:
> On Thu, 9 Jul 2026 at 20:35, Vikash Garodia
> <vikash.garodia@oss.qualcomm.com> wrote:
>> VPU hardwares have a limitation where VPU streams are associated with
>> dedicated addressable address range, as illustrated below
> ...
>> Mapping a stream outside its expected range can cause unintended
>> behavior, including device crashes, as reported at:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> ...
>> To address this limitation, the subset of stream/s are now represented as
>> sub nodes, so that they can be associated to the respective addressable
>> range.
> 
> Amazing work Vikash and team! This patch series applied on 7.2-rc2
> resolves spontaneous rebooting with parallel streams eg when opening
> https://ui.com in one or more browser tabs, resolving this platform
> usability blocker. As such, this is absolutely relevant for -stable.
> 
> Tested-by: Daniel J Blueman <daniel@quora.org>
> 

Appreciate your efforts in trying out this. Also it took a while to 
formalize the design.

Stable - Yes, but the driver handling have gone through a lot, and i am 
quite confident :( , that the series would not apply to stable.

As Bryan is suggesting, we can think of applying your suggested 
workaround to stable, and pick the sub node design to mainline and 
forward. Open for suggestions here, if anyone have anything better.

Regards,
Vikash

> Thanks again,
>    Dan

