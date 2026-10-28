Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190472;
	b=LDCQduQMArJhIWFbeGSMMM42EZhK0BQ/EznLqRxQfAteSM77Acp8eGqzbEkHIc8KJnYI
	 ko87ohRx3gVJ1dP11k2rdxLx5Mv4Pg8Xzp82lquJ6g9GgVzVhnLQE8+q7SJqse9rj8kXU
	 gh4n+7ViugmZJHho8VnLV0256cve+22U4gVi8q1PS+okccnCOtlyz5PV25sejkTwV8aUd
	 UmQ73bR2+cBpbB+Nsqq8/nMlMaR/r1S+AjXi2Xloix950ICsR5MZKIbnUqz5ZqfiEtKJG
	 YCkokNfx81sqUzRFgTmKSK45ZSq78jruptzID5pByed51efwclA8ONRvPwoAxGo4ewg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190472;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VSigMjbRxPUPU+y0wEyfEBMw1dQi5WR+SlH5DUgFnsY=;
	b=uwmPFCUE6lEd6F/OOFpGPGd+ekCDPBq/RdTXMk+QLjQHSPT6f8ApA9krU3rZaZLKziHO
	 6CvEyY+NBBYqKjma9PR4fnI8bc1aD6WNJzxrp/d8KNn8yC21c342GsyfvorZxDheUqOJZ
	 JSEBCsLZ54PJFFelVsGkfWsJNhGps95xDaQ/yUaT40ddK0LsnTHie8jEPXrF9C4t/vmSN
	 99ibrFrTifD5YaTUTmRs898qKgql+LUWXmbQOnVvXaLVsGi7M66EpuhhX+0eNTN1cdPKD
	 xq/u/z1po08IZRV6rOvkUXWDs+ml5fjmphxznYP+BPZKNlxH1vaPQT7Aq5C/CFQG0dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nTzg8f1k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Xni/YqZW";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5A3606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5A3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nTzg8f1k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xni/YqZW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe3SH3704172
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSigMjbRxPUPU+y0wEyfEBMw1dQi5WR+SlH5DUgFnsY=; b=nTzg8f1k4cwxhaKx
	5fu60NUzGPhHwKZW1SnkcNjFlFcn5JydUt+hiRDcvRhDGu7StCF+gzSjUBLfP2nT
	O1w8Tfb4ueSXu9PIPwHj6TuSymEjfmMZwR3acfNEiQL44XYiRTAYXMQdKC8yz++X
	ORtxSuVofP6Gp3Tda8nP/hRxrQ2HhfSkjkajIuC5SwxD9LTLaz/l30Y8+irpTGAF
	3pllMWGSTWMBXwr1cgfbu1Y+SyHq+3mp+VQS6q5zpZVP/u+Kofo8ovBMaI5I0yU8
	Z9QgZZzaifv8pUUZmS+unC49ntSZu1qins2SF21iJ5+dm2dWrK/p/xJEaC+l4S2s
	qV7E+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy71457n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:27:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e629c7b16so20468485a.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190470; x=1793795270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSigMjbRxPUPU+y0wEyfEBMw1dQi5WR+SlH5DUgFnsY=;
        b=Xni/YqZWlbkz34hpOf74UkWLJ0sry1b2YV+t0hCJsBVVasakAfKlXIfVeGb5r8509k
         P15D8QYwQAPCFW2ZSWAknXXFE+vXJq7Rh+RQ4xyZFjEkWaOCKZ1xV5uklUwIh6BFU+IZ
         iySB1GwMl6+Ri8XwPtHJnd/Vi2o+1zu8X3pjlFWT9GAjmHqHBTPQkt5x8qixmCq91c2N
         q92hQLH81D3KnfU458ntQxde7+cLekoM0lHCZ/Hxm6yGho97f06AXUbMyyY7G6mgvRCk
         tizEzf4DbrXwWlaxlY1fhEQFt8CFH+vct21u/KmJu01fs2b43r4wkTfVuaGKyDDLeiGS
         xSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190470; x=1793795270;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSigMjbRxPUPU+y0wEyfEBMw1dQi5WR+SlH5DUgFnsY=;
        b=aVhs6SGywbe8Me9k5xMxl8U609TyHQLPJ5N5H0XyhiAbYZHSBvT4AyxdPZQzkedp28
         eiHWANajScHM0uPz1UC3jXrc1WIfE32bUpnzEmtLbjDCpEKYSz9lMhVq/oavvdmLi/Xe
         rL9Vjui4MXGtMJDNZOphcIrwVdOBqLJjlnsId1VafbH7t68VMF3rOtoA3Aq/jUT7Y5NC
         Ss9l3E5jF5b/Vx2SfzXExgh2xGx6X1lDPwFZRWDiyst0c+D+T2cfdJeIKvfAuL3YJwST
         28Mi3rqyeBfaFQL3VMfRVPTwiB+BHsUdYc9kxdpOqQeuLrQKGfPBHnhquqUVvmi+k6z3
         Ouqg==
