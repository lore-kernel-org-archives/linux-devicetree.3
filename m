Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5B5244687
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710423; cv=none; b=BvUlG6CiMPa2TXt0mS2dFVCXSFNjJOzPiNJGuvjSBp10GJ+78vIHm4sDUrO2nHn4+vgJ9iXuEw5y6XoeMxT2m4gqAPS1s3R+2NhZsXYVeydwXChM8TxuRlki6arExnQb80tefcCRKdASVD8KNrBdO1Z1ICLyOwHI/F6fpNJAKbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710423; c=relaxed/simple;
	bh=M5cCa1iVKpsWVGIuNxKOhrB+F0tmxzUPYJVS5X/XoiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNxno14+V4s+EYK1OCc8g9+fo+l59yfTomU701ZmEKkaFBqNXxVaQdPhm+mhh21vFlUVi/QOw2WFWywt7ZLqtMHE/AEZgzMLpZt3seISGvk1Bw1WsOt7x4VcAIdpZqnDnaDjKxFH3PK3FnkwoDVdNaBrWhfIWpSVd6afZi1xA/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVu2TdCw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPNs3zsm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVu2TdCw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPNs3zsm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NP2F1738416
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W/bHTWn5095hiiBCyKIFRDLmQgURSRR/pfBthFMkhQQ=; b=mVu2TdCwyS19rlFR
	6KlZTMiAW9qLp7Tm8Q8PAy3Tta71wOgGy+PhpIEGDNQ57zkvyM7m7J0SyB/X7TEo
	kfVNjzbrAbB8m6dbRnYuo9ikIANZm4oMbaMyv+HGdZDfn4WrieJxL4a+VqotNKvQ
	lyNMoTY5Z6fbg7T6LaXmYyHOvitggSVbExHHTy1cc60x7ZZZ4o5Ip+unu5Fwrjo9
	H/MyS6L+6UQf1ccUag9VazIYxW1o8T+aEiTHAtRj3LzJ19H9rNMMYqAQEjYHJmF9
	ACeP7jnZ7uXel6aZU7Uy8LaMVp/mhUiQsaIYzKhLHQzL9cqsaX/KyvILRiZPQWxX
	7F0UpQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cmfxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:20:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c9960cf96cso17428555ad.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782710421; x=1783315221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/bHTWn5095hiiBCyKIFRDLmQgURSRR/pfBthFMkhQQ=;
        b=gPNs3zsmnraYadSsiOs7//hZhexN4DI/PqfURHI9mPQK6NL5zGMzu2rSOelSIbWs9z
         7Mu5ZQov8eZwh6SJgbd1/XRVhd8jO17PrqS48QV91r2B+LWbjlo9wnbMh4kHmUtuQh0w
         sni4MUJMPuWLwsWHdyd3Bdrql6EjGTbh2bV5UqGNkbFe/5X1dfdTGBPsOTw7RKsb0qpU
         x8XcQWuQMRuBMHqGmg8aNzzXJdzBqlye/b6rSMDQ+KKO67OW+JWDNrJ7zoLG+5DKKXLS
         YKVT3LTRhDKBgIDFHzI7+HaysL6Zm15NaShTa+q4sI2bU7nrJ///72zjY/yYwcNzNyUd
         lSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710421; x=1783315221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/bHTWn5095hiiBCyKIFRDLmQgURSRR/pfBthFMkhQQ=;
        b=D5vpP3hqdanysYC+kLphIZFjKCfYSV/vZ1YATd6+t9I+tOmVqeToMl95Q9BCuPqLpf
         KPlbIbpZUiCs6y4w1G9LhQOhggfa3NpQSQilHkf+8dyPhmBr30ROYSSsPto7ap+HE5OZ
         DbrnCOIX7X9tDuyoqxCYkJcIcf34u5WsVQ+niYsDJKYfZE/SIhqZq8WAsnGCbgUzpFke
         Tk97lOhXD+iYsSxmOCw9vJVWB8tsmOh4uUNGDp0oJoX2dx65cGZaQinBVMlYGGpMmjaF
         OM7N5rd/Opd4rPWkkHRPcy4D+rYIqw/msonvwg70qpHhy9Zb6GRd8LcWWR8R4CwlQJDw
         s8gg==
X-Forwarded-Encrypted: i=1; AHgh+RpkONfR/9F4TirZykpcV+DaY/TfzENykwH6YOkUJODK5JYDxmV87HkLzBynYE2tT5elFrDcCT4xff0u@vger.kernel.org
X-Gm-Message-State: AOJu0YyNKF594l48VBZ9/tVd6UvSCmCARYaQ9UHdoX7LF+XGV5T0SHah
	NiGXPygS1UP3zYFPoxbqganJSy8qe0YYpm9V3ptrTAHCzYPYCHnzo8aNyBE/F2vaOvBZIxO+KLf
	jviB1wPUeo4r0AUuC8bJROdhpppf7YYQ2r4YPolM2CwsUIwQtEBmr3CjvmSOGIU5M
