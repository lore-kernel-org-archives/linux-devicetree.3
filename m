Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168271;
	b=BzMeKQg4MjGSkHYhXVlW73cvqxu8X7nZ9TS5LWBhJiMxjOrrQf/CXZHDbkKhDjBS4BMZ
	 DRWyML4WTUaCgVj/b5obhzVPhKfREzy+8ETdADFmKcRtWHjWc3XUnvdkinsxmXTRGi9MM
	 8mgaxu9FnzqwfTw53ubHS0N5XZOMNb77SKkCLeuoxf5/upDpewm+2FDOuGRognexa6m9X
	 w8tg4WZW5+XmxEZWGdiCqKo6EZD/E57uoCrSqD9xIQ84ZKbXhwX40zB6hwI0Y3HqL8qiS
	 8P/Kbes1l0bCdkKzSBOLjoOMz/CE51e7s+usLJZpZcwZkK1ttom9zUwTeEGykb2xy9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168271;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JVyI8XzJB+HjkVWzBTxdK27XAVBVFV76hYAsFq4nkK0=;
	b=1M0NQwNsPlSrOeGXYK6BIAYQ+51hUT7R+NHqdpw8mJoYIY9tk+qJAE//RmHIOIYBI1iG
	 HJ4D+NJl6bxszro71iIFc1NB50oY1gRcU0y5YSN+nXRPJJF9UaE2Va3bC1RJIrJzq2KRj
	 yinjCX5fYjYOHWTN6MhNTh1DsXZ3SZ4YHko8m/lPJKCdDZld2WXLkBFQVOkoyMh8WJCdV
	 lT6pWyW5qg8sJsNJ9UdA5yF7osRFq2P6489kWVMpMhVtciAV7d6HHZ1TuLZrA5+nWqVes
	 PV/9pyELyPHoy9Jvkyi0icFQMJHc3VHXtTcRgzvqIth37k3Che4fS6mAERDOgeNH1DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XLQhuATv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Dvk3/9w5";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C797F606A32C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C797F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XLQhuATv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dvk3/9w5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7epG3144410
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JVyI8XzJB+HjkVWzBTxdK27XAVBVFV76hYAsFq4nkK0=; b=XLQhuATvbqxovLlT
	dL411IJrhlAJYPNrAhk0mgGnBLMSHr/hV8iTE1AqWbuQQdAoTrHyzrFCtxbrcwQf
	DY6xYi3BhFoT+o5+BDMztoA+oWyYqEiqXXKJOkkfL8JdScJdLUQ26+9xJvl8Whhi
	+D7eRf7/P+sYWAztIAEKOZku+V2bVaYkRqwj8ir6fh00+SejGPOWLEtKzmPxu6F0
	VQE4cGvqAWhoRoiSUKqmRHBbrIapkRDF1fJbBXVBvj64RreyBBgssxLA7mXllHZh
	SPzEv0qRcSOsjfTytxwHjef0zixTExVJc13XINk99ZZTm0kCe+Q2/0WeNOTQ6SiR
	Fa8FgQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbh4u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:51:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so131724385a.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 01:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795168269; x=1795773069; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVyI8XzJB+HjkVWzBTxdK27XAVBVFV76hYAsFq4nkK0=;
        b=Dvk3/9w5vlyQrW6bzgGEPRiL6LM4nsYAPPPR+Z/WIgF3SFtDs+uLIhxTQccYGVY25v
         u1caU8w+67Nvso0WQeuc6rv0YpaVF0EkV66vz05Ngj/cHljxL8vjJnmFGakcWIwopEgo
         fF9JpuC4y4tnO8XXt8zfFqzrB/ge47Su/1CfH03QByoswU69ITaCC1LZFe/jpHRqYJT6
         lPij0qEKEL8HwcjI2RNlqSiKuFfgdpPiuEApolXmVBI/Z4IR+nVt8SPjsrramVjBs4x0
         HvFhrvJlhN1lLJ8xEb+jl1YGJ58+/yD1XBlPmaKeeG3wx+wxLhtYFBOCDgWVOoWvnevQ
         5GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168269; x=1795773069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JVyI8XzJB+HjkVWzBTxdK27XAVBVFV76hYAsFq4nkK0=;
        b=H2AlV6lLVm5EYo7PW8XLpFr/FqBFum21ZsDjM70ZbcVzfYyznlvJk6rYoxwRAoeDB5
         0xF/WV98fYPNj0E3BqjhNqrNneImXhwgZ5qnvsK+r59MrlbMPgVlOelsh309k8sxzLrp
         q5H1O1lO25+RU3uRqAoum0G3ampbVed/KPewFV1EEvfabYJ5I3zW/rgB9KlaLmFSpSOh
         yhb2/PdwL9XTv69xYBH5yUv/YMXEO/XWTk43a0wT+hxU5Q85UubESxazSTl276vKMYTS
         ZVhuDMGoM0Bv6mICGe5kst99QkHDllpGSeUBstQ5VycxWd06/yQQ9Te4CkrT5CkAWG8t
         F0vQ==
