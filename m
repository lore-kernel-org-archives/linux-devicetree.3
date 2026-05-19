Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1083EE1CC
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180707; cv=none; b=TIPHLPfBXeDvl2yxcNJzEz8enMYmeHvinzpHKVV5R4dJXW7wKQ8btblabfOLH7wZJHkVZx1SlK5gdpU68r2yyYA76T77T9LCPkMKVYB/6rGC4pEcff65SajZRAtF2Lr/ttiI2VP2iRVh3GjbHMFJMDgok2Lp8kYZkbpvjm8oIrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180707; c=relaxed/simple;
	bh=GA49J4exmrjJ5Cw8xW0ziAcuryiSXaGjbrMDvlc/OY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8DKUuYett5UYY+8wbAcDwumeKQj7yTkNeKJpx0OFgeOpZAaHaBtIgrJjj4QdVjMPh228++5zGC0xi7IxYZ8Vb/Dwr7R2Tu27prCwxL5UOcqmS7xqlLbNI/lwWkIvBwjcGwg0BchtNR2EC24DlutBwC1HdRK7MomIxfdagQfUAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoJ7bkg1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LlIo1kmV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoJ7bkg1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LlIo1kmV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5aIEC867230
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ezYP126K612czxcRfGpCOxRI
	cGp9OLiayoTZvHdNYZk=; b=MoJ7bkg1kn7E1kmsA5AEINaYh1G4LZuFE09oLhOe
	jMNuvBzkxPvOe3skDA5/25OV+vAruPkynyaBaKWglIkwoz/pyPUzZI9XF9Lnmpah
	4xGngbd2xF/zHNO+Cdn5A7nSGR/TSjROT0txtfbUM1Hdd2i/LRvHPXKltcZdr0/Z
	Q7Dr7FsSsLLDYFgudwtxDzkUc29FX4BfbePO0eD0QdxOfcVZsXQFp4YownLhWvYA
	RvyXfVzrAsZZj0dcTmFecjPxlhy42lo7nhW6oLAO55//+klIvLBoYm7z1YraOYp5
	7WP2XJ5WnFzy6W+K9nDpiADlZ/Qp5EQ+/Xx7xhXmPkNnsw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1gtvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:51:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8271fb43d0so1822752a12.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180703; x=1779785503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ezYP126K612czxcRfGpCOxRIcGp9OLiayoTZvHdNYZk=;
        b=LlIo1kmVU+Q9/pTY5+KUZL14PHPEF4MkU0wUft7/3LN4E/Z5QraTg3luQZ2ipfNPdp
         jf4AWYoUYivL4tl5c2YCbxYlbBfGi4dahm5GgNa82s19pinvZXmoIb+mpbmoh8GF0Wd4
         HuBB+9NL3fpKQsDg33Zvwzdm0tAa8U97wFzgui1hwDcLoZzuX/PwzRkihCRsjaRsr85B
         gKjuioQ5uYI4110ijRfdrWyFiRhASKM0N8XmV358vjf6/25CBhAuTSE+7WUKAEfdDqWh
         P8pVYeiTxQuh3VGkquqoOKL+uYBRXxR6IkxJwO/WVUe7VDMn9EDOxRC1W/1BxSEhvZv5
         BKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180703; x=1779785503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezYP126K612czxcRfGpCOxRIcGp9OLiayoTZvHdNYZk=;
        b=L6OJn+sh3YyZiaO3mIs9mGSoJtXm68dahjtzTyS1oQu14DcOp77hLo8XyLZntqCsJK
         weXFETtCzIRIkcEvYpzqKh6p1obs+igTJz42YuxQx2K0Qci5nFD4ArhiclwvraGN8Rek
         +Epuanfh01jOacaraey5O4iU7w8jpUNJCUC/HbwPxgVpcOhu+u3LfdT3wPV4+nB5i0vx
         4Ae7lzwcyhuRwwpmKDTs7BtkuEeMkh31GkMkRpz+ioXkC6PZBjocOjgIMpRPT6kNWkkC
         OP7B3NMI4Vae8d2paynMrwC6KhOrFINiWWnnIpEKZOwwztp8f/5WUd1xsg53XfWwg7QR
         Qycg==
