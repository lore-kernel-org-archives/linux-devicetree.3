Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0343914FD
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678352; cv=none; b=CLpGAtm7ZhzJk4HRPgEYU1eldIes79s553Qy88qh+ZcFZI4KS3GbhxWfN66kDCNPYDVgk388XmWzZfy0JcyvaSjSmgFdYzDGzbB+sAPG/7Dg9lCl1xPNOquHg3BI7KnNFJs2K+7atjbKLqjDGppxm4WBp6fuaSt1zPZObRDX6pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678352; c=relaxed/simple;
	bh=VZM+J9wy2pF1ST1d8Dr81X7N9+uaPGz8QDcnICd3iqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MnBa8cHC5Q06HwLMxXB6EfTnYdThPz1meD0ji1TQnKLopSnJh0dWJ/olKkn1KsJmSyWxCLMpQIGRt0Sa/GMU5Ls1PGwyq087aEl/4vnINyLeRikT9z/LaewGKL/RcLU7BqVAxhqfthiZZc/RAhqMu77jvCdrGtWwfbVGTJyLfTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QiSCxw1Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FrXINIWw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QiSCxw1Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FrXINIWw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K6UKBJ1041266
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/hxKOQR8knJ33ZpSAKDOQasdw+ZOshf56WwdR5BKl0=; b=QiSCxw1ZmDjeAXwj
	lw9HTuS8A+MxK8UXjJg+IVbXrqfH5eYBalisABqBkjHRr5E2NXpPkojblhXPAxNE
	SE/OyzBuLp8b++Z+fCJ1D/ymAkqPXvAu+jEAHyYO6fTsQi030qmnRpiNtdRvHDjq
	60T/qekIn5V5Yetm4gm7/GpNLPuSUVhhPdXudLwxkU2yppoLYHpCVf8DWu28ftIh
	EakKcyGW9zb7j51IrmXew1QUcpZsgv8CLGknYUyzXUATFQRPp+D9kOOuMR14KYlu
	DbjYLYwdFFQoMKYpHv+c6ebMYOf12QUy1RAA+dmhEvuqJFCGNMhoGzKYHDfRUFFX
	Pn2h2g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b75edu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:45:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5d7f4b63so2171861cf.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776678350; x=1777283150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u/hxKOQR8knJ33ZpSAKDOQasdw+ZOshf56WwdR5BKl0=;
        b=FrXINIWwsLbLOtguFGHECQ7TbPeWmMXm3uEH6+FWz4jWnMuilJNVgv4DZy4N+5hQBn
         lNXHkQSdzr9NviUr+GNGhIgh34JFbaZIKBv8owprQj7lTm9G1Q4UjXNUkVvXXYFIbGJC
         8YE+XuiB1k9XWFVG4W9xcenSVoBUgsCc2vr9p1GlvZD7vZiyNagi18hdXG8+vjR6QxWa
         ilzeZyez+4vOK3pRj0nbsV2+lbByQMMsRO/i3FVMm9lipYdkHVXYDUX8HdgL13ajGvF2
         WhiWIsleyQRLeWYqV5/YnL2T4znSfp9b4cb6IGCgwT9puFgnd26o6xypftq2aTyjuFyc
         wh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776678350; x=1777283150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/hxKOQR8knJ33ZpSAKDOQasdw+ZOshf56WwdR5BKl0=;
        b=SDgyBKgAElvO0aOZovJ/1QGmPQXIbHOLKCgjR1jxeWGy3zPckmIhCFdbRqBDsqopvb
         zgTcNb6+xsoNwXJeTWOLLtZ0ybstpH7Ntc3kq/2uJqX+BEOX4h9h3FYj+8scfm/rpvIw
         wsi2ZynIVl+E8rnjiMoUrTBi0L7Vbjct9hN9GBT0jxb91VNksOB7MTwzP3mMx4MBArbI
         u/cYvdQiFvYjXjGWjKZ23pxTn236O/KJ4DcutuLg9XhxGbkbRPg5mjJLVfAbHo5XQ+b4
         iaGLgU3+H3GDPmC3/YgJ0rgF441bapIwo4e2Z3w+YjW70QydO9dEyCF5xjJe7FXycMN4
         l6dg==
