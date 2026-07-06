Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775CA42CB1F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330769; cv=none; b=B7Ze3CqUi3cQPt1BJblr0Nh1deSC8S1g89Eo3YXkoxYxCCrXMblUwuZIeoUQYNkqtuTd+Nhf+4cCG65OB+AqbEO6EA+j8+wG+x2gEMhg/nNa1obeymN1AkhPpGl/8WVyNFed2GPSsARmtuUvLfVrf8T99THG+yeejsIl9Fi25bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330769; c=relaxed/simple;
	bh=cCCe5OkOXnhSeHqZSZl1sZiScoVnvd1Ki7EsboP/TAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTmldBgxbIBKMfQh+HsiMvw5v1ZETgLbWWr+zY4zwWCBFhZ0ia+nvfvNAmBlmDgBKBwQgbmgo+jAKoZrchIsMF9itj/z9mL58ov/dcVCSi8eN1fBp4g9gAMZ9S6I+vVAObmlo7yZEHYB1FY2Y/wvYtgeEpUEtXGzFTPA6JZ5QVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igSfXDSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNV5ys4d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igSfXDSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNV5ys4d"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66694IMT4180020
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SbjCETrpVj4j77Vo3a/oe72PsOFxot0+LxVY86kScYM=; b=igSfXDSGDXZyx/+x
	3CJahP7NvHEriESw1Af3soF728wAkm8m07BTNRQTpyQV0fid7mWNRl02gXhYnqfK
	bcBuMpD07adRfZTDp0SxSdh2UShWruleWpw/E6BQdNodE7o93BBEDR0TdVM2WKrf
	1sAnRmnjHO5SaJ6Q4pjJWO3/NatVmggzTxajWuTS3jmic4RD3cl5WNsW0MZXgEup
	FksPk3ls5DCyO1vE6BYGTqN0SoTKCEIAjVASH6ujrtF+CXDZZw3dcXIQpjCrIT1D
	2WjGHPvi6Frnz1luwacQfR7vZbQ+uCjC3pPXQowDURBYYqvPTNHnn+/JR80Jfrqy
	A0PsWg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txeneda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:39:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6cb57d25so88707685a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330764; x=1783935564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SbjCETrpVj4j77Vo3a/oe72PsOFxot0+LxVY86kScYM=;
        b=bNV5ys4dcjRwX36cLR5znU5vD+TyY+ncvzJscLPwlh+e8MofnDo2bpdcPIDa4i9/ja
         dNtC4egWxOCQP+PFXZl+W8aZQKugkqhKTkf2RN+zyqhP+iEDwu5gyCHqdl+GkJcNH8Sn
         fkLalqPBdWTNw943J47cutZcz4bRtyLj4tophobstQM+0vV9GCN/0Elbkbk91XeOBCXE
         5r5lKUnah6Xurouf9kWlcbhQBzjOLM+o1kPb3JpP1yPym2z5avsq0MbKEECxY0dB1mRm
         qYCHaC/mqbjMIBI5pqO3knKswp2N3ZJ/xhpMWZHFLC4qluS0mB5ZtDuZhLjfSoAW/D7p
         BMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330764; x=1783935564;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SbjCETrpVj4j77Vo3a/oe72PsOFxot0+LxVY86kScYM=;
        b=sllwBZ0J9OGK42aGz/4dXgfsBnzVOOr8HscMI+3yPEPWT3Hj1gz724DJ/iYcPrgBh9
         P68cX94quQRR5Grh44FLl/jDUUymR9fAUzvn9YjQQIioSubJ0WKnXYQCKEvOZ6nPNwbA
         lJfeO/+wJsbj54gEblz6XYRfNcPIDFTjwzKwfrWsuyNvDo78iAKjO4fQKKG6uNXz+0Cn
         nXA+SYdGeSH3Ys32G8frzHyQ7FWyAjcW4OCgWKtgSrsMAFw5AbYgu1ycz2CBuF0ySRSp
         D/Gq+CUBGpzCWOJUtg9Ev8uYMKgHkfobru1jI7QFZ+A2iS2XQK+JNw3rOp5bNjxPtLdJ
         jveA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/fvvu9bh8tvEqGeqZJ/I5Feqev0id/QqHcJaJDVtuN7dcOeh65TpizpuG/s8w0e8GbryMTyhRUVVr@vger.kernel.org
