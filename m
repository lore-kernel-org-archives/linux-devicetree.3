Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751121;
	b=xdxylRyUKV50UKtdMNq/P6Y3obM9a8z2NX/2C8H85GnBFJ2q8Hq8kWNH66Pih5Auh4r7
	 VgROFsbIAXza5GDHHnDcAdwH7orpsJW5rF2rrPt594R8CNKT1qINqkpEWT5YercKHnVCc
	 a/IgVFbfx1/c4z1U+Y5abOTIYUN5EZWdB/tyCHXdazWNIZ3zIDry329f0PwUTcXK0SIxC
	 VBNP3knUZ/ABz9XjnBBFkHsoui/x7G04X2UDz0osV/jgZl69/DLUBoxCZ9+SP4FibXnjE
	 m3MRFaKe0kPUs7fadqLjeWCnvT808DzpBVO8I/0VReEcYM9hwoXko4pq/XBGJGpA0eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nDLTzLm93OhSUueXu94d2WDd6pOzTzbQpnpa7vqPALw=;
	b=Ged5PqQUn0CCFGdfdSWPhMoB5VPu8OfwVP6k1ZiafEbmQIiiZotbJWsrRtudBK18t92M
	 t4GwfTRJRzUgPaF9g0v4QR9yhqMPp83Y7jKHxfvlbn3OwBZpOi7N19pY8gwk07soPVMu8
	 ZycwporNgqBK81mN4L4h5vCkbKvwLtjn9iauJxuTU/TNAImXBzMSYTNeqUWvFETbROfu6
	 4kzcVDACZ5/LsXx6PWhc9UiPq5tGbZUXqK4blK8F41gRkFDp8y7YslyccPL3C9P6VpFtl
	 rA4DbxLzUvQIpoGqBLbw9nlnrgscm4eCeauCm/eBASUN+keyKJYR2b7vjD+VdSDU/pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpYHy6MC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TcULbrz1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9446F606A31F
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9446F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TpYHy6MC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TcULbrz1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAX252489809
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nDLTzLm93OhSUueXu94d2WDd6pOzTzbQpnpa7vqPALw=; b=TpYHy6MCctn9gNuY
	VAkWRlMdiqbyn97oXIGrk0laU1sQQ6PjxLhpsNojq3+HaqLZNal7MyUye8mWWDB4
	qtqxlLEz14HFLBTK+VHf+UlopRyB8qW97mQnEZCcWM0B8HNGNQFJiOKEC+76Jvp4
	zSHPQBJVoIU8y0B2ojIFzoo9Vyrd6fttN8ARGPEMpR2OdquTd+coUfzQ2CIalykD
	S1JQ+vShGttxC7p9eWi225C8d6S/2PG6a423RsPLFpHg/AkOy8qCtgCsqimgPl4l
	yCE2my6jf+jSOHZ8XBu0HPxpwYqlZqsV6fqMSPpuqFJfhqhIae31I9l1j8L5M6sY
	v+ooyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftygae8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 10:25:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e58614290so15480385a.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 03:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792751119; x=1793355919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDLTzLm93OhSUueXu94d2WDd6pOzTzbQpnpa7vqPALw=;
        b=TcULbrz1Fqpt9APF5L7O4jqeb9NP3npZXU0XHPizUC+nqfQf0S/F+ZbksbMLTDcedH
         8TNQQHOI8RDtZLPQOtFeb22KO9isIUCGQETtQnAlFA0eMr8NnpCydIDNNGqIyURFAl0J
         tBi5MuP2VBDY3jGVVGL2q9/esOBUxszispxVMXR128NEm6uPuHCqWpdpNPnBsrAF+L+G
         JARDaP011AOBgMzZ9Bp9Yef0C9PbogZRGdel+hYt5Pxy1bIn8AyLBV/AZMrFvUwwAGWs
         brusRhDpVEa/z+p70ozt0WvNgPWiOCob8PIxyN+mKOniN7/Kgdgmx27SHoh8U18D3+LC
         sruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751119; x=1793355919;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nDLTzLm93OhSUueXu94d2WDd6pOzTzbQpnpa7vqPALw=;
        b=UByMrgXFKDb5qeWR3aIxni4V1J/uMKXT55xSmmxllB6nzTRHpnxUXnbZg4tPj9hq03
         8+3/q3cC4c+pjjXklDHvIGR5XA9QxX6XhX5C+e0zJC3+Z53DCGobQiNLvLLsZ1kXhN51
         OS2QeKQd5kG4pPZ/OQy6K2h2/SCDZ+HxI9Gi/6pMRTEutuiawEi3NRUd6r2WNoHF7WIh
         vPqKvYMwKPWHhAtd9Lvj3ytcAFoVEjUTVYcRa+7bwDlS3yDROhE/x4r+2qSiY7wpBkUC
         RnFrRvkTa4QGOeiui+8JrUgy4uIvq5bWZFeU98Sv6uC0hzXP5BuWuW4xaFI/6YSfPc+4
         axWw==
