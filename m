Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979423;
	b=z4YdfRywdmFJkSL/6VKKOFXTbdOU3SiJ2xA+KiK7AbIAcki1TtcxHybxcpG5quBHOJUY
	 osoNcxW8evoQSxA8HDGYzNwYZR6jh+BSCqgPccEto2ViCk3xq7krBTMCOMI5zmNb3xo+E
	 35KHDCV2DdoctHID+b/gB+TT3SPH99ZI7YyVoSDqnaJ9IGSbjfCcy4SXI/n840HOjhJGp
	 8J6vXC/klJoLoEJgdaGQuv3M0LU5hzH5anB182Dj4t1AhG/H4flbXwKpbr3v4HksrW7wr
	 pYTnlRBiEHZzMLIVPqm6ghg5XRbbJPW3xuPyDabgHN5U54TA79lryg4vWigsqbRB5mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979423;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VJPbv36653KOfKZeFGCpjz0HFLZBmi/kchakmWeIL9I=;
	b=4voCnnswLbPtt1EdeUNh70FLWgV7GQoTfX2qlGnZInR/6/kMQvkfPMudXqw9Va//w95o
	 26YZQkWqKK1duWU6ML+hg4CKgenUDgeX4HKJ4Smn7FUr3hen2ViHYUhU3Zn5y3iWWJ5GV
	 c1jD0QpjiDRakX71UJrx58ZJUpxcod2gtRlJKcvcpPlcMD5fLyNW8ocdni9PI7bFRgBDD
	 7iVFWBb/+mc2U18WAXcG+wsPA0z2SsZx6kQ377MVrNuGkbw5SK2X8BuyBkaEp3AAzsdo2
	 kdnqRR67MSfrq5UY13YxDm8jSPU7M5BNNsWZMK0lr1wW2u4GhrkHmK1KGFaAkJhoPYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iH8FpQjS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Lut6m/sq";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBD8606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDBD8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iH8FpQjS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lut6m/sq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxYj2453598
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VJPbv36653KOfKZeFGCpjz0HFLZBmi/kchakmWeIL9I=; b=iH8FpQjSkDiKN+0M
	rbuRh5Qd4N/Gsdx4qwq2CLYk3mH7xk5AKaoRIs0PNP3jPypQNvgd+yCJZIGOOxkW
	JQb9+lJNGE2BEnZgM281IzqiyLuxMf9qiHD79uKL3HXPyG6ZVxcfuA+Dyudt89Vw
	hlzvQJ4git28FyumPujKdRFwYv6A7g/Q44NAZVMy0h/pE0bZ239HiDbgYFS2Zhbe
	Ak++psQrMn4rbpnWJQNbIzaHi5s231+l9i1MVR8N1P6AqzDZvJv0m8MlQgul+bOA
	1GJNQ/qkn2e6Gzzz7zjsdbnE/FCyqkoaKTo1uyWSnqr2jpLUePcjhWEkrEBUaX9V
	49FvLQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99aq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:23:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8bb1a7b0e52so420694b3a.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794979420; x=1795584220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJPbv36653KOfKZeFGCpjz0HFLZBmi/kchakmWeIL9I=;
        b=Lut6m/sqPm2xtmA47OOqHebqE1Ry4ydnlLVO49Fjiz8x1uz6aXRYDU2TYL1XddxM1x
         WYfmp4dt9zoqf1JFlwbuEybsrA0mtBi0efn2mP6L81uXMjiKelJEmumYJCaornbW7hEb
         FogI7dnASk8TqsHjsSX4nClR2cKpoFWhYkdTOimbFbh3rQB2O84GeCCUNZgyzBL5aCdc
         zTSl2/at/9Gij5CrDBbPEO/mW3C2gXSQZGKLO03ONG/BLdXZoS1OC3Q1BSl/otlCsy7X
         DCYCJgumUDidLKtOqyxVJCG2Fj4ishIuRuMW5ez19gpIeM7/G9PQ9kZzp35Yd2wEPlC+
         Cisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979420; x=1795584220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJPbv36653KOfKZeFGCpjz0HFLZBmi/kchakmWeIL9I=;
        b=FL9CcHS+F/76iDLaIv6MyqiCyZslYvIgssstpEXpxe6jB58p36M6Zx3sbiFOSMIi5L
         a+aKIyP+Is8/GNZsg0ohAuDLqVqRKm9dpFpWU4wb4vCKIzx5slu03VpRaw6PMF/x/qUM
         JL0WIP7483astBeHmsHM8OpwwM92adhsWxY9Td1j9YhWq5Rm6RgzHD4+4fbTx8fTHsHi
         duG7IWwvWWqVcsH3YbQmY6t07lBUZKHTg7j5cE7fOj52P8jcsdzss1Dyh4MnkpPEwNDn
         dxlnKSSASimkeAH76FEL3KoTMnE9+70tia70huABDyWNWV/8N+LiU75DVOrogUDntL45
         M7bw==
