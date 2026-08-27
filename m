Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5196F3451D6
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 06:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787812933; cv=none; b=AoNlMjEo1vSswo0Od7/v2uLcYy971YV933tz4SzCL8QAOp/LVIlMzKaWeXqEXvTvwYd3E5j33kiC50WVMzYD/kC5irypXWVm/3qB4m8xiWZtOY6ibbJwUaNjjC2YZwkZm9Liujk5NzBZq0X6SU1Sw9c+ycP+IIvdO0v5XeZH58k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787812933; c=relaxed/simple;
	bh=VpRfMjkDIVgIG1IpVnvWLbUY77m9BHwbtWthaup4Qr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2Orly+lRH3BUXCC1ez/g8fHBeNkzap0xhigIuHoxA+Qsv5g2VSjLlQUVP37mC9We9JUjUWvJv4GXSymU4jkFHk31I+WVtKDKHw7Twf+ojSJdCyBGa+FrQBQVyRgv6p0u6coRoWc9Dq9C3QZGo33VqCECRLR9GezSbHED2jCK0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxBIQfcR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLT9JVAM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxBIQfcR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLT9JVAM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6QxV93834575
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 06:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ShQA2gHtvOv/7C4MRutuVhaIXxmOVy4BCMu2y+jIWc=; b=LxBIQfcRVtlQdTrO
	UOJQyP34Uz5/HuqMwLc0TRaw9/nYqDj5/YaKBkc4CAryllu5s0jpz+LpkEgeU0b+
	M7ao4WkzbCSvIRL6VHELrNKYjXS8g9vEjalyqDHEk1TdJVmtUb9RRtZ2NEnEUpUx
	8b/4aQA4wrY4Pwq/9M0CpiZPofrYncG8HHAKHjqxCcHPxdGpyRdBWZ2D4orhxsy6
	IHxW5I7KPaWy4yoxlvAYKqmfHnJW3DCsNbkvsC/ZH98zeJiGj+IiDJLaTWc8OtG5
	JL6BzHqTB5ar3VGPYWw1xlcvATeYHdyxBlVEoiEm0LSnTRhORWghymSku2v/uTKl
	rRYkbw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbub2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 06:42:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c5810451so2123484a12.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 23:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787812931; x=1788417731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ShQA2gHtvOv/7C4MRutuVhaIXxmOVy4BCMu2y+jIWc=;
        b=MLT9JVAM+c7tmAbZa8q0+CvHdFGq/Ka6efIlpSbxJ7XfIqNvp77A646kjOW75vxhUj
         mW85svNTamDLRhRtFgnWsFNA/AS4zH0CSBEQdZutpy5b4jlpQJkXIhwBHM/H+t0H9SZ/
         SVSdYIqWauTXzTQWMgxP2xJRkSlBec5r/3HbubTGmJprkqOhtFUsJeK1Quq/rEb87BKt
         wW3DL1WaVz6wkHHIrjWqBOITVRUtaNnisOfa3bTjwVtqPuXWVcagKNVS7OXoG6hqVzzb
         DZhqaEWghbdWM8bnhM2q7YhNujTVPS7owUM+OE1276QCfsF2ZCyEbEUAMUDfVj+ioRmU
         h6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787812931; x=1788417731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ShQA2gHtvOv/7C4MRutuVhaIXxmOVy4BCMu2y+jIWc=;
        b=nSxl0amnCPxDnlgu+IS65HrxcSO4kEALlRDmf1f3kOndPicgwbWvOaPPyBnyIdVjnD
         8VDXS5YxpIfQeSx5p7bGh3PA7bRlBMxkiJ+eaT/it6rt5QP0sJWAhZHNUQj39DVR10yk
         0dAoRDC/Ev26wZ4jbRDxlNSqczUUkCXMChE/jZQ/Cz6SPACKDQXg5hjdeqYt77hqZBu3
         qltcEhIVNY+yajLG0F57Ti+ZFgnV4ejlXVX5PtxmgrCP67Xi1b+X5mykazZPhO0I4/jM
         hpcujCh0i2MPnFwj7x00w0qire7VLkXWWoKVhXz734S2/8ebkJQOtb1xR5cHhpvUz/Xp
         WAIg==
