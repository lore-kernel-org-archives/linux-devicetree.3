Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714362;
	b=ECUQM46UC851PXhY1hN9KfnauVDrYVb67+RnaDRPIyRG039IaR2ilIAF+x9XtegL20dm
	 8rnG5Q7x5ufXLkqtr6yjnOWOHuKoYd3M/6Z9iF/3C72on0gEjOf/UCBDtk2jvyvhknDyX
	 I5wJv0KrRoSWH+RFBpwYNvyb9eMLP5dN+8Lornx8QAQvJ5CSuFQZzNfhDaf0qxpa50Xxw
	 WpQFWB76i8bpIaUFs60ncIPzwh272YSegi/kVhkTqfdLY416Pg9vjEREx9kDPJ7y1BRZe
	 Z3f63y5i1RHAd4w3/TCC5Sf+R2SbKNFjedUvKi5iuyZ5VAE333LHDqa8UtmJTpPyF4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d9QHHcFfpRjmiOA2EOzjqJMr/IIGvSYy+UhP+4kYREE=;
	b=XELwKaUnhNzCYeFZo3pETpMciU0tpLWiIFP34jzZTohFjC2HP6EmuCws/p7+e/4F0ZYx
	 fSkXweRPw9joojA0rfl6X7mRoMoGGBTp73a/Lnv4NzHlUWS1qeJW84ueCv2hVMy1l03+g
	 Q21U0hQ19faH1GzxCB+2PgDIkRY47pGIgTiRL46h/YCgM0N3gYOkYauLZ43pp0E4IEtUv
	 UAJ7mLlAbZjiiqx4ZHxjyNzwMMh00ylPUleFbemk4UKkbTGBEO+VX5OROnu0+MZQ2E5Wr
	 Exr6NTAi7C2/tNejRc2YvJvZ68EsjJ9kbbXqbj9RktscNE4AwtpJzfuAGeg/BV2laYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldwzgPvB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tz83se3p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B49606A327
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 17:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B49606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldwzgPvB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tz83se3p
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQGc73g596658
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 17:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9QHHcFfpRjmiOA2EOzjqJMr/IIGvSYy+UhP+4kYREE=; b=ldwzgPvBGBcqnftN
	Xv8RY/jQgo8lMmw/5jLTZ+/bVcLP32F9M6jjF9LdRKDrJb6uzqkmNWaHvupCMJsH
	JmhftRmaAsNWOnzfz1ZKUlqP9g/Qe+ad270462y8rRxR+zesePSW2hSroXTNfCOT
	li4Q1ErkLIwM8i4pxc/NgMV1P/5ijGastp8S+UB32IBh5qosjSRTXoSNg3Cg09EM
	Tfz+hsOKRVWb88LsAf+zAZ0l2fk8YlV/3ql+A2mJH5tdwnyqXgQcI3QiB9A+iHes
	9f8xpI+R/NzLJhALop5oIr4BD37HuDJAVwLIx+8ttNGvK9falD9/gzStjnzA7ZRt
	y0I7bw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf907ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 17:32:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f053f95aadso61166735ad.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795714361; x=1796319161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9QHHcFfpRjmiOA2EOzjqJMr/IIGvSYy+UhP+4kYREE=;
        b=Tz83se3p38C1v0D89CwewiTgagEy0CFroaeyOzdVtjWd9kUHUCFODHhFnD6liO09Bj
         xdSZ+1+WBFpu38kYr+5/v5BoTJvQtZbzT46kKM9qDRPvXrm/hJe5UddeQrqexcWbDgUs
         UanBdtWuygWMxaCT8xca8v35mMw4MPHwPl9xTdWYXpg0HgVJWEnXhQDW7NE4cuYHEmdq
         SGXzEO0/UI7kp8JtBHoJJ5tzgcLYaPZ5c6a84zmIL1anOTPomay8oHQrZiqA6MulRWYo
         prAAVJy6SE/+BcvCYT3hTjCa1Ew5SqB331gl5+3I4vtEHeYT/o1T2VZuEMFN0001GwGJ
         XF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714361; x=1796319161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9QHHcFfpRjmiOA2EOzjqJMr/IIGvSYy+UhP+4kYREE=;
        b=IldwyfLl0tYgMgORUYfFP8NwNS83Ne3IldF7gBvdhrgDRyCR/+GP7Boqw/wXFkNKmb
         djr2BsaANGzE0ZPUuvuvJYa91Pxsi+t7kyeu81a2BWu/aOd/rRhYtUpy4zmrSUsEW1HH
         LI6tDUBTPIlgVHjRoEYmAyYNJ3OBXHRoX6i2njIhufIW3+KU+sdW9HdTXuB8c5VolF6e
         8najQQtw9OLtR7N+okKsbauY5Ilp1VelHViz/9CKOkD9+1aYzqa9Ly21Ny+6xAYOnST4
         DmqRNq/uWyFnUhKRN2+Z+E2d4zdhmNPO1+IZx1lSEBKgW3hubXJNYHHC454vASEjdDkL
         WaqA==
X-Forwarded-Encrypted: i=1; AL+hErH6wh1lYo4vmrPi1/VUmje8mB93B5UzxwcQHcLrED/I7Go7gZpcNYY2mCU8O9ESqV42+mD+6Jgvfe3h@vger.kernel.org
X-Gm-Message-State: APuU4Z/WDGIG/mcQyBD7vGRD3lPl7tix50sX1rDS89nN7tw1oZdZQrOY
	zDvI64yqVPDDtyxHJXgimT65G0/fJB3YAuW24Hz9WyB9yzooeZI6CBaFSjBqGAHKR7XL9YEqOBr
	ueouR054Lp/bng0XDLETbTW+b0lUWIGmSfxgArSFi4mr9jqSoGKryUUgrerADp6Dl
X-Gm-Gg: AZFdTZfiqA4MqO5wsFZjCjmQJaDWh+owEjNVA+zXoxun4afWA8vg8XjGMXu9cycu8Rw
	QBNLouUeyd1CSlBNrI7eRfgJi/YZ4/FJ1siSXfWZ4yXuOUHol03g51rmeMDxft1HfchULzaiVzO
	EKLaDr8j4FxiUqymBJyyTJvy03fproR/AIGZgaJDZhbj9I2C1S4duSYU9ZDbw39jAJRYBTQ5aFp
	dUqRZ/ou7jfdqmunqNMBl+5ENaWbMbulIkW0QZOcdrV6kq/bt13/yKsr3BaPeK2e3QcfS81vy75
	fQUWea7IF+GNFd0t/xk9V3frO03XG5HS/BiK8IwECs7oSTJ34qzjetPnGRjAOt5zXlGk5eTMWR+
	hv1+aCspmCK+ZAX0654c9jKJZJGmVzBq38Ko+vhSR7hZf53MN6SLAiXU5O6ActaEHilO2bRiWgW
	uUXAVl8xyKejL3LKXN366WWHGk/ZM5fWtMQ9U9LkkU
X-Received: by 2002:a17:902:e551:b0:2ed:ff4a:6d21 with SMTP id d9443c01a7336-2f03f1beef6mr213757925ad.73.1795714361056;
        Thu, 26 Nov 2026 09:32:41 -0800 (PST)
X-Received: by 2002:a17:902:e551:b0:2ed:ff4a:6d21 with SMTP id d9443c01a7336-2f03f1beef6mr213757755ad.73.1795714360588;
        Thu, 26 Nov 2026 09:32:40 -0800 (PST)
Received: from [192.168.1.8] ([122.177.242.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b8a43768sm49779685ad.31.2026.11.26.09.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 09:32:39 -0800 (PST)
Message-ID: <e01e6db6-9581-4003-b874-bb0a49bc9b8e@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 23:02:34 +0530
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
Subject: Re: [PATCH v5 08/11] usb: dwc3: qcom: Restore VBUS override after
 system resume
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        peter.chen@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vbl5K-bAqUaM-lZ_eNw4nF3OmfjW4BCa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX2BEq9UcepFff
 02cRviDno11Ga4uh0QoR/CB9Xql8RHf1PJjVfVLCEQBjPzqNU81zZzlqafp7FdEZ58Gy+nS6ok5
 tr+71iuHfL9raynUwutcaglNHNhnyyw21Jo1vWT094igZNf0HupybUlU7dZPeZ/b/KbVNhX1vFA
 3ATyFE+dXr1A2mFOoLWAe5hACDm24QiEmbJXiV8wKdDnhnQlC/xAO1A92vTow13EL/giYmMoYL0
 pPD5FGM5HB06cSAesBZpQu/OJAqUyoe0+iqmjMZOmFfdvSuNvs2DNfOTrxLYF2CkhZEVQaPHZ4s
 Os9ClzNGIMR8Wm2KMB6v9sqU5uE94G2WgxB+5FSgGHMSxmQIQ14eoiR4ibG7i5n7TLmk9Gpph+q
 eUmUUWFsSEpUHxeI4qJ0S6mdA0RZuJfDxw6Dv11ETwi1aEOGLYxkYFbm4UKK84vktXmOx9NAfOZ
 R02GuLE+7bmmZRFuybA==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b086d39 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=EbDk/eETi6Q6sYbTlnF7GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JdB8cOfk_NMNDU_cp-YA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfXz3Y41WthCo75
 eUO91C2pi+I8uwWbdZAtXDMu6vQ0ai36KyKM4dVPAQd1Svo4E7W39GZsXgJMErPpDRrIQAOVGAK
 bdj6Ox3c5FZk6bj1cz/IN7LPhnIqNj8=
X-Proofpoint-GUID: vbl5K-bAqUaM-lZ_eNw4nF3OmfjW4BCa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260068



On 11/23/2026 4:17 PM, Faisal Hassan wrote:
> The controller reset on system resume returns the Qscratch registers to
> their power-on defaults, which clears the VBUS valid override that was
> set up for device mode. Without it the PHY does not see VBUS and the
> gadget fails to enumerate after resume.
> 
> Re-enable the override after resume when the controller is not in host
> mode.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 8e8d7e59c6d5..50fca06c83d4 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -457,6 +457,14 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>   				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
>   	}
>   
> +	/*
> +	 * The reset above returned Qscratch to its power-on defaults, so
> +	 * restore the VBUS valid override set up for device mode.
> +	 */
> +	if (qcom->power_lost_in_suspend && !PMSG_IS_AUTO(msg) &&
> +	    !dwc3_qcom_is_host(qcom))
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
>   	qcom->is_suspended = false;
>   
>   	return 0;

