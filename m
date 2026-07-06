Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035CD420E9F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330685; cv=none; b=bWGc/2KIPA4mg/fSVy72eltx6YuJW5vNxnviDAksF2PPM1H9cEXivDU6PFlUzKrRMfe68VCdJ9poIfMjkSfrlszINzjaG05QcQ2Iwpy2dbW4Lwh5WzBVkuQgdu5yPCC+cDUDGnGpU54Iuy49QNFxm3FRySRY9u0q0QbVIApR/IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330685; c=relaxed/simple;
	bh=Pj+ozva9T0fcwNSEKOkK2xdvTm9ebLUEPwBdOCPGS18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YE3L9Gv8eIA0iq/gDtqHa9cq+6/fJR9/MRwm4oWhu7R0kmTBfq1OInYgNZtfo/AH21y4VrSCc70rLzWp1okt5FVM7MxXQG3jDYfaHHU+xXEJxlynFAV5zOyyYS9Egzb1dtXhZY/LkReM0U1CCnTgJirXixeptHUjq6qwoKAGxnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMME+Egv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKSnJZH4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SMME+Egv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKSnJZH4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694E4u128078
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmvEo3pA7Pq8NfvYG3chpyYLUANHLsFRyacd45P4BwM=; b=SMME+EgvC39EFdP2
	bvUtHETUasD8CkHlv0Jqwax6ufpmJ3R8p0IP4CWInLPYJ34pAOcmIvOsqLmVwotX
	pDkGVN2Dm4+0DvNhYD3iKDhIqCUfjY1FGr9V0XS6f15/qd/UpX+oU2RQxski7/gi
	yaX+W1CVH8XapWfVCbo4KQvNCmRy+eSpzktuQkCP9fBXs5D/WjsZMuVuQtxZ4ZGl
	6nwhnUVzC8LJuuXXgonFiJ4BhpYIdyhUX3IQHsgZR0HZDbEXp3MUnKo0b4Ozoe3x
	lQygoy2uVQAZaMSxFhkXWYUzKqbY6+pgOuVT7GeVXH3QSen4oDiKvkZlJrcL2/Yn
	CP911w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6srvnn29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:38:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e9c0c4492so65219385a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330681; x=1783935481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UmvEo3pA7Pq8NfvYG3chpyYLUANHLsFRyacd45P4BwM=;
        b=XKSnJZH42QyiRCOTFE9W19cA6tF2eXv5FZhHqmlri6R/UAsYgv9dpWWXywftCyjDFl
         WfxSejgLnilZPn/2oXzH50htayByhdx03yEhSkSEY5MPxMnxyLevjZd0AUwcer8avX/a
         DzrWP9cimCR86LSEpknsnRl0Ro625dOIIVfBlUMlSIPzZQIwENSTUlMXw27KN0fIVkzD
         zc1pLVuYLE4dXjF4q56ao5osPq7XfaAIS/NPbLp4Pe6lGOGOvyqACfEFyzMmPK2B4f6z
         BvTL9vjBjf1a20MRDM1b4K0R5fAGs1/LgEppT/REfAHuRi/QwE1Q5z9m2dPeYTWj+5N3
         /yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330681; x=1783935481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UmvEo3pA7Pq8NfvYG3chpyYLUANHLsFRyacd45P4BwM=;
        b=PvPz7v4ITowJsKbCLytp76l/D7tWjgqV6EtckNqbn4PHS8EzRturNHLj3zOJ6tvWu3
         jwyp3+inByjCyRkxYpF5wFuUW4opgbixhN1B8DQ7lYEdE7GqCwvQoUiEzBTlsauBQb6F
         IMELyJCrVWjiLgRxeUORmt2THH/4GvDqpsf3yYHz/VCYnOG/xIOQNLJYbBq43tvg+jug
         dSztgsjTa2kIidHgRYtY+kdRH15nlbXWn//7IT6/DPadczkuFYM7S4gHhfhDEAj1F0UI
         nC7VT/2JRaHlKgeLNOnWsD0p0C/U47rLkVwXCiW6JsMacAQG6AzSQTwwbf5i3Im77N3c
         DUBA==