X-Forwarded-Encrypted: i=1; AFNElJ88854S9MihDmA2S9HjDCSDHE/yatzzoMWyurZLmdYu7SwqWS8PZhs0XK8kCMx1ywVpd9P1NTUOXtSR@vger.kernel.org
X-Gm-Message-State: AOJu0YyQU6C4UqBR7ei3DiwBmpqb54/v/Jw/STrH8O4bgeW27ohTHhvB
	drnC8r/Sp4dXaTYcqGimCQ7HBJbqyYlgHRBacYp7G7UDYOQTla9pUnxXcve4ramyxeOJ3H1wVsz
	PJ6OCT8YOnPA6ky2Zm56uaoQ42UHSMhhauoZsZmPKJP5mJrJ0yzg7pJ1ALwF4DjkM
X-Gm-Gg: AeBDiesJLfSRhXiN1/iRoQ7xWjH8mvdJ4h30/5bbBpfIiwTaT7xgvquT8c/gpNKA7kB
	HRuU12IvGJm4vqfdQq1fzHAVnmeBB26E/BzbzHYjehZ4TOCmFk0giU3AyRG4K7nmri/TiNy339X
	FiNQCc1MgbaOfn5ysS8hanGzMR3AuzcS07qCEpEtguPB5kzT0JBqm2c4mnIW/lXqhYQCp20nDti
	WndM0HsQfFelQL+EQ+aovgpeqB0TT4WTCQ8Cdq1ZcapCl+Tvm/Pie/2Y5OLDyjHH6XtUwXYJ3Yo
	vS0YlNa+DNNEBEmoxE9OIWwFu+aOOvN44MUEHXRimrfqz0I5C76wmGWhQYaGmKJJwYC4tWLH2jz
	/0ygm97YNVNHXl0LXD8LFH07sD/6WacQENeezeUiPKWGr4TFsig4pPyNGrDEpW3GQpztbB8OE4N
	SKUZ944z45ZlrZ/A==
X-Received: by 2002:ac8:5e4b:0:b0:50d:aa1f:68be with SMTP id d75a77b69052e-50e36c1a80emr125781211cf.4.1776678349590;
        Mon, 20 Apr 2026 02:45:49 -0700 (PDT)
X-Received: by 2002:ac8:5e4b:0:b0:50d:aa1f:68be with SMTP id d75a77b69052e-50e36c1a80emr125781011cf.4.1776678349072;
        Mon, 20 Apr 2026 02:45:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121109csm334359466b.6.2026.04.20.02.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 02:45:48 -0700 (PDT)
Message-ID: <26b34f92-c336-43b3-8054-9de3379ce01a@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:45:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: sc7180: Add QSPI memory
 interconnect path
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-7-7de325a29010@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-spi-nor-v3-7-7de325a29010@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e5f5ce cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Qfo_qk6ajyruwQE2hCAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NCBTYWx0ZWRfX+o7/jf/cxaP4
 1uc7sDhGeze68UB+JUL24Xr6CFYGodJt7sGOQ1U1u6CEmmZ7NPvqt1NAEB5FQSlWY2pA+KaO03g
 4W6yhl21S94ph4urosCFj+mTdnjc/sYYAkguCWZ354OIe/DMlQXYkbaYpzrr9XJvxj9rYLv7GO5
 OdeTfnnCUDqslGl9+m1gwJ/rED8d9dfSq0HWztkiRlC4ZKjrBzNkV5/Gad8xKSSp0bI23un6h0J
 cMv9+Z8p9ssLBney+aW90kG3tjMDPKSBg1hwT8X9TNPH3Hsz1WBWThNhRvt+kjBdqIaQIxYo3Hf
 2RmuOCa0m6k2YuXtycSYj4Su6Q8WfnRSc7YQsSJgC9pWkOM4+HYvQouQ87dCt1FMG+kUg7IPhpS
 D9CkgUbk+ft/38xwsxAAYR9wbkQF2GYF9DY1nBsJ6OOLJZEcB0XbaNmGh11sS+TvqLS72hbbTJL
 u3y8/njhhVkJ8Y19jIg==
X-Proofpoint-GUID: KtyaKKeh7etR1KuVmhidKjEkwI7PjPdV
X-Proofpoint-ORIG-GUID: KtyaKKeh7etR1KuVmhidKjEkwI7PjPdV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200094

On 4/20/26 8:12 AM, Viken Dadhaniya wrote:
> Add the missing QSPI-to-memory interconnect path alongside the existing
> configuration path. Without this path, the interconnect framework cannot
> correctly vote for the bandwidth required by QSPI DMA data transfers.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