X-Gm-Gg: AfdE7cnfAoT3vgmYzAp8QnT/PkKiRUjQNPghM0h/6ofAKiO6hRvO5u6nRk4iZuGWIZw
	H2Yd5UmjTEYTHjcVWkfSQskFI7fDfJgSqSs0UMC+a5CR8T0yZsJFLvTiX4dg2G/Y43mP5CO4Gps
	KpcIeDivdtdtoJUS3aH8JPbnysu2q1oAwNwtUyBY/ZoCmA4ToKG8EDRy4NrliiAq+25+ihWiETe
	D6JRNy+MT7W2ZglB4PIRdNoWBY99CqLETISSKpOZ1O/0dmO7E0COcihRdRHSaezXJOmzRLFXnfI
	HgWtAUl8zHRtGVObrbezD49Bnyckc2Wyazqf1DgZS0GiPHfQnlpa7yGAwUw1t4vf3upcrY8P/Br
	9OXImyc96dC5Wkz9qOsus+EJ5/sMtBPF3lZB5lg==
X-Received: by 2002:a17:902:f644:b0:2c8:e13a:f23a with SMTP id d9443c01a7336-2c8e13af2bdmr84668855ad.28.1782710420716;
        Sun, 28 Jun 2026 22:20:20 -0700 (PDT)
X-Received: by 2002:a17:902:f644:b0:2c8:e13a:f23a with SMTP id d9443c01a7336-2c8e13af2bdmr84668375ad.28.1782710420014;
        Sun, 28 Jun 2026 22:20:20 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9b3ca81bcsm36277785ad.82.2026.06.28.22.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:20:19 -0700 (PDT)
Message-ID: <78abffc7-3b3b-4fed-9d9b-cfa9fa3778cc@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:49:41 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add Audio Core clock controller support on
 Qualcomm Shikra SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-3-7ee6b5f2d928@oss.qualcomm.com>
 <191c4b05-7d66-4338-8321-ebc593379f73@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <191c4b05-7d66-4338-8321-ebc593379f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a420095 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Rk4DF2lalsHHy-5JHz8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX3HUzSIzKPJhX
 /fb9Jzs/4NEgc7rEOumbkCnLCjEBuu01ZkOgvgjFB1Py6Oxj1QhWcr0rMjtE5Q4XmezmBLue/wv
 KyF9Y2cYL0KEfIP9XU9wU44DuT5oWvM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MyBTYWx0ZWRfX/91hjnvgz9PM
 tl37tKTu8FnKp53Fzl9xteA2a1/o6OOXxk0uOIEbJq3GEu7cXexutH95mF1OJG3W2ltbrYZx3Pq
 bjBkpZ8OkjLa9JuEI7GMBxo2ZmlMLR5wda94g2lYw+PPgNTRAv/d78dw7Qi2nbIj51prF4x7ZEH
 YHD+MJU3B6KbsjFXBdNoKEkUYJjgf/dVeSzIbXz3STqb+jiZ+rMLn0FXPynFEkMVwSR8rQN7On7
 7+xMLLgu1Vm174c6VF20kKOo6Qpge52qoqd4Sok2P5BW6Eb1OJx+Lg091JEQzrMAV6ANicJgyqt
 JFI0D0UhUYF0wSTEz7Zwcl/KWTdH9OHQvASd33/amLVOnpECvTkO/OQaGfRU54ImSqpbFKtUZcL
 OyQBm8ir0VbqqXiGrESGF/kjZ+PvSrbh/155Li3LnQA1TGc1jwGMeiSNd2S1xWwNa3ElLOqTgWe
 I3qLZk2yBsKuqAcKFBA==
X-Proofpoint-GUID: X_sAQJqVgnJL9e9DLOGP_kH6IPGN7G3V
X-Proofpoint-ORIG-GUID: X_sAQJqVgnJL9e9DLOGP_kH6IPGN7G3V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290043



On 11-06-2026 04:57 pm, Konrad Dybcio wrote:
> On 6/5/26 1:26 PM, Imran Shaik wrote:
>> Add support for Audio Core Clock Controller (AUDIOCORECC) on Qualcomm
>> Shikra SoC. The  AUDIOCORECC clocks and resets support differs based on
>> Audio subsystem enablement. In the CQM variant, both clocks and resets
>> are required as Audio is on APPS, while in the CQS variant only reset
>> control is required since Audio is handled on Modem. Handle these
>> requirements using variant specific compatibles.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static const struct qcom_reset_map audio_core_cc_shikra_resets[] = {
>> +	[AUDIO_CORE_CSR_RX_SWR_CGCR] = { 0x1c },
>> +	[AUDIO_CORE_CSR_TX_SWR_CGCR] = { 0x30 },
> 

My bad, this also should be controlling the BIT(1) only from SW side, 
similar to existing drivers. I will update in the next series.

> So these are not "real resets", but for the sake of existing art, we
> can keep pretending they are
> 
> bit 1 is HW_CTL (1->hw controlled) and bit 0 is taken into account only
> if 1 is cleared
> 
> existing drivers toggle the HW_CTRL bit (meaning it's an
> maybe-on/surely-on switch rather than off/on).. do we need to rectify
> that somehow?
> 

No changes are needed to the existing logic, as Audio SW only needs to 
control the HW_CTL bit.

By default (PoR), HW_CTL is asserted, so the CGCRs are controlled by 
hardware. For the audio use case, where HW gating isn’t required, 
software de-asserts HW_CTL, after which control shifts to bit 0 (set to 
1 by default).

Thanks,
Imran