X-Forwarded-Encrypted: i=1; AKwUvByAKQKNix32VQZ+S421J3BCLE7ks3jT0/44e4Uc/uGgoqsmsooVrAV49wtoVONWtbEIINC/0zuBkdmW@vger.kernel.org
X-Gm-Message-State: AFq9FYI5HdCfZ1EOWiS5XhZE85+p3C2zSU9PVURRn6pNCTS3xqDXA2Ga
	O1iif53DL+cqu+TyIEWGgdt3nmkqmG3IC1if3OjQgt2uWE5plo4nE1/hAqNOQddmzXbLe6kvg0W
	9GRN45nXPnnPrQ+uVxDhd6Zft+Q+0h5SU8wuN7ZqKOrba+4m7dZ6UA8yAn8B+dg4o
X-Gm-Gg: AYBFou21R50YQrW48uKcka4ADWBtW0ZlNkf1nWOfmIPjbr7ml7SA9mq5zx9/fLAVrmW
	XgRy6LA4e+TVoX6dd/D6Q9/3nTdp0esGHDqLn7LXH/OMFOtZD1XhZCAIcybhTQOL5lg0hJ4gE7P
	XeaRfOGhVymhGKBK+k9xaUE7UAh+zJdxrk8UJdGZPWDK/BMgFhfZB83wpivzfq5EW7Nfu9p7bx+
	8PiOa33HhBypWrefFflk3zDLGRyXZfJyz3kyD7UYyIKieMeJ4cPXo9gbJMAT98xHkbVienx2myF
	kVug7MnJWejjttFkQAlf9gWTPIcf8SFUm6odjHjj3gUZIzQxOyn8ycHAyVaWIoVTcKz93TXXhbz
	BQ/Q4PB7El23errvbMKqSCKEG/MFT5ugyum/tHwG+ig6INFoJiaD8/tD1dsxGmc5D1VzmKt4=
X-Received: by 2002:a05:620a:6d4d:b0:93f:211f:7ba4 with SMTP id af79cd13be357-94408d629aamr300070385a.5.1793190469729;
        Wed, 28 Oct 2026 05:27:49 -0700 (PDT)
X-Received: by 2002:a05:620a:6d4d:b0:93f:211f:7ba4 with SMTP id af79cd13be357-94408d629aamr300065285a.5.1793190469165;
        Wed, 28 Oct 2026 05:27:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd350b52sm594839066b.7.2026.10.28.05.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:27:46 -0700 (PDT)
Message-ID: <b4f6fe92-6d72-4987-8b87-b66e28e4678d@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:27:42 +0100
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
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: glymur: Add UFS nodes
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20261028-glymur_ufs_qcb_enablement-v5-0-09cda5e3bab3@oss.qualcomm.com>
 <20261028-glymur_ufs_qcb_enablement-v5-1-09cda5e3bab3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-glymur_ufs_qcb_enablement-v5-1-09cda5e3bab3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX57qB++Krx+QT
 u2e2UN/0a5ME3g4+XXGXGtxQ4GWehuirdIqmsdbLGFvBpK0KN1D/ZOHA2PycfON/zM3wNWvduQJ
 VLgs1niLZAz7tmR8NQz4His2ihzIz3OwAXAgWFsrlYNL8Bbfyn0S7GjJjFdZIN+Y/8kBIv26CIz
 nVKwCF2J9yV6tmnSsxS5ofcUf26nzLpTr3FcQUjA4w9KZczUeVflfvC+I0PxpMOtqtl+4c64r6D
 ofOXJ07AOXBTV5/sy0uWAcGA6CdYrtkcjhYrqU7mUO+bxbfx4f4xN9Qwi6DyqtuUbli+0rsEPHO
 gHFUxKPav6qLQcZAJQZ0t9zUZ00FlR+Rtx9uhiY8rf5/7wnBZoWpfWJ8OmNAYubHY+gwKbR8TtW
 ZS8i4uaV6JiEJdTxfTEC6ifwQexn4TWDRS/+mGaeDNp3IxL9//kbfV1+4u0Xj0ms+7imHIL7d9c
 nxbQctqtmx7MLIFR58Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0OSBTYWx0ZWRfX3MnWIfsEdmUY
 HntY5crZM5YV8EOJdM7aA+ayVIfCaa9ejAKIEZqQkxsQEod6umx5XLSjThPxdy0Bdjrmgj/YiaE
 Ei8WZXooU/+QwTlMejCud33JI5kixn8=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1ea46 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hjj8zCE6y8JCqPeTDGYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: vx3pXrAEtnKjAdHT8BedbtoVx-ruayk8
X-Proofpoint-ORIG-GUID: vx3pXrAEtnKjAdHT8BedbtoVx-ruayk8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280049

On 10/28/26 1:24 PM, Pradeep P V K wrote:
> Add UFS PHY and UFS host controller nodes for Glymur SoC.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