X-Forwarded-Encrypted: i=1; AHgh+Roe0r4OpbxgQmAlbxZBjKaXyYvmSsMfZSwx6r429N2GjQeBGiXPAO2YDd+6uydZgq1yZ+a9lGZ5gN1F@vger.kernel.org
X-Gm-Message-State: AOJu0YxzRztS15y70O1Y+s2Vc+jqTJ8DWky/ifk0/Ewd/nuQbD1m5GRz
	ScAnzXJeQ/NAEszQG6zR03D/OkNS/m9JsKiBws0X87SW9Tk2Ljx+XHUbHOEx8FiPTrT4Zyh2RgL
	W3HRbIZBK1ws8o13TGrn1mlm0tXN3jDRAccA8/edAPfHDcLzihX0BXRd5vRD8WCGA
X-Gm-Gg: AfdE7cnkpFEsMo+g81WbmbP1phxJ7od6lA/M3zLX4VtVx4K976dBib0BtTWRibjGlxO
	owExPX8FGuJKJkeRie51qnHNpVUR5oR1tXZN7AN5lhILXTxeWDJZql1sSws118E4NPf35qyQdv9
	Pwn6rsmPEuFrzA3GopGMnt38u/Zo/wBAYNrr3NX1QW1QfGDSH+llVwhqzo0vO2uRaL4Jzrs3Rbw
	rFuFUm3OuxswXVw4P5aoF1nGZQ2q9g4dr5ASwi/5paDFJaZN95jSXApYjsX6hNrFoLYizlbXlJA
	+ObePdXdpnND8GP3NwEeubH/OoFpt/h8Wajr1+J69WeHAC4qOA4xP6Fv5nXbmV6IyIMPhtGSRdm
	fsGVzBPa2eD/JPQVh7R4euSVGAG72xqqt6V4=
X-Received: by 2002:a05:622a:13cd:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c4be97d68mr86773131cf.6.1783330680865;
        Mon, 06 Jul 2026 02:38:00 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:51c:f3e:781e with SMTP id d75a77b69052e-51c4be97d68mr86772871cf.6.1783330680497;
        Mon, 06 Jul 2026 02:38:00 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60575c4sm709337566b.9.2026.07.06.02.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:37:59 -0700 (PDT)
Message-ID: <e2b7e03f-911b-41cd-8ac4-044492e2bdbc@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:37:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-5-6ac53de56314@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-5-6ac53de56314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a4b7779 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=z65YV3W3F_EkYOo9s_QA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: JQeB8pp5qmQ5_nzghMYHWx-_OiGmafvV
X-Proofpoint-GUID: JQeB8pp5qmQ5_nzghMYHWx-_OiGmafvV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX1/YqEdeXzJTV
 i4/NDhbYc2p/y5Pmcb0Rk2XxMHddXIak4X8oVCYvhYGxmYYamyNW0lUs1dvZKXQ+/aaB4nxvpHS
 kxRGiXEagHukRw1sObZCL8sG9UrmtNrA02g8CyFFDBijq9H3CDOcV8n95do85KG1/RwGkysyZfT
 SXODjgeJEy+Kn2zk+bsFfX35Ojm+yC90XKvOKXmhlrsymHSi0PAVbCPGjm8e+UnF0HZ5481UGoD
 rBr+66UHGwRsL+kw/CsBrT/sOfUM24xrIW6fLcdpbFteoOsYm/OZoeCfHUExyWOLIn5WdStHyvE
 sBdp7rCC3/vv8AdFfKeI6GR+Oy9vI2HSdRKDrrh22me4lzQPRFiOhxPbKxsKs1LB/aJeFsJlEo4
 sAUxMHNCFivf3CvY6+vl6i/oArrb5K7Wjv/sD4hzhHJ8zTlH75hxKMsTS1HTjRpaZm8TsTBGcEy
 N9VeU1isFurRE8zicog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX4S6RnNhT/38u
 FCf0BHnm1UWxIke1B7PmUIx7gJUOGMNDHD9lemK/IxOiAFmLbr50GMqTEAN5BCGkDd75PFwLLHv
 WCBPHf8GrWk5oNCSY4RX14VzLgyPprU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060097

On 7/5/26 10:00 AM, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It is based on the new slice architecture with 3 slices,
> higher GMEM/caches etc.
> 
> There is some re-arrangement in the reglist to properly cover maximum
> register region. Other than this, the DT description is mostly similar
> to the existing chipsets except the OPP tables.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +			qcom,gmu = <&gmu>;
> +			#cooling-cells = <2>;
> +
> +			nvmem-cells = <&gpu_speed_bin>;
> +			nvmem-cell-names = "speed_bin";

This looks good to me, but I thought that on a8x, we're supposed to use
the freq limiting register in CX_MISC - is either of them preferred?
Or are they just hardwired to the same thing by chance

Konrad
