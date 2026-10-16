Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AF8421A17
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141830; cv=none; b=IvO0dnGHSzsWT0LqlBN+ADRnMT1b22b79iWHf3bEpfUxsRLEQrQBNdI3GQl1m+Vh0kiNdwIA9oRmt2iiWQeTiCLCIGrIK09k3g5YlgzdAGRLkcG2713URNMvaq9FyeHbFvdyet0m189XLJy4XwjwgwAubm7ApaUyYo0O5cxdUPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141830; c=relaxed/simple;
	bh=FknUXR2V50SRgDJQCdH6IzolRKWGlrnF1TNNVowTK5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=coRWH2SeA/VZeISX6Z+95cQRskXda4+C/bxfeUO5QerUNIQKAp6KiAAQoQWS8Y+sTVJXjNDUP7BkvCasAmrMpbN33J1IjT2Eodz6UrDXEyvNcIN5F7YkeqLL3SLAWwQQGEF5GBLd+5xlF/le7Z2AgnKbxITszKB3Z7Pv+Ic5u8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mRoFUeIg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4POjRTn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mRoFUeIg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4POjRTn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8m0Rs2219270
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qdw1IMSJPlaVw9V5/5RUUe24WWrftggVUgg+EtKpg0A=; b=mRoFUeIghvPRrNcW
	M1dseKIVbsc6Zw7kDzvhwk/T6GanfkjAQPcFxTlvBmyc3lXlUWl9DFyn/OwIVrdI
	t0xvlXFxbO0f0Wr8+YQsf2C3miZXKmQvUYPEpEuDX6nEGuLnJcEwmQ4l6bMzvHVO
	VoSY6UUOKqQK99xlofpB9GUFgnIGSMg3RyXWw1QSR6qnI8A8zcADcHmiLLc3wqyo
	QKy5o4RGcKWBwN4h72+sm1xxIiK7b+g77n0O5ZFkKzGHiFTjGg10LuCwDH/6VNlG
	K0nAoUIxzhalXSvBCbZUG/SFZddQGeYs11p/g0NE1ccSIfuDitTw30F3hoYJ+xPw
	mOzvEg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m3pk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 09:10:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53389750985so13038001cf.3
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141827; x=1792746627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qdw1IMSJPlaVw9V5/5RUUe24WWrftggVUgg+EtKpg0A=;
        b=S4POjRTnt0uFhrPPAzKgqqjhBSQY3w3Cp2+R7fkjllzwqyvfkkt/hSlyyHZ9irJEQh
         NtJIrpfcwl12tgasI6d9i9zHqEx+hGRUMf1la56FFDDBPXDIUvQrRXlmQPqZbpWyXgwo
         GXlgbJxSJgnrJcEAE9nuURiJr82wFdp0BqbnpEELWsAAz7Z5rBF6+qTfMyR1wm1P0Unk
         eAGyucQ+D2jg6RztU4muTPKaKu9byaINbIS2G9foVX30AEHudMwBlaJYQQ6KRnVM7Nkm
         zkUqg4cwXBzFwrhkzsxLiDq1FSV14demsvaT+lswkuEgg58fBiKbQAqFF6JxFkJpmNkW
         olSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141827; x=1792746627;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qdw1IMSJPlaVw9V5/5RUUe24WWrftggVUgg+EtKpg0A=;
        b=r/eNT6xv3966uzipX+dFUiUHMMSOpH2eUK44C48Y8oZT3v/4X35UzJIS4nE3VGcBSh
         Ler2SKHzeqpQjRJkZZh01AQnRfF4Lty3/CputwqZKPZ/fPfGKsAMaLUq1+6UaRlMk5fX
         yU0pQp5GEKJwJP2GxRR8YrEoHzohS6qyUrOK7LojN5D8xGXCaQ2eIrnvjvjVQQiGkIzH
         +ZC3Twit1cym3fluF7rXpcgLsidoFIvw5qxrB9WrFhCYUXOMpx0Z0Vm4358yt4QSqgpF
         KdgiJghgcbhVvSheqiWZirxc/ruxHDzWTOIoez4xWgsoOMv+9lzkEOGMrJ6/FubhoERJ
         QSHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjj9n2lJz5bO2U2dyMhS26lV080t7yJJj4zWH7tu9RP4kmapE07q8dYr1+toBcF265KXuO/PTEip+c@vger.kernel.org