X-Forwarded-Encrypted: i=1; AHgh+Rqvl2vfb6cp6Vq+O61i9h+ZaJi930ehdqn7uGcPbPgo0LPc8pu7Fc2+85TJSUj3BopJnhtUY+RUB5sk@vger.kernel.org
X-Gm-Message-State: AFuF++k1Am9p/eBzeOg2sbMBZHz+c+U0JAI9nchjYsmsfJn5wICu+8iN
	8NsjGxUZ+QR1UqaiuInwazBPoeLk5eRux6r87ZuqAUWWiP7mbf3rITPPr8x3iTBbm7V3jwTvbDj
	cw9+TVMkePdDQwjp8PP0uhiWoyhJFIb5/lMvWp+Ddljtw5Vx3z+mLS2/BRPdEI/Kz
X-Gm-Gg: AR+sD13lGzNJ0YJIySX3AAHLcDO4HMtHAiq9iXv/tK7HkeNgcIwVqZ+jc/CTi12rChi
	inuE2z5eOWADxdVMi4d0GrI9VgIcQcWdxcJc7ksnCBSYWkb60XzfEgM815pJqUZ0TmvUvSCdgXi
	2f8EXpnqXj9z//3aGOeZxDop7ZPWihTlbkEB4fhYst+zkO1j/1AIzQMVfm2hh98+7tIMmq5EwrI
	twfO0E3RF23tMxGMUHPitv8rnJDuWU8BGw5uG3UgmjvlUXKnpwJna3K1mmuOxMhFtM+LAuK1GOY
	yNAzZWmYQiuOD2VsqAPATkvhAiiCq++MKJncB6EAdGOJtoffj8uEGd5Hi1ZXBu3Vba4NN6suG4S
	mIy3BMA9RfjXQp7e4kDyAV9kOZlk7NhQ=
X-Received: by 2002:a05:6a21:4593:b0:3bf:9b61:f7ae with SMTP id adf61e73a8af0-3cf8413dffdmr28629359637.14.1787812930911;
        Wed, 26 Aug 2026 23:42:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:4593:b0:3bf:9b61:f7ae with SMTP id adf61e73a8af0-3cf8413dffdmr28629279637.14.1787812930531;
        Wed, 26 Aug 2026 23:42:10 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1bec80fdesm1693669a12.24.2026.08.26.23.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 23:42:10 -0700 (PDT)
Message-ID: <167f6b2b-a838-4563-99b3-39ef8077ee9a@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 12:12:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE SDHC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-5-09271f583dc6@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-5-09271f583dc6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DdB2iSpRysZYRNv0RZginESZvZZT2AWh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA1NCBTYWx0ZWRfX34L0eItTSR7H
 0R5iG9TlT+vbzBQOeWHVYWQ2rkfu/2yLjOQI694ugtRNlbKInLZSvAzgn1RUNzCFgYT7vflUkmv
 4P5bfsP0sWlGmgLPGk7NTi4IOpvDXBY=
X-Proofpoint-GUID: DdB2iSpRysZYRNv0RZginESZvZZT2AWh
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8fdc43 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-W0wxAWcNmATYll7EfoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA1NCBTYWx0ZWRfXzLNHDwwc+bUF
 n+fqrNo7u1J45hSKH/WtuSihrBBkeso+caOuW8uHGo4l9T373kUsnlYk/qhF5ViTEqb/uGt4Do/
 HnvBAyQTpM6bgRFR6PVv/JBDmPhmrHHn+p0c9mljIKfwq+A0xn+7RNt+gvsMjQjZgpaqnc/ovlm
 lIgoh1kEh0LTyZZhDyatqqFxqFsM0kqSMrLRfWxPD8lnXAlmeRYOrttIbihczurWrnjKcOoS4DU
 CDrL1XsPGtmSQVam4wJpQT2cNJL+SwlzBsUTK3cRzh9ecXzPAEf/h6GshucZSbBk33Mk2sOiRYA
 CKtZYjGr7GFAISaWotc62iMh8fAQBxRUJOXe5ZqGWJK8EZrIHjNjAA99ND+Tn0MqFTQj5N32h3p
 gbeLIJC+iZcUSCyoizyplvVW8ciChcfXMiLnLOz6G2RFwhKiaBYfIQPcnLyBAP4lagSeKJW7EtA
 gtCbBdTTMavegfDT8vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270054

On 24-08-2026 01:17, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE SDHC device nodes for Monaco
> platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep

