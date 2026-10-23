Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751098;
	b=pSGCKY1mQoMZv2CbZdaGO3CkWA/pXL8HfPuYN8ala0CjjLIJ9E1fox2TTqS+XEfpyr92
	 +IyMFMjSOT1OtJaG+n8lgANGY5AABwsILy4MNNG6/FBhhNrvv8etuC8YzsBBRlbqN4rGD
	 UCiAswUmeJM9jP8fEizhHh020h2PtbafWulhjw9WdfKIU7PQzo5J/aliZP5Qfn3rp1yt2
	 vylD7dUZKZ0YTOJwIUFNEHMZi8JRO+Iub61sp8vFO9uKcnc/8pw41bqGxGuEcTZB/itn7
	 6zu/V4I7tYDk/dwb8W4vec7kvRp2kKpxoQKQYrhnboOpuCeKgUHSDhuXE6iXYLiepJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+B2mDtrqC9JVYUAg7RACbqAsn+KTkTYip4BH54T3Ik4=;
	b=oLMlOtw/p/ZOz0IRDFnHFpheIjJnLUJ8yNfdMV795Fm28ssYHD2X/qHpT7wt355giK6g
	 Xzc20TNSkAt83nqQffX3DYazQ2UgBR5syTIEc1lj8bBmlwS6pTAjXBlzhLJpwqovpOqgG
	 dLp7Sqo/x060R5OhSrynMFW+bjaxR/TMHnIaV1ymrQ0GUDJKUFu2Y0e9UjZktGPh2Oft7
	 R607kGd0z8rUfrzCbtTKH7TAc26vkRGJPSvKoYr2MbwG47FAp9xGsnjIPeOmZt0YphD+5
	 M6MNhceowTqMLyFBJZBkWA/vOTIyq9GQ15wvjN6eH73wHnS4/4CNRFNqKVJj8EziaEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bTUuZtHO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OmA8qeZp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A369606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A369606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bTUuZtHO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OmA8qeZp
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAQqu1597889
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+B2mDtrqC9JVYUAg7RACbqAsn+KTkTYip4BH54T3Ik4=; b=bTUuZtHO9M0g+BSr
	G5I5Vs1nJcoQXL6/nL9gEGFKEcdTkN8+9AJkuDD/AL9NE6zVEftceZebyzrzjDV0
	CZHNWNwRdz9wKQIY7Usn+KElNRC3wR0hzHNKLCYiVx7BwPoJz3QyAPPAwj1D0Dsy
	Oem136dReW1uXyHbBxuco0022N+Nquycx67AJG7cLZI+Ah11DTpS1FZZKzil5qil
	JBtrRIiPqedM89aW4F2gux7W7deTC4dR4jwwRiyGU8z4Lrncs4eAT5HlNfakId8Y
	wxiBknlCjijP3xtnzX0uVMPfovSwbfFFDTNMvJaQqSnzfINiU2uSC/f1DXoL/zd7
	A6lwfA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms36ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:24:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e629c7b16so12487185a.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792751096; x=1793355896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+B2mDtrqC9JVYUAg7RACbqAsn+KTkTYip4BH54T3Ik4=;
        b=OmA8qeZpW9NBuSD3La8dOUKOOTLN/NHVqOAsiQirQ5GZMJ2X5yJaA73AoqX9cnH4UY
         +MOGyNT/pNAdQvIBv9ZCFm8q7m/R/yEoeyAVQiHXFXa9QysnDwkTi6w0FrHD9YeonePT
         i0qIClY/YtzWtLYRET2yQkWhmoBvTZr8l19jYSZaHVdS3a/nZgIX1uSbY7qoeV8r+tI7
         5nqAtABizWV8Suv6Sm/QYYiv7gRkbrE8kTKjPhws9ymiJzuoTAnO10Ho21rVznfEpZI/
         BEyObOW+Jr+2wPbClz1mCRHBH3tcA0p65bk6aS5tFYACXoO2c2EGnSqdF0J+7YCBsfFV
         2xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751096; x=1793355896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+B2mDtrqC9JVYUAg7RACbqAsn+KTkTYip4BH54T3Ik4=;
        b=F/+alElFvY+OA9oRn7QBVDK9nBmdit0VLnhbUGb+FVSYe9WKlP2wiKo4qhVGg2e+TX
         mTdDPx20H3pSRlPuKx1+QlPTSo/DjTBZerakSFlxCejf+zY74aqZFOKEYkNrHn8+Xojx
         wVVmr4DQjykWrjWXHBDE/KGNvcVwLrGPw2fg24aYMLSIEWm6CGdXpcCYbm8w6dqHCS4J
         /eUP9VtHsBB7ydUn82ma61Q7ocD2jDAhX4+OdyX80yVt3FTlh6IGlZHjwtUKG+Pq3M3I
         l26fpNQmXrgjApvwQFekDxHE2r4shtphgGq5UPp0+r7q/1dcW3sph+KyTgJ5KOTTucvL
         AxfA==
X-Forwarded-Encrypted: i=1; AKwUvBy+OV7ymfacGNp7NcKBKq06JBcoi1tc/Ky8K7szdj/f4wNqY8EDZjAippAV6AoQMVF+HhFE4PZZuxq/@vger.kernel.org
X-Gm-Message-State: AFq9FYKw06okfb7H3NeB4qnsMrVDfQ5TXVT4TyvKyIbcfU3Om+yywS5i
	ffPXsxxjTJGcnikPSwsCvI9OmbauuELFty2KVlU/jYXpCRgmBOv7UYVqfhFIyowr2WljQyT/w52
	yekN5n1iS2tD6N50T7Mrr6wqWSb9aV43m3qKETYYLZQUs/PmVMN/oWqRdtFjRW9O/
X-Gm-Gg: AYBFou1LE8GsAbl12RXeCCs+mGVc5hanpgb7I/6cJy3SJbh+2EDc1zLXOvOTESeFa5o
	HcVQ/sqk73C6kRGDsM+zb3jU59oZvzZrsI/nm0CJ7QwC09T/wBZxAlxaLIG4ZJIAJwFDm9hfFRQ
	4nmsa/+pHWkwY8X+Nv8WzGlNiGr4bX8towjaj8tW0DXbzupVzL0V/T9MQwZUB9fRrh1ST4htSrZ
	2BOsMTLm5qFCsLVuuD2OW/mV8V8ABOvbXj6eB4nr0nsVNMKio6Bmo2XHPYBaT+Ok1DOIlLVfrmB
	2yksEt+Q2XMRU9goUsH1PxIiOOu/l0O/mEpysRMB+NuShQetgQdDbXkcDpKD9A+WZey10WdJN7Q
	wHeBcFyDDU9DMLpUoTsLC2g==
X-Received: by 2002:ae9:e507:0:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f6fa10fabmr305995385a.5.1792751096010;
        Fri, 23 Oct 2026 03:24:56 -0700 (PDT)
X-Received: by 2002:ae9:e507:0:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f6fa10fabmr305991785a.5.1792751095492;
        Fri, 23 Oct 2026 03:24:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b07f4977sm34567266b.31.2026.10.23.03.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:24:54 -0700 (PDT)
Message-ID: <2755bde3-a969-4ec2-9106-38eb1a69f43a@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:24:50 +0200
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
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: kaanapali-mtp: Enable USB
 headset and Type-C accessory mode
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-4-b5ae8e6083c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-4-b5ae8e6083c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX9eSERTt/rBCG
 nr+PDCQLFXcUbtgODk4BMe5CU9XCMcfn614rfVQqRKC8jQFez7mGFcdr2Ny9QTeJWaaOaE1CdOi
 VqKqRz2k6rcbk3eG4Ib5FQ0nu2Ght9LYPx6xRxbonCudMuoRtLb4yN0EyPqK9GM+r2yKYhHIZUZ
 UaGrYt+93Xox7TdNauYSg51JC3KbC41dC3mzc8SPZWGI2P2IgN0/gA8nY/4N0C8oIgtOvP4YoYe
 L31+NWEadNXZwPXflKlwoIG417InkIYnWYNwNxrDTBb8QRQCDcNM2LrQRqx6Z7JY809LWrmPlNs
 6gwN2XfOfPSD6k5w+Tn/8igOV2BPUzTwD143LGlFU2otqxWJUyXZjlGBG3y3SyXihZN4WUNexoy
 A0RqI30nVOYoa1S2XMVCxOsZsj1gyF+mwHqZISgQhDrkB1bznrGaKb/w88eCdz4NJK1yTKUt6eu
 vmxq38+jvwH286VwDFw==
X-Proofpoint-GUID: -vSWtBERVhSUStFQ65c5r3Yq3Uktc4rB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX5566/oO24C1t
 NEt5r5dvResrO2tm0GaWREij7NPtTpLRk2YuRdsA/q5H1HasZiRXNSzP9wNTc8NLUmt6QrPCp6U
 aLstBeizFFuyIYIE1YUmipNctsXhvAs=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb35f8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vVu4xHXG5oYAYlB2ed4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: -vSWtBERVhSUStFQ65c5r3Yq3Uktc4rB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230040

On 10/22/26 11:49 AM, Balaji Kalkonda wrote:
> MTP does not have audio jack connected and relies on USB mux (WCD9395).
> Add necessary nodes for proper audio headset support along with USB
> Type-C accessory mode and orientation.
> 
> Set the I2C bus clock frequency to 100 kHz for the WCD9395 USBSS mux.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
