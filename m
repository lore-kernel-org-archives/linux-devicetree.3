Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FC83822A8
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678693; cv=none; b=KySG5DQP8JB6I28n0VueaStQ50iQN+DZVRLEBM7bfaoeseIBQ+Mq10Ysg/mELYCs4GHufwxvS0j6AMUbVVtzzMrFeJ6VNSqFnmDK1vso5YUr5p6aEvswNJf0F6la0z/jq1KS5u8ZfvW438N1hrGvAXPgF/+RUt9AOQSSrXipc34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678693; c=relaxed/simple;
	bh=M3JrCCNYq/LsQQXow9xyNwFjb3Bny+ZEYI9GFCKwa4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iTQf3mOwgftgV2jIxp+50xA4p58itfNXujtXU5YqgH1T6M+2fN6eA8ZPdmvGV+xGT3Q+PLYszv8MO+TvAop5/AxUj5EsDj1MYs35jJ19wlaHDZLuQ/wY98HFO1FenQmFWs6k8Daeoe0jkRw1s4cslHasvzC/yVXgw1kUsKTdjYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TyCV0cQ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvZNrNhl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TyCV0cQ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvZNrNhl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K79FuX1598282
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2oCc4X5gfbIoFNXE8Bk9ftZY5NhIpmxBruq4adzXl6o=; b=TyCV0cQ0p7JR9Jdm
	lRMzYXbDDJRO8q51VJtAauzJd32hveMutEZSNQBJtXkYljOVEsJy9RwVV3t8S7+0
	awB9nXONzDtSc6PlfRFj/6VP+DbtsCwJKyh5a1+2vuN/xe1kCpH5cuO2gI786nuV
	+8DqG2AXJxRSKch7f4fKIZBTYZvsj6asRKzAy6ngQkZo/Y5MKfIDZ+HQWfVXoQCA
	HXXlO/IP/RPQsV66fZs5RSLvbbNhLFZkr/IXIUZoWoRV6ipOLTSvItTRKhyBxVIp
	/fDAgTroik9LQ/szwnVsmpyHpKa3kP/rdjkVlLrIb3YW5W9IzJ3T3yGc9P9UCWmz
	+hK3fg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgngwcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:51:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d076d88so5967891cf.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 02:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776678690; x=1777283490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2oCc4X5gfbIoFNXE8Bk9ftZY5NhIpmxBruq4adzXl6o=;
        b=OvZNrNhlcTQuQaAylnU5He2AR7qa/dEMGWOe3xpm2TjBbXh/UpJtmN3cqV+0fglIbi
         OPxOvNh2o6I85IExRngrejdzAXXKyON++LjkXk/UduV9Hq/1bOUNvxU8OmcFWdGkv6zz
         GFc0bwKfUgCV/XQz6DokYW+LS6PBGaKtZtaJv8DtMiU2OrRjlrekHFPY1jvilj+GH2AW
         dPl3vgU+lyuQtCPNFHoHS4kpRePqJ5XoNLDRx4bVzPf1r6WtdSUEab+EE7CCMdbLt366
         IWPk605/brIH3XMRgzOgSkxf4+oNTpNRddUP45fXbCZC+t9immqhU4ise14Pv9wmWBVs
         Q5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776678690; x=1777283490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2oCc4X5gfbIoFNXE8Bk9ftZY5NhIpmxBruq4adzXl6o=;
        b=GnmnslcUolocbZxYpQ0Ra/1jRzGZRlsGuBCF09oFcVGSZOb83gVs1iSR1AC72k2cK2
         YP1s9tfr/gwJekxOGgi5L8fMBlYV4UqMWCEph9A8ONeCekT/z9Aiq4GlVERhPBSvPLs1
         7MHWypEa8fcCvCCp9hQ8nPhobkx+2fXvlMaJi7VM8AAsv/0QGNriBK+86eUWqPIWco8s
         SEB2pE+9tw2D9gmvmnJChx/lAtPNfENDNwoGQ98cU8u4UpdCXhY3s1xaqfyEjoGRbVyn
         Em3osvG1OpY0OfYaUcV0gzcDZNTQxPOpDwItcMcJ2CAUsI4C7uW6UAqpwoQcI/8YqUtO
         /9UQ==
