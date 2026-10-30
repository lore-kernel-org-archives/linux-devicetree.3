Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364905;
	b=GBDGJeiMMaUd785XrzPkWoLc6wNpARdU+zoS3J9mi523nnhseq1rV3eMrLX5NFM4fN1e
	 vjBt0msMOVCqCuAI7ZWqihw30N7igJFyNvPaJuXkYc7AQYDaelvctfny+J/kgR5CTb0PD
	 Xm8PZdnUP5a4eAiqvqxxzhMPkbHHY1fWuEFrG25fz0hEkSH5mfhKXnGq4m+jKCHIV6D/D
	 kCuDwSNTgvTKmbZEm+EO10mv11Y5nSenFCX/gcJEvvxEZGYWhX77KPSc+nT+iR2Wg11Ko
	 1E6fDvkF3CdqwURr3nJbTFlogHvInyhZiYUFiYzH8kq3ZvAmEUEUPouWhLhougISgNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pUELrLp6YeQ8C4pfzR5PrsMQNujw6GtLrElfP7E/wY8=;
	b=A/VNtMV1RFLnANW+o8CJkVPFQ2hUYiFIDDE8wp9k/PQ2lxkd/AuX9xVBuTQisAcGgf3i
	 h5ZfUwcCNRz29XwIMttRUkgXZPO+5M8rhD4C57jEvd++30iuA6rVRc91lraxCceP4/1a4
	 TFaBWpOmxkaW6zg/IUTzDFfK9hYqhl+NdkGIxgPOKwLnzCMuQC90u9smIZn+1YbC8uH2g
	 bBH7wm5I+6rEI6XPlOlHWP3vaupmT9lVpkRLtm8ya4J+OMgn9yprJNDVOL6YxaBfYfOwd
	 NtN34qxEyiCAyOPAUEB8HhTjpxt/C2EkqPm3+yOVj2/WLZTrUfRNj6k9g5x0WFYMhdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Aw6eZ0Kz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNw6Eesg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FEE606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98FEE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Aw6eZ0Kz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNw6Eesg
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBFxem4143775
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUELrLp6YeQ8C4pfzR5PrsMQNujw6GtLrElfP7E/wY8=; b=Aw6eZ0KzIS3gR3cW
	VB9ZTCAbQ1fxcmKH/a/ppSg3VSMx4p4Wkin3E86IIXN07ay5gTsPwkvbDzUdIHgn
	275yA0idrLaqaoK8I2iOjlr7YaeM2rN2GxdxknC1zzU8FlCzW46Y4W9SYvRRWJ4f
	uLAqkrLWBz7Apyu6VHs6EJvnSsN+kEnW6H2KS4AQdn/pD/dyColn5xias6Oc4s83
	9pG+YiMOi/XPjwUlpOgtLcfjrCTPQPMajGLtahTT2rYDkpY4VMbtz50Bh99YsQin
	+sNll43LNCmHktVtA+f31Od6FKWrDgG09HmGwDUjPx+ht//qyDgaqzHdsYRr3uS8
	Esanzw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme753339-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 12:55:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c99c10e33so2185146d6.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 05:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364902; x=1793969702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUELrLp6YeQ8C4pfzR5PrsMQNujw6GtLrElfP7E/wY8=;
        b=GNw6Eesgy3bBWKYZLCRer6+9Fl7NwwfXPBByPifuKwIROwUfOYUdBvRZ//qJ4sjqnL
         3UzVcj5WMICrrMR6oicxNVtiohU5V0wNf+eaWTBg5748iw21K6JNAT8V8spNAIEl1/Nz
         zpR58crhyiT7rs9mNVB9B4x5NbHaFUXYVvbf+J47+uFkABu/swCSxU+FDMbqHHcM6kxa
         P6/+r1ANToRHqu3MGGpf1McF5UyZhvPvnpGsZ5MEh121efdvUBgpOyHRMcPh4d58qy5C
         +du90RdhqlgDo8cmPvHAEeXF4F4eVLbVwcNRy/3fXWDdwv651Cgwca6KQgz3ZqXmsVqq
         ZFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364902; x=1793969702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUELrLp6YeQ8C4pfzR5PrsMQNujw6GtLrElfP7E/wY8=;
        b=KNzss4dK4Q38uLHEZV862GCto7no6Dc/HNuIPmXkb4dFR5HmG3YClijUxzr87cjCCN
         AGlLsvcMoA7Bu6uzpUmTLQKEnXv/3Pz0VE7WKFBebPXt6/+1MhwyAm9wQjfiBWHRZY56
         1qJnW5EKzaQurDkDPloLSYhUCPsKxDKeAjrypKrk+dQ5rc/JI8hQ01RtdSg+fH58AJa3
         zh5ehPkxBPcc/GLj9piBR8pEE4lXOgHWLP4sLx/t4pyUtMtdFel2d6Vn1/rKJ0YThoB6
         I6/Pr9U7VpVWLUtH4NI8ebV5LgjMbr3TSHXZQN1jMat8+kdavt8TTeCW3JxmFlr7LAZU
         HUZQ==
X-Forwarded-Encrypted: i=1; AKwUvByQ723qCQNzxV0t4F4/iNdoqdMtwZZThjWa+Ntg9uZK4cKjOGrdxk3jIYMIeVpfVs3t6KUGsMBfacGd@vger.kernel.org
X-Gm-Message-State: AFq9FYKT9l9muzIBXt5T1aNf71ISDUJJMWmmqnV5lReBj4XBlf/bp4E2
	NvcslWexZdJz5NccMR9ehgslagAJwAN5pAievQf7dGip4YkMpmygxLRrlKS6W29799JlUAy1/Ft
	RFbLHeFnaAgvdaCzzACQHeldL9aaZQg7n6DPexoKvXBYN3F7S8/iPdXfcW0l8YC6C
X-Gm-Gg: AYBFou1hXg9n6ZQYEhXRHHRLuYN/YTqA274eyUHnoLMTUlrksLWjeo1h0hvFkEdR4W6
	PGhcg5NBZEWrvvofCZbk2R+rsT44hUOpKEebl6ZPfmJ4y0PcsodZV4TQxVdD0Vw6Hz5ceHABoCX
	XzXHw1enfJ2BAQpce++AQlhuQp5jcTi4nRXbb9APIt+fOn87esY+pu91LBpGeEElKBe7FpP0EtN
	wptVSkbjSS3NfDX44gSoG+pABZEIbiceyhOJ3+WA3v9f5WgxqUdnUoQ28UzDoT1gRfmyKcgKDT2
	d3OkHBvNAKELXJNWGkaMl9t37bcN/gPcGaEEZmSqEoXYH5eHmHTq5X692bImuk9kYKJrtorvHFE
	oHRs4MCznFtpRfy51KjHCsXL1WYjTWWa3D5mfIKpe8fwWVcwRNb4mORaOkGIAko+NTugRjsI=
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr372891185a.1.1793364901850;
        Fri, 30 Oct 2026 05:55:01 -0700 (PDT)
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr372888185a.1.1793364901285;
        Fri, 30 Oct 2026 05:55:01 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc30sm63788366b.26.2026.10.30.05.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:55:00 -0700 (PDT)
Message-ID: <e1d97fe8-3af1-4429-978e-9f2ce59e87b1@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:54:58 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: add missing Iris IOMMU SID
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dragon@radxa.com
References: <20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-sc8280xp-iris-iommu-v1-1-1e3fb8562b3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gsWptX63aV4JYMFFhE2tiEPMt1Cdgi22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX1ltkGfiFyFiM
 iXFzUvH7ggTWIKA1HfsD3udcFG0qqKXlUnNzn6zBH9JUt+UJWXAkQ0GMdgiWdKf/1HlaQJukEoY
 uULJ7DtxihscZyqR/VXXUb1w75iEhUjDJfySm7vga4li7aoTCQe/ynPMop4KwvAncs+OCzNWuiY
 mTS8TMSONSWTDusigq9h5nFTPsAK9yWXdWeJVQ8lVVFBjSVUIv1fLuhMs2UqeaSv9Vjr0gzeNEj
 5KGHPBs9pLeMcxnHn9IpP2gNhUf/TgUOwSCEpfVWU9HjwL5IKtrMM/XPVuZP//uVBhwnso+DiPx
 lGrBr4U/IY079CuGYRlZ36NFwwQV+XjuF92m+Rex2vBDt0tZt3Mo4AklkeBoDk1DxLeVk7GeHXG
 OKhZ21jCK3bK2bHSRNrS2MUBwzKYiHUqNGE+pfjCG1lfBpPkvN1djalQa2t5izdb+5M3X6GsJiC
 l/BKIJU9ODnt1nd86Cg==
X-Proofpoint-ORIG-GUID: gsWptX63aV4JYMFFhE2tiEPMt1Cdgi22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX0Po5zy2gkaGk
 mghfNymco1DL+hC6B49Rd71veuR1FKkV9q3aG81axgwn7WUPAufcMHGoWkMDWBOAMEpCxBbgpCo
 CZ7f8EibbEL7NDDnHVsRqWO9WXab+SQ=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae493a6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=LUNL1vnY_D6g04zkfocA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300051

On 10/29/26 5:14 PM, Xilin Wu wrote:
> The Iris VPU on SC8280XP can issue memory transactions using stream ID
> 0x2a07. With only the 0x2a00 SID described in the IOMMU list, those
> transactions are not attached to the Iris IOMMU domain and can trigger a
> non-secure SMMU global fault during video decode.
> 
> This was observed while decoding H.264, where the faulting address fell
> inside a DPB buffer mapped for the Iris device.
> 
> Add the missing 0x2a07 stream ID so both Iris access paths are mapped by
> the SMMU.
> 
> Note that the issue was observed using Gen2 HFI firmware.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

Any chance you're running into this?

https://lore.kernel.org/linux-arm-msm/20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com/

Konrad