X-Gm-Message-State: APuU4Z9I4PV3Rdjte8okDdD4zbuWmFIaYtaOnYLyoBWP+XGd0Bp2qrFh
	s3FlS52t+7qYvhNHMRNCmdrPv9t2opBKq1JyFLt5344uXg7XTB6OXekCGPbfmIVles3FEdrg7M9
	CRKc6CWMODsnZ+ALS1BoRomb/4lzfuCr+yFl3vjoy5MGOrC5zzackLXsSUYc54BYUQc41R6EF
X-Gm-Gg: AYBFou358JXg99AgRZMdfXsRZW6zisX2gAMAuRM7hnotanIOYAQnI9/qjOwewLIiAQE
	AWRQxcp0DZOu1m7hznZNjyQjG79jUwdBg9Zvw+kmBfTSQ/myG4VYc3JZhXxhDkIzBlpwUxn+jxv
	3SQeW5CWRpFAycki3xEoT5l5H+EJedJiM9/V4acPuDNgPbVtIZI+iUC0u14KOu4+HsM6iRLfqvs
	UsJc66RdC5WiU2pFJMg4LleGQfC5eRenpf1UaSALsEobzozbS3129TEzyfzVMx1/1cBq7CFNcoI
	DuLnPM79AeDOM6UfxAD1rV8DA0LWqCQyNPbMcEeiUwpqnHRA2g/GThCpQ3VtYx6iXUmgF8G2Yz6
	GjzCh9jW92fcWWSs/KGZvwlIElHtOErkQwkkfF6QBRI/Ac4He+vLWJle5U5yaGWbWrR5RqY1HDE
	m68iovt1A+1A==
X-Received: by 2002:a05:6a00:3012:b0:8a0:6905:248 with SMTP id d2e1a72fcca58-8c5d101b672mr1184133b3a.3.1794979420513;
        Tue, 17 Nov 2026 21:23:40 -0800 (PST)
X-Received: by 2002:a05:6a00:3012:b0:8a0:6905:248 with SMTP id d2e1a72fcca58-8c5d101b672mr1184116b3a.3.1794979419989;
        Tue, 17 Nov 2026 21:23:39 -0800 (PST)