X-Forwarded-Encrypted: i=1; AFNElJ9R/J/AnxHz4YDvZa9YpwzuDM0RGk2JwKIyl+9AH5VsgvYeAv5f6g2DNIC4OTrZNbSOOKiN375MnQPE@vger.kernel.org
X-Gm-Message-State: AOJu0YwmHhf3G9ZSaij4hFR2ti2sG748inCoUEnTxT7hzLpY+JbTeifu
	TVw8pbGusH1Ro1iyVc4ZupSqIdiAkIxCYbcuXOhDDcKM+sWys3mlcLGRXYuf5V1G0aJ6qoajRMn
	d2mFSGzzZwdCIudUzn25f1cFaEjiZrbszuuxw4Hl5ZTfGA6EkiQeuBN2FhaDHOLMn
X-Gm-Gg: AeBDies9b48rjXU1C3kfdVpfBiNXIcRnb4V2jeHlzIMo5K5MxH/OPeQVtiIzpk6U2C1
	+fsxvZM490f4nDmqhC7LICIR2uxMDCTn3cUNYYvGhNoX3o51C4I3gnTT67dtJRBkU2lRCjRyyrm
	LizMUY7rJwQ1odhHprAoa/u3VRisjmMUERoKFmk01sLvpiXAxSZLc0MsZXS4CoWa1l43uoCaGoh
	Ln0azT7BXye2ORjkmwDNvdRzg8CfVReX1CWuSBfiLwr1OFUHa8GwyWUHbYPmlSKVXekgqSntqt9
	8IBhniIDQ6mZEbiBGwB6+K2Q4aNlxHhu2k5MopVyiDaH/kaZG/7CnIXkUxVBlsUR/lAuewdPY0x
	DfDhvyZXZtE++wjXb7nre0EYCNIuuMflhahlIanxOIeZncoIeaqEoxyPnh2/MdE/bXMZ3MSGTP6
	Y3p5vfI0B8IwkLbg==
X-Received: by 2002:a05:622a:4cce:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e3683910cmr118259431cf.2.1776678690266;
        Mon, 20 Apr 2026 02:51:30 -0700 (PDT)
X-Received: by 2002:a05:622a:4cce:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e3683910cmr118259211cf.2.1776678689761;
        Mon, 20 Apr 2026 02:51:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451211091sm348953866b.5.2026.04.20.02.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 02:51:28 -0700 (PDT)
Message-ID: <5b4b68df-593c-41b4-a0af-4a59b10faee0@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:51:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] spi: qcom-qspi: Fix incomplete error handling in
 runtime PM
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
 <20260420-spi-nor-v3-2-7de325a29010@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-spi-nor-v3-2-7de325a29010@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D-ZfpzxKwLhnzhbd5x7QAZ4GyCIbQL-z
X-Proofpoint-GUID: D-ZfpzxKwLhnzhbd5x7QAZ4GyCIbQL-z
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e5f723 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=SDBIUcquJ5ihQ-it0pQA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NSBTYWx0ZWRfX+I3lI6GLV1/Q
 /g9a5JY2Z/3zBmoCyot5qGlYqjl+MJLaljyUE8l2eLqxVnQ+cc4caCJvkLO8GrZIiM945tIUjdc
 g0u0lsxtXbxgHHRQBU/RY1L8KnYG4s8dnx+eT+zuj87zGn349Bf7dzwwGzqD1pBRsou5pqvqpPm
 kLrJz7tKV5kX/pRk0sqFt3JLJL1v0fBRuXzlfui4xK71frY9fTwMUWno7GR2+rS6vWR82hKKT85
 HKlXi50y02x6gJg99HuRogdKU62fjcAI/t7os5g5LhISDotDKE016iugtxXLVIF4G8yl1HC8lFC
 2mdUi3h7RxKEvSWmYPVvX8N++qyqHCXj8SBqWIu5uLRPJZ52COjhCaykSnHqt0V7rTzNLKX36/9
 iRkXFoyUNsDjRPiTRGGez3FDzZ0Po8hSs2SlZlDFupkoNhznjmZEdM7h29xz+o766+uqIOklxRO
 pICpfYsK49Ddc4816yQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200095

On 4/20/26 8:12 AM, Viken Dadhaniya wrote:
> The runtime PM functions had incomplete error handling that could leave the
> system in an inconsistent state. If any operation failed midway through
> suspend or resume, some resources would be left in the wrong state while
> others were already changed, leading to potential clock/power imbalances.
> 
> Reorder the suspend/resume sequences to avoid brownout risk by ensuring the
> performance state is set appropriately before clocks are enabled and clocks
> are disabled before dropping the performance state.
> 
> Fix by adding proper error checking for all operations and using goto-based
> cleanup to ensure all successfully acquired resources are properly released
> on any error.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