X-Gm-Message-State: AFq9FYJOSzD3OluMpc86tsz30io5PtULMIH/GFIC5G1V8v3iqypS+NFB
	Y+a7IStUhHahVHTeDTvqBek7vOmHVD4CEHlFM4UOsIYgfENNxOFzZZKhseWuNTDElOtxfWaZNsh
	rPjmGGhaHpHzGQu8YgzScFLUXT7+UjcFJDdSEeukqsh+0E1nrLkStILxo9xhFtFlS
X-Gm-Gg: AYBFou3I1UEQHdUqSMbS9Q9fiQR2s9eyXBezf3Bg67GKT2aXDyGaeihilWWA9nNY7Iv
	NFOQ1i88xdLNrIOzcRedymGIQB379pOOjQf5SaSOxFordplWpBMq/ijos6W5BWrTxtIS8+XnPND
	3vGZqKqyALeuL0MZszf7z8xZTTWthT3KvmWo8FbORSDG54oUHKnhuipN52/+8v1THsL0E94tAvs
	cBLOge3ButDnZOVQnDBsskTP+Eo+sFmMnvvLHrp6Ms5HT4cNZ4x27QytndIrfxq3f0Uw02+67ns
	6tCoFZsp9WSjTeabgzKE+L2fschHEM2TaSVlawMu1IOrKn/I5ZIv+6OVmxpseSewctZ9pe0rjvH
	71XOwtqHK0u+bxd/OQNeuHg==
X-Received: by 2002:a05:620a:a43:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f211f7e97mr73037685a.5.1792141826681;
        Fri, 16 Oct 2026 02:10:26 -0700 (PDT)
X-Received: by 2002:a05:620a:a43:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f211f7e97mr73032885a.5.1792141826093;
        Fri, 16 Oct 2026 02:10:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c409239b3a1sm52586266b.85.2026.10.16.02.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:10:25 -0700 (PDT)
Message-ID: <3866c346-ddeb-4c9d-9f4d-3e09e3854bbb@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:10:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: kaanapali-mtp: Enable USB
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
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
 <20261015-kaanapali_dp-v2-4-c15cb83d9140@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-kaanapali_dp-v2-4-c15cb83d9140@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1ea03 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ENyogFyUuOtWwiBkGF8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: b0LqoGvFyeGUQN69lz1ILzC7ZYkt-ASX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX8Kfg9QjW6spd
 JLinLyrewRtmIQjI7FvoyQZ+g/8VHytdqUm/IiVtaXBH0SIX1scxb73X9OrdszxDEuCsWv+bk3Z
 txEjFzabM5penuTkFHOBXmtwAeaoK/A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNiBTYWx0ZWRfX9TO/8P7+gk24
 f5w9jH5Mc0BC57PGOeN8h2+QXsUISafKjZ6pNSazVDHW21moHMV/3DPCnIK943NleO7k4gATQ1M
 4qJ43q9S2gf2sBCwZSPCb+O8LvpjbDePRUTfylhtu9F1Y7MMXODipBHIW5B9bhPtoWxkmotf/y2
 I/YoiyGBw5id4LpOAva8PMHjggJachXaBzPQE+FdAP3JSm+z1FUS5GB9cK+CUH4n/tta6lDOz6p
 5r55AS4tBu0urrzODUfk9F1iq9SasZlBFfmo5HdHjryW0GXDuhJyj48piCYr1xZ+pMQZJlJ2C4+
 3UPglu2DQYkdReCFiRJI1gMNdOgdxYKKAt4oLMp5GdiKQlU+CmnNmtXmw0w/Y4XZaWaz3kYJ8zn
 2ASZE+RkjK8qAjXD8+AoIRWV+kORiA24CeBA4eIvNnGLi8NelXmbNxanIg7dJOM9QTdmdHdGF6Q
 Lw7bT/lHXMSSAlSDE8g==
X-Proofpoint-GUID: b0LqoGvFyeGUQN69lz1ILzC7ZYkt-ASX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160036

On 10/15/26 11:54 AM, Balaji Kalkonda wrote:
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