Received: from [10.152.203.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa2b3sm537485b3a.9.2026.11.17.21.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:23:39 -0800 (PST)
Message-ID: <c6077bb5-5a11-4547-a359-9a3a3b4445c0@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:53:36 +0530
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
Subject: Re: [PATCH ath-next 04/15] wifi: ath12k: add QMI support for extended
 firmware binary download
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-4-3f30fbc2bb69@oss.qualcomm.com>
 <sashiko-outbox-210823@kernel.org>
Content-Language: en-US
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-210823@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfXyDmNiu6IqU5R
 4qj5Gx3CYS81OJSUr7r5X4EJDj8zp1wbNyAdBlN6M+pItxdDfgQACAJCbl6uXNTBD7Oqln4YRLH
 U17OfOrQhMKPJgHAhtKa4iOxJYcMFyI=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd365d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ACHI5WYu6pcpcLLTPUAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX2zNKQbUovy1s
 qFyt9563A8JSpA444Dy8DwAyLfFfZhD7J0JlzwkLSggu3ZPb6To69+L+omiJnkiERr1bdYkGE82
 ZHr3M9eiyTQgnY1deg+eZ1qDm6VNiYRMlIublpu2ooxcfwv5W5uTgQipjpRRJx1mmjuS6Xk0DUW
 gz0OAxphgZN3kUzRWLP1xcstNKPmy51ctm02Kk8q5OyB9OGT/HweV3dOHFmv13zyikOTecyGCG2
 xtrUE/dhOMG+rcAxf17l8xHHSzyZW3XwBr3qW4FnapHNoyo9FuG2/6YOJWCrybviKkHeW+CqJad
 8vQ8GMl+CBcPRt/gIfSEfTOs+reYBvVcYtLZKPY4t8ahXHUKuAXhUc6xpDQSdu75AA/mF5SwDAl
 Dz0VYYzB4y7vQ5AowlzjGnMj7VpVhT9N2Q3dAO/0jcWZnbsVBwrwThZTuGsFM1Z+0Ps75iGZbDR
 9NjcCiA3JHRFw+OEZHg==
X-Proofpoint-ORIG-GUID: O0lHBSAPDTl7AlVhYJJyXEfz0oShT0GH
X-Proofpoint-GUID: O0lHBSAPDTl7AlVhYJJyXEfz0oShT0GH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180021



On 11/12/2026 2:37 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] wifi: ath12k: missing support check in
>    ath12k_qmi_request_target_cap()
> --
> 
> commit d06cd02bf95410a2331b0d3861ca5bf0baa15ac2
> Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> 
> wifi: ath12k: add QMI support for extended firmware binary download
> 
> This commit adds QMI support for the combined extended firmware binary
> download request (QMI_WLANFW_EXT_FW_BIN_DOWNLOAD_REQ_V01) and the
> mcss_ucode.bin image required by QCN9575.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>> index 69512b82aa3b3..3b60d624b0aa5 100644
>> --- a/drivers/net/wireless/ath/ath12k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> 
> [ ... ]
> 
>> @@ -3115,6 +3289,27 @@ int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
>>   		}
>>   	}
>>   
>> +	if (resp.ext_fw_bin_download_support_valid &&
>> +	    resp.ext_fw_bin_download_bitmap_valid) {
>> +		ab->qmi.ext_fw_bin_download_bitmap =
>> +			resp.ext_fw_bin_download_bitmap;
>> +		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi extended firmware bin download bitmap 0x%x\n",
>> +			   resp.ext_fw_bin_download_bitmap);
>> +
>> +		if (ab->qmi.ext_fw_bin_download_bitmap &
>> +		    ~QMI_WLANFW_EXT_FW_BIN_TYPE_HOST_SUPPORTED_MASK) {
>> +			ath12k_warn(ab, "Invalid ext_fw_bin_download_bitmap 0x%x, host-unsupported bits set\n",
>> +				    ab->qmi.ext_fw_bin_download_bitmap);
>> +			ret = -EINVAL;
>> +			goto out;
>> +		}
>> +		ab->qmi.ext_fw_bin_download_support = !!resp.ext_fw_bin_download_support;
>> +		ath12k_dbg(ab, ATH12K_DBG_QMI, "qmi extended firmware bin download supported\n");
>> +	} else {
>> +		ab->qmi.ext_fw_bin_download_support = false;
>> +		ab->qmi.ext_fw_bin_download_bitmap = 0;
>> +	}
> 
> [Severity: Medium]
> Should this condition also check resp.ext_fw_bin_download_support?
> 
> QMI_OPT_FLAG sets ext_fw_bin_download_support_valid whenever TLV 0x2B is
> present, even when ext_fw_bin_download_support is 0.  If firmware sends
> both TLVs with ext_fw_bin_download_support set to 0, this block still
> stores and validates ext_fw_bin_download_bitmap (failing target capability
> negotiation with -EINVAL if any unused bit is set) and logs that extended
> firmware binary download is supported.
> 
> Also, if ext_fw_bin_download_support is non-zero and
> ext_fw_bin_download_bitmap is 0, the mask check passes here and defers the
> failure until ath12k_qmi_wlanfw_ext_fw_bin_mem_info_send(), after regdb,
> board data, and calibration data have already been downloaded.
> 

This is a false positive, as the actual variable is guaranteed to be 
valid whenever _valid is true.