X-Gm-Message-State: AOJu0YxdFIM10sYFpxRJ12De6brBMcFe2KtPPGwQRB7umO3rBojFBCZp
	tMURuSTU/Zk2ohWv3l5kQZQXfpr77SmKw/6+selcS5FOaJJid3kKeKa2g914EpeFBY0+p0EUART
	ux6CUHq9uRQ4JTz0S/h2mL1ribUfKxR1HDoWc5vbEKTPSt7S1GWJ84s0+5G/0upu3
X-Gm-Gg: AfdE7cldFw24tzkAO3dz/7u4Qbr/ofjT+tLHrzo/+hWM+KIB3qegT8U60wrfO+eUHQH
	Giiu8oQ36KXwGzFGiw0q/+XeKMb/0Ba9ZpIpxcQiol9E/YlIvhCMNANu50Vp71jQshf8iPB/crG
	6N6d6nopzVH5P+u0H/1YQjAddWb1060piHRkNyPFqmITKb2tGOAlXRRE1TKg6CsxWRTLjjJYc8D
	YJb3GKeUKk7S8AsrP0/UiLp5ScZMCaiwhHTIx+a0PP4D8eiEkTxsSXnhOK9QEEmFlI/PTqDuVrG
	OHJf7J/swcSFITORhmrLG9nn43aOVshHGqNYejRJJVfK1Exi1tmjCXmr7+asd1u2ViFnN7T8Vcx
	fHyWG8hh5m9NgFnAt74m4GD4ITCK8A+lLYNk=
X-Received: by 2002:a05:622a:8b:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51c4bdfe4d1mr85763601cf.5.1783330764418;
        Mon, 06 Jul 2026 02:39:24 -0700 (PDT)
X-Received: by 2002:a05:622a:8b:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51c4bdfe4d1mr85762291cf.5.1783330759458;
        Mon, 06 Jul 2026 02:39:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19daea67sm3674475a12.26.2026.07.06.02.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:39:18 -0700 (PDT)
Message-ID: <2304770d-a752-48c1-a11a-30978a834b0c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:39:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
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
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-6-6ac53de56314@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-6-6ac53de56314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX/eDLMfby2jxS
 LKs3NtC+qtUgz4q9OpCbiqlmESzGsGVkJlrD4oxL+XqHPMJJFP4FqZKPMaotrmowsEknw5qoeda
 sUC9M8IEXJwlUpHwJ07CeWNgAdQMfyI=
X-Proofpoint-GUID: NFv12fPXHW7PFApCZlXEvJClB8nT5_Xj
X-Proofpoint-ORIG-GUID: NFv12fPXHW7PFApCZlXEvJClB8nT5_Xj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX+JcMjC91rOxC
 fnAXGrjhUjf8kbokiAVy4Wl4BvOiRhbWWFtFgUc5rtXRk9nv6gqrkpPkDPEPzYn3338oni93hpM
 2xeQ9CpHjrJ0HlgS20Znn/E+r3EUjs+rSDy4ywFJL0oXG8DN9dqfUmPnEb9Omgdx/ShcRLSibtg
 4otc/Wy73vGt45G9QVylIyCe/uwc2r+quKuvlM7chDsn9DMCh5xxuhEr/cRo4xJXdQcgE+VK8NK
 vrp0F6YUPD2L5Gd8/z92sek5VZjGqckTjqAuUdw19VjaUHgX+p03FO5NwLSe4SiRr0lQb0obiSY
 vI2agwsygatlcwtG1rrnw+6mpyGIrJAJRhTY53kSN7FtM5KP+uHCvf0WiTW5D63iKk8jxq3qgWo
 FxznQeowBK8BuITkbnttSd4QHw0geD24Le2E699wdNbgVuZ8vn7Tnh77mHqZtvqnimIoo9AiSUx
 u7q2OrNIQkviNOh5AXA==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b77cd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=K30R3rYzCv3NiW1yJugA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060097

On 7/5/26 10:00 AM, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when
> it reaches high temperatures. Set up GPU cooling by throttling the GPU
> speed when reaching 105°C.
> 
> Introduce a passive polling delay to ensure more than one "passive"
> thermal point is considered when throttling the GPU thermal zones.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