X-Forwarded-Encrypted: i=1; AFNElJ96So8VDzW2QC28Q9gc3NDjoSY7quGtwDI+uSjMXywaf7exf8d+FWMQ1sWhGh2s0gyinXixeMsBuX0a@vger.kernel.org
X-Gm-Message-State: AOJu0YzwULHwOCzUCdTr+4qhFnd2YMh4tFMUrMmW//l0Cy3pR5+YpI7o
	TzXL4AcXFq6lTMUA9E5/V2btbWd43UdQvIJdqAR/EAdpSN1tDs/EQnKuI1oZmIBWhQU9UvTog3e
	kMYn6tTJWtSDTc/TZh8wY2S+GBcBIyp+wbUUSHwRL/xV3UBuYzayeQdTtURiML4ZQ
X-Gm-Gg: Acq92OG1cEJTBd2ROC9MIRTgdOjkjE48wBQSItykS/y0vwHWC+/s7M/5O5kXmjSUZJ6
	gFu73V7lR7Uob6St4PILb8WVRcRoUHeo1ZQ0/EKWzLq9NVUgxewiQqCJzuIk9uyl3fNnjnYHO5B
	Wj/FxukDuiwq6UuaH5iDjc+4v3sQjeFmSbpj4bz407f6YASrbIuRUC8YmmL2HawchE9oJYy4/5v
	A4L4T4TBm4A5F5YzPBGl6nQ8n63wvtmrU2hjyGEOhqlc4O1jrY82bEGOK7bUXAprW9yCdNosj1i
	w55PoR/Hhpr90CRFmShosislLr5R5Bk5pL6fb/PN7fIX/KnjNKzYYBecRxOWNk+erqK1Id5CIAf
	qCXIeeH/aBSnccJynRJfgtSBB7Ercc1I7EiMazV3m0xTXDnSPbwPeGM79sQQ=
X-Received: by 2002:a05:6a00:3992:b0:82f:de7:d29 with SMTP id d2e1a72fcca58-83f33c60b33mr19177138b3a.31.1779180703267;
        Tue, 19 May 2026 01:51:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:3992:b0:82f:de7:d29 with SMTP id d2e1a72fcca58-83f33c60b33mr19177119b3a.31.1779180702650;
        Tue, 19 May 2026 01:51:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b71fsm16021123b3a.29.2026.05.19.01.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:51:42 -0700 (PDT)
Date: Tue, 19 May 2026 14:21:36 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop unused remoteproc_adsp_glink label
Message-ID: <20260519085136.saub3m6tnnnvhxcr@hu-mojha-hyd.qualcomm.com>
References: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409181329.556899-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NyBTYWx0ZWRfX1bVBK+vwScu7
 MAdclFwcIzUwvjyh7JfZ7tJc8jFqom/1uc6WN9SJgILArt+y5HoiMnBta26pCj0alSocA9YlFU7
 zyXQdc3KT7Uf1UKHhMfO/wMwX6MagWxpokHmpEoEgbkeiULJrsubeueu5KT7uMJ5em8Hcps23i+
 IdWx321E6xpSeCHl4Hfwagwwn509BMBD6iKRYNn5FZCpxNJEh60x14nt9LO3a8yZhV0ATqV/zrt
 yOXRErxzYSvLa0hR0lLtv20AyhQLsOxO2QBOcl+UZWvqewmesl8P2Qrepj9r2xXkMt4BMFmHjAe
 Y1zB5zYgdnNfLwV0hVcZ9OV3AlF01mmilB/l85lTodIQu/fcH4aOGznZ7CFCSzrAc7DAegCVs7u
 4BDeCa8K8lhHFD82vMGi3LX8um4NVDV4HcpwXYFYv4nrh+kYxWHWAwTUlv7WRZSE30Gdul7mGVZ
 yVWLTa+rK+pnFykWjhg==
X-Proofpoint-GUID: inBWhfNuK8Qz58eDLqikAKP44dHLwkZ-
X-Proofpoint-ORIG-GUID: inBWhfNuK8Qz58eDLqikAKP44dHLwkZ-
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c24a0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dLF_TAHiO-yvSCDL95MA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190087

On Thu, Apr 09, 2026 at 11:43:29PM +0530, Mukesh Ojha wrote:
> The remoteproc_adsp_glink label on the ADSP glink-edge node has no
> users in the upstream tree across all affected SoCs. The only user
> of this label is qcs6490-audioreach.dtsi which references the label
> defined in its own SoC dtsi and is left untouched.
> 
> Remove the label from kaanapali, kodiak, lemans, monaco,
> sar2130p, sc8180x, sc8280xp, sm8450, sm8550, sm8650 and sm8750.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Floating this up for pick up..

-- 
-Mukesh Ojha