X-Forwarded-Encrypted: i=1; AL+hErHOiPGvOSUHb7A3Q/QQTa9HCJOsVDA1oFaZV/wCcLW0JWxsNdzcxKMPg7EQVQ+mAAOWoTqH0LA1Ored@vger.kernel.org
X-Gm-Message-State: APuU4Z8FCJCBYMTTiktccBG7c2oBct7mN8yJjPg3S/btFBg2uO4/XkVL
	+U3wpKn+4DknZzzZ42vT7mXcG/Fs+giBEgjd+Uqc7fPGDBp7FPrd0jlUNFOL47bw/U1VKSzn2Uy
	+63zuDt9y5ZYrKvKJ7qC7X/WoPa9e2hq3ILVp4yOiE/VmjXsPTGIb4Qv58OIdGdus
X-Gm-Gg: AYBFou2xZOJtgPAUidAdH1Pbbx9Chz7QGCJHLGia1ZcxgvLPdnXRtP7oREeAAnRaYtl
	Q/FKDKHP+b00KkRkijeS9cGJDtruMcfY2VyCjy8u51YoaFNwiLy5l+V/1AxJVLUvuNDtzAsgfeO
	deDFjfTL8vnw3vS9+esTpFHxHilpCmO5qciuo0fuAdmQqp9OLWfEKBk2iaJhJdy3W9qgSrKbZMP
	7a5S3h8K3z1fxrLzPTSEMqgoZ0rDVZIiS5EV+zN5Gl+PD5DPDWZt0VcA4C7LaNcBzMTpOoJYCFJ
	aRW73RsZqxkolp7oh/MbmczjED5piu6WNDqLdEYjAqcW12VghAUglLO6Ff6SVK3P7+tYov+NYfK
	hE1rtaPBTdy+U1fsbg0xvBmNGDpNkdd40RzyqWKW9CLkuKsRQ8bVYisXeqPH1dRpW
X-Received: by 2002:a05:620a:8081:b0:93b:d7a3:45cf with SMTP id af79cd13be357-949ba9e882fmr372402985a.56.1795168268931;
        Fri, 20 Nov 2026 01:51:08 -0800 (PST)
X-Received: by 2002:a05:620a:8081:b0:93b:d7a3:45cf with SMTP id af79cd13be357-949ba9e882fmr372397685a.56.1795168268270;
        Fri, 20 Nov 2026 01:51:08 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm4524417f8f.3.2026.11.20.01.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:51:07 -0800 (PST)
Date: Fri, 20 Nov 2026 11:51:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: nord: Add GPU cooling
Message-ID: <ajoxvv5enftdx6phawevgoky3hijrk7asx5g55u7cmcdjrlntx@syh2k5q27bwc>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
 <20261118-nord-gpu1-v2-4-8d6d9908b7c5@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118-nord-gpu1-v2-4-8d6d9908b7c5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfX6R1XWY1R/zAv
 LIMP2RjmzZba+XxDSimTlyE6D0snrxPB/l06wa9LzY+CpfTGGZa//rzJqJszTLQguyvSM0YT4ad
 1RqM5eL5YuLhLNPpfeZBvE0I7zADlaguwS23u2BNmnZh7CsuNaFskXB6+cAYGsrM3kJOnF5pCi/
 jU5HlXnqeEVNgdsk0/FnCpH9YoVrEd5vfiYPpdJMYKN9xNC69LP6FGaB+9hqejS2svOK4XObVaT
 XNz/CfdPodhNYwFQfRe/gqdLh4LzsceKQFHs6H9oElHWh32aG6PTwj+gUUpVSd1v1bAO84IGiF7
 XQG7UBdOqPtwW1oCISYMpGa2Q0J/Q1A6DUPGB0bMCKf46gNsaRgbDg0K2oWCDKPKmN6A64Nx8ze
 tSBx+WAKDVsA49CfX7FOC98IOcY3YDr0/R3sDkC3sFpj0BwzkzvZKUJdvkerm/ZVtrGZWizWOdb
 DYEs79b6mHnpQMNVNgQ==
X-Proofpoint-GUID: gC0umiyUiFTqG9e9siBpkekwPzPKPKtw
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b00180e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=r-Xe3uw014UkFQyex58A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: gC0umiyUiFTqG9e9siBpkekwPzPKPKtw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfX8pXapCvm0J8T
 YHcUlLxorMJcD/iQxWmX/EChmg6RBZUfd0IZSikDgFr+n1B3YV+zNlHqolvjtDsduAGpskQ+UG8
 GxZokFYDdMvcwBaE0t4cq2A8j9q/xvk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200039

On 26-11-18 04:30:07, Akhil P Oommen wrote:
> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when
> it reaches high temperatures.
> 
> Set up GPU cooling on Nord by throttling the Adreno 753 GPU when it
> reaches 105°C. Label the passive trip points of the GPU thermal zones,
> map them to the GPU as a cooling device, and add a passive polling
> delay so the thermal framework can monitor the zones while throttling.
> 
> The thermal zones and the GPU node are both described in nord.dtsi, so
> do it there. On the GearVM variant the GPU node stays disabled, no
> cooling device gets registered for it, and the maps are simply left
> unbound.
> 
> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