X-Forwarded-Encrypted: i=1; AKwUvBwOjRra34RQp+v49NHZ4aPjcVEd177o1GUTCcQrhQ74J/zixHtQbG33qJ2y33JnrvxHir+Yh+XBSGvq@vger.kernel.org
X-Gm-Message-State: AFq9FYLvcHFURfKCf/ZGo5JPUpZ53JGLNf+ffNVudfL95k5zZNHDgvp/
	7DIYi+Hy2PZyq/Qh7YCh31Cb8QpZwA8RG9HK3iBoEY2lMPoqGuCENYiXwa9gTzVZvnTAaezcAcx
	ZPmHkvkWK0Nw4bNLOdd3lz2oofyWKxLV1JYqSkE+Z0t8M4SxF52BroOzoWHRxBNi8
X-Gm-Gg: AYBFou1kz+KyD3B30luRpao0kamk9VwegpHtgVOIZkPbUzEtGOMislgdfLzBCKYCZ5v
	ChyCvFztUnXRt1BOZtbr1sAitu+eKP1HYGkBdVufUVIIhu65n1LkLxR7erIQhC1eTzy4CGqCnxa
	bqJjhYyALM5zvexaObzPE1kNZRYOusB/lCzxHzj39n5a6cX5Kcva9CTsc8p3rw+s4TD9cGFBoZB
	kmuwj32yBrXcnonwuKxwO0McnthUyifluL1GgJfNWR8prWWpt7n58VAfpRMm3pbYuTU9suhN9Lr
	or9ze/ZG5Nmco6TOgImvZDPX5/8CWJW67aJnF+Zvve881rl+Siucya/yvMROOeNWH98+Ix2AuEu
	y8KpO7648SBzE2S8LHWWwKw==
X-Received: by 2002:a05:620a:a8ca:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f6f54812fmr340745485a.0.1792751118788;
        Fri, 23 Oct 2026 03:25:18 -0700 (PDT)
X-Received: by 2002:a05:620a:a8ca:10b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f6f54812fmr340742385a.0.1792751118280;
        Fri, 23 Oct 2026 03:25:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5d181a2sm85208466b.87.2026.10.23.03.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:25:17 -0700 (PDT)
Message-ID: <735b7f7c-b8ab-42c4-ae84-9172804496d5@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:25:10 +0200
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
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
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
 <20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb360f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=S65zN7q3fX_PurGuIfIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX/E0ssTSWcsnR
 4HVXDlOEooCy+2BOQz9sz9PLk+8kNx+qnbKLrhjpL4QVggzvXKN6/ZIKlBk3rrR8e1nyddS6XwT
 jGnfL6APQ/uG3jemrbU0LcfvFXFw5vk=
X-Proofpoint-GUID: Fe24p9gL5OYZujPkZNvDaunJLNd3jj0c
X-Proofpoint-ORIG-GUID: Fe24p9gL5OYZujPkZNvDaunJLNd3jj0c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX+rE/03ZeWnUy
 IZ+F/fbiWtrrbdeega+y6GEFl2yP5kRR+JN3ZYE0DY+Vx4Sy8fAO3Coaqvhf79Dou8OjHyubtMA
 9tqPpER1BzDGsP7u+glxaXvjR0RpW74xo89emLVfGhbKtwE64275FO8dqFTCHNMUTV/QdDzBlaW
 soNc3pzLaS+g50/tVLgYZopULou3m/sLCF3uMk2PB9lzIV35D1m8ZjcNC2ZI1lAWlIy1AW0FklX
 jGzGcCCxRLKeCMq/MTqtnKwrAAK9p3R0HGP3da6HaP+7HsSMPREDRilvwEL9jN2JnxMhxTsbQE/
 PN3rh75Oz4fCttFQS0hl7QSrr8sgzquhyKPMWBWzD98+MUYgb5Y4ObkzKiywCj/p8WCPF1/3Y7i
 S7TQfanFVuO4DCPp32l/0ZQm5pd0FXO0j0Aabr1rIJnFBnpdf9o4ehVub/EptusMyPNudf5Omms
 SPVpduWrSLwLgwM7IGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230040

On 10/22/26 11:49 AM, Balaji Kalkonda wrote:
> Add the DisplayPort controller node, including its OPP table,
> controller clocks and power domain.
> 
> Connect the controller to the DPU and USB/DP QMP PHY, and enable
> mode switching on the PHY for DisplayPort altmode.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
